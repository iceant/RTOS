#include <cpu_hardfault.h>
#include <cpu_definitions.h>
#include <stdio.h>
#include <cpu_types.h>
#include <cpu_exception.h>

#if defined(CPU_HARDFAULT_ENABLE) && (CPU_HARDFAULT_ENABLE==1)
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

#elif defined(CPU_HARDFAULT_ENABLE) && (CPU_HARDFAULT_ENABLE==2)

#define SCB_CFSR_MMFSR_IACCVIOL     (0x01 << 0)
#define SCB_CFSR_MMFSR_DACCVIOL     (0x01 << 1)
#define SCB_CFSR_MMFSR_MUNSTKERR    (0x01 << 3)
#define SCB_CFSR_MMFSR_MSTKERR      (0x01 << 4)
#define SCB_CFSR_MMFSR_MMARVALID    (0x01 << 7)
#define SCB_CFSR_BFSR_IBUSERR       (0x01 << (0 + 8))
#define SCB_CFSR_BFSR_PRECISERR     (0x01 << (1 + 8))
#define SCB_CFSR_BFSR_IMPRECISERR   (0x01 << (2 + 8))
#define SCB_CFSR_BFSR_UNSTKERR      (0x01 << (3 + 8))
#define SCB_CFSR_BFSR_STKERR        (0x01 << (4 + 8))
#define SCB_CFSR_BFSR_BFARVALID     (0x01 << (7 + 8))
#define SCB_CFSR_UFSR_UNDEFINSTR    (0x01 << (0 + 16))
#define SCB_CFSR_UFSR_INVSTATE      (0x01 << (1 + 16))
#define SCB_CFSR_UFSR_INVPC         (0x01 << (2 + 16))
#define SCB_CFSR_UFSR_NOCP          (0x01 << (3 + 16))
#define SCB_CFSR_UFSR_UNALIGNED     (0x01 << (8 + 16))
#define SCB_CFSR_UFSR_DIVBYZERO     (0x01 << (9 + 16))

#define REG_SCB_CFSR                (*(volatile uint32_t*)(0xE000ED28u))
#define REG_SCB_MFSR                (*(volatile uint8_t*)(0xE000ED28u))
#define REG_SCB_BFSR                (*(volatile uint8_t*)(0xE000ED29u))
#define REG_SCB_UFSR                (*(volatile uint16_t*)(0xE000ED2Au))
#define REG_SCB_HFSR                (*(volatile uint32_t*)(0xE000ED2Cu))
#define REG_SCB_DFSR                (*(volatile uint32_t*)(0xE000ED30u))
#define REG_SCB_MMFAR               (*(volatile uint32_t*)(0xE000ED34u))
#define REG_SCB_BFAR                (*(volatile uint32_t*)(0xE000ED38u))
#define REG_SCB_AFSR                (*(volatile uint32_t*)(0xE000ED3Cu))

#define SCB_CFSR_MEMFAULTSR_Pos             0                                             /*!< SCB CFSR: Memory Manage Fault Status Register Position */
#define SCB_CFSR_MEMFAULTSR_Msk            (0xFFUL << SCB_CFSR_MEMFAULTSR_Pos)            /*!< SCB CFSR: Memory Manage Fault Status Register Mask */

#define SCB_CFSR_BUSFAULTSR_Pos             8                                             /*!< SCB CFSR: Bus Fault Status Register Position */
#define SCB_CFSR_BUSFAULTSR_Msk            (0xFFUL << SCB_CFSR_BUSFAULTSR_Pos)

#define SCB_CFSR_USGFAULTSR_Pos            16                                             /*!< SCB CFSR: Usage Fault Status Register Position */
#define SCB_CFSR_USGFAULTSR_Msk            (0xFFFFUL << SCB_CFSR_USGFAULTSR_Pos)

