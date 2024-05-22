#ifndef INCLUDED_HTTPHEAD_H
#define INCLUDED_HTTPHEAD_H

#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_HTTPHEAD_Exec_Response{
    A7670C_Response_Code code;
    int data_len;
    char data[2048]; /* 最多接收2K字节的字符串 */
}A7670C_HTTPHEAD_Exec_Response;

A7670C_Result A7670C_HTTPHEAD_Exec(A7670C_HTTPHEAD_Exec_Response* response, uint32_t timeout_ms);

#endif /* INCLUDED_HTTPHEAD_H */
