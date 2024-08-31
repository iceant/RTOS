#ifndef INCLUDED_CPU_DEFINITIONS_H
#define INCLUDED_CPU_DEFINITIONS_H

/* -------------------------------------------------------------------------------------------------------------- */


#ifndef INCLUDED_CPU_TYPES_H
#include <cpu_types.h>
#endif /*INCLUDED_CPU_TYPES_H*/

/* -------------------------------------------------------------------------------------------------------------- */
/* CPU SPECIFICATION */
#ifndef CPU_SIZEOF_VOID_P
    #define CPU_SIZEOF_VOID_P 4u
#endif

#ifndef CPU_NBR_BITS
#define CPU_NBR_BITS (CPU_SIZEOF_VOID_P * 8u)
#endif

/* -------------------------------------------------------------------------------------------------------------- */
/* STACK */
#ifndef CPU_STACK_MINIMAL_NBR
    #if defined(__FPU_PRESENT) && defined(__FPU_USED)
        #define CPU_STACK_MINIMAL_NBR (8 /* R0 - xPSR */ \
                + 16 /* S0 - FPSCR  */                   \
                + 8  /* R4 - R11    */                   \
                + 16 /* S16 - S31   */                   \
                + 2  /* LR, CONTROL */)
    #else
        #define CPU_STACK_MINIMAL_NBR ( \
            8       /* R0 - xPSR */     \
            + 8     /* R4 - R11    */   \
            + 2     /* LR, CONTROL */ )
    #endif
#endif

/* -------------------------------------------------------------------------------------------------------------- */
/* CPU FEATURES */
#ifndef CPU_FEATURE_SPINLOCK_SUPPORT
#define CPU_FEATURE_SPINLOCK_SUPPORT    1
#endif

#ifndef CPU_FEATURE_ATOMIC_SUPPORT
#define CPU_FEATURE_ATOMIC_SUPPORT      1
#endif

#ifndef CPU_HARDFAULT_ENABLE
    #define CPU_HARDFAULT_ENABLE 2
#endif

#endif /* INCLUDED_CPU_DEFINITIONS_H */
