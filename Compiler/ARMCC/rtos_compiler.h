#ifndef INCLUDED_RTOS_COMPILER_H
#define INCLUDED_RTOS_COMPILER_H

#ifndef   C__ASM
#define C__ASM                                  __asm
#endif
#ifndef   C__INLINE
#define C__INLINE                               __inline
#endif
#ifndef   C__STATIC_INLINE
#define C__STATIC_INLINE                        static __inline
#endif
#ifndef   C__STATIC_FORCEINLINE
#define C__STATIC_FORCEINLINE                   static __forceinline
#endif
#ifndef   C__WEAK
#define C__WEAK                                 __attribute__((weak))
#endif
#ifndef   C__ALIGNED
#define C__ALIGNED(x)                           __attribute__((aligned(x)))
#endif

#ifndef   C__SECTION
#define C__SECTION(x)                           __attribute__((section (#x)))
#endif

#ifndef C__PACKED
#define C__PACKED                               __attribute__((__packed__))
#endif

#define C__CONSTRUCTOR_PRIORITY(f, p) \
    void f(void) __attribute__((constructor(p))); \
    void f(void)

#define C__CONSTRUCTOR(f) \
        void f(void) __attribute__((constructor)); \
        void f(void)

#define C__DESTRUCTOR(f) \
        void f(void) __attribute__((destructor)); \
        void f(void)

#endif /*INCLUDED_RTOS_COMPILER_H*/
