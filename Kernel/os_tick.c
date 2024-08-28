#include <os_tick.h>

os_tick_t os_tick_from_milliseconds(int32_t ms)
{
    os_tick_t tick;
    if(ms<0){
        tick = OS_WAITING_INFINITY;
    }else{
        // 1000/1000ms * ms
        tick = OS_KERNEL_TICKS_PER_SECOND * (ms / 1000);
        tick += (OS_KERNEL_TICKS_PER_SECOND * (ms % 1000) + 999) / 1000 ;
        
    }
    return tick;
}