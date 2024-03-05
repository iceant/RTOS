#include "main.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <os_kernel.h>
#include <os_ringbuffer.h>

#include "dev_usart1.h"

////////////////////////////////////////////////////////////////////////////////
////

void delay(unsigned long ms){
    while(ms--){
    }
}
////////////////////////////////////////////////////////////////////////////////
////
#define HW32_REG(ADDRESS) (*((volatile unsigned long *)(ADDRESS)))
#define SVC(code) __asm__ __volatile__("svc %0"::"I"(code):"memory")
#define OS_Start() __asm volatile ("svc #0x00" : : : "memory")


////////////////////////////////////////////////////////////////////////////////
////
#define STACK_SIZE 1024

__ALIGNED(4) static uint8_t stack1[STACK_SIZE];
__ALIGNED(4) static uint8_t stack2[STACK_SIZE];
static os_thread_t thread1;
static os_thread_t thread2;
static os_mutex_t debug_mutex;
////////////////////////////////////////////////////////////////////////////////
////

static int __put(int ch, void* cl)
{
    USART_SendData(USART1, (uint8_t)ch);
    while (USART_GetFlagStatus(USART1, USART_FLAG_TXDE) == RESET)
        ;
    
    return (ch);
}

#define __debug(...) do{os_mutex_lock(&debug_mutex); printf(__VA_ARGS__);os_mutex_unlock(&debug_mutex);}while(0)
//#define __debug(...) printf(__VA_ARGS__)

static void thread_entry(void* p){
    int timeout = (int)p;
    int count = 0;
    while(1){
        __debug("Thread: 0x%08x, Count:%d, Timeout:%d\n", os_thread_self(), count++, timeout);
        os_thread_mdelay(os_tick_from_millisecond(timeout));
    }
}

static HW_USART_RecvResult USART1__Recv(os_ringbuffer_t *buffer)
{
    if(os_ringbuffer_find_str(buffer, 0, "\r\n")!=-1)
    {
        __debug("%s\n", buffer->buffer);
        return kHW_USART_RecvResult_DONE;
    }
    return kHW_USART_RecvResult_CONTINUE;
}



static os_err_t os_native_config(void)
{
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
    SysTick_Config(SystemCoreClock/CPU_TICKS_PER_SECOND); /* 1ms = tick */

    dev_USART1.recv = USART1__Recv;
    dev_USART1.startup();

    return OS_EOK;
}


////////////////////////////////////////////////////////////////////////////////
////
int main(void){
    board_init();

    printf("Kernel Init...\n");
    os_kernel_init(NULL, os_native_config);

    os_mutex_init(&debug_mutex, "DBG", OS_QUEUE_PRIO);


    os_thread_init(&thread1, "Thread1", thread_entry, (void*)500, stack1, STACK_SIZE, 20, 5);
    os_thread_startup(&thread1);

    os_thread_init(&thread2, "Thread2", thread_entry, (void*)1000, stack2, STACK_SIZE, 20, 5);
    os_thread_startup(&thread2);

    os_kernel_startup();
    
    while(1){
        printf("Main Running...\n");
        delay(0x3fffff);
    }
}


