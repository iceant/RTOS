#ifndef INCLUDED_OS_MUTEX_H
#define INCLUDED_OS_MUTEX_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/

////////////////////////////////////////////////////////////////////////////////
////

typedef struct os_mutex_s{
    os_int_t        value;
    os_priority_t   original_priority;
    os_int_t        hold;
    os_thread_t *   owner;
    os_list_t       pend_list;
    int             flag;
    char            name[OS_KERNEL_NAME_SIZE];
}os_mutex_t;

////////////////////////////////////////////////////////////////////////////////
////

#define OS_MUTEX_FLAG_FIFO 1
#define OS_MUTEX_FLAG_PRIO 2

#define OS_MUTEX_ERR_OWNER (0x3001)

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_mutex_init(os_mutex_t* mutex, const char* name, int flag);

os_err_t os_mutext_lock(os_mutex_t* mutex, os_tick_t ticks);

os_err_t os_mutext_unlock(os_mutex_t* mutex);

#endif /* INCLUDED_OS_MUTEX_H */
