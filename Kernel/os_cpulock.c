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

os_err_t os_cpulock_try_lock(os_cpulock_t* lock){
    int err = cpu_spinlock_try_lock(lock);
    switch (err) {
        case 0:
            return OS_ERR_OK;
        case -1:
            return OS_ERR_ELOCK;
        case 1:
            return OS_ERR_ERROR;
    }
}
