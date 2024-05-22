#ifndef INCLUDED_BSP_I2C0_H
#define INCLUDED_BSP_I2C0_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /* INCLUDED_GD32F4XX_H */


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

void BSP_I2C0_Init(void);

void BSP_I2C0_EnableTxDMA(void);
void BSP_I2C0_EnableRxDMA(void);

int BSP_I2C0_DMATx(uint8_t address, uint8_t* data, int size);

int BSP_I2C0_DMARx(uint8_t address, uint8_t* buffer, int size);

int BSP_I2C0_Send(uint8_t address, uint8_t* data, int size);

int BSP_I2C0_Recv(uint8_t address, uint8_t * buffer, int size);

void BSP_I2C0_Reset(void);

#endif /* INCLUDED_BSP_I2C0_H */
