#include <use_usart0.h>
#include <sdk_ringbuffer.h>
#include <os_kernel.h>
#include <sdk_hex.h>
#include "bsp_usart0.h"
#include "global.h"
#include <bsp_tim2.h>
#include <use_pulse.h>

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
    int find = 0;
    while(1){
        while((used= sdk_ringbuffer_used(&USART0_RxBuffer))==0){
            os_semaphore_take(&USART0_RxSem, OS_WAIT_INFINITY);
        }

        if(sdk_ringbuffer_find_str(&USART0_RxBuffer, 0, "pulse.enable")!=-1){
            if(!use_pulse_is_enable()){
                BSP_TIM2_Init();
            }
            use_pulse_enable();
        }

        if(sdk_ringbuffer_find_str(&USART0_RxBuffer, 0, "pulse.disable")!=-1){
            if(use_pulse_is_enable()){
                BSP_TIM2_DeInit();
            }
            use_pulse_enable();
        }

        if((find=sdk_ringbuffer_find_str(&USART0_RxBuffer, 0, "pulse.hz="))!=-1){
            global_get()->pulse_hz = sdk_ringbuffer_strtoul(&USART0_RxBuffer, find + 9, 0, 10);
            printf("pulse.hz=%u\n", global_get()->pulse_hz);
        }

        if((find=sdk_ringbuffer_find_str(&USART0_RxBuffer, 0, "pulse.ticks="))!=-1){
            global_get()->pulse_tick = sdk_ringbuffer_strtoul(&USART0_RxBuffer, find + 12, 0, 10);
            printf("pulse.ticks=%u\n", global_get()->pulse_tick);
        }

        if((find=sdk_ringbuffer_find_str(&USART0_RxBuffer, 0, "global.show"))!=-1){
            global_show();
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

////////////////////////////////////////////////////////////////////////////////
////



void USE_USART0_Init(void){
    sdk_ringbuffer_init(&USART0_RxBuffer, USART0_RxBlock, sizeof(USART0_RxBlock));
    os_sem_init(&USART0_RxSem, "USART0_RxSem", 0, OS_QUEUE_FIFO);
    os_thread_init(&USART0_RxThread, "USART0_RxThd", USART0_RxThread_Entry, 0
            , USART0_RxThread_Stack, sizeof(USART0_RxThread_Stack)
            , 20
            , 10);
    os_thread_startup(&USART0_RxThread);
}