#include <mcu_session.h>
#include <sdk_crc16.h>
#include <sdk_hex.h>
#include <string.h>
#include <board.h>
#include <stdio.h>
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
#define MCU_SESSION_SEND BSP_USART2_DMATx

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
    session->state = 0;
    os_semaphore_init(&session->lock, "MCU_SxSem", 0, OS_QUEUE_FIFO);
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

int mcu_session_timed_wait(mcu_session_t * session, uint32_t timeout_ms)
{
    if(timeout_ms==OS_WAIT_INFINITY){
        return os_semaphore_take(&session->lock, OS_WAIT_INFINITY);
    }else{
        return os_semaphore_take(&session->lock, os_tick_from_millisecond(timeout_ms));
    }
}

int mcu_session_notify(mcu_session_t* session){
    os_semaphore_release(&session->lock);
    return 0;
}

int mcu_session_on_receive(mcu_session_t * session, uint8_t * data, int data_size)
{
    if(data_size==0 || data==0) return -1;

    switch (MCU_BUFFER_DU_TYPE_GET(data)) {
        case kMCU_PROTOCOL_DU_PRINT:
        {
            char * buffer = (char*)MCU_BUFFER_DU_GET(data);
            int size = MCU_BUFFER_DU_SIZE_GET(data);
            for(int i=0; i<size; i++){
                printf("%c", buffer[i]);
            }

            break;
        }
        case kMCU_PROTOCOL_DU_UPG_MCU1_APP:{
            session->state = IAP_STATE_RECV_UPG_MCU1_APP;

            mcu_session_notify(session);
            break;
        }
        case kMCU_PROTOCOL_DU_UPG_MCU1_BOOT:{
            session->state = IAP_STATE_RECV_UPG_MCU1_BOOT;

            mcu_session_notify(session);
            break;
        }
        case kMCU_PROTOCOL_DU_RECVOK:{
            session->state = IAP_STATE_RECV_OK;
            mcu_session_notify(session);
            break;
        }
        default:
            return -2;
    }

    return 0;
}


