#include <main.h>
#include <board.h>
#include <stdio.h>
#include <os_kernel.h>
#include <sdk_hex.h>
#include <test_two_yield_thread.h>
#include <nvic_show_priority.h>
#include <thread_sleep.h>
////////////////////////////////////////////////////////////////////////////////
////

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t boot_thread_stack[1024];
static os_thread_t boot_thread;

static void boot_thread_entry(void* p){
    uint32_t nCount = 0;
    while(1){
        printf("nCount:%u\n", nCount++);
        os_thread_mdelay(1000);
    }
}

static size_t idle_count;
static void idle_action(void* ud){
    printf("idle... %u\n", idle_count++);
}

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
//    if(USART0_RxBuffer[USART0_RxBuffer_WriteIdx-2]=='\r' && USART0_RxBuffer[USART0_RxBuffer_WriteIdx-1]=='\n') {
//        os_sem_release(&USART0_RxSem);
//    }
    os_sem_release(&USART0_RxSem);
}

static void USART0_ThreadEntry(void* p){
    while(1){
        while(USART0_RxBuffer_WriteIdx==0){
            os_sem_take(&USART0_RxSem, OS_WAITING_INFINITY);
        }
        if(USART0_RxBuffer[USART0_RxBuffer_WriteIdx-2]=='\r' && USART0_RxBuffer[USART0_RxBuffer_WriteIdx-1]=='\n'){
            sdk_hex_dump("USART0_RxBuffer", USART0_RxBuffer, USART0_RxBuffer_WriteIdx,(sdk_hex_printf)printf);
            memset(USART0_RxBuffer, 0, USART0_RxBuffer_WriteIdx);
            USART0_RxBuffer_WriteIdx = 0;
        }
    }
}

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t exit_thread_stack[1024];
static os_thread_t exit_thread;
static void exit_thread_entry(void* p){
    printf("[exit_thread] exit!\n");
}

static void exit_thread_on_exit(os_thread_t * thread){
    volatile os_tick_t tick = *(volatile os_tick_t*)thread->userdata;
    printf("Thread [%s] exit at %u!\n", thread->name, tick);
}
////////////////////////////////////////////////////////////////////////////////
////

int main(void){
    
    Board_Init();
    printf("Board Init Done!\n");
    
    nvic_show_priority();
    
    os_kernel_init();
    
    thread_sleep_test();
    
//    TestTwoYieldThread();
    
    os_kernel_startup();
    
    while(1);
    return 0;
}
