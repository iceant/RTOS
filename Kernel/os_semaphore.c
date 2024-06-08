#include <os_semaphore.h>
#include <os_macros.h>
#include <string.h>
#include <os_tick.h>
#include <os_thread.h>
#include <stdio.h>
#include <assert.h>
#include "os_scheduler.h"
#include "os_printf.h"

////////////////////////////////////////////////////////////////////////////////
////
//#define OS_SEM_DEBUG_ENABLE

#define OS_SEMAPHORE_LOCK(s) cpu_lock_lock(&(s)->lock)
#define OS_SEMAPHORE_UNLOCK(s) cpu_lock_unlock(&(s)->lock)

////////////////////////////////////////////////////////////////////////////////
////
C__STATIC_FORCEINLINE void os_semaphore__insert(os_semaphore_t * semaphore, os_thread_t* thread){
    if(semaphore==0 || thread==0) return;
    if(semaphore->flags & OS_SEMAPHORE_FLAG_FIFO){
        OS_LIST_REMOVE(&thread->wait_node);
        OS_LIST_INSERT_BEFORE(&semaphore->wait_list, &thread->wait_node); /*挂在对象上等待*/
        return;
    }else if(semaphore->flags & OS_SEMAPHORE_FLAG_PRIO){
        if(OS_LIST_IS_EMPTY(&semaphore->wait_list)){
            OS_LIST_REMOVE(&thread->wait_node);
            OS_LIST_INSERT_BEFORE(&semaphore->wait_list, &thread->wait_node); /*挂在对象上等待*/
            return;
        }else{
            register os_list_node_t * node;
            for(node= OS_LIST_NEXT(&semaphore->wait_list); node!=&semaphore->wait_list;){
                register os_thread_t * p = OS_CONTAINER_OF(node, os_thread_t, wait_node);
                int cmp = os_priority_cmp(thread->curr_priority, p->curr_priority);
                if(cmp==OS_PRIORITY_CMP_HIGH){
                    OS_LIST_INSERT_BEFORE(&p->wait_node, &thread->wait_node);
                    return;
                }else if(cmp==OS_PRIORITY_CMP_EQUAL){
                    OS_LIST_INSERT_AFTER(&p->wait_node, &thread->wait_node);
                    return;
                }
                node = OS_LIST_NEXT(node);
            }
            OS_LIST_INSERT_BEFORE(&semaphore->wait_list, &thread->wait_node); /*挂在对象上等待*/
        }

    }
}



////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_semaphore_init(os_semaphore_t* semaphore, const char* name, int value, int flags)
{
    if(semaphore==0) return OS_EINVAL;

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

    while(semaphore==0){
        OS_SCHEDULER_SCHEDULE();
    }

    register os_thread_t* current_thread = 0;

    while(1){
        OS_SEMAPHORE_LOCK(semaphore);
        
        current_thread = os_thread_self();
        
        if(!current_thread || current_thread->state!=OS_THREAD_STATE_RUNNING){
            continue;
        }
        
        if(semaphore->value>0){
            #if defined(OS_SEM_DEBUG_ENABLE)
            printf("[sem-tk] thd:%s tk on [%s].value>0 !\n", current_thread->name, semaphore->name);
            #endif
            semaphore->value--;
            OS_SEMAPHORE_UNLOCK(semaphore);
            return OS_EOK;
        }
        if(ticks==0){
            OS_SEMAPHORE_UNLOCK(semaphore);
            return OS_ETIMEOUT;
        }else if(ticks==OS_WAIT_INFINITY){
            /* 等待 */
//            if(current_thread && current_thread->state==OS_THREAD_STATE_RUNNING){
//                current_thread->state = OS_THREAD_STATE_WAIT;
//                os_semaphore__insert(semaphore, current_thread);
//                OS_SEMAPHORE_UNLOCK(semaphore);
//                #if defined(OS_SEM_DEBUG_ENABLE)
//                printf("[sem-tk] %s ivk schd cur_thd:%s\n", semaphore->name, current_thread->name);
//                #endif
//            }
            current_thread->state = OS_THREAD_STATE_WAIT;
            os_semaphore__insert(semaphore, current_thread);
            OS_SEMAPHORE_UNLOCK(semaphore);
            #if defined(OS_SEM_DEBUG_ENABLE)
            printf("[sem-tk] on sem:%s, thd %s wait infinity!\n", semaphore->name, current_thread->name);
            #endif
            OS_SCHEDULER_SCHEDULE();
        }else{
            /*等待特定时间*/
//            current_thread = os_thread_self();
//            assert(current_thread);
            #if defined(OS_SEM_DEBUG_ENABLE)
            printf("[sem-tk] on sem:%s, thd %s wait for %d ticks!\n", semaphore->name, current_thread->name, ticks);
            #endif
            current_thread->error = OS_THREAD_ERROR_OK;
            os_semaphore__insert(semaphore, current_thread);
            os_scheduler_timed_wait(current_thread, ticks); /*挂在时间调度器上*/
            OS_SEMAPHORE_UNLOCK(semaphore);
            OS_SCHEDULER_SCHEDULE();
            if(current_thread->error == OS_THREAD_ERROR_TIMEOUT){
                #if defined(OS_SEM_DEBUG_ENABLE)
                os_printf("[sem-tk] sem:%s thd %s timeout\n", semaphore->name, current_thread->name);
                #endif
                return OS_ETIMEOUT;
            }
        }
    }
}

