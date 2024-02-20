#ifndef INCLUDED_OS_CONDV_H
#define INCLUDED_OS_CONDV_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_MUTEX_H
#include <os_mutex.h>
#endif /*INCLUDED_OS_MUTEX_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef struct os_condv_s{
    os_mutex_t * mutex;
    os_list_t list;
    uint32_t timeout_ms;
}os_condv_t;

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_condv_init(os_condv_t * condv);

os_err_t os_condv_wait(os_condv_t * condv, os_mutex_t* mutex);

os_err_t os_condv_timed_wait(os_condv_t * condv, os_mutex_t* mutex, os_tick_t ticks);

os_err_t os_condv_signal(os_condv_t * condv);

os_err_t os_condv_broadcast(os_condv_t * condv);

#endif /*INCLUDED_OS_CONDV_H*/
