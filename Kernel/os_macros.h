#ifndef INCLUDED_OS_MACROS_H
#define INCLUDED_OS_MACROS_H

#define OS_BIT(x)           (1<<(x))
#define OS_BIT_SET(x,p)     ((x)|(1<<(p)))
#define OS_BIT_CLEAR(x,p)   ((x)&(~(1<<(p))))
#define OS_BIT_GET(x,p)     (((x)>>(p))&1)
#define OS_BIT_TOGGLE(x,p)  ((x)^(1<<(p)))

#define OS_ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))

#endif /* INCLUDED_OS_MACROS_H */
