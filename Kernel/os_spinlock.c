#include <os_spinlock.h>
#include <cpu_atomic.h>

////////////////////////////////////////////////////////////////////////////////
////

void os_spinlock_lock(os_spinlock_t *s)
{
    while(1){
        int zero = 0;
        int one = 1;
        if(cpu_atomic_cmpxchg((cpu_atomic_t *)s, zero, one)){
            return;
        }
    }
}

void os_spinlock_unlock(os_spinlock_t *s){
    int zero = 0;
    cpu_atomic_store((cpu_atomic_t *) s, zero);
}

os_bool_t os_spinlock_try_lock(os_spinlock_t* s)
{
    int zero = 0;
    int one = 1;
    return cpu_atomic_cmpxchg((cpu_atomic_t*)s, zero, one)?OS_TRUE:OS_FALSE;
}


