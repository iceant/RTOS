#include "main.h"
#include "board.h"
#include <stdio.h>
#include <stdlib.h>

void delay(uint32_t ms)
{
    while(ms--){
    }
}

int main(void){
    board_init();
    
    int nCount = 0;
    while(1){
        printf("Hello... %d\n", nCount++);
        USART1_SendString("hello...\n");
        delay(0x7FFFFF);
    }
}