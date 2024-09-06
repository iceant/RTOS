#include <bsp_usart0.h>
#include <os_kernel.h>
////////////////////////////////////////////////////////////////////////////////
////

#define USARTx                  USART0

#define USART_CLOCK             RCU_USART0

#define USART_TX_GPIO_CLOCK     RCU_GPIOA
#define USART_TX_GPIO           GPIOA
#define USART_TX_PIN            GPIO_PIN_9
#define USART_TX_AF             GPIO_AF_7

#define USART_RX_GPIO_CLOCK     RCU_GPIOA
#define USART_RX_GPIO           GPIOA
#define USART_RX_PIN            GPIO_PIN_10
#define USART_RX_AF             GPIO_AF_7

#define USARTx_IRQn             USART0_IRQn
#define USARTx_IRQHandler       USART0_IRQHandler

#define USARTx_DMA_TX_CLOCK         RCU_DMA1
#define USARTx_DMA_TX_DMAx          DMA1
#define USARTx_DMA_TX_DMA_CHn       DMA_CH7
#define USARTx_DMA_TX_DMA_SUBPERIn  DMA_SUBPERI4

#define USARTx_DMA_RX_CLOCK         RCU_DMA1
#define USARTx_DMA_RX_DMAx          DMA1
#define USARTx_DMA_RX_DMA_CHn       DMA_CH2
#define USARTx_DMA_RX_DMA_SUBPERIn  DMA_SUBPERI4

#define USARTx_DATA_ADDRESS         ((uint32_t)&USART_DATA(USARTx))
////////////////////////////////////////////////////////////////////////////////
////

static BSP_USART0_RxHandler BSP_USART0__RxHandler = 0;
static void* BSP_USART0__RxHandlerUserdata = 0;

static BSP_USART0_RxHandler BSP_USART0__RxDoneHandler = 0;
static void* BSP_USART0__RxDoneHandlerUserdata = 0;

////////////////////////////////////////////////////////////////////////////////
////

void BSP_USART0_SetOnRxDone(BSP_USART0_RxHandler rxHandler, void* userdata){
    BSP_USART0__RxDoneHandler = rxHandler;
    BSP_USART0__RxDoneHandlerUserdata = userdata;
}

void BSP_USART0_Init(void)
{
    BSP_USART0__RxDoneHandler = 0;
    BSP_USART0__RxDoneHandlerUserdata= 0;
    BSP_USART0__RxHandler = 0;
    BSP_USART0__RxHandlerUserdata = 0;
    
    
    rcu_periph_clock_enable(USART_TX_GPIO_CLOCK);
    rcu_periph_clock_enable(USART_RX_GPIO_CLOCK);
    rcu_periph_clock_enable(USART_CLOCK);
    
    /* configure the USART0 TX pin and USART0 RX pin */
    gpio_af_set(USART_TX_GPIO, USART_TX_AF, USART_TX_PIN);
    gpio_af_set(USART_RX_GPIO, USART_RX_AF, USART_RX_PIN);
    
    /* configure USART0 TX as alternate function push-pull */
    gpio_mode_set(USART_TX_GPIO, GPIO_MODE_AF, GPIO_PUPD_PULLUP, USART_TX_PIN);
    gpio_output_options_set(USART_TX_GPIO, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, USART_TX_PIN);
    
    /* configure USART0 RX as alternate function push-pull */
    gpio_mode_set(USART_RX_GPIO, GPIO_MODE_AF, GPIO_PUPD_PULLUP, USART_RX_PIN);
    gpio_output_options_set(USART_RX_GPIO, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, USART_RX_PIN);
    
    /* USART configure */
    usart_deinit(USARTx);
    usart_baudrate_set(USARTx, 115200U);
    usart_receive_config(USARTx, USART_RECEIVE_ENABLE);
    usart_transmit_config(USARTx, USART_TRANSMIT_ENABLE);
    usart_enable(USARTx);
}

void BSP_USART0_EnableRxIRQ(void)
{
    nvic_irq_enable(USARTx_IRQn, 0, 2);
    usart_interrupt_enable(USARTx, USART_INT_RBNE);
}

void BSP_USART0_SetRxHandler(BSP_USART0_RxHandler rxHandler, void* userdata)
{
    BSP_USART0__RxHandler = rxHandler;
    BSP_USART0__RxHandlerUserdata = userdata;
}

void BSP_USART0_EnableDMATx(void){
    rcu_periph_clock_enable(USARTx_DMA_TX_CLOCK);
    usart_dma_transmit_config(USARTx, USART_TRANSMIT_DMA_ENABLE);
}

void BSP_USART0_EnableDMARx(void){
    rcu_periph_clock_enable(USARTx_DMA_RX_CLOCK);
    usart_dma_receive_config(USARTx, USART_RECEIVE_DMA_ENABLE);
    nvic_irq_enable(USARTx_IRQn, 0, 2);
    usart_interrupt_enable(USARTx, USART_INT_IDLE);
}

