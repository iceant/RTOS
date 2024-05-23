#include <board.h>
#include <os_kernel.h>
#include <stdio.h>
////////////////////////////////////////////////////////////////////////////////
////

/*
设置某个区域的MPU保护
baseaddr:MPU保护区域的基址(首地址)
size:MPU保护区域的大小(必须是32的倍数,单位为字节),可设置的值参考:CORTEX_MPU_Region_Size
rnum:MPU保护区编号,范围:0~7,最大支持8个保护区域,可设置的值参考：CORTEX_MPU_Region_Number
ap:访问权限,访问关系如下:可设置的值参考：CORTEX_MPU_Region_Permission_Attributes
0,无访问（特权&用户都不可访问）
1,仅支持特权读写访问
2,禁止用户写访问（特权可读写访问）
3,全访问（特权&用户都可访问）
4,无法预测(禁止设置为4!!!)
5,仅支持特权读访问
6,只读（特权&用户都不可以写）
详见:STM32F7 Series Cortex-M7 processor programming manual.pdf,4.6节,Table 89.
sen:是否允许共用;0,不允许;1,允许
cen:是否允许cache;0,不允许;1,允许
返回值;0,成功.
    其他,错误.
*/
uint8_t MPU_Set_Protection(uint32_t baseaddr,uint32_t size,uint32_t rnum, uint32_t ap,uint8_t ien, uint8_t sen,uint8_t cen,uint8_t ben,uint8_t Tex)
{
    MPU_Region_InitTypeDef MPU_Initure;
    HAL_MPU_Disable();								        //配置MPU之前先关闭MPU,配置完成以后在使能MPU
    
    MPU_Initure.Enable=MPU_REGION_ENABLE;			        //使能该保护区域
    MPU_Initure.Number=rnum;			                    //设置保护区域
    MPU_Initure.BaseAddress=baseaddr;	                    //设置基址
    MPU_Initure.Size=size;				                    //设置保护区域大小
    MPU_Initure.SubRegionDisable=0X00;                      //禁止子区域
    MPU_Initure.TypeExtField=Tex;                           //设置类型扩展域
    MPU_Initure.AccessPermission=(uint8_t)ap;		        //设置访问权限,
    MPU_Initure.DisableExec=ien;	                        //允许指令访问(允许读取指令)
    MPU_Initure.IsShareable=sen;                            //是否允许共用
    MPU_Initure.IsCacheable=cen;                            //是否允许cache
    MPU_Initure.IsBufferable=ben;                           //是否允许缓冲
    HAL_MPU_ConfigRegion(&MPU_Initure);                     //配置MPU
    HAL_MPU_Enable(MPU_PRIVILEGED_DEFAULT);			        //开启MPU
    return 0;
}

//设置需要保护的存储块
//必须对部分存储区域进行MPU保护,否则可能导致程序运行异常
//比如MCU屏不显示,摄像头采集数据出错等等问题...
void MPU_Config0(void)   //特意把SRAM4设置为不允许cache，使用DMA的变量可以放在这里。但要注意相应DMA能否访问SRAM4
{
    MPU_Set_Protection(0x20000000,MPU_REGION_SIZE_128KB,MPU_REGION_NUMBER1,MPU_REGION_FULL_ACCESS,1,0/*share*/,1/*cache*/,1/*buffer*/,MPU_TEX_LEVEL0);	//保护整个DTCM,共128K字节,禁止共用,允许cache,允许缓冲
    MPU_Set_Protection(0x24000000,MPU_REGION_SIZE_512KB,MPU_REGION_NUMBER2,MPU_REGION_FULL_ACCESS,1,0/*share*/,1/*cache*/,0/*buffer*/,MPU_TEX_LEVEL0);	//保护整个内部SRAM,包括SRAM1,SRAM2和DTCM,共512K字节
    MPU_Set_Protection(0x30000000,MPU_REGION_SIZE_512KB,MPU_REGION_NUMBER3,MPU_REGION_FULL_ACCESS,1,0/*share*/,1/*cache*/,1/*buffer*/,MPU_TEX_LEVEL0);	//保护整个SRAM1~SRAM3,共288K字节,禁止共用,允许cache,允许缓冲
    MPU_Set_Protection(0x38000000,MPU_REGION_SIZE_64KB ,MPU_REGION_NUMBER4,MPU_REGION_FULL_ACCESS,1,0/*share*/,0/*cache*/,1/*buffer*/,MPU_TEX_LEVEL0);	//保护整个SRAM4,共64K字节,禁止共用,不允许cache,允许缓冲
    MPU_Set_Protection(0x00000000,MPU_REGION_SIZE_64KB ,MPU_REGION_NUMBER5,MPU_REGION_FULL_ACCESS,1,0/*share*/,0/*cache*/,1/*buffer*/,MPU_TEX_LEVEL0);	//保护整个SRAM4,共64K字节,禁止共用,不允许cache,允许缓冲
    MPU_Set_Protection(0x60000000,MPU_REGION_SIZE_64MB ,MPU_REGION_NUMBER6,MPU_REGION_FULL_ACCESS,1,0/*share*/,0/*cache*/,0/*buffer*/,MPU_TEX_LEVEL0);	//保护MCU LCD屏所在的FMC区域,,共64M字节,禁止共用,禁止cache,禁止缓冲
    MPU_Set_Protection(0xC0000000,MPU_REGION_SIZE_64MB ,MPU_REGION_NUMBER7,MPU_REGION_FULL_ACCESS,1,0/*share*/,1/*cache*/,1/*buffer*/,MPU_TEX_LEVEL0);	//保护SDRAM区域,共32M字节,禁止共用,允许cache,允许缓冲
}

