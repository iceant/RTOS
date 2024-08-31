#ifndef INCLUDED_OS_IDLE_H
#define INCLUDED_OS_IDLE_H

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

/* -------------------------------------------------------------------------------------------------------------- */
/* TYPES */
typedef void (*os_idle_function_t)(void*);

/* -------------------------------------------------------------------------------------------------------------- */
/* FUNCTION */

void os_idle_init(void);

void os_idle_register(os_idle_function_t function, void* ud);


#endif /* INCLUDED_OS_IDLE_H */
