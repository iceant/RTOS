#include <mcu_protocol.h>
#include <sdk_crc16.h>
#include <sdk_hex.h>
#include <string.h>
#include <board.h>

////////////////////////////////////////////////////////////////////////////////
////
static os_mutex_t mcu_protocol_lock={.lock=0};

static void mcu_protocol_handler(mcu_protocol_t * protocol, void* ud){
    switch (MCU_PROTOCOL_DU_TYPE_GET(protocol)) {
        case kMCU_PROTOCOL_DU_PRINT:{
            os_printf("[GD303]");
            for(int i=0; i< MCU_PROTOCOL_DU_SIZE_GET(protocol); i++){
                os_printf("%c", protocol->buffer[5+i]);
            }
            break;
        }
        case kMCU_PROTOCOL_DU_ECRC:{
            os_printf("[GD303] CRC ERROR!!!\n");
            break;
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
////



mcu_protocol_handler_t mcu_protocol_g_handler = mcu_protocol_handler;


////////////////////////////////////////////////////////////////////////////////
////


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

#define MCU_PROTOCOL_SEND BSP_USART1_Send
//#define MCU_PROTOCOL_SEND BSP_USART1_DMATx

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
