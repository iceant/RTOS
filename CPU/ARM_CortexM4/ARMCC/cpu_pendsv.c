#include <cpu_pendsv.h>
#include <rtos_compiler.h>
#include <cpu_functions.h>
#include <cpu_stack.h>


__asm void PendSV_Handler(void)
{
    IMPORT cpu_stack__switch_flag
    IMPORT cpu_stack__curr_p
    IMPORT cpu_stack__next_p

        MRS R1, PRIMASK
        CPSID I

        LDR R0, =cpu_stack__switch_flag
        LDR R2, [R0]
        CBZ R2, __PendSV_Exit /* if(cpu__stack_switch_flag==0) goto __PendSV_Exit; */

        MOV R2, #0x00
        STR R2, [R0]    /* cpu__stack_switch_flag=0 */

        LDR R2, =cpu_stack__curr_p
        LDR R0, [R2]
        CBZ R0, __PendSV_SwitchTo /* if(cpu__stack_curr_p==0) goto __PendSV_SwitchTo; */

        MRS R0, PSP     /* Save Current Stack From PSP */
#ifdef __FPU_PRESENT
        TST LR, #0x10
        IT EQ
        VSTMDBEQ R0!, {S16-S31}
#endif
        MOV R2, LR
        MRS R3, CONTROL
        STMDB R0!, {R2-R11}

        LDR R2, =cpu_stack__curr_p
        LDR R3, [R2]
        STR R0, [R3] /* Save Current SP to cpu__stack_curr_p->sp */

__PendSV_SwitchTo
        LDR R0, =cpu_stack__next_p
        LDR R0, [R0]
        LDR R0, [R0]

        LDMIA R0!, {R2-R11}
        MOV LR, R2
        MSR CONTROL, R3
        ISB
#ifdef __FPU_PRESENT
        TST LR, #0x10
        IT EQ
        VLDMIAEQ R0!, {S16-S31}
#endif
        MSR PSP, R0

__PendSV_Exit
        MSR PRIMASK, R1
        DMB
        ISB
        BX LR

        ALIGN 4
}