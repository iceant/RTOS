#include <os_thread.h>
#include <os_memory.h>
#include <os_macros.h>
#include <os_scheduler.h>
#include <cpu.h>
#include <os_critical.h>
////////////////////////////////////////////////////////////////////////////////
////
static void os_thread_on_exit(void){
    os_critical_enter();
    os_thread_t* self = os_thread_self();
    if(self->exit){
        self->exit(self);
    }
    os_critical_leave();

    os_scheduler_detach(self);
}

////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_thread_init(os_thread_t * thread, const char* name
        , os_thread_entry_t entry, void* parameter
        , void* stack_address, os_size_t stack_size
        , os_priority_t init_priority
        , os_tick_t init_ticks, void* userdata)
{
    thread->thread_entry = entry;
    thread->parameter = parameter;
    thread->stack_address = stack_address;
    thread->stack_size = stack_size;
    thread->init_priority = init_priority;
    thread->current_priority = init_priority;
    thread->init_ticks = init_ticks;
    thread->remain_ticks = init_ticks;
    thread->userdata = userdata;
    thread->flag = OS_THREAD_FLAG_NONE;

    OS_LIST_INIT(&thread->ready_node);
    OS_LIST_INIT(&thread->pend_node);
    os_timer_node_init(&thread->timer_node);

    os_size_t name_size = strlen(name);
    name_size = OS_MIN(name_size, OS_KERNEL_NAME_SIZE-2);
    memcpy(thread->name, name, name_size);
    thread->name[name_size+1]='\0';

    thread->state = OS_THREAD_STATE_SUSPEND;
    thread->error = OS_THREAD_ERROR_OK;
    thread->exit = 0;
    
    cpu_stack_init(entry, parameter, stack_address, stack_size
                   , os_thread_on_exit
                   , &thread->sp);

    return OS_ERR_OK;
}

os_err_t os_thread_startup(os_thread_t * thread)
{
    return os_thread_resume(thread);
}

os_err_t os_thread_resume(os_thread_t * thread){
    return os_scheduler_resume(thread);
}

os_thread_t * os_thread_self(void){
    return (os_thread_t * )os_scheduler_current_thread();
}

void os_thread_delay(os_tick_t ticks)
{
    OS_SCHEDULER_LOCK_VARIABLE();
    OS_SCHEDULER_LOCK();
    os_scheduler_timed_wait((os_thread_t*)os_scheduler__current_thread, ticks);
    OS_SCHEDULER_UNLOCK();
    
    os_err_t error = OS_ERR_OK;
    do{
        os_scheduler_schedule_in_thread(&error);
        if(error!=OS_ERR_OK){
            printf("[os_thread] %s, err:%x\n", __FUNCTION__ , error);
        }
    }while(error!=OS_ERR_OK);
}

void os_thread_mdelay(os_int_t ms){
    os_thread_delay(os_tick_from_milliseconds(ms));
}

os_err_t os_thread_yield(void)
{
    return os_scheduler_yield(os_scheduler__current_thread);
}

