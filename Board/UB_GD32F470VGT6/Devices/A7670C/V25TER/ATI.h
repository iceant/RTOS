#ifndef INCLUDED_ATI_H
#define INCLUDED_ATI_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_ATI_Response_GCAP{
    char name[12];
}A7670C_ATI_Response_GCAP;

typedef struct A7670C_ATI_Response {
    char Manufacturer[32];
    char Model[32];
    char Revision[32];
    char IMEI[16];
    int GCAP_Size;
    A7670C_ATI_Response_GCAP GCAP[7]; /* +CGSMG,+FCLASS,+DS,+ES,+CIS707-A,+CIS-856,+MS*/
}A7670C_ATI_Response;

A7670C_Result A7670C_ATI_Read(A7670C_ATI_Response* response, os_uint_t timeout_ms);


#endif /*INCLUDED_ATI_H*/
