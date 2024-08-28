#ifndef INCLUDED_OS_READYLIST_H
#define INCLUDED_OS_READYLIST_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_OS_LIST_H
#include <os_list.h>
#endif /*INCLUDED_OS_LIST_H*/

#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/


////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_readylist_init(void);

/* 使用INLINE 方法时造成 thread 状态错乱，改成方法调用 */

os_err_t os_readylist_push_back(os_thread_t* thread);

os_err_t os_readylist_push_front(os_thread_t* thread);

void os_readylist_remove(os_thread_t * thread);

os_thread_t* os_readylist_pop(os_priority_t priority);

#endif /*INCLUDED_OS_READYLIST_H*/
