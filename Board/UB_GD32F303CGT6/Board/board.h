#ifndef INCLUDED_BOARD_H
#define INCLUDED_BOARD_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef GD32F30X_XD
#define GD32F30X_XD
#endif

#ifndef INCLUDED_GD32F30X_H
#define INCLUDED_GD32F30X_H
#include <gd32f30x.h>
#endif /*INCLUDED_GD32F30X_H*/


#ifndef INCLUDED_BSP_USART1_H
#include <bsp_usart1.h>
#endif /*INCLUDED_BSP_USART1_H*/

#ifndef INCLUDED_BSP_CAN0_H
#include <bsp_can0.h>
#endif /*INCLUDED_BSP_CAN0_H*/

#ifndef INCLUDED_GD32F30X_LIBOPT_H
#include <gd32f30x_libopt.h>
#endif /*INCLUDED_GD32F30X_LIBOPT_H*/

#ifndef INCLUDED_BSP_TIM6_H
#include <bsp_tim6.h>
#endif /*INCLUDED_BSP_TIM6_H*/


#ifndef INCLUDED_BSP_USART0_H
#include <bsp_usart0.h>
#endif /*INCLUDED_BSP_USART0_H*/

#ifndef INCLUDED_BSP_TIM2_H
#include <bsp_tim2.h>
#endif /*INCLUDED_BSP_TIM2_H*/

#ifndef INCLUDED_BSP_PULSE_H
#include <bsp_pulse.h>
#endif /*INCLUDED_BSP_PULSE_H*/



////////////////////////////////////////////////////////////////////////////////
////
void Board_Init(void);

void Board_DeInit(void);

void Board_Reboot(void);

#endif /*INCLUDED_BOARD_H*/
