#include <os_scheduler.h>
#include <os_list.h>

////////////////////////////////////////////////////////////////////////////////
//// STATIC
static os_list_t os_scheduler__ready_table;


////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_scheduler_init(void)
{
    OS_LIST_INIT(&os_scheduler__ready_table);

    return OS_EOK;
}

os_err_t os_scheduler_schedule(void)
{
    return OS_EOK;
}

os_err_t os_scheduler_append_ready(os_thread_t* thread)
{
    OS_LIST_INSERT_BEFORE(&os_scheduler__ready_table, &thread->ready_node);
    return OS_EOK;
}
