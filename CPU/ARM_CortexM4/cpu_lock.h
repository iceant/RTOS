#ifndef INCLUDED_CPU_LOCK_H
#define INCLUDED_CPU_LOCK_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

#ifndef INCLUDED_CPU_INTERRUPT_H
#include <cpu_interrupt.h>
#endif /*INCLUDED_CPU_INTERRUPT_H*/

////////////////////////////////////////////////////////////////////////////////
////
#define CPU_LOCK_USE_INTERRUPT

////////////////////////////////////////////////////////////////////////////////
////

#if defined(CPU_LOCK_USE_INTERRUPT)

typedef volatile cpu_uint_t cpu_lock_t;

C__STATIC_FORCEINLINE void cpu_lock_init(cpu_lock_t * lock){
    *lock = 0;
}

C__STATIC_FORCEINLINE void cpu_lock_lock(cpu_lock_t* lock){
    *lock = cpu_interrupt_disable();
}

C__STATIC_FORCEINLINE void cpu_lock_unlock(cpu_lock_t *lock){
    cpu_interrupt_enable(*lock);
}

#endif









#endif /*INCLUDED_CPU_LOCK_H*/
