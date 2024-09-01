#ifndef INCLUDED_OS_MUTEX_H
#define INCLUDED_OS_MUTEX_H

/* -------------------------------------------------------------------------------------------------------------- */
/* DEPENDENCIES */
#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/

/* -------------------------------------------------------------------------------------------------------------- */
/* TYPES */
typedef struct os_mutex_s{
    os_list_t       pend_list;
    int             flag;
    os_thread_t*    owner;
    int             hold;
    os_priority_t   owner_original_priority;
    char            name[OS_NAME_MAX_SIZE];
}os_mutex_t;

/* -------------------------------------------------------------------------------------------------------------- */
/* FLAGS */
#define OS_MUTEX_FLAG_FIFO 0
#define OS_MUTEX_FLAG_PRIO 1

/* -------------------------------------------------------------------------------------------------------------- */
/* ERRORS */
#define OS_MUTEX_ERR_OK                     OS_ERR_OK
#define OS_MUTEX_ERR_SCHEDULER_DISABLED     1
#define OS_MUTEX_ERR_OWNER                  2

/* -------------------------------------------------------------------------------------------------------------- */
/*  */

os_err_t os_mutex_init(os_mutex_t* mutex, const char* name, int flag);



#endif /* INCLUDED_OS_MUTEX_H */
