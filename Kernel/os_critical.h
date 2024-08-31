#ifndef INCLUDED_OS_CRITICAL_H
#define INCLUDED_OS_CRITICAL_H

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/


/* -------------------------------------------------------------------------------------------------------------- */

void os_critical_enter(void);

void os_critical_leave(void);


#endif /* INCLUDED_OS_CRITICAL_H */
