#ifndef INCLUDED_BSP_USART1_H
#define INCLUDED_BSP_USART1_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_STM32H7XX_H
#define INCLUDED_STM32H7XX_H
#include <stm32h7xx.h>
#endif /*INCLUDED_STM32H7XX_H*/

#ifndef INCLUDED_CPU_SPINLOCK_H
#include <cpu_spinlock.h>
#endif /*INCLUDED_CPU_SPINLOCK_H*/



////////////////////////////////////////////////////////////////////////////////
////

#define BSP_USART1_OK       (0)
#define BSP_USART1_ERROR    (-1)

extern UART_HandleTypeDef BSP_USART1_Handle;

////////////////////////////////////////////////////////////////////////////////
////
typedef void (*BSP_USART1_RxHandler)(uint8_t data, void* ud);

////////////////////////////////////////////////////////////////////////////////
////

int BSP_USART1_Init(void);

void BSP_USART1_DeInit(void);

void BSP_USART1_SendByte(uint8_t ch);

void BSP_USART1_EnableDMATx(void);
void BSP_USART1_EnableRxIRQ(void);

int BSP_USART1_DMATx(uint8_t* data, size_t size);
int BSP_USART1_DMATxString(const char* message);

void BSP_USART1_SetRxHandler(BSP_USART1_RxHandler rxHandler, void* userdata);

int BSP_USART1_Printf(const char* format, ...);



#endif /* INCLUDED_BSP_USART1_H */
