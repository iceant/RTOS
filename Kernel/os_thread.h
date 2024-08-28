#ifndef INCLUDED_OS_THREAD_H
#define INCLUDED_OS_THREAD_H

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

#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /*INCLUDED_OS_TICK_H*/

#ifndef INCLUDED_OS_TIMER_H
#include <os_timer.h>
#endif /*INCLUDED_OS_TIMER_H*/



////////////////////////////////////////////////////////////////////////////////
////

typedef void (*os_thread_entry_t)(void*);

typedef struct os_thread_s{
    void* sp;
    void* thread_entry;
    void* parameter;
    void* stack_address;
    os_size_t stack_size;
    os_priority_t init_priority;
    os_priority_t current_priority;
    os_tick_t init_ticks;
    os_tick_t remain_ticks;
    os_list_node_t ready_node;
    os_list_node_t pend_node;
    os_timer_t     timer_node;
    int state;
    os_err_t error;
    int flag;
    void* userdata;
    void (*exit)(struct os_thread_s*);
    char name[OS_KERNEL_NAME_SIZE];
}os_thread_t;

////////////////////////////////////////////////////////////////////////////////
////

#define OS_THREAD_STATE_SUSPEND             (1)
#define OS_THREAD_STATE_READY               (2)
#define OS_THREAD_STATE_RUNNING             (3)
#define OS_THREAD_STATE_YIELD               (4)
#define OS_THREAD_STATE_PENDING             (5)
#define OS_THREAD_STATE_PEND_TIMEOUT        (6)
#define OS_THREAD_STATE_TIMEWAIT            (7)
#define OS_THREAD_STATE_TIMEWAIT_TIMEOUT    (8)
#define OS_THREAD_STATE_DETACHED            (9)

#define OS_THREAD_ERROR_OK                  (0)
#define OS_THREAD_ERROR_TIMEOUT             (-1)

#define OS_THREAD_FLAG_NONE                 (0)
#define OS_THREAD_FLAG_SCHEDULE             (1)

////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_thread_init(os_thread_t * thread, const char* name
                        , os_thread_entry_t entry, void* parameter
                        , void* stack_address, os_size_t stack_size
                        , os_priority_t init_priority
                        , os_tick_t init_ticks, void* userdata);


os_err_t os_thread_startup(os_thread_t * thread);

os_err_t os_thread_yield(void);

os_thread_t * os_thread_self(void);

os_err_t os_thread_resume(os_thread_t * thread);

void os_thread_delay(os_tick_t ticks);

void os_thread_mdelay(os_int_t ms);

#endif /*INCLUDED_OS_THREAD_H*/
