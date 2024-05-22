#ifndef INCLUDED_CMQTTREL_H
#define INCLUDED_CMQTTREL_H


////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CMQTTREL_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTREL_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
}A7670C_CMQTTREL_Read_Response;

A7670C_Result A7670C_CMQTTREL_Read(A7670C_CMQTTREL_Read_Response* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTREL_Write_Response{
    A7670C_Response_Code code;
    int err_code;
    int client_index; /* 0 or 1*/
}A7670C_CMQTTREL_Write_Response;

A7670C_Result A7670C_CMQTTREL_Write(A7670C_CMQTTREL_Write_Response* result
        , int client_index
        , uint32_t timeout_ms);



#endif /*INCLUDED_CMQTTREL_H*/
