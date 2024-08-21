#ifndef INCLUDED_BSP_USART0_H
#define INCLUDED_BSP_USART0_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /*INCLUDED_GD32F4XX_H*/

////////////////////////////////////////////////////////////////////////////////
////

typedef void (*BSP_USART0_RxHandler)(uint16_t data, void* userdata);

void BSP_USART0_Init(void);

void BSP_USART0_SetRxHandler(BSP_USART0_RxHandler rxHandler, void* userdata);

void BSP_USART0_EnableRxIRQ(void);


#endif /* INCLUDED_BSP_USART0_H */
