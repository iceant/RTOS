#ifndef INCLUDED_CPU_H
#define INCLUDED_CPU_H

////////////////////////////////////////////////////////////////////////////////
////


#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

#ifndef INCLUDED_CPU_STACK_H
#include <cpu_stack.h>
#endif /*INCLUDED_CPU_STACK_H*/

#ifndef INCLUDED_CPU_INTERRUPTS_H
#include <cpu_interrupts.h>
#endif /*INCLUDED_CPU_INTERRUPTS_H*/

#ifndef INCLUDED_CPU_REGISTERS_H
#include <cpu_registers.h>
#endif /*INCLUDED_CPU_REGISTERS_H*/

#ifndef INCLUDED_CPU_SVC_H
#include <cpu_svc.h>
#endif /*INCLUDED_CPU_SVC_H*/

#ifndef INCLUDED_CPU_SPINLOCK_H
#include <cpu_spinlock.h>
#endif /*INCLUDED_CPU_SPINLOCK_H*/



////////////////////////////////////////////////////////////////////////////////
////

typedef void (*cpu_exception_handler_t)(void*);

extern cpu_exception_handler_t cpu_exception_handler;


#endif /*INCLUDED_CPU_H*/
