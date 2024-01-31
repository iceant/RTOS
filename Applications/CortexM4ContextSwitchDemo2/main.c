#include "main.h"
#include "board.h"
#include <stdio.h>
#include <stdlib.h>
#include <n32l40x.h>
#include <os_kernel.h>

////////////////////////////////////////////////////////////////////////////////
////

void delay(unsigned long ms)
{
    while(ms--){
    }
}
////////////////////////////////////////////////////////////////////////////////
////
#define HW32_REG(ADDRESS) (*((volatile unsigned long *)(ADDRESS)))
#define STOP_CPU() __NOP()
#define SVC(code) __asm__ __volatile__("svc %0"::"I"(code):"memory")
#define OS_Start() __asm volatile ("svc #0x00" : : : "memory")

////////////////////////////////////////////////////////////////////////////////
////

////////////////////////////////////////////////////////////////////////////////
////
static void thread_entry(void* p){
    int id = (int)p;
    while(1){
        printf("task%d...\n", id);
    }

}

#define STACK_SIZE 1024

__ALIGNED(4)
static uint8_t stack1[STACK_SIZE];
__ALIGNED(4)
static uint8_t stack2[STACK_SIZE];
__ALIGNED(4)
static uint8_t stack3[STACK_SIZE];
__ALIGNED(4)
static uint8_t stack4[STACK_SIZE];

static os_thread_t thread1;
static os_thread_t thread2;
static os_thread_t thread3;
static os_thread_t thread4;

////////////////////////////////////////////////////////////////////////////////
////
void os_kernel_cpu_init(void){
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
    SysTick_Config(SystemCoreClock/100);
    __set_CONTROL(0x03);
    __ISB();
}

int main(void){
    SCB->CCR|=SCB_CCR_STKALIGN_Msk; // ʹ��˫��ջ����
    board_init();

    os_kernel_init();

    os_thread_init(&thread1, "Thread1", thread_entry, 1, stack1, STACK_SIZE, 20, 10);
    os_thread_startup(&thread1);

    os_thread_init(&thread2, "Thread2", thread_entry, 2, stack2, STACK_SIZE, 20, 10);
    os_thread_startup(&thread2);

    os_thread_init(&thread3, "Thread3", thread_entry, 3, stack3, STACK_SIZE, 20, 10);
    os_thread_startup(&thread3);

    os_thread_init(&thread4, "Thread4", thread_entry, 4, stack4, STACK_SIZE, 20, 10);
    os_thread_startup(&thread4);

    os_kernel_startup();

    while(1){
        printf("Simple Context Switch Demo\n");
        __NOP();
    }
}

