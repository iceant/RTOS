#ifndef INCLUDED_C_COMPILER_H
#define INCLUDED_C_COMPILER_H

#define C_ASM __asm

#define C_STATIC_FORCEINLINE            static __forceinline

#define C_ALIGNED(n)                    __attribute__((aligned(n)))

#define C_WEAK                          __attribute__((weak))

#define C_SECTION(n)                    __attribute__((section(#n)))

#define C_PACKED                        __attribute__((packed))
#define C_PACKED_STRUCT                 __packed struct
#define C_PACKED_UNION                  __packed union

#define C_CONSTRUCTOR()                 __attribute__((constructor))
#define C_CONSTRUCTOR_PRIORITY(p)       __attribute__((constructor(p)))

#define C_DESTRUCTOR()                 __attribute__((destructor))
#define C_DESTRUCTOR_PRIORITY(p)       __attribute__((destructor(p)))

#endif /*INCLUDED_C_COMPILER_H*/
