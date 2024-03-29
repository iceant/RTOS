#ifndef INCLUDED_OS_IDLE_H
#define INCLUDED_OS_IDLE_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /* INCLUDED_OS_THREAD_H */

////////////////////////////////////////////////////////////////////////////////
////

typedef void(*os_idle_hook)(void* userdata);

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_idle_init(void);

void os_idle_set_hook(os_idle_hook hook, void* parameter);

#endif /* INCLUDED_OS_IDLE_H */
