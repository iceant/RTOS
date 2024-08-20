#ifndef INCLUDED_CPU_STACK_H
#define INCLUDED_CPU_STACK_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

////////////////////////////////////////////////////////////////////////////////
////
int cpu_stack_init(void* thread_entry, void* thread_parameter
    , void* stack_address
    , size_t stack_size
    , void* thread_exit_entry
    , void** result_stack_pointer
);

int cpu_stack_switch(void* from_stack_p, void* to_stack_p);

#endif /*INCLUDED_CPU_STACK_H*/
