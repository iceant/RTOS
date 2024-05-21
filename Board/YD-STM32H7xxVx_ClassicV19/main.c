#include <main.h>
#include <os_kernel.h>
#include <stdio.h>
#include <cpu.h>
////////////////////////////////////////////////////////////////////////////////
////
C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t worker1_thread_stack[2048];
static os_thread_t worker1;

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t worker2_thread_stack[2048];
static os_thread_t worker2;


static void worker_thread_entry(void* p){
    printf("Worker[%s] ... \r\n", os_thread_self()->name);
    int id = (int)p;
    os_size_t nCount = 0;
    while(1){
        switch(id){
            case 1:{
                LED_GREEN_Toggle();
                break;
            }
            case 2:{
                LED_BLUE_Toggle();
                break;
            }
            default:
                break;
        }
        printf("[%s] %ld remain:%ld, tick:%ld\r\n", os_thread_self()->name, nCount++, os_thread_self()->remain_ticks, os_scheduler_get_current_tick());

        os_thread_yield();
//        os_thread_mdelay(id * 1000);
    }
}


////////////////////////////////////////////////////////////////////////////////
////
C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t BootThreadStack[1024];
static os_thread_t BootThread;
static void BootThreadEntry(void* p){
    os_thread_init(&worker1, "worker1", worker_thread_entry, 1
            , worker1_thread_stack, sizeof(worker1_thread_stack)
            ,20,5);
    os_thread_startup(&worker1);
    printf("worker1 ready! \r\n");

    os_thread_init(&worker2, "worker2", worker_thread_entry, 2
            , worker2_thread_stack, sizeof(worker2_thread_stack)
            ,20, 10);
    os_thread_startup(&worker2);
    printf("worker2 ready! \r\n");
    
    int nCount = 0;
    while(1){
        printf("[Boot] count=%d tick:%"OS_PRIu"\r\n", nCount++, os_scheduler_get_current_tick());
        LED_YELLOW_Toggle();
//        for(int i=0; i<0x3ffffff; i++){
//
//        }
        os_thread_mdelay(1000);
    }
}

////////////////////////////////////////////////////////////////////////////////
////

static void idle_task(void* data){
    printf("idle\n");
    for(int i=0; i<0x3fffff; i++);
}


int main(void){
    Board_Init();
    printf("SystemCoreClock: %d\r\n", SystemCoreClock);
    printf("HAL_RCC_GetPCLK1Freq: %d\r\n", HAL_RCC_GetPCLK1Freq());
    
//    os_idle_set_handler(idle_task, 0);

//    os_kernel_init();
//    BSP_USART1_DMATxString("os_kernel_init done!\r\n");
    
    #if 1
    os_thread_init(&BootThread, "Boot", BootThreadEntry, 0, BootThreadStack, sizeof(BootThreadStack), 20,
                   os_tick_from_millisecond(500));
    os_thread_startup(&BootThread);
    
    os_err_t err = os_kernel_startup();
    printf("kernel startup: %d\r\n", err);
    #endif
    
    int nCount = 0;
//    char buf[128]={0};
    while(1){
//        int sz = snprintf(buf, sizeof(buf), "Hello, %d\r\n", nCount++);
//        buf[sz] = '\0';
        printf("Hello, %d\r\n", nCount++);
        BSP_TIMDelay_Ms(1000);
        if(nCount==10){
            cpu_reboot();
        }
    }
    
}