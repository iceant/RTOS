#include <main.h>
#include <board.h>
#include <os_kernel.h>
#include <sdk_hex.h>
#include <test_two_yield_thread.h>
#include <nvic_show_priority.h>
//#include <thread_sleep.h>
//#include <test_mutex.h>
#include <single_thread.h>
#include <sdk_fmt.h>
#include <printf.h>
#include <use_pulse.h>
#include <cpu_kernel_functions.h>
////////////////////////////////////////////////////////////////////////////////
////
#if 1
C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t boot_thread_stack[1024];
static os_thread_t boot_thread;

static void boot_thread_entry(void* p){
    uint32_t nCount = 0;
    while(1){
        printf("nCount:%u\n", nCount++);
        USE_Pulse_Trigger();
//        os_thread_mdelay(1000);
    }
}

static size_t idle_count;
static void idle_action(void* ud){
    printf("idle... %u\n", idle_count++);
}

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t exit_thread_stack[1024];
static os_thread_t exit_thread;
static void exit_thread_entry(void* p){
    printf("[exit_thread] exit!\n");
}

static void exit_thread_on_exit(os_thread_t * thread){
    printf("Thread [%s] exit at %u!\n", thread->name, os_tick_get());
}
#endif



static uint8_t USART0_RxBuffer[512];
static os_size_t USART0_RxBuffer_WriteIdx = 0;

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t USART0_ThreadStack[1024];
static os_thread_t USART0_Thread;
static os_sem_t USART0_RxSem;

static void USART0_RxHandler(uint16_t data, void* ud){
    USART0_RxBuffer[USART0_RxBuffer_WriteIdx++] = data;
    if(USART0_RxBuffer_WriteIdx == OS_ARRAY_SIZE(USART0_RxBuffer)){
        USART0_RxBuffer_WriteIdx = 0;
    }

    os_sem_release(&USART0_RxSem);
}

static void USART0_RxDoneHandler(uint16_t remain_size, void* ud){
    USART0_RxBuffer_WriteIdx = OS_ARRAY_SIZE(USART0_RxBuffer) - remain_size ;
    BSP_USART0_DMARxSetNumber(OS_ARRAY_SIZE(USART0_RxBuffer));
    os_sem_release(&USART0_RxSem);
}

static void USART0_ThreadEntry(void* p){
    os_sem_init(&USART0_RxSem, "USART0_RxSem", 0, OS_SEM_FLAG_FIFO);
//    BSP_USART0_SetRxHandler(USART0_RxHandler, 0);
    BSP_USART0_SetOnRxDone(USART0_RxDoneHandler, 0);
    USART0_RxBuffer_WriteIdx = 0;
    BSP_USART0_DMARx(USART0_RxBuffer, OS_ARRAY_SIZE(USART0_RxBuffer));
    while(1){
//        while(USART0_RxBuffer_WriteIdx==0){
            os_sem_take(&USART0_RxSem, OS_WAITING_INFINITY);
//        }
        if(USART0_RxBuffer[USART0_RxBuffer_WriteIdx-2]=='\r' && USART0_RxBuffer[USART0_RxBuffer_WriteIdx-1]=='\n'){
            sdk_hex_dump("USART0_RxBuffer", USART0_RxBuffer, USART0_RxBuffer_WriteIdx,(sdk_hex_printf)printf);
            memset(USART0_RxBuffer, 0, USART0_RxBuffer_WriteIdx);
            USART0_RxBuffer_WriteIdx = 0;
        }
    }
}


////////////////////////////////////////////////////////////////////////////////
////

int main(void){
    
    Board_Init();
    printf("Board Init Done!\n");
    USE_Pulse_Init();
    
    os_kernel_init();
    
    nvic_show_priority();
    
    os_printf_init();
    
//    os_thread_init(&exit_thread, "exit_thd"
//                   , exit_thread_entry, 0
//                   , exit_thread_stack, OS_ARRAY_SIZE(exit_thread_stack)
//                   , OS_THREAD_LIMIT(exit_thread_stack, OS_ARRAY_SIZE(exit_thread_stack))
//                   , 10, 20
//                   , exit_thread_on_exit
//                   , 0
//                   );
//    exit_thread.exit_function = exit_thread_on_exit;
//    os_thread_startup(&exit_thread);
//
//
    OS_THREAD_INIT(&boot_thread, "Boot", boot_thread_entry, 0, boot_thread_stack, OS_ARRAY_SIZE(boot_thread_stack), 20, 10);
    os_thread_startup(&boot_thread);

    single_thread_startup();

    TestTwoYieldThread();

    os_sem_init(&USART0_RxSem, "USART0_RxSem", 0, OS_SEM_FLAG_FIFO);
    OS_THREAD_INIT(&USART0_Thread, "USART0_RxThd", USART0_ThreadEntry, 0, USART0_ThreadStack, OS_ARRAY_SIZE(USART0_ThreadStack), 10, 10);
    os_thread_startup(&USART0_Thread);

    os_kernel_startup();
    
    int nCount = 0;
    while(1){
        printf("nCount:%d\n", nCount++);
        USE_Pulse_Trigger();
    }
    return 0;
}
