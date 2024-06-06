#ifndef INCLUDED_GLOBAL_H
#define INCLUDED_GLOBAL_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct global_datetime_s{
    uint16_t    year;
    uint8_t     month;
    uint8_t     date;
    uint8_t     hour;
    uint8_t     min;
    uint8_t     sec;
}global_datetime_t;

////////////////////////////////////////////////////////////////////////////////
////
extern global_datetime_t global_g_datetime;




#endif /*INCLUDED_GLOBAL_H*/
