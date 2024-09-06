#ifndef INCLUDED_BOARD_H
#define INCLUDED_BOARD_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /*INCLUDED_GD32F4XX_H*/

#ifndef INCLUDED_BSP_RETARGET_H
#include <bsp_retarget.h>
#endif /*INCLUDED_BSP_RETARGET_H*/

#ifndef INCLUDED_BSP_USART0_H
#include <bsp_usart0.h>
#endif /*INCLUDED_BSP_USART0_H*/

#ifndef INCLUDED_BSP_PULSE_H
#include <bsp_pulse.h>
#endif /*INCLUDED_BSP_PULSE_H*/



////////////////////////////////////////////////////////////////////////////////
////

void Board_Init(void);


#endif /* INCLUDED_BOARD_H */
