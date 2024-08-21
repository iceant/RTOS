#ifndef INCLUDED_OS_SEM_H
#define INCLUDED_OS_SEM_H

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

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/



////////////////////////////////////////////////////////////////////////////////
////

typedef struct os_sem_s{
    volatile os_uint_t value;
    os_list_t pend_list;
    uint8_t   flag;
    os_thread_t * owner;
    char name[OS_KERNEL_NAME_SIZE];
}os_sem_t;

////////////////////////////////////////////////////////////////////////////////
////

#define OS_SEM_FLAG_FIFO (1)
#define OS_SEM_FLAG_PRIO (2)

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_sem_init(os_sem_t* sem, const char* name, os_uint_t value, uint8_t flag);

os_err_t os_sem_take(os_sem_t* sem, os_tick_t ticks);

os_err_t os_sem_release(os_sem_t* sem);

#endif /* INCLUDED_OS_SEM_H */