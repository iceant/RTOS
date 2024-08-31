#include <os_interrupt.h>
#include "os_scheduler.h"

void os_interrupt_enter(void)
{
    os_scheduler__interrupt_nest++;
}

void os_interrupt_leave(void)
{
    os_scheduler__interrupt_nest--;
    if(os_scheduler__interrupt_nest==0u){
        if(os_scheduler__need_schedule==OS_TRUE){
            os_scheduler_schedule();
        }
    }
}