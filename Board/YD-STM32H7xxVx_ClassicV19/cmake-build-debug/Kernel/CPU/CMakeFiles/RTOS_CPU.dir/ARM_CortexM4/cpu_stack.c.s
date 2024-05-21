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
	.file	"cpu_stack.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/CPU/ARM_CortexM4/cpu_stack.c"
	.section	.text.cpu_stack_init,"ax",%progbits
	.align	1
	.global	cpu_stack_init
	.syntax unified
	.thumb
	.thumb_func
	.type	cpu_stack_init, %function
cpu_stack_init:
.LFB42:
	.loc 1 48 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	push	{r4, r5}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
	ldr	r4, [sp, #8]
	.loc 1 49 5
	.loc 1 49 8 is_stmt 0
	cmp	r3, #71
	ble	.L3
	.loc 1 51 5 is_stmt 1
	.loc 1 51 46 is_stmt 0
	add	r3, r3, r2
.LVL1:
	.loc 1 51 16
	sub	r5, r3, #72
.LVL2:
	.loc 1 53 5 is_stmt 1
	.loc 1 53 53 is_stmt 0
	mov	r2, #16777216
.LVL3:
	str	r2, [r3, #-4]
	.loc 1 54 5 is_stmt 1
	.loc 1 54 53 is_stmt 0
	str	r0, [r3, #-8]
	.loc 1 55 5 is_stmt 1
	.loc 1 55 53 is_stmt 0
	str	r1, [r3, #-32]
	.loc 1 56 5 is_stmt 1
	.loc 1 56 52 is_stmt 0
	movs	r2, #2
	str	r2, [r3, #-68]
	.loc 1 57 5 is_stmt 1
	.loc 1 57 41 is_stmt 0
	mvn	r2, #2
	str	r2, [r3, #-72]
	.loc 1 59 5 is_stmt 1
	.loc 1 59 8 is_stmt 0
	cbz	r4, .L4
	.loc 1 60 9 is_stmt 1
	.loc 1 60 20 is_stmt 0
	str	r5, [r4]
	.loc 1 63 12
	movs	r0, #0
.LVL4:
.L1:
	.loc 1 65 1
	pop	{r4, r5}
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL5:
	bx	lr
.LVL6:
.L3:
	.cfi_restore_state
	.loc 1 49 37
	mov	r0, #-1
.LVL7:
	b	.L1
.LVL8:
.L4:
	.loc 1 63 12
	movs	r0, #0
.LVL9:
	b	.L1
	.cfi_endproc
.LFE42:
	.size	cpu_stack_init, .-cpu_stack_init
	.section	.rodata.cpu_stack_switch.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"cpu_stack__switch_flag is on!!!\012\000"
	.section	.text.cpu_stack_switch,"ax",%progbits
	.align	1
	.global	cpu_stack_switch
	.syntax unified
	.thumb
	.thumb_func
	.type	cpu_stack_switch, %function
cpu_stack_switch:
.LFB43:
	.loc 1 74 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL10:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 75 5
	.loc 1 75 30 is_stmt 0
	ldr	r3, .L12
	ldrb	r3, [r3]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 75 7
	cmp	r3, #1
	beq	.L11
	.loc 1 80 5 is_stmt 1
.LVL11:
.LBB59:
.LBB60:
	.file 2 "D:/RTOS/CPU/ARM_CortexM4/cpu_lock.h"
	.loc 2 30 5
.LBB61:
.LBB62:
	.file 3 "D:/RTOS/CPU/ARM_CortexM4/cpu_interrupt.h"
	.loc 3 19 5
	.loc 3 20 5
.LBB63:
.LBB64:
	.file 4 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
	.loc 4 165 5
	.loc 4 167 5
	.syntax unified
@ 167 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	MRS r2, primask
@ 0 "" 2
.LVL12:
	.loc 4 168 5
	.thumb
	.syntax unified
.LBE64:
.LBE63:
	.loc 3 21 5
.LBB65:
.LBB66:
	.loc 4 41 5
	.syntax unified
@ 41 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	cpsid i
@ 0 "" 2
	.thumb
	.syntax unified
.LBE66:
.LBE65:
	.loc 3 22 5
.LBB67:
.LBB68:
	.loc 4 335 5
	.syntax unified
@ 335 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	isb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE68:
.LBE67:
	.loc 3 23 5
.LBB69:
.LBB70:
	.loc 4 357 5
	.syntax unified
@ 357 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dmb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE70:
.LBE69:
	.loc 3 24 5
.LBE62:
.LBE61:
	.loc 2 30 11 is_stmt 0
	ldr	r3, .L12+4
	str	r2, [r3]
.LVL13:
.LBE60:
.LBE59:
	.loc 1 81 5 is_stmt 1
	.loc 1 81 28 is_stmt 0
	ldr	r2, .L12
.LVL14:
	mov	ip, #1
	strb	ip, [r2]
.LVL15:
	.loc 1 82 5 is_stmt 1
	.loc 1 82 23 is_stmt 0
	ldr	r2, .L12+8
	str	r0, [r2]
	.loc 1 83 5 is_stmt 1
	.loc 1 83 23 is_stmt 0
	ldr	r2, .L12+12
	str	r1, [r2]
	.loc 1 84 5 is_stmt 1
.LVL16:
.LBB71:
.LBB72:
	.loc 2 34 5
	ldr	r3, [r3]
.LVL17:
.LBB73:
	.loc 3 28 5
.LBB74:
.LBB75:
	.loc 4 179 5
	.syntax unified
@ 179 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	MSR primask, r3
@ 0 "" 2
.LVL18:
	.thumb
	.syntax unified
.LBE75:
.LBE74:
	.loc 3 29 5
.LBB76:
.LBB77:
	.loc 4 335 5
	.syntax unified
@ 335 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	isb 0xF
@ 0 "" 2
.LVL19:
	.thumb
	.syntax unified
.LBE77:
.LBE76:
.LBE73:
.LBE72:
.LBE71:
	.loc 1 86 5
.LBB78:
.LBB79:
	.loc 4 516 5
.LBB80:
.LBB81:
	.loc 4 76 5
	.loc 4 78 5
	.syntax unified
@ 78 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	MRS r3, ipsr
@ 0 "" 2
.LVL20:
	.loc 4 79 5
	.thumb
	.syntax unified
.LBE81:
.LBE80:
	.loc 4 516 7 is_stmt 0
	cbnz	r3, .L8
	.loc 4 517 10 is_stmt 1
.LBB82:
.LBB83:
	.loc 4 51 5
	.loc 4 53 5
	.syntax unified
@ 53 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	MRS r3, control
@ 0 "" 2
.LVL21:
	.loc 4 54 5
	.thumb
	.syntax unified
.LBE83:
.LBE82:
	.loc 4 517 12 is_stmt 0
	tst	r3, #1
	beq	.L8
	.loc 4 518 10 is_stmt 1
.LBE79:
.LBE78:
	.loc 1 92 9
	.syntax unified
@ 92 "D:/RTOS/CPU/ARM_CortexM4/cpu_stack.c" 1
	svc 0
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L6
.LVL22:
.L11:
	.loc 1 76 9
	ldr	r0, .L12+16
.LVL23:
	bl	printf
.LVL24:
	.loc 1 77 9
	.loc 1 77 16 is_stmt 0
	mov	r0, #-1
	b	.L6
.LVL25:
.L8:
	.loc 1 89 9 is_stmt 1
	.loc 1 89 10 is_stmt 0
	mov	r2, #-536813568
	ldr	r3, [r2, #3332]
	.loc 1 89 53
	orr	r3, r3, #268435456
	str	r3, [r2, #3332]
.LVL26:
.L6:
	.loc 1 94 1
	pop	{r3, pc}
.L13:
	.align	2
.L12:
	.word	cpu_stack__switch_flag
	.word	cpu_stack__lock
	.word	cpu_stack__curr_p
	.word	cpu_stack__next_p
	.word	.LC0
	.cfi_endproc
.LFE43:
	.size	cpu_stack_switch, .-cpu_stack_switch
	.section	.text.cpu_stack_is_switch_in_progress,"ax",%progbits
	.align	1
	.global	cpu_stack_is_switch_in_progress
	.syntax unified
	.thumb
	.thumb_func
	.type	cpu_stack_is_switch_in_progress, %function
cpu_stack_is_switch_in_progress:
.LFB44:
	.loc 1 97 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 98 5
	.loc 1 98 41 is_stmt 0
	ldr	r3, .L15
	ldrb	r0, [r3]	@ zero_extendqisi2
	uxtb	r0, r0
	.loc 1 99 1
	cmp	r0, #1
	ite	ne
	movne	r0, #0
	moveq	r0, #1
	bx	lr
.L16:
	.align	2
.L15:
	.word	cpu_stack__switch_flag
	.cfi_endproc
.LFE44:
	.size	cpu_stack_is_switch_in_progress, .-cpu_stack_is_switch_in_progress
	.section	.bss.cpu_stack__lock,"aw",%nobits
	.align	2
	.type	cpu_stack__lock, %object
	.size	cpu_stack__lock, 4
cpu_stack__lock:
	.space	4
	.global	cpu_stack__next_p
	.section	.bss.cpu_stack__next_p,"aw",%nobits
	.align	2
	.type	cpu_stack__next_p, %object
	.size	cpu_stack__next_p, 4
cpu_stack__next_p:
	.space	4
	.global	cpu_stack__curr_p
	.section	.bss.cpu_stack__curr_p,"aw",%nobits
	.align	2
	.type	cpu_stack__curr_p, %object
	.size	cpu_stack__curr_p, 4
cpu_stack__curr_p:
	.space	4
	.global	cpu_stack__switch_flag
	.section	.bss.cpu_stack__switch_flag,"aw",%nobits
	.type	cpu_stack__switch_flag, %object
	.size	cpu_stack__switch_flag, 1
cpu_stack__switch_flag:
	.space	1
	.text
.Letext0:
	.file 5 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 6 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 7 "D:/RTOS/CPU/ARM_CortexM4/cpu_types.h"
	.file 8 "D:/RTOS/CPU/ARM_CortexM4/cpu_stack.h"
	.file 9 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x44a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x13
	.4byte	.LASF45
	.byte	0x1d
	.4byte	.LASF46
	.4byte	.LASF47
	.4byte	.LLRL12
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x5
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
	.byte	0x5
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
	.uleb128 0x14
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x6
	.byte	0x18
	.byte	0x13
	.4byte	0x2d
	.uleb128 0xf
	.4byte	0x84
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x6
	.byte	0x30
	.byte	0x14
	.4byte	0x55
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x7
	.byte	0xf
	.byte	0x12
	.4byte	0x95
	.uleb128 0xf
	.4byte	0xa1
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x16
	.byte	0xf
	.4byte	0xbd
	.uleb128 0x5
	.4byte	0xc2
	.uleb128 0x15
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF15
	.byte	0x17
	.byte	0xf
	.4byte	0xbd
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x18
	.byte	0x19
	.4byte	0x90
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x2
	.byte	0x17
	.byte	0x1d
	.4byte	0xad
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF18
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF19
	.uleb128 0x16
	.4byte	0xed
	.uleb128 0x5
	.4byte	0xf4
	.uleb128 0x17
	.4byte	0xf9
	.uleb128 0xd
	.4byte	0xcf
	.byte	0x11
	.byte	0x12
	.uleb128 0x5
	.byte	0x3
	.4byte	cpu_stack__switch_flag
	.uleb128 0xd
	.4byte	0xb2
	.byte	0x12
	.byte	0x8
	.uleb128 0x5
	.byte	0x3
	.4byte	cpu_stack__curr_p
	.uleb128 0xd
	.4byte	0xc4
	.byte	0x13
	.byte	0x8
	.uleb128 0x5
	.byte	0x3
	.4byte	cpu_stack__next_p
	.uleb128 0x18
	.4byte	.LASF29
	.byte	0x1
	.byte	0x14
	.byte	0x13
	.4byte	0xda
	.uleb128 0x5
	.byte	0x3
	.4byte	cpu_stack__lock
	.uleb128 0x19
	.4byte	.LASF48
	.byte	0x9
	.byte	0xce
	.byte	0x5
	.4byte	0x76
	.4byte	0x153
	.uleb128 0x1a
	.4byte	0xfe
	.uleb128 0x1b
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF49
	.byte	0x1
	.byte	0x60
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF22
	.byte	0x49
	.4byte	0x76
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d8
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x49
	.byte	0x1d
	.4byte	0xbd
	.4byte	.LLST5
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x49
	.byte	0x32
	.4byte	0xbd
	.4byte	.LLST6
	.uleb128 0x4
	.4byte	0x36c
	.4byte	.LBB59
	.4byte	.LBE59-.LBB59
	.byte	0x1
	.byte	0x50
	.byte	0x5
	.4byte	0x21a
	.uleb128 0x6
	.4byte	0x377
	.4byte	.LLST7
	.uleb128 0x11
	.4byte	0x39c
	.4byte	.LBB61
	.4byte	.LBE61-.LBB61
	.byte	0x1e
	.byte	0xd
	.uleb128 0x1d
	.4byte	0x3ac
	.4byte	.LLST8
	.uleb128 0x4
	.4byte	0x3ed
	.4byte	.LBB63
	.4byte	.LBE63-.LBB63
	.byte	0x3
	.byte	0x14
	.byte	0xe
	.4byte	0x1ee
	.uleb128 0xe
	.4byte	0x3fd
	.byte	0
	.uleb128 0x7
	.4byte	0x444
	.4byte	.LBB65
	.4byte	.LBE65-.LBB65
	.byte	0x15
	.uleb128 0x7
	.4byte	0x3ce
	.4byte	.LBB67
	.4byte	.LBE67-.LBB67
	.byte	0x16
	.uleb128 0x7
	.4byte	0x3c7
	.4byte	.LBB69
	.4byte	.LBE69-.LBB69
	.byte	0x17
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	0x34f
	.4byte	.LBB71
	.4byte	.LBE71-.LBB71
	.byte	0x1
	.byte	0x54
	.byte	0x5
	.4byte	0x27d
	.uleb128 0x6
	.4byte	0x35a
	.4byte	.LLST9
	.uleb128 0x11
	.4byte	0x384
	.4byte	.LBB73
	.4byte	.LBE73-.LBB73
	.byte	0x22
	.byte	0x5
	.uleb128 0x6
	.4byte	0x38f
	.4byte	.LLST10
	.uleb128 0x4
	.4byte	0x3d5
	.4byte	.LBB74
	.4byte	.LBE74-.LBB74
	.byte	0x3
	.byte	0x1c
	.byte	0x5
	.4byte	0x26d
	.uleb128 0x6
	.4byte	0x3e0
	.4byte	.LLST11
	.byte	0
	.uleb128 0x7
	.4byte	0x3ce
	.4byte	.LBB76
	.4byte	.LBE76-.LBB76
	.byte	0x1d
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	0x3b9
	.4byte	.LBB78
	.4byte	.LBE78-.LBB78
	.byte	0x1
	.byte	0x56
	.byte	0x8
	.4byte	0x2c4
	.uleb128 0x1e
	.4byte	0x40a
	.4byte	.LBB80
	.4byte	.LBE80-.LBB80
	.byte	0x4
	.2byte	0x204
	.byte	0x8
	.4byte	0x2ac
	.uleb128 0xe
	.4byte	0x41a
	.byte	0
	.uleb128 0x1f
	.4byte	0x427
	.4byte	.LBB82
	.4byte	.LBE82-.LBB82
	.byte	0x4
	.2byte	0x205
	.byte	0xe
	.uleb128 0xe
	.4byte	0x437
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LVL24
	.4byte	0x13c
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF23
	.byte	0x2f
	.4byte	0x76
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x34a
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x2f
	.byte	0x1a
	.4byte	0xc2
	.4byte	.LLST0
	.uleb128 0x22
	.4byte	.LASF25
	.byte	0x1
	.byte	0x2f
	.byte	0x2e
	.4byte	0xc2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x2f
	.byte	0x43
	.4byte	0x34a
	.4byte	.LLST1
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x2f
	.byte	0x53
	.4byte	0x76
	.4byte	.LLST2
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x2f
	.byte	0x66
	.4byte	0xbd
	.4byte	.LLST3
	.uleb128 0x23
	.ascii	"sp\000"
	.byte	0x1
	.byte	0x33
	.byte	0x10
	.4byte	0xa1
	.4byte	.LLST4
	.byte	0
	.uleb128 0x5
	.4byte	0x84
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x2
	.byte	0x21
	.4byte	0x367
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x2
	.byte	0x21
	.byte	0x4f
	.4byte	0x367
	.byte	0
	.uleb128 0x5
	.4byte	0xda
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0x2
	.byte	0x1d
	.4byte	0x384
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x2
	.byte	0x1d
	.byte	0x4d
	.4byte	0x367
	.byte	0
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x3
	.byte	0x1b
	.4byte	0x39c
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x3
	.byte	0x1b
	.byte	0x53
	.4byte	0xa1
	.byte	0
	.uleb128 0xa
	.4byte	.LASF39
	.byte	0x3
	.byte	0x12
	.byte	0x39
	.4byte	0xa1
	.4byte	0x3b9
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x3
	.byte	0x13
	.byte	0x19
	.4byte	0xa1
	.byte	0
	.uleb128 0x24
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x203
	.byte	0x32
	.4byte	0x76
	.byte	0x3
	.uleb128 0x12
	.4byte	.LASF35
	.2byte	0x163
	.uleb128 0x12
	.4byte	.LASF36
	.2byte	0x14d
	.uleb128 0x8
	.4byte	.LASF37
	.byte	0x4
	.byte	0xb1
	.4byte	0x3ed
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x4
	.byte	0xb1
	.byte	0x4c
	.4byte	0x95
	.byte	0
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x4
	.byte	0xa3
	.byte	0x37
	.4byte	0x95
	.4byte	0x40a
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x4
	.byte	0xa5
	.byte	0xe
	.4byte	0x95
	.byte	0
	.uleb128 0xa
	.4byte	.LASF42
	.byte	0x4
	.byte	0x4a
	.byte	0x37
	.4byte	0x95
	.4byte	0x427
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x4
	.byte	0x4c
	.byte	0xe
	.4byte	0x95
	.byte	0
	.uleb128 0xa
	.4byte	.LASF43
	.byte	0x4
	.byte	0x31
	.byte	0x37
	.4byte	0x95
	.4byte	0x444
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x4
	.byte	0x33
	.byte	0xe
	.4byte	0x95
	.byte	0
	.uleb128 0x25
	.4byte	.LASF44
	.byte	0x4
	.byte	0x27
	.byte	0x33
	.byte	0x3
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
	.uleb128 0x5
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.sleb128 3
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 5
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 51
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
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
	.uleb128 0x11
	.uleb128 0x1d
	.byte	0x1
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
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x34
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
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x20
	.uleb128 0xb
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
.LLST5:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL23-.LVL10
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL23-.LVL10
	.uleb128 .LVL25-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL25-.LVL10
	.uleb128 .LVL26-.LVL10
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL26-.LVL10
	.uleb128 .LFE43-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL24-1-.LVL10
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL24-1-.LVL10
	.uleb128 .LVL25-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL25-.LVL10
	.uleb128 .LVL26-.LVL10
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL26-.LVL10
	.uleb128 .LFE43-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x8
	.4byte	.LVL11
	.uleb128 .LVL13-.LVL11
	.uleb128 0x6
	.byte	0x3
	.4byte	cpu_stack__lock
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL12
	.byte	0x4
	.uleb128 .LVL12-.LVL12
	.uleb128 .LVL14-.LVL12
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL14-.LVL12
	.uleb128 .LVL15-.LVL12
	.uleb128 0x5
	.byte	0x3
	.4byte	cpu_stack__lock
	.byte	0
.LLST9:
	.byte	0x8
	.4byte	.LVL16
	.uleb128 .LVL19-.LVL16
	.uleb128 0x6
	.byte	0x3
	.4byte	cpu_stack__lock
	.byte	0x9f
	.byte	0
.LLST10:
	.byte	0x8
	.4byte	.LVL17
	.uleb128 .LVL19-.LVL17
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST11:
	.byte	0x8
	.4byte	.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL4-.LVL0
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
	.uleb128 .LVL8-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL8-.LVL0
	.uleb128 .LVL9-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL9-.LVL0
	.uleb128 .LFE42-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LVL6-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL0
	.uleb128 .LVL8-.LVL0
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL8-.LVL0
	.uleb128 .LFE42-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LVL6-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL0
	.uleb128 .LVL8-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL8-.LVL0
	.uleb128 .LFE42-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LVL6-.LVL0
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL6-.LVL0
	.uleb128 .LFE42-.LVL0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL2
	.byte	0x4
	.uleb128 .LVL2-.LVL2
	.uleb128 .LVL4-.LVL2
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL8-.LVL2
	.uleb128 .LFE42-.LVL2
	.uleb128 0x1
	.byte	0x55
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
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
.LLRL12:
	.byte	0x7
	.4byte	.LFB42
	.uleb128 .LFE42-.LFB42
	.byte	0x7
	.4byte	.LFB43
	.uleb128 .LFE43-.LFB43
	.byte	0x7
	.4byte	.LFB44
	.uleb128 .LFE44-.LFB44
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF37:
	.ascii	"cpu_set_PRIMASK\000"
.LASF23:
	.ascii	"cpu_stack_init\000"
.LASF42:
	.ascii	"cpu_get_IPSR\000"
.LASF5:
	.ascii	"__uint8_t\000"
.LASF22:
	.ascii	"cpu_stack_switch\000"
.LASF41:
	.ascii	"result\000"
.LASF46:
	.ascii	"D:/RTOS/CPU/ARM_CortexM4/cpu_stack.c\000"
.LASF15:
	.ascii	"cpu_stack__next_p\000"
.LASF34:
	.ascii	"level\000"
.LASF38:
	.ascii	"priMask\000"
.LASF49:
	.ascii	"cpu_stack_is_switch_in_progress\000"
.LASF43:
	.ascii	"cpu_get_CONTROL\000"
.LASF47:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF31:
	.ascii	"cpu_lock_lock\000"
.LASF45:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions\000"
.LASF44:
	.ascii	"cpu_disable_irq\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF40:
	.ascii	"cpu_get_PRIMASK\000"
.LASF50:
	.ascii	"cpu_in_privilege\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF39:
	.ascii	"cpu_interrupt_disable\000"
.LASF32:
	.ascii	"lock\000"
.LASF13:
	.ascii	"cpu_uint_t\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF30:
	.ascii	"cpu_lock_unlock\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF28:
	.ascii	"return_sp\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF11:
	.ascii	"uint8_t\000"
.LASF14:
	.ascii	"cpu_stack__curr_p\000"
.LASF35:
	.ascii	"cpu_DMB\000"
.LASF26:
	.ascii	"stack_addr\000"
.LASF36:
	.ascii	"cpu_ISB\000"
.LASF20:
	.ascii	"from_stack_p\000"
.LASF8:
	.ascii	"long long int\000"
.LASF27:
	.ascii	"stack_size\000"
.LASF19:
	.ascii	"char\000"
.LASF33:
	.ascii	"cpu_interrupt_enable\000"
.LASF16:
	.ascii	"cpu_stack__switch_flag\000"
.LASF48:
	.ascii	"printf\000"
.LASF17:
	.ascii	"cpu_lock_t\000"
.LASF2:
	.ascii	"short int\000"
.LASF29:
	.ascii	"cpu_stack__lock\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF4:
	.ascii	"long int\000"
.LASF25:
	.ascii	"parameter\000"
.LASF18:
	.ascii	"long double\000"
.LASF0:
	.ascii	"signed char\000"
.LASF24:
	.ascii	"thread_entry\000"
.LASF21:
	.ascii	"to_stack_p\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
