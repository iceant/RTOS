#ifndef INCLUDED_RTOS_COMPILER_H
#define INCLUDED_RTOS_COMPILER_H

/* ignore some GCC warnings */
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"

#ifndef   C__ASM
#define C__ASM                                  __asm
#endif
#ifndef   C__INLINE
#define C__INLINE                               inline
#endif
#ifndef   C__STATIC_INLINE
#define C__STATIC_INLINE                        static inline
#endif
#ifndef   C__STATIC_FORCEINLINE
#define C__STATIC_FORCEINLINE                   __attribute__((always_inline)) static inline
#endif
#ifndef   C__WEAK
#define C__WEAK                                 __attribute__((weak))
#endif
#ifndef   C__ALIGNED
#define C__ALIGNED(x)                           __attribute__((aligned(x)))
#endif



#endif /*INCLUDED_RTOS_COMPILER_H*/
