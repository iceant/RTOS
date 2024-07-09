#include <os_memory.h>

#if defined(RTOS_KERNEL_USE_TLSF)
#include <tlsf.h>
#include <stdlib.h>
#include "os_printf.h"

#else
#include <stdlib.h>
#endif

#if defined(RTOS_KERNEL_USE_TLSF)
C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t os_memory__blocks[RTOS_KERNEL_TLSF_POOL_SIZE];

void os_memory_init(void)
{
    int size = init_memory_pool(RTOS_KERNEL_TLSF_POOL_SIZE, os_memory__blocks);
//    printf("Memory Pool Initialized: %d/%d\n", size, RTOS_KERNEL_TLSF_POOL_SIZE);
}

C__DESTRUCTOR(os_memory_destroy)
{
    destroy_memory_pool(os_memory__blocks);
//    printf("destroy_memory_pool done!\n");
}

void * os_memory_malloc(os_size_t nBytes, const char* file, os_size_t line)
{
    return tlsf_malloc(nBytes);
}

void * os_memory_calloc(os_size_t nCount, os_size_t nBytes, const char* file, os_size_t line)
{
    return tlsf_calloc(nCount, nBytes);
}

void * os_memory_realloc(void* memory, os_size_t nBytes, const char* file, os_size_t line)
{
    return tlsf_realloc(memory, nBytes);
}

void os_memory_free(void* memory, const char* file, os_size_t line)
{
    if(memory) {
        tlsf_free(memory);
    }
}

void * os_memory_malloc_ex(os_size_t nBytes)
{
    return tlsf_malloc(nBytes);
}
void * os_memory_calloc_ex(os_size_t nCount, os_size_t nBytes)
{
    return tlsf_calloc(nCount, nBytes);
}

void * os_memory_realloc_ex(void* memory, os_size_t nBytes)
{
    return tlsf_realloc(memory, nBytes);
}

void os_memory_free_ex(void* memory)
{
    if(memory){
        tlsf_free(memory);
    }
}

#else

os_err_t os_memory_init(void)
{
    return OS_EOK;
}

void os_memory_destroy(void)
{
}

void * os_memory_malloc(os_size_t nBytes, const char* file, os_size_t line)
{
    return malloc(nBytes);
}

void * os_memory_calloc(os_size_t nCount, os_size_t nBytes, const char* file, os_size_t line)
{
    return calloc(nCount, nBytes);
}

void * os_memory_realloc(void* memory, os_size_t nBytes, const char* file, os_size_t line)
{
    return realloc(memory, nBytes);
}

void os_memory_free(void* memory, const char* file, os_size_t line)
{
    if(memory) {
        free(memory);
    }
}
#endif

