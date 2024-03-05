#ifndef INCLUDED_SDK_FMT_H
#define INCLUDED_SDK_FMT_H

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

typedef void (*sdk_fmt_t)(int code, va_list_box *box,
                  int put(int c, void *cl), void *cl,
                  unsigned char flags[256], int width, int precision);

extern void sdk_fmt_fmt (int put(int c, void *cl), void *cl,
                     const char *fmt, ...);
extern void sdk_fmt_vfmt(int put(int c, void *cl), void *cl,
                     const char *fmt, va_list_box *box);
extern void sdk_fmt_print (const char *fmt, ...);
extern void sdk_fmt_fprint(FILE *stream,
                       const char *fmt, ...);
extern int sdk_fmt_sfmt   (char *buf, int size,
                       const char *fmt, ...);
extern int sdk_fmt_vsfmt(char *buf, int size,
                     const char *fmt, va_list_box *box);
extern char *sdk_fmt_string (const char *fmt, ...);
extern char *sdk_fmt_vstring(const char *fmt, va_list_box *box);
extern sdk_fmt_t sdk_fmt_register(int code, sdk_fmt_t cvt);
extern void sdk_fmt_putd(const char *str, int len,
                     int put(int c, void *cl), void *cl,
                     unsigned char flags[256], int width, int precision);
extern void sdk_fmt_puts(const char *str, int len,
                     int put(int c, void *cl), void *cl,
                     unsigned char flags[256], int width, int precision);

#endif /*INCLUDED_SDK_FMT_H*/
