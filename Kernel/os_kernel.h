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


////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_kernel_init(void);

os_err_t os_kernel_startup(void);

os_err_t os_kernel_schedule(void);

os_err_t os_kernel_systick(void);



#endif /* INCLUDED_OS_KERNEL_H */
