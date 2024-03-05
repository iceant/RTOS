#include <dev_usart1.h>
#include <n32l40x.h>
#include <os_kernel.h>
#include <sdk_ringbuffer.h>

////////////////////////////////////////////////////////////////////////////////
////
static sdk_ringbuffer_t USART1_RxBuffer;

#define USART1_RX_BLOCK_SIZE 1024
#define USART1_RX_STACK_SIZE 1024
__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USART1_RxBlock[USART1_RX_BLOCK_SIZE];

static os_sem_t USART1_RxLock;
static os_thread_t USART1_RxThread;
__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USART1_RxThreadStack[USART1_RX_STACK_SIZE];

////////////////////////////////////////////////////////////////////////////////
////
static void USART1_RxThread_Entry(void* p){
    while(1){
        os_sem_take(&USART1_RxLock, OS_WAIT_INFINITY);
        if(dev_USART1.recv){
            dev_usart_recv_result result = dev_USART1.recv(&USART1_RxBuffer);
            if(result==kDevUSARTRecvResult_DONE || result==kDevUSARTRecvResult_RESET){
                sdk_ringbuffer_reset(&USART1_RxBuffer);
            }
        }
        if(sdk_ringbuffer_is_full(&USART1_RxBuffer)){
            sdk_ringbuffer_reset(&USART1_RxBuffer);
        }
    }
}

static  int USART1_DriverInit(void){
    /* Enable GPIO clock */
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_GPIOA, ENABLE);
    /* Enable USARTx Clock */
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_USART1, ENABLE);

    ////////////////////////////////////////////////////////////////////////////////
    ////

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

    ////////////////////////////////////////////////////////////////////////////////
    ////
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

    ////////////////////////////////////////////////////////////////////////////////
    ////
    NVIC_InitType NVIC_InitStructure;

    /* Configure the NVIC Preemption Priority Bits */
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);

    /* Enable the USART1 Interrupt */
    NVIC_InitStructure.NVIC_IRQChannel            = USART1_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelCmd         = ENABLE;
    NVIC_Init(&NVIC_InitStructure);
    USART_ConfigInt(USART1, USART_INT_RXDNE, ENABLE);
}


static int USART1_Send(uint8_t* bytes, size_t size)
{
    int i;
    for(i=0; i<size; i++){
        USART_SendData(USART1, *bytes++);
        while (USART_GetFlagStatus(USART1, USART_FLAG_TXDE) == RESET)
            ;
    }
    return i;
}

static int USART1_Startup(void){
    sdk_ringbuffer_init(&USART1_RxBuffer, USART1_RxBlock, USART1_RX_BLOCK_SIZE);
    os_sem_init(&USART1_RxLock, "USART1_RxLock", 0, OS_QUEUE_PRIO);

    os_thread_init(&USART1_RxThread, "USART1_RxThread", USART1_RxThread_Entry, 0, USART1_RxThreadStack, USART1_RX_STACK_SIZE, 20, 10);
    os_thread_startup(&USART1_RxThread);

    return 0;
}
////////////////////////////////////////////////////////////////////////////////
////
void USART1_IRQHandler(void){
    os_interrupt_enter();
    if (USART_GetFlagStatus(USART1, USART_FLAG_RXDNE) != RESET){
        sdk_ringbuffer_put(&USART1_RxBuffer, USART_ReceiveData(USART1));
        os_sem_release(&USART1_RxLock);
    }
    os_interrupt_leave();
}

////////////////////////////////////////////////////////////////////////////////
////

dev_usart_t dev_USART1={.handle = USART1, .init = USART1_DriverInit, .startup = USART1_Startup, .send = USART1_Send, .recv=0};

