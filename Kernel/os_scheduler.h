#ifndef INCLUDED_OS_SCHEDULER_H
#define INCLUDED_OS_SCHEDULER_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/

////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_scheduler_init(void);

os_err_t os_scheduler_schedule(void);

os_err_t os_scheduler_in_interrupt(void);

os_err_t os_scheduler_push_back(os_thread_t* thread);

os_err_t os_scheduler_push_front(os_thread_t* thread);

os_err_t os_scheduler_remove(os_thread_t* thread);

os_thread_t * os_scheduler_current_thread(void);

os_err_t os_scheduler_timed_wait(os_thread_t* thread, os_tick_t tick);

#endif /*INCLUDED_OS_SCHEDULER_H*/
