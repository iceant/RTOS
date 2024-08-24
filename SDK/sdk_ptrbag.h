#ifndef INCLUDED_SDK_PTRBAG_H
#define INCLUDED_SDK_PTRBAG_H

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
typedef struct sdk_ptrbag_s{
    void** bag;
    os_size_t capacity;
    os_size_t size;
}sdk_ptrbag_t;

////////////////////////////////////////////////////////////////////////////////
////
os_err_t sdk_ptrbag_init(sdk_ptrbag_t * bag, os_size_t capacity);

os_err_t  sdk_ptrbag_put(sdk_ptrbag_t * bag, void* ptr);

os_err_t  sdk_ptrbag_resize_put(sdk_ptrbag_t * bag, void* ptr);

void* sdk_ptrbag_pop(sdk_ptrbag_t *bag);

void* sdk_ptrbag_resize_pop(sdk_ptrbag_t *bag);

void* sdk_ptrbag_peek(sdk_ptrbag_t * bag);

os_err_t sdk_ptrbag_peek_to(sdk_ptrbag_t * bag, void** ptr);

os_err_t sdk_ptrbag_pop_to(sdk_ptrbag_t * bag, void** ptr);

os_err_t sdk_ptrbag_resize_pop_to(sdk_ptrbag_t *bag, void** ptr);

os_err_t  sdk_ptrbag_set(sdk_ptrbag_t *bag, os_size_t idx, void* ptr);

os_err_t  sdk_ptrbag_get(sdk_ptrbag_t *bag, os_size_t idx, void** ptr);

os_err_t  sdk_ptrbag_resize_remove(sdk_ptrbag_t *bag, os_size_t idx);

os_err_t  sdk_ptrbag_resize(sdk_ptrbag_t * bag, os_size_t capacity);

#endif /*INCLUDED_SDK_PTRBAG_H*/
