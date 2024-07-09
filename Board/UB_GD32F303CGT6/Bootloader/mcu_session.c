#include <mcu_session.h>
#include <sdk_crc16.h>
#include <sdk_hex.h>
#include <string.h>
#include <board.h>
#include <stdio.h>
#include <os_kernel.h>
#include <iap.h>
#include <board.h>
#include "delay.h"
////////////////////////////////////////////////////////////////////////////////
////


/*
 * START: 0xBE, 0xEF
 * DU_SIZE: uint16_t BE
 * DU_TYPE: uint8_t
 * DU     : uint8_t[MCU_PROTOCOL_DU_MAX_SIZE]
 * CRC    : uint16_t LE
 */


////////////////////////////////////////////////////////////////////////////////
////
static mcu_session_t mcu_session__instance={0};

////////////////////////////////////////////////////////////////////////////////
////
#define MCU_SESSION_SEND BSP_USART1_DMATx
//#define MCU_SESSION_SEND BSP_USART1_Send

static int mcu_session__send(mcu_session_t *session){
    MCU_SESSION_SEND(session->send_buffer, session->send_size);
    return 0;
}

////////////////////////////////////////////////////////////////////////////////
////

mcu_session_t* mcu_session_get_default(void){
    return &mcu_session__instance;
}

int mcu_session_pack(mcu_session_t * session, uint8_t type, uint8_t *data, uint16_t size){
    MCU_SESSION_START_SET(session);
    MCU_SESSION_DU_TYPE_SET(session, type);
    if(data!=0 && size>0){
        MCU_SESSION_DU_SET(session, data, size);
    }
    MCU_SESSION_DU_SIZE_SET(session, size);
    session->send_size = MCU_SESSION_DU_SIZE_GET(session) + 7;

    return mcu_session_crc(session);
}


int mcu_session_crc(mcu_session_t * session){
    uint16_t crc = sdk_crc16(session->send_buffer, 5 + MCU_SESSION_DU_SIZE_GET(session));
    MCU_SESSION_CRC_SET(session, crc);
    return 0;
}

int mcu_session_init(mcu_session_t * session)
{
    memset(session, 0, sizeof(*session));
    session->send_size = 0;
    os_semaphore_init(&session->lock, "MCU_SxSem", 0, OS_QUEUE_FIFO);
    session->on_crc_error_handler=0;
    session->on_crc_error_handler_userdata = 0;
    session->state = 0;
    session->rx_handler = 0;
    session->rx_handler_userdata = 0;
    return 0;
}

int mcu_session_printf(mcu_session_t* session, const char* fmt, ...)
{
    int size = 0;
    va_list arg;
    va_start(arg, fmt);
    size = vsnprintf((char*) MCU_SESSION_DU_GET(session), sizeof(session->send_buffer), fmt, arg);
    va_end(arg);
    session->send_buffer[size+5]='\0';
    mcu_session_pack(session, kMCU_PROTOCOL_DU_PRINT, 0, size);
    MCU_SESSION_SEND(session->send_buffer, session->send_size);
    delay_ms(200);
    return 0;
}

int mcu_session_send(mcu_session_t * session, mcu_session_on_crc_error_handler_t on_crc_error_handler, void* usderdata)
{

    session->on_crc_error_handler = on_crc_error_handler;
    session->on_crc_error_handler_userdata = usderdata;
    MCU_SESSION_SEND(session->send_buffer, session->send_size);
    delay_ms(200);
    return 0;
}

int mcu_session_on_crc_error(mcu_session_t* session)
{
    if(session->on_crc_error_handler){
        session->on_crc_error_handler(session, session->on_crc_error_handler_userdata);
    }

    return 0;
}

int mcu_session_on_receive(mcu_session_t * session, uint8_t * data, int data_size)
{
    if(data_size==0 || data==0) return -1;
    int du_type = MCU_BUFFER_DU_TYPE_GET(data);

    switch (du_type) {
        case kMCU_PROTOCOL_DU_UPGRADE:{
            /* 主控请求升级, 重启，由 MCU1_BOOT 来处理 */
            int idx = 0;
            uint8_t * buffer = MCU_BUFFER_DU_GET(data);
            uint16_t du_size = MCU_BUFFER_DU_SIZE_GET(data);

            int type = SDK_HEX_GET_UINT8(buffer, idx);idx+=1;
            uint32_t size = SDK_HEX_GET_UINT32_BE(buffer, idx);idx+=4;
            uint32_t version = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
            iap_info_t iap_info;
            iap_info_read(&iap_info);

            if(type==IAP_FW_TYPE_MCU1_BOOT){
                mcu_session_printf(session, "BOOT> RECV UPGRADE MCU1_BOOT");
                iap_info.MCU_BOOT.type = IAP_FW_TYPE_MCU1_BOOT;
                iap_info.MCU_BOOT.size = size;
                iap_info.MCU_BOOT.download_version = version;
                memcpy(iap_info.MCU_BOOT.md5, buffer+idx, 16); idx+=16;
                iap_info_write(&iap_info);
            }else if(type==IAP_FW_TYPE_MCU1_APP){
                mcu_session_printf(session, "BOOT> RECV UPGRADE MCU1_APP");
                iap_info.MCU_APP.type = IAP_FW_TYPE_MCU1_APP;
                iap_info.MCU_APP.size = size;
                iap_info.MCU_APP.download_version = version;
                memcpy(iap_info.MCU_APP.md5, buffer+idx, 16); idx+=16;
                iap_info_write(&iap_info);
            }
            mcu_session_printf(session, "BOOT> RECV UPGRADE REBOOT...");
            Board_Reboot();
            break;
        }
        default: {
            if(session->rx_handler){
                session->rx_handler(session, data, data_size, session->rx_handler_userdata);
                break;
            }else{
                return -2;
            }
        }
    }

    return 0;
}

int mcu_session_timed_wait(mcu_session_t * session, uint32_t timeout_ms)
{
    os_err_t err;
    if(timeout_ms==OS_WAIT_INFINITY){
        err = os_semaphore_take(&session->lock, OS_WAIT_INFINITY);
    }else {
        err = os_semaphore_take(&session->lock, os_tick_from_millisecond(timeout_ms));
    }
    return err;
}

int mcu_session_notify(mcu_session_t * session){
    return os_semaphore_release(&session->lock);
}

void mcu_session_set_rx_handler(mcu_session_t * session, mcu_session_rx_handler handler, void* ud){
    session->rx_handler = handler;
    session->rx_handler_userdata = ud;
}
