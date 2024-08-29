#include <os_scheduler.h>
#include <cpu.h>
#include <stdio.h>
#include <os_critical.h>
////////////////////////////////////////////////////////////////////////////////
////


volatile os_thread_t*         os_scheduler__current_thread;
volatile os_size_t            os_scheduler__interrupt_nest;
volatile os_size_t            os_scheduler__lock_nest;
volatile os_bool_t            os_scheduler__need_schedule_flag;
volatile os_size_t            os_scheduler__systick_ticks;

static volatile os_priority_t os_scheduler__highest_priority;
static volatile os_thread_t*  os_scheduler__highest_thread;
static volatile os_bool_t              os_scheduler__startup_flag;
static volatile void**                 os_scheduler__from_stack_p;
static volatile os_bool_t              os_scheduler__wip_flag;

static volatile os_list_t              os_scheduler__delay_list;
////////////////////////////////////////////////////////////////////////////////
////

#define OS_SCHEDULER_MARK_NEED_SCHEDULE()       (os_scheduler__need_schedule_flag = OS_TRUE)
#define OS_SCHEDULER_IS_NEED_SCHEDULE()         (os_scheduler__need_schedule_flag == OS_TRUE)
#define OS_SCHEDULER_UNMARK_NEED_SCHEDULE()     (os_scheduler__need_schedule_flag = OS_FALSE)

#define OS_SCHEDULER_METHOD_PRIVILEGE       0
#define OS_SCHEDULER_METHOD_NO_PRIVILEGE    1

////////////////////////////////////////////////////////////////////////////////
////

static void os_scheduler__scheduler_callback(void){
    os_scheduler__highest_thread->state = OS_THREAD_STATE_RUNNING;
    os_scheduler__highest_thread->remain_ticks = os_scheduler__highest_thread->init_ticks;
    os_scheduler__highest_thread->flag = OS_THREAD_FLAG_READY;
    os_scheduler__highest_thread->error = OS_THREAD_ERROR_OK;
    
    OS_SCHEDULER_UNMARK_NEED_SCHEDULE();
    os_scheduler__current_thread = os_scheduler__highest_thread;
    
    os_scheduler__wip_flag = OS_FALSE; /* 最后 */
}

void os_scheduler__schedule(int method, os_err_t * error){
    OS_SCHEDULER_LOCK_VARIABLE();
    
    if(os_scheduler__startup_flag==OS_FALSE){
        *error = OS_SCHEDULER_ERR_NOT_START;
        return;
    }
    
    OS_SCHEDULER_LOCK();
    
    if(os_scheduler__wip_flag==OS_TRUE){
        *error = OS_SCHEDULER_ERR_WIP;
        OS_SCHEDULER_UNLOCK();
        /*调度在工作中，不要重复调度*/
        return;
    }
    os_scheduler__wip_flag = OS_TRUE;
    
    if(os_scheduler__interrupt_nest > 0u ){
        /*在中断中，不要调度*/
        os_scheduler__wip_flag = OS_FALSE;
        *error = OS_SCHEDULER_ERR_IN_IRQ;
        OS_SCHEDULER_UNLOCK();
        /* 中断嵌套中，不允许调度 */
        return;
    }

    if(os_scheduler__lock_nest > 0u){
        /* 调度锁定中，不允许调度 */
        os_scheduler__wip_flag = OS_FALSE;
        *error = OS_SCHEDULER_ERR_LOCKED;
        OS_SCHEDULER_UNLOCK();
        return;
    }
    
    if(os_scheduler__current_thread->state==OS_THREAD_STATE_RUNNING){
        /*当前线程运行中*/
        os_scheduler__wip_flag = OS_FALSE;
        *error = OS_SCHEDULER_ERR_CURR_THREAD_RUNNING;
        OS_SCHEDULER_UNLOCK();
        return;
    }
    
    /* 按优先级获取下一个要运行的任务 */
    os_scheduler__highest_priority = os_priority_highest();
    os_scheduler__highest_thread = os_readylist_pop(os_scheduler__highest_priority);
    if(os_scheduler__highest_thread == NULL){
        /* 怎么会出现这种情况？？？  */
        os_scheduler__wip_flag = OS_FALSE;
        *error = OS_SCHEDULER_ERR_NULL_NEXT_THREAD;
        OS_SCHEDULER_UNLOCK();
        return;
    }
    
    if(os_scheduler__highest_priority == OS_KERNEL_IDLE_THREAD_PRIORITY){
        /* idle 任务永远就绪 */
        os_readylist_push_back((os_thread_t*)os_scheduler__highest_thread);
    }
    
    os_list_node_t * delay_node=0;
    os_thread_t* delay_thread = 0;
    
    /* 因为调度而被延迟的任务，重新加入就绪表中 */
    for(delay_node = OS_LIST_NEXT(&os_scheduler__delay_list); delay_node!=&os_scheduler__delay_list; ){
        delay_thread = OS_LIST_CONTAINER(delay_node, os_thread_t, ready_node);
        delay_node = OS_LIST_NEXT(delay_node);
//        OS_LIST_REMOVE((os_list_node_t *)&delay_thread->ready_node);
        os_scheduler_readylist_push_back(delay_thread);
    }
    
//    os_scheduler__from_stack_p = (volatile void**)&os_scheduler__current_thread->sp;
    
    /* 请求执行切换 */
    if(method==OS_SCHEDULER_METHOD_PRIVILEGE){
        if(cpu_stack_switch((void** )&os_scheduler__current_thread->sp
                         ,(void** )&os_scheduler__highest_thread->sp, os_scheduler__scheduler_callback)!=0){
            /* 没调度成功，放回就绪表 */
            os_scheduler_readylist_push_front((os_thread_t*)os_scheduler__highest_thread);
            *error = OS_SCHEDULER_ERR_BUSY;
        }else{
            *error = OS_ERR_OK;
        }
        OS_SCHEDULER_UNLOCK();
    }else if(method==OS_SCHEDULER_METHOD_NO_PRIVILEGE){
        int err = cpu_svc_context_switch((void** )&os_scheduler__current_thread->sp
                               ,(void** )&os_scheduler__highest_thread->sp, os_scheduler__scheduler_callback);
        if(err!=0){
            /* 没调度成功，放回就绪表 */
            os_scheduler_readylist_push_front((os_thread_t*)os_scheduler__highest_thread);
            *error = OS_SCHEDULER_ERR_BUSY;
        }else{
            *error = OS_ERR_OK;
        }
        OS_SCHEDULER_UNLOCK();
    }
}


