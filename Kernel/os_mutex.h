#ifndef INCLUDED_OS_MUTEX_H
#define INCLUDED_OS_MUTEX_H

////////////////////////////////////////////////////////////////////////////////
////
#include <assert.h>
#include "os_printf.h"

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/

#ifndef INCLUDED_OS_SCHEDULER_H
#include <os_scheduler.h>
#endif /*INCLUDED_OS_SCHEDULER_H*/



////////////////////////////////////////////////////////////////////////////////
////
typedef struct os_mutex_s{
    cpu_spinlock_t lock;
    os_thread_t* owner;
}os_mutex_t;

#define OS_MUTEX_INIT(M) {.lock=0, .owner=0}
////////////////////////////////////////////////////////////////////////////////
////

C__STATIC_FORCEINLINE os_err_t os_mutex_init(os_mutex_t * mutex){
    if(!mutex) return OS_EINVAL;
    cpu_spinlock_init(&mutex->lock);
    mutex->owner = 0;
    return OS_EOK;
}

C__STATIC_FORCEINLINE os_err_t os_mutex_lock(os_mutex_t * mutex){
    os_thread_t* current_thread = os_thread_self();
    while(1){
        if(current_thread && mutex->owner==current_thread) break;
        while(mutex->owner!=0);
        cpu_spinlock_lock(&mutex->lock);
        mutex->owner = os_thread_self();
        assert(mutex->owner!=0);
        break;
//        os_thread_t* thread = os_thread_self();
//        if(thread && thread->state==OS_THREAD_STATE_RUNNING){
//            cpu_spinlock_lock(&mutex->lock);
//            mutex->owner = thread;
//            break;
//        }
    }
    return OS_EOK;
}

C__STATIC_FORCEINLINE os_err_t os_mutex_unlock(os_mutex_t * mutex)
{
    while(mutex->owner!=os_thread_self());
    mutex->owner = 0;
    cpu_spinlock_unlock(&mutex->lock);
    os_err_t err = os_scheduler_schedule(OS_SCHEDULER_POLICY_YIELD_NOACTION);
    if(err!=OS_EOK && err!=OS_SCHEDULER_EINWORK){
        printf("[os_mutex_unlock] err=%x\n", err);
    }
    return err;
//    return OS_EOK;
}

#endif /*INCLUDED_OS_MUTEX_H*/


