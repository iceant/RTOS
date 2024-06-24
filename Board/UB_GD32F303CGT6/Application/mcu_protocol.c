#include <mcu_protocol.h>
#include <sdk_crc16.h>
#include <sdk_hex.h>
#include <string.h>
#include <board.h>
#include <meter_protocol.h>
#include <stdio.h>
#include <global.h>
#include <os_kernel.h>
////////////////////////////////////////////////////////////////////////////////
////
static os_mutex_t mcu_protocol_lock={.lock=0};
static int mcu_protocol_state = MCU_PROTOCOL_STATE_UNKNOWN;

static void mcu_protocol__handler(mcu_protocol_t * protocol, void* ud){
    switch(MCU_PROTOCOL_DU_TYPE_GET(protocol)){
        case kMCU_PROTOCOL_DU_DATETIME:{
            uint8_t * du = MCU_PROTOCOL_DU_GET(protocol);
            meter_protocol_datetime_set(
                    SDK_HEX_GET_UINT16_BE(du, 0), /*year*/
                    SDK_HEX_GET_UINT8(du, 2),/*month*/
                    SDK_HEX_GET_UINT8(du, 3),/*date*/
                    SDK_HEX_GET_UINT8(du, 4),/*hour*/
                    SDK_HEX_GET_UINT8(du, 5),/*min*/
                    SDK_HEX_GET_UINT8(du, 6),/*sec*/
                    (uint16_t)(BSP_TIM6__TickCount % 1000)
                    );

            global_get()->datetime.year = SDK_HEX_GET_UINT16_BE(du, 0);
            global_get()->datetime.month = SDK_HEX_GET_UINT8(du, 2);
            global_get()->datetime.date = SDK_HEX_GET_UINT8(du, 3);
            global_get()->datetime.hour = SDK_HEX_GET_UINT8(du, 4);
            global_get()->datetime.min = SDK_HEX_GET_UINT8(du, 5);
            global_get()->datetime.sec = SDK_HEX_GET_UINT8(du, 6);

            break;
        }
        case kMCU_PROTOCOL_DU_CPUID:{
            uint8_t * du = MCU_PROTOCOL_DU_GET(protocol);
            uint16_t du_size = MCU_PROTOCOL_DU_SIZE_GET(protocol);
            global_set_cpuid((void*)du, du_size);
            break;
        }
        case kMCU_PROTOCOL_DU_RECVOK:{
            if(mcu_protocol_state == MCU_PROTOCOL_STATE_SEND){
                mcu_protocol_state = MCU_PROTOCOL_STATE_RECV_OK;
                mcu_protocol_release();
            }else{
                mcu_protocol_state = MCU_PROTOCOL_STATE_RECV_OK;
            }
            break;
        }
        case kMCU_PROTOCOL_DU_RECVERR:{
            if(mcu_protocol_state == MCU_PROTOCOL_STATE_SEND){
                mcu_protocol_state = MCU_PROTOCOL_STATE_RECV_ERR;
                mcu_protocol_release();
            }else{
                mcu_protocol_state = MCU_PROTOCOL_STATE_RECV_ERR;
            }
            break;
        }
        case kMCU_PROTOCOL_DU_ECRC:{
            if(mcu_protocol_state == MCU_PROTOCOL_STATE_SEND){
                mcu_protocol_state = MCU_PROTOCOL_STATE_RECV_ERR;
                mcu_protocol_release();
            }else{
                mcu_protocol_state = MCU_PROTOCOL_STATE_RECV_ERR;
            }
            break;
        }
        default:
            break;
    }
}

////////////////////////////////////////////////////////////////////////////////
////

mcu_protocol_handler_t mcu_protocol_g_handler = mcu_protocol__handler;

mcu_protocol_t mcu_protocol_g_rx_protocol;
mcu_protocol_t mcu_protocol_g_tx_protocol;

static os_semaphore_t mcu_protocol__sem;

////////////////////////////////////////////////////////////////////////////////
////
int mcu_protocol_module_init(void){
    os_semaphore_init(&mcu_protocol__sem, "mcu_pro_sem", 0, OS_QUEUE_FIFO);
    return 0;
}

