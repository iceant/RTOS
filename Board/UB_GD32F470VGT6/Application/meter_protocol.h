#ifndef INCLUDED_METER_PROTOCOL_H
#define INCLUDED_METER_PROTOCOL_H

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
#define METER_PROTOCOL_BUFFER_SIZE 4096

/* 2个 Buffer,写满一个发送，然后切换到另一个继续写 */
#define METER_PROTOCOL_COUNT       2

/*
 START: 0x23 0x23

 */

typedef struct meter_protocol_s{
    uint8_t buffer[METER_PROTOCOL_BUFFER_SIZE];
    uint8_t lines; /*记录数据包内包含的数据条数，每种数据类型一行的字节数不一样*/
}meter_protocol_t;

typedef struct meter_protocol_heartbeat_s{
    uint8_t buffer[73];
}meter_protocol_heartbeat_t;

typedef struct meter_protocol_datetime_s{
    uint16_t year;
    uint8_t  month;
    uint8_t  date;
    uint8_t  hour;
    uint8_t  min;
    uint8_t  sec;
    uint16_t ms;
}meter_protocol_datetime_t;

////////////////////////////////////////////////////////////////////////////////
////
extern meter_protocol_t meter_protocol_g_buffers[METER_PROTOCOL_COUNT];

////////////////////////////////////////////////////////////////////////////////
//// UTILS

#define METER_PROTOCOL_START_SET(P)             SDK_HEX_SET_UINT16_BE((P)->buffer, 0, 0x2323)

#define METER_PROTOCOL_CMD_SET(P, CMD)          SDK_HEX_SET_UINT8((P)->buffer, 2, (CMD))
#define METER_PROTOCOL_CMD_GET(P)               SDK_HEX_GET_UINT8((P)->buffer, 2)

#define METER_PROTOCOL_RESP_SET(P, RESP)        SDK_HEX_SET_UINT8((P)->buffer, 3, (RESP))
#define METER_PROTOCOL_RESP_GET(P)              SDK_HEX_GET_UINT8((P)->buffer, 3)

#define METER_PROTOCOL_HWID_SET(P, HWID, SZ)    memcpy((P)->buffer+4, (HWID), (SZ))
#define METER_PROTOCOL_HWID_GET(P)              ((P)->buffer+4)

#define METER_PROTOCOL_ENCRYPT_SET(P, ENCRYPT)  SDK_HEX_SET_UINT8((P)->buffer, 28, (ENCRYPT))
#define METER_PROTOCOL_ENCRYPT_GET(P)           SDK_HEX_GET_UINT8((P)->buffer, 28)

#define METER_PROTOCOL_DUSIZE_SET(P, DUSIZE)    SDK_HEX_SET_UINT16_BE((P)->buffer, 29, (DUSIZE))
#define METER_PROTOCOL_DUSIZE_GET(P)            SDK_HEX_GET_UINT16_BE((P)->buffer, 29)

#define METER_PROTOCOL_DATETIME_SET(P, IDX, YEAR, MONTH, DATE, HOUR, MIN, SEC, MS) \
    SDK_HEX_SET_UINT16_BE((P)->buffer, (IDX), YEAR);                               \
    SDK_HEX_SET_UINT8((P)->buffer, (IDX)+2, MONTH);                                \
    SDK_HEX_SET_UINT8((P)->buffer, (IDX)+3, DATE);                                 \
    SDK_HEX_SET_UINT8((P)->buffer, (IDX)+4, HOUR);                                 \
    SDK_HEX_SET_UINT8((P)->buffer, (IDX)+5, MIN);                                  \
    SDK_HEX_SET_UINT8((P)->buffer, (IDX)+6, SEC);                                  \
    SDK_HEX_SET_UINT16_BE((P)->buffer, (IDX)+7, MS)

////////////////////////////////////////////////////////////////////////////////
//// LOGIN
#define METER_PROTOCOL_LOGIN_TYPE_SET(P) \
    METER_PROTOCOL_CMD_SET(P, 0x01)

