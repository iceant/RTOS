#include <cpu_svc.h>
#include <cpu_svc_c.h>

__asm void SVC_Handler(void)
{
    IMPORT SVC_Handler_C
        TST LR, #4      /* 测试 EXC_RETURN 第 2 位 */
        ITE EQ
        MRSEQ R0, MSP
        MRSNE R0, PSP
        B SVC_Handler_C
    ALIGN 4
}