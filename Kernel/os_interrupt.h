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


////////////////////////////////////////////////////////////////////////////////
////

void os_interrupt_enter(void);

void os_interrupt_exit(void);

os_uint_t os_interrupt_nest(void);




#endif /*INCLUDED_OS_INTERRUPT_H*/
