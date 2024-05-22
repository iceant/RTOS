#include <sdk_array.h>
#include <os_memory.h>

////////////////////////////////////////////////////////////////////////////////
////

os_err_t sdk_array_init(sdk_array_t * array, os_size_t item_size, os_size_t capacity){
    array->item_size = item_size;
    array->capacity = capacity;
    array->size = 0;
    if(capacity==0){
        array->array = 0;
    }else{
        array->array = OS_ALLOC(item_size * capacity);
        if(!array->array){
            return OS_ENOMEM;
        }
    }
    return OS_EOK;
}

void sdk_array_destroy(sdk_array_t *array){
    if(array->array){
        OS_FREE(array->array);
    }
}

os_err_t sdk_array_push(sdk_array_t * array, void* object){
    os_err_t  err = OS_EOK;
    if(array->size == array->capacity){
        /* no more space, expend */
        err = sdk_array_resize(array, array->capacity * 2);
        if(err!=OS_EOK){
            return err;
        }
    }
    memcpy(array + array->size * array->item_size, object, array->item_size);
    array->size++;
    return OS_EOK;
}

os_err_t sdk_array_get(sdk_array_t * array, os_size_t idx /* 0<=idx<size */, void** object){
    if(array->size==0){
        return OS_EEMPTY;
    }

    if(idx>=array->size){
        return OS_EINVAL;
    }

    if(object){
        *object = array->array + idx * array->item_size;
    }

    return OS_EOK;
}


os_err_t sdk_array_resize(sdk_array_t * array, os_size_t new_capacity){
    if(new_capacity==0){
        OS_FREE(array->array);
        array->size = 0;
    }else if(array->capacity==0){
        array->array = OS_ALLOC(new_capacity * array->item_size);
        if(!array->array){
            return OS_ENOMEM;
        }
    }else{
        void** new_array = OS_REALLOC(array->array, new_capacity * array->item_size);
        if(!new_array){
            return OS_ENOMEM;
        }
        array->array = new_array;
    }

    array->capacity = new_capacity;
    return OS_EOK;
}

os_size_t sdk_array_size(sdk_array_t * array){
    return array->size;
}

os_size_t sdk_array_capacity(sdk_array_t * array){
    return array->capacity;
}

