#include <os_mutex.h>

os_err_t os_mutex_init(os_mutex_t * mutex){
    cpu_spinlock_init(&mutex->lock);
    return OS_EOK;
}

os_err_t os_mutex_lock(os_mutex_t * mutex){
    cpu_spinlock_lock(&mutex->lock);
    return OS_EOK;
}

os_err_t os_mutex_unlock(os_mutex_t * mutex)
{
    cpu_spinlock_unlock(&mutex->lock);
    return OS_EOK;
}


