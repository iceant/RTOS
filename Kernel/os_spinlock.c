#include <os_spinlock.h>
#include <os_types.h>

////////////////////////////////////////////////////////////////////////////////
////

void os_spinglock_lock(os_spinlock_t *s)
{
    while(1){
        int zero = 0;
        int one = 1;
        if(cpu_atomic_compare_exchange(&s->lock, &zero, &one)){
            return;
        }
    }
}

void os_spinglock_unlock(os_spinlock_t *s){
    int zero = 0;
    cpu_atomic_store(&s->lock, &zero);
}