#include <os_mutex.h>
#include <os_memory.h>
#include <os_macros.h>
#include <cpu_spinlock.h>
#include <os_critical.h>

////////////////////////////////////////////////////////////////////////////////
////

static void os_mutex__append(os_mutex_t * sem, os_thread_t* thread){
    os_list_node_t * current_node;
    OS_LIST_REMOVE(&thread->pend_node);
    OS_LIST_REMOVE(&thread->ready_node);
    if(sem->flag==OS_MUTEX_FLAG_PRIO){
        for(current_node = OS_LIST_NEXT(&sem->pend_list); current_node != &sem->pend_list; ){
            os_thread_t * p = OS_LIST_CONTAINER(current_node, os_thread_t, pend_node);
            int cmp = os_priority_cmp(p->current_priority, thread->current_priority);
            if(cmp==OS_PRIORITY_CMP_EQ){
                OS_LIST_INSERT_AFTER(&p->pend_node, &thread->pend_node);
                return;
            }else if(cmp==OS_PRIORITY_CMP_LOW){
                /* thread 优先级更高*/
                OS_LIST_INSERT_BEFORE(&p->pend_node, &thread->pend_node);
                return;
            }
            current_node = OS_LIST_NEXT(current_node);
        }
        /* 遍历完了也没找到位置，排在队尾 */
        OS_LIST_INSERT_BEFORE(&sem->pend_list, (os_list_node_t*)&thread->pend_node);
    }else{
        OS_LIST_INSERT_BEFORE(&sem->pend_list, (os_list_node_t*)&thread->pend_node);
    }
}

C_STATIC_FORCEINLINE void os_mutex__restore(os_mutex_t* sem){
    os_list_node_t * current_node;
    if(OS_LIST_IS_EMPTY(&sem->pend_list)){
        return;
    }
    current_node = OS_LIST_NEXT(&sem->pend_list);
    OS_LIST_REMOVE(current_node);
    os_thread_t* thread = OS_LIST_CONTAINER(current_node, os_thread_t, pend_node);
    /*从timer中移除*/
    os_timer_remove(&thread->timer_node);
    os_scheduler_readylist_push_back(thread);
    os_scheduler__need_schedule_flag = OS_TRUE;
}

////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_mutex_init(os_mutex_t* mutex, const char* name, int flag)
{
    mutex->value = 0;
    mutex->original_priority = OS_KERNEL_PRIORITY_MAX;
    mutex->hold = 0;
    mutex->owner = 0;
    
    OS_LIST_INIT(&mutex->pend_list);
    
    mutex->flag = flag;
    
    os_size_t name_size = strlen(name);
    name_size = OS_MIN(name_size, OS_KERNEL_NAME_SIZE-2);
    memcpy(mutex->name, name, name_size);
    mutex->name[name_size+1]='\0';
    
    return OS_ERR_OK;
}

os_err_t os_mutext_lock(os_mutex_t* mutex, os_tick_t ticks)
{
    OS_MUTEX_LOCK_VAR();
    os_thread_t * current_thread = os_thread_self();
__os_mutex__check__:
    OS_MUTEX_LOCK();
    if(mutex->owner == 0){
        cpu_spinlock_lock((cpu_spinlock_t*)&mutex->value);
        mutex->owner = current_thread;
        mutex->original_priority = mutex->owner->current_priority;
        mutex->hold++;
        OS_MUTEX_UNLOCK();
        return OS_ERR_OK;
    }else if(current_thread==mutex->owner){
        mutex->hold++;
        OS_MUTEX_UNLOCK();
        return OS_ERR_OK;
    }
    
    /* 当前线程不是 owner, 无法获得锁 */
    
    if(os_priority_cmp(current_thread->current_priority, mutex->owner->current_priority)==OS_PRIORITY_CMP_HIGH){
        mutex->owner->current_priority = current_thread->current_priority; /* 请求的线程比owner线程优先级高, 提升owner优先级 */
    }
    
    if(ticks==0){
        /* 当前线程不等待，直接返回 TIMEOUT */
        OS_MUTEX_UNLOCK();
        return OS_ERR_ETIMEOUT;
    }else if(ticks == OS_WAITING_INFINITY){
        os_mutex__append(mutex, (os_thread_t*)current_thread);
        current_thread->state = OS_THREAD_STATE_PENDING;
        os_scheduler__need_schedule_flag = OS_TRUE;
        OS_MUTEX_UNLOCK();
        os_scheduler_schedule_in_thread();
        goto __os_mutex__check__;
    }else {
        os_mutex__append(mutex, (os_thread_t*)current_thread);
        os_scheduler_timed_wait((os_thread_t*)current_thread, ticks);
        OS_MUTEX_UNLOCK();
        os_scheduler_schedule_in_thread();
        if(current_thread->state==OS_THREAD_STATE_TIMEWAIT_TIMEOUT){
            /*调度返回该任务，检查是否TIMEOUT*/
            return OS_ERR_ETIMEOUT;
        }
        goto __os_mutex__check__;
    }
}

os_err_t os_mutext_unlock(os_mutex_t* mutex)
{
    OS_MUTEX_LOCK_VAR();
    OS_MUTEX_LOCK();
    
    if(mutex->owner == os_thread_self()){
        mutex->hold--;
        if(mutex->hold==0){
            mutex->owner->current_priority = mutex->original_priority;
            mutex->owner = 0;
            mutex->original_priority = OS_KERNEL_PRIORITY_MAX;
            os_mutex__restore(mutex);
            cpu_spinlock_unlock((cpu_spinlock_t*)&mutex->value);
            OS_MUTEX_UNLOCK();
            return os_scheduler_schedule_in_thread();
        }else{
            OS_MUTEX_UNLOCK();
            return OS_ERR_OK;
        }
    }
    OS_MUTEX_UNLOCK();
    return OS_MUTEX_ERR_OWNER;
}
