#ifndef INCLUDED_OS_CPULOCK_H
#define INCLUDED_OS_CPULOCK_H


#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

/* -------------------------------------------------------------------------------------------------------------- */
/*  */

typedef os_uint_t os_cpulock_t;

/* -------------------------------------------------------------------------------------------------------------- */
/*  */

void os_cpulock_init(os_cpulock_t* lock);

void os_cpulock_lock(os_cpulock_t* lock);

void os_cpulock_unlock(os_cpulock_t* lock);

os_err_t os_cpulock_try_lock(os_cpulock_t* lock);


#endif /* INCLUDED_OS_CPULOCK_H */
