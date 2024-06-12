#ifndef INCLUDED_BSP_KEY_H
#define INCLUDED_BSP_KEY_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /*INCLUDED_GD32F4XX_H*/

////////////////////////////////////////////////////////////////////////////////
////

typedef void (*BSP_Key_OnKeyDownHandler)(int state);

void BSP_Key_Init(BSP_Key_OnKeyDownHandler onKeyDownHandler);

void BSP_Key_SetHandler(BSP_Key_OnKeyDownHandler handler);


int BSP_Key_State(void);

#endif /*INCLUDED_BSP_KEY_H*/
