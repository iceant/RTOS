#ifndef INCLUDED_OS_MEMORY_H
#define INCLUDED_OS_MEMORY_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_STRING_H
#define INCLUDED_STRING_H
#include <string.h>
#endif /*INCLUDED_STRING_H*/


////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_memory_init(void);

void* os_memory_alloc(os_size_t nBytes);

void* os_memory_calloc(os_size_t nCount, os_size_t nBytes);

void* os_memory_realloc(void* memory, os_size_t nBytes);

void os_memory_free(void* memory);

/* -------------------------------------------------------------------------------------------------------------- */


#define OS_ALLOC(x) os_memory_alloc((x))
#define OS_CALLOC(N, x) os_memory_calloc((N), (x))
#define OS_REALLOC(P, x) os_memory_realloc((P), (x))
#define OS_FREE(P) os_memory_free((P))

#define OS_RESIZE(P, x) (P) = OS_REALLOC(P, x)
#define OS_NEW(P) (P) = OS_ALLOC(sizeof(*(P)))
#define OS_NEW0(P)  (P) = OS_CALLOC(1, sizeof(*(P)))

#endif /* INCLUDED_OS_MEMORY_H */
