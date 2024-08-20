#include <os_kernel.h>

os_err_t os_kernel_init(void)
{
    os_err_t err;

    err = os_memory_init();
    os_scheduler_init();

    return err;
}

os_err_t os_kernel_startup(void){
    return OS_ERR_OK;
}

void os_kernel_destroy(void){
    os_memory_destroy();
}
