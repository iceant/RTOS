#include <bsp_gd303en.h>

////////////////////////////////////////////////////////////////////////////////
////
#define GD303EN_GPIO_CLK    RCU_GPIOD
#define GD303EN_GPIO        GPIOD
#define GD303EN_PIN         GPIO_PIN_11


////////////////////////////////////////////////////////////////////////////////
////


void BSP_GD303EN_Init(void)
{
    rcu_periph_clock_enable(GD303EN_GPIO_CLK);
    gpio_mode_set(GD303EN_GPIO, GPIO_MODE_AF, GPIO_PUPD_PULLUP, GD303EN_PIN);
    gpio_output_options_set(GD303EN_GPIO, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, GD303EN_PIN);
}

void BSP_GD303EN_Enable(void){
    gpio_bit_set(GD303EN_GPIO, GD303EN_PIN);
}

void BSP_GD303EN_Disable(void)
{
    gpio_bit_reset(GD303EN_GPIO, GD303EN_PIN);
}
