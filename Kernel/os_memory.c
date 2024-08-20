#include <os_memory.h>

#if defined(OS_KERNEL_USE_TLSF)
#include <tlsf.h>

static uint8_t os_memory__pool[OS_KERNEL_MEMORY_POOL_SIZE];

os_err_t os_memory_init(void){
    int err = init_memory_pool(OS_KERNEL_MEMORY_POOL_SIZE, os_memory__pool);
    if(err==-1){
        return OS_ERR_ERROR;
    }else{
        return OS_ERR_OK;
    }
}

void os_memory_destroy(void){
    destroy_memory_pool(os_memory__pool);
}

void* os_memory_alloc(os_size_t nBytes){
    return tlsf_malloc(nBytes);
}

void* os_memory_calloc(os_size_t nCount, os_size_t nBytes){
    return tlsf_calloc(nCount, nBytes);
}

void* os_memory_realloc(void* memory, os_size_t nBytes){
    return tlsf_realloc(memory, nBytes);
}

void os_memory_free(void* memory){
    if(memory){
        tlsf_free(memory);
    }
}

#else

#include <stdlib.h>

os_err_t os_memory_init(void){
    return OS_ERR_OK;
}

void os_memory_destroy(void){

}

void* os_memory_alloc(os_size_t nBytes){
    return malloc(nBytes);
}

void* os_memory_calloc(os_size_t nCount, os_size_t nBytes){
    return calloc(nCount, nBytes);
}

void* os_memory_realloc(void* memory, os_size_t nBytes){
    return realloc(memory, nBytes);
}

void os_memory_free(void* memory){
    if(memory){
        free(memory);
    }
}

#endif