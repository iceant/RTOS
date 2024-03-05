#ifndef INCLUDED_HW_USART_H
#define INCLUDED_HW_USART_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_N32G45X_H
#define INCLUDED_N32G45X_H
#include <n32g45x.h>
#endif /*INCLUDED_N32G45X_H*/

#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

#ifndef INCLUDED_OS_RINGBUFFER_H
#include <os_ringbuffer.h>
#endif /*INCLUDED_OS_RINGBUFFER_H*/



////////////////////////////////////////////////////////////////////////////////
////
typedef enum HW_USART_RecvResult{
    kHW_USART_RecvResult_DONE = 0,
    kHW_USART_RecvResult_SKIP = 1,
    kHW_USART_RecvResult_CONTINUE = 2,
}HW_USART_RecvResult;

typedef struct hw_usart_s{
    void* handle;
    void (*init)(void);
    void (*startup)(void);
    void (*stop)(void);
    int  (*send)(uint8_t * data, os_size_t data_size);
    HW_USART_RecvResult  (*recv)(os_ringbuffer_t *buffer);
}hw_usart_t;

#endif /*INCLUDED_HW_USART_H*/