void BSP_USART0_DMATx(uint8_t* txBuffer, size_t size){
    dma_single_data_parameter_struct dma_init_struct;
    /* deinitialize DMA channel7(USART0 TX) */
    dma_deinit(USARTx_DMA_TX_DMAx, USARTx_DMA_TX_DMA_CHn);
    dma_init_struct.direction = DMA_MEMORY_TO_PERIPH;
    dma_init_struct.memory0_addr = (uint32_t)txBuffer;
    dma_init_struct.memory_inc = DMA_MEMORY_INCREASE_ENABLE;
    dma_init_struct.periph_memory_width = DMA_PERIPH_WIDTH_8BIT;
    dma_init_struct.number = size;
    dma_init_struct.periph_addr = USARTx_DATA_ADDRESS;
    dma_init_struct.periph_inc = DMA_PERIPH_INCREASE_DISABLE;
    dma_init_struct.priority = DMA_PRIORITY_ULTRA_HIGH;
    dma_single_data_mode_init(USARTx_DMA_TX_DMAx, USARTx_DMA_TX_DMA_CHn, &dma_init_struct);
    /* configure DMA mode */
    dma_circulation_disable(USARTx_DMA_TX_DMAx, USARTx_DMA_TX_DMA_CHn);
    dma_channel_subperipheral_select(USARTx_DMA_TX_DMAx, USARTx_DMA_TX_DMA_CHn, USARTx_DMA_TX_DMA_SUBPERIn);
    /* enable DMA channel7 */
    dma_channel_enable(USARTx_DMA_TX_DMAx, USARTx_DMA_TX_DMA_CHn);
    
    /* USART DMA enable for transmission and reception */
    usart_dma_transmit_config(USARTx, USART_TRANSMIT_DMA_ENABLE);
//    usart_dma_receive_config(USART0, USART_RECEIVE_DMA_ENABLE);
    
    /* wait DMA channel transfer complete */
    while(RESET == dma_flag_get(USARTx_DMA_TX_DMAx, USARTx_DMA_TX_DMA_CHn, DMA_FLAG_FTF));
}

void BSP_USART0_DMARxSetNumber(size_t number){
    dma_transfer_number_config(USARTx_DMA_RX_DMAx, USARTx_DMA_RX_DMA_CHn, number);
}

void BSP_USART0_DMARx(uint8_t* rxBuffer, size_t size){
    dma_single_data_parameter_struct dma_init_struct;
    /* deinitialize DMA channel7(USART0 TX) */
    dma_deinit(USARTx_DMA_RX_DMAx, USARTx_DMA_RX_DMA_CHn);
    dma_init_struct.direction = DMA_PERIPH_TO_MEMORY;
    dma_init_struct.memory0_addr = (uint32_t)rxBuffer;
    dma_init_struct.memory_inc = DMA_MEMORY_INCREASE_ENABLE;
    dma_init_struct.number = size;
    dma_init_struct.periph_addr = USARTx_DATA_ADDRESS;
    dma_init_struct.periph_inc = DMA_PERIPH_INCREASE_DISABLE;
    dma_init_struct.periph_memory_width = DMA_PERIPH_WIDTH_8BIT;
    dma_init_struct.priority = DMA_PRIORITY_ULTRA_HIGH;
    dma_single_data_mode_init(USARTx_DMA_RX_DMAx, USARTx_DMA_RX_DMA_CHn, &dma_init_struct);
    /* configure DMA mode */
    dma_circulation_disable(USARTx_DMA_RX_DMAx, USARTx_DMA_RX_DMA_CHn);
    dma_channel_subperipheral_select(USARTx_DMA_RX_DMAx, USARTx_DMA_RX_DMA_CHn, USARTx_DMA_RX_DMA_SUBPERIn);
    /* enable DMA channel7 */
    dma_channel_enable(USARTx_DMA_RX_DMAx, USARTx_DMA_RX_DMA_CHn);
    
    /* USART DMA enable for transmission and reception */
//    usart_dma_transmit_config(USART0, USART_TRANSMIT_DMA_ENABLE);
    usart_dma_receive_config(USART0, USART_RECEIVE_DMA_ENABLE);
}
////////////////////////////////////////////////////////////////////////////////
////

void USARTx_IRQHandler(void)
{
    os_interrupt_enter();
    if((RESET != usart_interrupt_flag_get(USARTx, USART_INT_FLAG_RBNE)) &&
       (RESET != usart_flag_get(USARTx, USART_FLAG_RBNE)))
    {
        /* receive data */
        uint16_t ch = usart_data_receive(USARTx);
        if(BSP_USART0__RxHandler){
            BSP_USART0__RxHandler(ch, BSP_USART0__RxHandlerUserdata);
        }
    }
    
    
    if((RESET != usart_interrupt_flag_get(USARTx, USART_INT_FLAG_IDLE)) &&
       (RESET != usart_flag_get(USARTx, USART_FLAG_IDLE)))
    {
        /* clear IDLE flag */
        usart_data_receive(USARTx);
        
        if(BSP_USART0__RxDoneHandler){
            BSP_USART0__RxDoneHandler(dma_transfer_number_get(USARTx_DMA_RX_DMAx, USARTx_DMA_RX_DMA_CHn), BSP_USART0__RxDoneHandlerUserdata);
        }
        
        /* disable DMA and reconfigure */
        dma_channel_disable(USARTx_DMA_RX_DMAx, USARTx_DMA_RX_DMA_CHn);
        dma_flag_clear(USARTx_DMA_RX_DMAx, USARTx_DMA_RX_DMA_CHn, DMA_FLAG_FTF);
        dma_channel_enable(USARTx_DMA_RX_DMAx, USARTx_DMA_RX_DMA_CHn);
    }
    
    os_interrupt_leave();
}

