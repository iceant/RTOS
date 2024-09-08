#include <printf.h>
#include <stdarg.h>
#include <stdio.h>
#include <bsp_usart0.h>
#include <cpu.h>
#include <cpu_kernel_functions.h>

#ifndef OS_PRINTF_BUFFER_SIZE
    #define OS_PRINTF_BUFFER_SIZE 1024
#endif

static char os_printf__buffer[2][OS_PRINTF_BUFFER_SIZE];
static int os_printf__buffer_idx = 0;
static int os_printf__buffer_write_idx = 0;
static cpu_spinlock_t lock={0};

/*
  1. 使用 os_critical 关闭调度，造成只有一个任务在运行
  2.
 */

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t os_printf__thread_stack[1024];
static os_thread_t os_printf__thread;
static os_sem_t os_printf__sem;
static bool os_printf__flag = false;
static char* write_buffer_p = os_printf__buffer[0];
static char* read_buffer_p = 0;
static int read_buffer_size = 0;
static void os_printf_thread_entry(void* p){
    while(1){
        os_sem_take(&os_printf__sem, OS_WAITING_INFINITY);
        BSP_USART0_DMATx((uint8_t*)read_buffer_p, read_buffer_size);
        os_printf__flag = false;
    }
}

void os_printf_init(void){
    os_sem_init(&os_printf__sem, "printf_sem", 0, OS_SEM_FLAG_FIFO);
    OS_THREAD_INIT(&os_printf__thread, "printf", os_printf_thread_entry, 0
                   , os_printf__thread_stack, OS_ARRAY_SIZE(os_printf__thread_stack), 10, 10);
    os_thread_startup(&os_printf__thread);
}

int os_printf(const char* fmt, ...){
    va_list ap;
    int size;
    
//    os_critical_enter();
    
    os_printf__flag = false;
    char* buffer = os_printf__buffer[os_printf__buffer_idx];
    os_printf__buffer_idx+=1;
    if(os_printf__buffer_idx==2){
        os_printf__buffer_idx = 0;
    }
    va_start(ap, fmt);
    size = vsnprintf(buffer, OS_PRINTF_BUFFER_SIZE, fmt, ap);
    va_end(ap);
    BSP_USART0_DMATx((uint8_t*)buffer, size);


//    if((size + os_printf__buffer_write_idx) >= OS_PRINTF_BUFFER_SIZE){
//        read_buffer_p = buffer;
//        read_buffer_size = os_printf__buffer_write_idx;
//        os_printf__buffer_idx+=1;
//        if(os_printf__buffer_idx==2){
//            os_printf__buffer_idx = 0;
//        }
//        buffer = os_printf__buffer[os_printf__buffer_idx];
//        os_printf__buffer_write_idx = 0;
//        va_start(ap, fmt);
//        size = vsnprintf(buffer+os_printf__buffer_write_idx, OS_PRINTF_BUFFER_SIZE-os_printf__buffer_write_idx, fmt, ap);
//        va_end(ap);
//        os_printf__flag = true;
//    }
    
//    os_printf__buffer_write_idx += size;
    
//    os_critical_leave();
    
//    if(os_printf__flag) os_sem_release(&os_printf__sem);
    return size;
}

