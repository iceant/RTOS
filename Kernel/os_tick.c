#include <os_tick.h>
#include "os_printf.h"

os_tick_t os_tick_from_millisecond(uint32_t ms)
{
    os_tick_t tick;
    tick = (OS_TICKS_PER_SECOND * ms + 999)/1000;
    return tick;
}