////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_scheduler_init(void){
    os_scheduler__current_thread = 0;
    os_scheduler__interrupt_nest = 0;
    os_scheduler__lock_nest = 0;
    os_scheduler__need_schedule_flag = OS_FALSE;
    os_scheduler__systick_ticks = 0;
    
    os_scheduler__highest_priority = 0;
    os_scheduler__highest_thread = 0;
    os_scheduler__startup_flag = OS_FALSE;
    os_scheduler__from_stack_p = 0;
    
    OS_LIST_INIT((os_list_t *)&os_scheduler__delay_list);
    
#if defined(OS_SCHEDULER_USE_SPINLOCK)
    cpu_spinlock_init(&os_scheduler__lock);
#endif

    os_priority_init();
    os_readylist_init();
    return OS_ERR_OK;
}

void os_scheduler_push_back_to_delay_list(volatile os_thread_t * thread){
    OS_LIST_REMOVE((os_list_node_t*)&thread->ready_node);
    OS_LIST_INSERT_BEFORE((os_list_t *)&os_scheduler__delay_list, (os_list_node_t*)&thread->ready_node);
}

os_bool_t os_scheduler_has_delay_task(void){
    return OS_LIST_IS_EMPTY(&os_scheduler__delay_list)?OS_FALSE:OS_TRUE;
}

void os_scheduler_schedule_in_thread(os_err_t* error)
{
    os_scheduler__need_schedule_flag = OS_TRUE;
    os_scheduler__schedule(OS_SCHEDULER_METHOD_NO_PRIVILEGE, error);
}

os_err_t os_scheduler_systick(void)
{
    if(os_scheduler__startup_flag==OS_FALSE) return OS_SCHEDULER_ERR_NOT_START;
    
    if(os_scheduler_disabled()) return OS_SCHEDULER_ERR_LOCKED;

    OS_SCHEDULER_LOCK_VARIABLE();
    OS_SCHEDULER_LOCK();

    os_scheduler__systick_ticks++;

    if(os_scheduler__current_thread->state==OS_THREAD_STATE_RUNNING){
        if(os_scheduler__current_thread->remain_ticks>0){
            os_scheduler__current_thread->remain_ticks--;
        }
        if(os_scheduler__current_thread->remain_ticks==0){
            os_scheduler__current_thread->state = OS_THREAD_STATE_YIELD;
            os_scheduler_push_back_to_delay_list((os_thread_t*)os_scheduler__current_thread);
            os_scheduler__need_schedule_flag = OS_TRUE;
        }
    }else{
        os_scheduler__need_schedule_flag = OS_TRUE;
    }

    if(os_timer_tick()==OS_TRUE){
        os_scheduler__need_schedule_flag = OS_TRUE;
    };

    OS_SCHEDULER_UNLOCK();

    return OS_ERR_OK;
}

static void os_scheduler__timer_timeout(os_timer_t * timer, void* userdata){
    os_thread_t* thread = OS_LIST_CONTAINER(timer, os_thread_t, timer_node);
    thread->error = OS_THREAD_ERROR_TIMEOUT;
    os_scheduler_readylist_push_back(thread);
    os_scheduler__need_schedule_flag = OS_TRUE;
}

void os_scheduler_timed_wait(os_thread_t * thread, os_tick_t tick)
{
    OS_SCHEDULER_LOCK_VARIABLE();
    
    OS_SCHEDULER_LOCK();
    thread->remain_ticks = 0;
    thread->state = OS_THREAD_STATE_TIMEWAIT;
    os_timer_add(&thread->timer_node, os_scheduler__timer_timeout, thread, tick, OS_TIMER_FLAG_ONCE);
    OS_SCHEDULER_UNLOCK();
}

