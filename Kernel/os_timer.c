#include <os_timer.h>


os_err_t os_timer_init(os_timer_t* timer, os_tick_t ticks, os_timer_timeout_t timeout_function, void* ud, int flag)
{
    OS_LIST_INIT(&timer->timer_node);
    timer->ticks = ticks;
    timer->expires_tick = 0u;
    timer->timeout_function = timeout_function;
    timer->userdata = ud;
    timer->flag = flag;
    
    return OS_ERR_OK;
}

