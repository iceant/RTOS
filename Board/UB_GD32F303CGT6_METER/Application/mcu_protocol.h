#ifndef INCLUDED_MCU_PROTOCOL_H
#define INCLUDED_MCU_PROTOCOL_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /*INCLUDED_STDINT_H*/

#ifndef INCLUDED_STDBOOL_H
#define INCLUDED_STDBOOL_H
#include <stdbool.h>
#endif /*INCLUDED_STDBOOL_H*/

#ifndef INCLUDED_SDK_HEX_H
#include <sdk_hex.h>
#endif /*INCLUDED_SDK_HEX_H*/

#ifndef INCLUDED_SDK_CRC16_H
#include <sdk_crc16.h>
#endif /*INCLUDED_SDK_CRC16_H*/


////////////////////////////////////////////////////////////////////////////////
////
#define MCU_PROTOCOL_BUFFER_SIZE (4096+256)

typedef struct mcu_protocol_s{
    uint8_t buffer[MCU_PROTOCOL_BUFFER_SIZE];
    uint32_t size;
}mcu_protocol_t;

////////////////////////////////////////////////////////////////////////////////
////
#define MCU_PROTOCOL_START                      0xAA

#define MCU_PROTOCOL_CMD_OLED_DISPLAY           0x01
#define MCU_PROTOCOL_CMD_METER_DATA             0x02


////////////////////////////////////////////////////////////////////////////////
////

/*
    在 OLED 显示内容
    START:      0xAA
    COMMAND:    0x01
    DATA:       <x:uint8_t>, <y:uint8_t>, <content_size:uint8_t>, <content: const char*>
    CRC16:      <crc16:uint16_t>
*/
void mcu_protocol_oled_display(mcu_protocol_t * protocol, uint8_t x, uint8_t y, uint8_t content_size, const char* content);


/*
    打包电表数据
    START:      0xAA
    COMMAND:    0x02
    DATA:       <data_size:uint16_t>,<data:uint8_t[data_size]>
    CRC16:      <crc16:uint16_t>
*/
void mcu_protocol_meter_data(mcu_protocol_t * protocol, uint8_t* data, uint16_t data_size);

void mcu_protocol_send(mcu_protocol_t * protocol);

#endif /*INCLUDED_MCU_PROTOCOL_H*/
