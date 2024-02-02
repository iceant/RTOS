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


////////////////////////////////////////////////////////////////////////////////
////
typedef struct os_mutex_s{
    int value;
    char name[OS_NAME_MAX_SIZE];
    int flag; /*OS_QUEUE_FIFO | OS_QUEUE_PRIO*/
    os_list_t list;
}os_mutex_t;


////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_mutex_init(os_mutex_t * mutex, const char* name, int flag);

os_err_t os_mutex_take(os_mutex_t * mutex, os_tick_t ticks);

os_err_t os_mutex_release(os_mutex_t * mutex);



#endif /*INCLUDED_OS_MUTEX_H*/
