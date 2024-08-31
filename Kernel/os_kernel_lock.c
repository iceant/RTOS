#include <os_kernel_lock.h>

#define OS_SCHEDULER_LOCK_VAR() cpu_uint_t os_scheduler__lock_var__;
#define OS_SCHEDULER_LOCK()     os_scheduler__lock_var__ = cpu_local_irq_save()
#define OS_SCHEDULER_UNLOCK()   cpu_local_irq_restore(os_scheduler__lock_var__)

