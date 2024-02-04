#ifndef INCLUDED_OS_FMT_H
#define INCLUDED_OS_FMT_H

#ifndef INCLUDED_STDARG_H
#define INCLUDED_STDARG_H
#include <stdarg.h>
#endif /*INCLUDED_STDARG_H*/

#ifndef INCLUDED_STDIO_H
#define INCLUDED_STDIO_H
#include <stdio.h>
#endif /*INCLUDED_STDIO_H*/

////////////////////////////////////////////////////////////////////////////////
////

typedef struct va_list_box {
    va_list ap;
} va_list_box;

typedef void (*os_fmt_t)(int code, va_list_box *box,
                  int put(int c, void *cl), void *cl,
                  unsigned char flags[256], int width, int precision);

extern void os_fmt_fmt (int put(int c, void *cl), void *cl,
                     const char *fmt, ...);
extern void os_fmt_vfmt(int put(int c, void *cl), void *cl,
                     const char *fmt, va_list_box *box);
extern void os_fmt_print (const char *fmt, ...);
extern void os_fmt_fprint(FILE *stream,
                       const char *fmt, ...);
extern int os_fmt_sfmt   (char *buf, int size,
                       const char *fmt, ...);
extern int os_fmt_vsfmt(char *buf, int size,
                     const char *fmt, va_list_box *box);
extern char *os_fmt_string (const char *fmt, ...);
extern char *os_fmt_vstring(const char *fmt, va_list_box *box);
extern os_fmt_t os_fmt_register(int code, os_fmt_t cvt);
extern void os_fmt_putd(const char *str, int len,
                     int put(int c, void *cl), void *cl,
                     unsigned char flags[256], int width, int precision);
extern void os_fmt_puts(const char *str, int len,
                     int put(int c, void *cl), void *cl,
                     unsigned char flags[256], int width, int precision);

#endif /*INCLUDED_OS_FMT_H*/
