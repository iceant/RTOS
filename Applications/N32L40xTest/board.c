#include "board.h"
#include "dev_i2c1.h"
#include "dev_i2c2.h"
#include <string.h>
#include <os_kernel.h>
#include <os_ringbuffer.h>
#include <dev_usart1.h>
#include <OLED.h>
#include <dev_usart2.h>
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


////////////////////////////////////////////////////////////////////////////////
////

void board_init(void)
{
    NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0000);
    SCB->CCR|=SCB_CCR_STKALIGN_Msk; // 栈对齐
    
    /* Configure the NVIC Preemption Priority Bits */
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);
    
    
    dev_USART1.init();
    dev_USART2.init();
    dev_I2C1.init();
    dev_I2C2.init();
    OLED_Init(&dev_I2C1);
}

////////////////////////////////////////////////////////////////////////////////
////

