#include <sdk_ap.h>
#include <ctype.h>
#include <limits.h>
#include <string.h>
#include <assert.h>
#include <sdk_xp.h>
#include <os_memory.h>


////////////////////////////////////////////////////////////////////////////////
////

struct sdk_ap_s {
    int sign;
    int ndigits;
    int size;
    sdk_xp_t digits;
};
////////////////////////////////////////////////////////////////////////////////
////

#define iszero(x) ((x)->ndigits==1 && (x)->digits[0]==0)
#define maxdigits(x,y) ((x)->ndigits > (y)->ndigits ? \
	(x)->ndigits : (y)->ndigits)
#define isone(x) ((x)->ndigits==1 && (x)->digits[0]==1)

////////////////////////////////////////////////////////////////////////////////
////

static sdk_ap_t normalize(sdk_ap_t z, int n);
static int cmp(sdk_ap_t x, sdk_ap_t y);

static sdk_ap_t mk(int size) {
    sdk_ap_t z = OS_CALLOC(1, sizeof (*z) + size);
    assert(size > 0);
    assert(z);
    z->sign = 1;
    z->size = size;
    z->ndigits = 1;
    z->digits = (sdk_xp_t)(z + 1);
    return z;
}

static sdk_ap_t set(sdk_ap_t z, long int n) {
    if (n == LONG_MIN)
        sdk_xp_fromint(z->size, z->digits, LONG_MAX + 1UL);
    else if (n < 0)
        sdk_xp_fromint(z->size, z->digits, -n);
    else
        sdk_xp_fromint(z->size, z->digits, n);
    z->sign = n < 0 ? -1 : 1;
    return normalize(z, z->size);
}

static sdk_ap_t normalize(sdk_ap_t z, int n) {
    z->ndigits = sdk_xp_length(n, z->digits);
    return z;
}

static sdk_ap_t add(sdk_ap_t z, sdk_ap_t x, sdk_ap_t y) {
    int n = y->ndigits;
    if (x->ndigits < n)
        return add(z, y, x);
    else if (x->ndigits > n) {
        int carry = sdk_xp_add(n, z->digits, x->digits,
                           y->digits, 0);
        z->digits[z->size-1] = sdk_xp_sum(x->ndigits - n,
                                      &z->digits[n], &x->digits[n], carry);
    } else
        z->digits[n] = sdk_xp_add(n, z->digits, x->digits,
                              y->digits, 0);
    return normalize(z, z->size);
}

static sdk_ap_t sub(sdk_ap_t z, sdk_ap_t x, sdk_ap_t y) {
    int borrow, n = y->ndigits;
    borrow = sdk_xp_sub(n, z->digits, x->digits,
                    y->digits, 0);
    if (x->ndigits > n)
        borrow = sdk_xp_diff(x->ndigits - n, &z->digits[n],
                         &x->digits[n], borrow);
    assert(borrow == 0);
    return normalize(z, z->size);
}

static sdk_ap_t mulmod(sdk_ap_t x, sdk_ap_t y, sdk_ap_t p) {
    sdk_ap_t z, xy = sdk_ap_mul(x, y);
    z = sdk_ap_mod(xy, p);
    sdk_ap_free(&xy);
    return z;
}

static int cmp(sdk_ap_t x, sdk_ap_t y) {
    if (x->ndigits != y->ndigits)
        return x->ndigits - y->ndigits;
    else
        return sdk_xp_cmp(x->ndigits, x->digits, y->digits);
}

////////////////////////////////////////////////////////////////////////////////
////

sdk_ap_t sdk_ap_new(long int n) {
    return set(mk(sizeof (long int)), n);
}

void sdk_ap_free(sdk_ap_t *z) {
    assert(z && *z);
    OS_FREE(*z);
}

sdk_ap_t sdk_ap_set(sdk_ap_t z, long int n){
    return set(z, n);
}

sdk_ap_t sdk_ap_neg(sdk_ap_t x) {
    sdk_ap_t z;
    assert(x);
    z = mk(x->ndigits);
    memcpy(z->digits, x->digits, x->ndigits);
    z->ndigits = x->ndigits;
    z->sign = iszero(z) ? 1 : -x->sign;
    return z;
}

