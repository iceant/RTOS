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
//// TYPE
typedef volatile cpu_uintptr_t cpu_atomic_t;

////////////////////////////////////////////////////////////////////////////////
//// USED
extern bool cpu_atomic_cmpxchg(cpu_atomic_t* atomic, cpu_int_t old_value, cpu_int_t new_value);
/* set atomic = value and return the old atomic value */
extern cpu_int_t cpu_atomic_store(cpu_atomic_t* atomic, cpu_int_t new_value);

////////////////////////////////////////////////////////////////////////////////
//// NOT USED
extern void cpu_atomic_add(cpu_atomic_t* atomic, cpu_int_t value);
extern cpu_int_t cpu_atomic_add_return(cpu_atomic_t* atomic, cpu_int_t value);

extern void cpu_atomic_sub(cpu_atomic_t * atomic, cpu_int_t value);
extern cpu_int_t cpu_atomic_sub_return(cpu_atomic_t * atomic, cpu_int_t value);

extern void cpu_atomic_inc(cpu_atomic_t * atomic);
extern cpu_int_t cpu_atomic_inc_return(cpu_atomic_t * atomic);

extern void cpu_atomic_dec(cpu_atomic_t * atomic);
extern cpu_int_t cpu_atomic_dec_return(cpu_atomic_t * atomic);


/* set atomic = value and return the old atomic value */
extern cpu_int_t cpu_atomic_xchg(cpu_atomic_t* atomic, cpu_int_t value);

extern void cpu_atomic_or(cpu_atomic_t* atomic, cpu_int_t value);
extern void cpu_atomic_xor(cpu_atomic_t* atomic, cpu_int_t value);

extern bool cpu_atomic_test_bit(cpu_atomic_t* atomic, cpu_int_t bit_no);
extern void cpu_atomic_set_bit(cpu_atomic_t* atomic, cpu_int_t bit_no);
extern void cpu_atomic_clear_bit(cpu_atomic_t* atomic, cpu_int_t bit_no);
extern void cpu_atomic_change_bit(cpu_atomic_t* atomic, cpu_int_t bit_no);

#endif /* INCLUDED_CPU_ATOMIC_H */
