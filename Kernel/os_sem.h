#ifndef INCLUDED_OS_SEM_H
#define INCLUDED_OS_SEM_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /* INCLUDED_OS_TYPES_H */

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /* INCLUDED_OS_ERRORS_H */

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /* INCLUDED_OS_LIST_H */

#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /* INCLUDED_OS_TICK_H */
////////////////////////////////////////////////////////////////////////////////
////

typedef struct os_sem_s{
    int value;
    char name[OS_NAME_MAX_SIZE];
    int flag;
    os_list_t list;
}os_sem_t;

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_sem_init(os_sem_t* sem, const char* name, int value, int flag);

os_err_t os_sem_take(os_sem_t* sem, os_tick_t ticks);

os_err_t os_sem_release(os_sem_t* sem);


#endif /* INCLUDED_OS_SEM_H */
