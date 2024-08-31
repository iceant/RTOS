#ifndef INCLUDED_OS_KERNEL_LOCK_H
#define INCLUDED_OS_KERNEL_LOCK_H

#ifndef INCLUDED_CPU_H
#include <cpu.h>
#endif /*INCLUDED_CPU_H*/

/* -------------------------------------------------------------------------------------------------------------- */
/*  */

#define OS_KERNEL_LOCK_VAR() cpu_uint_t os_kernel__lock_var__;
#define OS_KERNEL_LOCK()     os_kernel__lock_var__ = cpu_local_irq_save()
#define OS_KERNEL_UNLOCK()   cpu_local_irq_restore(os_kernel__lock_var__)

#endif /* INCLUDED_OS_KERNEL_LOCK_H */
