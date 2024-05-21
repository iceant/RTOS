#ifndef INCLUDED_CPU_SPINLOCK_H
#define INCLUDED_CPU_SPINLOCK_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

#ifndef INCLUDED_RTOS_COMPILER_H
#include <rtos_compiler.h>
#endif /*INCLUDED_RTOS_COMPILER_H*/

#ifndef INCLUDED_CPU_FUNCTIONS_H
#include <cpu_functions.h>
#endif /*INCLUDED_CPU_FUNCTIONS_H*/


////////////////////////////////////////////////////////////////////////////////
////

typedef volatile cpu_uint_t cpu_spinlock_t;

C__STATIC_FORCEINLINE void cpu_spinlock_init(cpu_spinlock_t * lock){
    *lock = 0;
}

C__STATIC_FORCEINLINE void cpu_spinlock_lock(cpu_spinlock_t* lock){
    cpu_uint_t result;
    do{
        while(cpu_LDREXW(lock)!=0);
        result = cpu_STREXW(1, lock);
    } while (result!=0);
    cpu_DMB();
}

C__STATIC_FORCEINLINE void cpu_spinlock_unlock(cpu_spinlock_t * lock)
{
    *lock = 0;
    cpu_DMB();
}





#endif /*INCLUDED_CPU_SPINLOCK_H*/
