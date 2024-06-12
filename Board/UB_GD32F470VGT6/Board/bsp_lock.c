#include <bsp_lock.h>

#define BSP_LOCK_EN_PORT        GPIOD
#define BSP_LOCK_EN_PORT_PIN    GPIO_PIN_14
#define BSP_LOCK_BIT_PORT       GPIOD
#define BSP_LOCK_BIT_PIN        GPIO_PIN_13

void BSP_Lock_Init(void)
{
    rcu_periph_clock_enable(RCU_GPIOD);
    gpio_mode_set(BSP_LOCK_EN_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,BSP_LOCK_EN_PORT_PIN);
    gpio_output_options_set(BSP_LOCK_EN_PORT, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,BSP_LOCK_EN_PORT_PIN);

    gpio_mode_set(BSP_LOCK_BIT_PORT, GPIO_MODE_INPUT, GPIO_PUPD_NONE,BSP_LOCK_BIT_PIN);
}

void BSP_Lock_Enable(void){
    gpio_bit_set(BSP_LOCK_EN_PORT, BSP_LOCK_EN_PORT_PIN);
}

void BSP_Lock_Disable(void){
    gpio_bit_reset(BSP_LOCK_EN_PORT, BSP_LOCK_EN_PORT_PIN);
}

int BSP_Lock_State(void){
    return gpio_input_bit_get(BSP_LOCK_BIT_PORT, BSP_LOCK_BIT_PIN);
}
