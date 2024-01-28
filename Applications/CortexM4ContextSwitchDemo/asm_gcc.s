  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb

  .global  svc_exc_return
  .global  curr_stack
  .global  next_stack
  .global  PSP_array
  .global SVC_Handler
  .global SVC_Handler_C
  .global PendSV_Handler
  .global HardFault_Handler
  .global HardFault_Handler_C

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

.end

