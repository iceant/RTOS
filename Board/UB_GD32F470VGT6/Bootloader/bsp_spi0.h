#ifndef INCLUDED_BSP_SPI0_H
#define INCLUDED_BSP_SPI0_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /* INCLUDED_GD32F4XX_H */

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

void BSP_SPI0_Init(void);

void BSP_SPI0_DeInit(void);

void BSP_SPI0_CS_High(void);

void BSP_SPI0_CS_Low(void);

uint8_t BSP_SPI0_SendByte(uint8_t byte);

uint16_t BSP_SPI0_SendHalfWord(uint16_t halfWord);

#endif /* INCLUDED_BSP_SPI0_H */

