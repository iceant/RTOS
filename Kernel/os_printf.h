#ifndef INCLUDED_OS_PRINTF_H
#define INCLUDED_OS_PRINTF_H

#ifndef INCLUDED_STDARG_H
#define INCLUDED_STDARG_H
#include <stdarg.h>
#endif /*INCLUDED_STDARG_H*/

////////////////////////////////////////////////////////////////////////////////
////

extern int os_printf_putc(int ch, void* ud);

extern int os_printf(const char* fmt, ...);

#define printf os_printf

#endif /*INCLUDED_OS_PRINTF_H*/
