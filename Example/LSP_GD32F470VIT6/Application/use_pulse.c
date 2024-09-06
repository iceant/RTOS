#include <use_pulse.h>
#include <gd32f4xx.h>
#include <bsp_pulse.h>

/* tick/1us */
#define PULSE_TICKS_PER_SECOND 1000000

#define PULSE_USE_PARAMETER 2

#if (PULSE_USE_PARAMETER==1)
/* -------------------------------------------------------------------------------------------------------------- */
/* 脉宽: 500us, 周期 1ms, 占空比 50%, 频率 1KHz */
#define PULSE_FREQUENCY        1000
#define PULSE_PERIOD           (PULSE_TICKS_PER_SECOND/PULSE_FREQUENCY)
#define PULSE_WIDTH            (PULSE_PERIOD>>1)
#define PULSE_CONFIG_PERIOD    (PULSE_PERIOD-1)

#elif (PULSE_USE_PARAMETER==2)
/* -------------------------------------------------------------------------------------------------------------- */
/* 脉宽: 5us, 周期 10us, 占空比 50%, 频率 100KHz */
#define PULSE_FREQUENCY        100000
#define PULSE_PERIOD           (PULSE_TICKS_PER_SECOND/PULSE_FREQUENCY)
#define PULSE_WIDTH            (PULSE_PERIOD>>1)
#define PULSE_CONFIG_PERIOD    (PULSE_PERIOD-1)
#endif

void USE_Pulse_Init(void){
    BSP_Pulse_Timer_Config(SystemCoreClock/PULSE_TICKS_PER_SECOND-1, PULSE_CONFIG_PERIOD, PULSE_WIDTH);
}

void USE_Pulse_Trigger(void){
//    BSP_Pulse_Trigger_With(PULSE_CONFIG_PERIOD, PULSE_WIDTH);
    BSP_Pulse_Trigger();
}
