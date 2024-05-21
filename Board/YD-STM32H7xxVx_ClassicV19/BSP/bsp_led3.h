#ifndef INCLUDED_BSP_LED3_H
#define INCLUDED_BSP_LED3_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_STM32H7XX_H
#define INCLUDED_STM32H7XX_H
#include <stm32h7xx.h>
#endif /*INCLUDED_STM32H7XX_H*/

////////////////////////////////////////////////////////////////////////////////
////

void BSP_LED3_Init(void);

void BSP_LED3_On(void);
void BSP_LED3_Off(void);
void BSP_LED3_Toggle(void);

////////////////////////////////////////////////////////////////////////////////
////

#define LED_GREEN_On() BSP_LED3_On()
#define LED_GREEN_Off() BSP_LED3_Off()
#define LED_GREEN_Toggle() BSP_LED3_Toggle()


#endif /* INCLUDED_BSP_LED3_H */
