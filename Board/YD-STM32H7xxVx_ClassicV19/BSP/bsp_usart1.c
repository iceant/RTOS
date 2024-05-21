#include <bsp_usart1.h>
#include <os_kernel.h>
#include <string.h>
#include <stdio.h>
#include <stdarg.h>
#include <bsp_led4.h>
////////////////////////////////////////////////////////////////////////////////
////
#define USARTx                           USART1
#define USARTx_CLK_ENABLE()              __HAL_RCC_USART1_CLK_ENABLE()
#define USARTx_TX_GPIO_CLK_ENABLE()      __HAL_RCC_GPIOA_CLK_ENABLE()
#define USARTx_RX_GPIO_CLK_ENABLE()      __HAL_RCC_GPIOA_CLK_ENABLE()

#define USARTx_FORCE_RESET()             __HAL_RCC_USART1_FORCE_RESET()
#define USARTx_RELEASE_RESET()           __HAL_RCC_USART1_RELEASE_RESET()

/* Definition for USARTx Pins */
#define USARTx_TX_PIN                    GPIO_PIN_9
#define USARTx_TX_GPIO_PORT              GPIOA
#define USARTx_TX_AF                     GPIO_AF7_USART1
#define USARTx_RX_PIN                    GPIO_PIN_10
#define USARTx_RX_GPIO_PORT              GPIOA
#define USARTx_RX_AF                     GPIO_AF7_USART1

/* Definition for USARTx's NVIC IRQ and IRQ Handlers */
#define USARTx_IRQn                      USART1_IRQn
#define USARTx_IRQHandler                USART1_IRQHandler

#define USARTx_BAUDRATE                 921600U

#define DMA_CLOCK_ENABLE                __HAL_RCC_DMA1_CLK_ENABLE
#define USARTx_TX_DMA_STREAM            DMA1_Stream0
#define USARTx_TX_DMA_CHANNEL           DMA_REQUEST_USART1_TX

////////////////////////////////////////////////////////////////////////////////
////

UART_HandleTypeDef BSP_USART1_Handle;
DMA_HandleTypeDef  BSP_USART1_DMATxHandle;

static cpu_spinlock_t tx_lock=0;
////////////////////////////////////////////////////////////////////////////////
////


/**
  * @brief UART MSP Initialization
  *        This function configures the hardware resources used in this example:
  *           - Peripheral's clock enable
  *           - Peripheral's GPIO Configuration
  *           - NVIC configuration for DMA interrupt request enable
  * @param huart: UART handle pointer
  * @retval None
  */
static void BSP_USART1_MspInit(void)
{
    GPIO_InitTypeDef  GPIO_InitStruct;
    
    RCC_PeriphCLKInitTypeDef RCC_PeriphClkInit;
    
    /*##-1- Enable peripherals and GPIO Clocks #################################*/
    /* Enable GPIO TX/RX clock */
    USARTx_TX_GPIO_CLK_ENABLE();
    USARTx_RX_GPIO_CLK_ENABLE();
    
    /* Select SysClk as source of USART1 clocks */
    RCC_PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1;
    RCC_PeriphClkInit.Usart16ClockSelection = RCC_USART16CLKSOURCE_D2PCLK2;
    HAL_RCCEx_PeriphCLKConfig(&RCC_PeriphClkInit);
    
    /* Enable USARTx clock */
    USARTx_CLK_ENABLE();
    
    /*##-2- Configure peripheral GPIO ##########################################*/
    /* UART TX GPIO pin configuration  */
    GPIO_InitStruct.Pin       = USARTx_TX_PIN;
    GPIO_InitStruct.Mode      = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Pull      = GPIO_PULLUP;
    GPIO_InitStruct.Speed     = GPIO_SPEED_FREQ_VERY_HIGH;
    GPIO_InitStruct.Alternate = USARTx_TX_AF;
    
    HAL_GPIO_Init(USARTx_TX_GPIO_PORT, &GPIO_InitStruct);
    
    /* UART RX GPIO pin configuration  */
    GPIO_InitStruct.Pin = USARTx_RX_PIN;
    GPIO_InitStruct.Alternate = USARTx_RX_AF;
    
    HAL_GPIO_Init(USARTx_RX_GPIO_PORT, &GPIO_InitStruct);
    
    /*##-3- Configure the NVIC for UART ########################################*/
    /* NVIC for USARTx */
    HAL_NVIC_SetPriority(USARTx_IRQn, 0, 1);
    HAL_NVIC_EnableIRQ(USARTx_IRQn);
}

