#include <cpu_svc.h>
#include <cpu_types.h>
#include <stdio.h>

////////////////////////////////////////////////////////////////////////////////
////
#define NVIC_INT_CTRL              (*((cpu_uint_t *)0xE000ED04))
#define NVIC_PENDSVSET             (1u << 28)


////////////////////////////////////////////////////////////////////////////////
////
volatile cpu_uint_t svc_exc_return = 0;

static void svc0(void){
    NVIC_INT_CTRL = NVIC_PENDSVSET;
}

void SVC_Handler_C(unsigned  int * svc_args)
{
    unsigned char svc_number;
    svc_number = ((char*)svc_args[6])[-2];
    if(svc_number==0){
        svc0();
    }else{
        printf("ERROR: Unknown SVC service number.\n");
        printf(" - SVC number 0x%x\n", svc_number);
    }
}



////////////////////////////////////////////////////////////////////////////////
////

__asm void SVC_Handler(void)
{
    IMPORT svc_exc_return
    IMPORT SVC_Handler_C

        TST LR, #4
        ITE EQ
        MRSEQ R0, MSP
        MRSNE R0, PSP
        LDR R1, =svc_exc_return
        STR LR, [R1]
        BL SVC_Handler_C
        LDR R1, =svc_exc_return
        LDR LR,[R1]
        ISB
        BX LR

        ALIGN 4
}