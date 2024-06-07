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
//// 说明


/*
 * MCU 通讯组件，与 GD32F303CGT6 进行通讯
 */


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
    kMCU_PROTOCOL_DU_CPUID,
}mcu_protocol_du_type_t;

/*
 * START: 0x23, 0x23
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


////////////////////////////////////////////////////////////////////////////////
////
extern mcu_protocol_handler_t mcu_protocol_g_handler;
extern mcu_protocol_t mcu_protocol_g_tx_protocol;
extern mcu_protocol_t mcu_protocol_g_rx_protocol;

////////////////////////////////////////////////////////////////////////////////
////
#define MCU_PROTOCOL_DU_START_SET(P) SDK_HEX_SET_UINT16_BE((P)->buffer, 0, MCU_PROTOCOL_START)

#define MCU_PROTOCOL_DU_SIZE_GET(P) SDK_HEX_GET_UINT16_BE((P)->buffer, 2)
#define MCU_PROTOCOL_DU_SIZE_SET(P, SZ) SDK_HEX_SET_UINT16_BE((P)->buffer, 2, (SZ))

#define MCU_PROTOCOL_DU_TYPE_GET(P) SDK_HEX_GET_UINT8((P)->buffer, 4)
#define MCU_PROTOCOL_DU_TYPE_SET(P, SZ) SDK_HEX_SET_UINT8((P)->buffer, 4, (SZ))

#define MCU_PROTOCOL_DU_SET(P, DU, DU_SZ) memcpy((P)->buffer + 5, (DU), (DU_SZ))
#define MCU_PROTOCOL_DU_GET(P) ((P)->buffer + 5)

#define MCU_PROTOCOL_CRC_SET(P, CRC) SDK_HEX_SET_UINT16_LE((P)->buffer, MCU_PROTOCOL_DU_SIZE_GET(P) + 5, (CRC))

#define MCU_PROTOCOL_PKG_SIZE_GET(P) (MCU_PROTOCOL_DU_SIZE_GET((P)) + 7)
////////////////////////////////////////////////////////////////////////////////
////
int mcu_protocol_init(mcu_protocol_t * protocol, mcu_protocol_du_type_t type, void * data_unit, uint16_t du_size);

void mcu_protocol_crc(mcu_protocol_t * protocol);

void mcu_protocol_send(mcu_protocol_t * protocol);

////////////////////////////////////////////////////////////////////////////////
////
int mcu_protocol_du_print(mcu_protocol_t * protocol, char* message, uint16_t message_size);

int mcu_protocol_du_ecrc(mcu_protocol_t * protocol);

int mcu_protocol_du_datetime(mcu_protocol_t * protocol, uint16_t year, uint8_t month, uint8_t date, uint8_t hour, uint8_t min, uint8_t sec);


#endif /*INCLUDED_MCU_PROTOCOL_H*/
