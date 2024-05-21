#ifndef INCLUDED_OS_MACROS_H
#define INCLUDED_OS_MACROS_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

////////////////////////////////////////////////////////////////////////////////
////
#define OS_ARRAY_SIZE(N) (sizeof(N)/sizeof((N)[0]))


#define OS_CONTAINER_OF(ptr, type, member) \
    ((type *)((char *)(ptr) - (os_uint_t)(&((type *)0)->member)))


#define OS_MIN(a, b) (((a) > (b))?(b):(a))

#endif /*INCLUDED_OS_MACROS_H*/