#define METER_PROTOCOL_LOGIN_DATETIME_SET(P, YEAR, MONTH, DATE, HOUR, MIN, SEC, MS) \
    METER_PROTOCOL_DATETIME_SET(P, 31, YEAR, MONTH, DATE, HOUR, MIN, SEC, MS)

#define METER_PROTOCOL_LOGIN_KEY_SET(P, KEY, KEY_SZ) \
    memcpy((P)->buffer + 40, KEY, KEY_SZ)

#define METER_PROTOCOL_LOGIN_ICCID_SET(P, ICCID, ICCID_SZ) \
    memcpy((P)->buffer + 72, ICCID, ICCID_SZ)

#define METER_PROTOCOL_LOGIN_IMEI_SET(P, IMEI, IMEI_SZ) \
    memcpy((P)->buffer + 92, IMEI, IMEI_SZ)

#define METER_PROTOCOL_LOGIN_GPS_SET(P, GPS, GPS_SZ) \
    memcpy((P)->buffer + 107, GPS, GPS_SZ)

#define METER_PROTOCOL_LOGIN_CRC_SET(P, CRC) \
    SDK_HEX_SET_UINT16_LE((P)->buffer, 135, CRC)

////////////////////////////////////////////////////////////////////////////////
//// DC Data

#define METER_PROTOCOL_DC_MAX_LINES         100
#define METER_PROTOCOL_DC_VOLTAGE_DECIMALS  4
#define METER_PROTOCOL_DC_CURRENT_DECIMALS  3
#define METER_PROTOCOL_DC_POWER_DECIMALS    4
#define METER_PROTOCOL_DC_ENERGY_DECIMALS   7
#define METER_PROTOCOL_DC_FACTOR_DECIMALS   2

#define METER_PROTOCOL_DC_REP_DATETIME_SET(P, YEAR, MONTH, DATE, HOUR, MIN, SEC, MS) \
    METER_PROTOCOL_DATETIME_SET(P, 31, YEAR, MONTH, DATE, HOUR, MIN, SEC, MS)

#define METER_PROTOCOL_DC_TYPE_SET(P) \
    METER_PROTOCOL_START_SET(P);  \
    METER_PROTOCOL_CMD_SET(P, 0x03);  \
    METER_PROTOCOL_RESP_SET(P, 0xFE); \
    SDK_HEX_SET_UINT8((P)->buffer, 40, 0x03)

/*电压小数点位数*/
#define METER_PROTOCOL_DC_VOLTAGE_DECIMAL_SET(P, D) \
    SDK_HEX_SET_UINT8((P)->buffer, 41, (D))

/*电流小数点位数*/
#define METER_PROTOCOL_DC_CURRENT_DECIMAL_SET(P, C) \
    SDK_HEX_SET_UINT8((P)->buffer, 42, (C))

/*功率小数点位数*/
#define METER_PROTOCOL_DC_POWER_DECIMAL_SET(P, PWR) \
    SDK_HEX_SET_UINT8((P)->buffer, 43, (PWR))

/*电量小数点位数*/
#define METER_PROTOCOL_DC_ENERGY_DECIMAL_SET(P, E) \
    SDK_HEX_SET_UINT8((P)->buffer, 44, (E))

/*功率因素小数点位数*/
#define METER_PROTOCOL_DC_FACTOR_DECIMAL_SET(P, F) \
    SDK_HEX_SET_UINT8((P)->buffer, 45, (F))

/*行数*/
#define METER_PROTOCOL_DC_LINES_SET(P, L) \
    SDK_HEX_SET_UINT8((P)->buffer, 46, (L))

#define METER_PROTOCOL_DC_LINES_GET(P) \
    SDK_HEX_GET_UINT8((P)->buffer, 46)

