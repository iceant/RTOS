#ifndef INCLUDED_USE_USART0_H
#define INCLUDED_USE_USART0_H

#ifndef INCLUDED_SDK_RINGBUFFER_H
#include <sdk_ringbuffer.h>
#endif /*INCLUDED_SDK_RINGBUFFER_H*/

////////////////////////////////////////////////////////////////////////////////
////


void USE_USART0_Init(void);

sdk_ringbuffer_t * USE_USART0_GetRxBuffer(void);

#endif /*INCLUDED_USE_USART0_H*/
