#ifndef INCLUDED_CPU_ATOMIC_H
#define INCLUDED_CPU_ATOMIC_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_CPU_PORT_H
#include <cpu_port.h>
#endif /* INCLUDED_CPU_PORT_H */

#ifndef INCLUDED_STDBOOL_H
#define INCLUDED_STDBOOL_H
#include <stdbool.h>
#endif /* INCLUDED_STDBOOL_H */

////////////////////////////////////////////////////////////////////////////////
////

typedef volatile cpu_uintptr_t cpu_atomic_t;


////////////////////////////////////////////////////////////////////////////////
////
extern void cpu_atomic_add(cpu_atomic_t* atomic, cpu_int_t value);
extern bool cpu_atomic_cmpxchg(cpu_atomic_t* atomic, cpu_int_t old_value, cpu_int_t new_value);
extern cpu_int_t cpu_atomic_store(cpu_atomic_t* atomic, cpu_int_t new_value);

#endif /* INCLUDED_CPU_ATOMIC_H */
