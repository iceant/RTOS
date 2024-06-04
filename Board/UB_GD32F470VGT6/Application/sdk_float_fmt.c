#include <sdk_float_fmt.h>
#include <assert.h>
#include <sdk_ultoa.h>
/*
 123456789, 3 => 123456.789
 1, 3 => 0.001
 */
void sdk_float_ul_fmt(int code, va_list_box *box,
                   int put(int c, void *cl), void *cl,
                   unsigned char flags[], int width, int precision) {
    char s[32];
    unsigned long value;
    int i, j;
    assert(box && flags);
    value = va_arg(box->ap, unsigned long);
    i = va_arg(box->ap, int);

    sdk_ultoa(value, s, 10);

    int s_size = (int)strlen(s);
    if(s_size <= i){
        sdk_fmt_puts("0.", 2, put, cl, flags, width, precision);
        for(j=0; j< (i-s_size); j++){
            sdk_fmt_puts("0", 1, put, cl, flags, width, precision);
        }
        sdk_fmt_puts(s, s_size, put, cl, flags, width, precision);
    }else{
        sdk_fmt_puts(s, s_size-i, put, cl, flags, width, precision);
        sdk_fmt_puts(".", 1, put, cl, flags, width, precision);
        sdk_fmt_puts(s+(s_size-i), i, put, cl, flags, width, precision);
    }
}

void sdk_float_str_fmt(int code, va_list_box *box,
                      int put(int c, void *cl), void *cl,
                      unsigned char flags[], int width, int precision) {
    char* s;
    int i, j;
    assert(box && flags);
    s = va_arg(box->ap, char*);
    i = va_arg(box->ap, int);

    int s_size = (int)strlen(s);
    if(s_size <= i){
        sdk_fmt_puts("0.", 2, put, cl, flags, width, precision);
        for(j=0; j< (i-s_size); j++){
            sdk_fmt_puts("0", 1, put, cl, flags, width, precision);
        }
        sdk_fmt_puts(s, s_size, put, cl, flags, width, precision);
    }else{
        sdk_fmt_puts(s, s_size-i, put, cl, flags, width, precision);
        sdk_fmt_puts(".", 1, put, cl, flags, width, precision);
        sdk_fmt_puts(s+(s_size-i), i, put, cl, flags, width, precision);
    }
}

