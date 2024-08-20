#ifndef INCLUDED_OS_INTERRUPT_H
#define INCLUDED_OS_INTERRUPT_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_CPU_H
#include <cpu.h>
#endif /*INCLUDED_CPU_H*/

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_SCHEDULER_H
#include <os_scheduler.h>
#endif /*INCLUDED_OS_SCHEDULER_H*/



////////////////////////////////////////////////////////////////////////////////
////
extern cpu_atomic_t os_interrupt__nest;

C__STATIC_FORCEINLINE void os_interrupt_init(void){
    os_interrupt__nest = 0;
}

C__STATIC_FORCEINLINE void os_interrupt_enter(void){
    cpu_atomic_add_return((cpu_atomic_t*)&os_interrupt__nest, 1);
}

C__STATIC_FORCEINLINE void os_interrupt_exit(void){
    cpu_atomic_sub_return((cpu_atomic_t*)&os_interrupt__nest, 1);
}

C__STATIC_FORCEINLINE os_uint_t os_interrupt_nest(void){
    return os_interrupt__nest;
}




#endif /*INCLUDED_OS_INTERRUPT_H*/
