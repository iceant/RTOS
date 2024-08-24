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

////////////////////////////////////////////////////////////////////////////////
////

static BSP_USART0_RxHandler BSP_USART0__RxHandler = 0;
static void* BSP_USART0__RxHandlerUserdata = 0;

////////////////////////////////////////////////////////////////////////////////
////

void BSP_USART0_Init(void)
{
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
    nvic_irq_enable(USARTx_IRQn, 0, 1);
    usart_interrupt_enable(USARTx, USART_INT_RBNE);
}

void BSP_USART0_SetRxHandler(BSP_USART0_RxHandler rxHandler, void* userdata)
{
    BSP_USART0__RxHandler = rxHandler;
    BSP_USART0__RxHandlerUserdata = userdata;
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
        usart_flag_clear(USARTx, USART_FLAG_RBNE);
    }

    os_interrupt_leave();
}