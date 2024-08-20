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



////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_scheduler_init(void);

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
