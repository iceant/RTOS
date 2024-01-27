#ifndef INCLUDED_OS_CSMC_H
#define INCLUDED_OS_CSMC_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_STDINT_H
#define INCLUDED_STDINT_H
#include <stdint.h>
#endif /*INCLUDED_STDINT_H*/


////////////////////////////////////////////////////////////////////////////////
////

#include <cmsis_csm.h>

#ifndef   __ASM
#define __ASM                                  _asm
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
// NO RETURN is automatically detected hence no warning here
#define __NO_RETURN
#endif
#ifndef   __USED
#warning No compiler specific solution for __USED. __USED is ignored.
#define __USED
#endif
#ifndef   __WEAK
#define __WEAK                                 __weak
#endif
#ifndef   __PACKED
#define __PACKED                               @packed
#endif
#ifndef   __PACKED_STRUCT
#define __PACKED_STRUCT                        @packed struct
#endif
#ifndef   __PACKED_UNION
#define __PACKED_UNION                         @packed union
#endif
#ifndef   __UNALIGNED_UINT32        /* deprecated */
@packed struct T_UINT32 { uint32_t v; };
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
#warning No compiler specific solution for __ALIGNED. __ALIGNED is ignored.
#define __ALIGNED(x)
#endif
#ifndef   __RESTRICT
#warning No compiler specific solution for __RESTRICT. __RESTRICT is ignored.
#define __RESTRICT
#endif


#endif /*INCLUDED_OS_CSMC_H*/
