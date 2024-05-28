#include <board.h>
#include <os_kernel.h>
#include <stdio.h>

////////////////////////////////////////////////////////////////////////////////
////
#if defined(ENABLE_DS1307)
static int DS1307_Send(uint8_t address, uint8_t* data, int size){
    //int ret = BSP_I2C0_Send(address, data, size);
    int ret = BSP_I2C0_DMATx(address, data, size);

    if(ret!=0){
        printf("I2C1 Send Error: %d\r\n", ret);
    }
}

static int DS1307_Recv(uint8_t address, uint8_t* data, int size){
    //int ret = BSP_I2C0_Recv(address, data, size);
    int ret = BSP_I2C0_DMARx(address, data, size);
    if(ret!=0){
        printf("I2C1 Recv Error: %d\r\n", ret);
    }
}

static DS1307_IO_T DS1307_IO={.send=DS1307_Send, .recv=DS1307_Recv, .reset=BSP_I2C0_Reset};
#endif
////////////////////////////////////////////////////////////////////////////////
////
#if defined(ENABLE_4G)
static void A7670C_GPIO_Init(void){
    rcu_periph_clock_enable(RCU_GPIOA);
    rcu_periph_clock_enable(RCU_GPIOD);
    rcu_periph_clock_enable(RCU_GPIOE);

#if 0
    gpio_mode_set(GPIOD, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,GPIO_PIN_7);
    gpio_output_options_set(GPIOD, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_7);    /* POWER_MCU -- PWRKEY 4G */

    gpio_mode_set(GPIOE, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,GPIO_PIN_6);
    gpio_output_options_set(GPIOE, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_6);    /* 4G_PWEN */

    gpio_mode_set(GPIOD, GPIO_MODE_INPUT, GPIO_PUPD_NONE,GPIO_PIN_4);
    gpio_output_options_set(GPIOD, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_4);   /* EXT_IN -- STATUS 4G Power On Test */

    gpio_mode_set(GPIOA, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,GPIO_PIN_15);
    gpio_output_options_set(GPIOA, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_15);   /* RESET_MCU -- RESET 4G */

#endif

    gpio_mode_set(GPIOD, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,GPIO_PIN_15);
    gpio_output_options_set(GPIOD, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_15);   /* 5V_EN */

}
/* ======================================================================================================================== */

static void A7670C_PwrKeyPin_On(void){
    GPIO_BOP(GPIOD) = GPIO_PIN_7;
}
static void A7670C_PwrKeyPin_Off(void){
    GPIO_BC(GPIOD) = GPIO_PIN_7;
}
static uint8_t A7670C_PwrKeyPin_Read(void){
    return gpio_input_bit_get(GPIOD, GPIO_PIN_7);
}

A7670C_Pin_T A7670C_power_key={.on=A7670C_PwrKeyPin_On, .off=A7670C_PwrKeyPin_Off, .read=A7670C_PwrKeyPin_Read};

/* ======================================================================================================================== */

static void A7670C_PwrEnPin_On(void){
    GPIO_BOP(GPIOE) = GPIO_PIN_6;
}
static void A7670C_PwrEnPin_Off(void){
    GPIO_BC(GPIOE) = GPIO_PIN_6;
}
static uint8_t A7670C_PwrEnPin_Read(void){
    return gpio_input_bit_get(GPIOE, GPIO_PIN_6);
}


A7670C_Pin_T A7670C_power_en={.on=A7670C_PwrEnPin_On, .off=A7670C_PwrEnPin_Off, .read=A7670C_PwrEnPin_Read};

/* ======================================================================================================================== */

static void A7670C_StatusPin_On(void){
    GPIO_BOP(GPIOD) = GPIO_PIN_4;
}
static void A7670C_StatusPin_Off(void){
    GPIO_BC(GPIOD) = GPIO_PIN_4;
}
static uint8_t A7670C_StatusPin_Read(void){
    return gpio_input_bit_get(GPIOD, GPIO_PIN_4);
}


A7670C_Pin_T A7670C_power_status={.on=A7670C_StatusPin_On, .off=A7670C_StatusPin_Off, .read=A7670C_StatusPin_Read};

/* ======================================================================================================================== */

static void A7670C_PwrRstPin_On(void){
    GPIO_BOP(GPIOA) = GPIO_PIN_15;
}
static void A7670C_PwrRstPin_Off(void){
    GPIO_BC(GPIOA) = GPIO_PIN_15;
}
static uint8_t A7670C_PwrRstPin_Read(void){
    return gpio_input_bit_get(GPIOA, GPIO_PIN_15);
}

A7670C_Pin_T A7670C_power_reset={.on=A7670C_PwrRstPin_On, .off=A7670C_PwrRstPin_Off, .read=A7670C_PwrRstPin_Read};

/* ======================================================================================================================== */
#define A7670C_RXTHREAD_STACK_SIZE (1024)
#define A7670C_RXBLOCK_SIZE (10240+512)

static uint8_t A7670C_RxThdStack[A7670C_RXTHREAD_STACK_SIZE];
static os_thread_t A7670C_RxThread;
static os_sem_t A7670C_RxSem;
static os_sem_t A7670C_WaitSem;
static uint8_t A7670C_RxBlock[A7670C_RXBLOCK_SIZE];
static sdk_ringbuffer_t A7670C_RxBuffer;
static bool A7670C_RxThreadFlag = false;
static bool A7670C_ReadyFlag = false;

