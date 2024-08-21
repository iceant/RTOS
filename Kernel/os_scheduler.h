#ifndef INCLUDED_OS_SCHEDULER_H
#define INCLUDED_OS_SCHEDULER_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_READYLIST_H
#include <os_readylist.h>
#endif /*INCLUDED_OS_READYLIST_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/

////////////////////////////////////////////////////////////////////////////////
////

extern volatile os_thread_t * os_scheduler__current_thread;
extern volatile os_size_t os_scheduler__lock_nest;
extern volatile os_size_t os_scheduler__interrupt_nest;
extern volatile os_bool_t os_scheduler__need_schedule_flag;

////////////////////////////////////////////////////////////////////////////////
////
#define OS_SCHEDULER_ERR_IN_IRQ                     0x1001
#define OS_SCHEDULER_ERR_LOCKED                     0x1002
#define OS_SCHEDULER_ERR_NOT_START                  0x1003
#define OS_SCHEDULER_ERR_CURR_THREAD_RUNNING        0x1004
#define OS_SCHEDULER_ERR_NO_NEED_SCHEDULE           0x1005



////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_scheduler_init(void);

os_err_t os_scheduler_startup(void);

os_err_t os_scheduler_schedule(void);

os_err_t os_scheduler_systick(void);

os_err_t os_scheduler_schedule_in_thread(void);

void os_scheduler_timed_wait(os_thread_t * thread, os_tick_t tick);

os_err_t os_scheduler_readylist_push_back(os_thread_t * thread);

os_err_t os_scheduler_readylist_push_front(os_thread_t * thread);

os_err_t os_scheduler_yield(os_thread_t * thread);

os_err_t os_scheduler_suspend(os_thread_t * thread);

os_err_t os_scheduler_resume(os_thread_t * thread);

os_err_t os_scheduler_detach(os_thread_t * thread);

C_STATIC_FORCEINLINE volatile os_thread_t* os_scheduler_current_thread(void)
{
    return os_scheduler__current_thread;
}

#endif /*INCLUDED_OS_SCHEDULER_H*/
