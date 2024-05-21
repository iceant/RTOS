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

#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /*INCLUDED_OS_TICK_H*/

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/

#ifndef INCLUDED_OS_TIMER_H
#include <os_timer.h>
#endif /*INCLUDED_OS_TIMER_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct os_thread_s os_thread_t;
typedef void (*os_thread_entry_t)(void*);
typedef void (*os_thread_exit_t)(os_thread_t * thread);

struct os_thread_s{
    void* sp;
    char name[OS_NAME_SIZE];
    os_thread_entry_t thread_entry;
    void* parameter;
    void* stack_addr;
    os_size_t stack_size;
    os_list_node_t ready_node;
    os_list_node_t wait_node;
    os_timer_t timer_node;
    os_priority_t init_priority;
    os_priority_t curr_priority;
    os_tick_t init_ticks;
    os_tick_t remain_ticks;
    int state;
    os_err_t error;
    os_thread_exit_t exit_function;
};

////////////////////////////////////////////////////////////////////////////////
////
#define OS_THREAD_STATE_SUSPEND     1
#define OS_THREAD_STATE_READY       2
#define OS_THREAD_STATE_RUNNING     3
#define OS_THREAD_STATE_YIELD       4
#define OS_THREAD_STATE_WAIT        5
#define OS_THREAD_STATE_TIMEWAIT    6
#define OS_THREAD_STATE_TIMEOUT     7
#define OS_THREAD_STATE_EXIT        8

#define OS_THREAD_ERROR_OK          OS_EOK
#define OS_THREAD_ERROR_TIMEOUT     OS_ETIMEOUT

////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_thread_init(os_thread_t* thread, const char* name
                        , os_thread_entry_t entry, void* parameter
                        , void* stack_address, os_size_t stack_size
                        , os_priority_t init_priority
                        , os_tick_t init_ticks);

os_err_t os_thread_startup(os_thread_t * thread);

os_err_t os_thread_suspend(os_thread_t * thread);

os_err_t os_thread_resume(os_thread_t * thread);

os_err_t os_thread_join(os_thread_t * thread);

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_thread_yield(void);

os_thread_t* os_thread_self(void);

os_err_t os_thread_exit(void);

os_err_t os_thread_delay(os_tick_t ticks);

os_err_t os_thread_mdelay(uint32_t milliseconds);



#endif /*INCLUDED_OS_THREAD_H*/
