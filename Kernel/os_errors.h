#ifndef INCLUDED_OS_ERRORS_H
#define INCLUDED_OS_ERRORS_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

////////////////////////////////////////////////////////////////////////////////
////

typedef os_int_t os_err_t;

////////////////////////////////////////////////////////////////////////////////
////

#define OS_ERR_OK       0
#define OS_ERR_ERROR    (-1)
#define OS_ERR_ENOMEM   (-2)
#define OS_ERR_FULL     (-3)
#define OS_ERR_EMPTY    (-4)
#define OS_ERR_EINVAL   (-5)
#define OS_ERR_TIMEOUT  (-6)
#define OS_ERR_EAGAIN   (-7)
#define OS_ERR_ELOCK    (-8)


#endif /* INCLUDED_OS_ERRORS_H */
