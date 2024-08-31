#ifndef INCLUDED_OS_SCHEDULER_H
#define INCLUDED_OS_SCHEDULER_H

/* -------------------------------------------------------------------------------------------------------------- */

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/

/* -------------------------------------------------------------------------------------------------------------- */

extern os_uint_t os_scheduler__disable_nest;
extern os_uint_t os_scheduler__interrupt_nest;
extern os_tick_t os_scheduler__systick;
extern os_thread_t * os_scheduler__current_thread_p;
extern os_bool_t os_scheduler__need_schedule;

/* -------------------------------------------------------------------------------------------------------------- */
/* CONSTANTS */
#define OS_SCHEDULER_ERR_OK                                 (OS_ERR_OK)
#define OS_SCHEDULER_ERR_NEED_SCHEDULE                      (0x1100)
#define OS_SCHEDULER_ERR_IRQ_NEST                           (0x1101)
#define OS_SCHEDULER_ERR_DISABLED                           (0x1102)
#define OS_SCHEDULER_ERR_WIP                                (0x1103)
#define OS_SCHEDULER_ERR_CURRENT_THREAD_RUNNING             (0x1104)
#define OS_SCHEDULER_ERR_NO_NEXT_THREAD                     (0x1105)
#define OS_SCHEDULER_ERR_FAILED                             (0x1106)
#define OS_SCHEDULER_ERR_NOT_STARTED                        (0x1107)


/* -------------------------------------------------------------------------------------------------------------- */

os_err_t os_scheduler_init(void);

os_err_t os_scheduler_startup(void);

os_err_t os_scheduler_systick(void);

os_err_t os_scheduler_schedule(void);

os_err_t os_scheduler_schedule_in_thread(void);

void os_scheduler_lock(void);

void os_scheduler_unlock(void);

/* -------------------------------------------------------------------------------------------------------------- */
/* THREAD MANAGER */
os_err_t os_scheduler_suspend(os_thread_t* thread);

os_err_t os_scheduler_resume(os_thread_t* thread);

os_err_t os_scheduler_yield(os_thread_t* thread);

os_err_t os_scheduler_delay(os_thread_t* thread, os_tick_t ticks);

#endif /* INCLUDED_OS_SCHEDULER_H */
