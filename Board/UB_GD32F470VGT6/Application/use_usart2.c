#include <use_usart2.h>
#include <os_kernel.h>
#include <sdk_hex.h>
#include <sdk_ringbuffer.h>
#include <sdk_crc16.h>
#include <mcu_session.h>
#include "global.h"
////////////////////////////////////////////////////////////////////////////////
////
#define USE_USART2_THREAD_STACK_SIZE 1024
#define USE_USART2_DU_SIZE (1024*4)
#define USE_USART2_RX_BLOCK_SIZE (USE_USART2_DU_SIZE + 7)

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USE_USART2__ThreadStack[USE_USART2_THREAD_STACK_SIZE];
static os_thread_t USE_USART2__Thread;
static os_semaphore_t USE_USART2__Sem;
static uint8_t USE_USART2__RxBlock[USE_USART2_RX_BLOCK_SIZE];
static sdk_ringbuffer_t USE_USART2__RxBuffer;

////////////////////////////////////////////////////////////////////////////////
////

static void USE_USART2__RxHandler(uint16_t data, void* ud){
    if(sdk_ringbuffer_is_full(&USE_USART2__RxBuffer)){
        sdk_ringbuffer_reset(&USE_USART2__RxBuffer);
    }

    sdk_ringbuffer_put(&USE_USART2__RxBuffer, (char)data);

    os_semaphore_release(&USE_USART2__Sem);
}

static void USE_USART2__RxThread(void* p){
    int used = 0;
    int start_idx = -1;
    BSP_USART2_SetRxHandler(USE_USART2__RxHandler, 0);
    mcu_session_t* mcu_session =mcu_session_get_default();
    while(1){
        while((used = (int)sdk_ringbuffer_used(&USE_USART2__RxBuffer))==0){
            os_semaphore_take(&USE_USART2__Sem, OS_WAIT_INFINITY);
        }

        if(used<5){
            continue;
        }

        start_idx = -1;
        for(int i=0; i<used; i++){
            if(sdk_ringbuffer_peek(&USE_USART2__RxBuffer, i)==0xBE && sdk_ringbuffer_peek(&USE_USART2__RxBuffer, i+1)==0xEF){
                start_idx = i;
                break;
            }
        }

        if(start_idx==-1){
            /*没有找到数据*/
            sdk_ringbuffer_reset(&USE_USART2__RxBuffer);
            continue;
        }

        if((start_idx + 7 ) > used){
            /* 确保头部信息接收 */
            continue;
        }

        uint16_t du_size = SDK_HEX_GET_UINT16_BE(USE_USART2__RxBuffer.buffer, start_idx+2);

        if(used < (start_idx + du_size + 7)){
            /*还没有接收完成*/
            continue;
        }

        uint16_t crc = 0;

        crc = SDK_HEX_GET_UINT16_LE(USE_USART2__RxBuffer.buffer, start_idx+5+du_size);
        uint16_t chk_crc = sdk_crc16(USE_USART2__RxBuffer.buffer+start_idx, du_size+5);
        if(crc!=chk_crc){
//            sdk_hex_dump("[GD303-CRC]", USE_USART2__RxBuffer.buffer, sdk_ringbuffer_used(&USE_USART2__RxBuffer));
            os_printf("[GD303] Wrong CRC: %x VS %x\n", crc, chk_crc);
            sdk_ringbuffer_reset(&USE_USART2__RxBuffer);
            mcu_session_on_crc_error(mcu_session);
            continue;
        }

        mcu_session_on_receive(mcu_session, USE_USART2__RxBuffer.buffer+start_idx, du_size+7);

        /*处理完成，重置buffer*/
        sdk_ringbuffer_reset(&USE_USART2__RxBuffer);

    }
}


////////////////////////////////////////////////////////////////////////////////
////


void USE_USART2_Init(void)
{
    sdk_ringbuffer_init(&USE_USART2__RxBuffer, USE_USART2__RxBlock, sizeof(USE_USART2__RxBlock));

    os_semaphore_init(&USE_USART2__Sem, "USE_USART2__Sem", 0, OS_QUEUE_FIFO);
    os_thread_init(&USE_USART2__Thread, "USE_USART2_Thd", USE_USART2__RxThread, 0,
                   USE_USART2__ThreadStack, sizeof(USE_USART2__ThreadStack)
            , GLOBAL_DEFAULT_THREAD_PRIORITY
            , GLOBAL_DEFAULT_THREAD_TTICKS);
    os_thread_startup(&USE_USART2__Thread);

}