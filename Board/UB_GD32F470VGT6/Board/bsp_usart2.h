#ifndef INCLUDED_BSP_USART2_H
#define INCLUDED_BSP_USART2_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /* INCLUDED_GD32F4XX_H */

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
typedef void (*BSP_USART2_RxHandler)(uint16_t data, void* userdata);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

void BSP_USART2_Init(void);

void BSP_USART2_SetRxHandler(BSP_USART2_RxHandler rxHandler, void* userdata);

void BSP_USART2_EnableRxIRQ(void);

void BSP_USART2_EnableDMATx(void);

void BSP_USART2_DMATx(uint8_t* txBuffer, uint32_t size);

void BSP_USART2_Send(uint8_t* data, int size);

void BSP_USART2_Lock(void);

void BSP_USART2_UnLock(void);

#endif /*INCLUDED_BSP_USART2_H*/