void mcu_protocol_wait(void){
    os_semaphore_take(&mcu_protocol__sem, OS_WAIT_INFINITY);
}

os_err_t mcu_protocol_timed_wait(uint32_t ms){
    return os_semaphore_take(&mcu_protocol__sem, os_tick_from_millisecond(ms));
}

void mcu_protocol_release(void){
    os_semaphore_release(&mcu_protocol__sem);
}

int mcu_protocol_init(mcu_protocol_t * protocol, mcu_protocol_du_type_t type, void * data_unit, uint16_t du_size)
{
    if(!protocol){
        return -1;
    }

    if(du_size > MCU_PROTOCOL_DU_MAX_SIZE){
        return  -2;
    }

    memset(protocol, 0, sizeof(*protocol));

    MCU_PROTOCOL_DU_START_SET(protocol);
    MCU_PROTOCOL_DU_SIZE_SET(protocol, du_size);
    MCU_PROTOCOL_DU_TYPE_SET(protocol, type);
    if(du_size>0){
        MCU_PROTOCOL_DU_SET(protocol, data_unit, du_size);
    }

    return 0;
}

void mcu_protocol_crc(mcu_protocol_t * protocol)
{
    uint16_t crc = 0;
    uint16_t du_size =MCU_PROTOCOL_DU_SIZE_GET(protocol);
    if(du_size==0){
        crc = sdk_crc16(protocol->buffer, 5);
    }else{
        crc = sdk_crc16(protocol->buffer, du_size + 5);
    }
    SDK_HEX_SET_UINT16_LE(protocol->buffer, du_size+5, crc);
}

////////////////////////////////////////////////////////////////////////////////
////

//#define MCU_PROTOCOL_SEND BSP_USART1_Send
#define MCU_PROTOCOL_SEND BSP_USART1_DMATx

void mcu_protocol_send(mcu_protocol_t * protocol){
//    os_mutex_lock(&mcu_protocol_lock);
#if 0
    MCU_PROTOCOL_SEND(protocol->start, 2);
    MCU_PROTOCOL_SEND(protocol->du_size.bytes, 2);
    MCU_PROTOCOL_SEND(&protocol->du_type, 1);
    MCU_PROTOCOL_SEND(protocol->data_unit, protocol->du_size.uint);
    MCU_PROTOCOL_SEND(protocol->crc, 2);
#else
//    BSP_USART1_Send("HELLO!!!", 8);
    mcu_protocol_state = MCU_PROTOCOL_STATE_SEND;
    MCU_PROTOCOL_SEND(protocol->buffer, MCU_PROTOCOL_DU_SIZE_GET(protocol) + 7);
#endif

//    os_mutex_unlock(&mcu_protocol_lock);
}

////////////////////////////////////////////////////////////////////////////////
////


int mcu_protocol_du_print(mcu_protocol_t * protocol, char* message, uint16_t message_size)
{
//    os_mutex_lock(&mcu_protocol_lock);
    int size = OS_MIN(message_size, MCU_PROTOCOL_DU_MAX_SIZE);

    int err = mcu_protocol_init(protocol, kMCU_PROTOCOL_DU_PRINT, message, size);
    if(err!=0){
        return err;
    }
    mcu_protocol_crc(protocol);
    mcu_protocol_send(protocol);
//    os_mutex_unlock(&mcu_protocol_lock);
    return 0;
}


int mcu_protocol_du_ecrc(mcu_protocol_t * protocol)
{
    int err = mcu_protocol_init(protocol, kMCU_PROTOCOL_DU_ECRC, 0, 0);

    if(err!=0){
        return err;
    }

    mcu_protocol_crc(protocol);
    return 0;
}

////////////////////////////////////////////////////////////////////////////////
////
int mcu_protocol_can_init(mcu_protocol_t * protocol, void* du, int du_size)
{
    int err = mcu_protocol_init(protocol, kMCU_PROTOCOL_DU_CAN, du, du_size);
    if(err!=0){
        return err;
    }
    mcu_protocol_crc(protocol);
    return 0;
}

