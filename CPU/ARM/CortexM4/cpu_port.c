#include <cpu_port.h>
#include <assert.h>
#include <stdio.h>

////////////////////////////////////////////////////////////////////////////////
////

extern void cpu_interrupt_enable(cpu_uintptr_t level);
extern cpu_uintptr_t cpu_interrupt_disable(void);
typedef void (*cpu_tick_handler)(void);

////////////////////////////////////////////////////////////////////////////////
////
#define CPU_STACK_SWITCH_FLAG_ON    1
#define CPU_STACK_SWITCH_FLAG_OFF   0

////////////////////////////////////////////////////////////////////////////////
////
void** cpu__stack_next_p = 0;
void** cpu__stack_curr_p = 0;
cpu_uint8_t cpu__stack_switch_flag = CPU_STACK_SWITCH_FLAG_OFF;

////////////////////////////////////////////////////////////////////////////////
////
static cpu_tick_handler cpu_port__tick_handler=0;

////////////////////////////////////////////////////////////////////////////////
////

/* CPU 是否在特权级别 */
static int cpu__in_privilege(void){
    if(cpu_reg_IPSR()!=0) return 1;
    else if((cpu_reg_CONTROL() & 0x01)==0) return 1;
    else return 0;
}


////////////////////////////////////////////////////////////////////////////////
////

/*
17  PSR
16  PC
15  LR
14  R12
13  R3
12  R2
11  R1
10  R0          <<-- PSP
09  R11
08  R10
07  R9
06  R8
05  R7
04  R6
03  R5
02  R4
01  CONTROL
00  LR              <<--- PSP_array[0]
--------------------
 */
int cpu_stack_init(void *thread_entry, void *parameter, void *stack_addr, int stack_size, void **cpu_sp) {
    if (stack_size < 18 * 4) return -1;

    cpu_uintptr_t sp = ((cpu_uintptr_t) stack_addr + stack_size - 18 * 4);

    CPU_REG(sp + (17 << 2)) = (cpu_uintptr_t) 0x01000000; /*xPSR*/
    CPU_REG(sp + (16 << 2)) = (cpu_uintptr_t) thread_entry; /*PC*/
    CPU_REG(sp + (10 << 2)) = (cpu_uintptr_t) parameter; /*R0*/
    CPU_REG(sp + (1 << 2)) = (cpu_uintptr_t) 0x03; /*Init CONTROL register with NO_PRIVILEGE|NO_FP*/
    CPU_REG(sp) = (cpu_uintptr_t) 0xFFFFFFFDUL; /*EXC_RETURN*/

    if (cpu_sp) {
        *cpu_sp = (void *) sp;
    }

    return 0;
}

int cpu_stack_switch(void** current_stack_p, void** next_stack_p)
{

    assert(next_stack_p);
    
    if(cpu__stack_switch_flag==CPU_STACK_SWITCH_FLAG_ON){
        return -1;
    }

    register cpu_uintptr_t level = cpu_interrupt_disable();
    {
        cpu__stack_switch_flag = CPU_STACK_SWITCH_FLAG_ON;
        cpu__stack_curr_p = current_stack_p;
        cpu__stack_next_p = next_stack_p;
    }
    cpu_interrupt_enable(level);

    if(cpu__in_privilege()==1){
        /*设置中断需要特权，已在特权模式，直接设置*/
        CPU_REG(SCB_ICSR) |= SCB_ICSR_PENDSVSET_Msk;
    }else{
        /*设置中断需要特权，没有特权，通过 SVC 来设置*/
        __svc(0);
    }

    return 0;
}


void cpu_set_tick_handler(cpu_tick_handler handler)
{
    cpu_port__tick_handler = handler;
}

int cpu_in_interrupt(void){
    return (cpu_reg_IPSR()!=0)?(1):(0);
}


////////////////////////////////////////////////////////////////////////////////
//// IRQ Handlers

void SysTick_Handler(void)
{
    if(cpu_port__tick_handler){
        cpu_port__tick_handler();
    }
}




