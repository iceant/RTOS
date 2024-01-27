#include <os_memory.h>
#include <os_types.h>
#include <stdio.h>


////////////////////////////////////////////////////////////////////////////////
//// TLSF

#if defined(USE_TLSF)
#include <tlsf.h>

////////////////////////////////////////////////////////////////////////////////
////
__ALIGNED(CPU_ALIGN_SIZE)
static uint8_t os_memory__tlsf_pool[TLSF_MEMORY_POOL_SIZE];

////////////////////////////////////////////////////////////////////////////////
////

int os_memory_init(void)
{
    size_t used_size = init_memory_pool(TLSF_MEMORY_POOL_SIZE, os_memory__tlsf_pool);
    printf("Memory Pool: %d/%d\n", used_size, TLSF_MEMORY_POOL_SIZE);
    return ((used_size>0)?0:-1);
}

void*  os_memory_alloc(os_size_t nBytes, const char* file, os_size_t line)
{
    return tlsf_malloc(nBytes);
}
void*  os_memory_calloc(os_size_t nCount, os_size_t nBytes, const char* file, os_size_t line)
{
    return tlsf_calloc(nCount, nBytes);
}
void*  os_memory_realloc(void* ptr, os_size_t nBytes, const char* file, os_size_t line)
{
    return tlsf_realloc(ptr, nBytes);
}

void os_memory_free(void* ptr, const char* file, os_size_t line)
{
    if(ptr){
        tlsf_free(ptr);
    }
}
#endif