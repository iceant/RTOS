#include "dev_usart1.h"
#include <os_ringbuffer.h>
////////////////////////////////////////////////////////////////////////////////
////
#ifndef USART1_RX_BLOCK_SIZE
#define USART1_RX_BLOCK_SIZE 1024
#endif

#ifndef USART1_RX_STACK_SIZE
#define USART1_RX_STACK_SIZE 1024
#endif

#ifndef USART1_RX_THREAD_PRIORITY
#define USART1_RX_THREAD_PRIORITY 20
#endif

#ifndef USART1_RX_THREAD_TIMESLICE
#define USART1_RX_THREAD_TIMESLICE 10
#endif

////////////////////////////////////////////////////////////////////////////////
////

__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USART1_RxBlock[USART1_RX_BLOCK_SIZE];

__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USART1_RxThreadStack[USART1_RX_STACK_SIZE];

static os_ringbuffer_t USART1_RxBuffer;
static os_sem_t USART1_RxSem;
static os_thread_t USART1_RxThread;
static uint8_t USART1_StartFlag=0;

////////////////////////////////////////////////////////////////////////////////
////

static void USART1_RxThreadEntry(void* p){
    USART1_StartFlag = 1;
    while(1){
        os_sem_take(&USART1_RxSem, OS_WAIT_INFINITY);
        if(dev_USART1.recv){
            HW_USART_RecvResult result = dev_USART1.recv(&USART1_RxBuffer);
            if(result==kHW_USART_RecvResult_DONE || result==kHW_USART_RecvResult_SKIP){
                os_ringbuffer_reset(&USART1_RxBuffer);
            }
        }
        if(os_ringbuffer_is_full(&USART1_RxBuffer)){
            os_ringbuffer_reset(&USART1_RxBuffer);
        }
    }
}

static void USART1_Init(void){

    /* Enable GPIO clock */
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_GPIOA | RCC_APB2_PERIPH_AFIO, ENABLE);
    /* Enable USARTy and USARTz Clock */
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_USART1, ENABLE);

    ////////////////////////////////////////////////////////////////////////////////
    ////
    GPIO_InitType GPIO_InitStructure;

    /* Configure USARTx Tx as alternate function push-pull */
    GPIO_InitStructure.Pin        = GPIO_PIN_9;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_AF_PP;
    GPIO_InitPeripheral(GPIOA, &GPIO_InitStructure);

    /* Configure USARTx Rx as input floating */
    GPIO_InitStructure.Pin       = GPIO_PIN_10;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_InitPeripheral(GPIOA, &GPIO_InitStructure);

    ////////////////////////////////////////////////////////////////////////////////
    ////
    NVIC_InitType NVIC_InitStructure;

    /* Enable the USARTy Interrupt */
    NVIC_InitStructure.NVIC_IRQChannel            = USART1_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelCmd         = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

    ////////////////////////////////////////////////////////////////////////////////
    ////
    USART_InitType USART_InitStructure;

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

static int USART1_Send(uint8_t * data, os_size_t data_size){
    int i;
    for(i=0;i<data_size;i++){
        USART_SendData(USART1, (uint8_t)*data++);
        while (USART_GetFlagStatus(USART1, USART_FLAG_TXDE) == RESET)
            ;
    }
    return i;
}

static HW_USART_RecvResult USART1_Recv(os_ringbuffer_t * buffer){
    return kHW_USART_RecvResult_CONTINUE;
}

static void USART1_Startup(void)
{
    if(USART1_StartFlag==0){
        os_ringbuffer_init(&USART1_RxBuffer, USART1_RxBlock, sizeof(USART1_RxBlock));
        os_sem_init(&USART1_RxSem, "USART1_RxSem", 0, OS_QUEUE_FIFO);

        os_thread_init(&USART1_RxThread, "USART1_RxThread"
                , USART1_RxThreadEntry, 0
                , USART1_RxThreadStack, sizeof(USART1_RxThreadStack)
                , USART1_RX_THREAD_PRIORITY
                , USART1_RX_THREAD_TIMESLICE
        );

        os_thread_startup(&USART1_RxThread);
    }


    /* Enable the USARTx */
    USART_Enable(USART1, ENABLE);

    /* Enable USARTy Receive and Transmit interrupts */
    USART_ConfigInt(USART1, USART_INT_RXDNE, ENABLE);
}

static void USART1_Stop(void){
    /* Enable USARTy Receive and Transmit interrupts */
    USART_ConfigInt(USART1, USART_INT_RXDNE, DISABLE);

    USART_Enable(USART1, DISABLE);
}
////////////////////////////////////////////////////////////////////////////////
////
void USART1_IRQHandler(void){
    if (USART_GetIntStatus(USART1, USART_INT_RXDNE) != RESET)
    {
        /* Read one byte from the receive data register */
        os_ringbuffer_put(&USART1_RxBuffer, USART_ReceiveData(USART1));
        os_sem_release(&USART1_RxSem);
    }
}


////////////////////////////////////////////////////////////////////////////////
////

hw_usart_t dev_USART1={.handle=USART1
                       , .init=USART1_Init
                       , .startup = USART1_Startup
                       , .stop = USART1_Stop
                       , .send=USART1_Send
                       , .recv = USART1_Recv};


