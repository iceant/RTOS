#ifndef INCLUDED_BSP_LED1_H
#define INCLUDED_BSP_LED1_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /* INCLUDED_GD32F4XX_H */

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void BSP_LED1_Init(void);

void BSP_LED1_On(void);

void BSP_LED1_Off(void);

void BSP_LED1_Toggle(void);

#endif /*INCLUDED_BSP_LED1_H*/
