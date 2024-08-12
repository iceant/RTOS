#include <bsp_usart1.h>
#include <os_kernel.h>
#include <stdio.h>
#include <sdk_hex.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
#define USART_TX_GPIO_CLOCK         RCU_GPIOD
#define USART_RX_GPIO_CLOCK         RCU_GPIOD
#define USART_CLOCK 				RCU_USART1

#define USART_TX_GPIOX 			    GPIOD
#define USART_TX_ALF_NUM 		    GPIO_AF_7
#define USART_TX_PIN 				GPIO_PIN_5

#define USART_RX_GPIOX 			    GPIOD
#define USART_RX_ALF_NUM 		    GPIO_AF_7
#define USART_RX_PIN 				GPIO_PIN_6

#define USARTx						USART1
#define USARTx_DATA_ADDRESS         ((uint32_t)&USART_DATA(USARTx))

#define USART_TX_DMA_CLOCK          RCU_DMA0
#define USART_TX_DMAx               DMA0
#define USART_TX_DMA_CHn            DMA_CH6
#define USART_TX_SUBPERIx           DMA_SUBPERI4
#define USART_TX_DMA_IRQn           DMA0_Channel6_IRQn
#define USART_TX_DMA_IRQHandler     DMA0_Channel6_IRQHandler

#define USARTx_IRQn                 USART1_IRQn
#define USARTx_IRQHandler           USART1_IRQHandler
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
static BSP_USART1_RxHandler         BSP_USART__RxHandler = 0;
static void*                        BSP_USART__RxHandlerUserdata = 0;
static os_mutex_t BSP_USART1__Mutex;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
void BSP_USART1_DeInit(void){
    usart_deinit(USARTx);
    rcu_periph_clock_disable(USART_TX_DMA_CLOCK);
    rcu_periph_clock_disable(USART_CLOCK);
    rcu_periph_clock_disable(USART_TX_GPIO_CLOCK);
    rcu_periph_clock_disable(USART_RX_GPIO_CLOCK);
}

void BSP_USART1_Init(void)
{
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

    os_mutex_init(&BSP_USART1__Mutex);
}

void BSP_USART1_SetRxHandler(BSP_USART1_RxHandler rxHandler, void* userdata)
{
    BSP_USART__RxHandler = rxHandler;
    BSP_USART__RxHandlerUserdata = userdata;
}

void BSP_USART1_EnableRxIRQ(void)
{
    nvic_irq_enable(USARTx_IRQn, 0, 1);
    usart_interrupt_enable(USARTx, USART_INT_RBNE);
}

void BSP_USART1_EnableDMATx(void)
{
    /* enable DMA1 */
    rcu_periph_clock_enable(USART_TX_DMA_CLOCK);

    dma_single_data_parameter_struct dma_init_struct;

    /* deinitialize DMA channel7(USART0 TX) */
    dma_deinit(USART_TX_DMAx, USART_TX_DMA_CHn);
    dma_init_struct.direction = DMA_MEMORY_TO_PERIPH;
    dma_init_struct.memory0_addr = (uint32_t)0;
    dma_init_struct.memory_inc = DMA_MEMORY_INCREASE_ENABLE;
    dma_init_struct.periph_memory_width = DMA_PERIPH_WIDTH_8BIT;
    dma_init_struct.number = 0;
    dma_init_struct.periph_addr = USARTx_DATA_ADDRESS;
    dma_init_struct.periph_inc = DMA_PERIPH_INCREASE_DISABLE;
    dma_init_struct.priority = DMA_PRIORITY_ULTRA_HIGH;
    dma_single_data_mode_init(USART_TX_DMAx, USART_TX_DMA_CHn, &dma_init_struct);
    /* configure DMA mode */
    dma_circulation_disable(USART_TX_DMAx, USART_TX_DMA_CHn);
    dma_channel_subperipheral_select(USART_TX_DMAx, USART_TX_DMA_CHn, USART_TX_SUBPERIx);

    dma_flow_controller_config(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_FLOW_CONTROLLER_DMA);

    /* USART DMA enable for transmission and reception */
    usart_dma_transmit_config(USARTx, USART_TRANSMIT_DMA_ENABLE);
//    usart_dma_receive_config(USARTx, USART_RECEIVE_DMA_ENABLE);


}

