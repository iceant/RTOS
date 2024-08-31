#include <os_critical.h>
#include <os_scheduler.h>


void os_critical_enter(void){
    os_scheduler_lock();
}

void os_critical_leave(void){
    os_scheduler_unlock();
}
