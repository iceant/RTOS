#include <os_sem.h>
#include <os_memory.h>
#include <os_macros.h>
#include <os_scheduler.h>
#include <cpu.h>
#include <stdio.h>
#include <os_critical.h>
#include <cpu_spinlock.h>
////////////////////////////////////////////////////////////////////////////////
////


#if (OS_SEM_LOCK_POLICY==OS_SEM_LOCK_POLICY_DISABLE_IRQ)
#define OS_SEM_LOCK_VAR()   cpu_interrupt_context_t os_sem__lock_var__;
#define OS_SEM_LOCK()       cpu_interrupt_disable(&os_sem__lock_var__);
#define OS_SEM_UNLOCK()     cpu_interrupt_enable(&os_sem__lock_var__);
#elif (OS_SEM_LOCK_POLICY==OS_SEM_LOCK_POLICY_DISABLE_SCHEDULE)
#define OS_SEM_LOCK_VAR()   OS_SCHEDULER_LOCK_VARIABLE()
#define OS_SEM_LOCK()       OS_SCHEDULER_LOCK()
#define OS_SEM_UNLOCK()     OS_SCHEDULER_UNLOCK()
#elif (OS_SEM_LOCK_POLICY==OS_SEM_LOCK_POLICY_USE_CRITICAL)
#define OS_SEM_LOCK_VAR()
#define OS_SEM_LOCK()       os_critical_enter()
#define OS_SEM_UNLOCK()     os_critical_leave()
#elif (OS_SEM_LOCK_POLICY==OS_SEM_LOCK_POLICY_USE_SPINLOCK)
#define OS_SEM_LOCK_VAR()
#define OS_SEM_LOCK()       cpu_spinlock_lock(&sem->lock)
#define OS_SEM_UNLOCK()     cpu_spinlock_unlock(&sem->lock)
#endif
////////////////////////////////////////////////////////////////////////////////
////

static void os_sem__append(os_sem_t* sem, os_thread_t* thread){
    register os_list_node_t * os_sem__current_node;
    OS_LIST_REMOVE(&thread->pend_node);
    OS_LIST_REMOVE(&thread->ready_node);
    if(sem->flag==OS_SEM_FLAG_PRIO){
        for(os_sem__current_node = OS_LIST_NEXT(&sem->pend_list); os_sem__current_node!=&sem->pend_list; ){
            os_thread_t * p = OS_LIST_CONTAINER(os_sem__current_node, os_thread_t, pend_node);
            int cmp = os_priority_cmp(p->current_priority, thread->current_priority);
            if(cmp==0){
                OS_LIST_INSERT_AFTER(&p->pend_node, &thread->pend_node);
                return;
            }else if(cmp==1){
                /* thread 优先级更高*/
                OS_LIST_INSERT_BEFORE(&p->pend_node, &thread->pend_node);
                return;
            }
            os_sem__current_node = OS_LIST_NEXT(os_sem__current_node);
        }
        /* 遍历完了也没找到位置，排在队尾 */
        OS_LIST_INSERT_BEFORE(&sem->pend_list, (os_list_node_t*)&thread->pend_node);
    }else{
        OS_LIST_INSERT_BEFORE(&sem->pend_list, (os_list_node_t*)&thread->pend_node);
    }
}

C_STATIC_FORCEINLINE void os_sem__restore(os_sem_t* sem){
    register os_list_node_t * os_sem__current_node = 0;
    if(OS_LIST_IS_EMPTY(&sem->pend_list)){
        return;
    }
    os_sem__current_node = OS_LIST_NEXT(&sem->pend_list);
    register os_thread_t* thread = OS_LIST_CONTAINER(os_sem__current_node, os_thread_t, pend_node);
    /*从timer中移除*/
    os_timer_remove(&thread->timer_node);
    os_scheduler_readylist_push_back(thread);
    os_scheduler__need_schedule_flag = OS_TRUE;
}

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_sem_init(os_sem_t* sem, const char* name, os_uint_t value, uint8_t flag)
{
    OS_LIST_INIT(&sem->pend_list);
    
    os_size_t name_size = strlen(name);
    name_size = OS_MIN(name_size, OS_KERNEL_NAME_SIZE-2);
    memcpy(sem->name, name, name_size);
    sem->name[name_size+1]='\0';
    
    sem->value = value;
    sem->flag = flag;
    
    #if (OS_SEM_LOCK_POLICY==OS_SEM_LOCK_POLICY_USE_SPINLOCK)
    cpu_spinlock_init(&sem->lock);
    #endif
    
    return OS_ERR_OK;
}

os_err_t os_sem_take(os_sem_t* sem, os_tick_t ticks)
{
    OS_SEM_LOCK_VAR();
    os_err_t error = OS_ERR_OK;
__os_sem__check__:
    
        OS_SEM_LOCK();
        
        if(sem->value>0){
            sem->value--;
            OS_SEM_UNLOCK();
            return OS_ERR_OK;
        }
        
        if(ticks==0){
            OS_SEM_UNLOCK();
            return OS_ERR_ETIMEOUT;
        }else if(ticks==OS_WAITING_INFINITY){
            register os_thread_t* owner_thread = os_thread_self();
            os_sem__append(sem, (os_thread_t*)owner_thread);
            owner_thread->state = OS_THREAD_STATE_PENDING;
            OS_SEM_UNLOCK();
            do{
                os_scheduler_schedule_in_thread(&error);
            }while(error!=OS_ERR_OK);
            goto __os_sem__check__;
        }else{
            register os_thread_t* owner_thread = os_thread_self();
            os_sem__append(sem, (os_thread_t*)owner_thread);
            os_scheduler_timed_wait((os_thread_t*)owner_thread, ticks);
            OS_SEM_UNLOCK();
            
            do{
                os_scheduler_schedule_in_thread(&error);
            }while(error!=OS_ERR_OK);
            if(owner_thread->state==OS_THREAD_STATE_TIMEWAIT_TIMEOUT){
                /*调度返回该任务，检查是否TIMEOUT*/
                return OS_ERR_ETIMEOUT;
            }
            goto __os_sem__check__;
        }

}

os_err_t os_sem_release(os_sem_t* sem)
{
    OS_SEM_LOCK_VAR();
    OS_SEM_LOCK();
    sem->value++;
    os_sem__restore(sem);
    OS_SEM_UNLOCK();
}
