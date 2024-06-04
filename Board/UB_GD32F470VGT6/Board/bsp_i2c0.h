#ifndef INCLUDED_BSP_I2C0_H
#define INCLUDED_BSP_I2C0_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /* INCLUDED_GD32F4XX_H */

#define I2C_OK          1
#define I2C_FAIL        -1
#define I2C_END         0

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

void BSP_I2C0_Init(void);

void BSP_I2C0_EnableTxDMA(void);
void BSP_I2C0_EnableRxDMA(void);

int BSP_I2C0_DMATx(uint8_t address, uint8_t* data, int size);

int BSP_I2C0_DMARx(uint8_t address, uint8_t* buffer, int size);

int BSP_I2C0_Send(uint8_t address, uint8_t* data, int size);

int BSP_I2C0_Recv(uint8_t address, uint8_t * buffer, int size);

uint8_t BSP_I2C0_Write_Timeout(uint8_t master_address, uint8_t write_address, uint8_t *p_buffer, int number_of_byte);
uint8_t BSP_I2C0_Read_Timeout(uint8_t master_address, uint8_t write_address, uint8_t *p_buffer, int number_of_byte);

void BSP_I2C0_Reset(void);

void BSP_I2C0_Lock(void);
void BSP_I2C0_UnLock(void);

#endif /* INCLUDED_BSP_I2C0_H */
