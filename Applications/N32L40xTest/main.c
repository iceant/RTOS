#include "main.h"
#include "board.h"
#include <stdio.h>
#include <stdlib.h>
#include <n32l40x.h>
#include <os_kernel.h>
#include <string.h>
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
__ALIGNED(4) static uint8_t stack3[STACK_SIZE];
__ALIGNED(4) static uint8_t stack4[STACK_SIZE];
__ALIGNED(4) static uint8_t sem_thread_stack[STACK_SIZE];

static os_thread_t thread1;
static os_thread_t thread2;
static os_thread_t thread3;
static os_thread_t thread4;
static os_thread_t sem_thread;

#define USART1_RX_BUFFER_SZ 256
static uint8_t USART1_RxBuffer[USART1_RX_BUFFER_SZ];
static os_size_t USART1_RxIdx=0;

static void thread_entry(void* p){
    int id = (int)p;
    while(1){
        printf("Thread %d\n", id);
        os_thread_mdelay(1000);
    }
}

static os_sem_t rx_sem;

static void sem_thread_entry(void* p){
    os_err_t  err;
    while(1){
//        err = os_sem_take(&rx_sem, OS_WAIT_INFINITY);
        err = os_sem_take(&rx_sem, os_tick_from_millisecond(1000));
        if(USART1_RxIdx==0) continue;
        if(strstr(USART1_RxBuffer, "\r\n")!=0){
            printf("thread: %p, wait=%d, buffer_size=%d\n", (void*)os_thread_self(), err, USART1_RxIdx);
            printf("%s\n", USART1_RxBuffer);
            memset(USART1_RxBuffer, 0, sizeof(USART1_RxBuffer));
            USART1_RxIdx = 0;
        }
    }
}

void os_kernel_cpu_config(void)
{
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
    SysTick_Config(SystemCoreClock/CPU_TICKS_PER_SECOND); /* 1ms = tick */
}
////////////////////////////////////////////////////////////////////////////////
////
int main(void){
    NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0000);
    SCB->CCR|=SCB_CCR_STKALIGN_Msk; // 栈对齐
    board_init();

    os_kernel_init();
    
    os_thread_init(&thread1, "Thread1", thread_entry, 1, stack1, STACK_SIZE, 20, 10);
    os_thread_startup(&thread1);
    
    os_thread_init(&thread2, "Thread2", thread_entry, 2, stack2, STACK_SIZE, 20, 5);
    os_thread_startup(&thread2);
    
    os_thread_init(&thread3, "Thread3", thread_entry, 3, stack3, STACK_SIZE, 10, 10);
    os_thread_startup(&thread3);
    
    os_thread_init(&thread4, "Thread4", thread_entry, 4, stack4, STACK_SIZE, 15, 5);
    os_thread_startup(&thread4);
    
    os_sem_init(&rx_sem, "rx_sem", 0, OS_QUEUE_FIFO);
    
    os_thread_init(&sem_thread, "sem_thd", sem_thread_entry, 0, sem_thread_stack, sizeof(sem_thread_stack), 20, 10);
    os_thread_startup(&sem_thread);
    
    os_kernel_startup();
    
    while(1){
        printf("Main Running...\n");
        delay(0x3fffff);
    }
}

////////////////////////////////////////////////////////////////////////////////
////

void USART1_IRQHandler(void)
{
    os_interrupt_enter();
    if (USART_GetIntStatus(USART1, USART_INT_RXDNE) != RESET)
    {
        while(USART_GetIntStatus(USART1, USART_INT_RXDNE) != RESET){
            USART1_RxBuffer[USART1_RxIdx++] = USART_ReceiveData(USART1);
            if(USART1_RxIdx==USART1_RX_BUFFER_SZ) {
                USART1_RxIdx = 0;
            }
        }
        os_sem_release(&rx_sem);
    }
    os_interrupt_leave();
}