os_err_t os_scheduler_readylist_push_back(os_thread_t * thread)
{
    os_err_t err = os_readylist_push_back(thread);
    thread->state = OS_THREAD_STATE_READY;
    thread->remain_ticks = thread->init_ticks;
    thread->error = OS_THREAD_ERROR_OK;
    thread->flag = OS_THREAD_FLAG_NONE;
    return err;
}

os_err_t os_scheduler_readylist_push_front(os_thread_t * thread)
{
    os_err_t err = os_readylist_push_front(thread);
    thread->state = OS_THREAD_STATE_READY;
    thread->remain_ticks = thread->init_ticks;
    thread->error = 0;
    thread->flag = OS_THREAD_FLAG_NONE;
    return OS_ERR_OK;
    return err;
}


/* 第一次启动调度 */
os_err_t os_scheduler_startup(void){
    if(os_scheduler__startup_flag==OS_TRUE){
        return OS_ERR_EAGAIN;
    }

    OS_SCHEDULER_LOCK_VARIABLE();
    OS_SCHEDULER_LOCK();

    os_scheduler__highest_priority = os_priority_highest();
    os_scheduler__highest_thread = os_readylist_pop(os_scheduler__highest_priority);
    os_scheduler__startup_flag = OS_TRUE;

    OS_SCHEDULER_UNLOCK();
    cpu_svc_context_switch(0,(void** )&os_scheduler__highest_thread->sp, os_scheduler__scheduler_callback);

    return OS_ERR_OK;
}

/*
 调度：
 1. 按优先级查找可用的任务
 2. 检查当前任务如果处于让出状态，重新加入就绪表
 */
void os_scheduler_schedule(os_err_t * error)
{
    os_scheduler__need_schedule_flag = OS_TRUE;
    os_scheduler__schedule(OS_SCHEDULER_METHOD_PRIVILEGE, error);
}

os_err_t os_scheduler_resume(os_thread_t * thread)
{
    os_err_t  error = OS_ERR_OK;
    
    OS_SCHEDULER_LOCK_VARIABLE();
    OS_SCHEDULER_LOCK();
    os_scheduler_readylist_push_back(thread);
    OS_SCHEDULER_UNLOCK();
    
    os_scheduler_schedule_in_thread(&error);
    return error;
}

os_err_t os_scheduler_yield(volatile os_thread_t * thread)
{
    OS_SCHEDULER_LOCK_VARIABLE();
    os_err_t error = OS_ERR_OK;
    
    OS_SCHEDULER_LOCK();
    thread->state = OS_THREAD_STATE_YIELD;
    OS_LIST_REMOVE((os_list_node_t*)&thread->ready_node);
    OS_LIST_INSERT_BEFORE((os_list_t *)&os_scheduler__delay_list, (os_list_node_t*)&thread->ready_node);
    thread->remain_ticks = 0;
    thread->flag = OS_THREAD_FLAG_SCHEDULE;
    os_scheduler_schedule_in_thread(&error);
    OS_SCHEDULER_UNLOCK();
    return error;
}

os_err_t os_scheduler_mark_need_schedule(os_thread_t* thread){
    OS_SCHEDULER_LOCK_VARIABLE();
    OS_SCHEDULER_LOCK();
    thread->flag = OS_THREAD_FLAG_SCHEDULE;
    thread->remain_ticks = 1;
    OS_SCHEDULER_UNLOCK();
    
    return OS_ERR_OK;
}

os_err_t os_scheduler_suspend(os_thread_t * thread)
{
    OS_SCHEDULER_LOCK_VARIABLE();
    OS_SCHEDULER_LOCK();
    
    thread->flag = OS_THREAD_FLAG_SCHEDULE;
    thread->remain_ticks = 1;
    thread->state = OS_THREAD_STATE_SUSPEND;
    
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_REMOVE(&thread->pend_node);
    os_timer_remove(&thread->timer_node);
    
    OS_SCHEDULER_UNLOCK();
    
    return OS_ERR_OK;
}

os_err_t os_scheduler_detach(os_thread_t* thread)
{
    os_err_t error = OS_ERR_OK;
    
    OS_SCHEDULER_LOCK_VARIABLE();
    OS_SCHEDULER_LOCK();
    
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_REMOVE(&thread->pend_node);
    os_timer_remove(&thread->timer_node);
    
    thread->flag = OS_THREAD_FLAG_SCHEDULE;
    thread->state = OS_THREAD_STATE_DETACHED;
    
    OS_SCHEDULER_UNLOCK();
    
    do{
        os_scheduler__schedule(OS_SCHEDULER_METHOD_NO_PRIVILEGE, &error);
        if(error!=OS_ERR_OK){
            printf("[os_scheduler] %s, err:%x\n", __FUNCTION__ , error);
        }
    } while (error!=OS_ERR_OK);
    return error;
}
