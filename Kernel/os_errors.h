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
#define OS_EOK          0
#define OS_ERROR        (-1)
#define OS_ENOMEM       (-2)
#define OS_EINVAL       (-3)
#define OS_EFULL        (-4)
#define OS_EEMPTY       (-5)
#define OS_EAGAIN       (-6)



#endif /*INCLUDED_OS_ERRORS_H*/
