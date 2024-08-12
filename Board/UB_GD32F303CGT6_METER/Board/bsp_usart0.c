#include <bsp_usart0.h>
#include <os_kernel.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#define USART_TX_GPIO_CLOCK         RCU_GPIOA
#define USART_RX_GPIO_CLOCK         RCU_GPIOA
#define USART_CLOCK 				RCU_USART0

#define USART_REMAP                 AFIO_PCF0_USART0_REMAP
#define USART_REMAP_VALUE           0

#define USART_TX_GPIOX 			    GPIOA
#define USART_TX_PIN 				GPIO_PIN_9

#define USART_RX_GPIOX 			    GPIOA
#define USART_RX_PIN 				GPIO_PIN_10

#define USARTx						USART0
#define USARTx_DATA_ADDRESS         ((uint32_t)&USART_DATA(USARTx))

#define USART_TX_DMA_CLOCK          RCU_DMA0
#define USART_TX_DMAx               DMA0
#define USART_TX_DMA_CHn            DMA_CH3

#define USARTx_IRQn                 USART0_IRQn
#define USARTx_IRQHandler           USART0_IRQHandler
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
static BSP_USART0_RxHandler         BSP_USART__RxHandler = 0;
static void*                        BSP_USART__RxHandlerUserdata = 0;
static os_mutex_t BSP_USART0__Mutex;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

void BSP_USART0_DeInit(void){
    rcu_periph_clock_disable(USART_TX_GPIO_CLOCK);
    rcu_periph_clock_disable(USART_RX_GPIO_CLOCK);
    rcu_periph_clock_disable(RCU_AF);
    rcu_periph_clock_disable(USART_CLOCK);
    rcu_periph_clock_disable(USART_TX_DMA_CLOCK);
}

void BSP_USART0_Init(void)
{

    os_mutex_init(&BSP_USART0__Mutex);

    /* enable GPIO clock */
    rcu_periph_clock_enable(USART_TX_GPIO_CLOCK);
    rcu_periph_clock_enable(USART_RX_GPIO_CLOCK);
    rcu_periph_clock_enable(RCU_AF);

    /* enable USART clock */
    rcu_periph_clock_enable(USART_CLOCK);

    /* configure USART0 TX as alternate function push-pull */
    gpio_init(USART_TX_GPIOX,GPIO_MODE_AF_PP,GPIO_OSPEED_50MHZ,USART_TX_PIN);

    /* configure USART0 RX as alternate function push-pull */
    gpio_init(USART_RX_GPIOX, GPIO_MODE_IN_FLOATING, GPIO_OSPEED_50MHZ, USART_RX_PIN);

    gpio_pin_remap_config(USART_REMAP, USART_REMAP_VALUE);


    /* USART configure */
    usart_deinit(USARTx);
    usart_baudrate_set(USARTx, 115200U);
    usart_word_length_set(USARTx, USART_WL_8BIT);
    usart_stop_bit_set(USARTx, USART_STB_1BIT);
    usart_parity_config(USARTx, USART_PM_NONE);
    usart_hardware_flow_rts_config(USARTx, USART_RTS_DISABLE);
    usart_hardware_flow_cts_config(USARTx, USART_CTS_DISABLE);
    usart_transmit_config(USARTx, USART_TRANSMIT_ENABLE);
    usart_receive_config(USARTx, USART_RECEIVE_ENABLE);
    usart_enable(USARTx);

}

void BSP_USART0_SetRxHandler(BSP_USART0_RxHandler rxHandler, void* userdata)
{
    BSP_USART__RxHandler = rxHandler;
    BSP_USART__RxHandlerUserdata = userdata;
}

void BSP_USART0_EnableRxIRQ(void)
{
    nvic_irq_enable(USARTx_IRQn, 0, 0);
    usart_interrupt_enable(USARTx, USART_INT_RBNE);
}

void BSP_USART0_EnableDMATx(void)
{
    /* enable DMA1 */
    rcu_periph_clock_enable(USART_TX_DMA_CLOCK);
}

