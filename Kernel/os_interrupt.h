#ifndef INCLUDED_OS_INTERRUPT_H
#define INCLUDED_OS_INTERRUPT_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_SCHEDULER_H
#include <os_scheduler.h>
#endif /*INCLUDED_OS_SCHEDULER_H*/

////////////////////////////////////////////////////////////////////////////////
////
C_STATIC_FORCEINLINE void os_interrupt_enter(void){
    os_scheduler__interrupt_nest++;
}

C_STATIC_FORCEINLINE void os_interrupt_leave(void){
    os_scheduler__interrupt_nest--;
    if(os_scheduler__interrupt_nest==0 && os_scheduler__need_schedule_flag==OS_TRUE){
        os_err_t error = OS_ERR_OK;
        os_scheduler_schedule(&error);
    }
}

#endif /*INCLUDED_OS_INTERRUPT_H*/
