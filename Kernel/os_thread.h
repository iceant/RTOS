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
    int state;
    os_err_t error;
    void* userdata;
    void (*exit)(struct os_thread_s*);
    char name[OS_KERNEL_NAME_SIZE];
}os_thread_t;

////////////////////////////////////////////////////////////////////////////////
////

#define OS_THREAD_STATE_SUSPEND             (1)
#define OS_THREAD_STATE_READY               (2)
#define OS_THREAD_STATE_YIELD               (3)
#define OS_THREAD_STATE_PENDING             (4)
#define OS_THREAD_STATE_PEND_TIMEOUT        (5)

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


#endif /*INCLUDED_OS_THREAD_H*/
