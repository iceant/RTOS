#include <bsp_pulse.h>
#include <bsp_tim2.h>
#include <os_kernel.h>
#include <delay.h>
#include "global.h"


////////////////////////////////////////////////////////////////////////////////
////

#if defined(BSP_PULSE_USE_TIMER)
#define TIMERx      TIMER11
#define TIMER_CHx   TIMER_CH_1
#define RCU_TIMERx  RCU_TIMER11
#define BSP_PULSE_TIMER_PSC (SystemCoreClock/1000000-1)

static void timer_set(uint16_t per,uint16_t psc)
{
    timer_parameter_struct timer_structure;
    timer_oc_parameter_struct pwm_structure;

    rcu_periph_clock_enable(RCU_TIMERx);
    rcu_periph_clock_enable(RCU_GPIOB);
    rcu_periph_clock_enable(RCU_AF);

    gpio_init(GPIOB,GPIO_MODE_OUT_PP,GPIO_OSPEED_50MHZ,GPIO_PIN_15);
//    gpio_init(GPIOB,GPIO_MODE_AF_PP,GPIO_OSPEED_50MHZ,GPIO_PIN_15);
    timer_deinit(TIMERx);

    timer_structure.alignedmode=TIMER_COUNTER_EDGE;
    timer_structure.counterdirection=TIMER_COUNTER_UP;
    timer_structure.clockdivision=TIMER_CKDIV_DIV1;
    timer_structure.period=per;
    timer_structure.prescaler=psc;
    timer_structure.repetitioncounter=0;
    timer_init(TIMERx, &timer_structure);

    /* auto-reload preload disable */
    timer_auto_reload_shadow_disable(TIMERx);

    pwm_structure.ocpolarity = TIMER_OC_POLARITY_HIGH;
    pwm_structure.outputstate = TIMER_CCX_ENABLE;
    pwm_structure.ocnpolarity = TIMER_OCN_POLARITY_HIGH;
    pwm_structure.outputnstate = TIMER_CCXN_DISABLE;
    pwm_structure.ocidlestate = TIMER_OC_IDLE_STATE_LOW;
    pwm_structure.ocnidlestate = TIMER_OCN_IDLE_STATE_LOW;

    timer_channel_output_config(TIMERx, TIMER_CHx, &pwm_structure);


    timer_channel_output_mode_config(TIMERx, TIMER_CHx, TIMER_OC_MODE_PWM0);
    timer_single_pulse_mode_config(TIMERx, TIMER_SP_MODE_SINGLE);

//    timer_single_pulse_mode_config(TIMEx,TIMER_SP_MODE_REPETITIVE);
    timer_channel_output_pulse_value_config(TIMERx, TIMER_CHx, (per + 1) / 2);
    timer_channel_output_shadow_config(TIMERx, TIMER_CHx, TIMER_OC_SHADOW_DISABLE);

//    timer_auto_reload_shadow_enable(TIMERx);
    timer_enable(TIMERx);
}

#endif

////////////////////////////////////////////////////////////////////////////////
////

#define BSP_Pulse_Off()     (GPIO_BOP(GPIOB) = GPIO_PIN_15)
#define BSP_Pulse_On()      (GPIO_BC(GPIOB) = GPIO_PIN_15)

void BSP_Pulse_Init(void){
    rcu_periph_clock_enable(RCU_GPIOB);
    gpio_init(GPIOB,GPIO_MODE_OUT_PP,GPIO_OSPEED_50MHZ,GPIO_PIN_15);
    BSP_Pulse_Off();
}

C__STATIC_FORCEINLINE void tick_wait(uint32_t end){
    if(end > BSP_TIM2__Ticks){
        while(end >= BSP_TIM2__Ticks);
    }else{
        while(BSP_TIM2__Ticks>=0xFFFFFFFFU);
        while(end >= BSP_TIM2__Ticks);
    }
}

static uint32_t target_ticks;
void BSP_Pulse_Generate(uint32_t pulse_width_in_ticks){

#if !defined(BSP_PULSE_USE_TIMER)
    os_critical_enter();

    BSP_Pulse_On();

    cpu_uint_t level = cpu_interrupt_disable();
    if(global_get()->pulse_tick>1){
        target_ticks = BSP_TIM2__Ticks + pulse_width_in_ticks + pulse_width_in_ticks*0.7;
    }else{
        target_ticks = BSP_TIM2__Ticks + pulse_width_in_ticks + pulse_width_in_ticks * 7;
    }
    cpu_interrupt_enable(level);
    tick_wait(target_ticks);

    BSP_Pulse_Off();
    level = cpu_interrupt_disable();
    target_ticks = BSP_TIM2__Ticks + pulse_width_in_ticks  ;
    cpu_interrupt_enable(level);
    tick_wait(target_ticks);

    os_critical_leave();
#endif

#if defined(BSP_PULSE_USE_TIMER)
    timer_set(99, BSP_PULSE_TIMER_PSC);
#endif

//    os_critical_enter();
//    GPIO_BOP(GPIOB)=GPIO_PIN_15;
//    delay_ms(pulse_width_in_ticks);
//    GPIO_BC(GPIOB) = GPIO_PIN_15; /* OFF */
//    delay_ms(pulse_width_in_ticks);
//    os_critical_leave();
}

