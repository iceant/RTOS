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

////////////////////////////////////////////////////////////////////////////////
////



////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_memory_init(void);
void os_memory_destroy(void);

void * os_memory_malloc(os_size_t nBytes, const char* file, os_size_t line);
void * os_memory_calloc(os_size_t nCount, os_size_t nBytes, const char* file, os_size_t line);
void * os_memory_realloc(void* memory, os_size_t nBytes, const char* file, os_size_t line);
void os_memory_free(void* memory, const char* file, os_size_t line);

////////////////////////////////////////////////////////////////////////////////
////
#define OS_ALLOC(SZ) os_memory_malloc((SZ), __FILE__, __LINE__)
#define OS_CALLOC(N, SZ) os_memory_calloc((N), (SZ), __FILE__, __LINE__)
#define OS_REALLOC(M, SZ) os_memory_realloc((M), (SZ), __FILE__, __LINE__)
#define OS_RESIZE(M, SZ) ((M) = os_memory_realloc((M), (SZ), __FILE__, __LINE__))
#define OS_FREE(M) (os_memory_free((M), __FILE__, __LINE__), (M)=0)

#define OS_NEW(P) (P) = OS_ALLOC(sizeof(*(P)))
#define OS_NEW0(P) (P) = OS_CALLOC(1, sizeof(*(P)))

////////////////////////////////////////////////////////////////////////////////
////
#define malloc      OS_ALLOC
#define calloc      OS_CALLOC
#define realloc     OS_REALLOC
#define free        OS_FREE




#endif /*INCLUDED_OS_MEMORY_H*/
