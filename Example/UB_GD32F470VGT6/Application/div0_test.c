#include <stdio.h>

void div0_test(void)
{
    volatile int * SCB_CCR = (volatile int *)0xE000ED14; // SCB->CCR
    int x,y,z;
    *SCB_CCR |= (1 << 4); /* bit4: DIV_0_TRP. */
    x = 10;
    y = 0;
    z = x / y;
    printf("z:%d", z);
}
