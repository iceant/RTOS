# 目标:实现四个任务轮流切换

假设有4个线程任务， `task0` , `task1`, `task2`, `task3`; 这些任务的定义如下:

```c
static void task0(void){
    while(1){
        printf("task0...\n");
    }
}
```

```c
static void task1(void){
    while(1){
        printf("task1...\n");
    }
}
```

```c
static void task2(void){
    while(1){
        printf("task2...\n");
    }
}
```

```c
static void task3(void){
    while(1){
        printf("task3...\n");
    }
}
```

下面来探讨一下如何在 ARM Cortex-M4 中实现这四个任务轮流切换



# CPU 任务切换的定义

要实现任务的切换，先要理解什么是任务切换？对于CPU来说，任务在运行的时候，需要使用寄存器来保存运算的中间状态，当任务切换的时候，需要将正在运行任务的寄存器保存到内存中，然后将下一个要运行的任务的中间状态从内存恢复到CPU的寄存器中，这样就可以实现任务的切换了。

但是每个CPU的寄存器类型和数量是不同的，因此需要为特定的CPU编写上下文切换的代码。

CPU 会自动对某些寄存器进行保存，不在程序的控制范围内，如果一个程序中用到了没有自动保存的寄存器，就会发生状态错误；因此，对于CPU不会自动保存的寄存器，需要程序特殊照顾，手动保存当前运行任务的寄存器，并手动将下一个要运行任务的寄存器从内存中恢复到寄存器中。



# 栈在内存中的布局

| 位置 | 名称          | 说明                                                            |
| ---- | ------------- |---------------------------------------------------------------|
| 17   | PSR           | `stack_addr + sizeof(stack_addr)` 栈顶                          |
| 16   | PC            | thread_entry                                                  |
| 15   | LR            |                                                               |
| 14   | R12           |                                                               |
| 13   | R3            |                                                               |
| 12   | R2            |                                                               |
| 11   | R1            |                                                               |
| 10   | R0            | R0 ~ PSR 由 MCU 自动压栈; parameter                                |
| 09   | R11           |                                                               |
| 08   | R10           |                                                               |
| 07   | R9            |                                                               |
| 06   | R8            |                                                               |
| 05   | R7            |                                                               |
| 04   | R6            |                                                               |
| 03   | R5            |                                                               |
| 02   | R4            |                                                               |
| 01   | CONTROL       |                                                               |
| 00   | LR/EXC_RETURN | `stack_addr + sizeof(stack_addr) - 18*4` ; 每个寄存器4个字节，一共18个寄存器 |

1. R0 ~ PSR 由 MCU 自动压栈
2. LR/EXC_RETURN ~ R11 由 `PendSV_Handler` 压栈

# 系统启动

Cortex-M4 系列的CPU提供了 `SVC <number>` 的服务调用指令，通过这个指令可以实现操作系统的初始化，或者驱动的调用等系统功能。

## SVC_Handler

```assembly
  .section  .text.SVC_Handler
  .type  SVC_Handler, %function
SVC_Handler:
  TST LR, #4
  ITE EQ
  MRSEQ R0, MSP
  MRSNE R0, PSP
  LDR R1, =svc_exc_return
  STR LR, [R1]
  BL SVC_Handler_C
  LDR R1, =svc_exc_return
  LDR LR,[R1]
  BX LR
```

## SVC_Handler_C

```c
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
```

## PendSV_Handler

```assembly
  .section  .text.PendSV_Handler
  .type  PendSV_Handler, %function
PendSV_Handler:
    CPSID I
    MRS R0, PSP
.ifdef __FPU_PRESENT
    TST LR, #0x10
    IT EQ
    VSTMDBEQ R0!, {S16-S31}
.endif
    MOV R2, LR
    MRS R3, CONTROL
    STMDB R0!, {R2-R11}
    LDR R1, =curr_stack
    LDR R2, [R1]
    LDR R3, =PSP_array
    STR R0, [R3, R2, LSL #2]

    LDR R4, =next_stack
    LDR R4, [R4]
    STR R4, [R1]
    LDR R0, [R3, R4, LSL #2]
    LDMIA R0!, {R2-R11}
    MOV LR, R2
    MSR CONTROL, R3
    ISB
.ifdef __FPU_PRESENT
    TST LR, #0x10
    IT EQ
    VLDMIAEQ R0!, {S16-S31}
.endif
    MSR PSP, R0
    ISB
    CPSIE I
    BX LR
```

# 错误处理

## HardFault_Handler

```assembly
  .section  .text.HardFault_Handler
  .type  HardFault_Handler, %function
HardFault_Handler:
    TST LR, #4
    ITE EQ
    MRSEQ R0, MSP
    MRSNE R0, PSP
    MOV R1, LR /*Second Parameter*/
    LDR R2, =HardFault_Handler_C
    BX R2
```

## HardFault_Handler_C

