#ifndef INCLUDED_BSP_USART0_H
#define INCLUDED_BSP_USART0_H


////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_GD32F30X_H
#define INCLUDED_GD32F30X_H
#include <gd32f30x.h>
#endif /*INCLUDED_GD32F30X_H*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
typedef void (*BSP_USART0_RxHandler)(uint16_t data, void* userdata);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

void BSP_USART0_Init(void);

void BSP_USART0_DeInit(void);

void BSP_USART0_SetRxHandler(BSP_USART0_RxHandler rxHandler, void* userdata);

void BSP_USART0_EnableRxIRQ(void);

void BSP_USART0_EnableDMATx(void);

void BSP_USART0_DMATx(uint8_t* txBuffer, uint32_t size);

void BSP_USART0_Send(uint8_t* data, int size);

void BSP_USART0_Lock(void);

void BSP_USART0_UnLock(void);

#endif /*INCLUDED_BSP_USART0_H*/
