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

#define OS_PAGE(T, SZ) (((T) + (SZ) - 1)/(SZ))

////////////////////////////////////////////////////////////////////////////////
//// https://github.com/pfultz2/Cloak/wiki/C-Preprocessor-tricks,-tips,-and-idioms
//// http://jhnet.co.uk/articles/cpp_magic/map_working.txt



#endif /*INCLUDED_OS_MACROS_H*/