#define SCB_HFSR_DEBUGEVT_Pos              31                                             /*!< SCB HFSR: DEBUGEVT Position */
#define SCB_HFSR_DEBUGEVT_Msk              (1UL << SCB_HFSR_DEBUGEVT_Pos)

#define SCB_HFSR_FORCED_Pos                30                                             /*!< SCB HFSR: FORCED Position */
#define SCB_HFSR_FORCED_Msk                (1UL << SCB_HFSR_FORCED_Pos)

#define SCB_HFSR_VECTTBL_Pos                1                                             /*!< SCB HFSR: VECTTBL Position */
#define SCB_HFSR_VECTTBL_Msk               (1UL << SCB_HFSR_VECTTBL_Pos)


void FAULT_PrintFaultRegs(void){
    printf("MMFSR        : 0x%08x[%s%s%s%s%s]\r\n",
        (unsigned int)(REG_SCB_CFSR & SCB_CFSR_MEMFAULTSR_Msk),
        (0 == (SCB_CFSR_MMFSR_IACCVIOL & REG_SCB_CFSR)) ? "":"IACCVIOL|",
        (0 == (SCB_CFSR_MMFSR_DACCVIOL & REG_SCB_CFSR)) ? "":"DACCVIOL|",
        (0 == (SCB_CFSR_MMFSR_MUNSTKERR & REG_SCB_CFSR)) ? "":"MUNSTKERR|",
        (0 == (SCB_CFSR_MMFSR_MSTKERR & REG_SCB_CFSR)) ? "":"MSTKERR|",
        (0 == (SCB_CFSR_MMFSR_MMARVALID & REG_SCB_CFSR)) ? "":"MMARVALID|");
    printf("BFSR         : 0x%08x[%s%s%s%s%s%s]\r\n",
        (unsigned int)(REG_SCB_CFSR & SCB_CFSR_BUSFAULTSR_Msk),
        (0 == (SCB_CFSR_BFSR_IBUSERR & REG_SCB_CFSR)) ? "":"IBUSERR|",
        (0 == (SCB_CFSR_BFSR_PRECISERR & REG_SCB_CFSR)) ? "":"PRECISERR|",
        (0 == (SCB_CFSR_BFSR_IMPRECISERR & REG_SCB_CFSR))? "":"IMPRECISERR|",
        (0 == (SCB_CFSR_BFSR_UNSTKERR & REG_SCB_CFSR)) ? "":"UNSTKERR|",
        (0 == (SCB_CFSR_BFSR_STKERR & REG_SCB_CFSR)) ? "":"STKERR|",
        (0 == (SCB_CFSR_BFSR_BFARVALID & REG_SCB_CFSR)) ? "":"BFARVALID|");
    printf("UFSR         : 0x%08x[%s%s%s%s%s%s]\r\n",
        (unsigned int)(REG_SCB_CFSR & SCB_CFSR_USGFAULTSR_Msk),
        (0 == (SCB_CFSR_UFSR_UNDEFINSTR & REG_SCB_CFSR)) ? "":"UNDEFINSTR|",
        (0 == (SCB_CFSR_UFSR_INVSTATE & REG_SCB_CFSR)) ? "":"INVSTATE|",
        (0 == (SCB_CFSR_UFSR_INVPC & REG_SCB_CFSR)) ? "":"INVPC|",
        (0 == (SCB_CFSR_UFSR_NOCP & REG_SCB_CFSR)) ? "":"NOCP|",
        (0 == (SCB_CFSR_UFSR_UNALIGNED & REG_SCB_CFSR)) ? "":"UNALIGNED|",
        (0 == (SCB_CFSR_UFSR_DIVBYZERO & REG_SCB_CFSR)) ? "":"DIVBYZERO|");
    printf("HFSR         : 0x%08x[%s%s%s]\r\n",
        (unsigned int)(REG_SCB_HFSR),
        (0 == (SCB_HFSR_DEBUGEVT_Msk & REG_SCB_HFSR)) ? "":"DEBUGEVT|",
        (0 == (SCB_HFSR_FORCED_Msk & REG_SCB_HFSR)) ? "":"FORCED|",
        (0 == (SCB_HFSR_VECTTBL_Msk & REG_SCB_HFSR)) ? "":"VECTTBL|");
    printf("DFSR         : 0x%08x\r\n", REG_SCB_DFSR);
    printf("MMFAR        : 0x%08x\r\n", REG_SCB_MMFAR);
    printf("BFAR         : 0x%08x\r\n", REG_SCB_BFAR);
    printf("\r\n");
}

