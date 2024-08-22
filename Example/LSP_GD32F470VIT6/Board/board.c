#include <board.h>
#include <bsp_usart0.h>
#include <os_kernel.h>
////////////////////////////////////////////////////////////////////////////////
////

void Board_Init(void)
{
    nvic_priority_group_set(NVIC_PRIGROUP_PRE0_SUB4);
    
    BSP_USART0_Init();
    BSP_USART0_EnableRxIRQ();
    
    SysTick_Config(SystemCoreClock/OS_KERNEL_TICKS_PER_SECOND); /* 1ms = tick */
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
}
