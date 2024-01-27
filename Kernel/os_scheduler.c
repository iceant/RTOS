#include <os_scheduler.h>
#include <os_list.h>

////////////////////////////////////////////////////////////////////////////////
//// STATIC
static os_list_t os_scheduler__ready_table;
static os_thread_t * os_scheduler__current_thread;

////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_scheduler_init(void)
{
    OS_LIST_INIT(&os_scheduler__ready_table);
    os_scheduler__current_thread = 0;
    
    return OS_EOK;
}

os_err_t os_scheduler_schedule(void)
{
    return OS_EOK;
}

os_err_t os_scheduler_append_ready(os_thread_t* thread)
{
    OS_LIST_INSERT_BEFORE(&os_scheduler__ready_table, &thread->ready_node);
    thread->remain_ticks = thread->init_ticks;
    return OS_EOK;
}
