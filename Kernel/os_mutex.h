#ifndef INCLUDED_OS_MUTEX_H
#define INCLUDED_OS_MUTEX_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/



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
    if(!mutex) return OS_EINVAL;
    while(1){
        while(mutex->owner!=0);
        os_thread_t* thread = os_thread_self();
        if(thread && thread->state==OS_THREAD_STATE_RUNNING){
            cpu_spinlock_lock(&mutex->lock);
            mutex->owner = thread;
            break;
        }
    }
    return OS_EOK;
}

C__STATIC_FORCEINLINE os_err_t os_mutex_unlock(os_mutex_t * mutex)
{
    if(!mutex) return OS_EINVAL;
    mutex->owner = 0;

    cpu_spinlock_unlock(&mutex->lock);
    return OS_EOK;
}

#endif /*INCLUDED_OS_MUTEX_H*/


