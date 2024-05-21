	.cpu cortex-m7
	.arch armv7e-m
	.fpu fpv5-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 1
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"cpu_svc.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_svc.c"
	.section	.text.svc0,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	svc0, %function
svc0:
.LFB37:
	.loc 1 11 23
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 12 5
	.loc 1 12 6 is_stmt 0
	mov	r2, #-536813568
	ldr	r3, [r2, #3332]
	.loc 1 12 49
	orr	r3, r3, #268435456
	str	r3, [r2, #3332]
	.loc 1 13 1
	bx	lr
	.cfi_endproc
.LFE37:
	.size	svc0, .-svc0
	.section	.text.svc1,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	svc1, %function
svc1:
.LFB38:
	.loc 1 15 23 is_stmt 1
	.cfi_startproc
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 16 5
.LBB12:
.LBB13:
	.file 2 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
	.loc 2 524 5
.LBB14:
.LBB15:
	.loc 2 346 5
	.syntax unified
@ 346 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE15:
.LBE14:
	.loc 2 526 5
	.loc 2 527 40 is_stmt 0
	mov	r1, #-536813568
	ldr	r2, [r1, #3340]
	.loc 2 527 113
	and	r2, r2, #1792
	.loc 2 526 81
	ldr	r3, .L4
	orrs	r3, r3, r2
	.loc 2 526 79
	str	r3, [r1, #3340]
	.loc 2 529 5 is_stmt 1
.LBB16:
.LBB17:
	.loc 2 346 5
	.syntax unified
@ 346 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.L3:
.LBE17:
.LBE16:
	.loc 2 531 5
	.loc 2 533 9
	.syntax unified
@ 533 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	nop
@ 0 "" 2
	.loc 2 531 5
	.thumb
	.syntax unified
	b	.L3
.L5:
	.align	2
.L4:
	.word	100270084
.LBE13:
.LBE12:
	.cfi_endproc
.LFE38:
	.size	svc1, .-svc1
	.section	.rodata.SVC_Handler_C.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ERROR: Unknown SVC service number.\012\000"
	.align	2
.LC1:
	.ascii	" - SVC number 0x%x\012\000"
	.section	.text.SVC_Handler_C,"ax",%progbits
	.align	1
	.global	SVC_Handler_C
	.syntax unified
	.thumb
	.thumb_func
	.type	SVC_Handler_C, %function
SVC_Handler_C:
.LFB39:
	.loc 1 52 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 53 5
	.loc 1 54 5
	.loc 1 54 38 is_stmt 0
	ldr	r3, [r0, #24]
	.loc 1 54 16
	ldrb	r4, [r3, #-2]	@ zero_extendqisi2
.LVL1:
	.loc 1 55 5 is_stmt 1
	.loc 1 55 7 is_stmt 0
	cbz	r4, .L11
.LBB18:
	.loc 1 59 9 is_stmt 1
	.loc 1 59 27 is_stmt 0
	ldr	r3, .L12
	ldr	r3, [r3, r4, lsl #2]
.LVL2:
	.loc 1 60 9 is_stmt 1
	.loc 1 60 11 is_stmt 0
	cbz	r3, .L9
	.loc 1 61 13 is_stmt 1
	blx	r3
.LVL3:
.L6:
.LBE18:
	.loc 1 68 1 is_stmt 0
	pop	{r4, pc}
.LVL4:
.L11:
	.loc 1 57 9 is_stmt 1
	bl	svc0
.LVL5:
	b	.L6
.LVL6:
.L9:
.LBB19:
	.loc 1 64 13
	ldr	r0, .L12+4
.LVL7:
	bl	printf
.LVL8:
	.loc 1 65 13
	mov	r1, r4
	ldr	r0, .L12+8
	bl	printf
.LVL9:
.LBE19:
	.loc 1 68 1 is_stmt 0
	b	.L6
.L13:
	.align	2
.L12:
	.word	cpu_svc__table
	.word	.LC0
	.word	.LC1
	.cfi_endproc
.LFE39:
	.size	SVC_Handler_C, .-SVC_Handler_C
	.section	.text.cpu_svc_set_handler,"ax",%progbits
	.align	1
	.global	cpu_svc_set_handler
	.syntax unified
	.thumb
	.thumb_func
	.type	cpu_svc_set_handler, %function
cpu_svc_set_handler:
.LFB40:
	.loc 1 71 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL10:
	mov	r3, r0
	.loc 1 72 5
	.loc 1 72 23 is_stmt 0
	ldr	r2, .L15
	ldr	r0, [r2, r0, lsl #2]
.LVL11:
	.loc 1 73 5 is_stmt 1
	.loc 1 73 24 is_stmt 0
	str	r1, [r2, r3, lsl #2]
	.loc 1 74 5 is_stmt 1
	.loc 1 75 1 is_stmt 0
	bx	lr
.L16:
	.align	2
.L15:
	.word	cpu_svc__table
	.cfi_endproc
.LFE40:
	.size	cpu_svc_set_handler, .-cpu_svc_set_handler
	.section	.text.SVC_Handler,"ax",%progbits
	.align	1
	.global	SVC_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	SVC_Handler, %function
SVC_Handler:
.LFB41:
	.loc 1 82 1 is_stmt 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 83 5
	.syntax unified
@ 83 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_svc.c" 1
	.global svc_exc_return                     
                                           
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
                                           
        .align 4
@ 0 "" 2
	.loc 1 104 1 is_stmt 0
	.thumb
	.syntax unified
	.cfi_endproc
.LFE41:
	.size	SVC_Handler, .-SVC_Handler
	.section	.data.cpu_svc__table,"aw"
	.align	2
	.type	cpu_svc__table, %object
	.size	cpu_svc__table, 1024
cpu_svc__table:
	.word	svc0
	.word	svc1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.global	svc_exc_return
	.section	.bss.svc_exc_return,"aw",%nobits
	.align	2
	.type	svc_exc_return, %object
	.size	svc_exc_return, 4
svc_exc_return:
	.space	4
	.text
.Letext0:
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 4 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 5 "D:/RTOS/CPU/ARM_CortexM4/cpu_types.h"
	.file 6 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_svc.h"
	.file 7 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x26c
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x1d
	.4byte	.LASF26
	.4byte	.LASF27
	.4byte	.LLRL4
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x3
	.byte	0x2b
	.byte	0x17
	.4byte	0x39
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x61
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x2d
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x55
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x5
	.byte	0xf
	.byte	0x12
	.4byte	0x90
	.uleb128 0xa
	.4byte	0x9c
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x6
	.byte	0xc
	.byte	0x10
	.4byte	0xb9
	.uleb128 0x3
	.4byte	0xbe
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.uleb128 0xc
	.4byte	0xc6
	.uleb128 0x3
	.4byte	0xcd
	.uleb128 0xd
	.4byte	0xd2
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x1
	.byte	0x9
	.byte	0x15
	.4byte	0xa8
	.uleb128 0x5
	.byte	0x3
	.4byte	svc_exc_return
	.uleb128 0xf
	.4byte	0xad
	.4byte	0xfe
	.uleb128 0x10
	.4byte	0x7d
	.byte	0xff
	.byte	0
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x13
	.byte	0x1a
	.4byte	0xee
	.uleb128 0x5
	.byte	0x3
	.4byte	cpu_svc__table
	.uleb128 0x11
	.4byte	.LASF29
	.byte	0x7
	.byte	0xce
	.byte	0x5
	.4byte	0x76
	.4byte	0x126
	.uleb128 0x12
	.4byte	0xd7
	.uleb128 0x13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF30
	.byte	0x1
	.byte	0x51
	.byte	0x1d
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF31
	.byte	0x1
	.byte	0x46
	.byte	0x13
	.4byte	0xad
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17d
	.uleb128 0x16
	.ascii	"id\000"
	.byte	0x1
	.byte	0x46
	.byte	0x2f
	.4byte	0x84
	.4byte	.LLST3
	.uleb128 0x17
	.4byte	.LASF17
	.byte	0x1
	.byte	0x46
	.byte	0x45
	.4byte	0xad
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x48
	.byte	0x17
	.4byte	0xad
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x18
	.4byte	.LASF32
	.byte	0x1
	.byte	0x33
	.byte	0x6
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x204
	.uleb128 0x19
	.4byte	.LASF20
	.byte	0x1
	.byte	0x33
	.byte	0x23
	.4byte	0x204
	.4byte	.LLST0
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x35
	.byte	0x13
	.4byte	0x39
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1a
	.4byte	.LLRL1
	.4byte	0x1fa
	.uleb128 0x1b
	.4byte	.LASF22
	.byte	0x1
	.byte	0x3b
	.byte	0x1b
	.4byte	0xad
	.4byte	.LLST2
	.uleb128 0x1c
	.4byte	.LVL8
	.4byte	0x10f
	.4byte	0x1e0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL9
	.4byte	0x10f
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL5
	.4byte	0x24f
	.byte	0
	.uleb128 0x3
	.4byte	0x7d
	.uleb128 0x1f
	.4byte	.LASF33
	.byte	0x1
	.byte	0xf
	.byte	0xd
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24f
	.uleb128 0x20
	.4byte	0x261
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0x1
	.byte	0x10
	.byte	0x5
	.uleb128 0x6
	.4byte	0x268
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.2byte	0x20c
	.uleb128 0x6
	.4byte	0x268
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.2byte	0x211
	.byte	0
	.byte	0
	.uleb128 0x21
	.4byte	.LASF34
	.byte	0x1
	.byte	0xb
	.byte	0xd
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF23
	.2byte	0x20a
	.uleb128 0x7
	.4byte	.LASF24
	.2byte	0x158
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 5
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 51
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",%progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST3:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL11-.LVL10
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL11-.LVL10
	.uleb128 .LFE40-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL3-1-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-1-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL4-.LVL0
	.uleb128 .LVL5-1-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL5-1-.LVL0
	.uleb128 .LVL6-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL0
	.uleb128 .LVL7-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LFE39-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL2
	.byte	0x4
	.uleb128 .LVL2-.LVL2
	.uleb128 .LVL3-1-.LVL2
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL6-.LVL2
	.uleb128 .LVL8-1-.LVL2
	.uleb128 0x1
	.byte	0x53
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",%progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL1:
	.byte	0x5
	.4byte	.LBB18
	.byte	0x4
	.uleb128 .LBB18-.LBB18
	.uleb128 .LBE18-.LBB18
	.byte	0x4
	.uleb128 .LBB19-.LBB18
	.uleb128 .LBE19-.LBB18
	.byte	0
.LLRL4:
	.byte	0x7
	.4byte	.LFB37
	.uleb128 .LFE37-.LFB37
	.byte	0x7
	.4byte	.LFB38
	.uleb128 .LFE38-.LFB38
	.byte	0x7
	.4byte	.LFB39
	.uleb128 .LFE39-.LFB39
	.byte	0x7
	.4byte	.LFB40
	.uleb128 .LFE40-.LFB40
	.byte	0x7
	.4byte	.LFB41
	.uleb128 .LFE41-.LFB41
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF5:
	.ascii	"__uint8_t\000"
.LASF11:
	.ascii	"uint8_t\000"
.LASF28:
	.ascii	"svc_exc_return\000"
.LASF27:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF24:
	.ascii	"cpu_DSB\000"
.LASF25:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions\000"
.LASF34:
	.ascii	"svc0\000"
.LASF33:
	.ascii	"svc1\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF19:
	.ascii	"old_handler\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF31:
	.ascii	"cpu_svc_set_handler\000"
.LASF21:
	.ascii	"svc_number\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF13:
	.ascii	"cpu_uint_t\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF14:
	.ascii	"cpu_svc_handler_t\000"
.LASF18:
	.ascii	"cpu_svc__table\000"
.LASF17:
	.ascii	"handler\000"
.LASF8:
	.ascii	"long long int\000"
.LASF30:
	.ascii	"SVC_Handler\000"
.LASF29:
	.ascii	"printf\000"
.LASF23:
	.ascii	"cpu_reboot\000"
.LASF2:
	.ascii	"short int\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF4:
	.ascii	"long int\000"
.LASF16:
	.ascii	"char\000"
.LASF22:
	.ascii	"Function\000"
.LASF15:
	.ascii	"long double\000"
.LASF0:
	.ascii	"signed char\000"
.LASF32:
	.ascii	"SVC_Handler_C\000"
.LASF26:
	.ascii	"D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_svc.c\000"
.LASF20:
	.ascii	"svc_args\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
