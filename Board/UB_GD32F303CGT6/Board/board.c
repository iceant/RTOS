#include <board.h>
#include <os_kernel.h>
#include <stdio.h>

////////////////////////////////////////////////////////////////////////////////
////


void Board_Init(void)
{
#if OS_ENABLE
    nvic_vector_table_set(NVIC_VECTTAB_FLASH, 0x010000);
    __enable_irq();

    SCB->CCR|=SCB_CCR_STKALIGN_Msk;
    systick_clksource_set(SYSTICK_CLKSOURCE_HCLK_DIV8);

    /* Configure the NVIC Preemption Priority Bits */
    nvic_priority_group_set(NVIC_PRIGROUP_PRE0_SUB4);

    SysTick_Config(SystemCoreClock/OS_TICKS_PER_SECOND); /* 10ms = tick */
    NVIC_SetPriority(SysTick_IRQn, 0xFE);
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
#endif
    /* ---------------------------------------------------------------------------------------------------- */
    /* USART1: 用于和 GD32F470 通讯 */
    BSP_USART1_Init();
    BSP_USART1_EnableDMATx();
    BSP_USART1_EnableRxIRQ();

    /* ---------------------------------------------------------------------------------------------------- */
    /* TIMER6: 用于计算电能 */
    BSP_TIM6_Init();

    /* ---------------------------------------------------------------------------------------------------- */
    /* CAN0: 用于采集电压电流数据 */
    BSP_CAN0_Init(CAN_BAUDRATE_250K);
}

////////////////////////////////////////////////////////////////////////////////
////
/* retarget the C library printf function to the USART */
int fputc(int ch, FILE *f)
{
    usart_data_transmit(USART0, (uint8_t)ch);
    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
    return ch;
}

//int os_printf_putc(int ch, void* ud)
//{
//    ((void)(ud));
//
//    usart_data_transmit(USART0, (uint8_t)ch);
//    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
//    return ch;
//}
//


