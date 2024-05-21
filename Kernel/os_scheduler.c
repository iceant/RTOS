#include <os_scheduler.h>
#include <os_memory.h>
#include <os_list.h>
#include <os_macros.h>
#include <cpu.h>
#include <cpu_stack.h>
#include <os_interrupt.h>
#include <stdio.h>
////////////////////////////////////////////////////////////////////////////////
////

static os_list_t os_scheduler__ready_list[OS_PRIORITY_MAX]={0};
static os_list_t os_scheduler__yield_list={0};
static os_list_t os_scheduler__pending_list={0};
static int os_scheduler__state={0};
static os_uint_t os_scheduler__schedule_nest={0};
static cpu_lock_t os_scheduler__lock={0};
static os_thread_t * os_scheduler__current_thread=0;
static os_uint_t os_scheduler__current_tick=0;
static os_uint_t os_scheduler__skipped = 0;

#define OS_SCHEDULER_LOCK() cpu_lock_lock(&os_scheduler__lock)
#define OS_SCHEDULER_UNLOCK() cpu_lock_unlock(&os_scheduler__lock)

////////////////////////////////////////////////////////////////////////////////
////
typedef enum os_scheduler_push_type_enum{
    kOsSchedulerPushType_FRONT = 0,
    kOsSchedulerPushType_BACK = 1,
}os_scheduler_push_type_enum;

C__STATIC_FORCEINLINE os_thread_t * os_scheduler__pop_highest(void){
    os_priority_t highest_priority = os_priority_get_highest();
    if(highest_priority==OS_PRIORITY_INVALID){
        /* No Task In Ready Table */
        return 0;
    }
    os_list_t * head = &os_scheduler__ready_list[highest_priority];
    if(OS_LIST_IS_EMPTY(head)){
        os_priority_unmark(highest_priority);
        return 0;
    }
    os_list_node_t *node = OS_LIST_NEXT(head);
    os_thread_t * thread = OS_CONTAINER_OF(node, os_thread_t, ready_node);
    OS_LIST_REMOVE(&thread->ready_node);
    if(OS_LIST_IS_EMPTY(head)){
        os_priority_unmark(highest_priority);
    }
    return thread;
}

C__STATIC_FORCEINLINE void os_scheduler__pending_list_push_back(os_thread_t * thread){
    if(thread==0)return;
    if(thread->sp < thread->stack_addr || thread->sp>=(thread->stack_addr + thread->stack_size)){
        printf("[sch] invalid thread!\n");
        return;
    }
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_INSERT_BEFORE(&os_scheduler__pending_list, &thread->ready_node);
}

C__STATIC_FORCEINLINE void os_scheduler__ready_list_push(os_thread_t * thread, os_scheduler_push_type_enum pushType){
    if(thread==0)return;
    os_priority_t priority = thread->curr_priority;
    os_list_t * head = &os_scheduler__ready_list[priority];
    os_list_node_t * node;
    for(node = OS_LIST_NEXT(head); node!=head;){
        os_thread_t* p = OS_CONTAINER_OF(node, os_thread_t, ready_node);
        if(p==thread){
            return;
        }
        node = OS_LIST_NEXT(node);
    }
    OS_LIST_REMOVE(&thread->ready_node);
    thread->state = OS_THREAD_STATE_READY;
    if(pushType==kOsSchedulerPushType_BACK){
        OS_LIST_INSERT_BEFORE(head, &thread->ready_node);
    }else{
        OS_LIST_INSERT_AFTER(head, &thread->ready_node);
    }
    os_priority_mark(priority);
}


static void os_scheduler__timer_timeout(os_timer_t * timer, void* userdata){
//    os_thread_t * thread = (os_thread_t *)userdata;
    os_thread_t* thread = OS_CONTAINER_OF(timer, os_thread_t, timer_node);
//    printf("[sch] %s timeout\n", thread->name);
    thread->error = OS_THREAD_ERROR_TIMEOUT;
    if(os_interrupt_nest()>0U){
        os_scheduler__pending_list_push_back(thread);
    }else{
        os_scheduler__ready_list_push(thread, kOsSchedulerPushType_BACK);
    }
}

////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_scheduler_init(void){
    os_size_t i;
    for(i=0; i< OS_ARRAY_SIZE(os_scheduler__ready_list); i++){
        OS_LIST_INIT(&os_scheduler__ready_list[i]);
    }
    OS_LIST_INIT(&os_scheduler__yield_list);
    OS_LIST_INIT(&os_scheduler__pending_list);

    os_scheduler__current_tick = 0;
    os_scheduler__current_thread = 0;
    os_scheduler__schedule_nest = 0;
    cpu_lock_init(&os_scheduler__lock);
    os_scheduler__state = OS_SCHEDULER_STATE_INITIALIZED;

    return OS_SCHEDULER_EOK;
}

int os_scheduler_state(void)
{
    return os_scheduler__state;
}


