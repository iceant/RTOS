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

os_err_t os_scheduler_append_ready(os_thread_t* thread);

#endif /*INCLUDED_OS_SCHEDULER_H*/
