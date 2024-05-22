#ifndef INCLUDED_CMQTTSUB_H
#define INCLUDED_CMQTTSUB_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CMQTTSUB_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTSUB_Write_Response{
    A7670C_Response_Code code;
    int err_code;
    int client_index; /* 0 or 1*/
}A7670C_CMQTTSUB_Write_Response;

A7670C_Result A7670C_CMQTTSUB_Write(A7670C_CMQTTSUB_Write_Response* result
        , int client_index
        , A7670C_Bool dup
        , uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////

A7670C_Result A7670C_CMQTTSUB_Write2(A7670C_CMQTTSUB_Write_Response* result
        , int client_index
        , const char* topic
        , A7670C_Qos qos
        , A7670C_Bool dup
        , uint32_t timeout_ms);

#endif /* INCLUDED_CMQTTSUB_H */
