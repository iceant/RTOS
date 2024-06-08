#ifndef INCLUDED_CMQTTCFG_H
#define INCLUDED_CMQTTCFG_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CMQTTCFG_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTCFG_Read_Record{
    int client_index; /* 0 or 1*/
    bool checkUTF8_flag;
    int optimeout_val;
}A7670C_CMQTTCFG_Read_Record;

typedef struct A7670C_CMQTTCFG_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    A7670C_CMQTTCFG_Read_Record records[2];
}A7670C_CMQTTCFG_Read_Response;

A7670C_Result A7670C_CMQTTCFG_Read(A7670C_CMQTTCFG_Read_Response* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTCFG_Write_Response{
    A7670C_Response_Code code;
}A7670C_CMQTTCFG_Write_Response;

A7670C_Result A7670C_CMQTTCFG_SetUTF8(A7670C_CMQTTCFG_Write_Response* result
        , int client_index
        , bool checkUTF8_flag
        , uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CMQTTCFG_SetTimeout(A7670C_CMQTTCFG_Write_Response* result
        , int client_index
        , int optimeout_val
        , uint32_t timeout_ms);

#endif /* INCLUDED_CMQTTCFG_H */
