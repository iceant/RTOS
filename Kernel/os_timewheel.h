#ifndef INCLUDED_OS_TIMEWHEEL_H
#define INCLUDED_OS_TIMEWHEEL_H

/* -------------------------------------------------------------------------------------------------------------- */


#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_TIMER_H
#include <os_timer.h>
#endif /*INCLUDED_OS_TIMER_H*/


/* -------------------------------------------------------------------------------------------------------------- */
/*
| TV5 | TV4 | TV3 | TV2 | TV1 |
  6b    6b    6b    6b    8b
*/


/* -------------------------------------------------------------------------------------------------------------- */

#define OS_TIMEWHEEL_RET_OK             OS_ERR_OK
#define OS_TIMEWHEEL_RET_ERROR          OS_ERR_ERROR
#define OS_TIMEWHEEL_RET_NEED_SCHEDULE  (1)

/* -------------------------------------------------------------------------------------------------------------- */
os_err_t os_timewheel_init(void);

os_err_t os_timewheel_tick(void);

os_err_t os_timewheel_add_timer(os_timer_t * timer, os_tick_t ticks
                                , os_timer_timeout_t timeout_function, void* userdata, int flag);

#endif /* INCLUDED_OS_TIMEWHEEL_H */
