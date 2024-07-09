#include <gd32f303xx_it.h>
#include <os_kernel.h>

////////////////////////////////////////////////////////////////////////////////
////


void SysTick_Handler(void)
{
#if OS_ENABLE
    os_scheduler_on_systick();
#endif
}
