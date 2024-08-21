#include <cpu_stack.h>
#include <cpu_interrupts.h>
////////////////////////////////////////////////////////////////////////////////
////

#define NVIC_INT_CTRL              (*((cpu_uint_t *)0xE000ED04))
#define NVIC_PENDSVSET             (1u << 28)

////////////////////////////////////////////////////////////////////////////////
////
volatile uint8_t     cpu_stack__switch_flag = 0;
volatile void**      cpu_stack__from_stack_p=0;
volatile void**      cpu_stack__to_stack_p=0;


////////////////////////////////////////////////////////////////////////////////
////


int cpu_stack_init(void* thread_entry, void* thread_parameter
        , void* stack_address
        , cpu_size_t stack_size
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
    *--stack_p = (cpu_uint_t)thread_parameter;      /* R0: parameter */

    *--stack_p = (cpu_uint_t)0x11111111u;           /* R11 */
    *--stack_p = (cpu_uint_t)0x10101010u;           /* R10 */
    *--stack_p = (cpu_uint_t)0x09090909u;           /* R9 */
    *--stack_p = (cpu_uint_t)0x08080808u;           /* R8 */
    *--stack_p = (cpu_uint_t)0x07070707u;           /* R7 */
    *--stack_p = (cpu_uint_t)0x06060606u;           /* R6 */
    *--stack_p = (cpu_uint_t)0x05050505u;           /* R5 */
    *--stack_p = (cpu_uint_t)0x04040404u;           /* R4 */
    *--stack_p = (cpu_uint_t)0x03u;                 /* R3 - CONTROL */
    *--stack_p = (cpu_uint_t)0xFFFFFFFDu;           /* R2 - EXC_RETURN */

    *result_stack_pointer = stack_p;

    return 0;
}

#if defined(__CC_ARM)
void __svc( 0 ) cpu_stack_switch_in_svc( void ) ;
#elif defined(__GNUC__)
#define cpu_stack_switch_in_svc() C__ASM volatile ("svc #0":::"memory")
#endif

int cpu_stack_switch(void** from_stack_p, void** to_stack_p)
{
    if(cpu_stack__switch_flag == 1){
        return -1;
    }

    cpu_stack__switch_flag = 1;
    cpu_stack__from_stack_p = (volatile void**)from_stack_p;
    cpu_stack__to_stack_p = (volatile void**)to_stack_p;

    NVIC_INT_CTRL = NVIC_PENDSVSET;

    return 0;
}

int cpu_stack_switch_use_svc(void** from_stack_p, void** to_stack_p)
{
    if(cpu_stack__switch_flag == 1){
        return -1;
    }

    cpu_stack__switch_flag = 1;
    cpu_stack__from_stack_p = (volatile void**)from_stack_p;
    cpu_stack__to_stack_p = (volatile void**)to_stack_p;

    cpu_stack_switch_in_svc();

    return 0;
}