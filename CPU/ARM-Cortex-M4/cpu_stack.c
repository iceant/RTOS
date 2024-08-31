#include <cpu_stack.h>

/* -------------------------------------------------------------------------------------------------------------- */

volatile uint8_t                cpu_stack__switch_flag;
volatile void**                 cpu_stack__switch_from_stack_p;
volatile void**                 cpu_stack__switch_to_stack_p;
cpu_stack_switch_callback_t     cpu_stack__switch_callback=0;

/* -------------------------------------------------------------------------------------------------------------- */

#define NVIC_INT_CTRL       (*((cpu_reg_t*)0xE000ED04))
#define NVIC_PENDSVSET      (1<<28)

/* -------------------------------------------------------------------------------------------------------------- */


cpu_err_t cpu_stack_init(
          void*        program_entry
        , void*        program_parameter
        , uint8_t *    stack_base
        , uint8_t *    stack_limit
        , cpu_size_t   stack_size
        , void *       program_exit_entry
        , uint8_t **   result_stack_p
)
{
    cpu_stack_t* stack_p;
    
    stack_p = (cpu_stack_t*)(stack_base+stack_size);    /* stack top: start from high address */
    
    *--stack_p = (cpu_stack_t)0x01000000u;              /* xPSR */
    *--stack_p = (cpu_stack_t)program_entry;            /* program entry */
    *--stack_p = (cpu_stack_t)program_exit_entry;       /* R14(LR) */
    *--stack_p = (cpu_stack_t)0x12121212u;              /* R12 */
    *--stack_p = (cpu_stack_t)0x03030303u;              /* R3 */
    *--stack_p = (cpu_stack_t)0x02020202u;              /* R2 */
    *--stack_p = (cpu_stack_t)stack_limit;              /* R1 */
    *--stack_p = (cpu_stack_t)program_parameter;        /* R0 */
    
    
    *--stack_p = (cpu_stack_t)0x11111111u;              /* R11 */
    *--stack_p = (cpu_stack_t)0x10101010u;              /* R10 */
    *--stack_p = (cpu_stack_t)0x09090909u;              /* R09 */
    *--stack_p = (cpu_stack_t)0x08080808u;              /* R08 */
    *--stack_p = (cpu_stack_t)0x07070707u;              /* R07 */
    *--stack_p = (cpu_stack_t)0x06060606u;              /* R06 */
    *--stack_p = (cpu_stack_t)0x05050505u;              /* R05 */
    *--stack_p = (cpu_stack_t)0x04040404u;              /* R04 */
    *--stack_p = (cpu_stack_t)0x03;                     /* R3 - CONTROL */
    *--stack_p = (cpu_stack_t)0xFFFFFFFDu;              /* R2 - LR */
    
    if(result_stack_p){
        *result_stack_p = (uint8_t *)stack_p;
    }
    
    return CPU_STACK_OK;
}

void cpu_stack_switch_callback(void){
    if(cpu_stack__switch_callback){
        cpu_stack__switch_callback();
    }
}

cpu_err_t cpu_stack_switch(void** from_stack_p, void** to_stack_p, cpu_stack_switch_callback_t callback)
{
    if(cpu_stack__switch_flag==1){
        return CPU_STACK_ERROR;
    }
    cpu_stack__switch_flag = 1;
    
    cpu_stack__switch_from_stack_p = from_stack_p;
    cpu_stack__switch_to_stack_p = to_stack_p;
    cpu_stack__switch_callback = callback;
    
    NVIC_INT_CTRL = NVIC_PENDSVSET;
    
    return CPU_STACK_OK;
}

