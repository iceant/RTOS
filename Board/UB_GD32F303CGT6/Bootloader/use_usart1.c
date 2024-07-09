#include <use_usart1.h>
#include <sdk_ringbuffer.h>
#include <sdk_hex.h>
#include <sdk_crc16.h>
#include <mcu_session.h>
////////////////////////////////////////////////////////////////////////////////
////

#define USE_USART1_THREAD_STACK_SIZE 1024
#define USE_USART1_DU_SIZE (1024*4)
#define USE_USART1_RX_BLOCK_SIZE (USE_USART1_DU_SIZE + 7)

static uint8_t USE_USART1_Thread_Stack[USE_USART1_THREAD_STACK_SIZE];
static os_thread_t USE_USART1_Thread;
static os_semaphore_t USE_USART1_Sem;
static uint8_t USE_USART1_RxBlock[USE_USART1_RX_BLOCK_SIZE];
static sdk_ringbuffer_t USE_USART1_RxBuffer;

static void USE_USART1__RxHandler(uint16_t data, void* userdata)
{
    if(sdk_ringbuffer_is_full(&USE_USART1_RxBuffer)){
        sdk_ringbuffer_reset(&USE_USART1_RxBuffer);
    }
    sdk_ringbuffer_put(&USE_USART1_RxBuffer, (char)data);
    os_semaphore_release(&USE_USART1_Sem);
}


static void USE_USART1__ThreadEntry(void* p){

    BSP_USART1_SetRxHandler(USE_USART1__RxHandler, 0);
    mcu_session_t* mcu_session = mcu_session_get_default();

    int used = 0;
    int start_idx = -1;
    while(1){
        while((used = (int)sdk_ringbuffer_used(&USE_USART1_RxBuffer))==0){
            os_semaphore_take(&USE_USART1_Sem, OS_WAIT_INFINITY);
        }

        if(used<5){
            continue;
        }

        start_idx = -1;
        for(int i=0; i<used; i++){
            if(sdk_ringbuffer_peek(&USE_USART1_RxBuffer, i)==0xBE && sdk_ringbuffer_peek(&USE_USART1_RxBuffer, i+1)==0xEF){
                start_idx = i;
                break;
            }
        }

        if(start_idx==-1){
            /*没有找到数据*/
            sdk_ringbuffer_reset(&USE_USART1_RxBuffer);
            continue;
        }

        if((start_idx + 7 ) > used){
            /* 确保头部信息接收 */
            continue;
        }

        uint16_t du_size = SDK_HEX_GET_UINT16_BE(USE_USART1_RxBuffer.buffer, start_idx+2);

        if(used < (start_idx + du_size + 7)){
            /*还没有接收完成*/
            continue;
        }

        uint8_t  du_type = USE_USART1_RxBuffer.buffer[start_idx + 4];

        uint16_t crc = SDK_HEX_GET_UINT16_LE(USE_USART1_RxBuffer.buffer, start_idx+5+du_size);
        uint16_t chk_crc = sdk_crc16(USE_USART1_RxBuffer.buffer+start_idx, du_size+5);
        if(crc!=chk_crc){
            sdk_ringbuffer_reset(&USE_USART1_RxBuffer);
            mcu_session_on_crc_error(mcu_session);
            continue;
        }

        mcu_session_on_receive(mcu_session, USE_USART1_RxBuffer.buffer+start_idx, du_size + 7);

        /*处理完成，重置buffer*/
        sdk_ringbuffer_reset(&USE_USART1_RxBuffer);

    }
}


////////////////////////////////////////////////////////////////////////////////
////

void USE_USART1_Init()
{
    sdk_ringbuffer_init(&USE_USART1_RxBuffer, USE_USART1_RxBlock, sizeof(USE_USART1_RxBlock));

    os_semaphore_init(&USE_USART1_Sem, "USE_USART1_Sem", 0, OS_QUEUE_FIFO);

    os_thread_init(&USE_USART1_Thread, "USE_USART1_Thd", USE_USART1__ThreadEntry, 0
        , USE_USART1_Thread_Stack, sizeof(USE_USART1_Thread_Stack), 20, 10);
    os_thread_startup(&USE_USART1_Thread);

}
