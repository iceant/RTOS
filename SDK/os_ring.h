#ifndef INCLUDED_OS_RING_H
#define INCLUDED_OS_RING_H

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
typedef struct os_ring_s{
    uint8_t *   array;
    os_size_t   capacity;
    os_size_t   object_size;
    os_size_t   read_idx;
    os_size_t   write_idx;
}os_ring_t;

////////////////////////////////////////////////////////////////////////////////
////
void os_ring_init(os_ring_t * ring, void* array, os_size_t element_count, os_size_t element_size);

os_err_t os_ring_put(os_ring_t *ring, void* object);

os_err_t os_ring_get(os_ring_t * ring, void* object);

os_size_t os_ring_used(os_ring_t * ring);

os_err_t os_ring_read(os_ring_t * ring, os_size_t offset, void* object);

void os_ring_reset(os_ring_t * ring);
////////////////////////////////////////////////////////////////////////////////
//// Only used in one thread context

void* os_ring_peek(os_ring_t * ring, os_size_t offset /*0<= offset <used*/);

void* os_ring_pop(os_ring_t * ring);

////////////////////////////////////////////////////////////////////////////////
////
void* os_ring_get_write_slot(os_ring_t* ring);



#endif /*INCLUDED_OS_RING_H*/
