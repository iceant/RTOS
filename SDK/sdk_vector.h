#ifndef INCLUDED_SDK_VECTOR_H
#define INCLUDED_SDK_VECTOR_H

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef struct os_vector_s{
    void**      items;
    os_size_t   capacity;
    os_size_t   size;
}os_vector_t;

////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_vector_init(os_vector_t * vector, os_size_t capacity);

void os_vector_destroy(os_vector_t * vector);

os_err_t os_vector_resize(os_vector_t * vector, os_size_t new_capacity);

os_err_t os_vector_append(os_vector_t * vector, void* item);

os_err_t os_vector_resize_append(os_vector_t * vector, void* item);

os_size_t os_vector_capacity(os_vector_t * vector);

os_size_t os_vector_size(os_vector_t * vector);

void* os_vector_get(os_vector_t *vector, os_size_t idx);

os_err_t os_vector_read(os_vector_t *vector, os_size_t idx, void** item);

os_err_t os_vector_remove(os_vector_t * vector, os_size_t idx);

os_err_t os_vector_resize_remove(os_vector_t * vector, os_size_t idx);

#endif /*INCLUDED_SDK_VECTOR_H*/