void os_scheduler_timed_wait(os_thread_t * thread, os_tick_t ticks){
    if(thread==0) return;
    OS_SCHEDULER_LOCK();
    thread->remain_ticks = 0;
//    printf("[sch] time_wt %s => ready:%d, wait:%d, timer:%d\n", thread->name, OS_LIST_IS_EMPTY(&thread->ready_node)?0:1
//           ,OS_LIST_IS_EMPTY(&thread->wait_node)?0:1
//           ,OS_LIST_IS_EMPTY(&thread->timer_node.wait_node)?0:1
//           );
    thread->state = OS_THREAD_STATE_TIMEWAIT;
    os_timer_add(&thread->timer_node, os_scheduler__timer_timeout, thread, ticks, OS_TIMER_FLAG_ONCE);
    OS_SCHEDULER_UNLOCK();
}

C__STATIC_FORCEINLINE void os_scheduler_mark_skipped(void)
{
    os_scheduler__skipped++;
}


void os_scheduler_on_systick(void){
    register os_thread_t * curr_thread;
    register os_bool_t curr_thread_need_schedule = OS_FALSE;
    register os_bool_t timer_need_schedule = OS_FALSE;

    OS_SCHEDULER_LOCK();
    os_scheduler__current_tick++;
    curr_thread = os_scheduler__current_thread;

    if(curr_thread!=0){
        if(curr_thread->state==OS_THREAD_STATE_RUNNING){
            curr_thread->remain_ticks--;
            if(curr_thread->remain_ticks == 0){
                curr_thread->state = OS_THREAD_STATE_YIELD;
                curr_thread_need_schedule = OS_TRUE;
            }
        }
    }

    timer_need_schedule = os_timer_tick();

    if(os_scheduler_skipped()>0U && os_interrupt_nest()==0U){
        /*需要紧急调度*/
        if(curr_thread!=0 && curr_thread->state==OS_THREAD_STATE_RUNNING){
            curr_thread->state = OS_THREAD_STATE_YIELD;
        }
        OS_SCHEDULER_UNLOCK();
        OS_SCHEDULER_SCHEDULE_YIELD_FRONT(); /* 当前线程被抢占了，放到队列最前面，调度时最先恢复 */
        return;
    }

    if(curr_thread_need_schedule==OS_TRUE){
        if(os_interrupt_nest()>0U){
            os_scheduler__pending_list_push_back(curr_thread);
            os_scheduler_mark_skipped();
        }else{
            OS_SCHEDULER_UNLOCK();
            OS_SCHEDULER_SCHEDULE_YIELD_BACK();
            return;
        }
    }

    if(timer_need_schedule==OS_TRUE){
        if(os_interrupt_nest()==0U){
            OS_SCHEDULER_UNLOCK();
            OS_SCHEDULER_SCHEDULE_YIELD_BACK();
            return;
        }else{
            os_scheduler_mark_skipped();
        }
    }

    OS_SCHEDULER_UNLOCK();
}

os_uint_t os_scheduler_nest(){
    return os_scheduler__schedule_nest;
}

os_err_t os_scheduler_startup(void){

    OS_SCHEDULER_LOCK();
    os_thread_t * thread = os_scheduler__pop_highest();
    thread->state = OS_THREAD_STATE_RUNNING;
    thread->remain_ticks = thread->init_ticks;
    os_scheduler__current_thread = thread;
    os_scheduler__state = OS_SCHEDULER_STATE_STARTED;
    OS_SCHEDULER_UNLOCK();

    cpu_stack_switch(0, &thread->sp);

    return OS_SCHEDULER_EOK;
}

