#ifndef INCLUDED_OS_KERNEL_H
#define INCLUDED_OS_KERNEL_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_OS_COMPILER_H
#include <os_compiler.h>
#endif /*INCLUDED_OS_COMPILER_H*/

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_MACROS_H
#include <os_macros.h>
#endif /*INCLUDED_OS_MACROS_H*/

#ifndef INCLUDED_OS_MEMORY_H
#include <os_memory.h>
#endif /*INCLUDED_OS_MEMORY_H*/

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /*INCLUDED_OS_TICK_H*/

#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/

#ifndef INCLUDED_OS_SCHEDULER_H
#include <os_scheduler.h>
#endif /*INCLUDED_OS_SCHEDULER_H*/

#ifndef INCLUDED_OS_INTERRUPT_H
#include <os_interrupt.h>
#endif /* INCLUDED_OS_INTERRUPT_H */

#ifndef INCLUDED_OS_TIMER_H
#include <os_timer.h>
#endif /* INCLUDED_OS_TIMER_H */

#ifndef INCLUDED_OS_IDLE_H
#include <os_idle.h>
#endif /* INCLUDED_OS_IDLE_H */

#ifndef INCLUDED_OS_SEM_H
#include <os_sem.h>
#endif /* INCLUDED_OS_SEM_H */

#ifndef INCLUDED_OS_MUTEX_H
#include <os_mutex.h>
#endif /* INCLUDED_OS_MUTEX_H */

#ifndef INCLUDED_OS_CONDV_H
#include <os_condv.h>
#endif /*INCLUDED_OS_CONDV_H*/


////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_kernel_init(os_err_t (*os_kernel_init_on_start)(void), os_err_t (*os_kernel_init_on_finished)(void));

os_err_t os_kernel_startup(void);

bool os_kernel_ready(void);

#endif /*INCLUDED_OS_KERNEL_H*/
