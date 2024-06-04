#ifndef INCLUDED_SDK_FLOAT_FMT_H
#define INCLUDED_SDK_FLOAT_FMT_H

////////////////////////////////////////////////////////////////////////////////
////


#ifndef INCLUDED_SDK_FMT_H
#include <sdk_fmt.h>
#endif /*INCLUDED_SDK_FMT_H*/

////////////////////////////////////////////////////////////////////////////////
////

/*
 format unsigned long value to float format for print
 */

void sdk_float_ul_fmt(int code, va_list_box *box,
                      int put(int c, void *cl), void *cl,
                      unsigned char flags[], int width, int precision);

/*
 format string value to float format for print
 */

void sdk_float_str_fmt(int code, va_list_box *box,
                       int put(int c, void *cl), void *cl,
                       unsigned char flags[], int width, int precision);


#endif /*INCLUDED_SDK_FLOAT_FMT_H*/