void MPU_Config(void)
{
    MPU_Region_InitTypeDef MPU_InitStruct = {0};
    
    /* Disables the MPU */
    HAL_MPU_Disable();
    
    /** Initializes and configures the Region and the memory to be protected
    */
    MPU_InitStruct.Enable = MPU_REGION_ENABLE;
    MPU_InitStruct.Number = MPU_REGION_NUMBER0;
    MPU_InitStruct.BaseAddress = 0x0;
    MPU_InitStruct.Size = MPU_REGION_SIZE_4GB;
    MPU_InitStruct.SubRegionDisable = 0x87;
    MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_ENABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_BUFFERABLE;
    
    HAL_MPU_ConfigRegion(&MPU_InitStruct);
    
//    MPU_Config0();
    
    /* Enables the MPU */
    HAL_MPU_Enable(MPU_PRIVILEGED_DEFAULT);
    
}

/**
* @brief  CPU L1-Cache enable.
* @param  None
* @retval None
*/
static void CPU_CACHE_Enable(void)
{
    /* Enable I-Cache */
    SCB_EnableICache();
    
    /* Enable D-Cache */
    SCB_EnableDCache();
}

/**
  * @brief  System Clock Configuration
  *         The system Clock is configured as follow :
  *            System Clock source            = PLL (HSE)
  *            SYSCLK(Hz)                     = 400000000 (CPU Clock)
  *            HCLK(Hz)                       = 200000000 (AXI and AHBs Clock)
  *            AHB Prescaler                  = 2
  *            D1 APB3 Prescaler              = 2 (APB3 Clock  100MHz)
  *            D2 APB1 Prescaler              = 2 (APB1 Clock  100MHz)
  *            D2 APB2 Prescaler              = 2 (APB2 Clock  100MHz)
  *            D3 APB4 Prescaler              = 2 (APB4 Clock  100MHz)
  *            HSE Frequency(Hz)              = 25000000
  *            PLL_M                          = 5
  *            PLL_N                          = 160
  *            PLL_P                          = 2
  *            PLL_Q                          = 4
  *            PLL_R                          = 2
  *            VDD(V)                         = 3.3
  *            Flash Latency(WS)              = 4
  * @param  None
  * @retval None
  */
static void SystemClock_Config(void)
{
    RCC_ClkInitTypeDef RCC_ClkInitStruct={0};
    RCC_OscInitTypeDef RCC_OscInitStruct={0};
    HAL_StatusTypeDef ret = HAL_OK;
    
    /*!< Supply configuration update enable */
    HAL_PWREx_ConfigSupply(PWR_LDO_SUPPLY);
    
    /* The voltage scaling allows optimizing the power consumption when the device is
       clocked below the maximum system frequency, to update the voltage scaling value
       regarding system frequency refer to product datasheet.  */
    __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE0);
    
    while(!__HAL_PWR_GET_FLAG(PWR_FLAG_VOSRDY)) {}
    
    /* Enable HSE Oscillator and activate PLL with HSE as source */
    RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
    RCC_OscInitStruct.HSEState = RCC_HSE_ON;
    RCC_OscInitStruct.HSIState = RCC_HSI_OFF;
    RCC_OscInitStruct.CSIState = RCC_CSI_OFF;
    RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
    RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
    
    RCC_OscInitStruct.PLL.PLLM = 5;
    RCC_OscInitStruct.PLL.PLLN = 192;
    RCC_OscInitStruct.PLL.PLLFRACN = 0;
    RCC_OscInitStruct.PLL.PLLP = 2;
    RCC_OscInitStruct.PLL.PLLQ = 2;
    RCC_OscInitStruct.PLL.PLLR = 2;
    
    RCC_OscInitStruct.PLL.PLLVCOSEL = RCC_PLL1VCOWIDE;
    RCC_OscInitStruct.PLL.PLLRGE = RCC_PLL1VCIRANGE_2;
    ret = HAL_RCC_OscConfig(&RCC_OscInitStruct);
    if(ret != HAL_OK)
    {
        while(1) { ; }
    }

