#ifndef INCLUDED_OS_KERNEL_H
#define INCLUDED_OS_KERNEL_H


#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_MEMORY_H
#include <os_memory.h>
#endif /*INCLUDED_OS_MEMORY_H*/

#ifndef INCLUDED_OS_TICK_H
#include <os_tick.h>
#endif /*INCLUDED_OS_TICK_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/

#ifndef INCLUDED_OS_INTERRUPT_H
#include <os_interrupt.h>
#endif /*INCLUDED_OS_INTERRUPT_H*/

#ifndef INCLUDED_OS_MACROS_H
#include <os_macros.h>
#endif /*INCLUDED_OS_MACROS_H*/

#ifndef INCLUDED_OS_SEM_H
#include <os_sem.h>
#endif /*INCLUDED_OS_SEM_H*/


////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_kernel_init(void);

os_err_t os_kernel_startup(void);

os_err_t os_kernel_schedule(void);

os_err_t os_kernel_systick(void);

os_err_t os_kernel_resume(os_thread_t * thread);

os_err_t os_kernel_delay(os_thread_t * thread, os_tick_t ticks);

int os_kernel_lock(int priority);

void os_kernel_unlock(int priority);

#endif /* INCLUDED_OS_KERNEL_H */
