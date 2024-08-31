#include <os_kernel.h>
#include <os_readylist.h>
#include <os_scheduler.h>
#include <cpu_kernel.h>
#include <os_timewheel.h>
#include <os_idle.h>
/* -------------------------------------------------------------------------------------------------------------- */


os_err_t os_kernel_init(void){
    os_tick__value = 0;
    
    os_memory_init();
    
    cpu_kernel_init();
    
    os_timewheel_init();
    os_priority_init();
    os_readylist_init();
    os_scheduler_init();
    
    return OS_ERR_OK;
}

os_err_t os_kernel_startup(void){
    os_idle_init();
    return os_scheduler_startup();
}

os_err_t os_kernel_schedule(void){
    if(cpu_in_privilege()){
        os_err_t err =  os_scheduler_schedule();
        if(err==OS_SCHEDULER_ERR_IRQ_NEST){
            os_scheduler__need_schedule = OS_TRUE;
        }
        return err;
    }else{
        return cpu_kernel_schedule();
    }
}

os_err_t os_kernel_systick(void){
    return os_scheduler_systick();
}

os_err_t os_kernel_resume(os_thread_t * thread){
    if(cpu_in_privilege()){
        os_err_t err =  os_scheduler_resume(thread);
        if(err==OS_SCHEDULER_ERR_IRQ_NEST){
            os_scheduler__need_schedule = OS_TRUE;
        }
        return err;
    }else{
        return cpu_kernel_thread_resume(thread);
    }
}