#include <os_mutex.h>
#include <os_spinlock.h>
#include <os_scheduler.h>
#include <os_macros.h>
#include <string.h>
#include <assert.h>
#include <cpu_atomic.h>

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_mutex_init(os_mutex_t * mutex, const char* name)
{
    mutex->value = 0;
    int name_size = strlen(name);
    name_size = (name_size>(OS_NAME_MAX_SIZE-1))?(OS_NAME_MAX_SIZE-1):name_size;
    memcpy(mutex->name, name, name_size);
    mutex->name[name_size]='\0';
    mutex->owner = 0;
    
    return OS_EOK;
}

os_err_t os_mutex_lock(os_mutex_t* mutex)
{
    os_spinlock_lock(&mutex->value);
    mutex->owner = os_thread_self();
    return OS_EOK;
}

os_err_t os_mutex_unlock(os_mutex_t * mutex)
{
    mutex->owner = 0;
    os_spinlock_unlock(&mutex->value);
    return OS_EOK;
}
