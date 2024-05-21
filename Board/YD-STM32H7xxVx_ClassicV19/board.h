#ifndef INCLUDED_BOARD_H
#define INCLUDED_BOARD_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_STM32H7XX_H
#define INCLUDED_STM32H7XX_H
#include <stm32h7xx.h>
#endif /*INCLUDED_STM32H7XX_H*/

#ifndef INCLUDED_BSP_USART1_H
#include <bsp_usart1.h>
#endif /*INCLUDED_BSP_USART1_H*/

#ifndef INCLUDED_BSP_TIMDELAY_H
#include <bsp_timdelay.h>
#endif /*INCLUDED_BSP_TIMDELAY_H*/

#ifndef INCLUDED_BSP_LED2_H
#include <bsp_led2.h>
#endif /*INCLUDED_BSP_LED2_H*/

#ifndef INCLUDED_BSP_LED3_H
#include <bsp_led3.h>
#endif /*INCLUDED_BSP_LED3_H*/

#ifndef INCLUDED_BSP_LED4_H
#include <bsp_led4.h>
#endif /*INCLUDED_BSP_LED4_H*/

#ifndef INCLUDED_BSP_LED5_H
#include <bsp_led5.h>
#endif /*INCLUDED_BSP_LED5_H*/




////////////////////////////////////////////////////////////////////////////////
////

void Board_Init(void);

#endif /* INCLUDED_BOARD_H */
