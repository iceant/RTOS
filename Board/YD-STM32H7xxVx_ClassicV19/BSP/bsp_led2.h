#ifndef INCLUDED_BSP_LED2_H
#define INCLUDED_BSP_LED2_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_STM32H7XX_H
#define INCLUDED_STM32H7XX_H
#include <stm32h7xx.h>
#endif /*INCLUDED_STM32H7XX_H*/

////////////////////////////////////////////////////////////////////////////////
////

void BSP_LED2_Init(void);

void BSP_LED2_On(void);
void BSP_LED2_Off(void);
void BSP_LED2_Toggle(void);

////////////////////////////////////////////////////////////////////////////////
////
#define LED_RED_On() BSP_LED2_On()
#define LED_RED_Off() BSP_LED2_Off()
#define LED_RED_Toggle() BSP_LED2_Toggle()

#endif /* INCLUDED_BSP_LED2_H */
