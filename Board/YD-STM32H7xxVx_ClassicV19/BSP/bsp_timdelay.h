#ifndef INCLUDED_BSP_TIMDELAY_H
#define INCLUDED_BSP_TIMDELAY_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_STM32H7XX_H
#define INCLUDED_STM32H7XX_H
#include <stm32h7xx.h>
#endif /*INCLUDED_STM32H7XX_H*/

////////////////////////////////////////////////////////////////////////////////
////
void BSP_TIMDelay_Init(void);

void BSP_TIMDelay_DeInit(void);

void BSP_TIMDelay_Us(volatile uint32_t us);
void BSP_TIMDelay_Ms(volatile uint32_t ms);

#endif /* INCLUDED_BSP_TIMDELAY_H */
