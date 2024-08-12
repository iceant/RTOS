#include <mcu_protocol.h>
#include <string.h>
#include <bsp_usart1.h>


void mcu_protocol_oled_display(mcu_protocol_t * protocol, uint8_t x, uint8_t y
                               , uint8_t content_size, const char* content)
{
    int idx = 0;
    SDK_HEX_SET_UINT8(protocol->buffer, idx, MCU_PROTOCOL_START); idx+=1;
    SDK_HEX_SET_UINT8(protocol->buffer, idx, MCU_PROTOCOL_CMD_OLED_DISPLAY); idx+=1;
    SDK_HEX_SET_UINT8(protocol->buffer, idx, x); idx+=1;
    SDK_HEX_SET_UINT8(protocol->buffer, idx, y); idx+=1;
    SDK_HEX_SET_UINT8(protocol->buffer, idx, content_size); idx+=1;
    memcpy(protocol->buffer+idx, content, content_size); idx+=content_size;
    uint16_t crc = sdk_crc16(protocol->buffer, idx);
    SDK_HEX_SET_UINT16_LE(protocol->buffer, idx, crc); idx+=2;

    protocol->size = idx;
}

void mcu_protocol_meter_data(mcu_protocol_t * protocol, uint8_t* data, uint16_t data_size)
{
    int idx = 0;
    SDK_HEX_SET_UINT8(protocol->buffer, idx, MCU_PROTOCOL_START); idx+=1;
    SDK_HEX_SET_UINT8(protocol->buffer, idx, MCU_PROTOCOL_CMD_METER_DATA); idx+=1;
    SDK_HEX_SET_UINT16_BE(protocol->buffer, idx, data_size); idx+=2;
    memcpy(protocol->buffer+idx, data, data_size); idx+=data_size;

    uint16_t crc = sdk_crc16(protocol->buffer, idx);
    SDK_HEX_SET_UINT16_LE(protocol->buffer, idx, crc); idx+=2;

    protocol->size = idx;
}

void mcu_protocol_send(mcu_protocol_t * protocol)
{
    BSP_USART1_Send(protocol->buffer, protocol->size);
}

