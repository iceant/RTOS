#include <bsp_a7670c.h>
#include <A7670C.h>
#include <os_kernel.h>
#include <bsp_usart1.h>
#include <sdk_hex.h>
////////////////////////////////////////////////////////////////////////////////
////
#define A7670C_RXTHREAD_STACK_SIZE (1024)
#define A7670C_RXBLOCK_SIZE (10240+512)

////////////////////////////////////////////////////////////////////////////////
////
#if defined(ENABLE_4G)
static void A7670C_GPIO_Init(void){
    rcu_periph_clock_enable(RCU_GPIOA);
    rcu_periph_clock_enable(RCU_GPIOD);
    rcu_periph_clock_enable(RCU_GPIOE);

    gpio_mode_set(GPIOD, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,GPIO_PIN_7);
    gpio_output_options_set(GPIOD, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_7);    /* POWER_MCU -- PWRKEY 4G */

    gpio_mode_set(GPIOA, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,GPIO_PIN_15);
    gpio_output_options_set(GPIOA, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_15);   /* RESET_MCU -- RESET 4G */

#if 0
    gpio_mode_set(GPIOD, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,GPIO_PIN_7);
    gpio_output_options_set(GPIOD, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_7);    /* POWER_MCU -- PWRKEY 4G */

    gpio_mode_set(GPIOE, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,GPIO_PIN_6);
    gpio_output_options_set(GPIOE, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_6);    /* 4G_PWEN */

    gpio_mode_set(GPIOD, GPIO_MODE_INPUT, GPIO_PUPD_NONE,GPIO_PIN_4);
    gpio_output_options_set(GPIOD, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,GPIO_PIN_4);   /* EXT_IN -- STATUS 4G Power On Test */

#endif
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
//    GPIO_BOP(GPIOA) = GPIO_PIN_15;
    gpio_bit_set(GPIOA, GPIO_PIN_15);
//    gpio_bit_set(GPIOE, GPIO_PIN_6);
}
static void A7670C_PwrRstPin_Off(void){
//    GPIO_BC(GPIOA) = GPIO_PIN_15;
    gpio_bit_reset(GPIOA, GPIO_PIN_15);
//    gpio_bit_reset(GPIOE, GPIO_PIN_6);
}
static uint8_t A7670C_PwrRstPin_Read(void){
    return gpio_input_bit_get(GPIOA, GPIO_PIN_15);
//    return gpio_input_bit_get(GPIOE, GPIO_PIN_6);
}

A7670C_Pin_T A7670C_power_reset={.on=A7670C_PwrRstPin_On, .off=A7670C_PwrRstPin_Off, .read=A7670C_PwrRstPin_Read};

/* ======================================================================================================================== */

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t A7670C_RxThdStack[A7670C_RXTHREAD_STACK_SIZE]={0};

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t A7670C_RxBlock[A7670C_RXBLOCK_SIZE]={0};

static os_thread_t A7670C_RxThread={0};
static os_semaphore_t A7670C_IO_RxSem={0};
static os_semaphore_t A7670C_WaitSem={0};
static sdk_ringbuffer_t A7670C_RxBuffer={0};
static bool A7670C_RxThreadFlag = false;

////////////////////////////////////////////////////////////////////////////////
////

static void A7670C_IO_RxThd(void* parameter){
    printf("[BSP_A7670C] OK\r\n");
    #if defined(A7670C_IO_DEBUG)
    int latest_used = 0;
    #endif
    int used = 0;
    A7670C_RxThreadFlag = true;
    while(1){
        while((used=sdk_ringbuffer_used(&A7670C_RxBuffer))==0){
            os_sem_take(&A7670C_IO_RxSem, OS_WAIT_INFINITY);
        }
        
        #if defined(A7670C_IO_DEBUG)
        if(latest_used!=used){
            latest_used = used;
            sdk_hex_dump("[BOARD_A7670C_Rx]", A7670C_RxBuffer.buffer, used);
        }
        #endif
        
        A7670C_HandleRequest(&A7670C_RxBuffer);
    }
}

static os_err_t A7670C_IO_Wait(os_tick_t tick){
    #if defined(A7670C_IO_DEBUG)
    os_printf("A7670C_IO_Wait[%s], priority=%d...\n", os_thread_self()->name, os_thread_self()->curr_priority);
    #endif
    return os_semaphore_take(&A7670C_WaitSem, tick);
}

static os_err_t A7670C_IO_Notify(void){
    #if defined(A7670C_IO_DEBUG)
    os_printf("A7670C_IO_Notify[%s], priority=%d...\n", os_thread_self()->name, os_thread_self()->curr_priority);
    #endif
    return os_semaphore_release(&A7670C_WaitSem);
}

static int A7670C_IO_Send(uint8_t* data, int size){
    BSP_USART1_Lock();
//    sdk_hex_dump("A7670C_IO_Send", data, size);
    sdk_ringbuffer_reset(&A7670C_RxBuffer);
    BSP_USART1_DMATx(data, size);
//    BSP_USART1_Send(data, size);
    BSP_USART1_UnLock();
    return size;
}


//static void A7670C_Reset(void){
//    A7670C_power_reset.on();
//    for(int i=0; i<0x3fffff; i++);
//    A7670C_power_reset.off();
//}

static A7670C_IO_T  A7670C_IO={.send=A7670C_IO_Send, .wait=A7670C_IO_Wait, .notify =A7670C_IO_Notify};


////////////////////////////////////////////////////////////////////////////////
////
static void BSP_USART1__OnRxData(uint16_t data, void* ud){
    if(A7670C_RxThreadFlag==true){
        sdk_ringbuffer_put(&A7670C_RxBuffer, (char)data);
        os_sem_release(&A7670C_IO_RxSem);
    }
}
////////////////////////////////////////////////////////////////////////////////
////

void BSP_A7670C_Init(void)
{
    A7670C_GPIO_Init();
    
    BSP_USART1_SetRxHandler(BSP_USART1__OnRxData, 0);
    
    sdk_ringbuffer_init(&A7670C_RxBuffer, A7670C_RxBlock, sizeof(A7670C_RxBlock));
    os_sem_init(&A7670C_IO_RxSem, "A7670C_IORxSem", 0, OS_QUEUE_FIFO);
    os_sem_init(&A7670C_WaitSem, "A7670C_WaitSem", 0, OS_QUEUE_FIFO);
    
    A7670C_Init(&A7670C_power_en, &A7670C_power_key, &A7670C_power_status, &A7670C_power_reset, &A7670C_IO);

    os_thread_init(&A7670C_RxThread, "A7670C_RxThd", A7670C_IO_RxThd, 0
            , A7670C_RxThdStack, sizeof(A7670C_RxThdStack)
            , 20, 10);
    os_thread_startup(&A7670C_RxThread);
}
#else
void BSP_A7670C_Init(void){}
#endif