/* Select PLL as system clock source and configure  bus clocks dividers */
    RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK
                                    | RCC_CLOCKTYPE_HCLK
                                    | RCC_CLOCKTYPE_D1PCLK1
                                    | RCC_CLOCKTYPE_PCLK1
                                    | RCC_CLOCKTYPE_PCLK2
                                    | RCC_CLOCKTYPE_D3PCLK1);
    
    RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
    RCC_ClkInitStruct.SYSCLKDivider = RCC_SYSCLK_DIV1;
    RCC_ClkInitStruct.AHBCLKDivider = RCC_HCLK_DIV2;
    RCC_ClkInitStruct.APB3CLKDivider = RCC_APB3_DIV2;
    RCC_ClkInitStruct.APB1CLKDivider = RCC_APB1_DIV2;
    RCC_ClkInitStruct.APB2CLKDivider = RCC_APB2_DIV2;
    RCC_ClkInitStruct.APB4CLKDivider = RCC_APB4_DIV2;
    ret = HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4);
    if(ret != HAL_OK)
    {
        while(1) { ; }
    }
}

////////////////////////////////////////////////////////////////////////////////
////
#ifdef __GNUC__
/* With GCC/RAISONANCE, small os_printf (option LD Linker->Libraries->Small os_printf
   set to 'Yes') calls __io_putchar() */
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif /* __GNUC__ */

//#pragma import(__use_no_semihosting)
//struct __FILE
//{
//    int handle;
//};
//FILE __stdout;
//_sys_exit(int x)
//{
//    x = x;
//}

/**
  * @brief  Retargets the C library os_printf function to the USART.
  * @param  None
  * @retval None
  */
PUTCHAR_PROTOTYPE
{
    /* Place your implementation of fputc here */
    /* e.g. write a character to the USART1 and Loop until the end of transmission */
    HAL_UART_Transmit(&BSP_USART1_Handle, (uint8_t *)&ch, 1, 0x100);
//    BSP_USART1_SendByte(ch);
//    BSP_USART1_DMATx((uint8_t*)&ch, 1);
    return ch;
}

////////////////////////////////////////////////////////////////////////////////
////

///**
//  * @brief  This function handles SysTick Handler.
//  * @param  None
//  * @retval None
//  */
//void SysTick_Handler(void)
//{
//    HAL_IncTick();
//}
////////////////////////////////////////////////////////////////////////////////
////

void Board_Init(void)
{
    SCB->CCR|=SCB_CCR_STKALIGN_Msk; // 栈对齐
    
    __HAL_RCC_GPIOH_CLK_ENABLE();
    __HAL_RCC_SYSCFG_CLK_ENABLE();
    
    /* Configure the MPU attributes */
//    MPU_Config();
    MPU_Config0();
    
    /* Enable the CPU Cache */
    CPU_CACHE_Enable();
    
    os_kernel_init();
    
    /* STM32H7xx HAL library initialization:
         - Systick timer is configured by default as source of time base, but user
           can eventually implement his proper time base source (a general purpose
           timer for example or other time source), keeping in mind that Time base
           duration should be kept 1ms since PPP_TIMEOUT_VALUEs are defined and
           handled in milliseconds basis.
         - Set NVIC Group Priority to 4
         - Low Level Initialization
       */
    HAL_Init();
    /* Configure the system clock to 400 MHz */
    SystemClock_Config();
//    HAL_NVIC_SetPriorityGrouping(NVIC_PRIORITYGROUP_0);
    HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK_DIV8);
    SysTick_Config(SystemCoreClock/OS_TICKS_PER_SECOND);
    HAL_NVIC_SetPriority(SysTick_IRQn, 0xFE, 0U);
    HAL_NVIC_SetPriority(PendSV_IRQn, 0xFF, 0U);
    
    BSP_USART1_Init();
    BSP_USART1_EnableDMATx();
    BSP_USART1_EnableRxIRQ();
    
    BSP_TIMDelay_Init();
    
//    BSP_LED2_Init();/*RED*/
//    BSP_LED3_Init(); /*GREEN*/
    BSP_LED4_Init();/*YELLOW*/
    BSP_LED5_Init();/*BLUE*/
}


