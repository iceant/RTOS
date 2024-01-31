#include <os_kernel.h>
#include <os_memory.h>

////////////////////////////////////////////////////////////////////////////////
////
static bool os_kernel__init_flag = false;
static bool os_kernel__startup_flag = false;

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_kernel_init(void)
{
    if(os_kernel__init_flag) return OS_ERROR;

    os_kernel__init_flag = false;
    
    os_memory_init();

    os_scheduler_init();
    
    os_kernel_cpu_config();
    
    os_kernel__init_flag = true;

    return OS_EOK;
}

os_err_t os_kernel_startup(void)
{
    if(os_kernel__init_flag==false) return OS_EINVAL;

    if(os_kernel__startup_flag) return OS_ERROR;

    os_kernel__startup_flag = false;

    os_err_t err = os_scheduler_schedule();
    if(err==OS_EOK){
        os_kernel__startup_flag = true;
    }
    return err;
}

bool os_kernel_ready(void)
{
    return (os_kernel__init_flag && os_kernel__startup_flag);
}


