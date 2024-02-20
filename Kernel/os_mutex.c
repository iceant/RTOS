#include <os_mutex.h>
#include <os_spinlock.h>
#include <os_scheduler.h>
#include <os_macros.h>
#include <string.h>
#include <assert.h>
#include <cpu_atomic.h>

////////////////////////////////////////////////////////////////////////////////
////
__STATIC_FORCEINLINE void os_mutex__insert(os_mutex_t * mutex, os_thread_t* thread)
{
    os_list_node_t * node;
    os_thread_t * thread_p;
    
    if(OS_LIST_IS_EMPTY(&mutex->list)){
        OS_LIST_INSERT_BEFORE(&mutex->list, &thread->wait_node);
        return;
    }
    
    if(mutex->flag & OS_QUEUE_FIFO){
        OS_LIST_INSERT_BEFORE(&mutex->list, &thread->wait_node);
        return;
    }
    
    if(mutex->flag & OS_QUEUE_PRIO){
        for(node = OS_LIST_NEXT(&mutex->list); node!=&mutex->list;){
            thread_p = OS_CONTAINER_OF(node, os_thread_t, wait_node);
            node = OS_LIST_NEXT(node);
            int cmp = os_priority_cmp(thread->curr_priority, thread_p->curr_priority);
            if(cmp == OS_PRIORITY_CMP_HIGH /* 更高优先级 */ ){
                /* 排在前面 */
                OS_LIST_INSERT_BEFORE(&thread_p->wait_node, &thread->wait_node);
                return;
            }else if(cmp==OS_PRIORITY_CMP_EQUAL /* 相同优先级 */){
                /* 排在后面 */
                OS_LIST_INSERT_AFTER(&thread_p->wait_node, &thread->wait_node);
                return;
            }
        }
        
        /*到最后没有找到位置，插在最后面*/
        OS_LIST_INSERT_BEFORE(&mutex->list, &thread->wait_node);
        return;
    }
}
__STATIC_FORCEINLINE void os_mutex__notify_all(os_mutex_t * mutex){
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

__STATIC_FORCEINLINE void os_mutex__notify_one(os_mutex_t * mutex){
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

os_err_t os_mutex_init(os_mutex_t * mutex, const char* name, int flag)
{
    mutex->value = 0;
    if(name){
        int name_size = strlen(name);
        name_size = (name_size>(OS_NAME_MAX_SIZE-1))?(OS_NAME_MAX_SIZE-1):name_size;
        memcpy(mutex->name, name, name_size);
        mutex->name[name_size]='\0';
    }else{
        memset(mutex->name, 0, sizeof(mutex->name));
    }
    mutex->owner = 0;
    mutex->flag = flag;
    OS_LIST_INIT(&mutex->list);
    
    return OS_EOK;
}

os_err_t os_mutex_lock(os_mutex_t* mutex)
{
    os_bool_t lock_result;
    
    while(1){
        if(mutex->owner == os_thread_self()){
            return OS_EOK;
        }
        
        lock_result = os_spinlock_try_lock(&mutex->value);
        if(lock_result==OS_TRUE){
            mutex->owner = os_thread_self();
            mutex->original_priority = mutex->owner->curr_priority;
            return OS_EOK;
        }else{
            /*current thread requiring a lock, but failed. let current thread wait on mutex.*/
            if(mutex->owner!=0){
                register cpu_uintptr_t level;
                level = cpu_interrupt_disable();
                os_thread_t* current_thread = os_thread_self();
                current_thread->state = OS_THREAD_STATE_WAIT;
                current_thread->error = OS_THREAD_EOK;
                if(os_priority_cmp(current_thread->curr_priority, mutex->owner->curr_priority)==OS_PRIORITY_CMP_HIGH){
                    mutex->owner->curr_priority = current_thread->curr_priority; /* Promote mutex owner's priority */
                }
                /* Already locked by other thread */
                os_mutex__insert(mutex, current_thread);
                cpu_interrupt_enable(level);
                
                /* Don't wast CPU, switch to next thread */
                os_scheduler_schedule();
            }
        }
    }
    
}

os_err_t os_mutex_unlock(os_mutex_t * mutex)
{
    if(mutex->owner!=0 && mutex->owner==os_thread_self()){
        mutex->owner->curr_priority = mutex->owner->init_priority;
        mutex->owner = 0;
        os_mutex__notify_all(mutex);
    }
    os_spinlock_unlock(&mutex->value);
    return OS_EOK;
}
