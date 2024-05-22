#ifndef INCLUDED_BSP_RS4852_H
#define INCLUDED_BSP_RS4852_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /* INCLUDED_GD32F4XX_H */

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
typedef void (*BSP_RS4852_RxHandler)(uint16_t data, void* userdata);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

void BSP_RS4852_Init(int BaudRate);

void BSP_RS4852_SetRxHandler(BSP_RS4852_RxHandler rxHandler, void* userdata);

void BSP_RS4852_EnableRxIRQ(void);

void BSP_RS4852_EnableDMATx(void);

void BSP_RS4852_DMATx(uint8_t* txBuffer, uint32_t size);

void BSP_RS4852_Send(uint8_t* data, size_t size);

#endif /*INCLUDED_BSP_RS4851_H*/


