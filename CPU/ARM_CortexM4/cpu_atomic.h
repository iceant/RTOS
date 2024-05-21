#ifndef INCLUDED_CPU_ATOMIC_H
#define INCLUDED_CPU_ATOMIC_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_CPU_FUNCTIONS_H
#include <cpu_functions.h>
#endif /*INCLUDED_CPU_FUNCTIONS_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef volatile cpu_uint_t cpu_atomic_t;

C__STATIC_FORCEINLINE cpu_uint_t cpu_atomic_add_return(cpu_atomic_t* v, cpu_uint_t i)
{
    cpu_uint_t tmp;
    cpu_uint_t result;
    cpu_DMB();
    do{
        result = cpu_LDREXW(v);
        result = result + i;
        tmp = cpu_STREXW(result, v);
    }while(tmp!=0);
    cpu_DMB();
    return result;
}


C__STATIC_FORCEINLINE cpu_uint_t cpu_atomic_sub_return(cpu_atomic_t * v, cpu_uint_t i){
    cpu_DMB();
    cpu_uint_t tmp;
    cpu_uint_t result;
    do{
        result = cpu_LDREXW(v);
        result = result - i;
        tmp = cpu_STREXW(result, v);
    }while(tmp!=0);
    cpu_DMB();
    return result;
}

C__STATIC_FORCEINLINE cpu_uint_t cpu_atomic_cmpxchg(cpu_atomic_t * v, cpu_uint_t old_value, cpu_uint_t new_value){
    cpu_uint_t old_v;
    cpu_uint_t res;
    cpu_DMB();
    do{
        old_v = cpu_LDREXW(v);
        res = 0;
        if(old_v==old_value){
            res = cpu_STREXW(new_value, v);
        }
    }while(res);
    cpu_DMB();
    return old_value;
}

#endif /*INCLUDED_CPU_ATOMIC_H*/
