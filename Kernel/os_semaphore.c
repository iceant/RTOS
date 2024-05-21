#include <os_semaphore.h>
#include <os_macros.h>
#include <string.h>
#include <os_tick.h>
#include <os_thread.h>
#include <stdio.h>
#include "os_scheduler.h"

////////////////////////////////////////////////////////////////////////////////
////
#define OS_SEMAPHORE_LOCK(s) cpu_lock_lock(&(s)->lock)
#define OS_SEMAPHORE_UNLOCK(s) cpu_lock_unlock(&(s)->lock)

////////////////////////////////////////////////////////////////////////////////
////
C__STATIC_FORCEINLINE void os_semaphore__insert(os_semaphore_t * semaphore, os_thread_t* thread){
    if(semaphore->flags & OS_SEMAPHORE_FLAG_FIFO){
        OS_LIST_REMOVE(&thread->wait_node);
//        printf("[sem] hang %s in %s tail\n", thread->name, semaphore->name);
        OS_LIST_INSERT_BEFORE(&semaphore->wait_list, &thread->wait_node); /*挂在对象上等待*/
        return;
    }else if(semaphore->flags & OS_SEMAPHORE_FLAG_PRIO){
        if(OS_LIST_IS_EMPTY(&semaphore->wait_list)){
            OS_LIST_REMOVE(&thread->wait_node);
//            printf("[sem] hang %s in %s tail\n", thread->name, semaphore->name);
            OS_LIST_INSERT_BEFORE(&semaphore->wait_list, &thread->wait_node); /*挂在对象上等待*/
            return;
        }else{
            os_list_node_t * node;
            for(node= OS_LIST_NEXT(&semaphore->wait_list); node!=&semaphore->wait_list;){
                os_thread_t * p = OS_CONTAINER_OF(node, os_thread_t, wait_node);
                int cmp = os_priority_cmp(thread->curr_priority, p->curr_priority);
                if(cmp==OS_PRIORITY_CMP_HIGH){
//                    printf("[sem] hang %s in %s before %s\n", thread->name, semaphore->name, p->name);
                    OS_LIST_INSERT_BEFORE(&p->wait_node, &thread->wait_node);
                    return;
                }else if(cmp==OS_PRIORITY_CMP_EQUAL){
//                    printf("[sem] hang %s in %s\n", thread->name, semaphore->name);
                    OS_LIST_INSERT_AFTER(&p->wait_node, &thread->wait_node);
                    return;
                }
                node = OS_LIST_NEXT(node);
            }
//            printf("[sem] hang %s in %s tail\n", thread->name, semaphore->name);
            OS_LIST_INSERT_BEFORE(&semaphore->wait_list, &thread->wait_node); /*挂在对象上等待*/
        }

    }
}



////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_semaphore_init(os_semaphore_t* semaphore, const char* name, int value, int flags)
{
    if(name){
        os_size_t name_size = strlen(name);
        name_size = OS_MIN(name_size, OS_NAME_SIZE-1);
        memcpy(semaphore->name, name, name_size);
        semaphore->name[name_size] = '\0';
    }

    semaphore->value = value;
    semaphore->flags = flags;
    cpu_lock_init(&semaphore->lock);
    OS_LIST_INIT(&(semaphore->wait_list));

    return OS_EOK;
}



os_err_t os_semaphore_take(os_semaphore_t * semaphore, os_tick_t ticks){

    register os_thread_t* current_thread;

    while(1){
        OS_SEMAPHORE_LOCK(semaphore);
        if(semaphore->value>0){
            semaphore->value--;
            OS_SEMAPHORE_UNLOCK(semaphore);
            return OS_EOK;
        }
        if(ticks==0){
            OS_SEMAPHORE_UNLOCK(semaphore);
            return OS_ETIMEOUT;
        }else if(ticks==OS_WAIT_INFINITY){
            /* 等待 */
            current_thread = os_thread_self();
//            printf("[sem] %s wait\n", current_thread->name);
            current_thread->state = OS_THREAD_STATE_WAIT;
            os_semaphore__insert(semaphore, current_thread);
            OS_SEMAPHORE_UNLOCK(semaphore);
            OS_SCHEDULER_SCHEDULE_YIELD_BACK();
        }else{
            /*等待特定时间*/
            current_thread = os_thread_self();
            os_scheduler_timed_wait(current_thread, ticks); /*挂在时间调度器上*/
            OS_SEMAPHORE_UNLOCK(semaphore);
            current_thread->error = OS_THREAD_ERROR_OK;
            OS_SCHEDULER_SCHEDULE_YIELD_BACK();
            if(current_thread->error == OS_THREAD_ERROR_TIMEOUT){
                return OS_ETIMEOUT;
            }
        }
    }
}

os_err_t os_semaphore_release(os_semaphore_t * semaphore){

    volatile os_list_node_t * head;
    OS_SEMAPHORE_LOCK(semaphore);
    semaphore->value++;

    head = &semaphore->wait_list;
    if(!OS_LIST_IS_EMPTY(head)){
        os_list_node_t * node = OS_LIST_NEXT(head);
        OS_LIST_REMOVE(node);
        os_thread_t* thread = OS_CONTAINER_OF(node, os_thread_t, wait_node);
//        os_thread_t* curr_thread = os_scheduler_current_thread();
//        if(os_priority_cmp(thread->curr_priority, curr_thread->curr_priority)==OS_PRIORITY_CMP_HIGH)
//        {
////            printf("[sem] %s high > %s\n", thread->name, curr_thread->name);
//            /*优先级比现在运行的优先级高，强制切换*/
//            os_scheduler_yield(curr_thread);
//            os_scheduler_push_front(thread); /*加到队列前面，优先执行*/
//        }else{
//            os_scheduler_push(thread);
//        }
        os_scheduler_push(thread);
    }
    OS_SEMAPHORE_UNLOCK(semaphore);
    return OS_SCHEDULER_SCHEDULE_YIELD_FRONT();
}
