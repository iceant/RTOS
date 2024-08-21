#ifndef INCLUDED_OS_IDLE_H
#define INCLUDED_OS_IDLE_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef void (*os_idle_action_t)(void* ud);

void os_idle_init(void);

void os_idle_startup(void);

void os_idle_set_action(os_idle_action_t action, void* ud);




#endif /*INCLUDED_OS_IDLE_H*/