os_err_t os_semaphore_release(os_semaphore_t * semaphore){

    if(semaphore==0) return OS_EINVAL;

    register volatile os_list_node_t * head = 0;
    register os_thread_t* curr_thread = 0;
    register os_thread_t* thread = 0;
    register os_list_node_t * node = 0;

    OS_SEMAPHORE_LOCK(semaphore);
    semaphore->value++;

    head = &semaphore->wait_list;
    if(!OS_LIST_IS_EMPTY(head)){
//        #if defined(OS_SEM_DEBUG_ENABLE)
//        os_printf("[sem-rls] %s not empty!\n", semaphore->name);
//        #endif
        node = OS_LIST_NEXT(head);
        OS_LIST_REMOVE(node);
        thread = OS_CONTAINER_OF(node, os_thread_t, wait_node);
        if(thread){
            if(thread->state==OS_THREAD_STATE_TIMEWAIT){
                /* 在时间轮上挂着, 移除，避免错误的TIMEOUT调用 */
                OS_LIST_REMOVE(&thread->timer_node.wait_node);
            }
            curr_thread = os_scheduler_current_thread();
            if(curr_thread){
                if(curr_thread->state!=OS_THREAD_STATE_RUNNING){
                    #if defined(OS_SEM_DEBUG_ENABLE)
                    os_printf("[sem-rls] sem:%s push cur_thd %s\n", semaphore->name, curr_thread->name);
                    #endif
                    os_scheduler_push(thread); /*当前线程不在运行状态，忽略，直接将目标线程加入调度列表*/
                }else{
                    if(os_priority_cmp(thread->curr_priority, curr_thread->curr_priority)==OS_PRIORITY_CMP_HIGH)
                    {
                        #if defined(OS_SEM_DEBUG_ENABLE)
                        os_printf("[sem-rls] sem:%s %s high > %s\n", semaphore->name, thread->name, curr_thread->name);
                        #endif
                        /*优先级比现在运行的优先级高，强制切换*/
                        os_scheduler_yield(curr_thread);
                        os_scheduler_push_front(thread); /*加到队列前面，优先执行*/
                        OS_SEMAPHORE_UNLOCK(semaphore);
                        return OS_SCHEDULER_SCHEDULE_YIELD_BACK();
                    }else{
                        #if defined(OS_SEM_DEBUG_ENABLE)
                        os_printf("[sem-rls] sem:%s %s(nxt) prio <= %s(cur), push %s\n"
                                  , semaphore->name
                                  , thread->name, curr_thread->name, thread->name);
                        #endif
                        os_scheduler_push(thread); /* 比当前线程优先级低，将线程加入就绪表，等待调用 */
                    }
                }
            }else{
                #if defined(OS_SEM_DEBUG_ENABLE)
                os_printf("[sem-rls] sem:%s no cur_thd, push %s\n"
                          , semaphore->name
                          , thread->name);
                #endif
                os_scheduler_push(thread); /* 将线程加入就绪表，等待调用 */
            }
        }
    }
    OS_SEMAPHORE_UNLOCK(semaphore);
    return OS_SCHEDULER_SCHEDULE();
}
