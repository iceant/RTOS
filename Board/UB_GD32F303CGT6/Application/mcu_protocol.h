#ifndef INCLUDED_MCU_PROTOCOL_H
#define INCLUDED_MCU_PROTOCOL_H

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
////////////////////////////////////////////////////////////////////////////////
////

typedef enum mcu_protocol_du_type_enum{
    kMCU_PROTOCOL_DU_PRINT = 0,
    kMCU_PROTOCOL_DU_ECRC,
    kMCU_PROTOCOL_DU_DATETIME,
}mcu_protocol_du_type_t;

/*
 * START: 0xBE, 0xEF
 * DU_SIZE: uint16_t BE
 * DU_TYPE: uint8_t
 * DU     : uint8_t[MCU_PROTOCOL_DU_MAX_SIZE]
 * CRC    : uint16_t LE
 *
 * */
typedef struct C__PACKED mcu_protocol_s{
    uint8_t buffer[MCU_PROTOCOL_BUFFER_SIZE];
}mcu_protocol_t;

typedef void (*mcu_protocol_handler_t)(mcu_protocol_t *, void* ud);

extern mcu_protocol_handler_t mcu_protocol_g_handler;

////////////////////////////////////////////////////////////////////////////////
////
#define MCU_PROTOCOL_DU_START_SET(P) SDK_HEX_SET_UINT16_BE((P)->buffer, 0, MCU_PROTOCOL_START)

#define MCU_PROTOCOL_DU_SIZE_GET(P) SDK_HEX_GET_UINT16_BE((P)->buffer, 2)
#define MCU_PROTOCOL_DU_SIZE_SET(P, SZ) SDK_HEX_SET_UINT16_BE((P)->buffer, 2, (SZ))

#define MCU_PROTOCOL_DU_TYPE_GET(P) SDK_HEX_GET_UINT8((P)->buffer, 4)
#define MCU_PROTOCOL_DU_TYPE_SET(P, SZ) SDK_HEX_SET_UINT8((P)->buffer, 4, (SZ))

#define MCU_PROTOCOL_DU_SET(P, DU, DU_SZ) memcpy(((P)->buffer + 5), (DU), (DU_SZ))
#define MCU_PROTOCOL_DU_GET(P) ((P)->buffer + 5)

#define MCU_PROTOCOL_CRC_SET(P, CRC) SDK_HEX_SET_UINT16_LE((P)->buffer, MCU_PROTOCOL_DU_SIZE_GET(P) + 5, (CRC))

////////////////////////////////////////////////////////////////////////////////
////
extern mcu_protocol_t mcu_protocol_g_rx_protocol;
extern mcu_protocol_t mcu_protocol_g_tx_protocol;

////////////////////////////////////////////////////////////////////////////////
////
int mcu_protocol_init(mcu_protocol_t * protocol, mcu_protocol_du_type_t type, void * data_unit, uint16_t du_size);

void mcu_protocol_crc(mcu_protocol_t * protocol);

void mcu_protocol_send(mcu_protocol_t * protocol);

////////////////////////////////////////////////////////////////////////////////
////
int mcu_protocol_du_print(mcu_protocol_t * protocol, char* message, uint16_t message_size);

int mcu_protocol_du_ecrc(mcu_protocol_t * protocol);

#endif /*INCLUDED_MCU_PROTOCOL_H*/
