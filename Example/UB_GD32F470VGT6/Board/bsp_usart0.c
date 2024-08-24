#include <bsp_usart0.h>
#include <os_kernel.h>
#include <stdarg.h>
#include <stdio.h>
#include <cpu_spinlock.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#define USART_TX_GPIO_CLOCK         RCU_GPIOA
#define USART_RX_GPIO_CLOCK         RCU_GPIOA
#define USART_CLOCK 				RCU_USART0

#define USART_TX_GPIOX 			    GPIOA
#define USART_TX_ALF_NUM 		    GPIO_AF_7
#define USART_TX_PIN 				GPIO_PIN_9

#define USART_RX_GPIOX 			    GPIOA
#define USART_RX_ALF_NUM 		    GPIO_AF_7
#define USART_RX_PIN 				GPIO_PIN_10

#define USARTx						USART0
#define USARTx_DATA_ADDRESS         ((uint32_t)&USART_DATA(USARTx))

#define USART_TX_DMA_CLOCK          RCU_DMA1
#define USART_TX_DMAx               DMA1
#define USART_TX_DMA_CHn            DMA_CH7
#define USART_TX_SUBPERIx           DMA_SUBPERI4

#define USARTx_IRQn                 USART0_IRQn
#define USARTx_IRQHandler           USART0_IRQHandler

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
static BSP_USART0_RxHandler BSP_USART0__RxHandler = 0;
static void* BSP_USART0__RxHandlerUserdata = 0;
static bool BSP_USART0_DMATx_Enable = false;
static cpu_spinlock_t BSP_USART0_Lock;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

void BSP_USART0_Init(void)
{
    BSP_USART0_Lock = 0;

    /* enable GPIO clock */
    rcu_periph_clock_enable(USART_TX_GPIO_CLOCK);
    rcu_periph_clock_enable(USART_RX_GPIO_CLOCK);

    /* enable USART clock */
    rcu_periph_clock_enable(USART_CLOCK);

    /* configure the USART0 TX pin and USART0 RX pin */
    gpio_af_set(USART_TX_GPIOX, USART_TX_ALF_NUM, USART_TX_PIN);
    gpio_af_set(USART_RX_GPIOX, USART_RX_ALF_NUM, USART_RX_PIN);

    /* configure USART0 TX as alternate function push-pull */
    gpio_mode_set(USART_TX_GPIOX, GPIO_MODE_AF, GPIO_PUPD_PULLUP, USART_TX_PIN);
    gpio_output_options_set(USART_TX_GPIOX, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, USART_TX_PIN);

    /* configure USART0 RX as alternate function push-pull */
    gpio_mode_set(USART_RX_GPIOX, GPIO_MODE_AF, GPIO_PUPD_PULLUP, USART_RX_PIN);
    gpio_output_options_set(USART_RX_GPIOX, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, USART_RX_PIN);

    /* USART configure */
    usart_deinit(USARTx);
    usart_baudrate_set(USARTx, 115200U);
    usart_word_length_set(USARTx, USART_WL_8BIT);
    usart_stop_bit_set(USARTx, USART_STB_1BIT);
    usart_parity_config(USARTx, USART_PM_NONE);
    usart_hardware_flow_rts_config(USARTx, USART_RTS_DISABLE);
    usart_hardware_flow_cts_config(USARTx, USART_CTS_DISABLE);
    usart_receive_config(USARTx, USART_RECEIVE_ENABLE);
    usart_transmit_config(USARTx, USART_TRANSMIT_ENABLE);
    usart_enable(USARTx);
}

void BSP_USART0_DeInit(void){
    usart_deinit(USARTx);
    rcu_periph_clock_disable(USART_CLOCK);
    rcu_periph_clock_disable(USART_TX_GPIO_CLOCK);
    rcu_periph_clock_disable(USART_RX_GPIO_CLOCK);
}


void BSP_USART0_SetRxHandler(BSP_USART0_RxHandler rxHandler, void* userdata)
{
    BSP_USART0__RxHandler = rxHandler;
    BSP_USART0__RxHandlerUserdata = userdata;
}

void BSP_USART0_EnableRxIRQ(void)
{
    nvic_irq_enable(USARTx_IRQn, 0, 2);
    usart_interrupt_enable(USARTx, USART_INT_RBNE);
}

void BSP_USART0_EnableDMATx(void)
{
    /* enable DMA1 */
    rcu_periph_clock_enable(USART_TX_DMA_CLOCK);
    BSP_USART0_DMATx_Enable = true;
}

