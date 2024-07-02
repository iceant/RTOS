#ifndef INCLUDED_BOARD_H
#define INCLUDED_BOARD_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /*INCLUDED_GD32F4XX_H*/

#ifndef INCLUDED_BSP_USART0_H
#include <bsp_usart0.h>
#endif /*INCLUDED_BSP_USART0_H*/

#ifndef INCLUDED_BSP_A7670C_H
#include <bsp_a7670c.h>
#endif /*INCLUDED_BSP_A7670C_H*/

////////////////////////////////////////////////////////////////////////////////
////
void Board_Init(void);

void Board_DeInit(void);

void Board_Reboot(void);

#endif /*INCLUDED_BOARD_H*/
