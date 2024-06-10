#ifndef INCLUDED_OS_CONFIG_H
#define INCLUDED_OS_CONFIG_H

#define CPU_MODEL ARM_CortexM4
#define RTOS_KERNEL_TLSF_POOL_SIZE (1024*10)
#define OS_PRINTF_USE_DMA 0

#define OS_TICKS_PER_SECOND 100

#define CPU_STACK_INIT_WITH_PRIVILEGE 1

#endif /*INCLUDED_OS_CONFIG_H*/