```c
#include <HardFaultHandler.h>
#include <n32l40x.h>
#include <stdio.h>

void show_cfsr(unsigned long cfsr);

void show_hfsr(volatile uint32_t hfsr);

void show_dfsr(volatile uint32_t dfsr);

void show_exc_return(unsigned int value);

void HardFault_Handler_C(unsigned long * hardfault_args, unsigned int lr_value)
{
    unsigned long stacked_r0;
    unsigned long stacked_r1;
    unsigned long stacked_r2;
    unsigned long stacked_r3;
    unsigned long stacked_r12;
    unsigned long stacked_lr;
    unsigned long stacked_pc;
    unsigned long stacked_psr;
    unsigned long cfsr;
    unsigned long bus_fault_address;
    unsigned long memmanage_fault_address;
    
    bus_fault_address = SCB->BFAR;
    memmanage_fault_address = SCB->MMFAR;
    cfsr = SCB->CFSR;
    
    stacked_r0 = ((unsigned long)hardfault_args[0]);
    stacked_r1 = ((unsigned long)hardfault_args[1]);
    stacked_r2 = ((unsigned long)hardfault_args[2]);
    stacked_r3 = ((unsigned long)hardfault_args[3]);
    stacked_r12 = ((unsigned long)hardfault_args[4]);
    stacked_lr = ((unsigned long)hardfault_args[5]);
    stacked_pc = ((unsigned long)hardfault_args[6]);
    stacked_psr = ((unsigned long)hardfault_args[7]);
    
    printf("[HardFault]\n");
    printf("-- Stack Frame --\n");
    printf("R0  = 0x%08x\n", stacked_r0);
    printf("R1  = 0x%08x\n", stacked_r1);
    printf("R2  = 0x%08x\n", stacked_r2);
    printf("R3  = 0x%08x\n", stacked_r3);
    printf("R12 = 0x%08x\n", stacked_r12);
    printf("LR  = 0x%08x\n", stacked_lr);
    printf("PC  = 0x%08x\n", stacked_pc);
    printf("PSR = 0x%08x\n", stacked_psr);
    
    printf("-- FSR/FAR --\n");
    printf("CFSR = 0x%08x ", cfsr); show_cfsr(cfsr);
    printf("HFSR = 0x%08x ", SCB->HFSR); show_hfsr(SCB->HFSR);
    printf("DFSR = 0x%08x ", SCB->DFSR); show_dfsr(SCB->DFSR);
    printf("AFSR = 0x%08x\n", SCB->AFSR);
    if(cfsr & 0x0080) printf("MMFAR = 0x%08x\n", memmanage_fault_address);
    if(cfsr & 0x8000) printf("BFAR  = 0x%08x\n", bus_fault_address);
    printf("-- MISC --\n");
    printf("LR/EXC_RETURN = 0x%08x ", lr_value); show_exc_return(lr_value);
    while(1);
}

void show_exc_return(unsigned int value) {
    switch (value) {
        case 0xFFFFFFE1:
            printf("ISR/MSP/FPCA=1");
            break;
        case 0xFFFFFFF1:
            printf("ISR/MSP/FPCA=0");
            break;
        case 0xFFFFFFE9:
            printf("THD/MSP/FPCA=1");
            break;
        case 0xFFFFFFF9:
            printf("THD/MSP/FPCA=0");
            break;
        case 0xFFFFFFED:
            printf("ISR/PSP/FPCA=1");
            break;
        case 0xFFFFFFFD:
            printf("ISR/PSP/FPCA=0");
            break;
        default:
            printf("INVALID");
            break;
    }
    printf("\n");
    
}

void show_dfsr(volatile uint32_t dfsr) {
    if((dfsr) & (1<<0)) printf("HALTED ");
    if((dfsr) & (1<<1)) printf("BKPT ");
    if((dfsr) & (1<<2)) printf("DWTTRAP ");
    if((dfsr) & (1<<3)) printf("VCATCH ");
    if((dfsr) & (1<<4)) printf("EXTERNAL ");
    printf("\n");
}

void show_hfsr(volatile uint32_t hfsr) {
    if((hfsr) & (1<<1)) printf("VECTBL ");
    if((hfsr) & (1<<30)) printf("FORCED ");
    if((hfsr) & (1<<31)) printf("DEBUGEVT ");
    printf("\n");
}

void show_cfsr(unsigned long cfsr) {
    if((cfsr) & (1<<0)) printf("IACCVIOL ");
    if((cfsr) & (1<<1)) printf("DACCVIOL ");
    if((cfsr) & (1<<3)) printf("MUNSTKERR ");
    if((cfsr) & (1<<4)) printf("MSTKERR ");
    if((cfsr) & (1<<5)) printf("MLSPERR ");
    if((cfsr) & (1<<7)) printf("MMARVALID ");
    
    if((cfsr) & (1<<8)) printf("IBUSERR ");
    if((cfsr) & (1<<9)) printf("PRECISERR ");
    if((cfsr) & (1<<10)) printf("IMPRECISERR ");
    if((cfsr) & (1<<11)) printf("UNSTKERR ");
    if((cfsr) & (1<<12)) printf("STKERR ");
    if((cfsr) & (1<<13)) printf("LSPERR ");
    if((cfsr) & (1<<15)) printf("BFARVALID ");
    
    if((cfsr) & (1<<16)) printf("UNDEFINSTR ");
    if((cfsr) & (1<<17)) printf("INVSTATE ");
    if((cfsr) & (1<<18)) printf("INVPC ");
    if((cfsr) & (1<<19)) printf("NOCP ");
    if((cfsr) & (1<<24)) printf("UNALIGNED ");
    if((cfsr) & (1<<25)) printf("DIVBYZERO ");
    
    printf("\n");
}

```

