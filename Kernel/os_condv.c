#include <os_condv.h>
#include <os_scheduler.h>
#include <os_macros.h>
#include <assert.h>

////////////////////////////////////////////////////////////////////////////////
////
__STATIC_FORCEINLINE void os_condv__insert(os_condv_t* condv, os_thread_t* thread)
{
    OS_LIST_INSERT_BEFORE(&condv->list, &thread->wait_node);
}


__STATIC_FORCEINLINE void os_condv__notify_all(os_condv_t * mutex){
    os_list_node_t * node;
    os_thread_t * thread_p;

    if(OS_LIST_IS_EMPTY(&mutex->list)) return;

    for(node = OS_LIST_NEXT(&mutex->list); node!=&mutex->list;){
        thread_p = OS_CONTAINER_OF(node, os_thread_t, wait_node);
        node = OS_LIST_NEXT(node);
        OS_LIST_REMOVE(&thread_p->wait_node); /*从等待队列中移除*/
        os_timer_remove(&thread_p->timer_node); /* 如果挂在 TIMER 上，也移除 */
        os_scheduler_push_back(thread_p); /*  thread state is ready! */
    }
}

__STATIC_FORCEINLINE void os_condv__notify_one(os_condv_t * mutex){
    os_list_node_t * node;
    os_thread_t * thread_p;

    if(OS_LIST_IS_EMPTY(&mutex->list)) return;

    node = OS_LIST_NEXT(&mutex->list);
    thread_p = OS_CONTAINER_OF(node, os_thread_t, wait_node);
    OS_LIST_REMOVE(&thread_p->wait_node); /*从等待队列中移除*/
    os_timer_remove(&thread_p->timer_node); /* 如果挂在 TIMER 上，也移除 */
    os_scheduler_push_back(thread_p); /*  thread state is ready! */
}
////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_condv_init(os_condv_t * condv)
{
    condv->mutex = 0;
    OS_LIST_INIT(&condv->list);
    return OS_EOK;
}

os_err_t os_condv_wait(os_condv_t * condv, os_mutex_t* mutex)
{
    return os_condv_timed_wait(condv, mutex, OS_WAIT_INFINITY);
}

os_err_t os_condv_timed_wait(os_condv_t * condv, os_mutex_t* mutex, os_tick_t ticks)
{
    os_err_t err;
    register os_uintptr_t level;
    os_thread_t * current_thread;

    while(1){
        err = os_mutex_try_lock(mutex);
        if(err==OS_EOK){
            condv->mutex = mutex;

            level = cpu_interrupt_disable();
            {
                current_thread = os_thread_self();
                current_thread->error = OS_THREAD_EOK;

                assert(current_thread->state & OS_THREAD_STATE_RUNNING);
                assert(OS_LIST_IS_EMPTY(&current_thread->wait_node));

                if(ticks==0){
                    cpu_interrupt_enable(level);
                    os_mutex_unlock(mutex);
                    return OS_ETIMEOUT;
                }else if(ticks == OS_WAIT_INFINITY){
                    os_condv__insert(condv, current_thread); /* 挂在 condv 上 */

                    current_thread->state = OS_THREAD_STATE_WAIT;

                    cpu_interrupt_enable(level);
                    os_mutex_unlock(mutex);

                    return os_scheduler_schedule();
                }else{
                    os_condv__insert(condv, current_thread); /* 挂在 condv 上 */

                    cpu_interrupt_enable(level);
                    os_mutex_unlock(mutex);

                    /* 有等待时间，挂在 timer 上, 这里会调度 */
                    os_scheduler_timed_wait(current_thread, ticks);

                    /* 线程唤醒以后，检查是否超时 */
                    if(current_thread->error == OS_THREAD_ETIMEOUT){
                        return OS_ETIMEOUT;
                    }
                    return OS_EOK;
                }
            }
        }
    }

}

os_err_t os_condv_signal(os_condv_t * condv)
{
    while(1){
        if(os_mutex_try_lock(condv->mutex)==OS_EOK){
            register cpu_uintptr_t level;
            level = cpu_interrupt_disable();
            {
                os_condv__notify_one(condv);
            }
            cpu_interrupt_enable(level);

            os_mutex_unlock(condv->mutex);
            return OS_EOK;
        }
    }
}

os_err_t os_condv_broadcast(os_condv_t * condv)
{
    while(1){
        if(os_mutex_try_lock(condv->mutex)==OS_EOK){
            register cpu_uintptr_t level;
            level = cpu_interrupt_disable();
            {
                os_condv__notify_all(condv);
            }
            cpu_interrupt_enable(level);

            os_mutex_unlock(condv->mutex);
            return OS_EOK;
        }
    }
}
