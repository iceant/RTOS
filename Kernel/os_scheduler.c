#include <os_scheduler.h>

////////////////////////////////////////////////////////////////////////////////
////


volatile os_thread_t * os_scheduler__current_thread;


////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_scheduler_init(void){
    os_priority_init();
    os_readylist_init();
    return OS_ERR_OK;
}

os_err_t os_scheduler_resume(os_thread_t * thread)
{
    os_readylist_push_back(thread);

    return OS_ERR_OK;
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
