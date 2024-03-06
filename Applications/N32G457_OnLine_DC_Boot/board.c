#include "board.h"

#include <os_kernel.h>
#include <sdk_ringbuffer.h>

#include "dev_usart1.h"
#include <hw_time.h>
#include <hw_gpio.h>
#include <stdlib.h>
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
static uint32_t time_us;
static void board_TIM4_irq_handler(void){
    hw_gpio_high(GPIOE, GPIO_PIN_2);
    time_us++;
    srand(time_us);
}


////////////////////////////////////////////////////////////////////////////////
////

void board_init(void)
{
    NVIC_SetVectorTable(NVIC_VectTab_FLASH, BOARD_VECTOR_TABLE_OFFSET);
    SCB->CCR|=SCB_CCR_STKALIGN_Msk; // 栈对齐
    
    /* Configure the NVIC Preemption Priority Bits */
    NVIC_PriorityGroupConfig(BOARD_NVIC_PRIORITY_GROUP);

    dev_USART1.init();

    time_us = 0;
    hw_gpio_init(GPIOE, GPIO_PIN_2);
    hw_time_init(TIM4, 999, 0, board_TIM4_irq_handler);
}

////////////////////////////////////////////////////////////////////////////////
////

