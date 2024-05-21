#include <cpu_svc.h>
#include <rtos_compiler.h>
#include <cpu_functions.h>
#include <cpu_registers.h>
#include <stdio.h>

////////////////////////////////////////////////////////////////////////////////
////
volatile cpu_uint_t svc_exc_return = 0;

static void svc0(void){
    CPU_REG(SCB_ICSR) |= SCB_ICSR_PENDSVSET_Msk;
}

static void svc1(void){
    cpu_reboot();
}

static cpu_svc_handler_t cpu_svc__table[256]={
        svc0, svc1, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        , 0, 0, 0, 0, 0
};

////////////////////////////////////////////////////////////////////////////////
////

void SVC_Handler_C(unsigned  int * svc_args)
{
    unsigned char svc_number;
    svc_number = ((char*)svc_args[6])[-2];
    if(svc_number==0){
//        printf("svc_0: %x\r\n", svc_exc_return);
        svc0();
    }else{
        cpu_svc_handler_t Function = cpu_svc__table[svc_number];
        if(Function){
            Function();
            //printf("svc_exc_return: %x\r\n", svc_exc_return);
        }else{
            printf("ERROR: Unknown SVC service number.\n");
            printf(" - SVC number 0x%x\n", svc_number);
        }
    }
}

cpu_svc_handler_t cpu_svc_set_handler(uint8_t id, cpu_svc_handler_t handler)
{
    cpu_svc_handler_t old_handler = cpu_svc__table[id];
    cpu_svc__table[id] = handler;
    return old_handler;
}


////////////////////////////////////////////////////////////////////////////////
////

C__ASM void SVC_Handler(void)
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