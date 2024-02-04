#include <os_mutex.h>
#include <os_spinlock.h>
#include <os_scheduler.h>
#include <os_macros.h>
#include <string.h>
#include <assert.h>
#include <cpu_atomic.h>
////////////////////////////////////////////////////////////////////////////////
////


__STATIC_FORCEINLINE void os_mutex__insert(os_mutex_t* mutex, os_thread_t* thread)
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
            if(cmp == 1 /* �������ȼ� */ ){
                /* ����ǰ�� */
                OS_LIST_INSERT_BEFORE(&thread_p->wait_node, &thread->wait_node);
                return;
            }else if(cmp==0 /* ��ͬ���ȼ� */){
                /* ���ں��� */
                OS_LIST_INSERT_AFTER(&thread_p->wait_node, &thread->wait_node);
                return;
            }
        }
        
        /*�����û���ҵ�λ�ã����������*/
        OS_LIST_INSERT_BEFORE(&mutex->list, &thread->wait_node);
        return;
    }
}

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_mutex_init(os_mutex_t * mutex, const char* name, int flag)
{
    mutex->value = 0;
    int name_size = strlen(name);
    name_size = (name_size>(OS_NAME_MAX_SIZE-1))?(OS_NAME_MAX_SIZE-1):name_size;
    memcpy(mutex->name, name, name_size);
    mutex->name[name_size]='\0';
    mutex->flag = flag;
    mutex->owner = 0;
    mutex->current_priority = OS_PRIORITY_MAX-1;
    OS_LIST_INIT(&mutex->list);
    
    return OS_EOK;
}

os_err_t os_mutex_take(os_mutex_t * mutex, os_tick_t ticks)
{
    os_thread_t * current_thread;
    register cpu_uintptr_t level;
    os_tick_t expire_tick;
    os_tick_t current_tick;
    int zero = 0;
    int one = 1;
    
    if(ticks==0){
        return OS_ETIMEOUT;
    }
    
    level = cpu_interrupt_disable();
    {
        expire_tick = os_scheduler_get_current_tick() + ticks;
        current_thread = os_scheduler_current_thread();
        
        int cmp = os_priority_cmp(mutex->current_priority, current_thread->curr_priority);
        if(cmp==OS_PRIORITY_CMP_HIGH){
            current_thread->curr_priority = mutex->current_priority;
        }else if(cmp==OS_PRIORITY_CMP_LOW){
            mutex->current_priority = current_thread->curr_priority;
        }
    }
    cpu_interrupt_enable(level);
    
    
    /* try to get lock in loop */
    while(1){
        if(cpu_atomic_cmpxchg(&mutex->value, zero, one)){
            if(ticks!=OS_WAIT_INFINITY){
                level = cpu_interrupt_disable();
                current_tick = os_scheduler_get_current_tick();
                if( current_tick <= expire_tick){
                    /* SUCCESS */
                    current_thread = os_scheduler_current_thread();
                    assert(mutex->owner==0);
                    mutex->owner = current_thread;
                    cpu_interrupt_enable(level);
                    return OS_EOK;
                }else{
                    cpu_interrupt_enable(level);
                    return OS_ETIMEOUT;
                }
            }
        }else{
            /* Other thread locked mutex */
            if(ticks!=OS_WAIT_INFINITY){
                level = cpu_interrupt_disable();
                current_tick = os_scheduler_get_current_tick();
                cpu_interrupt_enable(level);
                
                if(current_tick > expire_tick){
                    return OS_ETIMEOUT;
                }
            }
        }
    }
}


os_err_t os_mutex_release(os_mutex_t * mutex)
{
    os_thread_t * current_thread;
    register cpu_uintptr_t level;
    
    return OS_EOK;
}

