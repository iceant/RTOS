#include <cpu_stack.h>
#include <cpu_interrupts.h>
////////////////////////////////////////////////////////////////////////////////
////

#define NVIC_INT_CTRL *((cpu_uint_t *)0xE000ED04)
#define NVIC_PENDSVSET             0x10000000

////////////////////////////////////////////////////////////////////////////////
////
static bool   cpu_stack__switch_wip_flag = false;
static void** cpu_stack__from_stack_p=0;
static void** cpu_stack__to_stack_p=0;


////////////////////////////////////////////////////////////////////////////////
////


int cpu_stack_init(void* thread_entry, void* thread_parameter
        , void* stack_address
        , size_t stack_size
        , void* thread_exit_entry
        , void** result_stack_pointer
)
{
    cpu_uint_t * stack_p;

    stack_p = (cpu_uint_t*)((uint8_t*)stack_address + stack_size);
    *--stack_p = (cpu_uint_t)0x01000000u;           /* xPSR: 1 标识 thumb 模式 */
    *--stack_p = (cpu_uint_t)thread_entry;          /* PC:  thread entry */
    *--stack_p = (cpu_uint_t)thread_exit_entry;     /* R14(LR) */
    *--stack_p = (cpu_uint_t)0x12121212u;           /* R12 */
    *--stack_p = (cpu_uint_t)0x03030303u;           /* R3 */
    *--stack_p = (cpu_uint_t)0x02020202u;           /* R2 */
    *--stack_p = (cpu_uint_t)0x01010101u;           /* R1 */
    *--stack_p = (cpu_uint_t)thread_parameter;      /* R0: argument */

    *--stack_p = (cpu_uint_t)0x11111111u;           /* R11 */
    *--stack_p = (cpu_uint_t)0x10101010u;           /* R10 */
    *--stack_p = (cpu_uint_t)0x09090909u;           /* R9 */
    *--stack_p = (cpu_uint_t)0x08080808u;           /* R8 */
    *--stack_p = (cpu_uint_t)0x07070707u;           /* R7 */
    *--stack_p = (cpu_uint_t)0x06060606u;           /* R6 */
    *--stack_p = (cpu_uint_t)0x05050505u;           /* R5 */
    *--stack_p = (cpu_uint_t)0x04040404u;           /* R4 */

    *result_stack_pointer = stack_p;

    return 0;
}

int cpu_stack_switch(void* from_stack_p, void* to_stack_p)
{
    if(cpu_stack__switch_wip_flag){
        return -1;
    }

    cpu_interrupt_context_t interrupt_ctx = 0;
    cpu_interrupt_enter(&interrupt_ctx);

    cpu_stack__switch_wip_flag = true;
    *cpu_stack__from_stack_p = from_stack_p;
    *cpu_stack__to_stack_p = to_stack_p;

    NVIC_INT_CTRL = NVIC_PENDSVSET;

    cpu_interrupt_leave(&interrupt_ctx);

    return 0;
}
