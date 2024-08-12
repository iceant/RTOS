#ifndef INCLUDED_BSP_TIM2_H
#define INCLUDED_BSP_TIM2_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F30X_H
#define INCLUDED_GD32F30X_H
#include <gd32f30x.h>
#endif /*INCLUDED_GD32F30X_H*/


////////////////////////////////////////////////////////////////////////////////
////

typedef void (*BSP_TIM2_Handler)(uint32_t tick);

extern  uint32_t volatile BSP_TIM2__Ticks;

void BSP_TIM2_Init(void);

void BSP_TIM2_DeInit(void);

void BSP_TIM2_SetHandler(BSP_TIM2_Handler handler);

#endif /*INCLUDED_BSP_TIM2_H*/
