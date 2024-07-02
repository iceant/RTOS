#include <os_kernel.h>
#include "os_idle.h"

os_err_t os_kernel_init(void)
{
    cpu_init();

    cpu_disable_irq();

    os_memory_init();

    os_priority_init();

    os_timer_init();

    os_interrupt_init();

    os_scheduler_init();

    os_idle_init();

    return OS_EOK;
}

os_err_t os_kernel_startup(void)
{
    os_err_t  err = os_scheduler_startup();
    cpu_enable_irq();
    return err;
}

