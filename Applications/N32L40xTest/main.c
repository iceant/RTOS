#include "main.h"
#include "board.h"
#include "OLED.h"
#include "dev_i2c1.h"
#include "dev_i2c2.h"
#include "dev_usart2.h"
#include "ESP01S.h"
#include <stdio.h>
#include <stdlib.h>
#include <n32l40x.h>
#include <os_kernel.h>
#include <string.h>
#include <os_spinlock.h>
#include <os_mutex.h>
#include <bmp.h>
#include <DS1307.h>
#include <sdk_ap.h>
#include <sdk_mp.h>
////////////////////////////////////////////////////////////////////////////////
////

void delay(unsigned long ms){
    while(ms--){
    }
}
////////////////////////////////////////////////////////////////////////////////
////
#define HW32_REG(ADDRESS) (*((volatile unsigned long *)(ADDRESS)))
#define SVC(code) __asm__ __volatile__("svc %0"::"I"(code):"memory")
#define OS_Start() __asm volatile ("svc #0x00" : : : "memory")


////////////////////////////////////////////////////////////////////////////////
////
#define STACK_SIZE 1024

__ALIGNED(4) static uint8_t stack1[STACK_SIZE];
__ALIGNED(4) static uint8_t stack2[STACK_SIZE];
__ALIGNED(4) static uint8_t stack3[STACK_SIZE];
__ALIGNED(4) static uint8_t stack4[STACK_SIZE];
__ALIGNED(4) static uint8_t sem_thread_stack[STACK_SIZE];
__ALIGNED(4) static uint8_t lock1_thread_stack[STACK_SIZE];
__ALIGNED(4) static uint8_t lock2_thread_stack[STACK_SIZE];
__ALIGNED(4) static uint8_t lock3_thread_stack[STACK_SIZE];

static os_thread_t thread1;
static os_thread_t thread2;
static os_thread_t thread3;
static os_thread_t thread4;
static os_thread_t sem_thread;
static os_thread_t lock1_thread;
static os_thread_t lock2_thread;
static os_thread_t lock3_thread;


#define USART1_RX_BUFFER_SZ 256
static uint8_t USART1_RxBuffer[USART1_RX_BUFFER_SZ];
static os_size_t USART1_RxIdx=0;

static os_mutex_t debug_mutex;

////////////////////////////////////////////////////////////////////////////////
////

static int __put(int ch, void* cl)
{
    USART_SendData(USART1, (uint8_t)ch);
    while (USART_GetFlagStatus(USART1, USART_FLAG_TXDE) == RESET)
        ;
    
    return (ch);
}

#define __debug(...) do{os_mutex_lock(&debug_mutex); printf(__VA_ARGS__);os_mutex_unlock(&debug_mutex);}while(0)
//#define __debug(...) printf(__VA_ARGS__)

static void thread_entry(void* p){
    int timeout = (int)p;
    int ch = ' ';
    int x = 0;
    int y = 0;
//    OLED_DrawBMP(0, 0, 127, 8, MENU);
    char buf[32]={0};
    int count = 0;
    struct tm datetime;

    
    printf("Connect to WIFI...\n");
    ESP01S_ConnectWifi("PIZER_WLS", "1234567890", 5000);
    printf("AcquireIP...\n");
    ESP01S_AcquireIP(5000);
    printf("NTP CONFIG...\n");
    ESP01S_NTPCfg(8, 5000);
    sdk_fmt_register('A', sdk_ap_fmt);
    sdk_fmt_register('D', sdk_mp_fmt);
    sdk_mp_set(1024);
    while(1){
        sdk_mp_t mp_x;
        sdk_mp_t mp_y;
        sdk_mp_t mp_z;
        sdk_mp_t mp_m;
        sdk_mp_new(123000000, &mp_x);
        sdk_mp_new(6250, &mp_y);
        sdk_mp_new(0, &mp_z);
        
        sdk_mp_div(mp_z, mp_x, mp_y, 0);
        sdk_fmt_print("SDK_AP: %D/%D=%D\n", mp_x, 10, mp_y, 10, mp_z, 10);
        sdk_mp_free(&mp_x);
        sdk_mp_free(&mp_y);
        sdk_mp_free(&mp_z);
        
        if((count++ % 100)==0){
            printf("NTP Datetime!\n");
            datetime.tm_year = 0;
            if(ESP01S_NTPTime(&datetime, 5000)==kESP01S_Result_OK){
                if((datetime.tm_year+1900)>2000){
                    DS1307_SetYear(datetime.tm_year+1900);
                    DS1307_SetMonth(datetime.tm_mon+1);
                    DS1307_SetDate(datetime.tm_mday);
                    DS1307_SetDayOfWeek(datetime.tm_wday);
                    DS1307_SetHour(datetime.tm_hour);
                    DS1307_SetMinute(datetime.tm_min);
                    DS1307_SetSecond(datetime.tm_sec);
                }
            }
        }


        __debug("Thread %s 0x%08x timeout(ms): %d\n",os_thread_self()->name, os_thread_self(), timeout);
        int size = snprintf(buf, sizeof(buf), "%04d-%02d-%02d %02d:%02d:%02d(W%d)"
               , DS1307_GetYear()
               , DS1307_GetMonth()
               , DS1307_GetDate()
               , DS1307_GetHour()
               , DS1307_GetMinute()
               , DS1307_GetSecond()
               , DS1307_GetDayOfWeek()
               );
        printf("%s\n", buf);
        
        
        
        os_thread_mdelay(200);
    }
}

#define OLED_DRAW_THREAD_STACK_SIZE 1024
__ALIGNED(OS_ALIGN_SIZE)
static uint8_t oled_draw_thread_stack[OLED_DRAW_THREAD_STACK_SIZE];
static os_thread_t oled_draw_thread;

