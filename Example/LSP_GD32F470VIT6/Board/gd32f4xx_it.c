#include "gd32f4xx_it.h"
#include <os_kernel.h>

void SysTick_Handler(void)
{
    os_interrupt_enter();
    os_scheduler_systick();
    os_interrupt_leave();
}

