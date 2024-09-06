#ifndef INCLUDED_BSP_PULSE_H
#define INCLUDED_BSP_PULSE_H

#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /*INCLUDED_GD32F4XX_H*/

/* -------------------------------------------------------------------------------------------------------------- */
/*  */

void BSP_Pulse_Init(void);

void BSP_Pulse_Timer_Config(uint16_t prescaler, uint16_t period, uint32_t pulse);

void BSP_Pulse_Trigger(void);

void BSP_Pulse_Trigger_With(uint16_t period, uint32_t pulse);

#endif /* INCLUDED_BSP_PULSE_H */
