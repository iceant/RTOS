#include <printf.h>
#include <stdarg.h>
#include <stdio.h>
#include <bsp_usart0.h>
#include <cpu.h>
#include <os_kernel_lock.h>

#ifndef OS_PRINTF_BUFFER_SIZE
    #define OS_PRINTF_BUFFER_SIZE 1024
#endif

static char os_printf__buffer[OS_PRINTF_BUFFER_SIZE];
static cpu_spinlock_t lock={0};

int os_printf(const char* fmt, ...){
    va_list ap;
    int size;
//    OS_KERNEL_LOCK_VAR();
//    OS_KERNEL_LOCK();
    cpu_spinlock_lock(&lock);
    va_start(ap, fmt);
    size = vsnprintf(os_printf__buffer, OS_PRINTF_BUFFER_SIZE, fmt, ap);
    va_end(ap);
    if(size >= OS_PRINTF_BUFFER_SIZE){
        return OS_ERR_EOVERFLOW;
    }
    
    BSP_USART0_DMATx((uint8_t*)os_printf__buffer, size);
//    OS_KERNEL_UNLOCK();
    cpu_spinlock_unlock(&lock);
    return size;
}

