#ifndef INCLUDED_PRINTF_H
#define INCLUDED_PRINTF_H

#ifndef INCLUDED_STDARG_H
#define INCLUDED_STDARG_H
#include <stdarg.h>
#endif /*INCLUDED_STDARG_H*/

#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/


/* -------------------------------------------------------------------------------------------------------------- */
/* METHODS */

int os_printf(const char* fmt, ...);

/* -------------------------------------------------------------------------------------------------------------- */
/* UTILS */

#define printf os_printf

#endif /* INCLUDED_PRINTF_H */
