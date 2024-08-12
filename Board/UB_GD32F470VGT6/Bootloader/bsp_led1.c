#include <bsp_led1.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define LED1_GPIO_CLK   RCU_GPIOA
#define LED1_GPIO_PORT  GPIOA
#define LED1_GPIO_PIN   GPIO_PIN_5

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void BSP_LED1_Init(void)
{
    /* enable the led clock */
    rcu_periph_clock_enable(LED1_GPIO_CLK);
    /* configure led GPIO port */ 
    gpio_mode_set(LED1_GPIO_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LED1_GPIO_PIN);
    gpio_output_options_set(LED1_GPIO_PORT, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, LED1_GPIO_PIN);
}

void BSP_LED1_On(void)
{
    GPIO_BOP(LED1_GPIO_PORT) = LED1_GPIO_PIN;
}

void BSP_LED1_Off(void){
    GPIO_BC(LED1_GPIO_PORT) = LED1_GPIO_PIN;
}

void BSP_LED1_Toggle(void)
{
    GPIO_TG(LED1_GPIO_PORT) = LED1_GPIO_PIN;
}