void BSP_USART0_DMATx(uint8_t* txBuffer, uint32_t size)
{
    dma_single_data_parameter_struct dma_init_struct;

    /* deinitialize DMA channel7(USART0 TX) */
    dma_deinit(USART_TX_DMAx, USART_TX_DMA_CHn);
    dma_init_struct.direction = DMA_MEMORY_TO_PERIPH;
    dma_init_struct.memory0_addr = (uint32_t)txBuffer;
    dma_init_struct.memory_inc = DMA_MEMORY_INCREASE_ENABLE;
    dma_init_struct.periph_memory_width = DMA_PERIPH_WIDTH_8BIT;
    dma_init_struct.number = size;
    dma_init_struct.periph_addr = USARTx_DATA_ADDRESS;
    dma_init_struct.periph_inc = DMA_PERIPH_INCREASE_DISABLE;
    dma_init_struct.priority = DMA_PRIORITY_ULTRA_HIGH;
    dma_single_data_mode_init(USART_TX_DMAx, USART_TX_DMA_CHn, &dma_init_struct);
    /* configure DMA mode */
    dma_circulation_disable(USART_TX_DMAx, USART_TX_DMA_CHn);
    dma_channel_subperipheral_select(USART_TX_DMAx, USART_TX_DMA_CHn, USART_TX_SUBPERIx);
    /* enable DMA channel7 */
    dma_channel_enable(USART_TX_DMAx, USART_TX_DMA_CHn);

    /* USART DMA enable for transmission and reception */
    usart_dma_transmit_config(USARTx, USART_TRANSMIT_DMA_ENABLE);
    //usart_dma_receive_config(USART0, USART_RECEIVE_DMA_ENABLE);

    /* wait DMA channel transfer complete */
    while(RESET == dma_flag_get(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_FLAG_FTF));

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
        usart_flag_clear(USARTx, USART_FLAG_RBNE);
        uint16_t ch = usart_data_receive(USARTx);
        if(BSP_USART0__RxHandler){
            BSP_USART0__RxHandler(ch, BSP_USART0__RxHandlerUserdata);
        }
    }

#if 0
    if(RESET!=usart_interrupt_flag_get(USARTx, USART_INT_FLAG_RBNE_ORERR)
        && (RESET!=usart_flag_get(USARTx, USART_FLAG_ORERR)))
    {
        printf("[USART0] USART_INT_FLAG_RBNE_ORERR!!!\n");
        usart_flag_clear(USARTx, USART_INT_FLAG_RBNE_ORERR);
        usart_data_receive(USARTx);
    }
#endif
    os_interrupt_leave();
}


////////////////////////////////////////////////////////////////////////////////
////



void BSP_USART0_SendByte(uint8_t b)
{
    os_critical_enter();
    usart_data_transmit(USARTx, (uint8_t)b);
    while(RESET == usart_flag_get(USARTx, USART_FLAG_TBE));
    os_critical_leave();
}

void BSP_USART0_Send(uint8_t * bytes, uint32_t size)
{
    uint32_t i;
    for(i=0; i<size; i++){
        usart_data_transmit(USARTx, (uint8_t)*bytes++);
        while(RESET == usart_flag_get(USARTx, USART_FLAG_TBE));
    }
}

static char printf_buffer[1204];
int BSP_USART0_Printf(const char* format, ...)
{
    va_list args;
    va_start(args, format);
    int len = vsnprintf(NULL, 0, format, args);
    va_end(args);
    if(len > OS_ARRAY_SIZE(printf_buffer)){
        char* buffer = (char*)OS_ALLOC(len + 1);
        va_start(args, format);
        len = vsnprintf(buffer, len + 1, format, args);
        va_end(args);
        buffer[len]='\0';
        if(!BSP_USART0_DMATx_Enable){
            BSP_USART0_Send((uint8_t*)buffer, len);
        }else{
            BSP_USART0_DMATx((uint8_t*)buffer, len);
        }
        OS_FREE(buffer);
    }else{
        va_start(args, format);
        len = vsnprintf(printf_buffer, len + 1, format, args);
        va_end(args);
        printf_buffer[len]='\0';
        if(!BSP_USART0_DMATx_Enable){
            BSP_USART0_Send((uint8_t*)printf_buffer, len);
        }else{
            BSP_USART0_DMATx((uint8_t*)printf_buffer, len);
        }
    }

    return len;
}




