#ifndef INCLUDED_CPU_STACK_H
#define INCLUDED_CPU_STACK_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

#ifndef INCLUDED_CPU_REGISTERS_H
#include <cpu_registers.h>
#endif /*INCLUDED_CPU_REGISTERS_H*/


////////////////////////////////////////////////////////////////////////////////
////
#define CPU_STACK_SWITCH_FLAG_ON    1
#define CPU_STACK_SWITCH_FLAG_OFF   0

////////////////////////////////////////////////////////////////////////////////
////
#define CPU_REGISTER_SIZE           4   /*寄存器大小*/
#define CPU_STACK_REGISTER_COUNT    18  /*寄存器数量*/
#define CPU_STACK_INIT_REGISTER_SIZE (CPU_STACK_REGISTER_COUNT * CPU_REGISTER_SIZE)

////////////////////////////////////////////////////////////////////////////////
////
extern void** cpu_stack__curr_p;
extern void** cpu_stack__next_p;
extern volatile uint8_t cpu_stack__switch_flag;


////////////////////////////////////////////////////////////////////////////////
////
int cpu_stack_init(void* thread_entry, void* parameter, uint8_t * stack_address, int stack_size, void** return_sp);

int cpu_stack_switch(void** from_stack_p, void** to_stack_p);

int cpu_stack_is_switch_in_progress(void);


#endif /*INCLUDED_CPU_STACK_H*/
