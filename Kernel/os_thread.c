#include <os_thread.h>
#include <os_memory.h>
#include <cpu.h>
#include <os_macros.h>
#include <os_scheduler.h>
#include <cpu_kernel_functions.h>
#include <os_kernel_lock.h>
/* -------------------------------------------------------------------------------------------------------------- */

extern os_err_t os_kernel_schedule(void);
extern os_err_t os_scheduler_thread_exit(os_thread_t * thread);

static void os_thread__on_exit(){
    os_thread_t* thread = os_thread_self();
    os_scheduler_thread_exit(thread);
    os_kernel_schedule();
}


/* -------------------------------------------------------------------------------------------------------------- */


os_err_t os_thread_init(os_thread_t* thread
        , const char* name
        , os_thread_entry_t start_entry
        , void* parameter
        , uint8_t* stack_address
        , os_size_t stack_size
        , uint8_t* stack_limit
        , os_tick_t init_ticks
        , os_priority_t init_priority
        , os_thread_exit_t exit_function
        , void* userdata
)
{
    thread->start_entry = start_entry;
    thread->parameter = parameter;
    OS_LIST_INIT(&thread->ready_node);
    OS_LIST_INIT(&thread->pend_node);
    os_timer_init(&thread->timer_node, 0, 0, thread, 0);
    thread->stack_address = stack_address;
    thread->stack_size = stack_size;
    thread->init_ticks = init_ticks;
    thread->remain_ticks = init_ticks;
    thread->init_priority = init_priority;
    thread->current_priority = init_priority;
    thread->exit_function = exit_function;
    thread->state = OS_THREAD_STATE_SUSPEND;
    thread->flag = OS_THREAD_FLAG_CREATE_INIT;
    thread->error = OS_THREAD_ERR_OK;
    thread->userdata = userdata;


    if(name){
        os_size_t name_size = strlen(name);
        name_size = (name_size > (OS_NAME_MAX_SIZE-1))?(OS_NAME_MAX_SIZE-1):name_size;
        memcpy(thread->name, name, name_size);
        thread->name[name_size] = '\0';
    }else{
        thread->name[0] = '\0';
    }


    cpu_err_t err = cpu_stack_init(start_entry, parameter, stack_address, stack_limit, stack_size, os_thread__on_exit, (uint8_t **)&thread->sp);

    return (err==CPU_STACK_OK)?OS_ERR_OK:OS_ERR_ERROR;
}


os_thread_t * os_thread_create(const char* name
        , os_thread_entry_t start_entry
        , void* parameter
        , uint8_t* stack_address
        , os_size_t stack_size
        , uint8_t* stack_limit
        , os_tick_t init_ticks
        , os_priority_t init_priority
        , os_thread_exit_t exit_function
        , void* userdata)
{
    os_thread_t* thread_p;
    OS_NEW(thread_p);
    if(!thread_p) return 0;

    os_err_t err = os_thread_init(thread_p, name, start_entry, parameter, stack_address, stack_size, stack_limit
            , init_ticks, init_priority, exit_function, userdata);

    if(err!=OS_ERR_OK){
        OS_FREE(thread_p);
        return 0;
    }

    thread_p->flag = OS_THREAD_FLAG_CREATE_NEW;
    return thread_p;
}

os_err_t os_thread_startup(os_thread_t* thread)
{
    return os_thread_resume(thread);
}

os_err_t os_thread_suspend(os_thread_t* thread){
    thread->state = OS_THREAD_STATE_SUSPEND;
    thread->remain_ticks = 0;
    return os_kernel_schedule();
}

os_err_t os_thread_resume(os_thread_t* thread){
    if(cpu_in_privilege()){
        os_err_t error = os_scheduler_resume(thread);
        if(error==OS_SCHEDULER_ERR_IRQ_NEST){
            os_scheduler__need_schedule = OS_TRUE;
        }
        return error;
    }else{
        return cpu_kernel_thread_resume(thread);
    }
}

os_err_t os_thread_yield(){
    return cpu_kernel_thread_yield(os_thread_self());
}

os_err_t os_thread_delay(os_tick_t ticks)
{
    return cpu_kernel_thread_delay(os_thread_self(), ticks);
}

os_err_t os_thread_mdelay(os_size_t milliseconds){
    return os_thread_delay(os_tick_from_millisecond(milliseconds));
}

os_err_t os_thread_join(os_thread_t* thread);

os_err_t os_thread_detach(os_thread_t* thread);

os_thread_t * os_thread_self(void){
    return os_scheduler__current_thread_p;
}


