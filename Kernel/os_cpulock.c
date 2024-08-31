#include <os_cpulock.h>
#include <cpu_spinlock.h>

void os_cpulock_init(os_cpulock_t* lock)
{
    cpu_spinlock_init(lock);
}

void os_cpulock_lock(os_cpulock_t* lock){
    cpu_spinlock_lock(lock);
}

void os_cpulock_unlock(os_cpulock_t* lock){
    cpu_spinlock_unlock(lock);
}
