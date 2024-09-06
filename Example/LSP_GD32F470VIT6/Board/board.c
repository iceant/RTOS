#include <board.h>
#include <bsp_usart0.h>
#include <os_kernel.h>
////////////////////////////////////////////////////////////////////////////////
////

void Board_Init(void)
{
    SCB->CCR|= SCB_CCR_STKALIGN_Msk;
 
    __disable_irq();
    
    nvic_vector_table_set(NVIC_VECTTAB_FLASH, 0x000000);
    systick_clksource_set(SYSTICK_CLKSOURCE_HCLK_DIV8);
//
    nvic_priority_group_set(NVIC_PRIGROUP_PRE0_SUB4);
    
    BSP_USART0_Init();
//    BSP_USART0_EnableRxIRQ();
    BSP_USART0_EnableDMATx();
    BSP_USART0_EnableDMARx();
    
    BSP_Pulse_Init();
    
//    NVIC_SetPriority(SysTick_IRQn, 0xF1);

    SysTick_Config(SystemCoreClock/OS_TICK_PER_SECOND); /* 1ms = tick, 0xFF */
    NVIC_SetPriority(SysTick_IRQn, 0xFE);
    NVIC_SetPriority(SVCall_IRQn, 0x00);
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
    
    __enable_irq();
}
