#include <printf.h>
#include <stdarg.h>
#include <stdio.h>
#include <bsp_usart0.h>
#include <cpu.h>
#include <cpu_kernel_functions.h>

#ifndef OS_PRINTF_BUFFER_SIZE
    #define OS_PRINTF_BUFFER_SIZE 1024
#endif

static char os_printf__buffer[OS_PRINTF_BUFFER_SIZE];
static cpu_spinlock_t lock={0};

static int os_printf_lock(void){
    if(cpu_in_privilege()){
        return cpu_local_basepri_disable(1);
    }else{
        return cpu_kernel_lock(1);
    }
}

static void os_printf_unlock(int level){
    if(cpu_in_privilege()){
        cpu_local_basepri_enable(level);
    }else{
        cpu_kernel_unlock(level);
    }
}

int os_printf(const char* fmt, ...){
    va_list ap;
    int size;
//    OS_KERNEL_LOCK_VAR();
//    OS_KERNEL_LOCK();
//    cpu_spinlock_lock(&lock);
    int level = os_printf_lock();
    va_start(ap, fmt);
    size = vsnprintf(os_printf__buffer, OS_PRINTF_BUFFER_SIZE, fmt, ap);
    va_end(ap);
    if(size >= OS_PRINTF_BUFFER_SIZE){
        return OS_ERR_EOVERFLOW;
    }

    BSP_USART0_DMATx((uint8_t*)os_printf__buffer, size);
    os_printf_unlock(level);
//    OS_KERNEL_UNLOCK();
//    cpu_spinlock_unlock(&lock);
    return size;
}

