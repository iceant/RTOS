#ifndef INCLUDED_OS_MACROS_H
#define INCLUDED_OS_MACROS_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

////////////////////////////////////////////////////////////////////////////////
////

#define OS_ALIGN_DOWN(x,align) (x & ~(align-1))
#define OS_ALIGN_UP(x,align) ((x + （align-1)) & ~(align-1))

#define OS_CONTAINER_OF(ptr, type, member) ((type*)(((char*)ptr) - (unsigned long)(&(((type*)0)->member))))

#define OS_MAX(a, b) ((a)>(b)?(a):(b))
#define OS_MIN(a, b) ((a)>(b)?(b):(a))

#define OS_PAGE(T, SZ) (((T) + (SZ) -1)/(SZ))


#endif /*INCLUDED_OS_MACROS_H*/


