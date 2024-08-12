#include <device_session.h>

static device_session_t device_session__instance={0};


device_session_t * device_session_get(void){
    return &device_session__instance;
}

void device_session_set_datetime(uint16_t year, uint8_t month, uint8_t date, uint8_t hour, uint8_t min, uint8_t sec)
{
    device_session__instance.datetime.year = year;
    device_session__instance.datetime.month = month;
    device_session__instance.datetime.date = date;
    device_session__instance.datetime.hour = hour;
    device_session__instance.datetime.minute = min;
    device_session__instance.datetime.second = sec;
}