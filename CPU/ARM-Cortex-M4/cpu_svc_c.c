#include <cpu_svc_c.h>
#include <stdio.h>
#include <cpu_functions.h>
#include <cpu_stack.h>

////////////////////////////////////////////////////////////////////////////////
////
extern volatile uint8_t             cpu_stack__switch_flag;
extern volatile void**              cpu_stack__from_stack_p;
extern volatile void**              cpu_stack__to_stack_p;
extern cpu_stack_switch_callback_t  cpu_stack__switch_callback;
////////////////////////////////////////////////////////////////////////////////
////
#define NVIC_INT_CTRL              (*((cpu_uint_t *)0xE000ED04))
#define NVIC_PENDSVSET             (1u << 28)

////////////////////////////////////////////////////////////////////////////////
////


static void cpu_svc_1(void** from_stack_p, void** to_stack_p, void* callback){
    if(cpu_stack__switch_flag == 1){
        return;
    }

    cpu_stack__switch_flag = 1;
    cpu_stack__from_stack_p = (volatile void**)from_stack_p;
    cpu_stack__to_stack_p = (volatile void**)to_stack_p;
    cpu_stack__switch_callback = (cpu_stack_switch_callback_t)callback;
    
    NVIC_INT_CTRL = NVIC_PENDSVSET;
    cpu_dsb();
    cpu_isb();
}

////////////////////////////////////////////////////////////////////////////////
////

/*
    R0 = svc_args[0]
    R1 = svc_args[1]
    R2 = svc_args[2]
    R3 = svc_args[3]
    R12 = svc_args[4]
    LR  = svc_args[5]
    PC  = svc_args[6]
    xPSR  = svc_args[7]
*/

void SVC_Handler_C(unsigned int *svc_args, uint32_t* exc_return){
    uint8_t svc_number;
    svc_number = ( ( char * )svc_args[ 6 ] )[ -2 ] ; //存储器[(压栈 PC)-2]

    switch(svc_number){
        case 1:{
            cpu_svc_1((void**)svc_args[0], (void**)svc_args[1], (void*)svc_args[2]);
            break;
        }
        default:{
            printf("[SVC] Unknown #%d \n", svc_number);
            break;
        }
    }

    /* svc_args[0] = ... */ /*返回结果*/
}

