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





////////////////////////////////////////////////////////////////////////////////
////
void Board_Init(void);


#endif /*INCLUDED_BOARD_H*/
