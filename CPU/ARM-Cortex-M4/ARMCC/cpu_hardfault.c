#include <cpu_hardfault.h>

__asm void HardFault_Handler(void){

    IMPORT HardFault_Handler_C

        CPSID I
        TST LR, #4
        ITE EQ
        MRSEQ R0, MSP
        MRSNE R0, PSP
        MOV R1, LR ;/*Second Parameter*/
        LDR R2, =HardFault_Handler_C
        BX R2
    ALIGN 4
}

