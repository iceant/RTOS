#include <HardFaultHandler.h>
#include <n32l40x.h>
#include <stdio.h>

void show_cfsr(unsigned long cfsr);

void show_hfsr(volatile uint32_t hfsr);

void show_dfsr(volatile uint32_t dfsr);

void show_exc_return(unsigned int value);

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
    
    bus_fault_address = SCB->BFAR;
    memmanage_fault_address = SCB->MMFAR;
    cfsr = SCB->CFSR;
    
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
    printf("R0  = 0x%08x\n", stacked_r0);
    printf("R1  = 0x%08x\n", stacked_r1);
    printf("R2  = 0x%08x\n", stacked_r2);
    printf("R3  = 0x%08x\n", stacked_r3);
    printf("R12 = 0x%08x\n", stacked_r12);
    printf("LR  = 0x%08x\n", stacked_lr);
    printf("PC  = 0x%08x\n", stacked_pc);
    printf("PSR = 0x%08x\n", stacked_psr);
    
    printf("-- FSR/FAR --\n");
    printf("CFSR = 0x%08x ", cfsr); show_cfsr(cfsr);
    printf("HFSR = 0x%08x ", SCB->HFSR); show_hfsr(SCB->HFSR);
    printf("DFSR = 0x%08x ", SCB->DFSR); show_dfsr(SCB->DFSR);
    printf("AFSR = 0x%08x\n", SCB->AFSR);
    if(cfsr & 0x0080) printf("MMFAR = 0x%08x\n", memmanage_fault_address);
    if(cfsr & 0x8000) printf("BFAR  = 0x%08x\n", bus_fault_address);
    printf("-- MISC --\n");
    printf("LR/EXC_RETURN = 0x%08x ", lr_value); show_exc_return(lr_value);
    while(1);
}

void show_exc_return(unsigned int value) {
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

void show_dfsr(volatile uint32_t dfsr) {
    if((dfsr) & (1<<0)) printf("HALTED ");
    if((dfsr) & (1<<1)) printf("BKPT ");
    if((dfsr) & (1<<2)) printf("DWTTRAP ");
    if((dfsr) & (1<<3)) printf("VCATCH ");
    if((dfsr) & (1<<4)) printf("EXTERNAL ");
    printf("\n");
}

void show_hfsr(volatile uint32_t hfsr) {
    if((hfsr) & (1<<1)) printf("VECTBL ");
    if((hfsr) & (1<<30)) printf("FORCED ");
    if((hfsr) & (1<<31)) printf("DEBUGEVT ");
    printf("\n");
}

void show_cfsr(unsigned long cfsr) {
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