static void oled_show_datetime(void){
    char buf[32]={0};
    snprintf(buf, sizeof(buf), "%04d-%02d-%02d %02d:%02d:%02d"
             ,DS1307_GetYear()
             ,DS1307_GetMonth()
             ,DS1307_GetDate()
             ,DS1307_GetHour()
             ,DS1307_GetMinute()
             ,DS1307_GetSecond()
             );
    OLED_ShowString(0, 0, buf, 12);
}

static void oled_draw_thread_entry(void*p){
    int sleepMs = 1000;
    int x = 0;
    int y = 1;
    int x2 = 118;
    int y2 = 8;
    
    
    while(1){
        
        OLED_Display_Off();
//        OLED_Clear();
        oled_show_datetime();
        OLED_DrawBMP(x, y, x2, y2, IMG1);
        OLED_Display_On();
        os_thread_mdelay(sleepMs);

        OLED_Display_Off();
//        OLED_Clear();
        oled_show_datetime();
        OLED_DrawBMP(x, y, x2, y2, IMG2);
        OLED_Display_On();
        os_thread_mdelay(sleepMs);

        OLED_Display_Off();
//        OLED_Clear();
        oled_show_datetime();
        OLED_DrawBMP(x, y, x2, y2, IMG3);
        OLED_Display_On();
        os_thread_mdelay(sleepMs);

        OLED_Display_Off();
//        OLED_Clear();
        oled_show_datetime();
        OLED_DrawBMP(x, y, x2, y2, IMG4);
        OLED_Display_On();
        os_thread_mdelay(sleepMs);

        OLED_Display_Off();
//        OLED_Clear();
        oled_show_datetime();
        OLED_DrawBMP(x, y, x2, y2, IMG5);
        OLED_Display_On();
        os_thread_mdelay(sleepMs);
    }
}

static os_sem_t rx_sem;
static os_spinlock_t lock;

static void lock_thread_entry(void* p){
    while(1){
        os_spinlock_lock(&lock);
        __debug("spin 0x%08x locked! >>>\n", os_thread_self());
        os_thread_mdelay(1000);
        os_spinlock_unlock(&lock);
        __debug("spin 0x%08x unlocked! <<<\n", os_thread_self());
        os_thread_mdelay(1000);
    }
}

os_err_t os_kernel_cpu_config(void)
{
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
    SysTick_Config(SystemCoreClock/CPU_TICKS_PER_SECOND); /* 1ms = tick */
    return OS_EOK;
}

static void idle_hook(void* p){
//    printf("idle\n");
}

static dev_usart_recv_result USART1_RxHandler(sdk_ringbuffer_t * buffer){
    int find = sdk_ringbuffer_find_str(buffer, 0, "\r\n");
    if(find!=-1){
        int used = sdk_ringbuffer_used(buffer);
        OLED_ShowString(1, 1, (char*)buffer->buffer, 6);
        __debug("thread: %p, buffer_size=%d\n", (void*)os_thread_self(), used);
        __debug("%s\n", buffer->buffer);
        return kDevUSARTRecvResult_DONE;
    }
    return kDevUSARTRecvResult_CONTINUE;
}

////////////////////////////////////////////////////////////////////////////////
////
int main(void){
    board_init();

    os_mutex_init(&debug_mutex, "DBG", OS_QUEUE_PRIO);
    os_kernel_init(NULL, os_kernel_cpu_config);

    dev_USART1.recv = USART1_RxHandler;
    dev_USART1.startup();
    dev_USART2.startup();
    DS1307_Init(&dev_I2C2);
    ESP01S_Init(&dev_USART2);
    
    os_idle_set_hook(idle_hook, 0);
    
    os_thread_init(&thread1, "Thread1", thread_entry, (void*)100, stack1, STACK_SIZE, 20, 5);
    os_thread_startup(&thread1);
//
//    os_thread_init(&thread2, "Thread2", thread_entry, (void*)50, stack2, STACK_SIZE, 20, 5);
//    os_thread_startup(&thread2);

//    os_thread_init(&thread3, "Thread3", thread_entry, (void*)3000, stack3, STACK_SIZE, 10, 10);
//    os_thread_startup(&thread3);
//
//    os_thread_init(&thread4, "Thread4", thread_entry, (void*)1000, stack4, STACK_SIZE, 15, 5);
//    os_thread_startup(&thread4);

    os_sem_init(&rx_sem, "rx_sem", 0, OS_QUEUE_FIFO);

//    os_spinlock_init(&lock);

//    os_thread_init(&lock1_thread, "lock1_thd", lock_thread_entry, 0, lock1_thread_stack, sizeof(lock1_thread_stack), 20, 10);
//    os_thread_startup(&lock1_thread);
//
//    os_thread_init(&lock2_thread, "lock2_thd", lock_thread_entry, 0, lock2_thread_stack, sizeof(lock2_thread_stack), 20, 10);
//    os_thread_startup(&lock2_thread);
//
//    os_thread_init(&lock3_thread, "lock3_thd", lock_thread_entry, 0, lock3_thread_stack, sizeof(lock3_thread_stack), 20, 10);
//    os_thread_startup(&lock3_thread);

    os_thread_init(&oled_draw_thread, "oled_draw_thd", oled_draw_thread_entry, 0, oled_draw_thread_stack, sizeof(oled_draw_thread_stack), 20, 10);
    os_thread_startup(&oled_draw_thread);

    os_kernel_startup();
    
    while(1){
        printf("Main Running...\n");
        delay(0x3fffff);
    }
}


