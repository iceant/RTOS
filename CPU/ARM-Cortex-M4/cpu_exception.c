#include <cpu_exception.h>

static cpu_exception_handler_t cpu_exception__handler;

void cpu_exception_init(void){
    cpu_exception__handler = 0;
}

void cpu_set_exception_handler(cpu_exception_handler_t handler){
    cpu_exception__handler = handler;
}

cpu_exception_handler_t cpu_exception_get_handler(void){
    return cpu_exception__handler;
}