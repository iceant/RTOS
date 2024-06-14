#include <exception_test.h>


int Exception_Test_BusFault_Read(void)
{
    int r;
    volatile unsigned int* p;

    p = (unsigned int*)0x00100000;  // 0x00100000-0x07FFFFFF is reserved on STM32F4
    r = *p;

    return r;
}

int Exception_Test_BusFault_Write(void)
{
    int r;
    volatile unsigned int* p;

    p = (unsigned int*)0x00100000;  // 0x00100000-0x07FFFFFF is reserved on STM32F4
    *p = 0x00BADA55;

    return r;
}

int Exception_Test_BusFault_Exec(void)
{
    int r;
    int (*pF)(void);

    pF = (int(*)(void))0x00100000;  // 0x00100000-0x07FFFFFF is reserved on STM32F4

    r = pF();

    return r;
}

////////////////////////////////////////////////////////////////////////////////
////
int Exception_Test_UsageFault_ExecNoThumb(void)
{
    int r;
    int (*pF)(void);

    pF = (int(*)(void))0x00000000;

    r = pF();

    return r;
}

int Exception_Test_UsageFault_ExecUndefinedInstruction(void)
{
    static const unsigned short _UDF[4] = {0xDEAD, 0xDEAD, 0xDEAD, 0xDEAD};
    int r;
    int (*pF)(void);

    pF = (int(*)(void))(((char*)&_UDF) + 1);

    r = pF();

    return r;
}

int Exception_Test_UsageFault_UnalignedWordAccess(void)
{
    int r;
    volatile unsigned int* p;

    p = (unsigned int*)0x20000002;  // 0x00100000-0x07FFFFFF is reserved on STM32F4
    r = *p;

    return r;
}

int Exception_Test_UsageFault_DivideByZero(void)
{
    int r;
    volatile unsigned int a;
    volatile unsigned int b;

    a = 1;
    b = 0;
    r = a / b;

    return r;
}

////////////////////////////////////////////////////////////////////////////////
////

int Exception_Test_HardFault_InterruptWithIllegalVectorTable(void)
{
    int r;

    SCB->VTOR = 0x001000000;            // Relocate vector table to illegal address
    SCB->ICSR = SCB_ICSR_PENDSVSET_Msk; // Trigger PendSV exception to read invalid vector

    __ISB();
    __DSB();

    return r;
}







