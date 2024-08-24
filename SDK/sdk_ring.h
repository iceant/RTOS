#ifndef INCLUDED_SDK_RING_H
#define INCLUDED_SDK_RING_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef struct sdk_ring_s{
    uint8_t *   array;          /* Memory to hold array of objects, array size = capacity * object_size */
    os_size_t   capacity;       /* How many objects */
    os_size_t   object_size;    /* Object Size */
    os_size_t   read_idx;
    os_size_t   write_idx;
}sdk_ring_t;

////////////////////////////////////////////////////////////////////////////////
////
void sdk_ring_init(sdk_ring_t * ring, void* array, os_size_t element_count, os_size_t element_size);

os_err_t sdk_ring_put(sdk_ring_t *ring, void* object);

os_err_t sdk_ring_get(sdk_ring_t * ring, void* object);

os_size_t sdk_ring_used(sdk_ring_t * ring);

os_err_t sdk_ring_read(sdk_ring_t * ring, os_size_t offset, void* object);

void sdk_ring_reset(sdk_ring_t * ring);

////////////////////////////////////////////////////////////////////////////////
//// Only used in one thread context

void* sdk_ring_peek(sdk_ring_t * ring, os_size_t offset /*0<= offset <used*/);

void* sdk_ring_pop(sdk_ring_t * ring);

////////////////////////////////////////////////////////////////////////////////
////
void* sdk_ring_get_write_slot(sdk_ring_t* ring);



#endif /*INCLUDED_SDK_RING_H*/
