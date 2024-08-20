#include <global.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////
////
static global_t global__instance={0};

////////////////////////////////////////////////////////////////////////////////
////
#define GLOBAL_PULSE_10M    10000000
#define GLOBAL_PULSE_1M     1000000
#define GLOBAL_PULSE_100K   100000
#define GLOBAL_PULSE_10K    10000
#define GLOBAL_PULSE_1K     1000

void global_init(void){
    memset(&global__instance, 0, sizeof(global__instance));

    sdk_mp_set(128);
    sdk_fmt_register('P', sdk_mp_fmt);
    sdk_mp_new(0, &global__instance.power_wms);

    global__instance.pulse_enable = true;
    global__instance.pulse_hz = GLOBAL_PULSE_10M;
    global__instance.pulse_tick = 10;                /*1 Ms*/
}

global_t* global_get(void)
{
    return &global__instance;
}

void global_set_cpuid(char* cpuid, int size){
    int sz = ((size)>((int)sizeof(global__instance.CPUID)))?(int)sizeof(global__instance.CPUID):size;
    memcpy(global__instance.CPUID, cpuid, sz);
}


void global_show(void){
    printf("global.pulse_enable=%d\n", global__instance.pulse_enable);
    printf("global.pulse_hz=%d\n", global__instance.pulse_hz);
    printf("global.pulse_tick=%d\n", global__instance.pulse_tick);
}