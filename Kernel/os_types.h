#ifndef INCLUDED_OS_TYPES_H
#define INCLUDED_OS_TYPES_H

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

#ifndef INCLUDED_CTYPE_H
#define INCLUDED_CTYPE_H
#include <ctype.h>
#endif /*INCLUDED_CTYPE_H*/

#ifndef INCLUDED_C_COMPILER_H
#include <c_compiler.h>
#endif /*INCLUDED_C_COMPILER_H*/

#ifndef INCLUDED_OS_DEFINITIONS_H
#include <os_definitions.h>
#endif /*INCLUDED_OS_DEFINITIONS_H*/

/* -------------------------------------------------------------------------------------------------------------- */


#if (OS_SIZEOF_VOID_P==1)
    typedef int8_t     os_int_t;
    typedef uint8_t    os_uint_t;
    typedef os_int_t    os_intptr_t;
    typedef os_uint_t   os_uintptr_t;
    typedef os_uint_t   os_size_t;

    #define OS_PRId    PRId8
    #define OS_PRIi    PRIi8
    #define OS_PRIo    PRIo8
    #define OS_PRIu    PRIu8
    #define OS_PRIx    PRIx8
    #define OS_PRIX    PRIX8
    #define OS_SCNd    SCNd8
    #define OS_SCNi    SCNi8
    #define OS_SCNo    SCNo8
    #define OS_SCNu    SCNu8
    #define OS_SCNx    SCNx8
#elif (OS_SIZEOF_VOID_P==2)
    typedef int16_t     os_int_t;
    typedef uint16_t    os_uint_t;
    typedef os_int_t    os_intptr_t;
    typedef os_uint_t   os_uintptr_t;
    typedef os_uint_t   os_size_t;

    #define OS_PRId    PRId16
    #define OS_PRIi    PRIi16
    #define OS_PRIo    PRIo16
    #define OS_PRIu    PRIu16
    #define OS_PRIx    PRIx16
    #define OS_PRIX    PRIX16
    #define OS_SCNd    SCNd16
    #define OS_SCNi    SCNi16
    #define OS_SCNo    SCNo16
    #define OS_SCNu    SCNu16
    #define OS_SCNx    SCNx16
#elif (OS_SIZEOF_VOID_P==4)
    typedef int32_t     os_int_t;
    typedef uint32_t    os_uint_t;
    typedef os_int_t    os_intptr_t;
    typedef os_uint_t   os_uintptr_t;
    typedef os_uint_t   os_size_t;

    #define OS_PRId    PRId32
    #define OS_PRIi    PRIi32
    #define OS_PRIo    PRIo32
    #define OS_PRIu    PRIu32
    #define OS_PRIx    PRIx32
    #define OS_PRIX    PRIX32
    #define OS_SCNd    SCNd32
    #define OS_SCNi    SCNi32
    #define OS_SCNo    SCNo32
    #define OS_SCNu    SCNu32
    #define OS_SCNx    SCNx32
#elif (OS_SIZEOF_VOID_P==8)
    typedef int64_t     os_int_t;
    typedef uint64_t    os_uint_t;
    typedef os_int_t    os_intptr_t;
    typedef os_uint_t   os_uintptr_t;
    typedef os_uint_t   os_size_t;

    #define OS_PRId    PRId64
    #define OS_PRIi    PRIi64
    #define OS_PRIo    PRIo64
    #define OS_PRIu    PRIu64
    #define OS_PRIx    PRIx64
    #define OS_PRIX    PRIX64
    #define OS_SCNd    SCNd64
    #define OS_SCNi    SCNi64
    #define OS_SCNo    SCNo64
    #define OS_SCNu    SCNu64
    #define OS_SCNx    SCNx64
#endif

#define os_bool_t   bool
#define OS_TRUE     true
#define OS_FALSE    false


#endif /*INCLUDED_OS_TYPES_H*/
