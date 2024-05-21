#ifndef INCLUDED_CPU_INTERRUPT_H
#define INCLUDED_CPU_INTERRUPT_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

#ifndef INCLUDED_CPU_FUNCTIONS_H
#include <cpu_functions.h>
#endif /*INCLUDED_CPU_FUNCTIONS_H*/

////////////////////////////////////////////////////////////////////////////////
////


C__STATIC_FORCEINLINE cpu_uint_t cpu_interrupt_disable(void){
    register cpu_uint_t result;
    result = cpu_get_PRIMASK();
    cpu_disable_irq();
    cpu_ISB();
    cpu_DMB();
    return result;
}

C__STATIC_FORCEINLINE void cpu_interrupt_enable(cpu_uint_t level){
    cpu_set_PRIMASK(level);
    cpu_ISB();
}







#endif /*INCLUDED_CPU_INTERRUPT_H*/
