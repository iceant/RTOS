#include "board.h"
#include <string.h>
#include <os_kernel.h>
////////////////////////////////////////////////////////////////////////////////
////

static void RCC_Configuration(void)
{
    /* Enable GPIO clock */
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_GPIOA, ENABLE);
    /* Enable USARTx Clock */
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_USART1, ENABLE);
}

static void GPIO_Configuration(void)
{
    GPIO_InitType GPIO_InitStructure;
    
    /* Initialize GPIO_InitStructure */
    GPIO_InitStruct(&GPIO_InitStructure);
    
    /* Configure USARTx Tx as alternate function push-pull */
    GPIO_InitStructure.Pin            = GPIO_PIN_9;
    GPIO_InitStructure.GPIO_Mode      = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Alternate = GPIO_AF4_USART1;
    GPIO_InitPeripheral(GPIOA, &GPIO_InitStructure);
    
    /* Configure USARTx Rx as alternate function push-pull and pull-up */
    GPIO_InitStructure.Pin            = GPIO_PIN_10;
    GPIO_InitStructure.GPIO_Pull      = GPIO_Pull_Up;
    GPIO_InitStructure.GPIO_Alternate = GPIO_AF4_USART1;
    GPIO_InitPeripheral(GPIOA, &GPIO_InitStructure);
}

static void USART_Configuration(void)
{
    USART_InitType USART_InitStructure;
    
    USART_StructInit(&USART_InitStructure);
    USART_InitStructure.BaudRate            = 115200;
    USART_InitStructure.WordLength          = USART_WL_8B;
    USART_InitStructure.StopBits            = USART_STPB_1;
    USART_InitStructure.Parity              = USART_PE_NO;
    USART_InitStructure.HardwareFlowControl = USART_HFCTRL_NONE;
    USART_InitStructure.Mode                = USART_MODE_RX | USART_MODE_TX;
    
    /* Configure USARTx */
    USART_Init(USART1, &USART_InitStructure);
    /* Enable the USARTx */
    USART_Enable(USART1, ENABLE);

}

////////////////////////////////////////////////////////////////////////////////
////

//#ifdef __GNUC__
//    #define PUTCHAR_PROTOTYPE int __io_putchar(int ch)                                                                \
//#else                                                                                                      \
//    #define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)                                                        \
//#endif

int __io_putchar(int ch)
{
    USART_SendData(USART1, (uint8_t)ch);
    while (USART_GetFlagStatus(USART1, USART_FLAG_TXDE) == RESET)
        ;
    
    return (ch);
}

int __io_getchar(void)
{
    /* Loop until the USARTy Receive Data Register is not empty */
    while (USART_GetFlagStatus(USART1, USART_FLAG_RXDNE) == RESET)
    {
    }
    /* Store the received byte in RxBuffer */
    return USART_ReceiveData(USART1);
}

////////////////////////////////////////////////////////////////////////////////
////

void board_init(void)
{
    RCC_Configuration();
    GPIO_Configuration();
    USART_Configuration();
}

void USART1_SendBytes(uint8_t* bytes, size_t size)
{
    for(size_t i=0; i<size; i++){
        USART_SendData(USART1, *bytes++);
        while (USART_GetFlagStatus(USART1, USART_FLAG_TXDE) == RESET)
            ;
    }
}

void USART1_SendString(const char* string)
{
    USART1_SendBytes((uint8_t*)string, strlen(string));
}

////////////////////////////////////////////////////////////////////////////////
////
static unsigned long s_systick_count = 0;
void SysTick_Handler(void)
{
    if(!os_kernel_ready()) return;

    s_systick_count++;
    bool need_schedule = false;
    os_thread_t* curr_thread = os_scheduler_current_thread();
    if(curr_thread->state==OS_THREAD_STATE_RUNNING){
        curr_thread->remain_ticks--;
        if(curr_thread->remain_ticks==0){
            curr_thread->state = OS_THREAD_STATE_YIELD;
            need_schedule = true;
        }
    }

    if(need_schedule){
        os_scheduler_schedule();
    }
}

