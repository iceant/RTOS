#include <os_spinlock.h>
#include <cpu_atomic.h>

////////////////////////////////////////////////////////////////////////////////
////

void os_spinlock_init(os_spinlock_t * s)
{
    cpu_atomic_store((cpu_atomic_t *) s, 0);
}

void os_spinlock_lock(os_spinlock_t *s)
{
    while(1){
        if(cpu_atomic_cmpxchg((cpu_atomic_t *)s, 0, 1)==true){
            return;
        }
    }
}

void os_spinlock_unlock(os_spinlock_t *s){
    cpu_atomic_store((cpu_atomic_t *) s, 0);
}

os_bool_t os_spinlock_try_lock(os_spinlock_t* s)
{
    return cpu_atomic_cmpxchg((cpu_atomic_t*)s, 0, 1)?OS_TRUE:OS_FALSE;
}


