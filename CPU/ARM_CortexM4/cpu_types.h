#ifndef INCLUDED_CPU_TYPES_H
#define INCLUDED_CPU_TYPES_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /*INCLUDED_STDINT_H*/

////////////////////////////////////////////////////////////////////////////////
////

typedef int32_t cpu_int_t;
typedef uint32_t cpu_uint_t;
typedef cpu_uint_t cpu_size_t;

#ifndef __FPU_PRESENT
#define __FPU_PRESENT 1
#endif

#endif /*INCLUDED_CPU_TYPES_H*/
