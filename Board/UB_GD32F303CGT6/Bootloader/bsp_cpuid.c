#include <bsp_cpuid.h>
#include <sdk_hex.h>

////////////////////////////////////////////////////////////////////////////////
////


#define CPUID_ADDRESS (0x1FFFF7E8U)

static char cpuid__buf[25]={0};
////////////////////////////////////////////////////////////////////////////////
////

char* BSP_CPUID_Read(void){
    if(cpuid__buf[0]!=0x00){
        return cpuid__buf;
    }
    SDK_HEX_ENCODE_BE(cpuid__buf, sizeof(cpuid__buf), (const uint8_t*)CPUID_ADDRESS, 12);
    return cpuid__buf;
}
