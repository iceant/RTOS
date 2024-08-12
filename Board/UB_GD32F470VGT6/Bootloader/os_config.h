#ifndef INCLUDED_OS_CONFIG_H
#define INCLUDED_OS_CONFIG_H

#define RTOS_KERNEL_TLSF_POOL_SIZE (1024*10)
#define OS_NAME_SIZE 16
#define OS_TICKS_PER_SECOND 100

#define OS_PRINTF_USE_DEFAULT_IMPLEMENTATION 1
#define OS_PRINTF_BUFFER_SIZE 1024

#define CPU_STACK_INIT_WITH_PRIVILEGE 1

////////////////////////////////////////////////////////////////////////////////
////
#define ENABLE_USART0
#define ENABLE_4G
#define ENABLE_OLED
#define ENABLE_KEY
#define ENABLE_LED

#endif /*INCLUDED_OS_CONFIG_H*/
