#ifndef INCLUDED_OS_TIMER_H
#define INCLUDED_OS_TIMER_H


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

#ifndef INCLUDED_OS_MACROS_H
#include <os_macros.h>
#endif /*INCLUDED_OS_MACROS_H*/

#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /*INCLUDED_OS_TICK_H*/



////////////////////////////////////////////////////////////////////////////////
////
typedef struct os_timer_s os_timer_t;

typedef void (*os_timer_timeout_t)(os_timer_t* timer, void* userdata);

struct os_timer_s{
    os_list_node_t wait_node;
    os_timer_timeout_t timeout;
    void* userdata;
    os_tick_t ticks;
    os_tick_t expire_tick;
    int flags;
};

////////////////////////////////////////////////////////////////////////////////
////
#define OS_TIMER_EOK    OS_EOK
#define OS_TIMER_ERROR  OS_ERROR

#define OS_TIMER_FLAG_ONCE      (1<<0)
#define OS_TIMER_FLAG_REPEAT    (1<<1)

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_timer_init(void);

os_err_t os_timer_add(os_timer_t * timer, os_timer_timeout_t timeout, void * userdata, os_tick_t ticks, int flags);

os_err_t os_timer_remove(os_timer_t * timer);

os_bool_t os_timer_tick(void);

os_err_t os_timer_node_init(os_timer_t * timer);

#endif /*INCLUDED_OS_TIMER_H*/
