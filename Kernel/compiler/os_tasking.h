#ifndef INCLUDED_OS_TASKING_H
#define INCLUDED_OS_TASKING_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /*INCLUDED_STDINT_H*/




////////////////////////////////////////////////////////////////////////////////
////


/*
   * The CMSIS functions have been implemented as intrinsics in the compiler.
   * Please use "carm -?i" to get an up to date list of all intrinsics,
   * Including the CMSIS ones.
   */

#ifndef   __ASM
#define __ASM                                  __asm
#endif
#ifndef   __INLINE
#define __INLINE                               inline
#endif
#ifndef   __STATIC_INLINE
#define __STATIC_INLINE                        static inline
#endif
#ifndef   __STATIC_FORCEINLINE
#define __STATIC_FORCEINLINE                   __STATIC_INLINE
#endif
#ifndef   __NO_RETURN
#define __NO_RETURN                            __attribute__((noreturn))
#endif
#ifndef   __USED
#define __USED                                 __attribute__((used))
#endif
#ifndef   __WEAK
#define __WEAK                                 __attribute__((weak))
#endif
#ifndef   __PACKED
#define __PACKED                               __packed__
#endif
#ifndef   __PACKED_STRUCT
#define __PACKED_STRUCT                        struct __packed__
#endif
#ifndef   __PACKED_UNION
#define __PACKED_UNION                         union __packed__
#endif
#ifndef   __UNALIGNED_UINT32        /* deprecated */
struct __packed__ T_UINT32 { uint32_t v; };
#define __UNALIGNED_UINT32(x)                  (((struct T_UINT32 *)(x))->v)
#endif
#ifndef   __UNALIGNED_UINT16_WRITE
__PACKED_STRUCT T_UINT16_WRITE { uint16_t v; };
#define __UNALIGNED_UINT16_WRITE(addr, val)    (void)((((struct T_UINT16_WRITE *)(void *)(addr))->v) = (val))
#endif
#ifndef   __UNALIGNED_UINT16_READ
__PACKED_STRUCT T_UINT16_READ { uint16_t v; };
#define __UNALIGNED_UINT16_READ(addr)          (((const struct T_UINT16_READ *)(const void *)(addr))->v)
#endif
#ifndef   __UNALIGNED_UINT32_WRITE
__PACKED_STRUCT T_UINT32_WRITE { uint32_t v; };
#define __UNALIGNED_UINT32_WRITE(addr, val)    (void)((((struct T_UINT32_WRITE *)(void *)(addr))->v) = (val))
#endif
#ifndef   __UNALIGNED_UINT32_READ
__PACKED_STRUCT T_UINT32_READ { uint32_t v; };
#define __UNALIGNED_UINT32_READ(addr)          (((const struct T_UINT32_READ *)(const void *)(addr))->v)
#endif
#ifndef   __ALIGNED
#define __ALIGNED(x)              __align(x)
#endif
#ifndef   __RESTRICT
#warning No compiler specific solution for __RESTRICT. __RESTRICT is ignored.
#define __RESTRICT
#endif


#endif /*INCLUDED_OS_TASKING_H*/
