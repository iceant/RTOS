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

#ifndef INCLUDED_BSP_USART2_H
#include <bsp_usart2.h>
#endif /*INCLUDED_BSP_USART2_H*/

#ifndef INCLUDED_OLED_H
#include <OLED.h>
#endif /*INCLUDED_OLED_H*/

#ifndef INCLUDED_BSP_KEY_H
#include <bsp_key.h>
#endif /*INCLUDED_BSP_KEY_H*/

#ifndef INCLUDED_BSP_LOCK_H
#include <bsp_lock.h>
#endif /*INCLUDED_BSP_LOCK_H*/

#ifndef INCLUDED_BSP_LED1_H
#include <bsp_led1.h>
#endif /*INCLUDED_BSP_LED1_H*/

#ifndef INCLUDED_BSP_LED2_H
#include <bsp_led2.h>
#endif /*INCLUDED_BSP_LED2_H*/

#ifndef INCLUDED_BSP_LED3_H
#include <bsp_led3.h>
#endif /*INCLUDED_BSP_LED3_H*/

#ifndef INCLUDED_BSP_LED4_H
#include <bsp_led4.h>
#endif /*INCLUDED_BSP_LED4_H*/





////////////////////////////////////////////////////////////////////////////////
////
void Board_Init(void);

void Board_DeInit(void);

void Board_Reboot(void);

#endif /*INCLUDED_BOARD_H*/
