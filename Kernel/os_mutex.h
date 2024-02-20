#ifndef INCLUDED_OS_MUTEX_H
#define INCLUDED_OS_MUTEX_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/

#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /*INCLUDED_OS_TICK_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /* INCLUDED_OS_THREAD_H */
////////////////////////////////////////////////////////////////////////////////
////
typedef struct os_mutex_s{
    os_uintptr_t value;
    char name[OS_NAME_MAX_SIZE];
    os_thread_t * owner;
    os_priority_t original_priority;
    os_list_t list;
    int flag;
}os_mutex_t;

////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_mutex_init(os_mutex_t * mutex, const char* name, int flag);

os_err_t os_mutex_lock(os_mutex_t* mutex);

os_err_t os_mutex_unlock(os_mutex_t * mutex);

os_err_t os_mutex_try_lock(os_mutex_t* mutex);

#endif /*INCLUDED_OS_MUTEX_H*/
