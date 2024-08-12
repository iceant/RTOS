#include <global.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////
////
static global_t global__instance={0};

////////////////////////////////////////////////////////////////////////////////
////

void global_init(void){
    memset(&global__instance, 0, sizeof(global__instance));

    printf("sdk_mp_set(128)\n");
    sdk_mp_set(128);
    printf("sdk_fmt_register('P')\n");
    sdk_fmt_register('P', sdk_mp_fmt);
    printf("sdk_mp_new(...)\n");
    sdk_mp_new(0, &global__instance.power_wms);
    printf("global_init done!\n");
}

global_t* global_get(void)
{
    return &global__instance;
}

void global_set_cpuid(char* cpuid, int size){
    int sz = ((size)>((int)sizeof(global__instance.CPUID)))?(int)sizeof(global__instance.CPUID):size;
    memcpy(global__instance.CPUID, cpuid, sz);
}