/*填充一行数据*/
#define METER_PROTOCOL_DC_LINE_FILL(P, LINE, YEAR, MONTH, DATE, HOUR, MIN, SEC, MS, VOL, CUR, PWR, ENG, FAC, FREQ) \
do{                                                                                                                \
    int idx = (LINE) * 33; /*一行的字节数量*/                                                                         \
    METER_PROTOCOL_DATETIME_SET(P, idx, YEAR, MONTH, DATE, HOUR, MIN, SEC, MS); idx+=9;                            \
    SDK_HEX_SET_UINT32_BE((P)->buffer, idx, VOL); idx+=4;                                                          \
    SDK_HEX_SET_UINT32_BE((P)->buffer, idx, CUR); idx+=4;                                                          \
    SDK_HEX_SET_UINT32_BE((P)->buffer, idx, PWR); idx+=4;                                                          \
    SDK_HEX_SET_UINT32_BE((P)->buffer, idx, ENG); idx+=4;                                                          \
    SDK_HEX_SET_UINT32_BE((P)->buffer, idx, FAC); idx+=4;                                                          \
    SDK_HEX_SET_UINT32_BE((P)->buffer, idx, FREQ); idx+=4;                                                         \
}while(0)

#define METER_PROTOCOL_DC_CRC_SET(P, CRC) \
    SDK_HEX_SET_UINT16_LE((P)->buffer, (METER_PROTOCOL_DC_LINES_GET(P) * 33 + 47), (CRC))

#define METER_PROTOCOL_DC_CRC_GET(P) \
    SDK_HEX_GET_UINT16_LE((P)->buffer, (METER_PROTOCOL_DC_LINES_GET(P) * 33 + 47))

#define METER_PROTOCOL_DC_PKG_SIZE(P) \
    (METER_PROTOCOL_DC_LINES_GET(P) * 33 + 49)

////////////////////////////////////////////////////////////////////////////////
//// Heartbeat
#define METER_PROTOCOL_HB_TYPE_SET(P) \
    METER_PROTOCOL_START_SET(P);      \
    METER_PROTOCOL_CMD_SET(P, 0x03);  \
    METER_PROTOCOL_RESP_SET(P, 0xFE); \
    SDK_HEX_SET_UINT8((P)->buffer, 40, 0x09); \
    SDK_HEX_SET_UINT8((P)->buffer, 41, 0xBB)

#define METER_PROTOCOL_HB_REP_DATETIME_SET(P, YEAR, MONTH, DATE, HOUR, MIN, SEC, MS) \
    METER_PROTOCOL_DATETIME_SET(P, 31, YEAR, MONTH, DATE, HOUR, MIN, SEC, MS)

#define METER_PROTOCOL_HB_PILE_STATUS_SET(P, STATUS) \
    SDK_HEX_SET_UINT8((P)->buffer, 42, STATUS)

#define METER_PROTOCOL_HB_PILE_STATUS_GET(P) \
    SDK_HEX_GET_UINT8((P)->buffer, 42)


#define METER_PROTOCOL_HB_GPS_SET(P, GPS, GPS_SZ) \
    memcpy((P)->buffer+43, (GPS), (GPS_SZ))

#define METER_PROTOCOL_HB_GPS_GET(P) \
    ((P)->buffer+43)

#define METER_PROTOCOL_HB_CRC_SET(P, CRC) \
    SDK_HEX_SET_UINT16_LE((P)->buffer, 71 ,(CRC))

#define METER_PROTOCOL_HB_CRC_GET(P) \
    SDK_HEX_GET_UINT16_LE((P)->buffer, 71)

////////////////////////////////////////////////////////////////////////////////
////
int meter_protocol_dc_init(meter_protocol_t * protocol);

int meter_protocol_dc_append(meter_protocol_t * protocol, meter_protocol_datetime_t* datetime
        , uint32_t voltage, uint32_t current, uint32_t power, uint32_t energy, uint32_t factor, uint32_t freq);

//int meter_protocol_dc_sent(meter_protocol_t * protocol, meter_protocol_datetime_t* datetime);

meter_protocol_t* meter_protocol_current(void);

meter_protocol_t* meter_protocol_next(void);

bool meter_protocol_dc_is_full(meter_protocol_t * protocol);

////////////////////////////////////////////////////////////////////////////////
////
void meter_protocol_datetime_save(meter_protocol_datetime_t * datetime);
void meter_protocol_datetime_set(uint16_t year, uint8_t month, uint8_t date, uint8_t hour, uint8_t min, uint8_t sec, uint16_t ms);
meter_protocol_datetime_t * meter_protocol_datetime_get(void);


#endif /*INCLUDED_METER_PROTOCOL_H*/
