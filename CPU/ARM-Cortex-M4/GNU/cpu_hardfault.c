#include <cpu_hardfault.h>
#include <c_compiler.h>

void HardFault_Handler(void){
    C_ASM volatile(
            "        CPSID I                                    \n"
            "        TST LR, #4                                 \n"
            "        ITE EQ                                     \n"
            "        MRSEQ R0, MSP                              \n"
            "        MRSNE R0, PSP                              \n"
            "        MOV R1, LR                                 \n"
            "        LDR R2, =HardFault_Handler_C               \n"
            "        BX R2                                      \n"
            "        .align 4"
    :
    :
    : "r0", "r1", "r2", "memory");
}