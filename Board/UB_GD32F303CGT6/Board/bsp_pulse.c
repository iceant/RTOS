#include <bsp_pulse.h>
#include <bsp_tim2.h>
#include <os_kernel.h>
#include <delay.h>
////////////////////////////////////////////////////////////////////////////////
////

void BSP_Pulse_Init(void){
    rcu_periph_clock_enable(RCU_GPIOB);
    gpio_init(GPIOB,GPIO_MODE_OUT_PP,GPIO_OSPEED_50MHZ,GPIO_PIN_15);
    GPIO_BC(GPIOB) = GPIO_PIN_15;
}

void BSP_Pulse_Generate(uint32_t pulse_width_in_ticks){
    cpu_uint_t level = cpu_interrupt_disable();
    GPIO_BOP(GPIOB)=GPIO_PIN_15; /* ON */
    uint32_t target_ticks = BSP_TIM2__Ticks + pulse_width_in_ticks;
    cpu_interrupt_enable(level);
    while(target_ticks > BSP_TIM2__Ticks);

    GPIO_BC(GPIOB) = GPIO_PIN_15; /* OFF */

    level = cpu_interrupt_disable();
    target_ticks = BSP_TIM2__Ticks + pulse_width_in_ticks;
    cpu_interrupt_enable(level);
    while(target_ticks > BSP_TIM2__Ticks);


//    os_critical_enter();
//    GPIO_BOP(GPIOB)=GPIO_PIN_15;
//    delay_ms(pulse_width_in_ticks);
//    GPIO_BC(GPIOB) = GPIO_PIN_15; /* OFF */
//    delay_ms(pulse_width_in_ticks);
//    os_critical_leave();
}

