#include <global.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////
////
static global_t global__instance={0};



////////////////////////////////////////////////////////////////////////////////
////

void global_init(void){
    memset(&global__instance, 0, sizeof(global__instance));
}

global_t* global_get(void)
{
    return &global__instance;
}

void global_set_cpuid(char* cpuid, int size){
    int sz = ((size)>((int)sizeof(global__instance.CPUID)))?(int)sizeof(global__instance.CPUID):size;
    memcpy(global__instance.CPUID, cpuid, sz);
}


