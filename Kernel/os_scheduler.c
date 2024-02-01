#include <os_scheduler.h>
#include <os_list.h>
#include <cpu.h>
#include <os_priority.h>
#include <os_macros.h>
#include <os_interrupt.h>
#include <os_timer.h>

#include <string.h>
#include <stdio.h>
#include <assert.h>

////////////////////////////////////////////////////////////////////////////////
//// STATIC
static os_list_t os_scheduler__ready_table[OS_PRIORITY_MAX];
static os_thread_t * os_scheduler__current_thread = 0;
static os_size_t os_scheduler__tick_count=0;
//static os_bool_t os_scheduler__schedule_flag = false;

////////////////////////////////////////////////////////////////////////////////
//// STATIC METHODS
static void os_scheduler__on_tick(void)
{
    os_thread_t * curr_thread;
    bool need_schedule_flag = false;
    
    os_interrupt_enter();
    
    register cpu_uintptr_t level = cpu_interrupt_disable();
    {
        os_scheduler__tick_count++;
//        printf("tick: %d\n", os_scheduler__tick_count);
        curr_thread = os_scheduler__current_thread;
        
        if(curr_thread->state==OS_THREAD_STATE_RUNNING){
            curr_thread->remain_ticks--;
            if(curr_thread->remain_ticks<=0){
                need_schedule_flag = true;
                curr_thread->state = OS_THREAD_STATE_YIELD;
            }
        }
    }
    cpu_interrupt_enable(level);
    
    need_schedule_flag = os_timer_tick();
    
    if(need_schedule_flag){
        os_scheduler_schedule();
    }
    
    os_interrupt_leave();
}

////////////////////////////////////////////////////////////////////////////////
//// Ready Table

os_err_t os_scheduler__ready_table_next(os_thread_t** thread){

    os_priority_t priority;
    os_list_node_t * head;
    os_list_node_t * node;

    register cpu_uintptr_t level = cpu_interrupt_disable();
    priority = os_priority_get_highest();
    cpu_interrupt_enable(level);

    if(priority==0){
        if(thread){
            *thread = NULL;
        }
        return OS_EEMPTY;
    }

    level = cpu_interrupt_disable();
    {
        head = &os_scheduler__ready_table[priority];
        node = OS_LIST_NEXT(head);
        if(priority!=OS_PRIORITY_MAX-1){
            OS_LIST_REMOVE(node);
            if(OS_LIST_IS_EMPTY(head)){
                os_priority_unmark(priority);
            }
        }
        
        if(thread){
            *thread = OS_CONTAINER_OF(node, os_thread_t, ready_node);
        }
    }
    cpu_interrupt_enable(level);

    return OS_EOK;
}


////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_scheduler_init(void)
{
    int i;
    for(i=0; i<OS_PRIORITY_MAX; i++){
        OS_LIST_INIT(&os_scheduler__ready_table[i]);
    }
    os_scheduler__current_thread = 0;

    os_priority_init();
    
    cpu_set_tick_handler(os_scheduler__on_tick);

    return OS_EOK;
}


os_err_t os_scheduler_schedule(void)
{
    cpu_uintptr_t level;
    os_thread_t * curr_thread;
    os_thread_t * next_thread;
    void** curr_stack_p = 0;
    void** next_stack_p = 0;
    
    assert(os_interrupt_nested()<2);
    
    level = cpu_interrupt_disable();
    curr_thread = os_scheduler__current_thread;
    cpu_interrupt_enable(level);

    /*线程的时间片还没有用完，继续*/
    if(curr_thread!=0 && ((curr_thread->state == OS_THREAD_STATE_RUNNING) && curr_thread->remain_ticks>0)){
        return OS_ERROR;
    }

    /*取出下一个任务*/
    os_err_t  err = os_scheduler__ready_table_next(&next_thread);
    if(err!=OS_EOK){
        return err;
    }

    if(curr_thread==0){
        /* first time schedule */
        curr_stack_p = 0;
        next_stack_p = &next_thread->sp;
    }else{
        curr_stack_p = &curr_thread->sp;
        next_stack_p = &next_thread->sp;
        if(curr_thread->state==OS_THREAD_STATE_YIELD){
            os_scheduler_push_back(curr_thread);
        }
    }
    
    next_thread->state = OS_THREAD_STATE_RUNNING;
    level = cpu_interrupt_disable();
    os_scheduler__current_thread = next_thread;
    cpu_interrupt_enable(level);
    
    if(cpu_stack_switch(curr_stack_p, next_stack_p)!=0){
        /*没有被调度，加入就绪表，下次调度*/
        os_scheduler_push_front(next_thread);  /*下次调度优先调度这个任务*/
    }

    return OS_EOK;
}

os_err_t os_scheduler_push_back(os_thread_t* thread)
{
    register cpu_uintptr_t level = cpu_interrupt_disable();
    {
        OS_LIST_INSERT_BEFORE(&os_scheduler__ready_table[thread->curr_priority], &thread->ready_node);
        thread->remain_ticks = thread->init_ticks;
        thread->state = OS_THREAD_STATE_READY;
        os_priority_mark(thread->curr_priority);
    }
    cpu_interrupt_enable(level);

    return OS_EOK;
}

os_err_t os_scheduler_push_front(os_thread_t* thread)
{
    register cpu_uintptr_t level = cpu_interrupt_disable();
    {
        OS_LIST_INSERT_AFTER(&os_scheduler__ready_table[thread->curr_priority], &thread->ready_node);
        thread->remain_ticks = thread->init_ticks;
        thread->state = OS_THREAD_STATE_READY;
        os_priority_mark(thread->curr_priority);
    }
    cpu_interrupt_enable(level);
    
    return OS_EOK;
}

os_thread_t * os_scheduler_current_thread(void)
{
    return os_scheduler__current_thread;
}

os_err_t os_scheduler_remove(os_thread_t* thread)
{
    assert(thread);
    
    os_thread_t * curr_thread = thread;
    os_list_node_t *head = &os_scheduler__ready_table[curr_thread->curr_priority];
    register cpu_uintptr_t level = cpu_interrupt_disable();
    {
        OS_LIST_REMOVE(&curr_thread->ready_node);
        if(OS_LIST_IS_EMPTY(head)){
            os_priority_unmark(curr_thread->curr_priority);
        }
    }
    cpu_interrupt_enable(level);
    return OS_EOK;
}

////////////////////////////////////////////////////////////////////////////////
////

static void os_scheduler__timeout(os_time_t time, void* userdata){
    os_thread_t* thread = (os_thread_t*)userdata;
    os_scheduler_push_back(thread);
}

os_err_t os_scheduler_timed_wait(os_thread_t* thread, os_tick_t tick){
    
    register cpu_uintptr_t level = cpu_interrupt_disable();
    thread->state = OS_THREAD_STATE_WAIT;
    cpu_interrupt_enable(level);
    
    os_err_t err = os_timer_add(&thread->timer_node, os_scheduler__timeout, thread, tick);
    if(err!=OS_EOK){
        return err;
    }

    
    return os_scheduler_schedule();
}

