#ifndef INCLUDED_CNTP_H
#define INCLUDED_CNTP_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CNTP_Read_Response{
    A7670C_Response_Code code;
    char host[255];
    int8_t timezone; /* -96 ~ 96 */
}A7670C_CNTP_Read_Response;

A7670C_Result A7670C_CNTP_Read(A7670C_CNTP_Read_Response *response, os_size_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CNTP_Write_Response{
    A7670C_Response_Code code;
}A7670C_CNTP_Write_Response;

A7670C_Result A7670C_CNTP_Write(A7670C_CNTP_Write_Response *response, const char* host, int8_t timezone, os_size_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CNTP_Exec_Response{
    A7670C_Response_Code code;
    int err_code;
}A7670C_CNTP_Exec_Response;

A7670C_Result A7670C_CNTP_Exec(A7670C_CNTP_Exec_Response* result, uint32_t timeout_ms);


#endif /*INCLUDED_CNTP_H*/
