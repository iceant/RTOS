#include "main.h"
#include "board.h"
#include <stdio.h>
#include <stdlib.h>
#include <n32l40x.h>

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
volatile unsigned long systick_count = 0;
unsigned long task0_stack[1024];
unsigned long task1_stack[1024];
unsigned long task2_stack[1024];
unsigned long task3_stack[1024];
unsigned int curr_stack = 0;
unsigned int next_stack = 0;
unsigned int PSP_array[4]={0};
unsigned int svc_exc_return;
////////////////////////////////////////////////////////////////////////////////
////
static void task0(void){
    while(1){
        printf("task0...\n");
        delay(0x0003FFFF);
    }
    
}

static void task1(void){
    while(1){
        printf("task1...\n");
        delay(0x0003FFFF);
    }
    
}

static void task2(void){
    while(1){
        printf("task2...\n");
        delay(0x0003FFFF);
    }
}

static void task3(void){
    while(1){
        printf("task3...\n");
        delay(0x0003FFFF);
    }
}

/*
17  PSR
16  PC
15  LR
14  R12
13  R3
12  R2
11  R1
10  R0          <<-- PSP
09  R11
08  R10
07  R9
06  R8
05  R7
04  R6
03  R5
02  R4
01  CONTROL
00  LR              <<--- PSP_array[0]
--------------------
 */
void SVC_Handler_C(unsigned  int * svc_args)
{
    unsigned char svc_number;
    svc_number = ((char*)svc_args[6])[-2];
    switch (svc_number) {
        case 0:
            printf("SVC 0\n");
            
            PSP_array[0] = ((unsigned int)task0_stack) + (sizeof(task0_stack)) - 18*4;
            HW32_REG((PSP_array[0] + (16<<2))) = (unsigned long) task0;     /*PC*/
            HW32_REG((PSP_array[0] + (17<<2))) = 0x01000000;                /*PSR*/
            HW32_REG((PSP_array[0])) = 0xFFFFFFFDUL;                        /*EXC_RETURN*/
            HW32_REG((PSP_array[0] + (1<<2))) = 0x03;                       /*CONTROL: 无特权, 无 FP*/
            
            PSP_array[1] = ((unsigned int)task1_stack) + (sizeof(task1_stack)) - 18*4;
            HW32_REG((PSP_array[1] + (16<<2))) = (unsigned long) task1;
            HW32_REG((PSP_array[1] + (17<<2))) = 0x01000000;
            HW32_REG((PSP_array[1])) = 0xFFFFFFFDUL;
            HW32_REG((PSP_array[1] + (1<<2))) = 0x03; /*CONTROL: 无特权, 无 FP*/
            
            PSP_array[2] = ((unsigned int)task2_stack) + (sizeof(task2_stack)) - 18*4;
            HW32_REG((PSP_array[2] + (16<<2))) = (unsigned long) task2;
            HW32_REG((PSP_array[2] + (17<<2))) = 0x01000000;
            HW32_REG((PSP_array[2])) = 0xFFFFFFFDUL;
            HW32_REG((PSP_array[2] + (1<<2))) = 0x03; /*CONTROL: 无特权, 无 FP*/
            
            PSP_array[3] = ((unsigned int)task3_stack) + (sizeof(task3_stack)) - 18*4;
            HW32_REG((PSP_array[3] + (16<<2))) = (unsigned long) task3;
            HW32_REG((PSP_array[3] + (17<<2))) = 0x01000000;
            HW32_REG((PSP_array[3])) = 0xFFFFFFFDUL;
            HW32_REG((PSP_array[3] + (1<<2))) = 0x03; /*CONTROL: 无特权, 无 FP*/
        
            curr_stack = 0;
            svc_exc_return = HW32_REG((PSP_array[curr_stack]));
            __set_PSP((PSP_array[curr_stack] + 10*4));
            NVIC_SetPriority(PendSV_IRQn, 0xFF); /*最低优先级*/
            SysTick_Config(SystemCoreClock/1000);
            __set_CONTROL(0x03);
            __ISB();
            break;
        default:
            printf("ERROR: Unknown SVC service number.\n");
            printf(" - SVC number 0x%x\n", svc_number);
            STOP_CPU();
            break;
    }
}

void SysTick_Handler(void)
{
    systick_count++;
//    printf("tick: %lu\n", systick_count);
    switch (curr_stack) {
        case 0:
            next_stack=1;
            break;
        case 1:
            next_stack=2;
            break;
        case 2:
            next_stack=3;
            break;
        case 3:
            next_stack=0;
            break;
        default:
            next_stack=0;
            printf("ERROR: curr_stack = %x\n", curr_stack);
            STOP_CPU();
            break;
    }
    if(curr_stack!=next_stack){
        SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
    }
}

////////////////////////////////////////////////////////////////////////////////
////


int main(void){
    SCB->CCR|=SCB_CCR_STKALIGN_Msk; // 使能双字栈对齐
    
    board_init();
    
    printf("Simple Context Switch Demo\n");
    OS_Start();
    
    while(1){
        printf("Simple Context Switch Demo\n");
        __NOP();
    }
}

