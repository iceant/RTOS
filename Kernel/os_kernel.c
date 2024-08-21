#include <os_kernel.h>

os_err_t os_kernel_init(void)
{
    os_err_t err;

    err = os_memory_init();
    if(err!=OS_ERR_OK){
        return err;
    }
    err = os_scheduler_init();

    os_idle_init();

    return err;
}

os_err_t os_kernel_startup(void){

    os_idle_startup();

    return os_scheduler_startup();
}

void os_kernel_destroy(void){
    os_memory_destroy();
}
