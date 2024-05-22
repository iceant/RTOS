#ifndef INCLUDED_BSP_USART1_H
#define INCLUDED_BSP_USART1_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /* INCLUDED_GD32F4XX_H */

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
typedef void (*BSP_USART1_RxHandler)(uint16_t data, void* userdata);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

void BSP_USART1_Init(void);

void BSP_USART1_SetRxHandler(BSP_USART1_RxHandler rxHandler, void* userdata);

void BSP_USART1_EnableRxIRQ(void);

void BSP_USART1_EnableDMATx(void);

void BSP_USART1_DMATx(uint8_t* txBuffer, uint32_t size);

void BSP_USART1_Send(uint8_t* data, int size);

#endif /* INCLUDED_BSP_USART0_H */