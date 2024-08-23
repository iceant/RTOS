#ifndef INCLUDED_OS_CRITICAL_H
#define INCLUDED_OS_CRITICAL_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_SCHEDULER_H
#include <os_scheduler.h>
#endif /*INCLUDED_OS_SCHEDULER_H*/

////////////////////////////////////////////////////////////////////////////////
////
C_STATIC_FORCEINLINE void os_critical_enter(void){
    os_scheduler_disable();
}

C_STATIC_FORCEINLINE void os_critical_leave(void){
    os_scheduler_enable();
}

C_STATIC_FORCEINLINE os_bool_t os_critical_activated(void){
    return os_scheduler_disabled();
}

#endif /*INCLUDED_OS_CRITICAL_H*/
