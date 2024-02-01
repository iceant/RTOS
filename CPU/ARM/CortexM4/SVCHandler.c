#include <SVCHandler.h>
#include <stdio.h>
#include <cpu.h>
#include <cpu_port.h>

////////////////////////////////////////////////////////////////////////////////
////
cpu_uintptr_t svc_exc_return = 0;

////////////////////////////////////////////////////////////////////////////////
////

void SVC_Handler_C(unsigned  int * svc_args)
{
    unsigned char svc_number;
    svc_number = ((char*)svc_args[6])[-2];
    switch (svc_number) {
        case 0:
            CPU_REG(SCB_ICSR) |= SCB_ICSR_PENDSVSET_Msk;
            svc_exc_return = 0xFFFFFFFDU;
            break;
        default:
            printf("ERROR: Unknown SVC service number.\n");
            printf(" - SVC number 0x%x\n", svc_number);
            break;
    }

}

