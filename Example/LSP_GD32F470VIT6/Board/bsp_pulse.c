#include <bsp_pulse.h>
#include <gd32f4xx_timer.h>
#include <gd32f4xx_libopt.h>

/* -------------------------------------------------------------------------------------------------------------- */
/*  */
#define PULSE_GPIO_CLOCK    RCU_GPIOB
#define PULSE_GPIO          GPIOB
#define PULSE_GPIO_PIN      GPIO_PIN_15
#define PULSE_GPIO_AF       GPIO_AF_9

#define TIMER_CLOCK         RCU_TIMER11
#define TIMERx              TIMER11
#define TIMERx_CHn          TIMER_CH_1

void BSP_Pulse_Init(void)
{
    rcu_periph_clock_enable(PULSE_GPIO_CLOCK);
    gpio_mode_set(PULSE_GPIO, GPIO_MODE_AF, GPIO_PUPD_NONE, PULSE_GPIO_PIN);
    gpio_output_options_set(PULSE_GPIO, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ,PULSE_GPIO_PIN);
    gpio_af_set(PULSE_GPIO, PULSE_GPIO_AF, PULSE_GPIO_PIN); /* TIMER11_CH1 */
}

void BSP_Pulse_Timer_Config(uint16_t prescaler, uint16_t period, uint32_t pulse )
{
    /* -----------------------------------------------------------------------
    TIMER1 configuration: generate 3 PWM signals with 3 different duty cycles:
    TIMER1CLK = SystemCoreClock / 200 = 1MHz

    TIMER1 channel1 duty cycle = (4000/ 16000)* 100  = 25%
    TIMER1 channel2 duty cycle = (8000/ 16000)* 100  = 50%
    TIMER1 channel3 duty cycle = (12000/ 16000)* 100 = 75%
    ----------------------------------------------------------------------- */
    timer_oc_parameter_struct timer_ocintpara;
    timer_parameter_struct timer_initpara;
    
    rcu_periph_clock_enable(TIMER_CLOCK);
    rcu_timer_clock_prescaler_config(RCU_TIMER_PSC_MUL4); /* APB1_CLK = 60MHz, APB1_CLK x 4 = 240MHz */
    
    timer_deinit(TIMERx);
    
    /* TIMERx configuration */
    timer_initpara.prescaler         = prescaler;
    timer_initpara.alignedmode       = TIMER_COUNTER_EDGE;
    timer_initpara.counterdirection  = TIMER_COUNTER_UP;
    timer_initpara.period            = period;
    timer_initpara.clockdivision     = TIMER_CKDIV_DIV1;
    timer_initpara.repetitioncounter = 0;
    timer_init(TIMERx,&timer_initpara);
    
    /* CH1,CH2 and CH3 configuration in PWM mode */
    timer_ocintpara.outputstate = TIMER_CCX_ENABLE;
    timer_ocintpara.ocpolarity  = TIMER_OC_POLARITY_HIGH;
    timer_ocintpara.ocidlestate  = TIMER_OC_IDLE_STATE_LOW;
    timer_ocintpara.outputnstate = TIMER_CCXN_DISABLE;
    timer_ocintpara.ocnpolarity  = TIMER_OCN_POLARITY_HIGH;
    timer_ocintpara.ocnidlestate = TIMER_OCN_IDLE_STATE_LOW;
    
    timer_channel_output_config(TIMERx,TIMERx_CHn,&timer_ocintpara);
    
    /* CH1 configuration in PWM mode1,duty cycle 25% */
    timer_channel_output_pulse_value_config(TIMERx,TIMERx_CHn,pulse);
    timer_channel_output_mode_config(TIMERx,TIMERx_CHn,TIMER_OC_MODE_PWM0);
    timer_channel_output_shadow_config(TIMERx,TIMERx_CHn,TIMER_OC_SHADOW_DISABLE);
    
    /* auto-reload preload enable */
    timer_auto_reload_shadow_enable(TIMERx);
}

void BSP_Pulse_Trigger_With(uint16_t period, uint32_t pulse){
    timer_autoreload_value_config(TIMERx, period);
    timer_channel_output_pulse_value_config(TIMERx,TIMERx_CHn,pulse);
    timer_enable(TIMERx);
}


void BSP_Pulse_Trigger(void){
    timer_enable(TIMERx);
}




