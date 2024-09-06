#ifndef INCLUDED_OS_THREAD_H
#define INCLUDED_OS_THREAD_H

/* -------------------------------------------------------------------------------------------------------------- */


#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /*INCLUDED_OS_TICK_H*/

#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/

#ifndef INCLUDED_OS_TIMER_H
#include <os_timer.h>
#endif /*INCLUDED_OS_TIMER_H*/

#ifndef INCLUDED_OS_CRITICAL_H
#include <os_critical.h>
#endif /*INCLUDED_OS_CRITICAL_H*/



/* -------------------------------------------------------------------------------------------------------------- */
typedef struct os_thread_s os_thread_t;
typedef void (*os_thread_entry_t)(void* parameter);
typedef void (*os_thread_exit_t)(os_thread_t* thread);

/* -------------------------------------------------------------------------------------------------------------- */
#define OS_THREAD_STATE_SUSPEND             (1)
#define OS_THREAD_STATE_READY               (2)
#define OS_THREAD_STATE_RUNNING             (3)
#define OS_THREAD_STATE_PENDING             (4)
#define OS_THREAD_STATE_PEND_TIMEOUT        (5)
#define OS_THREAD_STATE_DELAY               (6)
#define OS_THREAD_STATE_DELAY_TIMEOUT       (7)
#define OS_THREAD_STATE_YIELD               (8)

#define OS_THREAD_FLAG_CREATE_BIT           (0)
#define OS_THREAD_FLAG_CREATE_NEW           (1 << OS_THREAD_FLAG_CREATE_BIT)
#define OS_THREAD_FLAG_CREATE_INIT          (0 << OS_THREAD_FLAG_CREATE_BIT)

#define OS_THREAD_FLAG_SCHEDULE_BIT         (1)
#define OS_THREAD_FLAG_SCHEDULE_YES         (1 << OS_THREAD_FLAG_SCHEDULE_BIT)
#define OS_THREAD_FLAG_SCHEDULE_NO          (0 << OS_THREAD_FLAG_SCHEDULE_BIT)

#define OS_THREAD_ERR_OK                    (0)
#define OS_THREAD_ERR_INVALID_STATE         (1<<1)
#define OS_THREAD_ERR_TIMEOUT_POS           (2)
#define OS_THREAD_ERR_TIMEOUT               (1<<OS_THREAD_ERR_TIMEOUT_POS)
/* -------------------------------------------------------------------------------------------------------------- */

struct os_thread_s{
    void*               sp; /* saved stack pointer */
    os_thread_entry_t   start_entry;
    void*               parameter;
    os_list_node_t      ready_node;
    os_list_node_t      pend_node;
    os_timer_t          timer_node;
    uint8_t *           stack_address;
    os_size_t           stack_size;
    os_tick_t           init_ticks;
    os_tick_t           remain_ticks;
    os_priority_t       init_priority;
    os_priority_t       current_priority;
    os_thread_exit_t    exit_function;
    int                 state;
    int                 flag;
    int                 error;
    void*               userdata;
    char                name[OS_NAME_MAX_SIZE];
};

/* -------------------------------------------------------------------------------------------------------------- */

#define OS_THREAD_LIMIT(STACK_BASE, STACK_SIZE) (((STACK_BASE) + (STACK_SIZE)) - OS_THREAD_STACK_MINIMAL_BYTES)


/* -------------------------------------------------------------------------------------------------------------- */
/* UTILS */
#define OS_THREAD_INIT(T, N, Fn, P, Stk, StkSize, Prio, Tick) \
    os_thread_init((T), (N), (Fn), (P), (Stk), (StkSize), OS_THREAD_LIMIT((Stk), (StkSize)) \
        , (Tick), (Prio), (0), (0))

/* -------------------------------------------------------------------------------------------------------------- */


os_err_t os_thread_init(os_thread_t* thread
                        , const char* name
                        , os_thread_entry_t start_entry
                        , void* parameter
                        , uint8_t* stack_address
                        , os_size_t stack_size
                        , uint8_t* stack_limit
                        , os_tick_t init_ticks
                        , os_priority_t init_priority
                        , os_thread_exit_t exit_function
                        , void* userdata
                        );

os_thread_t * os_thread_create(const char* name
        , os_thread_entry_t start_entry
        , void* parameter
        , uint8_t* stack_address
        , os_size_t stack_size
        , uint8_t * stack_limit
        , os_tick_t init_ticks
        , os_priority_t init_priority
        , os_thread_exit_t exit_function
        , void* userdata);

os_err_t os_thread_startup(os_thread_t* thread);

os_err_t os_thread_suspend(os_thread_t* thread);

os_err_t os_thread_resume(os_thread_t* thread);

os_err_t os_thread_yield();

os_err_t os_thread_delay(os_tick_t ticks);

os_err_t os_thread_mdelay(os_size_t milliseconds);

os_err_t os_thread_join(os_thread_t* thread);

os_err_t os_thread_detach(os_thread_t* thread);

os_thread_t * os_thread_self(void);

#endif /* INCLUDED_OS_THREAD_H */
