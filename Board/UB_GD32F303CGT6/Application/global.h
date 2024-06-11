#ifndef INCLUDED_GLOBAL_H
#define INCLUDED_GLOBAL_H

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
}global_t;

////////////////////////////////////////////////////////////////////////////////
////


void global_init(void);

global_t* global_get(void);

void global_set_cpuid(char* cpuid, int size);


#endif /*INCLUDED_GLOBAL_H*/
