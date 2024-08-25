#include <board.h>
#include <bsp_usart0.h>
#include <os_kernel.h>
////////////////////////////////////////////////////////////////////////////////
////

void Board_Init(void)
{
    SCB->CCR|= SCB_CCR_STKALIGN_Msk;
    
    nvic_vector_table_set(NVIC_VECTTAB_FLASH, 0x000000);
    systick_clksource_set(SYSTICK_CLKSOURCE_HCLK_DIV8);
    
    nvic_priority_group_set(NVIC_PRIGROUP_PRE0_SUB4);
    
    BSP_USART0_Init();
    BSP_USART0_EnableRxIRQ();
    
    SysTick_Config(SystemCoreClock/OS_KERNEL_TICKS_PER_SECOND); /* 1ms = tick */
//    NVIC_SetPriority(SysTick_IRQn, 0xF1);
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
    NVIC_SetPriority(SVCall_IRQn, 0x00);
}
