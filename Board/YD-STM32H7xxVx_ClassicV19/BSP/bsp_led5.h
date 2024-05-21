#ifndef INCLUDED_BSP_LED5_H
#define INCLUDED_BSP_LED5_H
////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_STM32H7XX_H
#define INCLUDED_STM32H7XX_H
#include <stm32h7xx.h>
#endif /*INCLUDED_STM32H7XX_H*/

////////////////////////////////////////////////////////////////////////////////
////

void BSP_LED5_Init(void);

void BSP_LED5_On(void);
void BSP_LED5_Off(void);
void BSP_LED5_Toggle(void);

////////////////////////////////////////////////////////////////////////////////
////

#define LED_BLUE_On() BSP_LED5_On()
#define LED_BLUE_Off() BSP_LED5_Off()
#define LED_BLUE_Toggle() BSP_LED5_Toggle()

#endif /* INCLUDED_BSP_LED5_H */
