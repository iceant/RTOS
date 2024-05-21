#include <os_kernel.h>
#include "os_idle.h"

os_err_t os_kernel_init(void)
{
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
    return os_scheduler_startup();
}

