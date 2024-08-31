#ifndef INCLUDED_OS_TIMER_H
#define INCLUDED_OS_TIMER_H

/* -------------------------------------------------------------------------------------------------------------- */
#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/

#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /*INCLUDED_OS_TICK_H*/

/* -------------------------------------------------------------------------------------------------------------- */

#define OS_TIMER_FLAG_ONCE      0
#define OS_TIMER_FLAG_REPEAT    1

/* -------------------------------------------------------------------------------------------------------------- */
typedef struct os_timer_s os_timer_t;

typedef void (*os_timer_timeout_t)(os_timer_t* timer, os_tick_t tick_now);

struct os_timer_s{
    os_list_node_t      timer_node;
    os_tick_t           ticks;                  /* period ticks */
    os_tick_t           expires_tick;           /* timeout on tick */
    os_timer_timeout_t  timeout_function;       /* function called when timeout */
    void* userdata;
    int flag;
};

/* -------------------------------------------------------------------------------------------------------------- */


os_err_t os_timer_init(os_timer_t* timer, os_tick_t ticks, os_timer_timeout_t timeout_function, void* ud, int flag);


#endif /* INCLUDED_OS_TIMER_H */