sdk_ap_t sdk_ap_mul_to(sdk_ap_t z, sdk_ap_t x, sdk_ap_t y){
    assert(x);
    assert(y);
    sdk_xp_mul(z->digits, x->ndigits, x->digits, y->ndigits,
               y->digits);
    normalize(z, z->size);
    z->sign = iszero(z)
              || ((x->sign^y->sign) == 0) ? 1 : -1;
    return z;
}

sdk_ap_t sdk_ap_mul(sdk_ap_t x, sdk_ap_t y) {
    sdk_ap_t z;
    assert(x);
    assert(y);
    z = mk(x->ndigits + y->ndigits);
    sdk_xp_mul(z->digits, x->ndigits, x->digits, y->ndigits,
           y->digits);
    normalize(z, z->size);
    z->sign = iszero(z)
              || ((x->sign^y->sign) == 0) ? 1 : -1;
    return z;
}
sdk_ap_t sdk_ap_add(sdk_ap_t x, sdk_ap_t y) {
    sdk_ap_t z;
    assert(x);
    assert(y);
    if (((x->sign^y->sign) == 0)) {
        z = add(mk(maxdigits(x,y) + 1), x, y);
        z->sign = iszero(z) ? 1 : x->sign;
    } else
    if (cmp(x, y) > 0) {
        z = sub(mk(x->ndigits), x, y);
        z->sign = iszero(z) ? 1 : x->sign;
    }
    else {
        z = sub(mk(y->ndigits), y, x);
        z->sign = iszero(z) ? 1 : -x->sign;
    }
    return z;
}
sdk_ap_t sdk_ap_sub(sdk_ap_t x, sdk_ap_t y) {
    sdk_ap_t z;
    assert(x);
    assert(y);
    if (!((x->sign^y->sign) == 0)) {
        z = add(mk(maxdigits(x,y) + 1), x, y);
        z->sign = iszero(z) ? 1 : x->sign;
    } else
    if (cmp(x, y) > 0) {
        z = sub(mk(x->ndigits), x, y);
        z->sign = iszero(z) ? 1 : x->sign;
    } else {
        z = sub(mk(y->ndigits), y, x);
        z->sign = iszero(z) ? 1 : -x->sign;
    }
    return z;
}
sdk_ap_t sdk_ap_div(sdk_ap_t x, sdk_ap_t y) {
    sdk_ap_t q, r;
    assert(x);
    assert(y);
    assert(!iszero(y));
    q = mk(x->ndigits);
    r = mk(y->ndigits);
    {
        sdk_xp_t tmp = OS_ALLOC(x->ndigits + y->ndigits + 2);
        sdk_xp_div(x->ndigits, q->digits, x->digits,
               y->ndigits, y->digits, r->digits, tmp);
        OS_FREE(tmp);
    }
    normalize(q, q->size);
    normalize(r, r->size);
    q->sign = iszero(q)
              || ((x->sign^y->sign) == 0) ? 1 : -1;
    if (!((x->sign^y->sign) == 0) && !iszero(r)) {
        int carry = sdk_xp_sum(q->size, q->digits,
                           q->digits, 1);
        assert(carry == 0);
        normalize(q, q->size);
    }
    sdk_ap_free(&r);
    return q;
}
sdk_ap_t sdk_ap_mod(sdk_ap_t x, sdk_ap_t y) {
    sdk_ap_t q, r;
    assert(x);
    assert(y);
    assert(!iszero(y));
    q = mk(x->ndigits);
    r = mk(y->ndigits);
    {
        sdk_xp_t tmp = OS_ALLOC(x->ndigits + y->ndigits + 2);
        sdk_xp_div(x->ndigits, q->digits, x->digits,
               y->ndigits, y->digits, r->digits, tmp);
        OS_FREE(tmp);
    }
    normalize(q, q->size);
    normalize(r, r->size);
    q->sign = iszero(q)
              || ((x->sign^y->sign) == 0) ? 1 : -1;
    if (!((x->sign^y->sign) == 0) && !iszero(r)) {
        int borrow = sdk_xp_sub(r->size, r->digits,
                            y->digits, r->digits, 0);
        assert(borrow == 0);
        normalize(r, r->size);
    }
    sdk_ap_free(&q);
    return r;
}
sdk_ap_t sdk_ap_pow(sdk_ap_t x, sdk_ap_t y, sdk_ap_t p) {
    sdk_ap_t z;
    assert(x);
    assert(y);
    assert(y->sign == 1);
    assert(!p || p->sign==1 && !iszero(p) && !isone(p));
    if (iszero(x))
        return sdk_ap_new(0);
    if (iszero(y))
        return sdk_ap_new(1);
    if (isone(x))
        return sdk_ap_new((((y)->digits[0]&1) == 0) ? 1 : x->sign);
    if (p)
        if (isone(y))
            z = sdk_ap_mod(x, p);
        else {
            sdk_ap_t y2 = sdk_ap_rshift(y, 1), t = sdk_ap_pow(x, y2, p);
            z = mulmod(t, t, p);
            sdk_ap_free(&y2);
            sdk_ap_free(&t);
            if (!(((y)->digits[0]&1) == 0)) {
                z = mulmod(y2 = sdk_ap_mod(x, p), t = z, p);
                sdk_ap_free(&y2);
                sdk_ap_free(&t);
            }
        }
    else
    if (isone(y))
        z = sdk_ap_addi(x, 0);
    else {
        sdk_ap_t y2 = sdk_ap_rshift(y, 1), t = sdk_ap_pow(x, y2, NULL);
        z = sdk_ap_mul(t, t);
        sdk_ap_free(&y2);
        sdk_ap_free(&t);
        if (!(((y)->digits[0]&1) == 0)) {
            z = sdk_ap_mul(x, t = z);
            sdk_ap_free(&t);
        }
    }
    return z;
}
int sdk_ap_cmp(sdk_ap_t x, sdk_ap_t y) {
    assert(x);
    assert(y);
    if (!((x->sign^y->sign) == 0))
        return x->sign;
    else if (x->sign == 1)
        return cmp(x, y);
    else
        return cmp(y, x);
}
sdk_ap_t sdk_ap_addi(sdk_ap_t x, long int y) {
    unsigned char d[sizeof (unsigned long)];
    struct sdk_ap_s t;
    t.size = sizeof d;
    t.digits = d;
    return sdk_ap_add(x, set(&t, y));
}
sdk_ap_t sdk_ap_subi(sdk_ap_t x, long int y) {
    unsigned char d[sizeof (unsigned long)];
    struct sdk_ap_s t;
    t.size = sizeof d;
    t.digits = d;
    return sdk_ap_sub(x, set(&t, y));
}
sdk_ap_t sdk_ap_muli(sdk_ap_t x, long int y) {
    unsigned char d[sizeof (unsigned long)];
    struct sdk_ap_s t;
    t.size = sizeof d;
    t.digits = d;
    return sdk_ap_mul(x, set(&t, y));
}

