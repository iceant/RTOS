#include <cpu_svc.h>
#include <cpu_svc_c.h>

////////////////////////////////////////////////////////////////////////////////
////



__attribute__((naked)) void SVC_Handler(void)
{
    __asm(
            ".global SVC_Handler_C\n"
            "TST lr, #4\n"
            "ITE EQ\n"
            "MRSEQ r0, MSP\n"
            "MRSNE r0, PSP\n"
            "B SVC_Handler_C\n"
            ) ;
}

