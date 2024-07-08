#include <mcu_session.h>
#include <sdk_crc16.h>
#include <sdk_hex.h>
#include <string.h>
#include <board.h>
#include <meter_protocol.h>
#include <stdio.h>
#include <global.h>
#include <os_kernel.h>
#include <iap.h>
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
    memset(session->send_buffer, 0, sizeof(session->send_buffer));
    session->send_size = 0;
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
    mcu_session__send(session);
    return 0;
}

int mcu_session_send(mcu_session_t * session, mcu_session_on_crc_error_handler_t on_crc_error_handler, void* usderdata)
{

    session->on_crc_error_handler = on_crc_error_handler;
    session->on_crc_error_handler_userdata = usderdata;
    MCU_SESSION_SEND(session->send_buffer, session->send_size);
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

    switch (MCU_BUFFER_DU_TYPE_GET(data)) {
        case kMCU_PROTOCOL_DU_CPUID:
        {
            global_t* global = global_get();
            int cpuid_size = MCU_BUFFER_DU_SIZE_GET(data);
            int cpuid_buffer_size = sizeof(global->CPUID);
            int size = cpuid_size > cpuid_buffer_size?cpuid_buffer_size:cpuid_size;
            memcpy(global->CPUID,  MCU_BUFFER_DU_GET(data), size);

            break;
        }
        case kMCU_PROTOCOL_DU_DATETIME:{
            global_t* global = global_get();
            uint8_t * du = MCU_BUFFER_DU_GET(data);
            int du_size = MCU_BUFFER_DU_SIZE_GET(data);
            if(du_size==7){
                int idx = 0;
                uint16_t year = SDK_HEX_GET_UINT16_BE(du, idx); idx+=2;
                uint8_t month = SDK_HEX_GET_UINT8(du, idx); idx+=1;
                uint8_t date = SDK_HEX_GET_UINT8(du, idx); idx+=1;
                uint8_t hour = SDK_HEX_GET_UINT8(du, idx); idx+=1;
                uint8_t minute = SDK_HEX_GET_UINT8(du, idx); idx+=1;
                uint8_t sec = SDK_HEX_GET_UINT8(du, idx); idx+=1;

                global->datetime.year = year;
                global->datetime.month = month;
                global->datetime.date = date;
                global->datetime.hour = hour;
                global->datetime.min = minute;
                global->datetime.sec = sec;
            }
            break;
        }
        case kMCU_PROTOCOL_DU_UPGRADE:{
            /* 主控请求升级, 重启，由 MCU1_BOOT 来处理 */
            int idx = 0;
            uint8_t * buffer = MCU_BUFFER_DU_GET(data);
            uint16_t du_size = MCU_BUFFER_DU_SIZE_GET(data);
            if(du_size==25){
                int type = SDK_HEX_GET_UINT8(buffer, idx);idx+=1;
                uint32_t size = SDK_HEX_GET_UINT32_BE(buffer, idx);idx+=4;
                uint32_t version = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
                iap_info_t iap_info;
                if(type==IAP_FW_TYPE_MCU1_BOOT){
                    iap_info.MCU_BOOT.type = IAP_FW_TYPE_MCU1_BOOT;
                    iap_info.MCU_BOOT.size = size;
                    iap_info.MCU_BOOT.download_version = version;
                    memcpy(iap_info.MCU_BOOT.md5, buffer+idx, 16); idx+=16;
                    iap_info_write(&iap_info);
                }else if(type==IAP_FW_TYPE_MCU1_APP){
                    iap_info.MCU_APP.type = IAP_FW_TYPE_MCU1_APP;
                    iap_info.MCU_APP.size = size;
                    iap_info.MCU_APP.download_version = version;
                    memcpy(iap_info.MCU_APP.md5, buffer+idx, 16); idx+=16;
                    iap_info_write(&iap_info);
                }

                Board_Reboot();
                break;
            }
        }
        default:
            return -2;
    }

    return 0;
}


