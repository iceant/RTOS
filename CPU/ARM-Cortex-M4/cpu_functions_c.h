#ifndef INCLUDED_CPU_FUNCTIONS_C_H
#define INCLUDED_CPU_FUNCTIONS_C_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_CPU_FUNCTIONS_H
#include <cpu_functions.h>
#endif /*INCLUDED_CPU_FUNCTIONS_H*/

////////////////////////////////////////////////////////////////////////////////
////

C_STATIC_FORCEINLINE int cpu_in_privilege(void){
    if(cpu_get_ipsr()!=0) return 1;
    if((cpu_get_control() & 0x01)==0) return 1;
    return 0;
}


#endif /* INCLUDED_CPU_FUNCTIONS_C_H */
