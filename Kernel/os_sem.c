#include <os_sem.h>
#include <os_memory.h>
#include <os_macros.h>
#include <os_scheduler.h>
#include <cpu.h>
#include <stdio.h>

////////////////////////////////////////////////////////////////////////////////
////

static void os_sem__append(os_sem_t* sem, os_thread_t* thread){
    os_list_node_t * os_sem__current_node;
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

static void os_sem__restore(os_sem_t* sem){
    os_list_node_t * os_sem__current_node;
    if(OS_LIST_IS_EMPTY(&sem->pend_list)){
        return;
    }
    os_sem__current_node = OS_LIST_NEXT(&sem->pend_list);
    OS_LIST_REMOVE(os_sem__current_node);
    os_thread_t* thread = OS_LIST_CONTAINER(os_sem__current_node, os_thread_t, pend_node);
    /*从timer中移除*/
    os_timer_remove(&thread->timer_node);
    os_scheduler_readylist_push_back(thread);

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
    sem->owner = 0;
    
    return OS_ERR_OK;
}

os_err_t os_sem_take(os_sem_t* sem, os_tick_t ticks)
{
    cpu_interrupt_context_t ctx;
    
    while(1){
        if(sem->value>0){
            sem->value--;
            return OS_ERR_OK;
        }
        
        if(ticks==0){
            return OS_ERR_ETIMEOUT;
        }else if(ticks==OS_WAITING_INFINITY){
            cpu_interrupt_disable(&ctx);
            os_sem__append(sem, (os_thread_t*)os_scheduler__current_thread);
            printf("[os_sem_take] %s, val:%d\n", os_scheduler__current_thread->name, sem->value);
            
            os_scheduler__current_thread->state = OS_THREAD_STATE_PENDING;
            os_scheduler__current_thread->flag = OS_THREAD_FLAG_SCHEDULE;
            cpu_interrupt_enable(&ctx);
//            while(os_scheduler__current_thread->flag==OS_THREAD_FLAG_SCHEDULE);
        }else{
            cpu_interrupt_disable(&ctx);
            os_sem__append(sem, (os_thread_t*)os_scheduler__current_thread);
            os_scheduler_timed_wait((os_thread_t*)os_scheduler__current_thread, ticks);
            os_scheduler__current_thread->flag = OS_THREAD_FLAG_SCHEDULE;
            cpu_interrupt_enable(&ctx);
            while(os_scheduler__current_thread->flag==OS_THREAD_FLAG_SCHEDULE); /* 等待 SysTick 调度到其它任务 */
            
            if(os_scheduler__current_thread->state==OS_THREAD_STATE_TIMEWAIT_TIMEOUT){
                /*调度返回该任务，检查是否TIMEOUT*/
                return OS_ERR_ETIMEOUT;
            }
        }
    }
}

os_err_t os_sem_release(os_sem_t* sem)
{
    cpu_interrupt_context_t ctx;
    cpu_interrupt_disable(&ctx);
    sem->value++;
    os_sem__restore(sem);
    cpu_interrupt_enable(&ctx);
    
    return OS_ERR_OK;
}
