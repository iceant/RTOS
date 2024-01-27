#ifndef INCLUDED_CPU_H
#define INCLUDED_CPU_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_CPU_PORT_H
#include <cpu_port.h>
#endif /*INCLUDED_CPU_PORT_H*/

////////////////////////////////////////////////////////////////////////////////
////

/*
 Return:
    - cpu_sp: SP in CPU
 */
int cpu_stack_init(void* thread_entry, void* parameter, void* stack_addr, int stack_size, void** cpu_sp);



#endif /*INCLUDED_CPU_H*/
