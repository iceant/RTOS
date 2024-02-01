#include <os_thread.h>
#include <string.h>
#include <os_macros.h>
#include <os_memory.h>
#include <assert.h>
#include <os_scheduler.h>
////////////////////////////////////////////////////////////////////////////////
////
static void os_thread__exit(os_thread_t * thread){
    if(thread->state==OS_THREAD_STATE_EXIT) return;
    thread->state = OS_THREAD_STATE_EXIT;
    thread->remain_ticks = 0;
    thread->curr_priority = OS_PRIORITY_MAX;
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_REMOVE(&thread->wait_node);
}

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_thread_init(os_thread_t * thread
        , const char name[OS_NAME_MAX_SIZE]
        , void (*thread_entry)(void*)
        , void* parameter
        , void* stack_addr
        , os_size_t stack_size
        , os_priority_t init_priority
        , os_tick_t init_ticks)
{
    size_t name_size = strlen(name);
    name_size = OS_MIN(name_size, OS_NAME_MAX_SIZE-1);
    memcpy(thread->name, name, name_size);
    thread->name[name_size]='\0';

    thread->thread_entry = thread_entry;
    thread->parameter = parameter;
    thread->stack_addr = stack_addr;
    thread->stack_size = stack_size;
    thread->init_priority = init_priority;
    thread->init_ticks = init_ticks;
    thread->remain_ticks = init_ticks;
    thread->curr_priority = init_priority;
    thread->thread_exit = os_thread__exit;
    OS_LIST_INIT(&thread->ready_node);
    OS_LIST_INIT(&thread->wait_node);
    OS_LIST_INIT(&thread->timer_node.node);
    
    thread->state = OS_THREAD_STATE_IDLE;
    
    int err = cpu_stack_init(thread_entry, parameter, stack_addr, stack_size, &thread->sp);

    return err==0?OS_EOK:OS_ERROR;
}


os_err_t os_thread_startup(os_thread_t * thread)
{
    assert(thread);

    return os_scheduler_push_back(thread);
}

os_thread_t* os_thread_self(void)
{
    return os_scheduler_current_thread();
}

os_err_t os_thread_suspend(os_thread_t * thread)
{
    os_scheduler_remove(thread);
    OS_LIST_REMOVE(&thread->wait_node);
    thread->state = OS_THREAD_STATE_SUSPENDED;
    return OS_EOK;
}

os_err_t os_thread_resume(os_thread_t* thread){
    return os_scheduler_push_back(thread);
}


os_err_t os_thread_exit(os_thread_t * thread)
{
    thread->thread_exit(thread);
    return OS_EOK;
}

void os_thread_sleep(os_tick_t tick)
{
    os_scheduler_timed_wait(os_thread_self(), tick);
}

void os_thread_mdelay(os_size_t ms)
{
    os_scheduler_timed_wait(os_thread_self(), os_tick_from_millisecond(ms));
}
