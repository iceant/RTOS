#include <os_tick.h>

/* -------------------------------------------------------------------------------------------------------------- */

os_tick_t os_tick__value;

/* -------------------------------------------------------------------------------------------------------------- */

os_tick_t os_tick_from_millisecond(uint32_t ms)
{
    os_tick_t tick;
    
    tick = OS_TICK_PER_SECOND * (ms / 1000);
    tick += (OS_TICK_PER_SECOND * (ms % 1000) + 999)/1000;
    
    return tick;
}

os_tick_t os_tick_get(void){
    return os_tick__value;
}

os_tick_t os_tick_increase(void){
    return os_tick__value++;
}
