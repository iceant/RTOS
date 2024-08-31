#ifndef INCLUDED_OS_READYLIST_H
#define INCLUDED_OS_READYLIST_H

/* -------------------------------------------------------------------------------------------------------------- */


#ifndef INCLUDED_OS_ERRORS_H
#include <os_errors.h>
#endif /*INCLUDED_OS_ERRORS_H*/

#ifndef INCLUDED_OS_PRIORITY_H
#include <os_priority.h>
#endif /*INCLUDED_OS_PRIORITY_H*/

#ifndef INCLUDED_OS_THREAD_H
#include <os_thread.h>
#endif /*INCLUDED_OS_THREAD_H*/


/* -------------------------------------------------------------------------------------------------------------- */

os_err_t os_readylist_init(void);

os_err_t os_readylist_push_back(os_thread_t* thread);

os_err_t os_readylist_push_front(os_thread_t* thread);

os_thread_t * os_readylist_pop(os_priority_t priority);

#endif /* INCLUDED_OS_READYLIST_H */
