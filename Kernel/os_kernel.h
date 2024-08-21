#ifndef INCLUDED_OS_KERNEL_H
#define INCLUDED_OS_KERNEL_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_MACROS_H
#include <os_macros.h>
#endif /*INCLUDED_OS_MACROS_H*/

#ifndef INCLUDED_OS_MEMORY_H
#include <os_memory.h>
#endif /*INCLUDED_OS_MEMORY_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_SCHEDULER_H
#include <os_scheduler.h>
#endif /*INCLUDED_OS_SCHEDULER_H*/

#ifndef INCLUDED_OS_CRITICAL_H
#include <os_critical.h>
#endif /*INCLUDED_OS_CRITICAL_H*/

#ifndef INCLUDED_OS_INTERRUPT_H
#include <os_interrupt.h>
#endif /*INCLUDED_OS_INTERRUPT_H*/

#ifndef INCLUDED_OS_IDLE_H
#include <os_idle.h>
#endif /*INCLUDED_OS_IDLE_H*/


////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_kernel_init(void);

os_err_t os_kernel_startup(void);

void os_kernel_destroy(void);

#endif /*INCLUDED_OS_KERNEL_H*/
