#include <stdio.h>
#include "gd32f4xx_it.h"
#include <os_kernel.h>


/*!
    \brief    this function handles SysTick exception
    \param[in]  none
    \param[out] none
    \retval     none
*/
//size_t SysTick__Tick=0;

void SysTick_Handler(void)
{
//    SysTick__Tick++;
    os_interrupt_enter();
    os_scheduler_systick();
    os_interrupt_leave();
}


