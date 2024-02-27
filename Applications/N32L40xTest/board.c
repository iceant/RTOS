#include "board.h"
#include <string.h>
#include <os_kernel.h>
#include <os_ringbuffer.h>
#include <dev_usart1.h>


////////////////////////////////////////////////////////////////////////////////
////

#ifdef __GNUC__
    #define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
    #define GETCHAR_PROTOTYPE int __io_getchar(void)
#else
    #define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
    #define GETCHAR_PROTOTYPE int fget(FILE* f)
#endif


PUTCHAR_PROTOTYPE
{
    USART_SendData(USART1, (uint8_t)ch);
    while (USART_GetFlagStatus(USART1, USART_FLAG_TXDE) == RESET)
        ;
    
    return (ch);
}

GETCHAR_PROTOTYPE
{
    /* Loop until the USARTy Receive Data Register is not empty */
    while (USART_GetFlagStatus(USART1, USART_FLAG_RXDNE) == RESET)
    {
    }
    /* Store the received byte in RxBuffer */
    return USART_ReceiveData(USART1);
}


static void I2C1_Configuration(void){
    I2C_InitType i2c_master;
    GPIO_InitType i2c_gpio;

    I2C_Module * I2Cx = I2C1;
    GPIO_Module * SCL_GPIO = GPIOB;
    uint16_t SCL_Pin = GPIO_PIN_8;
    uint32_t SCL_Alternate = GPIO_AF4_I2C1;

    GPIO_Module * SDA_GPIO = GPIOB;
    uint16_t SDA_Pin = GPIO_PIN_9;
    uint32_t SDA_Alternate = GPIO_AF4_I2C1;

    RCC_EnableAPB1PeriphClk(RCC_APB1_PERIPH_I2C1, ENABLE);
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_AFIO, ENABLE);
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_GPIOB, ENABLE);

    /*PB8 -- SCL; PB9 -- SDA*/
    GPIO_InitStruct(&i2c_gpio);
    i2c_gpio.Pin               = SCL_Pin;
    i2c_gpio.GPIO_Slew_Rate    = GPIO_Slew_Rate_High;
    i2c_gpio.GPIO_Mode         = GPIO_Mode_AF_OD;
    i2c_gpio.GPIO_Alternate    = SCL_Alternate;
    i2c_gpio.GPIO_Pull         = GPIO_Pull_Up;
    GPIO_InitPeripheral(SCL_GPIO, &i2c_gpio);

    i2c_gpio.Pin               = SDA_Pin;
    i2c_gpio.GPIO_Slew_Rate    = GPIO_Slew_Rate_High;
    i2c_gpio.GPIO_Mode         = GPIO_Mode_AF_OD;
    i2c_gpio.GPIO_Alternate    = SDA_Alternate;
    i2c_gpio.GPIO_Pull         = GPIO_Pull_Up;
    GPIO_InitPeripheral(SDA_GPIO, &i2c_gpio);

    I2C_DeInit(I2Cx);
    i2c_master.BusMode     = I2C_BUSMODE_I2C;
    i2c_master.FmDutyCycle = I2C_FMDUTYCYCLE_2;
    i2c_master.OwnAddr1    = 0x00;
    i2c_master.AckEnable   = I2C_ACKEN;
    i2c_master.AddrMode    = I2C_ADDR_MODE_7BIT;
    i2c_master.ClkSpeed    = 100000; // 100K

    I2C_Init(I2Cx, &i2c_master);
    I2C_Enable(I2Cx, ENABLE);
}



////////////////////////////////////////////////////////////////////////////////
////

void board_init(void)
{
    NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0000);
    SCB->CCR|=SCB_CCR_STKALIGN_Msk; // 栈对齐

    dev_USART1.init();

    I2C1_Configuration();
}

////////////////////////////////////////////////////////////////////////////////
////

