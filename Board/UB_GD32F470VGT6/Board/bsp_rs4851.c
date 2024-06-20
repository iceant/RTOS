#include <bsp_rs4851.h>
#include <os_kernel.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

#define USART_CLOCK 				RCU_UART6

#define USART_TX_GPIO_CLOCK         RCU_GPIOE
#define USART_TX_GPIOX 			    GPIOE
#define USART_TX_ALF_NUM 		    GPIO_AF_8
#define USART_TX_PIN 				GPIO_PIN_8

#define USART_RX_GPIO_CLOCK         RCU_GPIOE
#define USART_RX_GPIOX 			    GPIOE
#define USART_RX_ALF_NUM 		    GPIO_AF_8
#define USART_RX_PIN 				GPIO_PIN_7

#define RS485_DE_GPIO_CLOCK         RCU_GPIOE
#define RS485_DE_GPIOX 			    GPIOE
#define RS485_DE_ALF_NUM 		    GPIO_AF_0
#define RS485_DE_PIN 				GPIO_PIN_9

#define USARTx						UART6
#define USARTx_DATA_ADDRESS         ((uint32_t)&USART_DATA(USARTx))

#define USARTx_IRQn                 UART6_IRQn
#define USARTx_IRQHandler           UART6_IRQHandler

#define TxDMAx_CLOCK                RCU_DMA0
#define TxDMAx                      DMA0
#define TxDMAx_CHn                  DMA_CH1
#define TxDMA_SUBPERI               DMA_SUBPERI5

#define RS485_DE_Enable()           (GPIO_BOP(RS485_DE_GPIOX) = RS485_DE_PIN)
#define RS485_DE_Disable()          (GPIO_BC(RS485_DE_GPIOX) = RS485_DE_PIN)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
static BSP_RS4851_RxHandler BSP_RS4851__RxHandler = 0;
static void* BSP_RS4851__RxHandlerUserdata = 0;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

static void uart_config(uint32_t BaudRate, uint32_t word_length, uint32_t stop_bits, uint32_t parity){
    /* USART configure */
    usart_deinit(USARTx);
    usart_baudrate_set(USARTx, BaudRate);
    usart_word_length_set(USARTx, word_length /*USART_WL_8BIT*/);
    usart_stop_bit_set(USARTx, stop_bits/*USART_STB_1BIT*/);
    usart_parity_config(USARTx, parity/*USART_PM_NONE*/);
    usart_hardware_flow_rts_config(USARTx, USART_RTS_DISABLE);
    usart_hardware_flow_cts_config(USARTx, USART_CTS_DISABLE);
    usart_receive_config(USARTx, USART_RECEIVE_ENABLE);
    usart_transmit_config(USARTx, USART_TRANSMIT_ENABLE);
    usart_enable(USARTx);
}

void BSP_RS4851_Init(int BaudRate)
{
    /* enable GPIO clock */
    rcu_periph_clock_enable(USART_TX_GPIO_CLOCK);
    rcu_periph_clock_enable(USART_RX_GPIO_CLOCK);
    rcu_periph_clock_enable(RS485_DE_GPIO_CLOCK);
    

    /* enable USART clock */
    rcu_periph_clock_enable(USART_CLOCK);

    /* configure the USART0 TX pin and USART0 RX pin */
    gpio_af_set(USART_TX_GPIOX, USART_TX_ALF_NUM, USART_TX_PIN);
    gpio_af_set(USART_RX_GPIOX, USART_RX_ALF_NUM, USART_RX_PIN);
    //gpio_af_set(RS485_DE_GPIOX, RS485_DE_ALF_NUM, RS485_DE_PIN);

    /* configure USART0 TX as alternate function push-pull */
    gpio_mode_set(USART_TX_GPIOX, GPIO_MODE_AF, GPIO_PUPD_PULLUP, USART_TX_PIN);
    gpio_output_options_set(USART_TX_GPIOX, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, USART_TX_PIN);

    /* configure USART0 RX as alternate function push-pull */
    gpio_mode_set(USART_RX_GPIOX, GPIO_MODE_AF, GPIO_PUPD_PULLUP, USART_RX_PIN);
    gpio_output_options_set(USART_RX_GPIOX, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, USART_RX_PIN);
    
    gpio_mode_set(RS485_DE_GPIOX, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, RS485_DE_PIN);
    gpio_output_options_set(RS485_DE_GPIOX, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, RS485_DE_PIN);

    uart_config(BaudRate, USART_WL_8BIT, USART_STB_1BIT, USART_PM_NONE);
    
    RS485_DE_Disable();
}

