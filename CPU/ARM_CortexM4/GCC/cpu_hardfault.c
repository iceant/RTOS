#include <cpu_hardfault.h>
#include <stdio.h>
#include <cpu_types.h>
#include <cpu_registers.h>
#include <rtos_compiler.h>
#include "cpu_functions.h"

////////////////////////////////////////////////////////////////////////////////
////

/*
 * Cortex M0 / Cortex M3 / Cortex M4 Example:
 * -----------------------------------------
 HardFault_Handler:
 BusFault_Handler:
 UsageFault_Handler:
 MemManage_Handler:
 #if (defined (__IAR_SYSTEMS_ASM__) && (__ARM6M__) && (__CORE__ == __ARM6M__)) || \
     (defined(__CC_ARM) || (defined __clang__)) && (__TARGET_ARCH_6S_M)        || \
     (defined (__GNUC__) && ((__ARM_ARCH_6M__) || (__ARM_ARCH_8M_BASE__)))
         ;// This version is for Cortex M0
         movs   R0, #4
         mov    R1, LR
         tst    R0, R1            ;// Check EXC_RETURN in Link register bit 2.
         bne    Uses_PSP
         mrs    R0, MSP           ;// Stacking was using MSP.
         b      Pass_StackPtr
 Uses_PSP:
         mrs    R0, PSP           ;// Stacking was using PSP.
 Pass_StackPtr:
         ldr    R2,=HardFaultHandler
         bx     R2                ;// Stack pointer passed through R0.
 #else
         ;// This version is for Cortex M3, Cortex M4 and Cortex M4F
         tst    LR, #4            ;// Check EXC_RETURN in Link register bit 2.
         ite    EQ
         mrseq  R0, MSP           ;// Stacking was using MSP.
         mrsne  R0, PSP           ;// Stacking was using PSP.
         b      HardFaultHandler  ;// Stack pointer passed through R0.
 #endif
         .end
*/

