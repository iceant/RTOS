#ifndef INCLUDED_OS_KERNEL_LOCK_H
#define INCLUDED_OS_KERNEL_LOCK_H

#ifndef INCLUDED_CPU_H
#include <cpu.h>
#endif /*INCLUDED_CPU_H*/

#ifndef INCLUDED_OS_DEFINITIONS_H
#include <os_definitions.h>
#endif /*INCLUDED_OS_DEFINITIONS_H*/

#ifndef INCLUDED_CPU_H
#include <cpu.h>
#endif /*INCLUDED_CPU_H*/


/* -------------------------------------------------------------------------------------------------------------- */
/*  */

#ifndef OS_LOCK_BASE_PRIORITY
#define OS_LOCK_BASE_PRIORITY 0x10
#endif

#define OS_KERNEL_LOCK_VAR() cpu_uint_t os_kernel__lock_var__
#define OS_KERNEL_LOCK()     os_kernel__lock_var__ = cpu_local_basepri_disable(OS_LOCK_BASE_PRIORITY)
#define OS_KERNEL_UNLOCK()   cpu_local_basepri_enable(os_kernel__lock_var__)

#endif /* INCLUDED_OS_KERNEL_LOCK_H */
