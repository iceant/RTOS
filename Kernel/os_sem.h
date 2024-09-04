#ifndef INCLUDED_OS_SEM_H
#define INCLUDED_OS_SEM_H

/* -------------------------------------------------------------------------------------------------------------- */
/*  */

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/

#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /*INCLUDED_OS_TICK_H*/

#ifndef INCLUDED_OS_CPULOCK_H
#include <os_cpulock.h>
#endif /*INCLUDED_OS_CPULOCK_H*/


/* -------------------------------------------------------------------------------------------------------------- */

typedef struct os_sem_s{
    os_uint_t   value;
    os_list_t   pend_list;
    int flag;
    char name[OS_NAME_MAX_SIZE];
}os_sem_t;

/* -------------------------------------------------------------------------------------------------------------- */
/* FLAG */

#define OS_SEM_FLAG_FIFO 0
#define OS_SEM_FLAG_PRIO 1

/* -------------------------------------------------------------------------------------------------------------- */
/* ERRORS */
#define OS_SEM_ERR_OK                     OS_ERR_OK
#define OS_SEM_ERR_SCHEDULER_DISABLED     1
#define OS_SEM_ERR_NOTHREAD               2

/* -------------------------------------------------------------------------------------------------------------- */
/*  */

os_err_t os_sem_init(os_sem_t* sem, const char* name, os_uint_t value, int flag);

os_err_t os_sem_take(os_sem_t* sem, os_tick_t ticks);

os_err_t os_sem_release(os_sem_t* sem);

#endif /* INCLUDED_OS_SEM_H */
