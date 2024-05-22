#ifndef INCLUDED_CMQTTDISC_H
#define INCLUDED_CMQTTDISC_H


////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CMQTTDISC_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef enum{
    kA7670C_CMQTTDISC_State_CONNECTION=0,
    kA7670C_CMQTTDISC_State_DISCONNECTION=1,
}A7670C_CMQTTDISC_State;

typedef struct A7670C_CMQTTDISC_Read_Record{
    int client_index; /* 0 or 1*/
    A7670C_CMQTTDISC_State disc_state;
}A7670C_CMQTTDISC_Read_Record;

typedef struct A7670C_CMQTTDISC_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    A7670C_CMQTTDISC_Read_Record records[2];
}A7670C_CMQTTDISC_Read_Response;

A7670C_Result A7670C_CMQTTDISC_Read(A7670C_CMQTTDISC_Read_Response* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTDISC_Write_Response{
    A7670C_Response_Code code;
    int err_code;
    int client_index; /* 0 or 1*/
}A7670C_CMQTTDISC_Write_Response;

A7670C_Result A7670C_CMQTTDISC_Write(A7670C_CMQTTDISC_Write_Response* result
        , int client_index
        , int timeout /* 60s - 180s*/
        , uint32_t timeout_ms);


#endif /* INCLUDED_CMQTTDISC_H */
