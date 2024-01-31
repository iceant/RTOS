#ifndef INCLUDED_CPU_H
#define INCLUDED_CPU_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_CPU_PORT_H
#include <cpu_port.h>
#endif /*INCLUDED_CPU_PORT_H*/

////////////////////////////////////////////////////////////////////////////////
////

/*
  Used in OS Kernel to Init CPU
 */
extern void os_kernel_cpu_init(void);


////////////////////////////////////////////////////////////////////////////////
//// ASM INTERFACE
extern int cpu_stack_switch(void** current_stack_p, void** next_stack_p);
extern void cpu_interrupt_enable(cpu_uintptr_t level);
extern cpu_uintptr_t cpu_interrupt_disable(void);
extern cpu_uintptr_t cpu_clz(cpu_uintptr_t value); /*Count Leading Zeros, Use Lookup table if CPU don't support this ASM CODE*/

////////////////////////////////////////////////////////////////////////////////
////

/*
 Return:
    - cpu_sp: SP in CPU
 */
int cpu_stack_init(void* thread_entry, void* parameter, void* stack_addr, int stack_size, void** cpu_sp);



#endif /*INCLUDED_CPU_H*/
