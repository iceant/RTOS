#include <os_scheduler.h>
#include <cpu.h>
////////////////////////////////////////////////////////////////////////////////
////


volatile os_thread_t*         os_scheduler__current_thread;
volatile os_size_t            os_scheduler__interrupt_nest;
volatile os_size_t            os_scheduler__lock_nest;
volatile os_bool_t            os_scheduler__need_schedule_flag;

static volatile os_priority_t os_scheduler__highest_priority;
static volatile os_thread_t*  os_scheduler__highest_thread;
static os_bool_t              os_scheduler__startup_flag;
static volatile os_size_t     os_scheduler__systick_ticks;

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_scheduler_init(void){
    os_scheduler__current_thread = 0;
    os_scheduler__interrupt_nest = 0;
    os_scheduler__lock_nest = 0;
    os_scheduler__highest_priority = 0;
    os_scheduler__highest_thread = 0;
    os_scheduler__startup_flag = OS_FALSE;
    os_scheduler__systick_ticks = 0;
    os_scheduler__need_schedule_flag = OS_FALSE;

    os_priority_init();
    os_readylist_init();
    return OS_ERR_OK;
}

os_err_t os_scheduler_schedule_in_thread(void)
{
    os_scheduler__current_thread->flag = OS_THREAD_FLAG_SCHEDULE;
    return OS_ERR_OK;
}

void os_scheduler_wait_for_schedule_in_thread(void){
    while(os_scheduler__current_thread->flag == OS_THREAD_FLAG_SCHEDULE);
}

os_err_t os_scheduler_systick(void)
{
    if(os_scheduler__startup_flag==OS_FALSE) return OS_SCHEDULER_ERR_NOT_START;

    cpu_interrupt_context_t ctx;
    cpu_interrupt_disable(&ctx);

    os_scheduler__systick_ticks++;

    if(os_scheduler__current_thread->flag == OS_THREAD_FLAG_SCHEDULE){
        os_scheduler__need_schedule_flag = OS_TRUE;
        os_scheduler__current_thread->flag = OS_THREAD_FLAG_NONE;
    }else if(os_scheduler__current_thread->state==OS_THREAD_STATE_RUNNING){
        os_scheduler__current_thread->remain_ticks--;
        if(os_scheduler__current_thread->remain_ticks==0){
            os_scheduler__current_thread->state = OS_THREAD_STATE_YIELD;
            os_scheduler__need_schedule_flag = OS_TRUE;
        }
    }

    if(os_timer_tick()==OS_TRUE){
        os_scheduler__need_schedule_flag = OS_TRUE;
    };

    cpu_interrupt_enable(&ctx);

    return OS_ERR_OK;
}

static void os_scheduler__timer_timeout(os_timer_t * timer, void* userdata){
    register os_thread_t* thread = OS_LIST_CONTAINER(timer, os_thread_t, timer_node);
    thread->error = OS_THREAD_ERROR_TIMEOUT;
    thread->state = OS_THREAD_STATE_TIMEWAIT_TIMEOUT;
    os_readylist_push_back(thread);
}

void os_scheduler_timed_wait(os_thread_t * thread, os_tick_t tick)
{
    thread->remain_ticks = 0;
    thread->state = OS_THREAD_STATE_TIMEWAIT;
    os_timer_add(&thread->timer_node, os_scheduler__timer_timeout, thread, tick, OS_TIMER_FLAG_ONCE);
    os_scheduler__need_schedule_flag = OS_TRUE;
}

os_err_t os_scheduler_readylist_push_back(os_thread_t * thread)
{
    thread->state = OS_THREAD_STATE_READY;
    thread->remain_ticks = thread->init_ticks;
    thread->error = 0;
    os_readylist_push_back(thread);
    return OS_ERR_OK;
}

os_err_t os_scheduler_readylist_push_front(os_thread_t * thread)
{
    thread->state = OS_THREAD_STATE_READY;
    thread->remain_ticks = thread->init_ticks;
    thread->error = 0;
    os_readylist_push_front(thread);
    return OS_ERR_OK;
}