os_err_t os_scheduler_schedule(int policy)
{
    register os_thread_t * curr_thread;
    register os_thread_t * next_thread;
    register os_list_node_t * node;
    register os_list_t * head;

    if(os_scheduler__state!=OS_SCHEDULER_STATE_STARTED){
        return OS_SCHEDULER_ERROR;
    }

    if(os_interrupt_nest()!=0U){
        os_scheduler_mark_skipped();
        return OS_SCHEDULER_ERROR;
    }

    OS_SCHEDULER_LOCK();

    next_thread = os_scheduler__pop_highest();

    curr_thread = os_scheduler__current_thread;
    if(curr_thread!=0){
        if(curr_thread->state==OS_THREAD_STATE_RUNNING && curr_thread->remain_ticks!=0){
            int cmp = os_priority_cmp(next_thread->curr_priority, curr_thread->curr_priority);
            if(cmp==OS_PRIORITY_CMP_HIGH){
//                printf("[sch] %s take over %s\n", next_thread->name, curr_thread->name);
                os_scheduler__ready_list_push(curr_thread, kOsSchedulerPushType_FRONT); /*放到最前面，同优先级情况下第一个调用*/
            }else{
                /*不运行*/
//                printf("[sch] skip %s\n",next_thread->name);
                os_scheduler__ready_list_push(next_thread, kOsSchedulerPushType_FRONT);
                /* 继续运行 */
                OS_SCHEDULER_UNLOCK();
                return OS_SCHEDULER_EINWORK;
            }
        }

        if(curr_thread->state!=OS_THREAD_STATE_RUNNING){
            if(curr_thread->state==OS_THREAD_STATE_YIELD){
                if(policy==OS_SCHEDULER_POLICY_PUSH_YIELD_BACK){
                    os_scheduler__ready_list_push(curr_thread, kOsSchedulerPushType_BACK);
                }else{
                    os_scheduler__ready_list_push(curr_thread, kOsSchedulerPushType_FRONT);
                }
            }
            os_scheduler__current_thread = 0;
        }
    }



    /*将 pending(没来得及调度) 的线程就绪*/
    head = &os_scheduler__pending_list;
    if(!OS_LIST_IS_EMPTY(head)){
        for(node = OS_LIST_NEXT(head); node!=head;){
            os_thread_t * thread = OS_CONTAINER_OF(node, os_thread_t, ready_node);
            node = OS_LIST_NEXT(node);
            OS_LIST_REMOVE(&thread->ready_node);
            os_scheduler__ready_list_push(thread, kOsSchedulerPushType_BACK);
        }
    }

    /*将 yield 的线程就绪*/
    head = &os_scheduler__yield_list;
    if(!OS_LIST_IS_EMPTY(head)){
        for(node = OS_LIST_NEXT(head); node!=head;){
            os_thread_t * thread = OS_CONTAINER_OF(node, os_thread_t, ready_node);
            node = OS_LIST_NEXT(node);
            OS_LIST_REMOVE(&thread->ready_node);
            os_scheduler__ready_list_push(thread, kOsSchedulerPushType_BACK);
        }
    }

    if(next_thread==0){
        next_thread = os_scheduler__pop_highest();
    }

    if(next_thread==0){
        printf("no next_thread!!!\n");
        OS_SCHEDULER_UNLOCK();
        return OS_SCHEDULER_ERROR;
    }

    next_thread->state = OS_THREAD_STATE_RUNNING;
    if(next_thread->remain_ticks==0){
        next_thread->remain_ticks = next_thread->init_ticks;
    }
    os_scheduler__current_thread = next_thread;
    os_scheduler__skipped = 0;

    OS_SCHEDULER_UNLOCK();


//    printf("switch from %s to %s\n", (curr_thread?curr_thread->name:"N/A"), next_thread->name);
    if(cpu_stack_is_switch_in_progress()){
        /* 上次的调度还没有完成 */
        os_scheduler__ready_list_push(next_thread, kOsSchedulerPushType_FRONT);
    }else{
        cpu_stack_switch((curr_thread==0)?0:&curr_thread->sp, &next_thread->sp);
    }

    return OS_SCHEDULER_EOK;
}

os_uint_t os_scheduler_skipped(void){
    return os_scheduler__skipped;
}

os_err_t os_scheduler_push_back(os_thread_t * thread)
{
    if(!thread) return OS_EINVAL;
    
    OS_SCHEDULER_LOCK();
    os_scheduler__ready_list_push(thread, kOsSchedulerPushType_BACK);
    OS_SCHEDULER_UNLOCK();

    return OS_SCHEDULER_EOK;
}

os_err_t os_scheduler_push_front(os_thread_t * thread){
    OS_SCHEDULER_LOCK();
    os_scheduler__ready_list_push(thread, kOsSchedulerPushType_FRONT);
    OS_SCHEDULER_UNLOCK();

    return OS_SCHEDULER_EOK;
}

os_err_t os_scheduler_suspend(os_thread_t * thread){
    OS_SCHEDULER_LOCK();
    thread->state = OS_THREAD_STATE_SUSPEND;
    thread->remain_ticks = 0;
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_REMOVE(&thread->wait_node);
    os_timer_remove(&thread->timer_node);
    OS_SCHEDULER_UNLOCK();
    return OS_SCHEDULER_EOK;
}

os_err_t os_scheduler_resume(os_thread_t * thread){
    return os_scheduler_push_back(thread);
}

os_err_t os_scheduler_yield(os_thread_t * thread)
{
    OS_SCHEDULER_LOCK();
    thread->state = OS_THREAD_STATE_YIELD;
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_INSERT_BEFORE(&os_scheduler__yield_list, &thread->ready_node);
    OS_SCHEDULER_UNLOCK();
    return OS_SCHEDULER_EOK;
}

os_thread_t* os_scheduler_current_thread(void)
{
    return os_scheduler__current_thread;
}

void os_scheduler_push(os_thread_t * thread)
{
    if(thread==0) return;

    OS_SCHEDULER_LOCK();
    if(os_interrupt_nest()>0U){
        os_scheduler_mark_skipped();
//        printf("[sch] pending %s\n", thread->name);
        os_scheduler__pending_list_push_back(thread);
    }else{
//        printf("[sch] ready %s\n", thread->name);
        os_scheduler__ready_list_push(thread, kOsSchedulerPushType_BACK);
    }
    OS_SCHEDULER_UNLOCK();
}

os_uint_t os_scheduler_get_current_tick(void)
{
    return os_scheduler__current_tick;
}

