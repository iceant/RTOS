#include <os_exception.h>

void os_exception_set_handler(os_exception_handler_t handler)
{
    cpu_set_exception_handler((cpu_exception_handler_t)handler);
}

