#ifndef INCLUDED_OS_TICK_H
#define INCLUDED_OS_TICK_H

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

/* -------------------------------------------------------------------------------------------------------------- */

typedef os_uint_t os_tick_t;

/* -------------------------------------------------------------------------------------------------------------- */

extern os_tick_t os_tick__value;

/* -------------------------------------------------------------------------------------------------------------- */

os_tick_t os_tick_from_millisecond(uint32_t ms);

os_tick_t os_tick_get(void);

os_tick_t os_tick_increase(void);

#endif /* INCLUDED_OS_TICK_H */
