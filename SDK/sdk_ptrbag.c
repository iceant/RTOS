#include <sdk_ptrbag.h>
#include <os_memory.h>

////////////////////////////////////////////////////////////////////////////////
////
#define ELEMENT_SIZE sizeof(void*)


////////////////////////////////////////////////////////////////////////////////
////

os_err_t  sdk_ptrbag_init(sdk_ptrbag_t * bag, os_size_t capacity){
    bag->capacity = capacity;
    bag->size = 0;
    if(capacity==0){
        bag->bag = 0;
    }else{
        bag->bag = OS_ALLOC(ELEMENT_SIZE * capacity);
        if(!bag->bag){
            return OS_ERR_ENOMEM;
        }
    }
    return OS_ERR_OK;
}

os_err_t  sdk_ptrbag_put(sdk_ptrbag_t * bag, void* ptr){
    if(bag->size==bag->capacity){
        return OS_ERR_FULL;
    }
    bag->bag[bag->size++] = ptr;
    return OS_ERR_OK;
}

os_err_t  sdk_ptrbag_resize_put(sdk_ptrbag_t * bag, void* ptr){
    int err = 0;
    if(bag->size==bag->capacity){
        err = sdk_ptrbag_resize(bag, (bag->capacity==0)?1:(bag->capacity*2));
        if(err!=OS_ERR_OK){
            return err;
        }
    }
    bag->bag[bag->size++] = ptr;
    return OS_ERR_OK;
}

void* sdk_ptrbag_peek(sdk_ptrbag_t * bag){
    if(bag->size==0){
        return 0;
    }
    return bag->bag[bag->size-1];
}

os_err_t sdk_ptrbag_peek_to(sdk_ptrbag_t * bag, void** ptr){
    if(bag->size==0){
        return OS_ERR_EMPTY;
    }
    if(ptr){
        *ptr = bag->bag[bag->size-1];
    }
    return OS_ERR_OK;
}

void* sdk_ptrbag_pop(sdk_ptrbag_t *bag){
    if(bag->size==0){
        /* EMPTY */
        return 0;
    }
    void* p = bag->bag[bag->size-1];
    bag->size-=1;
    return p;
}

os_err_t sdk_ptrbag_pop_to(sdk_ptrbag_t *bag, void** ptr){
    if(bag->size==0){
        return OS_ERR_EMPTY;
    }
    if(ptr){
        *ptr = bag->bag[bag->size-1];
    }
    bag->size-=1;
    return OS_ERR_OK;
}

void* sdk_ptrbag_resize_pop(sdk_ptrbag_t *bag){
    os_err_t  err;

    if(bag->size==0){
        /* EMPTY */
        return 0;
    }

    void* p = bag->bag[bag->size-1];
    bag->size-=1;
    if(bag->size<=bag->capacity/4){
        err = sdk_ptrbag_resize(bag, bag->capacity/2);
        if(err!=OS_ERR_OK){
            return 0;
        }
    }
    return p;
}

os_err_t sdk_ptrbag_resize_pop_to(sdk_ptrbag_t *bag, void** ptr){
    os_err_t  err;

    if(bag->size==0){
        return OS_ERR_EMPTY;
    }
    if(ptr){
        *ptr = bag->bag[bag->size-1];
    }
    bag->size-=1;
    if(bag->size<=bag->capacity/4){
        err = sdk_ptrbag_resize(bag, bag->capacity/2);
        if(err!=OS_ERR_OK){
            return err;
        }
    }
    return OS_ERR_OK;
}


os_err_t  sdk_ptrbag_set(sdk_ptrbag_t *bag, os_size_t idx, void* ptr){
    if(idx >= bag->size){
        return OS_ERR_EINVAL;
    }
    bag->bag[idx] = ptr;
    return OS_ERR_OK;
}

os_err_t  sdk_ptrbag_get(sdk_ptrbag_t *bag, os_size_t idx, void** ptr)
{
    if(idx>= bag->size){
        return OS_ERR_EINVAL;
    }

    if(ptr){
        *ptr = bag->bag[idx];
    }

    return OS_ERR_OK;
}

os_err_t  sdk_ptrbag_resize_remove(sdk_ptrbag_t *bag, os_size_t idx)
{
    os_size_t i;
    os_err_t err;

    if(idx>= bag->size){
        return OS_ERR_EINVAL;
    }

    for(i=idx; i<(bag->size-1); i++){
        bag->bag[i] = bag->bag[i+1];
    }
    bag->bag[i] = 0;
    bag->size -=1;

    if(bag->size<=bag->capacity/4){
        err = sdk_ptrbag_resize(bag, bag->capacity/2);
        if(err!=OS_ERR_OK){
            return err;
        }
    }

    return OS_ERR_OK;
}

os_err_t  sdk_ptrbag_resize(sdk_ptrbag_t * bag, os_size_t capacity){
    if(capacity==0){
        OS_FREE(bag->bag);
        bag->size = 0;
    }else if(bag->capacity==0){
        bag->bag = OS_ALLOC(ELEMENT_SIZE * capacity);
        if(!bag->bag){
            return OS_ERR_ENOMEM;
        }
    }else{
        OS_RESIZE(bag->bag, (ELEMENT_SIZE * capacity) );
        if(!bag->bag){
            return OS_ERR_ENOMEM;
        }
        if(capacity<=bag->size){
            bag->size = capacity;
        }
    }
    bag->capacity = capacity;
    return OS_ERR_OK;
}


