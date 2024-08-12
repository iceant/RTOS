#include <cpu.h>

void cpu_init(void)
{
    cpu_mpu_init();
}

cpu_exception_handler_t cpu_exception_handler=0;

void cpu_set_exception_handler(cpu_exception_handler_t handler)
{
    cpu_exception_handler = handler;
}

