#include <cpu_pendsv.h>
#include <cpu_types.h>
#include <cpu_stack.h>

extern volatile uint8_t     cpu_stack__switch_flag;
extern volatile void**      cpu_stack__from_stack_p;
extern volatile void**      cpu_stack__to_stack_p;

__asm void PendSV_Handler(void)
{
    IMPORT cpu_stack__switch_flag
    IMPORT cpu_stack__from_stack_p
    IMPORT cpu_stack__to_stack_p
    IMPORT cpu_stack_switch_callback

        MRS R1, PRIMASK
        CPSID I
        
        LDR R0, =cpu_stack__switch_flag
        LDR R2, [R0]
        CBZ R2, __PendSV_Exit
        MOV R2, #0x00
        STR R2, [R0]

        LDR R2, =cpu_stack__from_stack_p
        LDR R0, [R2]
        CBZ R0, __PendSV_SwitchTo

        MRS R0, PSP

#if (__FPU_PRESENT==1)
        TST LR, #0x10
        IT EQ
        VSTMDBEQ R0!, {S16-S31}
#endif

        MOV R2, LR
        MRS R3, CONTROL
        STMDB R0!, {R2-R11}

        LDR R2, =cpu_stack__from_stack_p
        LDR R3, [R2]
        STR R0, [R3]

__PendSV_SwitchTo
        LDR R0, =cpu_stack__to_stack_p
        LDR R0, [R0]
        LDR R0, [R0]

        LDMIA R0!, {R2-R11}
        MOV LR, R2
        MSR CONTROL, R3
        ISB

#if (__FPU_PRESENT==1)
        TST LR, #0x10
        IT EQ
        VLDMIAEQ R0!, {S16-S31}
#endif

        MSR PSP, R0

        PUSH {R0-R4, LR}
        BL cpu_stack_switch_callback
        POP {R0-R4, LR}

__PendSV_Exit
        MSR PRIMASK, R1
        ISB
        BX LR

        ALIGN 4
}