void HardFault_Handler(void){
    C__ASM volatile(
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

void NMI_Handler(void){
    C__ASM volatile(
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


void BusFault_Handler(void){
    C__ASM volatile(
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

void UsageFault_Handler(void){
    C__ASM volatile(
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

void MemManage_Handler(void){
    C__ASM volatile(
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

////////////////////////////////////////////////////////////////////////////////
////
// System Handler Control and State Register
#define REG_SCB_SHCSR  (*(volatile unsigned int*)  (0xE000ED24u))  // System Handler Control and State Register
#define REG_SCB_MMFSR  (*(volatile unsigned char*) (0xE000ED28u))  // MemManage Fault Status Register
#define REG_SCB_BFSR   (*(volatile unsigned char*) (0xE000ED29u))  // Bus Fault Status Register
#define REG_SCB_UFSR   (*(volatile unsigned short*)(0xE000ED2Au))  // Usage Fault Status Register
#define REG_SCB_HFSR   (*(volatile unsigned int*)  (0xE000ED2Cu))  // Hard Fault Status Register
#define REG_SCB_DFSR   (*(volatile unsigned int*)  (0xE000ED30u))  // Debug Fault Status Register
#define REG_SCB_MMFAR  (*(volatile unsigned int*)  (0xE000ED34u))  // MemManage Fault Manage Address Register
#define REG_SCB_BFAR   (*(volatile unsigned int*)  (0xE000ED38u))  // Bus Fault Address Register
#define REG_SCB_AFSR   (*(volatile unsigned int*)  (0xE000ED3Cu))  // Auxiliary Fault Status Register


#define DEBUG 1

////////////////////////////////////////////////////////////////////////////////
////


#if DEBUG
static volatile unsigned int _Continue; // Set this variable to 1 to run further

static struct {
    struct {
        volatile unsigned int r0; // Register R0
        volatile unsigned int r1; // Register R1
        volatile unsigned int r2; // Register R2
        volatile unsigned int r3; // Register R3
        volatile unsigned int r12; // Register R12
        volatile unsigned int lr; // Link register
        volatile unsigned int pc; // Program counter
        union {
            volatile unsigned int byte;
            struct {
                unsigned int IPSR : 8; // Interrupt Program Status register (IPSR)
                unsigned int EPSR : 19; // Execution Program Status register (EPSR)
                unsigned int APSR : 5; // Application Program Status register (APSR)
            } bits;
        } psr; // Program status register.
    } SavedRegs;

    union {
        volatile unsigned int byte;
        struct {
            unsigned int MEMFAULTACT       :  1;   // [0]  Read as 1 if memory management fault is active
            unsigned int BUSFAULTACT       :  1;   // [1]  Read as 1 if bus fault exception is active
            unsigned int HARDFAULTACT      :  1;   // [2]  Read as 1 if hard fault exception is active (ARMv8-M)
            unsigned int USGFAULTACT       :  1;   // [3]  Read as 1 if usage fault exception is active
            unsigned int SECUREFAULTACT    :  1;   // [4]  Read as 1 if secure fault exception is active (ARMv8-M)
            unsigned int NMIACT            :  1;   // [5]  Read as 1 if NMI exception is active (ARMv8-M)
            unsigned int                   :  1;
            unsigned int SVCALLACT         :  1;   // [7]  Read as 1 if SVC exception is active
            unsigned int MONITORACT        :  1;   // [8]  Read as 1 if debug monitor exception is active
            unsigned int                   :  1;
            unsigned int PENDSVACT         :  1;   // [10] Read as 1 if PendSV exception is active
            unsigned int SYSTICKACT        :  1;   // [11] Read as 1 if SYSTICK exception is active
            unsigned int USGFAULTPENDED    :  1;   // [12] Usage fault pending; higher priority exception active
            unsigned int MEMFAULTPENDED    :  1;   // [13] Memory management fault pending; higher priority exception active
            unsigned int BUSFAULTPENDED    :  1;   // [14] Bus fault pending; higher priority exception active
            unsigned int SVCALLPENDED      :  1;   // [15] SVC pending; higher priority exception active
            unsigned int MEMFAULTENA       :  1;   // [16] Memory management fault exception enable
            unsigned int BUSFAULTENA       :  1;   // [17] Bus fault exception enable
            unsigned int USGFAULTENA       :  1;   // [18] Usage fault exception enable
            unsigned int SECUREFAULTENA    :  1;   // [19] Secure fault exception enable (ARMv8-M)
            unsigned int SECUREFAULTPENDED :  1;   // [20] Secure fault exception pending; higher priority exception active (ARMv8-M)
            unsigned int HARDFAULTPENDED   :  1;   // [21] Hard fault exception pending (ARMv8-M)
            unsigned int                   : 10;
        } bits;
    } syshndctrl;       // System Handler Control and State Register (0xE000ED24)

    union {
        volatile unsigned char byte;
        struct {
            unsigned int IACCVIOL    :  1;     // [0] Instruction access violation
            unsigned int DACCVIOL    :  1;     // [1] Data access violation
            unsigned int             :  1;
            unsigned int MUNSTKERR   :  1;     // [3] Unstacking error
            unsigned int MSTKERR     :  1;     // [4] Stacking error
            unsigned int MLSPERR     :  1;     // [5] MemManage fault during FP lazy state preservation
            unsigned int             :  1;
            unsigned int MMARVALID   :  1;     // [7] Indicates the MMAR is valid
            unsigned int             : 24;
        } bits;
    } mmfsr;         // MemManage Fault Status Register  (0xE000ED28)

    volatile unsigned int mmfar;           // MemManage Fault Address Register (0xE000ED34)

    union {
        volatile unsigned int byte;
        struct {
            unsigned int IBUSERR      :  1;      // [0] Instruction access violation
            unsigned int PRECISERR    :  1;      // [1] Precise data access violation
            unsigned int IMPRECISERR  :  1;      // [2] Imprecise data access violation
            unsigned int UNSTKERR     :  1;      // [3] Unstacking error
            unsigned int STKERR       :  1;      // [4] Stacking error
            unsigned int LSPERR       :  1;      // [5] Bus fault during FP lazy state preservation
            unsigned int              :  1;
            unsigned int BFARVALID    :  1;      // [7] Indicates BFAR is valid
            unsigned int              : 24;
        } bits;
    } bfsr; // Bus Fault Status Register (0xE000ED29)

    volatile unsigned int bfar;     // Bus Fault Manage Address Register
                                    // (0xE000ED38)
    union {
        volatile unsigned short byte;
        struct {
            unsigned int UNDEFINSTR :  1;      // [0] Attempts to execute an undefined instruction
            unsigned int INVSTATE   :  1;      // [1] Attempts to switch to an invalid state (e.g., ARM)
            unsigned int INVPC      :  1;      // [2] Attempts to do an exception with a bad value in the EXC_RETURN number
            unsigned int NOCP       :  1;      // [3] Attempts to execute a coprocessor instruction
            unsigned int STKOF      :  1;      // [4] Indicates whether a stack overflow error has occurred (ARMv8-M)
            unsigned int            :  3;
            unsigned int UNALIGNED  :  1;      // [8] Indicates that an unaligned access fault has taken place
            unsigned int DIVBYZERO  :  1;      // [9] Indicates a divide by zero has taken place (can be set only if DIV_0_TRP is set)
            unsigned int            : 22;
        } bits;
    } ufsr; // Usage Fault Status Register (0xE000ED2A)

    union {
        volatile unsigned int byte;
        struct {
            unsigned int             :  1;
            unsigned int VECTTBL     :  1;     // [1] Indicates hard fault is caused by failed vector fetch
            unsigned int             : 28;
            unsigned int FORCED      :  1;     // [30] Indicates hard fault is taken because of bus fault/memory management fault/usage fault
            unsigned int DEBUGEVT    :  1;     // [31] Indicates hard fault is triggered by debug event
        } bits;
    } hfsr; // Hard Fault Status Register (0xE000ED2C)

    union {
        volatile unsigned int byte;
        struct {
            unsigned int HALTED   :  1;        // [0] Halt requested in NVIC
            unsigned int BKPT     :  1;        // [1] BKPT instruction executed
            unsigned int DWTTRAP  :  1;        // [2] DWT match occurred
            unsigned int VCATCH   :  1;        // [3] Vector fetch occurred
            unsigned int EXTERNAL :  1;        // [4] EDBGRQ signal asserted
            unsigned int PMU      :  1;        // [5] PMU counter overflow event has occurred
            unsigned int          : 26;
        } bits;
    } dfsr; // Debug Fault Status Register (0xE000ED30)

    volatile unsigned int afsr;     // Auxiliary Fault Status Register
                                    // (0xE000ED3C) Vendor controlled (optional)
} HardFaultRegs;
#endif

////////////////////////////////////////////////////////////////////////////////
////



static void show_cfsr(unsigned long cfsr);

static void show_hfsr(volatile uint32_t hfsr);

static void show_dfsr(volatile uint32_t dfsr);

static void show_exc_return(unsigned int value);

void HardFault_Handler_C(unsigned long * stack_p, unsigned int lr_value)
{
    unsigned long stacked_r0;
    unsigned long stacked_r1;
    unsigned long stacked_r2;
    unsigned long stacked_r3;
    unsigned long stacked_r12;
    unsigned long stacked_lr;
    unsigned long stacked_pc;
    unsigned long stacked_psr;
    unsigned long cfsr;
    unsigned long bus_fault_address;
    unsigned long memmanage_fault_address;
    
    //
    // In case we received a hard fault because of a breakpoint instruction, we return.
    // This may happen when using semihosting for printf outputs and no debugger
    // is connected, i.e. when running a "Debug" configuration in release mode.
    //

    if (REG_SCB_HFSR & (1u << 31)) {
        REG_SCB_HFSR |=  (1u << 31);      // Reset Hard Fault status
        *(stack_p + 6u) += 2u;         // PC is located on stack at SP + 24 bytes. Increment PC by 2 to skip break instruction.
        return;                       // Return to interrupted application
    }
    
    #if DEBUG
    //
    // Read NVIC registers
    //
    HardFaultRegs.syshndctrl.byte   = REG_SCB_SHCSR;  // System Handler Control and State Register
    HardFaultRegs.mmfsr.byte        = REG_SCB_MMFSR;  // MemManage Fault Status Register
    HardFaultRegs.mmfar             = REG_SCB_MMFAR;  // MemManage Fault Address Register
    HardFaultRegs.bfsr.byte         = REG_SCB_BFSR;   // Bus Fault Status Register
    HardFaultRegs.bfar              = REG_SCB_BFAR;   // Bus Fault Manage Address Register
    HardFaultRegs.ufsr.byte         = REG_SCB_UFSR;   // Usage Fault Status Register
    HardFaultRegs.hfsr.byte         = REG_SCB_HFSR;   // Hard Fault Status Register
    HardFaultRegs.dfsr.byte         = REG_SCB_DFSR;   // Debug Fault Status Register
    HardFaultRegs.afsr              = REG_SCB_AFSR;   // Auxiliary Fault Status Register
    //
    // Halt execution
    // If NVIC registers indicate readable memory, change the variable value
    // to != 0 to continue execution.
    //
//    _Continue = 0u;
//    while (_Continue == 0u);

    //
    // Read saved registers from the stack
    //
    HardFaultRegs.SavedRegs.r0 = stack_p[0]; // Register R0
    HardFaultRegs.SavedRegs.r1 = stack_p[1]; // Register R1
    HardFaultRegs.SavedRegs.r2 = stack_p[2]; // Register R2
    HardFaultRegs.SavedRegs.r3 = stack_p[3]; // Register R3
    HardFaultRegs.SavedRegs.r12 = stack_p[4]; // Register R12
    HardFaultRegs.SavedRegs.lr = stack_p[5]; // Link register LR
    HardFaultRegs.SavedRegs.pc = stack_p[6]; // Program counter PC
    HardFaultRegs.SavedRegs.psr.byte = stack_p[7]; // Program status word PSR
    //
    // Halt execution
    // To step out of the HardFaultHandler, change the variable value to != 0.
    //
//    _Continue = 0u;
//    while (_Continue == 0u) {
//    }
    #endif

    bus_fault_address = CPU_REG(SCB_BFAR);
    memmanage_fault_address = CPU_REG(SCB_MMFAR);
    cfsr = CPU_REG(SCB_CFSR);

    stacked_r0 = ((unsigned long)stack_p[0]);
    stacked_r1 = ((unsigned long)stack_p[1]);
    stacked_r2 = ((unsigned long)stack_p[2]);
    stacked_r3 = ((unsigned long)stack_p[3]);
    stacked_r12 = ((unsigned long)stack_p[4]);
    stacked_lr = ((unsigned long)stack_p[5]);
    stacked_pc = ((unsigned long)stack_p[6]);
    stacked_psr = ((unsigned long)stack_p[7]);

    printf("[HardFault]\n");
    printf("-- Stack Frame --\n");
    printf("R0  = 0x%08lx\n", stacked_r0);
    printf("R1  = 0x%08lx\n", stacked_r1);
    printf("R2  = 0x%08lx\n", stacked_r2);
    printf("R3  = 0x%08lx\n", stacked_r3);
    printf("R12 = 0x%08lx\n", stacked_r12);
    printf("LR  = 0x%08lx\n", stacked_lr);
    printf("PC  = 0x%08lx\n", stacked_pc);
    printf("PSR = 0x%08lx\n", stacked_psr);

    printf("-- FSR/FAR --\n");
    printf("CFSR = 0x%08lx ", cfsr); show_cfsr(cfsr);
    printf("HFSR = 0x%08lx ", CPU_REG(SCB_HFSR)); show_hfsr(CPU_REG(SCB_HFSR));
    printf("DFSR = 0x%08lx ", CPU_REG(SCB_DFSR)); show_dfsr(CPU_REG(SCB_DFSR));
    printf("AFSR = 0x%08lx\n", CPU_REG(SCB_AFSR));
    if(cfsr & 0x0080) printf("MMFAR = 0x%08lx\n", memmanage_fault_address);
    if(cfsr & 0x8000) printf("BFAR  = 0x%08lx\n", bus_fault_address);
    printf("-- MISC --\n");
    printf("LR/EXC_RETURN = 0x%08x ", lr_value); show_exc_return(lr_value);
    printf("Stack:0x%p\n", stack_p);
    
    
//    { // Stack Dump
//        extern void *_estack;
//        printf("-- Stack Dump --\n");
//        int i = 0;
//        uint32_t *p = (uint32_t *)&stack_p[8];
//        uint32_t *q = (uint32_t *)&_estack;
//        while((p < q) && (i < 32))
//        {
//            if ((i++ & 7) == 0) putchar('\n');
//            printf(" %08X", *p++);
//        }
//        putchar('\n');
//    }
//
//    { // Instruction Dump
//        printf("-- Instruction Dump --\n");
//        int i = 8;
//        uint16_t *p = (uint16_t *)(stack_p[6] - (i*2)); // PC, 8 opcodes earlier
//        putchar('\n');
//        while(i--)
//            printf(" %04X", *p++);
//        printf("(%04X)", *p++);
//        i = 5;
//        while(i--)
//            printf("%04X ", *p++);
//        putchar('\n');
//    }


    _Continue = 0u;
    while (_Continue == 0u) {
    }
}

static void show_exc_return(unsigned int value) {
    switch (value) {
        case 0xFFFFFFE1:
            printf("ISR/MSP/FPCA=1");
            break;
        case 0xFFFFFFF1:
            printf("ISR/MSP/FPCA=0");
            break;
        case 0xFFFFFFE9:
            printf("THD/MSP/FPCA=1");
            break;
        case 0xFFFFFFF9:
            printf("THD/MSP/FPCA=0");
            break;
        case 0xFFFFFFED:
            printf("ISR/PSP/FPCA=1");
            break;
        case 0xFFFFFFFD:
            printf("ISR/PSP/FPCA=0");
            break;
        default:
            printf("INVALID");
            break;
    }
    printf("\n");

}

static void show_dfsr(volatile uint32_t dfsr) {
    if((dfsr) & (1<<0)) printf("HALTED ");
    if((dfsr) & (1<<1)) printf("BKPT ");
    if((dfsr) & (1<<2)) printf("DWTTRAP ");
    if((dfsr) & (1<<3)) printf("VCATCH ");
    if((dfsr) & (1<<4)) printf("EXTERNAL ");
    printf("\n");
}

static void show_hfsr(volatile uint32_t hfsr) {
    if((hfsr) & (1<<1)) printf("VECTBL ");
    if((hfsr) & (1<<30)) printf("FORCED ");
    if((hfsr) & (1<<31)) printf("DEBUGEVT ");
    printf("\n");
}

static void show_cfsr(unsigned long cfsr) {
    if((cfsr) & (1<<0)) printf("IACCVIOL ");
    if((cfsr) & (1<<1)) printf("DACCVIOL ");
    if((cfsr) & (1<<3)) printf("MUNSTKERR ");
    if((cfsr) & (1<<4)) printf("MSTKERR ");
    if((cfsr) & (1<<5)) printf("MLSPERR ");
    if((cfsr) & (1<<7)) printf("MMARVALID ");

    if((cfsr) & (1<<8)) printf("IBUSERR ");
    if((cfsr) & (1<<9)) printf("PRECISERR ");
    if((cfsr) & (1<<10)) printf("IMPRECISERR ");
    if((cfsr) & (1<<11)) printf("UNSTKERR ");
    if((cfsr) & (1<<12)) printf("STKERR ");
    if((cfsr) & (1<<13)) printf("LSPERR ");
    if((cfsr) & (1<<15)) printf("BFARVALID ");

    if((cfsr) & (1<<16)) printf("UNDEFINSTR ");
    if((cfsr) & (1<<17)) printf("INVSTATE ");
    if((cfsr) & (1<<18)) printf("INVPC ");
    if((cfsr) & (1<<19)) printf("NOCP ");
    if((cfsr) & (1<<24)) printf("UNALIGNED ");
    if((cfsr) & (1<<25)) printf("DIVBYZERO ");

    printf("\n");
}


