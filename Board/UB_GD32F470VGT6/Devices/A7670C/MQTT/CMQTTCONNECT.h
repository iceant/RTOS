#ifndef INCLUDED_CMQTTCONNECT_H
#define INCLUDED_CMQTTCONNECT_H


////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/


////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CMQTTCONNECT_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTCONNECT_Read_Record{
    int client_index; /* 0 or 1*/
    char server_addr[256]; /* tcp://ip:port */
    int keepalive_time; /* 1-64800s 18hours*/
    bool clean_session;
    char username[256];
    char password[256];
}A7670C_CMQTTCONNECT_Read_Record;

typedef struct A7670C_CMQTTCONNECT_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    A7670C_CMQTTCONNECT_Read_Record records[2];
}A7670C_CMQTTCONNECT_Read_Response;

A7670C_Result A7670C_CMQTTCONNECT_Read(A7670C_CMQTTCONNECT_Read_Response* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTCONNECT_Write_Response{
    A7670C_Response_Code code;
    int err_code;
    int client_index; /* 0 or 1*/
}A7670C_CMQTTCONNECT_Write_Response;

A7670C_Result A7670C_CMQTTCONNECT_Write(A7670C_CMQTTCONNECT_Write_Response* result
        , int client_index
        , const char* server_addr
        , int keepalive_time
        , bool clean_session
        , const char* username
        , const char* password
        , uint32_t timeout_ms);

#endif /* INCLUDED_CMQTTCONNECT_H */
