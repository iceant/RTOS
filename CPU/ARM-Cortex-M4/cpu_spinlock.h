#ifndef INCLUDED_CPU_SPINLOCK_H
#define INCLUDED_CPU_SPINLOCK_H

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
typedef volatile cpu_uint_t cpu_spinlock_t;

////////////////////////////////////////////////////////////////////////////////
////
C_STATIC_FORCEINLINE void cpu_spinlock_init(cpu_spinlock_t * lock){
    *lock = 0;
}

C_STATIC_FORCEINLINE void cpu_spinlock_lock(cpu_spinlock_t *lock){
    int status;
    do{
        while(cpu_ldrexw(lock)!=0);
        status = cpu_strexw(1, lock);
    }while(status!=0);
    cpu_dmb();
}


C_STATIC_FORCEINLINE void cpu_spinlock_unlock(cpu_spinlock_t *lock){
    int status;
    do{
        while(cpu_ldrexw(lock)!=1);
        status = cpu_strexw(0, lock);
    }while(status!=0);
    cpu_dmb();
}

C_STATIC_FORCEINLINE void cpu_spinlock_lock_with_wfe(cpu_spinlock_t * lock){
    int status;
    do{
        while(cpu_ldrexw(lock)!=0){
            cpu_wfe();
        }
        status = cpu_strexw(1, lock);
    }while(status!=0);
    cpu_dmb();
}

C_STATIC_FORCEINLINE void cpu_spinlock_unlock_with_sev(cpu_spinlock_t *lock){
    cpu_dmb();
    lock = 0;
    cpu_sev();
}


#endif /*INCLUDED_CPU_SPINLOCK_H*/
