#include <board.h>
#include <bsp_usart0.h>
////////////////////////////////////////////////////////////////////////////////
////

void Board_Init(void)
{
    BSP_USART0_Init();
    BSP_USART0_EnableRxIRQ();
    
    nvic_priority_group_set(NVIC_PRIGROUP_PRE0_SUB4);
    SysTick_Config(SystemCoreClock/1000u); /* 1ms = tick */
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
}