#define BSP_USART1_SHOW_FLAG(FLAG) printf("usart_interrupt_flag_get(%s):%d\n", #FLAG, usart_interrupt_flag_get(USARTx, FLAG))
#define BSP_USART1_DMA_FLAG(FLAG) printf("dma_flag_get(%s):%d\n", #FLAG, dma_flag_get(USART_TX_DMAx, USART_TX_DMA_CHn, FLAG))

//static __IO FlagStatus g_transfer_complete = RESET;
void BSP_USART1_DMATx(uint8_t* txBuffer, uint32_t size)
{
    sdk_hex_dump(__FUNCTION__ , txBuffer, size);

    dma_channel_disable(USART_TX_DMAx, USART_TX_DMA_CHn);

    dma_memory_address_config(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_MEMORY_0, (uint32_t)txBuffer);
    dma_transfer_number_config(USART_TX_DMAx, USART_TX_DMA_CHn, size);

    dma_flag_clear(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_FLAG_FTF);

//    BSP_USART1_DMA_FLAG(DMA_FLAG_FTF);
//    BSP_USART1_DMA_FLAG(DMA_FLAG_TAE);
//    BSP_USART1_DMA_FLAG(DMA_FLAG_FEE);
//    BSP_USART1_DMA_FLAG(DMA_FLAG_SDE);
//    BSP_USART1_DMA_FLAG(DMA_FLAG_HTF);

    /* enable DMA channel7 */
    dma_channel_enable(USART_TX_DMAx, USART_TX_DMA_CHn);

//    BSP_USART1_DMA_FLAG(DMA_FLAG_FTF);
//    BSP_USART1_DMA_FLAG(DMA_FLAG_TAE);
//    BSP_USART1_DMA_FLAG(DMA_FLAG_FEE);
//    BSP_USART1_DMA_FLAG(DMA_FLAG_SDE);
//    BSP_USART1_DMA_FLAG(DMA_FLAG_HTF);


    /* wait DMA channel transfer complete */
    while(RESET == dma_flag_get(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_FLAG_FTF));


}

void BSP_USART1_Send(uint8_t* data, int size)
{
    for(int i=0; i<size; i++){
        usart_data_transmit(USARTx, (uint8_t)*data++);
        while(RESET == usart_flag_get(USARTx, USART_FLAG_TBE));
    }
}


void BSP_USART1_Lock(void)
{
    os_mutex_lock(&BSP_USART1__Mutex);
}

void BSP_USART1_UnLock(void)
{
    os_mutex_unlock(&BSP_USART1__Mutex);
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

#if 1
void USART_TX_DMA_IRQHandler(void)
{
    os_interrupt_enter();
    if(dma_interrupt_flag_get(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_INT_FLAG_FTF)!=RESET) {
        dma_interrupt_flag_clear(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_INT_FLAG_FTF);
        printf("DMA_INT_FLAG_FTF\n");
    }

    if(dma_interrupt_flag_get(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_INT_FLAG_TAE)!=RESET) {
        dma_interrupt_flag_clear(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_INT_FLAG_TAE);
        printf("DMA_INT_FLAG_TAE\n");
    }

    if(dma_interrupt_flag_get(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_INT_FLAG_FEE)!=RESET) {
        dma_interrupt_flag_clear(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_INT_FLAG_FEE);
        printf("DMA_INT_FLAG_FEE\n");
    }

    if(dma_interrupt_flag_get(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_INT_FLAG_HTF)!=RESET) {
        dma_interrupt_flag_clear(USART_TX_DMAx, USART_TX_DMA_CHn, DMA_INT_FLAG_HTF);
        printf("DMA_INT_FLAG_HTF\n");
    }

    os_interrupt_exit();
}
#endif


