#include <use_usart0.h>
#include "board.h"
#include "global.h"
#include <os_kernel.h>
#include <sdk_ringbuffer.h>
#include <sdk_hex.h>

////////////////////////////////////////////////////////////////////////////////
////
#if defined(ENABLE_USART0)

#define USART0_THREAD_STACK_SIZE 1024

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USART0_RxThread_Stack[USART0_THREAD_STACK_SIZE];
static os_thread_t USART0_RxThread;
static uint8_t USART0_RxBlock[256];
static sdk_ringbuffer_t USART0_RxBuffer;
static os_sem_t USART0_RxSem;

static void USART0__RxHandler(uint16_t ch, void* userdata){
    sdk_ringbuffer_put(&USART0_RxBuffer, ch & 0xff);
    os_sem_release(&USART0_RxSem);
}


static void USART0_RxThread_Entry(void* p)
{
    os_printf("[USE_USART0] OK\n");
    BSP_USART0_SetRxHandler(USART0__RxHandler, 0);
    int used = 0;
    while(1){
        while((used= sdk_ringbuffer_used(&USART0_RxBuffer))==0){
            os_semaphore_take(&USART0_RxSem, OS_WAIT_INFINITY);
        }

        if(sdk_ringbuffer_find_str(&USART0_RxBuffer, 0, "net_reboot")!=-1){
            printf("[USE_USART0] A7670C Before Reset Power Status:%d\n", A7670C_IsPowerOn());
            A7670C_Reset();
            printf("[USE_USART0] A7670C After Reset Power Status:%d\n", A7670C_IsPowerOn());
        }else
        if(sdk_ringbuffer_find_str(&USART0_RxBuffer, 0, "reboot")!=-1){
            cpu_reboot();
        }else if(sdk_ringbuffer_find_str(&USART0_RxBuffer, 0, "lock_enable")!=-1){
            BSP_Lock_Enable();
            printf("[USE_USART0] Lock State:%d\n", BSP_Lock_State());
        }else if(sdk_ringbuffer_find_str(&USART0_RxBuffer, 0, "lock_disable")!=-1){
            BSP_Lock_Disable();
            printf("[USE_USART0] Lock State:%d\n", BSP_Lock_State());
        }

        if(sdk_ringbuffer_find_str(&USART0_RxBuffer, 0, "\n")!=-1){
//            printf("[USART0] %s\n", USART0_RxBuffer.buffer, sdk_ringbuffer_used(&USART0_RxBuffer));
            sdk_hex_dump("USART0", USART0_RxBuffer.buffer,  sdk_ringbuffer_used(&USART0_RxBuffer));
            sdk_ringbuffer_reset(&USART0_RxBuffer);
        }

        if(sdk_ringbuffer_is_full(&USART0_RxBuffer)){
            sdk_ringbuffer_reset(&USART0_RxBuffer);
        }
    }
}

void USE_USART0_Init(void){
    sdk_ringbuffer_init(&USART0_RxBuffer, USART0_RxBlock, sizeof(USART0_RxBlock));
    os_sem_init(&USART0_RxSem, "USART0_RxSem", 0, OS_QUEUE_FIFO);
    os_thread_init(&USART0_RxThread, "USART0_RxThd", USART0_RxThread_Entry, 0
                   , USART0_RxThread_Stack, sizeof(USART0_RxThread_Stack)
                   , 10
                   , GLOBAL_DEFAULT_THREAD_TTICKS);
    os_thread_startup(&USART0_RxThread);
    
}


sdk_ringbuffer_t * USE_USART0_GetRxBuffer(void){
    return &USART0_RxBuffer;
}

#else
void void USE_USART0_Init(void){}

#endif
