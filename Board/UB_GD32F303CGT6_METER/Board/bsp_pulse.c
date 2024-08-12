#include <bsp_pulse.h>
#include <gd32f30x_timer.h>

////////////////////////////////////////////////////////////////////////////////
////
#define RCU_GPIOx       RCU_GPIOB
#define GPIO_PINx       GPIO_PIN_15
#define GPIOx           GPIOB

#define TIMERx          TIMER0
#define RCU_TIMERx      RCU_TIMER0
#define TIMER_CHn       TIMER_CH_2

////////////////////////////////////////////////////////////////////////////////
////
void BSP_Pulse_init(void){
    rcu_periph_clock_enable(RCU_GPIOx);
    rcu_periph_clock_enable(RCU_AF);

    /* OUTPUT: TIMER0_CH2 - PB15 */
    gpio_init(GPIOx,GPIO_MODE_AF_PP,GPIO_OSPEED_50MHZ,GPIO_PINx);
}


void BSP_Pulse_Generate(uint16_t width)
{

/* -----------------------------------------------------------------------
TIMERx configuration: single pulse mode
the external signal is connected to TIMERx CH0 pin (PA0) and the falling
edge is used as active edge.
the single pulse signal is output on TIMERx CH1 pin (PA1).

the TIMER1CLK frequency is set to systemcoreclock,the prescaler is
60,so the TIMERx counter clock is 2MHz.

single pulse value = (TIMER1_Period - TIMER1_Pulse) / TIMER1 counter clock
                   = (65535 - 11535) / 2MHz = 27 ms.

配置TIM参数，预分频系数设置为120-1, 自动重载值设置为1000-1，那么PWM频率为120,000,000/((120-1+1)*(1000-1+1))=1000Hz，即1KHz。
----------------------------------------------------------------------- */

    timer_oc_parameter_struct timer_ocinitpara;
    timer_parameter_struct timer_initpara;
    timer_ic_parameter_struct timer_icinitpara;

    rcu_periph_clock_enable(RCU_TIMERx);

    timer_deinit(TIMERx);

    /* TIMER1 configuration */
    timer_initpara.prescaler         = 59;
    timer_initpara.alignedmode       = TIMER_COUNTER_EDGE;
    timer_initpara.counterdirection  = TIMER_COUNTER_UP;
    timer_initpara.period            = 65535;
    timer_initpara.clockdivision     = TIMER_CKDIV_DIV1;
    timer_initpara.repetitioncounter = 0;
    timer_init(TIMERx,&timer_initpara);

    /* auto-reload preload disable */
    timer_auto_reload_shadow_disable(TIMERx);

    /* CH1 configuration in OC PWM mode */
    timer_ocinitpara.outputstate  = TIMER_CCX_ENABLE;           /*是否互补通道输出 */
    timer_ocinitpara.outputnstate = TIMER_CCXN_DISABLE;         /*输出极性 */
    timer_ocinitpara.ocpolarity   = TIMER_OC_POLARITY_HIGH;     /*输出死区延迟的极性 */
    timer_ocinitpara.ocnpolarity  = TIMER_OCN_POLARITY_HIGH;    /*空闲状态下通道输出极性通道 */
    timer_ocinitpara.ocidlestate  = TIMER_OC_IDLE_STATE_LOW;    /*空闲时互补通道输出极性 */
    timer_ocinitpara.ocnidlestate = TIMER_OCN_IDLE_STATE_LOW;   /*配置通道 */

    timer_channel_output_config(TIMERx,TIMER_CHn,&timer_ocinitpara);

    timer_channel_output_pulse_value_config(TIMERx,TIMER_CHn,11535);                              /*输出模式配置 */
    timer_channel_output_mode_config(TIMERx,TIMER_CHn,TIMER_OC_MODE_PWM0);                      /*不使用影子寄存器 */
    timer_channel_output_shadow_config(TIMERx,TIMER_CHn,TIMER_OC_SHADOW_DISABLE);              /*使能定时器自动重装载值 */

    /* TIMER1 CH0 input capture configuration */
//    timer_icinitpara.icpolarity  = TIMER_IC_POLARITY_FALLING;
//    timer_icinitpara.icselection = TIMER_IC_SELECTION_DIRECTTI;
//    timer_icinitpara.icprescaler = TIMER_IC_PSC_DIV1;
//    timer_icinitpara.icfilter = 0x00;
//    timer_input_capture_config(TIMER1,TIMER_CH_0,&timer_icinitpara);

    /* single pulse mode selection */
    timer_single_pulse_mode_config(TIMERx,TIMER_SP_MODE_SINGLE);

    /* slave mode selection : TIMER1 */
    /* TIMER1 input trigger : external trigger connected to CI0 */
//    timer_input_trigger_source_select(TIMERx,TIMER_SMCFG_TRGSEL_CI0FE0);
//    timer_slave_mode_select(TIMERx,TIMER_SLAVE_MODE_EVENT);

    timer_auto_reload_shadow_enable(TIMERx);    /* 使能定时器 */
    timer_enable(TIMERx);
}