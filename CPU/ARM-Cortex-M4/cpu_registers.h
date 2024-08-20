#ifndef INCLUDED_CPU_REGISTERS_H
#define INCLUDED_CPU_REGISTERS_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/


////////////////////////////////////////////////////////////////////////////////
////

#define CPU_REG(ADDRESS) (*((volatile cpu_uint_t*)(ADDRESS)))



#endif /*INCLUDED_CPU_REGISTERS_H*/
