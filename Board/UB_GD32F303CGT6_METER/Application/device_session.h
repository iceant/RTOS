#ifndef INCLUDED_DEVICE_SESSION_H
#define INCLUDED_DEVICE_SESSION_H

#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /*INCLUDED_STDINT_H*/

#ifndef INCLUDED_STDBOOL_H
#define INCLUDED_STDBOOL_H
#include <stdbool.h>
#endif /*INCLUDED_STDBOOL_H*/

#ifndef INCLUDED_DEVICE_PROTOCOL_H
#include <device_protocol.h>
#endif /*INCLUDED_DEVICE_PROTOCOL_H*/


////////////////////////////////////////////////////////////////////////////////
////

typedef struct device_session_s{
    device_protocol_datetime_t datetime;
}device_session_t;


device_session_t * device_session_get(void);

void device_session_set_datetime(uint16_t year, uint8_t month, uint8_t date, uint8_t hour, uint8_t min, uint8_t sec);


#endif /*INCLUDED_DEVICE_SESSION_H*/
