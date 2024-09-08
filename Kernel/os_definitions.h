#ifndef INCLUDED_OS_DEFINITIONS_H
#define INCLUDED_OS_DEFINITIONS_H

/* -------------------------------------------------------------------------------------------------------------- */
#ifndef INCLUDED_CPU_H
#include <cpu.h>
#endif /*INCLUDED_CPU_H*/

#if defined __has_include
#  if __has_include (<os_config.h>)
#    include <os_config.h>
#  endif
#else
    #include <os_config.h>
#endif



/* -------------------------------------------------------------------------------------------------------------- */

#ifndef OS_SIZEOF_VOID_P
#define OS_SIZEOF_VOID_P (CPU_SIZEOF_VOID_P)
#endif

#ifndef OS_CPU_NBR_BITS
    #define OS_CPU_NBR_BITS (CPU_NBR_BITS)
#endif

#ifndef OS_CPU_NBR_BYTES
    #define OS_CPU_NBR_BYTES (OS_CPU_NBR_BITS>>3)
#endif

#ifndef OS_ALIGN_SIZE
    #define OS_ALIGN_SIZE (OS_CPU_NBR_BYTES * 2)
#endif
/* -------------------------------------------------------------------------------------------------------------- */

#ifndef OS_TICK_PER_SECOND
    #define OS_TICK_PER_SECOND 1000u
#endif

#ifndef OS_MEMORY_POOL_SIZE
    #define OS_MEMORY_POOL_SIZE (10*1024)
#endif

#ifndef OS_MEMORY_USE_TLFS
    #define OS_MEMORY_USE_TLFS 1
#endif

#ifndef OS_PRIORITY_MAX
    #define OS_PRIORITY_MAX 32
#endif

#ifndef OS_NAME_MAX_SIZE
    #define OS_NAME_MAX_SIZE 16
#endif

#ifndef OS_THREAD_STACK_MINIMAL_BYTES
    #define OS_THREAD_STACK_MINIMAL_BYTES (CPU_STACK_MINIMAL_NBR * OS_CPU_NBR_BYTES)
#endif

#ifndef OS_THREAD_IDLE_PRIORITY
    #define OS_THREAD_IDLE_PRIORITY OS_PRIORITY_MAX-1
#endif

#ifndef OS_THREAD_IDLE_STACK_SIZE
    #define OS_THREAD_IDLE_STACK_SIZE 512
#endif

#ifndef OS_LOCK_BASE_PRIORITY
#define OS_LOCK_BASE_PRIORITY 0x10
#endif

#endif /* INCLUDED_OS_DEFINITIONS_H */
