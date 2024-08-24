#include <sdk_vector.h>
#include <os_memory.h>

////////////////////////////////////////////////////////////////////////////////
////
#define ELEMENT_SIZE sizeof(void*)

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_vector_init(os_vector_t * vector, os_size_t capacity)
{
    vector->capacity= capacity;
    vector->size= 0;

    if(capacity==0){
        vector->items= 0;
    }else{
        vector->items = OS_ALLOC(ELEMENT_SIZE * capacity);
        if(!vector->items){
            return OS_ERR_ENOMEM;
        }
        for(os_size_t i=0; i<capacity; i++){
            vector->items[i] = 0;
        }
    }
    return OS_ERR_OK;
}

void os_vector_destroy(os_vector_t * vector)
{
    OS_FREE(vector->items);
    vector->size = 0;
}

os_err_t os_vector_resize(os_vector_t * vector, os_size_t new_capacity)
{
    if(new_capacity==0){
        OS_FREE(vector->items);
        vector->size = 0;
    }else if(new_capacity > vector->capacity){
        void** items = OS_ALLOC(ELEMENT_SIZE * new_capacity);
        if(!items){
            return OS_ERR_ENOMEM;
        }
        memcpy(items, vector->items, vector->capacity*ELEMENT_SIZE);
    }else{
        OS_RESIZE(vector->items, new_capacity * ELEMENT_SIZE);
        if(!vector->items){
            return OS_ERR_ENOMEM;
        }
        if(vector->size>=new_capacity){
            vector->size = new_capacity;
        }
    }

    vector->capacity = new_capacity;

    return OS_ERR_OK;
}

os_err_t os_vector_append(os_vector_t * vector, void* item){
    if(vector->size>=vector->capacity){
        return OS_ERR_FULL;
    }
    vector->items[vector->size++] = item;
    return OS_ERR_OK;
}

os_err_t os_vector_resize_append(os_vector_t * vector, void* item){
    os_err_t err;
    if(vector->size>=vector->capacity){
        err = os_vector_resize(vector, (vector->capacity==0)?1:2*vector->capacity);
        if(err!=OS_ERR_OK){
            return err;
        }
    }
    vector->items[vector->size++] = item;
    return OS_ERR_OK;
}

os_size_t os_vector_capacity(os_vector_t * vector){
    return vector->capacity;
}

os_size_t os_vector_size(os_vector_t * vector){
    return vector->size;
}

void* os_vector_get(os_vector_t *vector, os_size_t idx){
    if(idx >= vector->size){
        return 0;
    }
    return vector->items[idx];
}

os_err_t os_vector_read(os_vector_t *vector, os_size_t idx, void** item){
    if(idx >= vector->size){
        return OS_ERR_EINVAL;
    }
    if(item){
        *item = vector->items[idx];
    }
    return OS_ERR_OK;
}

os_err_t os_vector_remove(os_vector_t * vector, os_size_t idx){
    if(idx >= vector->size){
        return OS_ERR_EINVAL;
    }
    os_size_t i;
    for(i=idx; i<(vector->size-1); i++){
        vector->items[i] = vector->items[i+1];
    }
    vector->items[i] = 0;
    return OS_ERR_OK;
}

os_err_t os_vector_resize_remove(os_vector_t * vector, os_size_t idx){
    os_err_t err;

    if(idx >= vector->size){
        return OS_ERR_EINVAL;
    }
    os_size_t i;
    for(i=idx; i<(vector->size-1); i++){
        vector->items[i] = vector->items[i+1];
    }
    vector->items[i] = 0;

    if(vector->size <= vector->capacity/4){
        err = os_vector_resize(vector, vector->capacity/2);
        if(err!=OS_ERR_OK){
            return err;
        }
    }

    return OS_ERR_OK;
}

