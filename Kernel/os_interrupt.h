#ifndef INCLUDED_OS_INTERRUPT_H
#define INCLUDED_OS_INTERRUPT_H

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/



/* -------------------------------------------------------------------------------------------------------------- */
/*  */
extern os_uint_t os_scheduler__interrupt_nest;
extern os_bool_t os_scheduler__need_schedule;
extern os_err_t os_scheduler_schedule(void);

/* -------------------------------------------------------------------------------------------------------------- */

C_STATIC_FORCEINLINE void os_interrupt_enter(void){
    os_scheduler__interrupt_nest++;
}

C_STATIC_FORCEINLINE void os_interrupt_leave(void)
{
    os_scheduler__interrupt_nest--;
//    if(os_scheduler__interrupt_nest==0u){
//        if(os_scheduler__need_schedule==OS_TRUE){
//            os_scheduler_schedule();
//        }
//    }
}

#endif /* INCLUDED_OS_INTERRUPT_H */
