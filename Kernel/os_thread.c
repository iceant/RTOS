#include <os_thread.h>
#include <string.h>
#include <os_macros.h>

////////////////////////////////////////////////////////////////////////////////
////
static void os_thread__exit(os_thread_t * thread){

}

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_thread_init(os_thread_t * thread
        , const char name[NAME_MAX_SIZE]
        , void (*thread_entry)(void*)
        , void* parameter
        , void* stack_addr
        , os_size_t stack_size
        , os_priority_t init_priority
        , os_tick_t init_ticks)
{
    size_t name_size = strlen(name);
    name_size = OS_MIN(name_size, NAME_MAX_SIZE-1);
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

    int err = cpu_stack_init(thread_entry, parameter, stack_addr, stack_size, &thread->sp);

    return err==0?OS_EOK:OS_ERROR;
}





