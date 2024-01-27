#ifndef INCLUDED_OS_TYPES_H
#define INCLUDED_OS_TYPES_H


////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_OS_COMPILER_H
#include <os_compiler.h>
#endif /*INCLUDED_OS_COMPILER_H*/


////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_CPU_H
#include <cpu.h>
#endif /*INCLUDED_CPU_H*/

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_KERNEL_CONFIG_H
#include <os_kernel_config.h>
#endif /*INCLUDED_OS_KERNEL_CONFIG_H*/

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /*INCLUDED_STDINT_H*/

#ifndef INCLUDED_STDBOOL_H
#define INCLUDED_STDBOOL_H
#include <stdbool.h>
#endif /*INCLUDED_STDBOOL_H*/

#ifndef INCLUDED_STDDEF_H
#define INCLUDED_STDDEF_H
#include <stddef.h>
#endif /*INCLUDED_STDDEF_H*/

#ifndef INCLUDED_INTTYPES_H
#define INCLUDED_INTTYPES_H
#include <inttypes.h>
#endif /*INCLUDED_INTTYPES_H*/

#ifndef INCLUDED_LIMITS_H
#define INCLUDED_LIMITS_H
#include <limits.h>
#endif /*INCLUDED_LIMITS_H*/

////////////////////////////////////////////////////////////////////////////////
////
#if defined(CPU_32BIT)
typedef  int32_t    os_int_t;
typedef uint32_t    os_uint_t;
typedef os_int_t    os_intptr_t;
typedef os_uint_t   os_uintptr_t;
typedef os_uint_t   os_size_t;
#define OS_PRId     PRId32
#define OS_PRIi     PRIi32
#define OS_PRIo     PRIo32
#define OS_PRIu     PRIu32
#define OS_PRIx     PRIx32
#define OS_PRIX     PRIX32
#endif

#if defined(CPU_64BIT)
typedef  int64_t    os_int_t;
typedef uint64_t    os_uint_t;
typedef os_int_t    os_intptr_t;
typedef os_uint_t   os_uintptr_t;
typedef os_uint_t   os_size_t;
#define OS_PRId     PRId64
#define OS_PRIi     PRIi64
#define OS_PRIo     PRIo64
#define OS_PRIu     PRIu64
#define OS_PRIx     PRIx64
#define OS_PRIX     PRIX64
#endif


#define os_bool_t   bool
#define OS_TRUE     true
#define OS_FALSE    false




#endif /*INCLUDED_OS_TYPES_H*/
