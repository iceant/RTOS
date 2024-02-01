#ifndef INCLUDED_OS_TIMER_H
#define INCLUDED_OS_TIMER_H

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


////////////////////////////////////////////////////////////////////////////////
////
typedef os_size_t os_time_t;
typedef void (*os_timer_timeout)(os_time_t time, void* userdata);

typedef struct os_timer_node_s{
    os_list_node_t node;
    os_time_t time;
    os_time_t expires;
    os_timer_timeout timeout;
    void* userdata;
    int flag;
}os_timer_node_t;

////////////////////////////////////////////////////////////////////////////////
////

#define OS_TIMER_TYPE_ONCE      (1<<0)
#define OS_TIMER_TYPE_REPEAT    (1<<1)
////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_timer_init(void);

os_err_t os_timer_remove(os_timer_node_t* node);

os_err_t os_timer_add(os_timer_node_t* node, os_timer_timeout timeout, void* userdata, os_time_t time, int timer_flag);

/* Insert a configured node */
os_err_t os_timer_insert(os_timer_node_t* node);

bool os_timer_tick(void);

#endif /* INCLUDED_OS_TIMER_H */
