#include <os_ring.h>
#include <assert.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////
////

void os_ring_init(os_ring_t * ring, void* array, os_size_t array_size, os_size_t object_size)
{
    assert(ring);
    assert(array);
    assert(array_size > object_size);

    os_size_t i;

    ring->array = array;
    ring->capacity = array_size;
    ring->object_size = object_size;
    ring->read_idx = 0;
    ring->write_idx = 0;
}

os_err_t os_ring_put(os_ring_t *ring, void* object)
{
    assert(ring);
    assert(object);

    os_size_t next_write_idx = ring->write_idx + 1;
    if(next_write_idx==ring->capacity){
        next_write_idx=0;
    }
    if(next_write_idx==ring->read_idx){
        return OS_EFULL;
    }

    memcpy(ring->array+ring->write_idx*ring->object_size, object, ring->object_size);

    ring->write_idx = next_write_idx;

    return OS_EOK;
}

os_err_t os_ring_get(os_ring_t * ring, void* object){
    assert(ring);
    assert(object);

    if(ring->read_idx == ring->write_idx){
        return OS_EEMPTY;
    }

    memcpy(object, ring->array+ring->read_idx*ring->object_size, ring->object_size);

    os_size_t next_read_idx = ring->read_idx+1;
    if(next_read_idx==ring->capacity){
        next_read_idx = 0;
    }
    ring->read_idx = next_read_idx;

    return OS_EOK;
}

os_size_t os_ring_used(os_ring_t * ring){
    return (ring->write_idx > ring->read_idx)?(ring->write_idx-ring->read_idx):(ring->write_idx + ring->capacity - ring->read_idx);
}

os_err_t os_ring_read(os_ring_t * ring, os_size_t offset, void* object){
    os_size_t used = (ring->write_idx > ring->read_idx)?(ring->write_idx-ring->read_idx):(ring->write_idx + ring->capacity - ring->read_idx);

    assert(ring);
    assert(object);
    assert(offset>=0);
    assert(offset<used);

    if(ring->read_idx == ring->write_idx){
        return OS_EEMPTY;
    }

    if(offset>used){
        /*越界了*/
        return OS_EINVAL;
    }

    os_size_t read_idx = ring->read_idx + offset;
    if(read_idx > ring->capacity){
        read_idx = read_idx - ring->capacity;
    }

    memcpy(object, ring->array+read_idx*ring->object_size, ring->object_size);

    return OS_EOK;
}

void* os_ring_peek(os_ring_t * ring, os_size_t offset /*0<= offset <used*/){

    os_size_t used = (ring->write_idx > ring->read_idx)?(ring->write_idx-ring->read_idx):(ring->write_idx + ring->capacity - ring->read_idx);

    assert(ring);
    assert(offset<used);

    if(ring->read_idx == ring->write_idx){
        /*EMPTY*/
        return 0;
    }

    if(offset>used){
        /*越界了*/
        return 0;
    }

    os_size_t idx = ring->read_idx + offset;
    if(idx > ring->capacity){
        idx = idx - ring->capacity;
    }

    return (ring->array + idx * ring->object_size);
}

void* os_ring_pop(os_ring_t * ring){
    assert(ring);

    if(ring->read_idx == ring->write_idx){
        /*EMPTY*/
        return 0;
    }

    os_size_t next_read_idx = ring->read_idx + 1;
    if(next_read_idx == ring->capacity){
        next_read_idx = 0;
    }

    void* p = (ring->array + ring->read_idx * ring->object_size);

    ring->read_idx = next_read_idx;

    return p;
}

void os_ring_reset(os_ring_t * ring)
{
    assert(ring);
    ring->read_idx = 0;
    ring->write_idx = 0;
}

void* os_ring_get_write_slot(os_ring_t* ring)
{
    os_size_t next_write_idx = ring->write_idx + 1;
    if(next_write_idx==ring->capacity){
        next_write_idx=0;
    }
    if(next_write_idx==ring->read_idx){
        return 0;
    }

    void* p = ring->array + ring->write_idx * ring->object_size;
    ring->write_idx = next_write_idx;
    return p;
}

