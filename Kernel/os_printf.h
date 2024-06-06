#ifndef INCLUDED_OS_PRINTF_H
#define INCLUDED_OS_PRINTF_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_TYPES_H
#include <os_types.h>
#endif /*INCLUDED_OS_TYPES_H*/

#ifndef INCLUDED_STDARG_H
#define INCLUDED_STDARG_H
#include <stdarg.h>
#endif /*INCLUDED_STDARG_H*/

////////////////////////////////////////////////////////////////////////////////
////
#ifndef OS_PRINTF_USE_DEFAULT_IMPLEMENTATION
#define OS_PRINTF_USE_DEFAULT_IMPLEMENTATION 0
#endif /*OS_PRINTF_USE_DEFAULT_IMPLEMENTATION*/


////////////////////////////////////////////////////////////////////////////////
////

extern int os_printf_putc(int ch, void* ud);

extern int os_printf(const char* fmt, ...);

#define printf os_printf

#endif /*INCLUDED_OS_PRINTF_H*/
