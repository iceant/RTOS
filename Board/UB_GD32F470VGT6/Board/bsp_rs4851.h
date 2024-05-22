#ifndef INCLUDED_BSP_RS4851_H
#define INCLUDED_BSP_RS4851_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /* INCLUDED_GD32F4XX_H */

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
typedef void (*BSP_RS4851_RxHandler)(uint16_t data, void* userdata);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

void BSP_RS4851_Init(int BaudRate);

void BSP_RS4851_SetRxHandler(BSP_RS4851_RxHandler rxHandler, void* userdata);

void BSP_RS4851_EnableRxIRQ(void);

void BSP_RS4851_EnableDMATx(void);

void BSP_RS4851_DMATx(uint8_t* txBuffer, uint32_t size);

void BSP_RS4851_Send(uint8_t* data, size_t size);

#endif /*INCLUDED_BSP_RS4851_H*/


