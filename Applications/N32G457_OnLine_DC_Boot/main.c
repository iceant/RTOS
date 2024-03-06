#include "main.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <os_kernel.h>
#include <sdk_ringbuffer.h>

#include "dev_usart1.h"
#include <sdk_ap.h>
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
static os_thread_t thread1;
static os_thread_t thread2;
static os_mutex_t debug_mutex;
////////////////////////////////////////////////////////////////////////////////
////

static long range(int min, int max){
    return rand()%max + min;
}


//static int __put(int ch, void* cl)
//{
//    USART_SendData(USART1, (uint8_t)ch);
//    while (USART_GetFlagStatus(USART1, USART_FLAG_TXDE) == RESET)
//        ;
//
//    return (ch);
//}

//#define __debug(...) do{os_mutex_lock(&debug_mutex); printf(__VA_ARGS__);os_mutex_unlock(&debug_mutex);}while(0)
#define __debug(...) printf(__VA_ARGS__)

static void thread_entry(void* p){
    int timeout = (int)p;
    int count = 0;

    sdk_fmt_register('A', sdk_ap_fmt);
    sdk_ap_t eng = sdk_ap_new(0);
    sdk_ap_t eng_kws = sdk_ap_new(0);
    /*
     VOL = Vi * 10^-3 V
     CUR = Ai * 10^-4 A
     PWR = (Vi * Ai )(10^-7) WS
     ACC_ENG = ACC_ENG + PWR
     ENG = ACC_ENG/(3600s * 1000) = ACC_ENG * 277778 * (10^-12)
     */
    while(1){


        sdk_ap_t vol = sdk_ap_new(range(0, 1000000));  /* 1000 */
        sdk_fmt_print("VOL:%A\n", vol);

        sdk_ap_t cur = sdk_ap_new(range(0, 10000000)); /* 10000 */
        sdk_fmt_print("CUR:%A\n", cur);

        sdk_ap_t pwr = sdk_ap_mul(vol, cur);
        sdk_fmt_print("PWR:%A\n", pwr);

        sdk_ap_t eng_add = sdk_ap_add(pwr, eng);
        sdk_fmt_print("ACC_ENG:%A\n", eng_add);
        sdk_ap_free(&eng);
        eng = eng_add;

        if(count++==10){
            count = 0;
            sdk_ap_t eng_tmp = sdk_ap_muli(eng, 277778);
            sdk_fmt_print("ENG:%A\n", eng_tmp);
            sdk_ap_free(&eng_tmp);
        }

        sdk_fmt_print("sdk_ap_t size: %d\n", sdk_ap_object_size());

//        sdk_ap_t eng_add = sdk_ap_add(eng, pwr);
//        sdk_fmt_print("ENG:%A\n", eng_add);
//        sdk_ap_free(&eng);
//        eng = eng_add;


//        printf("Thread: 0x%08x, Count:%d, Timeout:%d\n", os_thread_self(), count++, timeout);
//        sdk_fmt_print("VOL:%A\n", vol);
//        sdk_fmt_print("CUR:%A\n", cur);
//        sdk_fmt_print("PWR:%A\n", pwr);
        sdk_ap_free(&pwr);
        sdk_ap_free(&vol);
        sdk_ap_free(&cur);

        os_thread_mdelay(1000);
    }

    sdk_ap_free(&eng);
}



static HW_USART_RecvResult USART1__Recv(sdk_ringbuffer_t *buffer)
{
    if(sdk_ringbuffer_find_str(buffer, 0, "\r\n")!=-1)
    {
        __debug("%s\n", buffer->buffer);
        return kHW_USART_RecvResult_DONE;
    }
    return kHW_USART_RecvResult_CONTINUE;
}



static os_err_t os_native_config(void)
{
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
    SysTick_Config(SystemCoreClock/CPU_TICKS_PER_SECOND); /* 1ms = tick */

    dev_USART1.recv=USART1__Recv;
    dev_USART1.startup();

    return OS_EOK;
}

////////////////////////////////////////////////////////////////////////////////
////
int main(void){
    board_init();
    os_kernel_init(0, os_native_config);

    printf("Kernel Init...\n");

    os_mutex_init(&debug_mutex, "DBG", OS_QUEUE_PRIO);


    os_thread_init(&thread1, "Thread1", thread_entry, (void*)500, stack1, STACK_SIZE, 20, 5);
    os_thread_startup(&thread1);

//    os_thread_init(&thread2, "Thread2", thread_entry, (void*)1000, stack2, STACK_SIZE, 20, 5);
//    os_thread_startup(&thread2);

    os_kernel_startup();
    
    while(1){
        printf("Main Running...\n");
        delay(0x3fffff);
    }
}


