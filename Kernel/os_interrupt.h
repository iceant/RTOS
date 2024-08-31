#ifndef INCLUDED_OS_INTERRUPT_H
#define INCLUDED_OS_INTERRUPT_H

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/


/* -------------------------------------------------------------------------------------------------------------- */

void os_interrupt_enter(void);

void os_interrupt_leave(void);

#endif /* INCLUDED_OS_INTERRUPT_H */
