#ifndef INCLUDED_MCU_SESSION_H
#define INCLUDED_MCU_SESSION_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

#ifndef INCLUDED_SDK_HEX_H
#include <sdk_hex.h>
#endif /*INCLUDED_SDK_HEX_H*/

#ifndef INCLUDED_STRING_H
#define INCLUDED_STRING_H
#include <string.h>
#endif /*INCLUDED_STRING_H*/


////////////////////////////////////////////////////////////////////////////////
////
#ifndef MCU_PROTOCOL_DU_MAX_SIZE
#define MCU_PROTOCOL_DU_MAX_SIZE (1024 * 4)
#endif

#ifndef MCU_PROTOCOL_BUFFER_SIZE
#define MCU_PROTOCOL_BUFFER_SIZE (MCU_PROTOCOL_DU_MAX_SIZE + 7)
#endif

#define MCU_PROTOCOL_START 0xBEEF

#define MCU_PROTOCOL_STATE_UNKNOWN  0
#define MCU_PROTOCOL_STATE_SEND     1
#define MCU_PROTOCOL_STATE_RECV_OK  2
#define MCU_PROTOCOL_STATE_RECV_ERR 3

////////////////////////////////////////////////////////////////////////////////
////


#define MCU_SESSION_BUFFER(S) (S)->send_buffer

#define MCU_SESSION_START_SET(S) SDK_HEX_SET_UINT16_BE(MCU_SESSION_BUFFER(S), 0, 0xBEEF)
#define MCU_SESSION_DU_SIZE_SET(S, SZ) SDK_HEX_SET_UINT16_BE(MCU_SESSION_BUFFER(S), 2, (SZ))
#define MCU_SESSION_DU_TYPE_SET(S, T) SDK_HEX_SET_UINT8(MCU_SESSION_BUFFER(S), 4, (T))
#define MCU_SESSION_DU_SET(S, DATA, SZ) memcpy(MCU_SESSION_BUFFER(S)+5, (DATA), (SZ))
#define MCU_SESSION_CRC_SET(S, C) SDK_HEX_SET_UINT16_LE(MCU_SESSION_BUFFER(S), MCU_SESSION_DU_SIZE_GET(S)+5, (C))

#define MCU_SESSION_DU_SIZE_GET(S) SDK_HEX_GET_UINT16_BE(MCU_SESSION_BUFFER(S), 2)
#define MCU_SESSION_DU_TYPE_GET(S) SDK_HEX_GET_UINT8(MCU_SESSION_BUFFER(S), 4)
#define MCU_SESSION_CRC_GET(S) SDK_HEX_GET_UINT16_LE(MCU_SESSION_BUFFER(S), MCU_SESSION_DU_SIZE_GET(S)+5)
#define MCU_SESSION_DU_GET(S) (MCU_SESSION_BUFFER(S)+5)

#define MCU_BUFFER_DU_SIZE_GET(B) SDK_HEX_GET_UINT16_BE((B), 2)
#define MCU_BUFFER_DU_TYPE_GET(B) SDK_HEX_GET_UINT8((B), 4)
#define MCU_BUFFER_CRC_GET(B) SDK_HEX_GET_UINT16_LE((B), MCU_BUFFER_DU_SIZE_GET(B) + 5)
#define MCU_BUFFER_DU_GET(B) ((B) + 5)

////////////////////////////////////////////////////////////////////////////////
////
typedef struct mcu_session_s mcu_session_t;

typedef void (*mcu_session_on_crc_error_handler_t)(mcu_session_t* session, void* userdata);

typedef enum mcu_protocol_du_type_enum{
    kMCU_PROTOCOL_DU_PRINT = 0,
    kMCU_PROTOCOL_DU_ECRC=1,
    kMCU_PROTOCOL_DU_DATETIME=2,
    kMCU_PROTOCOL_DU_CPUID=3,
    kMCU_PROTOCOL_DU_CAN=4,
    kMCU_PROTOCOL_DU_UPGRADE=0xA0,
    kMCU_PROTOCOL_DU_SEND_FW_DATA=0xA1,
    kMCU_PROTOCOL_DU_RECVOK=0xD0,
    kMCU_PROTOCOL_DU_RECVERR=0xDE,
    kMCU_PROTOCOL_DU_UPG_MCU1_APP=0xFA,
    kMCU_PROTOCOL_DU_UPG_MCU1_BOOT=0xFB,
}mcu_protocol_du_type_t;

/*
 * START: 0xBE, 0xEF
 * DU_SIZE: uint16_t BE
 * DU_TYPE: uint8_t
 * DU     : uint8_t[MCU_PROTOCOL_DU_MAX_SIZE]
 * CRC    : uint16_t LE
 *
 * */
typedef struct mcu_session_s{
    uint8_t send_buffer[MCU_PROTOCOL_BUFFER_SIZE];
    uint16_t send_size;
    mcu_session_on_crc_error_handler_t on_crc_error_handler;
    void* on_crc_error_handler_userdata;
    os_semaphore_t lock;
    int state;
}mcu_session_t;


////////////////////////////////////////////////////////////////////////////////
////

mcu_session_t* mcu_session_get_default(void);

int mcu_session_init(mcu_session_t * session);

int mcu_session_pack(mcu_session_t * session, uint8_t type, uint8_t *data, uint16_t size);

int mcu_session_printf(mcu_session_t* session, const char* fmt, ...);

int mcu_session_send(mcu_session_t * session, mcu_session_on_crc_error_handler_t on_crc_error, void* usderdata);

int mcu_session_on_receive(mcu_session_t * session, uint8_t * data, int data_size);

int mcu_session_crc(mcu_session_t * session);

int mcu_session_on_crc_error(mcu_session_t* session);

int mcu_session_timed_wait(mcu_session_t * session, uint32_t timeout_ms);

int mcu_session_notify(mcu_session_t* session);

#endif /*INCLUDED_MCU_SESSION_H*/
