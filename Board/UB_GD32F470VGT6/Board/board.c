#include <board.h>
#include <os_kernel.h>
#include <stdio.h>
#include <sdk_hex.h>

////////////////////////////////////////////////////////////////////////////////
////
#if defined(ENABLE_DS1307)
static int DS1307_Send(uint8_t DS1307_Address, uint8_t address, uint8_t* data, int size){
    //int ret = BSP_I2C0_Send(address, data, size);
//    int ret = BSP_I2C0_DMATx(address, data, size);
    BSP_I2C0_Lock();
    int ret = BSP_I2C0_Write_Timeout(DS1307_Address, address, data, size);
    BSP_I2C0_UnLock();
    if(ret!=0){
        printf("I2C1 Send Error: %d\r\n", ret);
    }
}

static int DS1307_Recv(uint8_t DS1307_Address, uint8_t address, uint8_t* data, int size){
//    int ret = BSP_I2C0_Recv(address, data, size);
//    int ret = BSP_I2C0_DMARx(address, data, size);
    BSP_I2C0_Lock();
    int ret = BSP_I2C0_Read_Timeout(DS1307_Address, address, data, size);
    BSP_I2C0_UnLock();
    if(ret!=0){
        printf("I2C1 Recv Error: %d\r\n", ret);
    }
}

static DS1307_IO_T DS1307_IO={.send=DS1307_Send, .recv=DS1307_Recv, .reset=BSP_I2C0_Reset};
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

#if defined(ENABLE_SPI_FLASH)

static sFLASH_IO_T W25QFLASH_IO={.Init = BSP_SPI0_Init, .DeInit=BSP_SPI0_DeInit
        , .CS_High=BSP_SPI0_CS_High, .CS_Low=BSP_SPI0_CS_Low
        , .SendByte=BSP_SPI0_SendByte, .SendHalfWord=BSP_SPI0_SendHalfWord
};

#endif


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#if defined(ENABLE_OLED)
static int OLED_Send(uint8_t OLED_Address, uint8_t address, uint8_t* data, int size){
    BSP_I2C0_Lock();
    int ret = BSP_I2C0_Write_Timeout(OLED_Address, address, data, size);
    BSP_I2C0_UnLock();
//    int ret = BSP_I2C0_DMATx(address, data, size);

    if(ret!=I2C_END){
        printf("I2C0 Send Error: %d\r\n", ret);
    }
}

static int OLED_Recv(uint8_t OLED_Address, uint8_t address, uint8_t* data, int size){
    BSP_I2C0_Lock();
    int ret = BSP_I2C0_Read_Timeout(OLED_Address, address, data, size);
    BSP_I2C0_UnLock();
//    int ret = BSP_I2C0_DMARx(address, data, size);
    if(ret!=I2C_END){
        printf("I2C0 Recv Error: %d\r\n", ret);
    }
}

static OLED_IO_T OLED_IO = {.send = OLED_Send, .recv = OLED_Recv, .reset = BSP_I2C0_Reset};

#endif

////////////////////////////////////////////////////////////////////////////////
////

static void Board_5V_Init(void){
    gpio_mode_set(GPIOD, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,GPIO_PIN_15);
    gpio_output_options_set(GPIOD, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_15);   /* 5V_EN */
}

void Board_5V_Enable(void)
{
//    GPIO_BC(GPIOD) = GPIO_PIN_15;
    gpio_bit_reset(GPIOD, GPIO_PIN_15);
}

void Board_5V_Disable(void){
//    GPIO_BOP(GPIOD) = GPIO_PIN_15;
    gpio_bit_set(GPIOD, GPIO_PIN_15);
}



void Board_Init(void){

    nvic_vector_table_set(NVIC_VECTTAB_FLASH, 0x0000);
    SCB->CCR|=SCB_CCR_STKALIGN_Msk;
    systick_clksource_set(SYSTICK_CLKSOURCE_HCLK_DIV8);

    os_kernel_init();

    SystemCoreClock = 240000000U;

    /* Configure the NVIC Preemption Priority Bits */
    nvic_priority_group_set(NVIC_PRIGROUP_PRE0_SUB4);
    SysTick_Config(SystemCoreClock/OS_TICKS_PER_SECOND); /* 10ms = tick */
    NVIC_SetPriority(SysTick_IRQn, 0xFE);
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
    
    /* ------------------------------------------------------------------------------------------ */
    /* ---- 打开 5V 电源 ----*/
    Board_5V_Init();
    Board_5V_Enable();
    
    /* ------------------------------------------------------------------------------------------ */
    /* ---- 精确计时器 ----*/
    BSP_TIM6_Init();
    
    /* ------------------------------------------------------------------------------------------ */
    /* ---- LED ----*/
    #if defined(ENABLE_LED)
    BSP_LED1_Init();
    BSP_LED2_Init();
    BSP_LED3_Init();
    BSP_LED4_Init();
    #endif 

    /* ------------------------------------------------------------------------------------------ */
    /* ---- USART0 ----*/
    #if defined(ENABLE_USART0)
    BSP_USART0_Init();
    BSP_USART0_EnableDMATx();
    BSP_USART0_EnableRxIRQ();
    #endif 

    /* ------------------------------------------------------------------------------------------ */
    /* ---- I2C0: RTC/OLED ----*/
    #if defined(ENABLE_I2C0) || defined(ENABLE_DS1307) || defined(ENABLE_OLED)
    BSP_I2C0_Init();
    BSP_I2C0_EnableTxDMA();
    BSP_I2C0_EnableRxDMA();
    #endif

    #if defined(ENABLE_OLED)
    OLED_Init(&OLED_IO);
    #endif
    /* ------------------------------------------------------------------------------------------ */
    /* ---- TFCARD ----*/
    #if defined(ENABLE_TFCARD)
    sd_init();
    #endif

    /* ------------------------------------------------------------------------------------------ */
    /* ---- CAN0 ----*/
    #if defined(ENABLE_CAN0)
    BSP_CAN0_Init(CAN_BAUDRATE_250K);
    #endif
    
    /* ------------------------------------------------------------------------------------------ */
    /* ---- A7670C ----*/


#if defined(ENABLE_4G)
    BSP_USART1_Init();
    BSP_USART1_EnableRxIRQ();
    BSP_USART1_EnableDMATx();
    
    BSP_A7670C_Init();
#endif

    /* ------------------------------------------------------------------------------------------ */
    /* ---- SPI_FLASH W25Qxxx ----*/
    #if defined(ENABLE_SPI_FLASH)
    sFLASH_Init(&W25QFLASH_IO);
    #endif

    /* ------------------------------------------------------------------------------------------ */
    /* ---- DS1307 ----*/
    #if defined(ENABLE_DS1307)
    DS1307_Init(&DS1307_IO);
    #endif

    
    /* ------------------------------------------------------------------------------------------ */
    /* ---- GD32F303 ----*/
    #if defined(ENABLE_GD32F303)
    BSP_GD303EN_Init();
    BSP_GD303EN_Enable();

    /* ------------------------------------------------------------------------------------------ */
    /* ---- USART2: 和 MCU GD303 通讯 ----*/
    BSP_USART2_Init();
    BSP_USART2_EnableDMATx();
    BSP_USART2_EnableRxIRQ();
    #endif
}

void Board_Reboot(void){
    cpu_reboot();
}



////////////////////////////////////////////////////////////////////////////////
////
/* retarget the C library printf function to the USART */
int fputc(int ch, FILE *f)
{
    #if defined(ENABLE_USART0)
    usart_data_transmit(USART0, (uint8_t)ch);
    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
    #endif
    return ch;
}

