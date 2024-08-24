#ifndef INCLUDED_OS_MEMORY_H
#define INCLUDED_OS_MEMORY_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_STRING_H
#define INCLUDED_STRING_H
#include <string.h>
#endif /*INCLUDED_STRING_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_memory_init(void);
void os_memory_destroy(void);

void* os_memory_alloc(os_size_t nBytes);
void* os_memory_calloc(os_size_t nCount, os_size_t nBytes);
void* os_memory_realloc(void* memory, os_size_t nBytes);
void  os_memory_free(void* memory);

////////////////////////////////////////////////////////////////////////////////
////
#define OS_ALLOC(x)         os_memory_alloc((x))
#define OS_CALLOC(n, x)     os_memory_calloc((n), (x))
#define OS_REALLOC(p, x)    os_memory_realloc((p), (x))
#define OS_RESIZE(p, x)     ((p)=OS_REALLOC(p, x))
#define OS_FREE(p)          (os_memory_free((p)), (p)=0)

#define OS_NEW(p)           ((p)=OS_ALLOC(sizeof(*(p))))
#define OS_NEW0(p)          ((p)=OS_CALLOC(1, sizeof(*(p))))


#endif /*INCLUDED_OS_MEMORY_H*/
