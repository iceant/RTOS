#include <cpu_hardfault.h>
#include <stdio.h>
#include <cpu_types.h>
#include <cpu_registers.h>

////////////////////////////////////////////////////////////////////////////////
////

__asm void HardFault_Handler(void){

    IMPORT HardFault_Handler_C

        TST LR, #4
        ITE EQ
        MRSEQ R0, MSP
        MRSNE R0, PSP
        MOV R1, LR ;/*Second Parameter*/
        LDR R2, =HardFault_Handler_C
        BX R2
        ALIGN 4
}

////////////////////////////////////////////////////////////////////////////////
////
#define SCB_BFAR    0xE000ED38
#define SCB_MMFAR   0xE000ED34
#define SCB_CFFAR   0xE000ED28
#define SCB_HFSR    0xE000ED2C
#define SCB_DFSR    0xE000ED30
#define SCB_AFSR    0xE000ED3C


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
    while(1);
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