static const char* show_exc_return(unsigned int value) {
    switch (value) {
        case 0xFFFFFFE1:
            return ("ISR/MSP/FPCA=1");
            break;
        case 0xFFFFFFF1:
            return("ISR/MSP/FPCA=0");
            break;
        case 0xFFFFFFE9:
            return("THD/MSP/FPCA=1");
            break;
        case 0xFFFFFFF9:
            return("THD/MSP/FPCA=0");
            break;
        case 0xFFFFFFED:
            return("ISR/PSP/FPCA=1");
            break;
        case 0xFFFFFFFD:
            return("ISR/PSP/FPCA=0");
            break;
        default:
            return("INVALID");
            break;
    }
}

void FAULT_PrintGeneralRegs(uint32_t *stackaddr){

    cpu_exception_handler_t exceptionHandler = cpu_exception_get_handler();
    if(exceptionHandler){
        exceptionHandler(stackaddr);
    }

    printf("\r\nExceptions:\r\n");
    printf("r0           : 0x%08x\r\n", stackaddr[14]);
    printf("r1           : 0x%08x\r\n", stackaddr[15]);
    printf("r2           : 0x%08x\r\n", stackaddr[16]);
    printf("r3           : 0x%08x\r\n", stackaddr[17]);
    printf("r4           : 0x%08x\r\n", stackaddr[6]);
    printf("r5           : 0x%08x\r\n", stackaddr[7]);
    printf("r6           : 0x%08x\r\n", stackaddr[8]);
    printf("r7           : 0x%08x\r\n", stackaddr[9]);
    printf("r8           : 0x%08x\r\n", stackaddr[10]);
    printf("r9           : 0x%08x\r\n", stackaddr[11]);
    printf("r10          : 0x%08x\r\n", stackaddr[12]);
    printf("r11          : 0x%08x\r\n", stackaddr[13]);
    printf("r12          : 0x%08x\r\n", stackaddr[18]);
    printf("lr           : 0x%08x\r\n", stackaddr[19]);
    printf("pc           : 0x%08x\r\n", stackaddr[20]);
    printf("xpsr         : 0x%08x\r\n", stackaddr[21]);
    printf("current xpsr : 0x%08x\r\n", stackaddr[5]);
    printf("current lr   : 0x%08x[%s]\r\n", stackaddr[4], show_exc_return(stackaddr[4]));
    printf("primask      : 0x%08x\r\n", stackaddr[3]);
    printf("basepri      : 0x%08x\r\n", stackaddr[2]);
    printf("faultmask    : 0x%08x\r\n", stackaddr[1]);
    printf("control      : 0x%08x\r\n", stackaddr[0]);
    printf("\r\n");
}

__asm void HardFault_Handler(void)
{
    IMPORT FAULT_PrintGeneralRegs
    IMPORT FAULT_PrintFaultRegs
    PRESERVE8
        push {r4,r5,r6,r7,r8,r9,r10,r11}
        mrs r0, xpsr
        push {r0}
        mov r0, lr
        push {r0}
        mrs r0, primask
        push {r0}
        mrs r0, basepri
        push {r0}
        mrs r0, faultmask
        push {r0}
        mrs r0, control
        push {r0}
        mov r0, sp
        ldr r1, =FAULT_PrintGeneralRegs
        blx r1
        ldr r1, =FAULT_PrintFaultRegs
        blx r1
        b .
        nop
    ALIGN 4
}
#endif


