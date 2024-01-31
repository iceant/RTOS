#include <os_interrupt.h>
#include <cpu.h>

////////////////////////////////////////////////////////////////////////////////
////

static volatile os_size_t os_interrupt__nested=0;

////////////////////////////////////////////////////////////////////////////////
////

void os_interrupt_enter(void){
    register cpu_uintptr_t level = cpu_interrupt_disable();
    os_interrupt__nested++;
    cpu_interrupt_enable(level);
}

void os_interrupt_leave(void){
    register cpu_uintptr_t level = cpu_interrupt_disable();
    os_interrupt__nested--;
    cpu_interrupt_enable(level);
}

os_size_t os_interrupt_nested(void){
    return os_interrupt__nested;
}