/**
  * @brief UART MSP De-Initialization
  *        This function frees the hardware resources used in this example:
  *          - Disable the Peripheral's clock
  *          - Revert GPIO and NVIC configuration to their default state
  * @param huart: UART handle pointer
  * @retval None
  */
static void BSP_USART1_MspDeInit(void)
{
    /*##-1- Reset peripherals ##################################################*/
    USARTx_FORCE_RESET();
    USARTx_RELEASE_RESET();
    
    /*##-2- Disable peripherals and GPIO Clocks ################################*/
    /* Configure UART Tx as alternate function  */
    HAL_GPIO_DeInit(USARTx_TX_GPIO_PORT, USARTx_TX_PIN);
    /* Configure UART Rx as alternate function  */
    HAL_GPIO_DeInit(USARTx_RX_GPIO_PORT, USARTx_RX_PIN);
    
    /*##-3- Disable the NVIC for UART ##########################################*/
    HAL_NVIC_DisableIRQ(USARTx_IRQn);
}

////////////////////////////////////////////////////////////////////////////////
////

int BSP_USART1_Init(void){
    
    BSP_USART1_MspInit();
    
    /*##-1- Configure the UART peripheral ######################################*/
    /* Put the USART peripheral in the Asynchronous mode (UART Mode) */
    /* UART configured as follows:
        - Word Length = 8 Bits (7 data bit + 1 parity bit) :
                        BE CAREFUL : Program 7 data bits + 1 parity bit in PC HyperTerminal
        - Stop Bit    = One Stop bit
        - Parity      = ODD parity
        - BaudRate    = 9600 baud
        - Hardware flow control disabled (RTS and CTS signals) */
    BSP_USART1_Handle.Instance        = USARTx;
    
    BSP_USART1_Handle.Init.BaudRate   = USARTx_BAUDRATE;
    BSP_USART1_Handle.Init.WordLength = UART_WORDLENGTH_8B;
    BSP_USART1_Handle.Init.StopBits   = UART_STOPBITS_1;
    BSP_USART1_Handle.Init.Parity     = UART_PARITY_NONE;
    BSP_USART1_Handle.Init.HwFlowCtl  = UART_HWCONTROL_NONE;
    BSP_USART1_Handle.Init.Mode       = UART_MODE_TX_RX;
    BSP_USART1_Handle.Init.OverSampling = UART_OVERSAMPLING_8;
    
    if(HAL_UART_Init(&BSP_USART1_Handle) != HAL_OK)
    {
        /* Initialization Error */
        return BSP_USART1_ERROR;
    }
    
    return BSP_USART1_OK;
}

void BSP_USART1_DeInit(void)
{
    BSP_USART1_MspDeInit();
}

void BSP_USART1_SendByte(uint8_t ch)
{
    HAL_UART_Transmit(&BSP_USART1_Handle, (uint8_t *)&ch, 1, 0x10);
    while (HAL_UART_GetState(&BSP_USART1_Handle) != HAL_UART_STATE_READY);
}


void BSP_USART1_EnableDMATx(void)
{
    /* Enable DMA clock */
    DMA_CLOCK_ENABLE();
    
    HAL_DMA_DeInit(&BSP_USART1_DMATxHandle);
    /*##-3- Configure the DMA ##################################################*/
    /* Configure the DMA handler for Transmission process */
    BSP_USART1_DMATxHandle.Instance                 = USARTx_TX_DMA_STREAM;
    BSP_USART1_DMATxHandle.Init.Request             = USARTx_TX_DMA_CHANNEL;
    BSP_USART1_DMATxHandle.Init.Direction           = DMA_MEMORY_TO_PERIPH;
    BSP_USART1_DMATxHandle.Init.PeriphInc           = DMA_PINC_DISABLE;
    BSP_USART1_DMATxHandle.Init.MemInc              = DMA_MINC_ENABLE;
    BSP_USART1_DMATxHandle.Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
    BSP_USART1_DMATxHandle.Init.MemDataAlignment    = DMA_MDATAALIGN_BYTE;
    BSP_USART1_DMATxHandle.Init.Mode                = DMA_NORMAL;
    BSP_USART1_DMATxHandle.Init.Priority            = DMA_PRIORITY_HIGH;
    BSP_USART1_DMATxHandle.Init.FIFOMode            = DMA_FIFOMODE_DISABLE;
    BSP_USART1_DMATxHandle.Init.FIFOThreshold       = DMA_FIFO_THRESHOLD_FULL;
    BSP_USART1_DMATxHandle.Init.MemBurst            = DMA_MBURST_INC4;
    BSP_USART1_DMATxHandle.Init.PeriphBurst         = DMA_PBURST_INC4;
    
    HAL_DMA_Init(&BSP_USART1_DMATxHandle);
    
    /* Associate the initialized DMA handle to the UART handle */
    __HAL_LINKDMA(&BSP_USART1_Handle, hdmatx, BSP_USART1_DMATxHandle);
}

