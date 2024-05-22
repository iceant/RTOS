#ifndef INCLUDED_OS_MUTEX_H
#define INCLUDED_OS_MUTEX_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef struct os_mutex_s{
    cpu_spinlock_t lock;
    char name[OS_NAME_SIZE];
}os_mutex_t;


////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_mutex_init(os_mutex_t * mutex);

os_err_t os_mutex_lock(os_mutex_t * mutex);

os_err_t os_mutex_unlock(os_mutex_t * mutex);







#endif /*INCLUDED_OS_MUTEX_H*/
