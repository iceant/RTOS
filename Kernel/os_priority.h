#ifndef INCLUDED_OS_PRIORITY_H
#define INCLUDED_OS_PRIORITY_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef os_int_t os_priority_t;

////////////////////////////////////////////////////////////////////////////////
////
#ifndef OS_PRIORITY_MAX
#define OS_PRIORITY_MAX 32
#endif

#define OS_PRIORITY_LOWEST (OS_PRIORITY_MAX-1)

#define OS_PRIORITY_INVALID (-1)

////////////////////////////////////////////////////////////////////////////////
////
#define OS_PRIORITY_CMP_HIGH    (1)
#define OS_PRIORITY_CMP_LOW     (-1)
#define OS_PRIORITY_CMP_EQUAL   (0)

////////////////////////////////////////////////////////////////////////////////
////
void os_priority_init(void);

os_priority_t os_priority_get_highest(void);

void os_priority_mark(os_priority_t priority);

void os_priority_unmark(os_priority_t priority);

bool os_priority_is_marked(os_priority_t priority);

int os_priority_cmp(os_priority_t a, os_priority_t b);

void os_priority_swap(os_priority_t a, os_priority_t b);

#endif /*INCLUDED_OS_PRIORITY_H*/
