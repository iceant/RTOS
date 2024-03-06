#include <dev_uart5.h>

#include <sdk_ringbuffer.h>
////////////////////////////////////////////////////////////////////////////////
////
#ifndef UART5_RX_BLOCK_SIZE
#define UART5_RX_BLOCK_SIZE 1024
#endif

#ifndef UART5_RX_STACK_SIZE
#define UART5_RX_STACK_SIZE 1024
#endif

#ifndef UART5_RX_THREAD_PRIORITY
#define UART5_RX_THREAD_PRIORITY 20
#endif

#ifndef UART5_RX_THREAD_TIMESLICE
#define UART5_RX_THREAD_TIMESLICE 10
#endif

////////////////////////////////////////////////////////////////////////////////
////

__ALIGNED(OS_ALIGN_SIZE)
static uint8_t UART5_RxBlock[UART5_RX_BLOCK_SIZE];

__ALIGNED(OS_ALIGN_SIZE)
static uint8_t UART5_RxThreadStack[UART5_RX_STACK_SIZE];

static sdk_ringbuffer_t UART5_RxBuffer;
static os_sem_t UART5_RxSem;
static os_thread_t UART5_RxThread;
static uint8_t UART5_StartFlag=0;

////////////////////////////////////////////////////////////////////////////////
////

static void UART5_RxThreadEntry(void* p){
    UART5_StartFlag = 1;
    while(1){
        os_sem_take(&UART5_RxSem, OS_WAIT_INFINITY);
        if(dev_UART5.recv){
            HW_USART_RecvResult result = dev_UART5.recv(&UART5_RxBuffer);
            if(result==kHW_USART_RecvResult_DONE || result==kHW_USART_RecvResult_SKIP){
                sdk_ringbuffer_reset(&UART5_RxBuffer);
            }
        }
        if(sdk_ringbuffer_is_full(&UART5_RxBuffer)){
            sdk_ringbuffer_reset(&UART5_RxBuffer);
        }
    }
}

static void UART5_Init(void){

    /* Enable GPIO clock */
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_GPIOE | RCC_APB2_PERIPH_AFIO, ENABLE);
    /* Enable USARTy and USARTz Clock */
    RCC_EnableAPB1PeriphClk(RCC_APB1_PERIPH_UART5, ENABLE);

    ////////////////////////////////////////////////////////////////////////////////
    ////
    GPIO_InitType GPIO_InitStructure;

    /* Configure USARTx Tx as alternate function push-pull */
    GPIO_InitStructure.Pin        = GPIO_PIN_8;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_AF_PP;
    GPIO_InitPeripheral(GPIOE, &GPIO_InitStructure);

    /* Configure USARTx Rx as input floating */
    GPIO_InitStructure.Pin       = GPIO_PIN_9;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_InitPeripheral(GPIOE, &GPIO_InitStructure);

    ////////////////////////////////////////////////////////////////////////////////
    ////
    NVIC_InitType NVIC_InitStructure;

    /* Enable the USARTy Interrupt */
    NVIC_InitStructure.NVIC_IRQChannel            = UART5_IRQn;
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
    USART_Init(UART5, &USART_InitStructure);

    /* Enable the USARTx */
    USART_Enable(UART5, ENABLE);
}

static int UART5_Send(uint8_t * data, os_size_t data_size){
    int i;
    for(i=0;i<data_size;i++){
        USART_SendData(UART5, (uint8_t)*data++);
        while (USART_GetFlagStatus(UART5, USART_FLAG_TXDE) == RESET)
            ;
    }
    return i;
}

static HW_USART_RecvResult UART5_Recv(sdk_ringbuffer_t * buffer){
    return kHW_USART_RecvResult_CONTINUE;
}

static void UART5_Startup(void)
{
    if(UART5_StartFlag==0){
        sdk_ringbuffer_init(&UART5_RxBuffer, UART5_RxBlock, sizeof(UART5_RxBlock));
        os_sem_init(&UART5_RxSem, "UART5_RxSem", 0, OS_QUEUE_FIFO);

        os_thread_init(&UART5_RxThread, "UART5_RxThread"
                , UART5_RxThreadEntry, 0
                , UART5_RxThreadStack, sizeof(UART5_RxThreadStack)
                , UART5_RX_THREAD_PRIORITY
                , UART5_RX_THREAD_TIMESLICE
        );

        os_thread_startup(&UART5_RxThread);
    }


    /* Enable the USARTx */
    USART_Enable(UART5, ENABLE);

    /* Enable USARTy Receive and Transmit interrupts */
    USART_ConfigInt(UART5, USART_INT_RXDNE, ENABLE);
}

static void UART5_Stop(void){
    /* Enable USARTy Receive and Transmit interrupts */
    USART_ConfigInt(UART5, USART_INT_RXDNE, DISABLE);

    USART_Enable(UART5, DISABLE);
}
////////////////////////////////////////////////////////////////////////////////
////
void UART5_IRQHandler(void){
    if (USART_GetIntStatus(UART5, USART_INT_RXDNE) != RESET)
    {
        /* Read one byte from the receive data register */
        sdk_ringbuffer_put(&UART5_RxBuffer, USART_ReceiveData(UART5));
        os_sem_release(&UART5_RxSem);
    }
}


////////////////////////////////////////////////////////////////////////////////
////

hw_usart_t dev_UART5={.handle=UART5
        , .init=UART5_Init
        , .startup = UART5_Startup
        , .stop = UART5_Stop
        , .send=UART5_Send
        , .recv = UART5_Recv};

