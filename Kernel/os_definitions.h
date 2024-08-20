#ifndef INCLUDED_OS_DEFINITIONS_H
#define INCLUDED_OS_DEFINITIONS_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef OS_SIZEOF_VOID_P
#define OS_SIZEOF_VOID_P 4
#endif

#ifndef OS_KERNEL_CPU_NBR_BITS
#define OS_KERNEL_CPU_NBR_BITS (OS_SIZEOF_VOID_P * 8)
#endif

#ifndef OS_ALIGN_SIZE
#define OS_ALIGN_SIZE (OS_SIZEOF_VOID_P*2)
#endif

#ifndef OS_KERNEL_USE_TLSF
#define OS_KERNEL_USE_TLSF 1
#endif

#ifndef OS_KERNEL_MEMORY_POOL_SIZE
#define OS_KERNEL_MEMORY_POOL_SIZE (1024*10)
#endif

#ifndef OS_KERNEL_PRIORITY_MAX
#define OS_KERNEL_PRIORITY_MAX 32
#endif

#ifndef OS_KERNEL_PRIORITY_TABLE_SIZE
#define OS_KERNEL_PRIORITY_TABLE_SIZE (((OS_KERNEL_PRIORITY_MAX - 1u) / OS_KERNEL_CPU_NBR_BITS) + 1u)
#endif

#ifndef OS_KERNEL_NAME_SIZE
#define OS_KERNEL_NAME_SIZE (16)
#endif

#ifndef OS_KERNEL_TICKS_PER_SECOND
#define OS_KERNEL_TICKS_PER_SECOND 1000u
#endif


#endif /*INCLUDED_OS_DEFINITIONS_H*/
