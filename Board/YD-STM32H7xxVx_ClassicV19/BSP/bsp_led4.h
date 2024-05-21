#ifndef INCLUDED_BSP_LED4_H
#define INCLUDED_BSP_LED4_H
////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_STM32H7XX_H
#define INCLUDED_STM32H7XX_H
#include <stm32h7xx.h>
#endif /*INCLUDED_STM32H7XX_H*/

////////////////////////////////////////////////////////////////////////////////
////

void BSP_LED4_Init(void);

void BSP_LED4_On(void);
void BSP_LED4_Off(void);
void BSP_LED4_Toggle(void);

////////////////////////////////////////////////////////////////////////////////
////

#define LED_YELLOW_On() BSP_LED4_On()
#define LED_YELLOW_Off() BSP_LED4_Off()
#define LED_YELLOW_Toggle() BSP_LED4_Toggle()


#endif /* INCLUDED_BSP_LED4_H */
