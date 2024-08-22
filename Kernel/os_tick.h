#ifndef INCLUDED_OS_TICK_H
#define INCLUDED_OS_TICK_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef os_uint_t os_tick_t;

////////////////////////////////////////////////////////////////////////////////
////
extern volatile os_tick_t os_scheduler__systick_ticks;


////////////////////////////////////////////////////////////////////////////////
////
#define OS_WAITING_INFINITY (-1u)


////////////////////////////////////////////////////////////////////////////////
////

C_STATIC_FORCEINLINE os_tick_t os_tick_from_milliseconds(int32_t ms)
{
    os_tick_t tick;
    if(ms<0){
        tick = OS_WAITING_INFINITY;
    }else{
        // 1000/1000ms * ms
        tick = OS_KERNEL_TICKS_PER_SECOND * (ms / 1000);
        tick += (OS_KERNEL_TICKS_PER_SECOND * (ms % 1000) + 999) / 1000;

    }
    return tick;
}

C_STATIC_FORCEINLINE os_tick_t os_tick_get(void){
    return os_scheduler__systick_ticks;
}



#endif /*INCLUDED_OS_TICK_H*/
