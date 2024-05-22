#ifndef INCLUDED_CMQTTACCQ_H
#define INCLUDED_CMQTTACCQ_H


////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef enum {
    kA7670C_CMQTTACCQ_ServerType_TCP=0,
    kA7670C_CMQTTACCQ_ServerType_SSL_TLS=1,
}A7670C_CMQTTACCQ_ServerType;



////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CMQTTACCQ_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTACCQ_Read_Record{
    int client_index; /* 0 or 1*/
    char client_id[128];
    A7670C_CMQTTACCQ_ServerType server_type;
}A7670C_CMQTTACCQ_Read_Record;

typedef struct A7670C_CMQTTACCQ_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    A7670C_CMQTTACCQ_Read_Record records[2];
}A7670C_CMQTTACCQ_Read_Response;

A7670C_Result A7670C_CMQTTACCQ_Read(A7670C_CMQTTACCQ_Read_Response* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTACCQ_Write_Response{
    A7670C_Response_Code code;
    int err_code;
    int client_index; /* 0 or 1*/
}A7670C_CMQTTACCQ_Write_Response;

A7670C_Result A7670C_CMQTTACCQ_Write(A7670C_CMQTTACCQ_Write_Response* result
                                     , int client_index
                                     , const char* client_id
                                     , A7670C_CMQTTACCQ_ServerType ServerType, uint32_t timeout_ms);


#endif /*INCLUDED_CMQTTACCQ_H*/
