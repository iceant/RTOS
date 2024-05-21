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


#endif /*INCLUDED_RTOS_COMPILER_H*/
