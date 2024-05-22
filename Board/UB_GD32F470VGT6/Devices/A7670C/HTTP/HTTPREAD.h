#ifndef INCLUDED_HTTPREAD_H
#define INCLUDED_HTTPREAD_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_HTTPREAD_Read_Response{
    A7670C_Response_Code code;
    int len;
}A7670C_HTTPREAD_Read_Response;

A7670C_Result A7670C_HTTPREAD_Read(A7670C_HTTPREAD_Read_Response* response, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////

typedef struct A7670C_HTTPREAD_Write_Response{
    A7670C_Response_Code code;
    int data_len;
    uint8_t data[10240]; /*Max size: 10K*/
}A7670C_HTTPREAD_Write_Response;

A7670C_Result A7670C_HTTPREAD_Write(A7670C_HTTPREAD_Write_Response* response
                                    , __OPTIONAL int start_offset /*0 default*/
                                    , int byte_size
                                    , uint32_t timeout_ms);




#endif /* INCLUDED_HTTPREAD_H */
