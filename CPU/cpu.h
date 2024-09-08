#ifndef INCLUDED_CPU_H
#define INCLUDED_CPU_H

/* -------------------------------------------------------------------------------------------------------------- */


#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

#ifndef INCLUDED_CPU_DEFINITIONS_H
#include <cpu_definitions.h>
#endif /*INCLUDED_CPU_DEFINITIONS_H*/

#ifndef INCLUDED_CPU_REGISTERS_H
#include <cpu_registers.h>
#endif /*INCLUDED_CPU_REGISTERS_H*/

#ifndef INCLUDED_CPU_FUNCTIONS_H
#include <cpu_functions.h>
#endif /*INCLUDED_CPU_FUNCTIONS_H*/

#ifndef INCLUDED_CPU_STACK_H
#include <cpu_stack.h>
#endif /*INCLUDED_CPU_STACK_H*/

#ifndef INCLUDED_CPU_KERNEL_H
#include <cpu_kernel.h>
#endif /*INCLUDED_CPU_KERNEL_H*/

#if (CPU_FEATURE_SPINLOCK_SUPPORT==1)
    #ifndef INCLUDED_CPU_SPINLOCK_H
    #include <cpu_spinlock.h>
    #endif /*INCLUDED_CPU_SPINLOCK_H*/
#endif

#if (CPU_FEATURE_ATOMIC_SUPPORT==1)
    #ifndef INCLUDED_CPU_ATOMIC_H
    #include <cpu_atomic.h>
    #endif /*INCLUDED_CPU_ATOMIC_H*/
#endif

#ifndef INCLUDED_CPU_EXCEPTION_H
#include <cpu_exception.h>
#endif /*INCLUDED_CPU_EXCEPTION_H*/



#endif /*INCLUDED_CPU_H*/