/* 第一次启动调度 */
os_err_t os_scheduler_startup(void){
    if(os_scheduler__startup_flag==OS_TRUE){
        return OS_ERR_EAGAIN;
    }

    cpu_interrupt_context_t ctx;
    cpu_interrupt_disable(&ctx);

    os_scheduler__highest_priority = os_priority_highest();
    os_scheduler__highest_thread = os_readylist_pop(os_scheduler__highest_priority);
    os_scheduler__highest_thread->state = OS_THREAD_STATE_RUNNING;
    os_scheduler__highest_thread->remain_ticks = os_scheduler__highest_thread->init_ticks;
    os_scheduler__highest_thread->flag = OS_THREAD_FLAG_NONE;
    os_scheduler__current_thread = os_scheduler__highest_thread;
    os_scheduler__startup_flag = OS_TRUE;

    cpu_stack_switch(0,(void** )&os_scheduler__current_thread->sp);

    cpu_interrupt_enable(&ctx);

    return OS_ERR_OK;
}

/*
 调度：
 1. 按优先级查找可用的任务
 2. 检查当前任务如果处于让出状态，重新加入就绪表
 */
os_err_t os_scheduler_schedule(void)
{
    if(os_scheduler__startup_flag==OS_FALSE){
        return OS_SCHEDULER_ERR_NOT_START;
    }

    if(os_scheduler__need_schedule_flag==OS_FALSE){
        return OS_SCHEDULER_ERR_NO_NEED_SCHEDULE;
    }

    if(os_scheduler__interrupt_nest > 0u){
        return OS_SCHEDULER_ERR_IN_IRQ;
    }

    if(os_scheduler__lock_nest > 0u){
        return OS_SCHEDULER_ERR_LOCKED;
    }

    cpu_interrupt_context_t ctx;
    cpu_interrupt_disable(&ctx);

    if(os_scheduler__current_thread->state==OS_THREAD_STATE_RUNNING){
        cpu_interrupt_enable(&ctx);
        return OS_SCHEDULER_ERR_CURR_THREAD_RUNNING;
    }

    os_scheduler__highest_priority = os_priority_highest();
    os_scheduler__highest_thread = os_readylist_pop(os_scheduler__highest_priority);
    if(os_scheduler__highest_priority == OS_KERNEL_IDLE_THREAD_PRIORITY){
        os_readylist_push_back((os_thread_t*)os_scheduler__highest_thread);
    }
    
    if(os_scheduler__current_thread->state==OS_THREAD_STATE_YIELD){
        os_readylist_push_back((os_thread_t*)os_scheduler__current_thread);
    }
    
    if(os_scheduler__highest_thread == os_scheduler__current_thread){
        cpu_interrupt_enable(&ctx);
        return OS_SCHEDULER_ERR_NO_NEED_SCHEDULE;
    }

    void** from_stack_p = &os_scheduler__current_thread->sp;

    os_scheduler__highest_thread->state = OS_THREAD_STATE_RUNNING;
    os_scheduler__highest_thread->remain_ticks = os_scheduler__highest_thread->init_ticks;
    os_scheduler__highest_thread->flag = OS_THREAD_FLAG_NONE;
    
    cpu_stack_switch((void** )from_stack_p,(void** )&os_scheduler__highest_thread->sp);

    os_scheduler__current_thread = os_scheduler__highest_thread;
    os_scheduler__need_schedule_flag = OS_FALSE;

    cpu_interrupt_enable(&ctx);

    return OS_ERR_OK;
}

os_err_t os_scheduler_resume(os_thread_t * thread)
{
    os_readylist_push_back(thread);
    return os_scheduler_schedule();
}

os_err_t os_scheduler_detach(os_thread_t * thread)
{
    if(!thread) return OS_ERR_ERROR;

    os_readylist_remove(thread);

    if(thread->exit){
        thread->exit(thread);
    }

    return OS_ERR_OK;
}

os_err_t os_scheduler_yield(os_thread_t * thread)
{
    thread->state = OS_THREAD_STATE_YIELD;
    os_scheduler__need_schedule_flag = OS_TRUE;
    return OS_ERR_OK;
}