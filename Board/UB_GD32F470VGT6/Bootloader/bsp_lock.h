#ifndef INCLUDED_BSP_LOCK_H
#define INCLUDED_BSP_LOCK_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /*INCLUDED_GD32F4XX_H*/


////////////////////////////////////////////////////////////////////////////////
////
void BSP_Lock_Init(void);

void BSP_Lock_Enable(void);

void BSP_Lock_Disable(void);

int BSP_Lock_State(void);

#endif /*INCLUDED_BSP_LOCK_H*/
