#ifndef INCLUDED_OS_SEMAPHORE_H
#define INCLUDED_OS_SEMAPHORE_H

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



////////////////////////////////////////////////////////////////////////////////
////
typedef struct os_semaphore_s{
    cpu_lock_t lock;
    char name[OS_NAME_SIZE];
    int value;
    int flags;
    os_list_t wait_list;
}os_semaphore_t;

////////////////////////////////////////////////////////////////////////////////
////

#define OS_SEMAPHORE_FLAG_FIFO (1<<0)
#define OS_SEMAPHORE_FLAG_PRIO (1<<1)

////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_semaphore_init(os_semaphore_t* semaphore, const char* name, int value, int flags);

os_err_t os_semaphore_release(os_semaphore_t * semaphore);
os_err_t os_semaphore_take(os_semaphore_t * semaphore, os_tick_t ticks);

#endif /*INCLUDED_OS_SEMAPHORE_H*/