void BSP_USART0_DMATx(uint8_t* txBuffer, uint32_t size)
{
    dma_parameter_struct dma_init_struct;

    /* deinitialize DMA channel7(USART0 TX) */
    dma_deinit(USART_TX_DMAx, USART_TX_DMA_CHn);
    dma_init_struct.direction = DMA_MEMORY_TO_PERIPHERAL;
    dma_init_struct.memory_addr = (uint32_t)txBuffer;
    dma_init_struct.memory_inc = DMA_MEMORY_INCREASE_ENABLE;
    dma_init_struct.memory_width = DMA_MEMORY_WIDTH_8BIT;
    dma_init_struct.number = size;
    dma_init_struct.periph_addr = USARTx_DATA_ADDRESS;
    dma_init_struct.periph_inc = DMA_PERIPH_INCREASE_DISABLE;
    dma_init_struct.periph_width = DMA_PERIPHERAL_WIDTH_8BIT;
    dma_init_struct.priority = DMA_PRIORITY_ULTRA_HIGH;
    dma_init(USART_TX_DMAx, USART_TX_DMA_CHn, &dma_init_struct);
    /* configure DMA mode */
    dma_circulation_disable(USART_TX_DMAx, USART_TX_DMA_CHn);

    /* enable DMA channel7 */
    dma_channel_enable(USART_TX_DMAx, USART_TX_DMA_CHn);

    /* USART DMA enable for transmission and reception */
    usart_dma_transmit_config(USARTx, USART_TRANSMIT_DMA_ENABLE);
    //usart_dma_receive_config(USART0, USART_RECEIVE_DMA_ENABLE);

    /* wait DMA channel transfer complete */
//    while(RESET == dma_flag_get(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_INTF_FTFIF));
    while(RESET == dma_flag_get(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_FLAG_FTF));

}

void BSP_USART0_Send(uint8_t* data, int size)
{
    for(int i=0; i<size; i++){
        usart_data_transmit(USARTx, (uint8_t)*data++);
        while(RESET == usart_flag_get(USARTx, USART_FLAG_TC));
    }
}


void BSP_USART0_Lock(void)
{
    os_mutex_lock(&BSP_USART0__Mutex);
}

void BSP_USART0_UnLock(void)
{
    os_mutex_unlock(&BSP_USART0__Mutex);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

void USARTx_IRQHandler(void)
{
    os_interrupt_enter();
    if((RESET != usart_interrupt_flag_get(USARTx, USART_INT_FLAG_RBNE)) &&
       (RESET != usart_flag_get(USARTx, USART_FLAG_RBNE)))
    {
        /* receive data */
        uint16_t ch = usart_data_receive(USARTx);
        if(BSP_USART__RxHandler){
            BSP_USART__RxHandler(ch, BSP_USART__RxHandlerUserdata);
        }
    }

    if(RESET!=usart_interrupt_flag_get(USARTx, USART_INT_FLAG_ERR_ORERR)
       && (RESET!=usart_flag_get(USARTx, USART_FLAG_ORERR)))
    {
        usart_flag_clear(USARTx, USART_FLAG_ORERR);
        usart_data_receive(USARTx);
    }
    os_interrupt_exit();
}

////////////////////////////////////////////////////////////////////////////////
////
C__ALIGNED(OS_ALIGN_SIZE)
static char os_printf__buffer[OS_PRINTF_BUFFER_SIZE];

int os_printf_putc(int ch, void* ud){
    usart_data_transmit(USARTx, (uint8_t)ch);
    while(RESET == usart_flag_get(USARTx, USART_FLAG_TBE));
    return ch;
}

int os_printf(const char* fmt, ...){
    int len;
    int i;
    va_list arg;
    char* buffer = os_printf__buffer;

    va_start(arg, fmt);
    len = vsnprintf(0, OS_PRINTF_BUFFER_SIZE, fmt, arg);
    va_end(arg);

    if(len >= OS_PRINTF_BUFFER_SIZE){
        buffer = OS_ALLOC(len);
        va_start(arg, fmt);
        len = vsnprintf(buffer, len, fmt, arg);
//        for(i=0; i<len; i++){
//            os_printf_putc(buffer[i], 0);
//        }
//        BSP_USART0_DMATx(buffer, len-1);
        BSP_USART0_Send(buffer, len-1);
        va_end(arg);
        OS_FREE(buffer);
    }else{
        va_start(arg, fmt);
        len = vsnprintf(buffer, OS_PRINTF_BUFFER_SIZE, fmt, arg);
//        for(i=0; i<len; i++){
//            os_printf_putc(buffer[i], 0);
//        }
//        BSP_USART0_DMATx(buffer, len);
        BSP_USART0_Send(buffer, len);
        va_end(arg);
    }

    return len;
}


