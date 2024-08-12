#ifndef INCLUDED_DEVICE_PROTOCOL_H
#define INCLUDED_DEVICE_PROTOCOL_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /*INCLUDED_STDINT_H*/

#ifndef INCLUDED_SDK_HEX_H
#include <sdk_hex.h>
#endif /*INCLUDED_SDK_HEX_H*/



////////////////////////////////////////////////////////////////////////////////
////
#define DEVICE_PROTOCOL_BUFFER_SIZE                 4096
#define DEVICE_PROTOCOL_BUFFER_COUNT                2
#define DEVICE_PROTOCOL_DU_DC_LINE_ITEM_BYTES       33

typedef struct device_protocol_datetime_s{
    uint16_t year;
    uint8_t month;
    uint8_t date;
    uint8_t hour;
    uint8_t minute;
    uint8_t second;
    uint16_t ms;
}device_protocol_datetime_t;

typedef struct device_protocol_buffer_s{
    uint8_t buffer[DEVICE_PROTOCOL_BUFFER_SIZE];
}device_protocol_buffer_t;

typedef struct device_protocol_s{
    device_protocol_buffer_t buffers[DEVICE_PROTOCOL_BUFFER_COUNT];
    int write_idx;
    int read_idx;
    int lines;
}device_protocol_t;

////////////////////////////////////////////////////////////////////////////////
////

#define DEVICE_PROTOCOL_START_SET(b)                SDK_HEX_SET_UINT16_BE((b), 0, 0x2323)
#define DEVICE_PROTOCOL_CMD_SET(b,cmd)              SDK_HEX_SET_UINT8((b), 2, (cmd))
#define DEVICE_PROTOCOL_RSP_SET(b,rsp)              SDK_HEX_SET_UINT8((b), 3, (rsp))
#define DEVICE_PROTOCOL_ENCRYPT_SET(b, v)           SDK_HEX_SET_UINT8((b), 28, (v))
#define DEVICE_PROTOCOL_DU_SIZE_SET(b, v)           SDK_HEX_SET_UINT16_BE((b), 29, (v))
#define DEVICE_PROTOCOL_DU_TYPE_SET(b, v)           SDK_HEX_SET_UINT8((b), 40, (v))


#define DEVICE_PROTOCOL_COPY(b, idx, data, size)    memcpy(&(b)[idx], (data), (size))
#define DEVICE_PROTOCOL_DU_LINES_SET(b, idx, v)          SDK_HEX_SET_UINT8((b), idx, (v))
#define DEVICE_PROTOCOL_DATETIME_SET(b, idx, y, M, d, h, m, s, ms) \
do{                                                                \
    SDK_HEX_SET_UINT16_BE((b), idx, y); idx+=2;                    \
    SDK_HEX_SET_UINT8((b), idx, M); idx+=1;                        \
    SDK_HEX_SET_UINT8((b), idx, d); idx+=1;                        \
    SDK_HEX_SET_UINT8((b), idx, h); idx+=1;                        \
    SDK_HEX_SET_UINT8((b), idx, m); idx+=1;                        \
    SDK_HEX_SET_UINT8((b), idx, s); idx+=1;                        \
    SDK_HEX_SET_UINT16_BE((b), idx, ms); idx+=2;                   \
}while(0)

////////////////////////////////////////////////////////////////////////////////
////

void device_protocol_init(device_protocol_t* p);




#endif /*INCLUDED_DEVICE_PROTOCOL_H*/
