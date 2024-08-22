#ifndef INCLUDED_CPU_TYPES_H
#define INCLUDED_CPU_TYPES_H

#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /*INCLUDED_STDINT_H*/

#ifndef INCLUDED_STDBOOL_H
#define INCLUDED_STDBOOL_H
#include <stdbool.h>
#endif /*INCLUDED_STDBOOL_H*/

#ifndef INCLUDED_CPU_DEFINITIONS_H
#include <cpu_definitions.h>
#endif /*INCLUDED_CPU_DEFINITIONS_H*/

#ifndef INCLUDED_C_COMPILER_H
#include <c_compiler.h>
#endif /*INCLUDED_C_COMPILER_H*/



////////////////////////////////////////////////////////////////////////////////
////
typedef int32_t     cpu_int_t;
typedef uint32_t    cpu_uint_t;
typedef int32_t     cpu_intptr_t;
typedef uint32_t    cpu_uintptr_t;
typedef uint32_t    cpu_size_t;

#define cpu_bool_t  bool
#define CPU_TRUE    true
#define CPU_FALSE   false

////////////////////////////////////////////////////////////////////////////////
////
#define CPU_REG(A) (*(volatile cpu_uintptr_t *)(A))




#endif /*INCLUDED_CPU_TYPES_H*/