sdk_ap_t sdk_ap_mul2i(sdk_ap_t z, long int x, long int y) {
    unsigned char dx[sizeof (unsigned long)];
    unsigned char dy[sizeof (unsigned long)];
    
    struct sdk_ap_s tx;
    tx.size = sizeof dx;
    tx.digits = dx;
    
    struct sdk_ap_s ty;
    ty.size = sizeof dy;
    ty.digits = dy;
    
    return sdk_ap_mul_to(z, set(&tx, x), set(&ty, y));
}

sdk_ap_t sdk_ap_divi(sdk_ap_t x, long int y) {
    unsigned char d[sizeof (unsigned long)];
    struct sdk_ap_s t;
    t.size = sizeof d;
    t.digits = d;
    return sdk_ap_div(x, set(&t, y));
}
int sdk_ap_cmpi(sdk_ap_t x, long int y) {
    unsigned char d[sizeof (unsigned long)];
    struct sdk_ap_s t;
    t.size = sizeof d;
    t.digits = d;
    return sdk_ap_cmp(x, set(&t, y));
}
long int sdk_ap_modi(sdk_ap_t x, long int y) {
    long int rem;
    sdk_ap_t r;
    unsigned char d[sizeof (unsigned long)];
    struct sdk_ap_s t;
    t.size = sizeof d;
    t.digits = d;
    r = sdk_ap_mod(x, set(&t, y));
    rem = sdk_xp_toint(r->ndigits, r->digits);
    sdk_ap_free(&r);
    return rem;
}
sdk_ap_t sdk_ap_lshift(sdk_ap_t x, int s) {
    sdk_ap_t z;
    assert(x);
    assert(s >= 0);
    z = mk(x->ndigits + ((s+7)&~7)/8);
    sdk_xp_lshift(z->size, z->digits, x->ndigits,
              x->digits, s, 0);
    z->sign = x->sign;
    return normalize(z, z->size);
}
sdk_ap_t sdk_ap_rshift(sdk_ap_t x, int s) {
    assert(x);
    assert(s >= 0);
    if (s >= 8*x->ndigits)
        return sdk_ap_new(0);
    else {
        sdk_ap_t z = mk(x->ndigits - s/8);
        sdk_xp_rshift(z->size, z->digits, x->ndigits,
                  x->digits, s, 0);
        normalize(z, z->size);
        z->sign = iszero(z) ? 1 : x->sign;
        return z;
    }
}
long int sdk_ap_toint(sdk_ap_t x) {
    unsigned long u;
    assert(x);
    u = sdk_xp_toint(x->ndigits, x->digits)%(LONG_MAX + 1UL);
    if (x->sign == -1)
        return -(long)u;
    else
        return  (long)u;
}

