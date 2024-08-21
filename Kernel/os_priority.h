#ifndef INCLUDED_OS_PRIORITY_H
#define INCLUDED_OS_PRIORITY_H

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
typedef os_uint_t os_priority_t;

////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_priority_init(void);


os_priority_t os_priority_highest();

void os_priority_mark(os_priority_t priority);

void os_priority_unmark(os_priority_t priority);


#endif /*INCLUDED_OS_PRIORITY_H*/