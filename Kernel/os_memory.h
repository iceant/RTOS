#ifndef INCLUDED_OS_MEMORY_H
#define INCLUDED_OS_MEMORY_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

////////////////////////////////////////////////////////////////////////////////
////
/*0:Success, -1:Failed*/
int os_memory_init(void);

////////////////////////////////////////////////////////////////////////////////
////

void*  os_memory_alloc(os_size_t nBytes, const char* file, os_size_t line);
void*  os_memory_calloc(os_size_t nCount, os_size_t nBytes, const char* file, os_size_t line);
void*  os_memory_realloc(void* ptr, os_size_t nBytes, const char* file, os_size_t line);
void os_memory_free(void* ptr, const char* file, os_size_t line);

////////////////////////////////////////////////////////////////////////////////
////
#define OS_ALLOC(SZ) os_memory_alloc((SZ), __FILE__, __LINE__)
#define OS_CALLOC(N, SZ) os_memory_calloc((N), (SZ), __FILE__, __LINE__)
#define OS_REALLOC(M, SZ) os_memory_realloc((M), (SZ), __FILE__, __LINE__)
#define OS_FREE(P) (os_memory_free((P), __FILE__, __LINE__), (P)=0)

#define OS_RESIZE(M, SZ) (M)=os_memory_realloc((M), (SZ), __FILE__, __LINE__)
#define OS_NEW(P) ((P) = OS_ALLOC(sizeof(*(P))))
#define OS_NEW0(P) ((P) = OS_CALLOC(1, sizeof(*(P))))


#endif /*INCLUDED_OS_MEMORY_H*/
