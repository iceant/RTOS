#ifndef INCLUDED_OS_MUTEX_H
#define INCLUDED_OS_MUTEX_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/

#ifndef INCLUDED_OS_SCHEDULER_H
#include <os_scheduler.h>
#endif /*INCLUDED_OS_SCHEDULER_H*/

#ifndef INCLUDED_CPU_SPINLOCK_H
#include <cpu_spinlock.h>
#endif /*INCLUDED_CPU_SPINLOCK_H*/

#ifndef INCLUDED_OS_CRITICAL_H
#include <os_critical.h>
#endif /*INCLUDED_OS_CRITICAL_H*/


////////////////////////////////////////////////////////////////////////////////
////

#define OS_MUTEX_FLAG_FIFO 1
#define OS_MUTEX_FLAG_PRIO 2

#define OS_MUTEX_ERR_OWNER (0x3001)

////////////////////////////////////////////////////////////////////////////////
////

#define OS_MUTEX_LOCK_POLICY_DISABLE_IRQ          1
#define OS_MUTEX_LOCK_POLICY_DISABLE_SCHEDULE     2
#define OS_MUTEX_LOCK_POLICY_USE_CRITICAL         3
#define OS_MUTEX_LOCK_POLICY_USE_SPINLOCK         4

#ifndef OS_MUTEX_LOCK_POLICY
#define OS_MUTEX_LOCK_POLICY OS_MUTEX_LOCK_POLICY_USE_SPINLOCK
#endif

#if (OS_MUTEX_LOCK_POLICY==OS_MUTEX_LOCK_POLICY_DISABLE_IRQ)
#define OS_MUTEX_LOCK_VAR()   cpu_interrupt_context_t os_sem__lock_var__;
#define OS_MUTEX_LOCK()       cpu_interrupt_disable(&os_sem__lock_var__);
#define OS_MUTEX_UNLOCK()     cpu_interrupt_enable(&os_sem__lock_var__);
#elif (OS_MUTEX_LOCK_POLICY==OS_MUTEX_LOCK_POLICY_DISABLE_SCHEDULE)
#define OS_MUTEX_LOCK_VAR()   OS_SCHEDULER_LOCK_VARIABLE()
#define OS_MUTEX_LOCK()       OS_SCHEDULER_LOCK()
#define OS_MUTEX_UNLOCK()     OS_SCHEDULER_UNLOCK()
#elif (OS_MUTEX_LOCK_POLICY==OS_MUTEX_LOCK_POLICY_USE_CRITICAL)
#define OS_MUTEX_LOCK_VAR()
#define OS_MUTEX_LOCK()       os_critical_enter()
#define OS_MUTEX_UNLOCK()     os_critical_leave()
#elif (OS_MUTEX_LOCK_POLICY==OS_MUTEX_LOCK_POLICY_USE_SPINLOCK)
#define OS_MUTEX_LOCK_VAR()
#define OS_MUTEX_LOCK()       cpu_spinlock_lock(&mutex->lock)
#define OS_MUTEX_UNLOCK()     cpu_spinlock_unlock(&mutex->lock)
#endif


////////////////////////////////////////////////////////////////////////////////
////

typedef struct os_mutex_s{
    os_int_t        value;
    os_priority_t   original_priority;
    os_int_t        hold;
    os_thread_t *   owner;
    os_list_t       pend_list;
    int             flag;
#if(OS_MUTEX_LOCK_POLICY==OS_MUTEX_LOCK_POLICY_USE_SPINLOCK)
    cpu_spinlock_t  lock;
#endif
    char            name[OS_KERNEL_NAME_SIZE];
}os_mutex_t;

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_mutex_init(os_mutex_t* mutex, const char* name, int flag);

os_err_t os_mutext_lock(os_mutex_t* mutex, os_tick_t ticks);

os_err_t os_mutext_unlock(os_mutex_t* mutex);

#endif /* INCLUDED_OS_MUTEX_H */
