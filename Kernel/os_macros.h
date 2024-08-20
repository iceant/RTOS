#ifndef INCLUDED_OS_MACROS_H
#define INCLUDED_OS_MACROS_H

#define OS_MIN(x, y)           (((x) < (y)) ?  (x) : (y))
#define OS_MAX(x, y)           (((x) > (y)) ?  (x) : (y))
#define OS_ABS(x)              (((x) <  0) ? -(x) : (x))

#define OS_BIT(x)           (1<<(x))
#define OS_BIT_SET(x,p)     ((x)|(1<<(p)))
#define OS_BIT_CLEAR(x,p)   ((x)&(~(1<<(p))))
#define OS_BIT_GET(x,p)     (((x)>>(p))&1)
#define OS_BIT_TOGGLE(x,p)  ((x)^(1<<(p)))

#define OS_ARRAY_SIZE(a)            (sizeof(a) / sizeof((a)[0]))
#define OS_ARRAY_SET(d, n, v)       \
do{                                 \
    size_t i_, n_; \
    for ( n_ = (n), i_ = 0; n_ > 0; --n_, ++i_) \
        (d)[i_] = (v);              \
} while(0)

#define OS_ARRAY_ZERO(d, n)    OS_ARRAY_SET(d, n, 0)
#define OS_ARRAY_COLUMNS(S,E)  ( (E) - (S) + 1 )
#define OS_IS_ARRAY(a)         ((void *)&a == (void *)a)

#define OS_STR2(s)          #s
#define OS_STR(s)           OS_STR2(s)
#define OS_CAT2(a,b)        a##b
#define OS_CAT(a,b)         OS_CAT2(a,b)

#define OS_ONCE2(stmts, i)     \
{                              \
    static int i = 1;          \
    if(i){                     \
        stmts                  \
        i = 0;                 \
    }                          \
}

#define OS_ONCE(stmts)         OS_ONCE2(stmts, __os_once_var__##__COUNTER__)


#define OS_OFFSETOF(TYPE,MEMBER) ((size_t) &((TYPE *)0)->MEMBER)

#define OS_CONTAINER_OF(ptr, type , member) (type *)((char *)ptr - OS_OFFSETOF(type,member))

#endif /*INCLUDED_OS_MACROS_H*/
