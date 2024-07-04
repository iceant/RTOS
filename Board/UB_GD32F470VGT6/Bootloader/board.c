#include <board.h>
#include "bsp_usart0.h"
#include "os_config.h"
#include <stdarg.h>
#include <stdio.h>
#include <os_kernel.h>
#include "bsp_spi0.h"
#include <spi_flash.h>
#include "bsp_usart1.h"
////////////////////////////////////////////////////////////////////////////////
////
static sFLASH_IO_T W25QFLASH_IO={.Init = BSP_SPI0_Init, .DeInit=BSP_SPI0_DeInit
        , .CS_High=BSP_SPI0_CS_High, .CS_Low=BSP_SPI0_CS_Low
        , .SendByte=BSP_SPI0_SendByte, .SendHalfWord=BSP_SPI0_SendHalfWord
};



////////////////////////////////////////////////////////////////////////////////
////
void Board_DeInit(void)
{
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

    rcu_periph_clock_disable(RCU_GPIOA);
    rcu_periph_clock_disable(RCU_GPIOB);
    rcu_periph_clock_disable(RCU_GPIOC);
    rcu_periph_clock_disable(RCU_GPIOD);
    rcu_periph_clock_disable(RCU_GPIOE);
    rcu_periph_clock_disable(RCU_GPIOF);
    rcu_periph_clock_disable(RCU_GPIOG);

    BSP_SPI0_DeInit();
    BSP_USART1_DeInit();
    BSP_USART0_DeInit();
}

void Board_Init(void)
{
    nvic_vector_table_set(NVIC_VECTTAB_FLASH, 0x000000);
    systick_clksource_set(SYSTICK_CLKSOURCE_HCLK_DIV8);

//    SystemCoreClock = 240000000U;

    /* Configure the NVIC Preemption Priority Bits */
    nvic_priority_group_set(NVIC_PRIGROUP_PRE0_SUB4);
    SysTick_Config(SystemCoreClock/OS_TICKS_PER_SECOND); /* 10ms = tick */
    NVIC_SetPriority(PendSV_IRQn, 0xFF);

    BSP_USART0_Init();
    BSP_USART0_EnableDMATx();
    BSP_USART0_EnableRxIRQ();

    os_kernel_init();

    sFLASH_Init(&W25QFLASH_IO);

#if defined(ENABLE_4G)
    BSP_USART1_Init();
    BSP_USART1_EnableRxIRQ();
    BSP_USART1_EnableDMATx();

    BSP_A7670C_Init();
#endif


}

void Board_Reboot(void){
    __disable_irq();                     // 可以使用这个函数 关闭总中断
    __set_FAULTMASK(1);        //关闭中断,确保跳转过程中 不会进入中断,导致跳转失败
    Board_DeInit();
    cpu_reboot();
}
////////////////////////////////////////////////////////////////////////////////
////
int fputc(int ch, FILE *f)
{
#if defined(ENABLE_USART0)
    usart_data_transmit(USART0, (uint8_t)ch);
    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
#endif
    return ch;
}
//
//int os_printf_putc(int ch, void* f){
//    usart_data_transmit(USART0, (uint8_t)ch);
//    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
//    return ch;
//}
//
//static char os_printf__buffer[OS_PRINTF_BUFFER_SIZE];
//int os_printf(const char* format, ...){
//    va_list args;
//    va_start(args, format);
//    int len = vsnprintf(os_printf__buffer, OS_PRINTF_BUFFER_SIZE, format, args);
//    va_end(args);
//    if(len > OS_ARRAY_SIZE(os_printf__buffer)){
//        char* buffer = (char*)OS_ALLOC(len + 1);
//        va_start(args, format);
//        len = vsnprintf(buffer, len + 1, format, args);
//        va_end(args);
//#if 0
//        for(int i=0; i<len; i++){
//            os_printf_putc(buffer[i], 0);
//        }
//#else
//        BSP_USART0_DMATx(buffer, len);
//#endif
//
//        OS_FREE(buffer);
//    }else{
//#if 0
//        for(int i=0; i<len; i++){
//            os_printf_putc(os_printf__buffer[i], 0);
//        }
//#else
//        BSP_USART0_DMATx(os_printf__buffer, len);
//#endif
//    }
//
//
//    return len;
//}