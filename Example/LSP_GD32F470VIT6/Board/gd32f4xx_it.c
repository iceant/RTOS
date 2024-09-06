#include "gd32f4xx_it.h"
#include <os_kernel.h>
#include <stdio.h>

void SysTick_Handler(void)
{
    os_kernel_systick();
}

