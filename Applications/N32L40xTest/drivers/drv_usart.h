#ifndef INCLUDED_DRV_USART_H
#define INCLUDED_DRV_USART_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /*INCLUDED_STDINT_H*/

#ifndef INCLUDED_STDDEF_H
#define INCLUDED_STDDEF_H
#include <stddef.h>
#endif /*INCLUDED_STDDEF_H*/

#ifndef INCLUDED_OS_RINGBUFFER_H
#include <os_ringbuffer.h>
#endif /*INCLUDED_OS_RINGBUFFER_H*/

////////////////////////////////////////////////////////////////////////////////
////

typedef enum dev_usart_recv_result{
    kDevUSARTRecvResult_CONTINUE = 0,
    kDevUSARTRecvResult_DONE = 1,
    kDevUSARTRecvResult_RESET = 2,
}dev_usart_recv_result;

typedef struct dev_usart_s{
    void* handle;
    int (*init)(void);
    int (*startup)(void);
    int (*send)(uint8_t * data, size_t size);
    dev_usart_recv_result (*recv)(os_ringbuffer_t* buffer);
}dev_usart_t;

////////////////////////////////////////////////////////////////////////////////
////





#endif /*INCLUDED_DRV_USART_H*/
