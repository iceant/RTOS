#include <cpu_pendsv.h>
#include <rtos_compiler.h>
#include <cpu_functions.h>
#include <cpu_stack.h>


void __attribute__((naked)) PendSV_Handler(void)
{
    C__ASM volatile(
            "    .global cpu_stack__switch_flag         \n"
            "    .global cpu_stack__curr_p              \n"
            "    .global cpu_stack__next_p              \n"
            "                                           \n"
            "        MRS R1, PRIMASK                    \n"
            "        CPSID I                            \n"
            "                                           \n"
            "        LDR R0, =cpu_stack__switch_flag    \n"
            "        LDR R2, [R0]                       \n"
            "        CBZ R2, __PendSV_Exit /* if(cpu__stack_switch_flag==0) goto __PendSV_Exit; */              \n"
            "                                                                                                   \n"
            "        MOV R2, #0x00                                                                              \n"
            "        STR R2, [R0]    /* cpu__stack_switch_flag=0 */                                             \n"
            "                                                                                                   \n"
            "        LDR R2, =cpu_stack__curr_p                                                                 \n"
            "        LDR R0, [R2]                                                                               \n"
            "        CBZ R0, __PendSV_SwitchTo /* if(cpu__stack_curr_p==0) goto __PendSV_SwitchTo; */           \n"
            "                                                                                                   \n"
            "        MRS R0, PSP     /* Save Current Stack From PSP */                                          \n"
            #ifdef __FPU_PRESENT
            "        TST LR, #0x10                                                                              \n"
            "        IT EQ                                                                                      \n"
            "        VSTMDBEQ R0!, {S16-S31}                                                                    \n"
            #endif
            "        MOV R2, LR                                                                                 \n"
            "        MRS R3, CONTROL                                                                            \n"
            "        STMDB R0!, {R2-R11}                                                                        \n"
            "                                                                                                   \n"
            "        LDR R2, =cpu_stack__curr_p                                                                 \n"
            "        LDR R3, [R2]                                                                               \n"
            "        STR R0, [R3] /* Save Current SP to cpu__stack_curr_p->sp */                                \n"
            "                                                                                                   \n"
            "__PendSV_SwitchTo:                                                                                 \n"
            "        LDR R0, =cpu_stack__next_p                                                                 \n"
            "        LDR R0, [R0]                                                                               \n"
            "        LDR R0, [R0]                                                                               \n"
            "                                                                                                   \n"
            "        LDMIA R0!, {R2-R11}                                                                        \n"
            "        MOV LR, R2                                                                                 \n"
            "        MSR CONTROL, R3                                                                            \n"
            "        ISB                                                                                        \n"
            #ifdef __FPU_PRESENT
            "        TST LR, #0x10                                                                              \n"
            "        IT EQ                                                                                      \n"
            "        VLDMIAEQ R0!, {S16-S31}                                                                    \n"
            #endif
            "        MSR PSP, R0                                                                                \n"
            "                                                                                                   \n"
            "__PendSV_Exit:                                                                                     \n"
            "        MSR PRIMASK, R1                                                                            \n"
            "        ISB                                                                                        \n"
            "        BX LR                                                                                      \n"
            "        .align 4                                                                                   "
            :
            :
            : "cc", "memory");
    
}