#include "main.h"
#include "board.h"
#include <stdio.h>
#include <stdlib.h>
#include <n32l40x.h>


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
int main(void){
    SCB->CCR|=SCB_CCR_STKALIGN_Msk; // ʹ��˫��ջ����
    board_init();

    while(1){
        printf("Simple Context Switch Demo\n");
        delay(0x3fffff);
    }
}

