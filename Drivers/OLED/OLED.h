#ifndef INCLUDED_OLED_H
#define INCLUDED_OLED_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

#ifndef INCLUDED_DRV_I2C_H
#include <drv_i2c.h>
#endif /*INCLUDED_DRV_I2C_H*/

////////////////////////////////////////////////////////////////////////////////
////
#define OLED_ADDRESS (0x78)
#define MAX_COLUMN	128
#define FONT_SIZE 8
////////////////////////////////////////////////////////////////////////////////
////
typedef enum OLED_Result{
    kOLED_Result_OK=0,
    kOLED_Result_ERROR=-1,
}OLED_Result;

OLED_Result OLED_Init(drv_i2c_t * device);

OLED_Result OLED_WriteCommand(uint8_t command);

OLED_Result OLED_WriteData(uint8_t data);

OLED_Result OLED_SetCursor(uint8_t x, uint8_t y);

OLED_Result OLED_Clear(void);

OLED_Result OLED_ShowChar(uint8_t x,uint8_t y, char chr);

OLED_Result OLED_ShowString(uint8_t x, uint8_t y, char* string);

uint32_t OLED_Pow(uint32_t x, uint32_t y);

OLED_Result OLED_ShowNum(uint8_t x, uint8_t y, uint32_t number, uint8_t length);

OLED_Result OLED_ShowSignedNum(uint8_t x, uint8_t y, int32_t  number, uint8_t length);

OLED_Result OLED_ShowHexNum(uint8_t x, uint8_t y, uint32_t number, uint8_t length);

OLED_Result OLED_ShowBinNum(uint8_t x, uint8_t y, uint32_t number, uint8_t length);

void OLED_ShowFloat(uint8_t Column, uint8_t Line, float Number, uint8_t Length, uint8_t Flength);


#endif /* INCLUDED_OLED_H */
