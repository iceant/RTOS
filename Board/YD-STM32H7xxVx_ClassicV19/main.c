#include <main.h>
#include <os_kernel.h>
#include <stdio.h>
#include <cpu.h>
#include "use_usart1.h"
////////////////////////////////////////////////////////////////////////////////
////
C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t worker1_thread_stack[2048];
static os_thread_t worker1;

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t worker2_thread_stack[2048];
static os_thread_t worker2;


static void worker_thread_entry(void* p){
//    os_printf("Worker[%s] ... \r\n", os_thread_self()->name);
    int id = (int)p;
    os_size_t nCount = 0;
    while(1){
        nCount++;
        if(nCount==100000){
            nCount = 0;
            switch(id){
                case 1:{
                    LED_YELLOW_Toggle();
                    break;
                }
                case 2:{
                    LED_BLUE_Toggle();
                    break;
                }
                default:
                    break;
            }
        }
        
//        os_printf("[%s] %ld remain:%ld, tick:%ld, sp=%p\r\n", os_thread_self()->name, nCount++, os_thread_self()->remain_ticks, os_scheduler_get_current_tick(), os_thread_self()->sp);
//        os_thread_mdelay(id * 1000);
        os_thread_yield();
    }
}


////////////////////////////////////////////////////////////////////////////////
////
C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t BootThreadStack[1024];
static os_thread_t BootThread;
static void BootThreadEntry(void* p){
    os_thread_init(&worker1, "worker1", worker_thread_entry, (void*)1
            , worker1_thread_stack, sizeof(worker1_thread_stack)
            ,20,50);
    os_thread_startup(&worker1);
    os_printf("worker1 ready! \r\n");

    os_thread_init(&worker2, "worker2", worker_thread_entry, (void*)2
            , worker2_thread_stack, sizeof(worker2_thread_stack)
            ,20, 100);
    os_thread_startup(&worker2);
    os_printf("worker2 ready! \r\n");
    
    int nCount = 0;
    while(1){
        os_printf("[Boot] count=%d tick:%"OS_PRIu"\r\n", nCount++, os_scheduler_get_current_tick());
//        LED_YELLOW_Toggle();
//        for(int i=0; i<0x3ffffff; i++){
//
//        }
        os_thread_mdelay(1000);
    }
}

////////////////////////////////////////////////////////////////////////////////
////

static void idle_task(void* data){
    os_printf("idle\n");
    for(int i=0; i<0x3fffff; i++);
}

////////////////////////////////////////////////////////////////////////////////
////


int main(void){
    Board_Init();

    os_printf("SystemCoreClock: %"OS_PRId"\r\n", SystemCoreClock);
    os_printf("HAL_RCC_GetPCLK1Freq: %"OS_PRId"\r\n", HAL_RCC_GetPCLK1Freq());
    USE_USART1_Init();
//    os_idle_set_handler(idle_task, 0);

//    os_kernel_init();
    BSP_USART1_DMATxString("os_kernel_init done!\r\n");
    
    #if 1
    os_thread_init(&BootThread, "Boot", BootThreadEntry, 0, BootThreadStack, sizeof(BootThreadStack), 20,
                   os_tick_from_millisecond(500));
    os_thread_startup(&BootThread);
    
    os_kernel_startup();
    #endif

    
    int nCount = 0;
//    char buf[128]={0};
    while(1){
//        int sz = snos_printf(buf, sizeof(buf), "Hello, %d\r\n", nCount++);
//        buf[sz] = '\0';
//        os_printf("Hello, %d\r\n", nCount++);
        BSP_USART1_DMATx("Hello\n", 6);
        BSP_TIMDelay_Ms(1000);
//        if(nCount==10){
//            cpu_reboot();
//        }
    }
    
}