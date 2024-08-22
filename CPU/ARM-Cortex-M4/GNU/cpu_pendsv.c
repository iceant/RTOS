#include <cpu_pendsv.h>
#include <c_compiler.h>

__attribute__((naked)) void PendSV_Handler(void)
{
    __asm volatile(
    "    .global cpu_stack__switch_flag         \n"
    "    .global cpu_stack__from_stack_p        \n"
    "    .global cpu_stack__to_stack_p          \n"
    "\n"
    "        MRS R1, PRIMASK                    \n"
    "        CPSID I                            \n"
    "\n"
    "        LDR R0, =cpu_stack__switch_flag    \n"
    "        LDR R2, [R0]                       \n"
    "        CBZ R2, __PendSV_Exit              \n"
    "\n"
    "        MOV R2, #0x00                      \n"
    "        STR R2, [R0]                       \n"
    "\n"
    "        LDR R2, =cpu_stack__from_stack_p   \n"
    "        LDR R0, [R2]                       \n"
    "        CBZ R0, __PendSV_SwitchTo          \n"
    "\n"
    "\n"
    "        MRS R0, PSP                        \n"
    "\n"
    #if (__FPU_PRESENT==1)
    "        TST LR, #0x10                      \n"
    "        IT EQ                              \n"
    "        VSTMDBEQ R0!, {S16-S31}            \n"
    #endif
    "        MOV R2, LR                         \n"
    "        MRS R3, CONTROL                    \n"
    "        STMDB R0!, {R2-R11}                \n"
    "\n"
    "        LDR R2, =cpu_stack__from_stack_p   \n"
    "        LDR R3, [R2]                       \n"
    "        STR R0, [R3]                       \n"
    "\n"
    "__PendSV_SwitchTo                          \n"
    "        LDR R0, =cpu_stack__to_stack_p     \n"
    "        LDR R0, [R0]                       \n"
    "        LDR R0, [R0]                       \n"
    "\n"
    "        LDMIA R0!, {R2-R11}                \n"
    "        MOV LR, R2                         \n"
    "        MSR CONTROL, R3                    \n"
    "        DMB                                \n"
    "        ISB                                \n"
    #if (__FPU_PRESENT==1)
    "        TST LR, #0x10                      \n"
    "        IT EQ                              \n"
    "        VLDMIAEQ R0!, {S16-S31}            \n"
    #endif
    "\n"
    "        MSR PSP, R0                        \n"
    "        DMB                                \n"
    "        ISB                                \n"
    "\n"
    "__PendSV_Exit                              \n"
    "        MSR PRIMASK, R1                    \n"
    "        ISB                                \n"
    "        BX LR                              \n"
    "\n"
    "        .align 4                           \n"
    
    );
}