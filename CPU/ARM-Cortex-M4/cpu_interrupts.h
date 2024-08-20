#ifndef INCLUDED_CPU_INTERRUPTS_H
#define INCLUDED_CPU_INTERRUPTS_H

#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

#ifndef INCLUDED_CPU_FUNCTIONS_H
#include <cpu_functions.h>
#endif /*INCLUDED_CPU_FUNCTIONS_H*/



////////////////////////////////////////////////////////////////////////////////
////

typedef cpu_uint_t cpu_interrupt_context_t;

C_STATIC_FORCEINLINE void cpu_interrupt_enter(cpu_interrupt_context_t* context){
    cpu_uint_t level = cpu_get_primask();
    cpu_disable_irq();
    *context = level;
}

C_STATIC_FORCEINLINE void cpu_interrupt_leave(const cpu_interrupt_context_t* level){
    cpu_set_primask(*level);
}

////////////////////////////////////////////////////////////////////////////////
////


#endif /*INCLUDED_CPU_INTERRUPTS_H*/
