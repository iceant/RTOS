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

#ifndef INCLUDED_CPU_H
#include <cpu.h>
#endif /*INCLUDED_CPU_H*/



////////////////////////////////////////////////////////////////////////////////
////
C_STATIC_FORCEINLINE void os_critical_enter(void){
    cpu_interrupt_context_t ctx;
    cpu_interrupt_disable(&ctx);
    os_scheduler__lock_nest++;
    cpu_interrupt_enable(&ctx);
}

C_STATIC_FORCEINLINE void os_critical_leave(void){
    cpu_interrupt_context_t ctx;
    cpu_interrupt_disable(&ctx);
    os_scheduler__lock_nest--;
    cpu_interrupt_enable(&ctx);
}







#endif /*INCLUDED_OS_CRITICAL_H*/