int BSP_USART1_DMATxString(const char* message){
    return BSP_USART1_DMATx((uint8_t*)message, strlen(message));
}

int BSP_USART1_DMATx(uint8_t* data, size_t size)
{
    
    int timeout = 0x1000;
    HAL_UART_Transmit_DMA(&BSP_USART1_Handle, (uint8_t*)data, size);
    while (HAL_UART_GetState(&BSP_USART1_Handle) != HAL_UART_STATE_READY && (timeout--))
    {}
    
    if(timeout==0) return -1;
    
}

static BSP_USART1_RxHandler BSP_USART1__RxHandler = 0;
static void* BSP_USART1__RxHandlerUserdata = 0;


void BSP_USART1_SetRxHandler(BSP_USART1_RxHandler rxHandler, void* userdata){
    BSP_USART1__RxHandler = rxHandler;
    BSP_USART1__RxHandlerUserdata = userdata;
}


void USARTx_IRQHandler(void)
{
    uint8_t ch;
    os_interrupt_enter();
    
    if(__HAL_UART_GET_FLAG(&BSP_USART1_Handle, UART_FLAG_RXNE)){
        __HAL_UART_CLEAR_FLAG(&BSP_USART1_Handle, UART_FLAG_RXNE);

        HAL_UART_Receive(&BSP_USART1_Handle, &ch, 1, 0x100);
        if(BSP_USART1__RxHandler){
            BSP_USART1__RxHandler(ch, BSP_USART1__RxHandlerUserdata);
        }
    }
    
    if(__HAL_UART_GET_FLAG(&BSP_USART1_Handle, USART_FLAG_ORE)==SET){
        __HAL_UART_CLEAR_FLAG(&BSP_USART1_Handle, UART_FLAG_ORE);
        HAL_UART_Receive(&BSP_USART1_Handle, (uint8_t*)&ch, 1, 0x100);
    }
    
    HAL_UART_IRQHandler(&BSP_USART1_Handle);
    
    os_interrupt_exit();
}

#if 0
/**
  * @brief  Tx Transfer completed callback
  * @param  UartHandle: UART handle.
  * @note   This example shows a simple way to report end of IT Tx transfer, and
  *         you can add your own implementation.
  * @retval None
  */
void HAL_UART_TxCpltCallback(UART_HandleTypeDef *UartHandle)
{

}

/**
  * @brief  Rx Transfer completed callback
  * @param  UartHandle: UART handle
  * @note   This example shows a simple way to report end of IT Rx transfer, and
  *         you can add your own implementation
  * @retval None
  */
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *UartHandle)
{

}

/**
  * @brief  UART error callbacks
  * @param  UartHandle: UART handle
  * @note   This example shows a simple way to report transfer error, and you can
  *         add your own implementation.
  * @retval None
  */
void HAL_UART_ErrorCallback(UART_HandleTypeDef *UartHandle)
{

}
#endif

static char printf_buffer[1204];

int BSP_USART1_Printf(const char* format, ...)
{
    va_list args;
    va_start(args, format);
    int len = vsnprintf(NULL, 0, format, args);
    va_end(args);
    if(len > OS_ARRAY_SIZE(printf_buffer)){
        LED_YELLOW_Toggle();
        char* buffer = (char*)malloc(len + 1);
        va_start(args, format);
        len = vsnprintf(buffer, len + 1, format, args);
        va_end(args);
        buffer[len]='\0';
        
        for(int i=0; i<len; i++){
            BSP_USART1_SendByte(buffer[i]);
        }
        free(buffer);
    }else{
        va_start(args, format);
        len = vsnprintf(printf_buffer, len + 1, format, args);
        va_end(args);
        printf_buffer[len]='\0';
        for(int i=0; i<len; i++){
            BSP_USART1_SendByte(printf_buffer[i]);
        }
    }
    
    
    return len;
}

