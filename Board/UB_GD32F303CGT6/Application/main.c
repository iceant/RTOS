#include <main.h>
#include <board.h>
#include <os_kernel.h>
#include <sdk_fmt.h>
#include <meter_protocol.h>
#include <mcu_session.h>
#include "global.h"
#include <iap.h>
#include <use_pulse.h>
////////////////////////////////////////////////////////////////////////////////
////

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t BootThread_Stack[1024];
static os_thread_t BootThread;

static void BootThread_Entry(void* p){

//    iap_check_upgrade();

    /* 通知主控，我已经启动了 */
    mcu_session_printf(mcu_session_get_default(), "GD303 Application Startup");

    while(1){
#if 1
        global_t * global = global_get();
        /* 每秒发送一次数据，测试TIMER的精度 */
        mcu_session_printf(mcu_session_get_default(), "Tick:%d, ID:%s, %04d-%02d-%02d %02d:%02d:%02d.%d"
                , BSP_TIM6__TickCount
                , strlen(global_get()->CPUID)?global_get()->CPUID:"N/A"
                , global->datetime.year
                , global->datetime.month
                , global->datetime.date
                , global->datetime.hour
                , global->datetime.min
                , global->datetime.sec
                , BSP_TIM6__TickCount%1000);

        os_thread_mdelay(60000);

#endif

#if 0
        printf("Tim2.Tick:%u, Tim6.Tick=%u\n", BSP_TIM2__Ticks, BSP_TIM6__TickCount);
//        BSP_Pulse_Generate(1);
        os_thread_mdelay(1000);
#endif

    }
}

static void timer_set(uint16_t per,uint16_t psc)
{
    uint32_t TIMEx = TIMER11;
    uint16_t TIMER_CHx = TIMER_CH_1;
    timer_parameter_struct timer_structure;
    timer_oc_parameter_struct pwm_structure;

    rcu_periph_clock_enable(RCU_TIMER11);
    rcu_periph_clock_enable(RCU_GPIOB);
    rcu_periph_clock_enable(RCU_AF);

    gpio_init(GPIOB,GPIO_MODE_OUT_PP,GPIO_OSPEED_50MHZ,GPIO_PIN_15);

    timer_structure.alignedmode=TIMER_COUNTER_EDGE;
    timer_structure.clockdivision=TIMER_CKDIV_DIV1;
    timer_structure.counterdirection=TIMER_COUNTER_UP;
    timer_structure.period=per;
    timer_structure.prescaler=psc;
    timer_structure.repetitioncounter=0;
    timer_init(TIMEx,&timer_structure);

    pwm_structure.ocpolarity = TIMER_OC_POLARITY_HIGH;
    pwm_structure.outputstate = TIMER_CCX_ENABLE;
    pwm_structure.ocnpolarity = TIMER_OCN_POLARITY_HIGH;
    pwm_structure.outputnstate = TIMER_CCXN_DISABLE;
    pwm_structure.ocidlestate = TIMER_OC_IDLE_STATE_LOW;
    pwm_structure.ocnidlestate = TIMER_OCN_IDLE_STATE_LOW;


    timer_channel_output_config(TIMEx,TIMER_CHx,&pwm_structure);
    timer_channel_output_mode_config(TIMEx,TIMER_CHx,TIMER_OC_MODE_PWM0);

//    timer_single_pulse_mode_config(TIMER0,TIMER_SP_MODE_SINGLE);
    timer_single_pulse_mode_config(TIMEx,TIMER_SP_MODE_REPETITIVE);
    timer_channel_output_pulse_value_config(TIMEx,TIMER_CHx,(per+1)/2);
    timer_channel_output_shadow_config(TIMEx,TIMER_CHx,TIMER_OC_SHADOW_DISABLE);

    timer_auto_reload_shadow_enable(TIMEx);
    timer_enable(TIMEx);
}

////////////////////////////////////////////////////////////////////////////////
////



int main(void){


    Board_Init();

#if 1
    os_kernel_init();

    global_init();

    mcu_session_init(mcu_session_get_default());

    /* 用于和 MCU 通讯 */
    USE_USART1_Init();

    USE_CAN0_Init();

    use_pulse_init();

    os_thread_init(&BootThread, "Boot", BootThread_Entry, 0
                   , BootThread_Stack, sizeof(BootThread_Stack), 20, 10);
    os_thread_startup(&BootThread);


    os_kernel_startup();

#endif

#if 0
    char buf[128];
    uint32_t nCount = 0;

    char* message = "Hello";
    while(1) {
        int size = snprintf(buf, sizeof(buf), "Hello, %d", BSP_TIM6__TickCount);
        mcu_protocol_du_print(&mcu_protocol_g_tx_protocol, buf, size);
//        mcu_protocol_du_print(&mcu_protocol_g_tx_protocol, message, strlen(message));

//        BSP_USART1_DMATx(message, strlen(message));

        for(uint32_t i=0; i<0x3ffffff; i++);
    }

#endif

    while(1);
    return 0;
}

