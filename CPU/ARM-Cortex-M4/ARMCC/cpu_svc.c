#include <cpu_svc.h>
#include <cpu_svc_c.h>

volatile cpu_uint_t svc_exc_return;

__asm void SVC_Handler(void)
{
    IMPORT svc_exc_return
    IMPORT SVC_Handler_C

        TST LR, #4      /* 测试 EXC_RETURN 第 2 位 */
        ITE EQ
        MRSEQ R0, MSP
        MRSNE R0, PSP
        LDR R1, =svc_exc_return
        STR LR,[R1]
        BL SVC_Handler_C
        LDR R1,=svc_exc_return
        LDR LR,[R1]
        BX LR
        ALIGN 4
}