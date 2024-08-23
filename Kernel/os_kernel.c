#include <os_kernel.h>
#include <cpu.h>

cpu_exception_handler_t cpu_exception_handler;

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t os_kernel__msp_stack[OS_KERNEL_MSP_SIZE];

os_err_t os_kernel_init(void)
{
    os_err_t err;
    cpu_exception_handler = 0;

    err = os_memory_init();
    err = os_scheduler_init();
    err = os_timer_init();
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
