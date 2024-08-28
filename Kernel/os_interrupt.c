#include <os_interrupt.h>

void os_interrupt_leave(void){
    os_scheduler__interrupt_nest--;
    if(os_scheduler__interrupt_nest==0 && os_scheduler__need_schedule_flag==OS_TRUE){
        os_err_t error = OS_ERR_OK;
        os_scheduler_schedule(&error);
    }
}
