#ifndef INCLUDED_GLOBAL_H
#define INCLUDED_GLOBAL_H

#include <sdk_mp.h>

typedef struct global_datetime_s{
    int year;
    unsigned char month;
    unsigned char date;
    unsigned char hour;
    unsigned char min;
    unsigned char sec;
}global_datetime_t;

typedef struct global_s{
    char CPUID[25];
    global_datetime_t datetime;
    sdk_mp_t power_wms;
}global_t;

////////////////////////////////////////////////////////////////////////////////
////


void global_init(void);

global_t* global_get(void);

void global_set_cpuid(char* cpuid, int size);


#endif /*INCLUDED_GLOBAL_H*/
