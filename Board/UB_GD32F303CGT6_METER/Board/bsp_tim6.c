#include <bsp_tim6.h>
#include <os_kernel.h>

////////////////////////////////////////////////////////////////////////////////
////
#define TIMERx_CLOCK            RCU_TIMER6
#define TIMERx                  TIMER6
#define TIMERx_IRQn             TIMER6_IRQn
#define TIMERx_IRQHandler       TIMER6_IRQHandler
#define TIMERx_PRESCALER        ((SystemCoreClock/1000000)-1)
#define TIMERx_PERIOD           (1000-1)


////////////////////////////////////////////////////////////////////////////////
////
volatile uint32_t BSP_TIM6__TickCount = 0;

////////////////////////////////////////////////////////////////////////////////
////
void BSP_TIM6_DeInit(void){
    nvic_irq_disable(TIMERx_IRQn);
    timer_disable(TIMERx);
    rcu_periph_clock_disable(TIMERx_CLOCK);
}

void BSP_TIM6_Init(void)
{
    BSP_TIM6__TickCount = 0;

    timer_parameter_struct timer_initpara;

    /* enable the timer clock */
    rcu_periph_clock_enable(TIMERx_CLOCK);

    timer_deinit(TIMERx);

    /* TIMER2 configuration */
    timer_initpara.prescaler         = TIMERx_PRESCALER;
    timer_initpara.alignedmode       = TIMER_COUNTER_EDGE;
    timer_initpara.counterdirection  = TIMER_COUNTER_UP;
    timer_initpara.period            = TIMERx_PERIOD;
    timer_initpara.clockdivision     = TIMER_CKDIV_DIV1;
    timer_initpara.repetitioncounter = 0;
    timer_init(TIMERx,&timer_initpara);

    /* auto-reload preload enable */
    timer_auto_reload_shadow_enable(TIMERx);

    /* clear the TIMER6 update interrupt flag */
    timer_interrupt_flag_clear(TIMERx,  TIMER_INT_FLAG_UP);

    /* enable the TIMER6 update interrupt */
    timer_interrupt_enable(TIMERx, TIMER_INT_UP);

    /* enable the TIMER6 */
    timer_enable(TIMERx);

    /* NVIC configuration */
    nvic_irq_enable(TIMERx_IRQn, 0, 0); /*最高优先级，计时准确*/
}

/* TIMER6 interrupt service routine */
void TIMERx_IRQHandler(void)
{
    os_interrupt_enter();
    if(timer_interrupt_flag_get(TIMERx, TIMER_INT_FLAG_UP) != RESET) {

        /* clear the TIMER6 update interrupt flag */
        timer_interrupt_flag_clear(TIMERx, TIMER_INT_FLAG_UP);

        /* your code here */
        BSP_TIM6__TickCount++;
    }
    os_interrupt_exit();
}
