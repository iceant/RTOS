#include <bsp_key.h>
#include <os_kernel.h>

#define BSP_KEY_CLOCK                   RCU_GPIOD
#define BSP_KEY_PORT                    GPIOD
#define BSP_KEY_PIN                     GPIO_PIN_12
#define BSP_KEY_IRQn                    EXTI10_15_IRQn
#define BSP_KEY_IRQHandler              EXTI10_15_IRQHandler
#define BSP_KEY_EXTI_PORT_SOURCE        EXTI_SOURCE_GPIOD
#define BSP_KEY_EXTI_PIN_SOURCE         EXTI_SOURCE_PIN12
#define BSP_KEY_EXTI_LINE               EXTI_12

static BSP_Key_OnKeyDownHandler BSP_KEY__OnKeyDownHandler;

void BSP_Key_Init(BSP_Key_OnKeyDownHandler OnKeyDownHandler)
{
    BSP_KEY__OnKeyDownHandler = 0;
#if defined(ENABLE_KEY)
    rcu_periph_clock_enable(BSP_KEY_CLOCK);
    rcu_periph_clock_enable(RCU_SYSCFG);
/* configure button pin as input */
    gpio_mode_set(BSP_KEY_PORT, GPIO_MODE_INPUT, GPIO_PUPD_NONE,BSP_KEY_PIN);
    /* enable and set key EXTI interrupt to the lowest priority */
    nvic_irq_enable(BSP_KEY_IRQn, 0U, 3U);
    /* connect key EXTI line to key GPIO pin */
    syscfg_exti_line_config(BSP_KEY_EXTI_PORT_SOURCE, BSP_KEY_EXTI_PIN_SOURCE);
    /* configure key EXTI line */
    exti_init(BSP_KEY_EXTI_LINE, EXTI_INTERRUPT, EXTI_TRIG_BOTH);
    exti_interrupt_flag_clear(BSP_KEY_EXTI_LINE);

    BSP_KEY__OnKeyDownHandler = OnKeyDownHandler;
#endif
}

#if defined(ENABLE_KEY)
void EXTI10_15_IRQHandler(void){
    os_interrupt_enter();
    if(RESET != exti_interrupt_flag_get(BSP_KEY_EXTI_LINE)) {
        if(BSP_KEY__OnKeyDownHandler){
            BSP_KEY__OnKeyDownHandler(BSP_Key_State());
        }
        exti_interrupt_flag_clear(BSP_KEY_EXTI_LINE);
    }
    os_interrupt_exit();
}
#endif


int BSP_Key_State(void){
    return gpio_input_bit_get(BSP_KEY_PORT, BSP_KEY_PIN);
}

void BSP_Key_SetHandler(BSP_Key_OnKeyDownHandler handler){
    BSP_KEY__OnKeyDownHandler = handler;
}