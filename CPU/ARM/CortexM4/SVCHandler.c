#include <SVCHandler.h>
#include <stdio.h>
#include <cpu.h>


////////////////////////////////////////////////////////////////////////////////
////
cpu_uintptr_t svc_exc_return = 0;

extern void os_kernel_cpu_init(void);

////////////////////////////////////////////////////////////////////////////////
////

void SVC_Handler_C(unsigned  int * svc_args)
{
    unsigned char svc_number;
    svc_number = ((char*)svc_args[6])[-2];
    switch (svc_number) {
        case 0:
            os_kernel_cpu_init();
            /*
            NVIC_SetPriority(PendSV_IRQn, 0xFF);
            SysTick_Config(SystemCoreClock/1000);
            __set_CONTROL(0x03);
            __ISB();
             */
            break;
        default:
            printf("ERROR: Unknown SVC service number.\n");
            printf(" - SVC number 0x%x\n", svc_number);
            break;
    }

}

