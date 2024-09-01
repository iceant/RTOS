#include <os_mutex.h>
#include <os_memory.h>
#include <os_kernel_lock.h>
#include <os_scheduler.h>
#include "os_macros.h"



/* -------------------------------------------------------------------------------------------------------------- */
/* STATIC */

C_STATIC_FORCEINLINE void os_mutex__push_back(os_mutex_t * mutex, os_thread_t* thread)
{
    os_list_node_t * node;
    os_thread_t* t;
    int cmp;
    
    thread->state = OS_THREAD_STATE_PENDING;
    thread->remain_ticks = 0;
    OS_LIST_REMOVE(&thread->pend_node);
    
    if(mutex->flag == OS_MUTEX_FLAG_PRIO){
        for(node = OS_LIST_NEXT(&mutex->pend_list); node!=&mutex->pend_list; ){
            t = OS_LIST_CONTAINER(node, os_thread_t, pend_node);
            node = OS_LIST_NEXT(node);
            cmp = os_priority_cmp(t->current_priority, thread->current_priority);
            
            if(cmp==OS_PRIORITY_CMP_LOW){
                OS_LIST_INSERT_BEFORE(&t->pend_node, &thread->pend_node);
                return;
            }else if(cmp==OS_PRIORITY_CMP_EQ){
                OS_LIST_INSERT_AFTER(&t->pend_node, &thread->pend_node);
                return;
            }
        }
        /* 找遍了，没有找到合适的位置，插在最后 */
        OS_LIST_INSERT_BEFORE(&mutex->pend_list, &thread->pend_node);
    }else{
        OS_LIST_INSERT_BEFORE(&mutex->pend_list, &thread->pend_node);
    }
    
}

C_STATIC_FORCEINLINE os_thread_t * os_mutex__pop_one(os_mutex_t* mutex){
    os_thread_t * t;
    os_list_node_t * node;
    if(OS_LIST_IS_EMPTY(&mutex->pend_list)){
        return 0;
    }
    node = OS_LIST_NEXT(&mutex->pend_list);
    t = OS_LIST_CONTAINER(node, os_thread_t, pend_node);
    OS_LIST_REMOVE(node);
    return t;
}

/* -------------------------------------------------------------------------------------------------------------- */
/*  */
os_err_t os_mutex_init(os_mutex_t* mutex, const char* name, int flag)
{
    if(name){
        os_size_t name_size = strlen(name);
        name_size = (name_size > (OS_NAME_MAX_SIZE-1))?(OS_NAME_MAX_SIZE-1):name_size;
        memcpy(mutex->name, name, name_size);
        mutex->name[name_size] = '\0';
    }else{
        mutex->name[0] = '\0';
    }
    
    mutex->flag = flag;
    OS_LIST_INIT(&mutex->pend_list);
    mutex->owner = 0;
    mutex->hold = 0;
    mutex->owner_original_priority = OS_PRIORITY_MAX;
    
    return OS_MUTEX_ERR_OK;
}

os_err_t os_mutex_take_in_kernel(os_mutex_t* mutex, os_tick_t ticks){
    OS_KERNEL_LOCK_VAR();
    OS_KERNEL_LOCK();
    if(mutex->hold==0){
        mutex->owner = os_thread_self();
        mutex->owner_original_priority = mutex->owner->current_priority;
        mutex->hold = 1;
        OS_KERNEL_UNLOCK();
        return OS_MUTEX_ERR_OK;
    }
    
    if(mutex->owner == os_thread_self()){
        mutex->hold++;
        OS_KERNEL_UNLOCK();
        return OS_MUTEX_ERR_OWNER;
    }
    
    if(os_scheduler__disable_nest>0u){
        /* SCHEDULER DISABLED */
        OS_KERNEL_UNLOCK();
        return OS_MUTEX_ERR_SCHEDULER_DISABLED;
    }
    
    if(os_priority_cmp(mutex->owner->current_priority, os_scheduler__current_thread_p->current_priority)==OS_PRIORITY_CMP_LOW){
        switch (mutex->owner->state) {
            case OS_THREAD_STATE_READY: {
                mutex->owner->current_priority = os_scheduler__current_thread_p->current_priority;
                os_scheduler_push_back_ready(mutex->owner); /* 重新调整任务优先级 */
                break;
            }
            case OS_THREAD_STATE_SUSPEND:
            case OS_THREAD_STATE_DELAY:
            case OS_THREAD_STATE_DELAY_TIMEOUT:
            case OS_THREAD_STATE_PEND_TIMEOUT:
            case OS_THREAD_STATE_YIELD: {
                mutex->owner->current_priority = os_scheduler__current_thread_p->current_priority;
                break;
            }
            case OS_THREAD_STATE_PENDING:
            {
                mutex->owner->current_priority = os_scheduler__current_thread_p->current_priority;
                //TODO: Adjust Pending List for owner
                break;
            }
            default:{
                break;
            }
        }
    }
    
    if(ticks==0){
        OS_KERNEL_UNLOCK();
        return OS_ERR_TIMEOUT;
    }else if(ticks==OS_WAITING_INFINITY){
        os_mutex__push_back(mutex, os_scheduler__current_thread_p);
        OS_KERNEL_UNLOCK();
        os_scheduler_schedule();
        return OS_ERR_EAGAIN;
    }else{
        os_mutex__push_back(mutex, os_scheduler__current_thread_p);
        OS_KERNEL_UNLOCK();
        os_scheduler_delay(os_scheduler__current_thread_p, ticks);
        if(OS_BIT_GET(os_scheduler__current_thread_p->error, OS_THREAD_ERR_TIMEOUT_POS)){
            return OS_ERR_TIMEOUT;
        }
        return OS_ERR_EAGAIN;
    }
}


os_err_t os_mutex_release_in_kernel(os_mutex_t * mutex){
    os_thread_t * thread;
    OS_KERNEL_LOCK_VAR();
    OS_KERNEL_LOCK();
    thread = os_mutex__pop_one(mutex);
    OS_KERNEL_UNLOCK();
    return os_scheduler_resume(thread);
}


os_err_t os_mutex_take(os_mutex_t* sem, os_tick_t ticks){
    if(cpu_in_privilege()){
        os_err_t error = os_mutex_take_in_kernel(sem, ticks);
        if(error==OS_SCHEDULER_ERR_IRQ_NEST){
            os_scheduler__need_schedule = OS_TRUE;
        }
        return error;
    }else{
        return cpu_kernel_mutex_take(sem, ticks);
    }
}

os_err_t os_mutex_release(os_mutex_t* sem){
    if(cpu_in_privilege()){
        os_err_t error = os_mutex_release_in_kernel(sem);
        if(error==OS_SCHEDULER_ERR_IRQ_NEST){
            os_scheduler__need_schedule = OS_TRUE;
        }
        return error;
    }else{
        return cpu_kernel_mutex_release(sem);
    }
}
