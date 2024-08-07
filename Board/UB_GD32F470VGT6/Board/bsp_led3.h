#ifndef INCLUDED_BSP_LED3_H
#define INCLUDED_BSP_LED3_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /* INCLUDED_GD32F4XX_H */

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void BSP_LED3_Init(void);

void BSP_LED3_On(void);

void BSP_LED3_Off(void);

void BSP_LED3_Toggle(void);

#endif /*INCLUDED_BSP_LED3_H*/
