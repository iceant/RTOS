#include <meter_protocol.h>

////////////////////////////////////////////////////////////////////////////////
////
static int meter_protocol_g_buffer_idx = 0;
meter_protocol_t meter_protocol_g_buffers[METER_PROTOCOL_COUNT];
static meter_protocol_datetime_t meter_protocol__datetime;

////////////////////////////////////////////////////////////////////////////////
////
meter_protocol_t* meter_protocol_next(void){
    int next_idx = meter_protocol_g_buffer_idx + 1;
    if(next_idx==METER_PROTOCOL_COUNT){
        next_idx = 0;
    }
    meter_protocol_g_buffer_idx = next_idx;
    return &meter_protocol_g_buffers[meter_protocol_g_buffer_idx];
}

meter_protocol_t* meter_protocol_current(void){
    return &meter_protocol_g_buffers[meter_protocol_g_buffer_idx];
}

////////////////////////////////////////////////////////////////////////////////
////

bool meter_protocol_dc_is_full(meter_protocol_t * protocol){
    return protocol->lines>=METER_PROTOCOL_DC_MAX_LINES;
}

int meter_protocol_dc_init(meter_protocol_t * protocol)
{
    protocol->lines = 0;
    METER_PROTOCOL_DC_TYPE_SET(protocol);
    METER_PROTOCOL_ENCRYPT_SET(protocol, 0x01);
    METER_PROTOCOL_DC_VOLTAGE_DECIMAL_SET(protocol, METER_PROTOCOL_DC_VOLTAGE_DECIMALS);
    METER_PROTOCOL_DC_CURRENT_DECIMAL_SET(protocol, METER_PROTOCOL_DC_CURRENT_DECIMALS);
    METER_PROTOCOL_DC_POWER_DECIMAL_SET(protocol, METER_PROTOCOL_DC_POWER_DECIMALS);
    METER_PROTOCOL_DC_ENERGY_DECIMAL_SET(protocol, METER_PROTOCOL_DC_ENERGY_DECIMALS);
    METER_PROTOCOL_DC_FACTOR_DECIMAL_SET(protocol, METER_PROTOCOL_DC_FACTOR_DECIMALS);
    METER_PROTOCOL_DC_LINES_SET(protocol, METER_PROTOCOL_DC_MAX_LINES);

    return 0;
}

int meter_protocol_dc_append(meter_protocol_t * protocol, meter_protocol_datetime_t* datetime
    , uint32_t voltage, uint32_t current, uint32_t power, uint32_t energy, uint32_t factor, uint32_t freq){
    METER_PROTOCOL_DC_LINE_FILL(protocol
                                , protocol->lines
                                , datetime->year
                                , datetime->month
                                , datetime->date
                                , datetime->hour
                                , datetime->min
                                , datetime->sec
                                , datetime->ms
                                , voltage, current, power, energy, factor, freq);
    protocol->lines = protocol->lines + 1;
    return 0;
}

//int meter_protocol_dc_sent(meter_protocol_t * protocol, meter_protocol_datetime_t* datetime)
//{
//    METER_PROTOCOL_DC_REP_DATETIME_SET(protocol
//                                    , datetime->year
//                                    , datetime->month
//                                    , datetime->date
//                                    , datetime->hour
//                                    , datetime->min
//                                    , datetime->sec
//                                    , datetime->ms);
//
//    uint32_t pkg_size = METER_PROTOCOL_DC_PKG_SIZE(protocol);
//    MCU_PROTOCOL_DU_SET(&mcu_protocol_g_tx_protocol, protocol->buffer, pkg_size);
//    mcu_protocol_send(&mcu_protocol_g_tx_protocol);
//
//    return 0;
//}

////////////////////////////////////////////////////////////////////////////////
////


void meter_protocol_datetime_save(meter_protocol_datetime_t * datetime)
{
    memcpy(&meter_protocol__datetime, datetime, sizeof(*datetime));
}

void meter_protocol_datetime_set(uint16_t year, uint8_t month, uint8_t date, uint8_t hour, uint8_t min, uint8_t sec, uint16_t ms)
{
    meter_protocol__datetime.year = year;
    meter_protocol__datetime.month = month;
    meter_protocol__datetime.date = date;
    meter_protocol__datetime.hour = hour;
    meter_protocol__datetime.min = min;
    meter_protocol__datetime.sec = sec;
    meter_protocol__datetime.ms = ms;
}

meter_protocol_datetime_t * meter_protocol_datetime_get(void)
{
    return &meter_protocol__datetime;
}
