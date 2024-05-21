#include <os_memory.h>

#if defined(RTOS_KERNEL_USE_TLSF)
#include <tlsf.h>
#else
#include <stdlib.h>
#endif

#if defined(RTOS_KERNEL_USE_TLSF)
static uint8_t os_memory__blocks[RTOS_KERNEL_TLSF_POOL_SIZE];
os_err_t os_memory_init(void)
{
    os_size_t size = init_memory_pool(sizeof(os_memory__blocks)*sizeof(uint8_t), os_memory__blocks);
    if(size>0){
        return OS_EOK;
    }
    return OS_ERROR;
}

void os_memory_destroy(void)
{
    destroy_memory_pool(os_memory__blocks);
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

