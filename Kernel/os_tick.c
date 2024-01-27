#include <os_tick.h>
#include <os_macros.h>

////////////////////////////////////////////////////////////////////////////////
////

os_tick_t os_tick_from_millisecond(uint32_t ms)
{
    os_size_t ticks = OS_PAGE(ms, CPU_TICKS_PER_SECOND);
    return ticks;
}



