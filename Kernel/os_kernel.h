#ifndef INCLUDED_OS_KERNEL_H
#define INCLUDED_OS_KERNEL_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_MEMORY_H
#include <os_memory.h>
#endif /*INCLUDED_OS_MEMORY_H*/


////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/

#ifndef INCLUDED_OS_MACROS_H
#include <os_macros.h>
#endif /*INCLUDED_OS_MACROS_H*/

#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /*INCLUDED_OS_TICK_H*/

#ifndef INCLUDED_OS_TIMER_H
#include <os_timer.h>
#endif /*INCLUDED_OS_TIMER_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/

#ifndef INCLUDED_OS_INTERRUPT_H
#include <os_interrupt.h>
#endif /*INCLUDED_OS_INTERRUPT_H*/

#ifndef INCLUDED_OS_SCHEDULER_H
#include <os_scheduler.h>
#endif /*INCLUDED_OS_SCHEDULER_H*/

#ifndef INCLUDED_OS_SEMAPHORE_H
#include <os_semaphore.h>
#endif /*INCLUDED_OS_SEMAPHORE_H*/

#ifndef INCLUDED_OS_IDLE_H
#include <os_idle.h>
#endif /*INCLUDED_OS_IDLE_H*/

#ifndef INCLUDED_OS_MUTEX_H
#include <os_mutex.h>
#endif /*INCLUDED_OS_MUTEX_H*/

#ifndef INCLUDED_OS_PRINTF_H
#include <os_printf.h>
#endif /*INCLUDED_OS_PRINTF_H*/

#ifndef INCLUDED_OS_CRITICAL_H
#include <os_critical.h>
#endif /*INCLUDED_OS_CRITICAL_H*/

#ifndef INCLUDED_OS_EXCEPTION_H
#include <os_exception.h>
#endif /*INCLUDED_OS_EXCEPTION_H*/



////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_kernel_init(void);

os_err_t os_kernel_startup(void);





#endif /*INCLUDED_OS_KERNEL_H*/
