#ifndef INCLUDED_BOARD_H
#define INCLUDED_BOARD_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F4XX_H
#define INCLUDED_GD32F4XX_H
#include <gd32f4xx.h>
#endif /*INCLUDED_GD32F4XX_H*/

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_BSP_USART0_H
#include <bsp_usart0.h>
#endif /*INCLUDED_BSP_USART0_H*/

#ifndef INCLUDED_BSP_CAN0_H
#include <bsp_can0.h>
#endif /*INCLUDED_BSP_CAN0_H*/

#ifndef INCLUDED_BSP_CAN1_H
#include <bsp_can1.h>
#endif /*INCLUDED_BSP_CAN1_H*/

#ifndef INCLUDED_BSP_I2C0_H
#include <bsp_i2c0.h>
#endif /*INCLUDED_BSP_I2C0_H*/

#ifndef INCLUDED_BSP_I2C1_H
#include <bsp_i2c1.h>
#endif /*INCLUDED_BSP_I2C1_H*/

#ifndef INCLUDED_BSP_LED1_H
#include <bsp_led1.h>
#endif /*INCLUDED_BSP_LED1_H*/

#ifndef INCLUDED_BSP_LED2_H
#include <bsp_led2.h>
#endif /*INCLUDED_BSP_LED2_H*/

#ifndef INCLUDED_BSP_LED3_H
#include <bsp_led3.h>
#endif /*INCLUDED_BSP_LED3_H*/

#ifndef INCLUDED_BSP_LED4_H
#include <bsp_led4.h>
#endif /*INCLUDED_BSP_LED4_H*/

#ifndef INCLUDED_BSP_RS4851_H
#include <bsp_rs4851.h>
#endif /*INCLUDED_BSP_RS4851_H*/

#ifndef INCLUDED_BSP_RS4852_H
#include <bsp_rs4852.h>
#endif /*INCLUDED_BSP_RS4852_H*/

#ifndef INCLUDED_BSP_RS4853_H
#include <bsp_rs4853.h>
#endif /*INCLUDED_BSP_RS4853_H*/

#ifndef INCLUDED_BSP_SPI0_H
#include <bsp_spi0.h>
#endif /*INCLUDED_BSP_SPI0_H*/

#ifndef INCLUDED_BSP_USART1_H
#include <bsp_usart1.h>
#endif /*INCLUDED_BSP_USART1_H*/


////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_DS1307_H
#include <DS1307.h>
#endif /*INCLUDED_DS1307_H*/

#ifndef INCLUDED_A7670C_H
#include <A7670C.h>
#endif /*INCLUDED_A7670C_H*/

#ifndef INCLUDED_SDCARD_H
#include <sdcard.h>
#endif /*INCLUDED_SDCARD_H*/

#ifndef INCLUDED_SPI_FLASH_H
#include <spi_flash.h>
#endif /*INCLUDED_SPI_FLASH_H*/

#ifndef INCLUDED_OLED_H
#include <OLED.h>
#endif /*INCLUDED_OLED_H*/

////////////////////////////////////////////////////////////////////////////////

#define ENABLE_4G
//#define ENABLE_LED
#define ENABLE_USART0
#define ENABLE_I2C0
//#define ENABLE_CAN0
//#define ENABLE_SPI_FLASH
#define ENABLE_DS1307

////////////////////////////////////////////////////////////////////////////////
////
void Board_Init(void);





#endif /*INCLUDED_BOARD_H*/
