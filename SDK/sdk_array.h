#ifndef INCLUDED_SDK_ARRAY_H
#define INCLUDED_SDK_ARRAY_H

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
typedef struct sdk_array_s{
    void** array;
    os_size_t capacity;
    os_size_t item_size;
    os_size_t size;
}sdk_array_t;

////////////////////////////////////////////////////////////////////////////////
////

os_err_t sdk_array_init(sdk_array_t * array, os_size_t item_size, os_size_t capacity);

void sdk_array_destroy(sdk_array_t *array);

os_err_t sdk_array_push(sdk_array_t * array, void* object);

os_err_t sdk_array_get(sdk_array_t * array, os_size_t idx /* 0<=idx<size */, void** object);

os_err_t sdk_array_resize(sdk_array_t * array, os_size_t new_capacity);

os_size_t sdk_array_size(sdk_array_t * array);

os_size_t sdk_array_capacity(sdk_array_t * array);

#endif /*INCLUDED_SDK_ARRAY_H*/