void BSP_RS4851_SetRxHandler(BSP_RS4851_RxHandler rxHandler, void* userdata)
{
	BSP_RS4851__RxHandler = rxHandler;
	BSP_RS4851__RxHandlerUserdata = userdata;
}

void BSP_RS4851_EnableRxIRQ(void)
{
	nvic_irq_enable(USARTx_IRQn, 0, 0);
	usart_interrupt_enable(USARTx, USART_INT_RBNE);
}

void BSP_RS4851_EnableDMATx(void)
{
    /* enable DMA1 */
    rcu_periph_clock_enable(TxDMAx_CLOCK);
}

/*

void rs485_send_dma(uint8_t* buffer, uint16_t len)
{
    memcpy(tx_buffer, buffer, len);
    dma_transfer_number_config(USART_DMA_STREAM, len);
    dma_memory_address_config(USART_DMA_STREAM, (uint32_t)tx_buffer);
    dma_channel_enable(USART_DMA_STREAM);
}
*/

void BSP_RS4851_DMATx(uint8_t* txBuffer, uint32_t size)
{
    dma_single_data_parameter_struct dma_init_struct;
    
    RS485_DE_Enable();
    
    /* deinitialize DMA channel7(USART0 TX) */
    dma_deinit(TxDMAx, TxDMAx_CHn);
    dma_init_struct.direction = DMA_MEMORY_TO_PERIPH;
    dma_init_struct.memory0_addr = (uint32_t)txBuffer;
    dma_init_struct.memory_inc = DMA_MEMORY_INCREASE_ENABLE;
    dma_init_struct.periph_memory_width = DMA_PERIPH_WIDTH_8BIT;
    dma_init_struct.number = size;
    dma_init_struct.periph_addr = USARTx_DATA_ADDRESS;
    dma_init_struct.periph_inc = DMA_PERIPH_INCREASE_DISABLE;
    dma_init_struct.priority = DMA_PRIORITY_ULTRA_HIGH;
    dma_single_data_mode_init(TxDMAx, TxDMAx_CHn, &dma_init_struct);
    /* configure DMA mode */
    dma_circulation_disable(TxDMAx, TxDMAx_CHn);
    dma_channel_subperipheral_select(TxDMAx, TxDMAx_CHn, TxDMA_SUBPERI);
    /* enable DMA channel7 */
    dma_channel_enable(TxDMAx, TxDMAx_CHn);

    /* USART DMA enable for transmission and reception */
    usart_dma_transmit_config(USARTx, USART_TRANSMIT_DMA_ENABLE);
    //usart_dma_receive_config(USART0, USART_RECEIVE_DMA_ENABLE);
    
    /* wait DMA channel transfer complete */
    while(RESET == dma_flag_get(TxDMAx, TxDMAx_CHn, DMA_FLAG_FTF));
    
    RS485_DE_Disable();
}

void BSP_RS4851_Send(uint8_t* data, size_t size)
{
    size_t i;
    RS485_DE_Enable();
    for(i=0; i<size; i++){
        usart_data_transmit(USARTx, (uint8_t)*data++);    
        while(RESET == usart_flag_get(USARTx, USART_FLAG_TBE)){}    
    }
    RS485_DE_Disable();
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
        if(BSP_RS4851__RxHandler){
            BSP_RS4851__RxHandler(ch, BSP_RS4851__RxHandlerUserdata);
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


