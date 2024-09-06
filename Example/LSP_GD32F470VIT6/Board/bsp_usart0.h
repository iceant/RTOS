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
void BSP_USART0_SetOnRxDone(BSP_USART0_RxHandler rxHandler, void* userdata);

void BSP_USART0_EnableRxIRQ(void);

void BSP_USART0_DMATx(uint8_t* txBuffer, size_t size);
void BSP_USART0_DMARx(uint8_t* rxBuffer, size_t size);

void BSP_USART0_EnableDMARx(void);
void BSP_USART0_EnableDMATx(void);
void BSP_USART0_DMARxSetNumber(size_t number);

void BSP_USART0_Printf(const char* fmt, ...);

#endif /* INCLUDED_BSP_USART0_H */