//A7670C_RxHandler_Result (*A7670C_RxHandler_T)(sdk_ringbuffer_t * buffer, void* userdata);
static A7670C_RxHandler_T A7670C__RxHandler=0;
static A7670C_RxHandler_T A7670C__RxHandlerUserdata=0;
static A7670C_RxHandler_T A7670C__DefaultRxHandler=0;
static A7670C_RxHandler_T A7670C__DefaultRxHandlerUserdata=0;

static void A7670C_USART_RxThreadEntry(void* parameter){
    printf("A7670C_USART_RxThreadEntry Startup...\r\n");

    sdk_ringbuffer_init(&A7670C_RxBuffer, A7670C_RxBlock, sizeof(A7670C_RxBlock));
    os_sem_init(&A7670C_RxSem, "A7670C_RxSem", 0, OS_QUEUE_FIFO);
    os_sem_init(&A7670C_WaitSem, "A7670C_WaitSem", 0, OS_QUEUE_FIFO);

    A7670C_RxThreadFlag = true;
    A7670C_RxHandler_Result result;

    while(1){
        os_sem_take(&A7670C_RxSem, OS_WAIT_INFINITY);
        cpu_DMB();
        if(A7670C__DefaultRxHandler){
            result = A7670C__DefaultRxHandler(&A7670C_RxBuffer, A7670C__DefaultRxHandlerUserdata);
            if(result==kA7670C_RxHandler_Result_CONTINUE){
                continue;
            }
        }

        if(A7670C__RxHandler){
            A7670C__RxHandler(&A7670C_RxBuffer, A7670C__RxHandlerUserdata);
        }

    }
}

static void A7670C__SetRxHandler(void* RxHandler, void* userdata){
    A7670C__RxHandler = RxHandler;
    A7670C__RxHandlerUserdata = userdata;
}

static void A7670C__SetDefaultRxHandler(void* RxHandler, void* userdata){
    A7670C__DefaultRxHandler = RxHandler;
    A7670C__DefaultRxHandlerUserdata = userdata;
}

static os_err_t A7670C_IO_Wait(os_time_t timeout_ms){
    return os_sem_take(&A7670C_WaitSem, os_tick_from_millisecond(timeout_ms));
}

static os_err_t A7670C_IO_Notify(void){
    return os_sem_release(&A7670C_WaitSem);
}

static int A7670C_IO_Send(uint8_t* data, int size){
    sdk_ringbuffer_reset(&A7670C_RxBuffer);
//    BSP_USART1_DMATx(data, size);
    BSP_USART1_Send(data, size);
    return size;
}

static void A7670C_USART_RxHandler(uint16_t data, void* userdata)
{
    if(A7670C_RxThreadFlag==true){
        sdk_ringbuffer_put(&A7670C_RxBuffer, data);
        //sdk_hex_dump("USART1_RX", A7670C_RxBuffer.buffer, sdk_ringbuffer_used(&A7670C_RxBuffer));
        os_sem_release(&A7670C_RxSem);
    }
}

static A7670C_IO_T  A7670C_IO={.send=A7670C_IO_Send, .wait=A7670C_IO_Wait, .notify =A7670C_IO_Notify,
        .setRxHandler = A7670C__SetRxHandler, .setDefaultRxHandler=A7670C__SetDefaultRxHandler };
#endif
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

#if defined(ENABLE_SPI_FLASH)

static sFLASH_IO_T W25QFLASH_IO={.Init = BSP_SPI0_Init, .DeInit=BSP_SPI0_DeInit
        , .CS_High=BSP_SPI0_CS_High, .CS_Low=BSP_SPI0_CS_Low
        , .SendByte=BSP_SPI0_SendByte, .SendHalfWord=BSP_SPI0_SendHalfWord
};

#endif

////////////////////////////////////////////////////////////////////////////////
////

void Board_5V_Enable(void)
{
    GPIO_BC(GPIOD) = GPIO_PIN_15;
}

void Board_5V_Disable(void){
    GPIO_BOP(GPIOD) = GPIO_PIN_15;
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
    /* ---- USART1: 4G IO ----*/
#if defined(ENABLE_4G)
    BSP_USART1_Init();
    BSP_USART1_EnableRxIRQ();
    BSP_USART1_EnableDMATx();
    BSP_USART1_SetRxHandler(A7670C_USART_RxHandler, 0);
#endif
    /* ------------------------------------------------------------------------------------------ */
    /* ---- I2C0: RTC/OLED ----*/
    #if defined(ENABLE_I2C0) || defined(ENABLE_DS1307)
    BSP_I2C0_Init();
    BSP_I2C0_EnableTxDMA();
    BSP_I2C0_EnableRxDMA();
    #endif

    /* ------------------------------------------------------------------------------------------ */
    /* ---- CAN0 ----*/
    #if defined(ENABLE_CAN0)
    BSP_CAN0_Init(CAN_BAUDRATE_250K);
    #endif
    
    /* ------------------------------------------------------------------------------------------ */
    /* ---- A7670C ----*/
    Board_5V_Enable();

#if defined(ENABLE_4G)
    A7670C_GPIO_Init();
    os_thread_init(&A7670C_RxThread, "A7670C_RxThd", A7670C_USART_RxThreadEntry, 0
                   , A7670C_RxThdStack, sizeof(A7670C_RxThdStack)
                   , 20, os_tick_from_millisecond(100));
    os_thread_startup(&A7670C_RxThread);

    A7670C_Init(&A7670C_power_en, &A7670C_power_key, &A7670C_power_status, &A7670C_power_reset, &A7670C_IO);
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

