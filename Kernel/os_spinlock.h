#ifndef INCLUDED_OS_SPINLOCK_H
#define INCLUDED_OS_SPINLOCK_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /* INCLUDED_OS_TYPES_H */

////////////////////////////////////////////////////////////////////////////////
////
typedef volatile os_uintptr_t os_spinlock_t;

////////////////////////////////////////////////////////////////////////////////
////

void os_spinlock_init(os_spinlock_t * s);

void os_spinlock_lock(os_spinlock_t *s);

void os_spinlock_unlock(os_spinlock_t *s);

os_bool_t os_spinlock_try_lock(os_spinlock_t* s);

#endif /*INCLUDED_OS_SPINLOCK_H*/
