#include <board.h>
#include <os_kernel.h>
#define GD32F470
#define __CC_ARM
#include <gd32f4xx.h>
////////////////////////////////////////////////////////////////////////////////
////


static void Board_5V_Init(void){
    rcu_periph_clock_enable(RCU_GPIOD);
    gpio_mode_set(GPIOD, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,GPIO_PIN_15);
    gpio_output_options_set(GPIOD, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_15);   /* 5V_EN */
}

static void Board_5V_Enable(void)
{
//    GPIO_BC(GPIOD) = GPIO_PIN_15;
    gpio_bit_set(GPIOD, GPIO_PIN_15);
}

////////////////////////////////////////////////////////////////////////////////
////

void Board_Init(void){

    SCB->CCR|= SCB_CCR_STKALIGN_Msk;

    nvic_vector_table_set(NVIC_VECTTAB_FLASH, 0x000000);
    systick_clksource_set(SYSTICK_CLKSOURCE_HCLK_DIV8);

    SCB->CFSR |= (1<<25);

    //    SystemCoreClock = 240000000U;
    /* Configure the NVIC Preemption Priority Bits */
    nvic_priority_group_set(NVIC_PRIGROUP_PRE0_SUB4);
    SysTick_Config(SystemCoreClock/OS_TICK_PER_SECOND); /* 1ms = tick */
    NVIC_SetPriority(SysTick_IRQn, 0x01);
    NVIC_SetPriority(SVCall_IRQn, 0x00);
    NVIC_SetPriority(PendSV_IRQn, 0xFF);

    /*
     * 以下配置会造成 异常
     *
     *
    NVIC_SetPriority(SysTick_IRQn, 0x01);
    NVIC_SetPriority(SVCall_IRQn, 0xFF);
    NVIC_SetPriority(PendSV_IRQn, 0xFF);

     [HardFault]
        -- Stack Frame --
        R0  = 0x20005000
        R1  = 0x00000000
        R2  = 0xfc334b15
        R3  = 0x22845f19
        R12 = 0x12121212
        LR  = 0xfc334b15
        PC  = 0xfc334b14
        PSR = 0x0100000e
          IPSR = 0xe PendSV
        -- FSR/FAR --
        CFSR = 0x00000001 IACCVIOL
        HFSR = 0x40000000 FORCED
        DFSR = 0x00000000
        AFSR = 0x00000000
        -- MISC --
        LR/EXC_RETURN = 0xfffffff1 ISR/MSP/FPCA=0
     */
//
//    Board_5V_Init();
//    Board_5V_Enable();

    BSP_USART0_Init();
    BSP_USART0_EnableRxIRQ();
    BSP_USART0_EnableDMATx();
}

////////////////////////////////////////////////////////////////////////////////
////

//#pragma import(__use_no_semihosting)

struct __FILE{
    int handle;
};

typedef struct __FILE FILE;
FILE __stdout;

//
//void _sys_exit(int return_code)
//{
//    label:  goto label;  /* endless loop */
//}

/* retarget the C library printf function to the USART */
int fputc(int ch, FILE *f)
{

    BSP_USART0_SendByte(ch);

    return ch;
}


