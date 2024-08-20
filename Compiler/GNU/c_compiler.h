#ifndef INCLUDED_C_COMPILER_H
#define INCLUDED_C_COMPILER_H

#define C_ASM __asm

#define C_STATIC_FORCEINLINE            __attribute__((always_inline)) static inline

#define C_ALIGNED(n)                    __attribute__((aligned(n)))

#define C_WEAK                          __attribute__((weak))

#define C_SECTION(n)                    __attribute__((section(#n)))

#define C_PACKED                        __attribute__((packed, aligned(1)))
#define C_PACKED_STRUCT                 struct __attribute__((packed, aligned(1)))
#define C_PACKED_UNION                  union __attribute__((packed, aligned(1)))

#define C_CONSTRUCTOR()                 __attribute__((constructor))
#define C_CONSTRUCTOR_PRIORITY(p)       __attribute__((constructor(p)))

#define C_DESTRUCTOR()                 __attribute__((destructor))
#define C_DESTRUCTOR_PRIORITY(p)       __attribute__((destructor(p)))


#endif /*INCLUDED_C_COMPILER_H*/
