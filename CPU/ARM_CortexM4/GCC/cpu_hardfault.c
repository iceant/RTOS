#include <cpu_hardfault.h>
#include <stdio.h>
#include <cpu_types.h>
#include <cpu_registers.h>
#include <rtos_compiler.h>
#include "cpu_functions.h"

////////////////////////////////////////////////////////////////////////////////
////

void HardFault_Handler(void){
    C__ASM volatile(
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
#define SYSHND_CTRL (*(volatile unsigned int*) (0xE000ED24u))
// Memory Management Fault Status Register
#define NVIC_MFSR (*(volatile unsigned char*) (0xE000ED28u))
// Bus Fault Status Register
#define NVIC_BFSR (*(volatile unsigned char*) (0xE000ED29u))
// Usage Fault Status Register
#define NVIC_UFSR (*(volatile unsigned short*)(0xE000ED2Au))
// Hard Fault Status Register
#define NVIC_HFSR (*(volatile unsigned int*) (0xE000ED2Cu))
// Debug Fault Status Register
#define NVIC_DFSR (*(volatile unsigned int*) (0xE000ED30u))
// Bus Fault Manage Address Register
#define NVIC_BFAR (*(volatile unsigned int*) (0xE000ED38u))
// Auxiliary Fault Status Register
#define NVIC_AFSR (*(volatile unsigned int*) (0xE000ED3Cu))

#define SCB_MMFAR   0xE000ED34U
#define SCB_CFFAR   0xE000ED28U
#define SCB_BFSR    0xE000ED29U
#define SCB_UFSR    0xE000ED2AU
#define SCB_HFSR    0xE000ED2CU
#define SCB_DFSR    0xE000ED30U
#define SCB_BFAR    0xE000ED38U
#define SCB_AFSR    0xE000ED3CU

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
            unsigned int MEMFAULTACT : 1; // Read as 1 if memory management fault
            // is active
            unsigned int BUSFAULTACT : 1; // Read as 1 if bus fault exception is active
            unsigned int UnusedBits1 : 1;
            unsigned int USGFAULTACT : 1; // Read as 1 if usage fault exception
            // is active
            unsigned int UnusedBits2 : 3;
            unsigned int SVCALLACT : 1; // Read as 1 if SVC exception is active
            unsigned int MONITORACT : 1; // Read as 1 if debug monitor exception
            // is active
            unsigned int UnusedBits3 : 1;
            unsigned int PENDSVACT : 1; // Read as 1 if PendSV exception is active
            unsigned int SYSTICKACT : 1; // Read as 1 if SYSTICK exception is active
            unsigned int USGFAULTPENDED : 1; // Usage fault pended; usage fault started
            // but was replaced by a higher-priority
            // exception
            unsigned int MEMFAULTPENDED : 1; // Memory management fault pended; memory
            // management fault started but was
            // replaced by a higher-priority exception
            unsigned int BUSFAULTPENDED : 1; // Bus fault pended; bus fault handler was
            // started but was replaced by a
            // higher-priority exception
            unsigned int SVCALLPENDED : 1; // SVC pended; SVC was started but was
            // replaced by a higher-priority exception
            unsigned int MEMFAULTENA : 1; // Memory management fault handler enable
            unsigned int BUSFAULTENA : 1; // Bus fault handler enable
            unsigned int USGFAULTENA : 1; // Usage fault handler enable
        } bits;
    } syshndctrl;       // System Handler Control and State
                        // Register (0xE000ED24)

    union {
        volatile unsigned char byte;
        struct {
            unsigned char IACCVIOL : 1; // Instruction access violation
            unsigned char DACCVIOL : 1; // Data access violation
            unsigned char UnusedBits : 1;
            unsigned char MUNSTKERR : 1; // Unstacking error
            unsigned char MSTKERR : 1; // Stacking error
            unsigned char UnusedBits2 : 2;
            unsigned char MMARVALID : 1; // Indicates the MMAR is valid
        } bits;
    } mfsr;         // Memory Management Fault Status
                    // Register (0xE000ED28)

    union {
        volatile unsigned int byte;
        struct {
            unsigned int IBUSERR : 1; // Instruction access violation
            unsigned int PRECISERR : 1; // Precise data access violation
            unsigned int IMPREISERR : 1; // Imprecise data access violation
            unsigned int UNSTKERR : 1; // Unstacking error
            unsigned int STKERR : 1; // Stacking error
            unsigned int UnusedBits : 2;
            unsigned int BFARVALID : 1; // Indicates BFAR is valid
        } bits;
    } bfsr; // Bus Fault Status Register (0xE000ED29)

    volatile unsigned int bfar;     // Bus Fault Manage Address Register
                                    // (0xE000ED38)
    union {
        volatile unsigned short byte;
        struct {
            unsigned short UNDEFINSTR : 1; // Attempts to execute an undefined
            // instruction
            unsigned short INVSTATE : 1; // Attempts to switch to an invalid state
            // (e.g., ARM)
            unsigned short INVPC : 1; // Attempts to do an exception with a bad
            // value in the EXC_RETURN number
            unsigned short NOCP : 1; // Attempts to execute a coprocessor
            // instruction
            unsigned short UnusedBits : 4;
            unsigned short UNALIGNED : 1; // Indicates that an unaligned access fault
            // has taken place
            unsigned short DIVBYZERO : 1; // Indicates a divide by zero has taken
            // place (can be set only if DIV_0_TRP
            // is set)
        } bits;
    } ufsr; // Usage Fault Status Register (0xE000ED2A)

    union {
        volatile unsigned int byte;
        struct {
            unsigned int UnusedBits : 1;
            unsigned int VECTBL : 1; // Indicates hard fault is caused by failed
            // vector fetch
            unsigned int UnusedBits2 : 28;
            unsigned int FORCED : 1; // Indicates hard fault is taken because of
            // bus fault/memory management fault/usage
            // fault
            unsigned int DEBUGEVT : 1; // Indicates hard fault is triggered by
            // debug event
        } bits;
    } hfsr; // Hard Fault Status Register (0xE000ED2C)

    union {
        volatile unsigned int byte;
        struct {
            unsigned int HALTED : 1; // Halt requested in NVIC
            unsigned int BKPT : 1; // BKPT instruction executed
            unsigned int DWTTRAP : 1; // DWT match occurred
            unsigned int VCATCH : 1; // Vector fetch occurred
            unsigned int EXTERNAL : 1; // EDBGRQ signal asserted
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

void HardFault_Handler_C(unsigned long * hardfault_args, unsigned int lr_value)
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
    unsigned long MSP;
    unsigned long PSP;
    
    //
    // In case we received a hard fault because of a breakpoint instruction, we return.
    // This may happen when using semihosting for printf outputs and no debugger
    // is connected, i.e. when running a "Debug" configuration in release mode.
    //
    
    if (NVIC_HFSR & (1uL << 31)) {
        NVIC_HFSR |= (1uL << 31); // Reset Hard Fault status
        *(hardfault_args + 6u) += 2u; // PC is located on stack at SP + 24 bytes;
        // increment PC by 2 to skip break instruction.
        return; // Return to interrupted application
    }
    
    #if DEBUG
    // Read NVIC registers
    //
    HardFaultRegs.syshndctrl.byte = SYSHND_CTRL; // System Handler Control and
    // State Register
    HardFaultRegs.mfsr.byte = NVIC_MFSR; // Memory Fault Status Register
    HardFaultRegs.bfsr.byte = NVIC_BFSR; // Bus Fault Status Register
    HardFaultRegs.bfar = NVIC_BFAR; // Bus Fault Manage Address Register
    HardFaultRegs.ufsr.byte = NVIC_UFSR; // Usage Fault Status Register
    HardFaultRegs.hfsr.byte = NVIC_HFSR; // Hard Fault Status Register
    HardFaultRegs.dfsr.byte = NVIC_DFSR; // Debug Fault Status Register
    HardFaultRegs.afsr = NVIC_AFSR; // Auxiliary Fault Status Register
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
    HardFaultRegs.SavedRegs.r0 = hardfault_args[0]; // Register R0
    HardFaultRegs.SavedRegs.r1 = hardfault_args[1]; // Register R1
    HardFaultRegs.SavedRegs.r2 = hardfault_args[2]; // Register R2
    HardFaultRegs.SavedRegs.r3 = hardfault_args[3]; // Register R3
    HardFaultRegs.SavedRegs.r12 = hardfault_args[4]; // Register R12
    HardFaultRegs.SavedRegs.lr = hardfault_args[5]; // Link register LR
    HardFaultRegs.SavedRegs.pc = hardfault_args[6]; // Program counter PC
    HardFaultRegs.SavedRegs.psr.byte = hardfault_args[7]; // Program status word PSR
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
    cfsr = CPU_REG(SCB_CFFAR);

    stacked_r0 = ((unsigned long)hardfault_args[0]);
    stacked_r1 = ((unsigned long)hardfault_args[1]);
    stacked_r2 = ((unsigned long)hardfault_args[2]);
    stacked_r3 = ((unsigned long)hardfault_args[3]);
    stacked_r12 = ((unsigned long)hardfault_args[4]);
    stacked_lr = ((unsigned long)hardfault_args[5]);
    stacked_pc = ((unsigned long)hardfault_args[6]);
    stacked_psr = ((unsigned long)hardfault_args[7]);
    MSP = cpu_get_MSP();
    PSP = cpu_get_PSP();

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
    printf("MSP:0x%08lx\n", MSP);
    printf("PSP:0x%08lx\n", PSP);
    
    
    { // Stack Dump
        extern void *_estack;
        printf("-- Stack Dump --\n");
        int i = 0;
        uint32_t *p = (uint32_t *)&hardfault_args[8];
        uint32_t *q = (uint32_t *)&_estack;
        while((p < q) && (i < 32))
        {
            if ((i++ & 7) == 0) putchar('\n');
            printf(" %08X", *p++);
        }
        putchar('\n');
    }
//
//    { // Instruction Dump
//        printf("-- Instruction Dump --\n");
//        int i = 8;
//        uint16_t *p = (uint16_t *)(hardfault_args[6] - (i*2)); // PC, 8 opcodes earlier
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


