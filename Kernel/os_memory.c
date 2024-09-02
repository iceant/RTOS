#include <os_memory.h>

#if defined(OS_MEMORY_USE_TLFS)

#include <tlsf.h>

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t os_memory__pool[OS_MEMORY_POOL_SIZE];

os_err_t os_memory_init(void){
    size_t size = init_memory_pool(OS_MEMORY_POOL_SIZE, os_memory__pool);
    return size>0?OS_ERR_OK:OS_ERR_ERROR;
}

void* os_memory_alloc(os_size_t nBytes)
{
    return tlsf_malloc(nBytes);
}

void* os_memory_calloc(os_size_t nCount, os_size_t nBytes){
    return tlsf_calloc(nCount, nBytes);
}

void* os_memory_realloc(void* memory, os_size_t nBytes)
{
    return tlsf_realloc(memory, nBytes);
}

void os_memory_free(void* memory)
{
    if(memory){
        tlsf_free(memory);
    }
}


#else

#endif