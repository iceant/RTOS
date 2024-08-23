#ifndef INCLUDED_SDK_AP_H
#define INCLUDED_SDK_AP_H

#ifndef INCLUDED_STDARG_H
#define INCLUDED_STDARG_H
#include <stdarg.h>
#endif /* INCLUDED_STDARG_H */

#ifndef INCLUDED_SDK_FMT_H
#include <sdk_fmt.h>
#endif /* INCLUDED_SDK_FMT_H */

////////////////////////////////////////////////////////////////////////////////
////

typedef struct sdk_ap_s * sdk_ap_t;

////////////////////////////////////////////////////////////////////////////////
////

sdk_ap_t sdk_ap_new(long int n);
void sdk_ap_free(sdk_ap_t *z);
sdk_ap_t sdk_ap_set(sdk_ap_t z, long int n);
sdk_ap_t sdk_ap_fromstr(const char *str, int base, char **end);

long int sdk_ap_toint(sdk_ap_t x);
char    *sdk_ap_tostr(char *str, int size, int base, sdk_ap_t x);

void     sdk_ap_fmt(int code, va_list_box *box,
                       int put(int c, void *cl), void *cl,
                       unsigned char flags[], int width, int precision);

sdk_ap_t sdk_ap_neg(sdk_ap_t x);
sdk_ap_t sdk_ap_add(sdk_ap_t x, sdk_ap_t y);
sdk_ap_t sdk_ap_sub(sdk_ap_t x, sdk_ap_t y);
sdk_ap_t sdk_ap_mul(sdk_ap_t x, sdk_ap_t y);
sdk_ap_t sdk_ap_div(sdk_ap_t x, sdk_ap_t y);
sdk_ap_t sdk_ap_mod(sdk_ap_t x, sdk_ap_t y);
sdk_ap_t sdk_ap_pow(sdk_ap_t x, sdk_ap_t y, sdk_ap_t p);

sdk_ap_t    sdk_ap_addi(sdk_ap_t x, long int y);
sdk_ap_t    sdk_ap_subi(sdk_ap_t x, long int y);
sdk_ap_t    sdk_ap_muli(sdk_ap_t x, long int y);
sdk_ap_t    sdk_ap_divi(sdk_ap_t x, long int y);
long sdk_ap_modi(sdk_ap_t x, long int y);

sdk_ap_t sdk_ap_lshift(sdk_ap_t x, int s);
sdk_ap_t sdk_ap_rshift(sdk_ap_t x, int s);

int sdk_ap_cmp (sdk_ap_t x, sdk_ap_t y);
int sdk_ap_cmpi(sdk_ap_t x, long int y);

int sdk_ap_object_size(void);

sdk_ap_t sdk_ap_mul_to(sdk_ap_t z, sdk_ap_t x, sdk_ap_t y);

sdk_ap_t sdk_ap_mul2i(sdk_ap_t z, long int x, long int y);

#endif /* INCLUDED_SDK_AP_H */
