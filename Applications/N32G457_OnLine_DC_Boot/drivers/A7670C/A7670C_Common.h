#ifndef INCLUDED_A7670C_COMMON_H
#define INCLUDED_A7670C_COMMON_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_HW_USART_H
#include <hw_usart.h>
#endif /*INCLUDED_HW_USART_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef enum A7670C_RequestResult{
    kA7670C_RequestResult_OK=0,
    kA7670C_RequestResult_ERROR=-1,
}A7670C_RequestResult;

typedef struct A7670C_Device_S{
    hw_usart_t * usart;
}A7670C_Device_T;

////////////////////////////////////////////////////////////////////////////////
////

int A7670C_Init(A7670C_Device_T* device, hw_usart_t * usart);

A7670C_RequestResult A7670C_Request(A7670C_Device_T* device, uint32_t timeout_ms, const char* fmt, ...);



#endif /*INCLUDED_A7670C_COMMON_H*/
