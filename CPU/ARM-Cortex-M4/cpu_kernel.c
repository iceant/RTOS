#include <cpu_kernel.h>
#include <cpu_types.h>
#include <stdio.h>
#include <cpu_svc.h> /* internal usage */
#include <cpu_stack.h>
#include <cpu.h>
#include <cpu_exception.h>
/* -------------------------------------------------------------------------------------------------------------- */

extern volatile uint8_t                cpu_stack__switch_flag;
extern volatile void**                 cpu_stack__switch_from_stack_p;
extern volatile void**                 cpu_stack__switch_to_stack_p;
extern cpu_stack_switch_callback_t     cpu_stack__switch_callback;

/* -------------------------------------------------------------------------------------------------------------- */

#define NVIC_INT_CTRL       (*((cpu_reg_t*)0xE000ED04))
#define NVIC_PENDSVSET      (1<<28)

extern cpu_int_t os_scheduler_schedule(void);

/* -------------------------------------------------------------------------------------------------------------- */
static void cpu_kernel__startup(cpu_uint_t * args, cpu_uint_t* result){
//    cpu_uint_t R0 = args[0];
//    cpu_uint_t R1 = args[1];
//    cpu_uint_t R2 = args[2];
//    cpu_uint_t R3 = args[3];
//    cpu_uint_t R12 = args[4];
//    cpu_uint_t LR = args[5];
//    cpu_uint_t PC = args[6];
//    cpu_uint_t xPSR = args[7];
    
    *result = os_scheduler_schedule();
}

/* -------------------------------------------------------------------------------------------------------------- */


/* -------------------------------------------------------------------------------------------------------------- */

void cpu_kernel_init(void){
    cpu_set_exception_handler(0);
    cpu_svc_init();
    cpu_svc_register(0, cpu_kernel__startup);
}


cpu_kernel_function_t cpu_kernel_register(uint8_t function_code, cpu_kernel_function_t function)
{
    return cpu_svc_register(function_code, function);
}


