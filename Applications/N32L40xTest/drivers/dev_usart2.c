#include <dev_usart2.h>
#include <n32l40x.h>
#include <os_kernel.h>
#include <sdk_ringbuffer.h>
#include <stdio.h>
#include <sdk_hex.h>
////////////////////////////////////////////////////////////////////////////////
////
static sdk_ringbuffer_t USART2_RxBuffer;

#define USART2_RX_BLOCK_SIZE 1024
#define USART2_RX_STACK_SIZE 1024
__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USART2_RxBlock[USART2_RX_BLOCK_SIZE];

static os_sem_t USART2_RxLock;
static os_thread_t USART2_RxThread;
__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USART2_RxThreadStack[USART2_RX_STACK_SIZE];

////////////////////////////////////////////////////////////////////////////////
////
static void USART2_RxThread_Entry(void* p){
    while(1){
        os_sem_take(&USART2_RxLock, OS_WAIT_INFINITY);
        if(dev_USART2.recv){
            dev_usart_recv_result result = dev_USART2.recv(&USART2_RxBuffer);
            if(result==kDevUSARTRecvResult_DONE || result==kDevUSARTRecvResult_RESET){
                sdk_ringbuffer_reset(&USART2_RxBuffer);
            }
        }
        if(sdk_ringbuffer_is_full(&USART2_RxBuffer)){
            sdk_ringbuffer_reset(&USART2_RxBuffer);
        }
    }
}

static  int USART2_DriverInit(void){
    /* Enable GPIO clock */
    RCC_EnableAPB2PeriphClk(RCC_APB2_PERIPH_GPIOA, ENABLE);
    /* Enable USARTx Clock */
    RCC_EnableAPB1PeriphClk(RCC_APB1_PERIPH_USART2, ENABLE);
    
    ////////////////////////////////////////////////////////////////////////////////
    ////
    
    GPIO_InitType GPIO_InitStructure;
    
    /* Initialize GPIO_InitStructure */
    GPIO_InitStruct(&GPIO_InitStructure);
    
    /* Configure USARTx Tx as alternate function push-pull */
    GPIO_InitStructure.Pin            = GPIO_PIN_2;
    GPIO_InitStructure.GPIO_Mode      = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Alternate = GPIO_AF4_USART2;
    GPIO_InitPeripheral(GPIOA, &GPIO_InitStructure);
    
    /* Configure USARTx Rx as alternate function push-pull and pull-up */
    GPIO_InitStructure.Pin            = GPIO_PIN_3;
    GPIO_InitStructure.GPIO_Pull      = GPIO_Pull_Up;
    GPIO_InitStructure.GPIO_Alternate = GPIO_AF4_USART2;
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
    USART_Init(USART2, &USART_InitStructure);
    /* Enable the USARTx */
    USART_Enable(USART2, ENABLE);
    
    ////////////////////////////////////////////////////////////////////////////////
    ////
    NVIC_InitType NVIC_InitStructure;
    
    /* Enable the USART2 Interrupt */
    NVIC_InitStructure.NVIC_IRQChannel            = USART2_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelCmd         = ENABLE;
    NVIC_Init(&NVIC_InitStructure);
    USART_ConfigInt(USART2, USART_INT_RXDNE, ENABLE);
}


static int USART2_Send(uint8_t* bytes, size_t size)
{
    int i;
    sdk_ringbuffer_reset(&USART2_RxBuffer);
    for(i=0; i<size; i++){
        USART_SendData(USART2, *bytes++);
        while (USART_GetFlagStatus(USART2, USART_FLAG_TXDE) == RESET)
            ;
    }
    return i;
}

static int USART2_Startup(void){
    printf("USART2_Startup...\n");
    sdk_ringbuffer_init(&USART2_RxBuffer, USART2_RxBlock, USART2_RX_BLOCK_SIZE);
    os_sem_init(&USART2_RxLock, "USART2_RxLock", 0, OS_QUEUE_PRIO);
    
    os_thread_init(&USART2_RxThread, "USART2_RxThread", USART2_RxThread_Entry, 0, USART2_RxThreadStack, USART2_RX_STACK_SIZE, 20, 10);
    os_thread_startup(&USART2_RxThread);
    return 0;
}
////////////////////////////////////////////////////////////////////////////////
////
void USART2_IRQHandler(void){
    os_interrupt_enter();
    if (USART_GetFlagStatus(USART2, USART_FLAG_RXDNE) != RESET){
        sdk_ringbuffer_put(&USART2_RxBuffer, USART_ReceiveData(USART2));
        os_sem_release(&USART2_RxLock);
    }
    os_interrupt_leave();
}

////////////////////////////////////////////////////////////////////////////////
////

dev_usart_t dev_USART2={.handle = USART2, .init = USART2_DriverInit, .startup = USART2_Startup, .send = USART2_Send, .recv=0};