sdk_ap_t sdk_ap_fromstr(const char *str, int base, char **end) {
    sdk_ap_t z;
    const char *p = str;
    char *endp, sign = '\0';
    int carry;
    assert(p);
    assert(base >= 2 && base <= 36);
    while (*p && isspace(*p))
        p++;
    if (*p == '-' || *p == '+')
        sign = *p++;
    {
        const char *start;
        int k, n = 0;
        for ( ; *p == '0' && p[1] == '0'; p++)
            ;
        start = p;
        for ( ; (  '0' <= *p && *p <= '9' && *p < '0' + base
                   || 'a' <= *p && *p <= 'z' && *p < 'a' + base - 10
                   || 'A' <= *p && *p <= 'Z' && *p < 'A' + base - 10); p++)
            n++;
        for (k = 1; (1<<k) < base; k++)
            ;
        z = mk(((k*n + 7)&~7)/8);
        p = start;
    }
    carry = sdk_xp_fromstr(z->size, z->digits, p,
                       base, &endp);
    assert(carry == 0);
    normalize(z, z->size);
    if (endp == p) {
        endp = (char *)str;
        z = sdk_ap_new(0);
    } else
        z->sign = iszero(z) || sign != '-' ? 1 : -1;
    if (end)
        *end = (char *)endp;
    return z;
}

char *sdk_ap_tostr(char *str, int size, int base, sdk_ap_t x) {
    sdk_xp_t q;
    assert(x);
    assert(base >= 2 && base <= 36);
    assert(str == NULL || size > 1);
    if (str == NULL) {
        {
            int k;
            for (k = 5; (1<<k) > base; k--)
                ;
            size = (8*x->ndigits)/k + 1 + 1;
            if (x->sign == -1)
                size++;
        }
        str = OS_ALLOC(size);
    }
    q = OS_ALLOC(x->ndigits);
    memcpy(q, x->digits, x->ndigits);
    if (x->sign == -1) {
        str[0] = '-';
        sdk_xp_tostr(str + 1, size - 1, base, x->ndigits, q);
    } else
        sdk_xp_tostr(str, size, base, x->ndigits, q);
    OS_FREE(q);
    return str;
}

void sdk_ap_fmt(int code, va_list_box *box,
            int put(int c, void *cl), void *cl,
            unsigned char flags[], int width, int precision) {
    sdk_ap_t x;
    char *buf;
    assert(box && flags);
    x = va_arg(box->ap, sdk_ap_t);
    assert(x);
    buf = sdk_ap_tostr(NULL, 0, 10, x);
    sdk_fmt_putd(buf, strlen(buf), put, cl, flags,
             width, precision);
    OS_FREE(buf);
}

int sdk_ap_object_size(void){
    return sizeof(struct sdk_ap_s);
}
