#include <use_usart1.h>
#include <sdk_ringbuffer.h>
#include <sdk_hex.h>
#include <sdk_crc16.h>
#include <mcu_protocol.h>
#include <assert.h>
////////////////////////////////////////////////////////////////////////////////
////

#define USE_USART1_THREAD_STACK_SIZE 1024
#define USE_USART1_DU_SIZE (1024*2)
#define USE_USART1_RX_BLOCK_SIZE (USE_USART1_DU_SIZE + 256)

static uint8_t USE_USART1_Thread_Stack[USE_USART1_THREAD_STACK_SIZE];
static os_thread_t USE_USART1_Thread;
static os_semaphore_t USE_USART1_Sem;
static uint8_t USE_USART1_RxBlock[USE_USART1_RX_BLOCK_SIZE];
static sdk_ringbuffer_t USE_USART1_RxBuffer;

static uint8_t USE_USART1__DataUnit[USE_USART1_DU_SIZE];

static mcu_protocol_handler_t USE_USART1__ProtocolHandler = 0;
static void* USE_USART1__ProtocolHandler_Userdata = 0;


static void USE_USART1__RxHandler(uint16_t data, void* userdata)
{
    sdk_ringbuffer_put(&USE_USART1_RxBuffer, (char)data);
    os_semaphore_release(&USE_USART1_Sem);
}

static void USE_USART1__SendErrorCRC(void){
    mcu_protocol_t protocol;
    mcu_protocol_du_ecrc(&protocol);
    mcu_protocol_send(&protocol);
}

static void USE_USART1__ThreadEntry(void* p){

    BSP_USART1_SetRxHandler(USE_USART1__RxHandler, 0);
    int used = 0;
    int start_idx = -1;
    while(1){
        while((used = (int)sdk_ringbuffer_used(&USE_USART1_RxBuffer))==0){
            os_semaphore_take(&USE_USART1_Sem, OS_WAIT_INFINITY);
        }

        if(used<7){
            continue;
        }

        start_idx = -1;
        for(int i=0; i<used; i++){
            if(sdk_ringbuffer_peek(&USE_USART1_RxBuffer, i)==0x23 && sdk_ringbuffer_peek(&USE_USART1_RxBuffer, i+1)){
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

        uint16_t du_size = SDK_HEX_GET_UINT16_BE(USE_USART1_RxBuffer.buffer, start_idx);

        if(used < (start_idx + du_size + 7)){
            /*还没有接收完成*/
            continue;
        }

        uint8_t  du_type = USE_USART1_RxBuffer.buffer[start_idx + 4];

        uint16_t crc = SDK_HEX_GET_UINT16_LE(USE_USART1_RxBuffer.buffer, start_idx+5+du_size);
        uint16_t chk_crc = sdk_crc16(USE_USART1_RxBuffer.buffer+start_idx+5, du_size);
        if(crc!=chk_crc){
            sdk_ringbuffer_reset(&USE_USART1_RxBuffer);
            USE_USART1__SendErrorCRC();
            continue;
        }

        if(USE_USART1__ProtocolHandler){
            mcu_protocol_init(&mcu_protocol_g_rx_protocol, du_type, 0, 0);
            assert(du_size < MCU_PROTOCOL_DU_MAX_SIZE);
            MCU_PROTOCOL_DU_SET(&mcu_protocol_g_rx_protocol, USE_USART1_RxBuffer.buffer+start_idx+5, du_size);
            MCU_PROTOCOL_CRC_SET(&mcu_protocol_g_rx_protocol, crc);
            USE_USART1__ProtocolHandler(&mcu_protocol_g_rx_protocol, USE_USART1__ProtocolHandler_Userdata);
        }

        /*处理完成，重置buffer*/
        sdk_ringbuffer_reset(&USE_USART1_RxBuffer);

    }
}


////////////////////////////////////////////////////////////////////////////////
////

void USE_USART1_Init()
{
    USE_USART1__ProtocolHandler = mcu_protocol_g_handler;
    USE_USART1__ProtocolHandler_Userdata = 0;

    sdk_ringbuffer_init(&USE_USART1_RxBuffer, USE_USART1_RxBlock, sizeof(USE_USART1_RxBlock));

    os_semaphore_init(&USE_USART1_Sem, "USE_USART1_Sem", 0, OS_QUEUE_FIFO);

    os_thread_init(&USE_USART1_Thread, "USE_USART1_Thd", USE_USART1__ThreadEntry, 0
        , USE_USART1_Thread_Stack, sizeof(USE_USART1_Thread_Stack), 20, 10);
    os_thread_startup(&USE_USART1_Thread);

}
