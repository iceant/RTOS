#include <os_thread.h>
#include <os_scheduler.h>
#include <string.h>
#include <os_macros.h>
#include <os_list.h>
#include <cpu_stack.h>
#include <stdio.h>

////////////////////////////////////////////////////////////////////////////////
////
static void os_thread__exit(os_thread_t * thread){
    thread->state = OS_THREAD_STATE_EXIT;
    thread->remain_ticks = 0;
    thread->curr_priority = OS_PRIORITY_MAX-1;
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_REMOVE(&thread->wait_node);
    OS_LIST_REMOVE(&thread->timer_node.wait_node);
}

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_thread_init(os_thread_t* thread, const char* name
        , os_thread_entry_t entry, void* parameter
        , void* stack_address, os_size_t stack_size
        , os_priority_t init_priority
        , os_tick_t init_ticks)
{
    if(name){
        os_size_t name_size = strlen(name);
        name_size = OS_MIN(name_size, OS_NAME_SIZE-1);
//        printf("name_size:%d\r\n", name_size);
        memcpy(thread->name, name, name_size);
        thread->name[name_size]='\0';
    }

    OS_LIST_INIT(&thread->ready_node);
    OS_LIST_INIT(&thread->wait_node);
    os_timer_node_init(&thread->timer_node);

    thread->thread_entry = entry;
    thread->parameter = parameter;
    thread->stack_addr = stack_address;
    thread->stack_size = stack_size;
    thread->init_priority = init_priority;
    thread->curr_priority = init_priority;
    thread->init_ticks = init_ticks;
    thread->remain_ticks = init_ticks;
    thread->state = OS_THREAD_STATE_SUSPEND;
    thread->error = OS_THREAD_ERROR_OK;
    thread->exit_function = os_thread__exit;

    cpu_stack_init(entry, parameter, stack_address, stack_size, &thread->sp);

    return OS_EOK;
}

os_err_t os_thread_startup(os_thread_t * thread){
    os_scheduler_push_back(thread);
    return os_scheduler_schedule(OS_SCHEDULER_POLICY_PUSH_YIELD_BACK);
}

os_err_t os_thread_suspend(os_thread_t * thread){
    os_scheduler_suspend(thread);
    return os_scheduler_schedule(OS_SCHEDULER_POLICY_PUSH_YIELD_BACK);
}

os_err_t os_thread_resume(os_thread_t * thread)
{
    os_scheduler_resume(thread);
    return os_scheduler_schedule(OS_SCHEDULER_POLICY_PUSH_YIELD_BACK);
}

os_err_t os_thread_join(os_thread_t * thread){
    return OS_EOK;
}

os_err_t os_thread_yield(void){
    os_scheduler_yield(os_thread_self());
    return OS_SCHEDULER_SCHEDULE_YIELD_BACK();
}

os_thread_t* os_thread_self(void){
    return os_scheduler_current_thread();
}

os_err_t os_thread_exit(void){
    os_scheduler_exit(os_thread_self());
    return OS_EOK;
}

os_err_t os_thread_delay(os_tick_t ticks){
    os_thread_t* curr_thread = os_scheduler_current_thread();
    os_scheduler_timed_wait(curr_thread, ticks);
    return OS_SCHEDULER_SCHEDULE_YIELD_BACK();
}

os_err_t os_thread_mdelay(uint32_t milliseconds){
    return os_thread_delay(os_tick_from_millisecond(milliseconds));
}

