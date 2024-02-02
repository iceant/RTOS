#ifndef INCLUDED_OS_SPINLOCK_H
#define INCLUDED_OS_SPINLOCK_H

////////////////////////////////////////////////////////////////////////////////
////
typedef struct os_spinlock_s{
    int lock;
}os_spinlock_t;

////////////////////////////////////////////////////////////////////////////////
////
void os_spinglock_lock(os_spinlock_t *s);

void os_spinglock_unlock(os_spinlock_t *s);



#endif /*INCLUDED_OS_SPINLOCK_H*/
