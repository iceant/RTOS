#include <board.h>
#include <os_kernel.h>
#include <stdio.h>
#include <bsp_usart1.h>

////////////////////////////////////////////////////////////////////////////////
////

void Board_DeInit(void){
    rcu_periph_clock_disable(RCU_GPIOA);
    rcu_periph_clock_disable(RCU_GPIOB);
    rcu_periph_clock_disable(RCU_GPIOC);
    rcu_periph_clock_disable(RCU_GPIOD);
    rcu_periph_clock_disable(RCU_GPIOE);
    rcu_periph_clock_disable(RCU_GPIOF);
    rcu_periph_clock_disable(RCU_GPIOG);

    BSP_TIM6_DeInit();
    BSP_USART1_DeInit();
    BSP_CAN0_DeInit();
}

void Board_Reboot(void){
    __disable_irq();  // 可以使用这个函数 关闭总中断
    __set_FAULTMASK(1);        //关闭中断,确保跳转过程中 不会进入中断,导致跳转失败

    /* Disable Systick timer */
    SysTick->CTRL = 0;
    SysTick->LOAD = 0;
    SysTick->VAL = 0;
    /* Clear Interrupt Enable Register & Interrupt Pending Register */
    for (uint16_t i = 0; i < sizeof(NVIC->ICER) / sizeof(NVIC->ICER[0]); i++)
    {
        NVIC->ICER[i] = 0xFFFFFFFF;
        NVIC->ICPR[i] = 0xFFFFFFFF;
    }

    Board_DeInit();
    NVIC_SystemReset();
}

void Board_Init(void)
{
#if OS_ENABLE
    nvic_vector_table_set(NVIC_VECTTAB_FLASH, 0x010000);
//    __enable_irq();

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


