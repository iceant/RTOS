#ifndef INCLUDED_OS_CRITICAL_H
#define INCLUDED_OS_CRITICAL_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_SCHEDULER_H
#include <os_scheduler.h>
#endif /*INCLUDED_OS_SCHEDULER_H*/


////////////////////////////////////////////////////////////////////////////////
////

C__STATIC_FORCEINLINE os_err_t os_critical_enter(void)
{
    os_scheduler_nest_increase();
    return OS_EOK;
}

C__STATIC_FORCEINLINE os_err_t os_critical_leave(void){
    os_scheduler_nest_decrease();
    return OS_EOK;
}




#endif /* INCLUDED_OS_CRITICAL_H */
