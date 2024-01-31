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

#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /*INCLUDED_OS_TICK_H*/

#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/


////////////////////////////////////////////////////////////////////////////////
////
#define OS_THREAD_STATE_IDLE        0
#define OS_THREAD_STATE_READY       (1<<0)
#define OS_THREAD_STATE_SUSPENDED   (1<<1)
#define OS_THREAD_STATE_RUNNING     (1<<2)
#define OS_THREAD_STATE_WAIT        (1<<3)
#define OS_THREAD_STATE_YIELD       (1<<4)
#define OS_THREAD_STATE_EXIT        (1<<5)

////////////////////////////////////////////////////////////////////////////////
////
typedef struct os_thread_s{
    void* sp;
    os_int_t state;
    char name[NAME_MAX_SIZE];
    void* stack_addr;
    os_size_t stack_size;
    void (*thread_entry)(void*);
    void* parameter;
    os_tick_t init_ticks;
    os_tick_t remain_ticks;
    os_priority_t init_priority;
    os_priority_t curr_priority;
    os_list_node_t ready_node;      /* wait on ready table */
    os_list_node_t wait_node;       /* wait on wait kernel object, like timer, mutex, semaphore etc. */
    void (*thread_exit)(struct os_thread_s*);
}os_thread_t;

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_thread_init(os_thread_t * thread
                        , const char name[NAME_MAX_SIZE]
                        , void (*thread_entry)(void*)
                        , void* parameter
                        , void* stack_addr
                        , os_size_t stack_size
                        , os_priority_t init_priority
                        , os_tick_t init_ticks);

os_err_t os_thread_startup(os_thread_t * thread);

os_thread_t* os_thread_self(void);

os_err_t os_thread_suspend(os_thread_t * thread);

os_err_t os_thread_resume(os_thread_t* thread);

os_err_t os_thread_exit(os_thread_t * thread);

#endif /*INCLUDED_OS_THREAD_H*/


