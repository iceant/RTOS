  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb

  .equ  SCB_ICSR,                    0xE000ED04
  .equ  SCB_ICSR_PENDSVSET_Msk,      0x10000000

  .global  svc_exc_return
  .global  cpu__stack_next_p
  .global  cpu__stack_curr_p
  .global  cpu__stack_switch_flag

  .global SVC_Handler_C
  .global HardFault_Handler_C

  .section  .text.SVC_Handler
  .global SVC_Handler
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
  ISB
  BX LR

  .section  .text.PendSV_Handler
  .global PendSV_Handler
  .type  PendSV_Handler, %function
PendSV_Handler:
    MRS R1, PRIMASK
    CPSID I

    LDR R0, =cpu__stack_switch_flag
    LDR R2, [R0]
    CBZ R2, __PendSV_Exit /* if(cpu__stack_switch_flag==0) goto __PendSV_Exit; */

    MOV R2, #0x00
    STR R2, [R0]    /* cpu__stack_switch_flag=0 */

    LDR R2, =cpu__stack_curr_p
    LDR R0, [R2]
    CBZ R0, __PendSV_SwitchTo /* if(cpu__stack_curr_p==0) goto __PendSV_SwitchTo; */

    MRS R0, PSP     /* Save Current Stack From PSP */
.ifdef __FPU_PRESENT
    TST LR, #0x10
    IT EQ
    VSTMDBEQ R0!, {S16-S31}
.endif
    MOV R2, LR
    MRS R3, CONTROL
    STMDB R0!, {R2-R11}

    LDR R2, =cpu__stack_curr_p
    LDR R3, [R2]
    STR R0, [R3] /* Save Current SP to cpu__stack_curr_p->sp */

__PendSV_SwitchTo:
    LDR R0, =cpu__stack_next_p
    LDR R0, [R0]
    LDR R0, [R0]

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
__PendSV_Exit:
    MSR PRIMASK, R1
    ISB
    BX LR


  .section  .text.HardFault_Handler
  .global HardFault_Handler
  .type  HardFault_Handler, %function
HardFault_Handler:
    TST LR, #4
    ITE EQ
    MRSEQ R0, MSP
    MRSNE R0, PSP
    MOV R1, LR /*Second Parameter*/
    LDR R2, =HardFault_Handler_C
    BX R2



/*
 * cpu_uintptr_t cpu_interrupt_disable();
 */
    .section  .text.cpu_interrupt_disable
    .global  cpu_interrupt_disable
    .type  cpu_interrupt_disable, %function
cpu_interrupt_disable:
    MRS     r0, PRIMASK
    CPSID   I
    BX      LR

/*
 * void cpu_interrupt_enable(cpu_uintptr_t level);
 */
    .section  .text.cpu_interrupt_enable
    .global cpu_interrupt_enable
    .type cpu_interrupt_enable, %function
cpu_interrupt_enable:
    MSR     PRIMASK, r0
    BX      LR


/*
 * cpu_uintptr_t cpu_clz(cpu_uintptr_t value);
 */
    .section  .text.cpu_clz
    .global cpu_clz
    .type cpu_clz, %function
cpu_clz:
    CLZ     R0, R0
    BX      LR

/*
 * cpu_uintptr_t cpu_ctz(cpu_uintptr_t value);
 */
    .section  .text.cpu_ctz
    .global cpu_ctz
    .type cpu_ctz, %function
cpu_ctz:
    RBIT    R0, R0
    CLZ     R0, R0
    BX      LR


/*
 * cpu_uintptr_t cpu_reg_IPSR(void);
 */
    .section  .text.cpu_reg_IPSR
    .global cpu_reg_IPSR
    .type cpu_reg_IPSR, %function
cpu_reg_IPSR:
    MRS R0, IPSR
    BX      LR

/*
 * cpu_uintptr_t cpu_reg_CONTROL(void);
 */
    .section  .text.cpu_reg_CONTROL
    .global cpu_reg_CONTROL
    .type cpu_reg_CONTROL, %function
cpu_reg_CONTROL:
    MRS R0, CONTROL
    BX      LR

.end


