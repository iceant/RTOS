#ifndef INCLUDED_CPU_ATOMIC_H
#define INCLUDED_CPU_ATOMIC_H

/* -------------------------------------------------------------------------------------------------------------- */


#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

#ifndef INCLUDED_CPU_FUNCTIONS_H
#include <cpu_functions.h>
#endif /*INCLUDED_CPU_FUNCTIONS_H*/



/* -------------------------------------------------------------------------------------------------------------- */
/* TYPES */
typedef volatile cpu_int_t cpu_atomic_t;

/* -------------------------------------------------------------------------------------------------------------- */
/* UTILS */
#define CPU_ATOMIC_INIT(n) {(n)}

/* -------------------------------------------------------------------------------------------------------------- */
/* FUNCTIONS */


C_STATIC_FORCEINLINE int cpu_atomic_read(const cpu_atomic_t* v){
    return (*((volatile int*)v));
}

C_STATIC_FORCEINLINE void cpu_atomic_set(cpu_atomic_t* v, int i){
    *v = i;
}

C_STATIC_FORCEINLINE cpu_int_t cpu_atomic_read_acquire(cpu_atomic_t* v){
    return cpu_ldrexw(v);
}

C_STATIC_FORCEINLINE cpu_int_t cpu_atomic_set_release(cpu_atomic_t* v, cpu_int_t value){
    return cpu_strexw(value, v);
}

C_STATIC_FORCEINLINE cpu_int_t cpu_atomic_add_return(cpu_atomic_t* v, cpu_int_t i)
{
    cpu_int_t status;
    cpu_int_t result;
    cpu_dmb();
    do{
        result = cpu_ldrexw(v);
        result+=i;
        status = cpu_strexw(result, v);
    }
    while(status!=0);
    cpu_dmb();
    return result;
}

C_STATIC_FORCEINLINE cpu_int_t cpu_atomic_sub_return(cpu_atomic_t* v, cpu_int_t i)
{
    cpu_int_t status;
    cpu_int_t result;
    cpu_dmb();
    do{
        result = cpu_ldrexw(v);
        result-=i;
        status = cpu_strexw(result, v);
    }
    while(status!=0);
    cpu_dmb();
    return result;
}

/*
 * compare if(v == old_value) then v=new_value
 * return:
 *      -  old_value
 */
C_STATIC_FORCEINLINE int cpu_atomic_cmpxchg(cpu_atomic_t* v, cpu_int_t old_value, cpu_int_t new_value)
{
    cpu_int_t ret;
    cpu_int_t status;
    cpu_dmb();
    do{
        ret = cpu_ldrexw(v);
        if(ret==old_value){
            status = cpu_strexw(new_value, v);
        }
    }while(status!=0);
    cpu_dmb();
    return ret;
}

C_STATIC_FORCEINLINE void cpu_atomic_inc(cpu_atomic_t* v){
    cpu_atomic_add_return(v, 1);
}

C_STATIC_FORCEINLINE void cpu_atomic_dec(cpu_atomic_t* v){
    cpu_atomic_sub_return(v, 1);
}



#endif /* INCLUDED_CPU_ATOMIC_H */
