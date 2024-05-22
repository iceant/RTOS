#ifndef INCLUDED_OS_TYPES_H
#define INCLUDED_OS_TYPES_H

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

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_RTOS_COMPILER_H
#include <rtos_compiler.h>
#endif /*INCLUDED_RTOS_COMPILER_H*/

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_CONFIG_H
#include <os_config.h>
#endif /*INCLUDED_OS_CONFIG_H*/

#ifndef INCLUDED_CPU_H
#include <cpu.h>
#endif /*INCLUDED_CPU_H*/

////////////////////////////////////////////////////////////////////////////////
////
#if !defined(CPU_8BIT) && !defined(CPU_16BIT) && !defined(CPU_32BIT) && !defined(CPU_64BIT)
#define CPU_32BIT
#endif

#if !defined(RTOS_KERNEL_USE_TLSF)
#define RTOS_KERNEL_USE_TLSF
#endif



////////////////////////////////////////////////////////////////////////////////
////
#if defined(CPU_8BIT)
typedef int8_t      os_int_t;
typedef uint8_t     os_uint_t;
#define OS_PRId     PRId8
#define OS_PRIi     PRIi8
#define OS_PRIu     PRIu8
#define OS_PRIo     PRIo8
#define OS_PRIx     PRIx8
#define OS_PRIX     PRIX8
#define OS_INT_MAX  INT8_MAX
#define OS_INT_MIN  INT8_MIN
#define OS_UINT_MAX  UINT8_MAX
#elif defined(CPU_16BIT)
typedef int16_t      os_int_t;
typedef uint16_t     os_uint_t;
#define OS_PRId     PRId16
#define OS_PRIi     PRIi16
#define OS_PRIu     PRIu16
#define OS_PRIo     PRIo16
#define OS_PRIx     PRIx16
#define OS_PRIX     PRIX16
#define OS_INT_MAX  INT16_MAX
#define OS_INT_MIN  INT16_MIN
#define OS_UINT_MAX  UINT16_MAX
#elif defined(CPU_32BIT)
typedef int32_t      os_int_t;
typedef uint32_t     os_uint_t;
#define OS_PRId     PRId32
#define OS_PRIi     PRIi32
#define OS_PRIu     PRIu32
#define OS_PRIo     PRIo32
#define OS_PRIx     PRIx32
#define OS_PRIX     PRIX32
#define OS_INT_MAX  INT32_MAX
#define OS_INT_MIN  INT32_MIN
#define OS_UINT_MAX  UINT32_MAX
#elif defined(CPU_64BIT)
typedef int64_t      os_int_t;
typedef uint64_t     os_uint_t;
#define OS_PRId     PRId64
#define OS_PRIi     PRIi64
#define OS_PRIu     PRIu64
#define OS_PRIo     PRIo64
#define OS_PRIx     PRIx64
#define OS_PRIX     PRIX64
#define OS_INT_MAX  INT64_MAX
#define OS_INT_MIN  INT64_MIN
#define OS_UINT_MAX  UINT64_MAX
#endif


typedef os_uint_t os_size_t;

#define os_bool_t   bool
#define OS_TRUE     true
#define OS_FALSE    false

////////////////////////////////////////////////////////////////////////////////
////


#ifndef INCLUDED_OS_DEFINITIONS_H
#include <os_definitions.h>
#endif /*INCLUDED_OS_DEFINITIONS_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef os_uint_t os_time_t;



#endif /*INCLUDED_OS_TYPES_H*/
