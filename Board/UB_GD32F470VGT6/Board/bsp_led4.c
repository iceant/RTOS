#include <bsp_led1.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define LED_GPIO_CLK   RCU_GPIOC
#define LED_GPIO_PORT  GPIOC
#define LED_GPIO_PIN   GPIO_PIN_4

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void BSP_LED4_Init(void)
{
    /* enable the led clock */
    rcu_periph_clock_enable(LED_GPIO_CLK);
    /* configure led GPIO port */ 
    gpio_mode_set(LED_GPIO_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LED_GPIO_PIN);
    gpio_output_options_set(LED_GPIO_PORT, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, LED_GPIO_PIN);
}

void BSP_LED4_On(void)
{
    GPIO_BOP(LED_GPIO_PORT) = LED_GPIO_PIN;
}

void BSP_LED4_Off(void){
    GPIO_BC(LED_GPIO_PORT) = LED_GPIO_PIN;
}

void BSP_LED4_Toggle(void)
{
    GPIO_TG(LED_GPIO_PORT) = LED_GPIO_PIN;
}

