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
	.file	"os_interrupt.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Kernel/os_interrupt.c"
	.section	.text.os_interrupt_init,"ax",%progbits
	.align	1
	.global	os_interrupt_init
	.syntax unified
	.thumb
	.thumb_func
	.type	os_interrupt_init, %function
os_interrupt_init:
.LFB45:
	.loc 1 13 29
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 14 5
	.loc 1 14 24 is_stmt 0
	ldr	r3, .L2
	movs	r2, #0
	str	r2, [r3]
	.loc 1 15 1
	bx	lr
.L3:
	.align	2
.L2:
	.word	os_interrupt__nest
	.cfi_endproc
.LFE45:
	.size	os_interrupt_init, .-os_interrupt_init
	.section	.text.os_interrupt_enter,"ax",%progbits
	.align	1
	.global	os_interrupt_enter
	.syntax unified
	.thumb
	.thumb_func
	.type	os_interrupt_enter, %function
os_interrupt_enter:
.LFB46:
	.loc 1 18 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 19 5
.LVL0:
.LBB38:
.LBB39:
	.file 2 "D:/RTOS/CPU/ARM_CortexM4/cpu_atomic.h"
	.loc 2 16 5
	.loc 2 17 5
	.loc 2 18 5
.LBB40:
.LBB41:
	.file 3 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
	.loc 3 357 5
	.syntax unified
@ 357 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dmb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.L5:
.LBE41:
.LBE40:
	.loc 2 19 5
	.loc 2 20 9
.LVL1:
.LBB42:
.LBB43:
	.loc 3 445 5
	.loc 3 447 5
	ldr	r2, .L6
	.syntax unified
@ 447 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	ldrex r3, [r2]
@ 0 "" 2
.LVL2:
	.loc 3 448 5
	.thumb
	.syntax unified
.LBE43:
.LBE42:
	.loc 2 21 9
	.loc 2 21 16 is_stmt 0
	adds	r3, r3, #1
.LVL3:
	.loc 2 22 9 is_stmt 1
.LBB44:
.LBB45:
	.loc 3 496 1
	.loc 3 498 1
	.syntax unified
@ 498 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	strex r1, r3, [r2]
@ 0 "" 2
.LVL4:
	.loc 3 499 1
	.thumb
	.syntax unified
.LBE45:
.LBE44:
	.loc 2 23 15
	cmp	r1, #0
	bne	.L5
	.loc 2 24 5
.LBB46:
.LBB47:
	.loc 3 357 5
	.syntax unified
@ 357 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dmb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE47:
.LBE46:
	.loc 2 25 5
.LVL5:
.LBE39:
.LBE38:
	.loc 1 20 1 is_stmt 0
	bx	lr
.L7:
	.align	2
.L6:
	.word	os_interrupt__nest
	.cfi_endproc
.LFE46:
	.size	os_interrupt_enter, .-os_interrupt_enter
	.section	.text.os_interrupt_exit,"ax",%progbits
	.align	1
	.global	os_interrupt_exit
	.syntax unified
	.thumb
	.thumb_func
	.type	os_interrupt_exit, %function
os_interrupt_exit:
.LFB47:
	.loc 1 22 29 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 23 5
.LVL6:
.LBB48:
.LBB49:
	.loc 2 30 5
.LBB50:
.LBB51:
	.loc 3 357 5
	.syntax unified
@ 357 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dmb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.L9:
.LBE51:
.LBE50:
	.loc 2 31 5
	.loc 2 32 5
	.loc 2 33 5
	.loc 2 34 9
.LVL7:
.LBB52:
.LBB53:
	.loc 3 445 5
	.loc 3 447 5
	ldr	r2, .L10
	.syntax unified
@ 447 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	ldrex r3, [r2]
@ 0 "" 2
.LVL8:
	.loc 3 448 5
	.thumb
	.syntax unified
.LBE53:
.LBE52:
	.loc 2 35 9
	.loc 2 35 16 is_stmt 0
	subs	r3, r3, #1
.LVL9:
	.loc 2 36 9 is_stmt 1
.LBB54:
.LBB55:
	.loc 3 496 1
	.loc 3 498 1
	.syntax unified
@ 498 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	strex r1, r3, [r2]
@ 0 "" 2
.LVL10:
	.loc 3 499 1
	.thumb
	.syntax unified
.LBE55:
.LBE54:
	.loc 2 37 15
	cmp	r1, #0
	bne	.L9
	.loc 2 38 5
.LBB56:
.LBB57:
	.loc 3 357 5
	.syntax unified
@ 357 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dmb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE57:
.LBE56:
	.loc 2 39 5
.LVL11:
.LBE49:
.LBE48:
	.loc 1 34 1 is_stmt 0
	bx	lr
.L11:
	.align	2
.L10:
	.word	os_interrupt__nest
	.cfi_endproc
.LFE47:
	.size	os_interrupt_exit, .-os_interrupt_exit
	.section	.text.os_interrupt_nest,"ax",%progbits
	.align	1
	.global	os_interrupt_nest
	.syntax unified
	.thumb
	.thumb_func
	.type	os_interrupt_nest, %function
os_interrupt_nest:
.LFB48:
	.loc 1 36 34 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 37 5
	.loc 1 37 12 is_stmt 0
	ldr	r3, .L13
	ldr	r0, [r3]
	.loc 1 38 1
	bx	lr
.L14:
	.align	2
.L13:
	.word	os_interrupt__nest
	.cfi_endproc
.LFE48:
	.size	os_interrupt_nest, .-os_interrupt_nest
	.section	.bss.os_interrupt__nest,"aw",%nobits
	.align	2
	.type	os_interrupt__nest, %object
	.size	os_interrupt__nest, 4
os_interrupt__nest:
	.space	4
	.text
.Letext0:
	.file 4 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 5 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 6 "D:/RTOS/CPU/ARM_CortexM4/cpu_types.h"
	.file 7 "D:/RTOS/Kernel/os_types.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x334
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x14
	.4byte	.LASF25
	.byte	0x1d
	.4byte	.LASF26
	.4byte	.LASF27
	.4byte	.LLRL12
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
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
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x4
	.byte	0x4f
	.byte	0x1b
	.4byte	0x55
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x15
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x5
	.byte	0x30
	.byte	0x14
	.4byte	0x49
	.uleb128 0x8
	.4byte	0x78
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x6
	.byte	0xf
	.byte	0x12
	.4byte	0x78
	.uleb128 0x8
	.4byte	0x89
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x2
	.byte	0xc
	.byte	0x1d
	.4byte	0x95
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF13
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x7
	.byte	0x52
	.byte	0x12
	.4byte	0x78
	.uleb128 0x8
	.4byte	0xad
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0x16
	.4byte	.LASF28
	.byte	0x1
	.byte	0x6
	.byte	0x1b
	.4byte	0xb9
	.uleb128 0x5
	.byte	0x3
	.4byte	os_interrupt__nest
	.uleb128 0x17
	.4byte	.LASF29
	.byte	0x1
	.byte	0x24
	.byte	0xb
	.4byte	0xad
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x16
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19c
	.uleb128 0xb
	.4byte	0x25d
	.4byte	.LBB48
	.4byte	.LBE48-.LBB48
	.byte	0x17
	.uleb128 0x2
	.4byte	0x274
	.4byte	.LLST6
	.uleb128 0x2
	.4byte	0x26b
	.4byte	.LLST7
	.uleb128 0xc
	.4byte	0x27d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0xd
	.4byte	0x287
	.4byte	.LLST8
	.uleb128 0x4
	.4byte	0x32d
	.4byte	.LBB50
	.4byte	.LBE50-.LBB50
	.byte	0x1e
	.uleb128 0x5
	.4byte	0x305
	.4byte	.LBB52
	.4byte	.LBE52-.LBB52
	.byte	0x22
	.byte	0x12
	.4byte	0x161
	.uleb128 0x2
	.4byte	0x314
	.4byte	.LLST9
	.uleb128 0x6
	.4byte	0x320
	.byte	0
	.uleb128 0x5
	.4byte	0x2cc
	.4byte	.LBB54
	.4byte	.LBE54-.LBB54
	.byte	0x24
	.byte	0xf
	.4byte	0x18c
	.uleb128 0x2
	.4byte	0x2e7
	.4byte	.LLST10
	.uleb128 0x2
	.4byte	0x2db
	.4byte	.LLST11
	.uleb128 0x6
	.4byte	0x2f3
	.byte	0
	.uleb128 0x4
	.4byte	0x32d
	.4byte	.LBB56
	.4byte	.LBE56-.LBB56
	.byte	0x26
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x11
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24b
	.uleb128 0xb
	.4byte	0x297
	.4byte	.LBB38
	.4byte	.LBE38-.LBB38
	.byte	0x13
	.uleb128 0x2
	.4byte	0x2ae
	.4byte	.LLST0
	.uleb128 0x2
	.4byte	0x2a5
	.4byte	.LLST1
	.uleb128 0xc
	.4byte	0x2b7
	.uleb128 0x1
	.byte	0x51
	.uleb128 0xd
	.4byte	0x2c1
	.4byte	.LLST2
	.uleb128 0x4
	.4byte	0x32d
	.4byte	.LBB40
	.4byte	.LBE40-.LBB40
	.byte	0x12
	.uleb128 0x5
	.4byte	0x305
	.4byte	.LBB42
	.4byte	.LBE42-.LBB42
	.byte	0x14
	.byte	0x12
	.4byte	0x210
	.uleb128 0x2
	.4byte	0x314
	.4byte	.LLST3
	.uleb128 0x6
	.4byte	0x320
	.byte	0
	.uleb128 0x5
	.4byte	0x2cc
	.4byte	.LBB44
	.4byte	.LBE44-.LBB44
	.byte	0x16
	.byte	0xf
	.4byte	0x23b
	.uleb128 0x2
	.4byte	0x2e7
	.4byte	.LLST4
	.uleb128 0x2
	.4byte	0x2db
	.4byte	.LLST5
	.uleb128 0x6
	.4byte	0x2f3
	.byte	0
	.uleb128 0x4
	.4byte	0x32d
	.4byte	.LBB46
	.4byte	.LBE46-.LBB46
	.byte	0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LASF30
	.byte	0x1
	.byte	0xd
	.byte	0x6
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1d
	.4byte	0x89
	.4byte	0x292
	.uleb128 0x7
	.ascii	"v\000"
	.byte	0x1d
	.byte	0x5e
	.4byte	0x292
	.uleb128 0x7
	.ascii	"i\000"
	.byte	0x1d
	.byte	0x6c
	.4byte	0x89
	.uleb128 0xf
	.ascii	"tmp\000"
	.byte	0x1f
	.4byte	0x89
	.uleb128 0x10
	.4byte	.LASF18
	.byte	0x20
	.4byte	0x89
	.byte	0
	.uleb128 0x11
	.4byte	0x9a
	.uleb128 0xe
	.4byte	.LASF20
	.byte	0xe
	.4byte	0x89
	.4byte	0x2cc
	.uleb128 0x7
	.ascii	"v\000"
	.byte	0xe
	.byte	0x5d
	.4byte	0x292
	.uleb128 0x7
	.ascii	"i\000"
	.byte	0xe
	.byte	0x6b
	.4byte	0x89
	.uleb128 0xf
	.ascii	"tmp\000"
	.byte	0x10
	.4byte	0x89
	.uleb128 0x10
	.4byte	.LASF18
	.byte	0x11
	.4byte	0x89
	.byte	0
	.uleb128 0x12
	.4byte	.LASF21
	.2byte	0x1ee
	.4byte	0x78
	.4byte	0x300
	.uleb128 0x9
	.4byte	.LASF22
	.2byte	0x1ee
	.byte	0x4b
	.4byte	0x78
	.uleb128 0x9
	.4byte	.LASF23
	.2byte	0x1ee
	.byte	0x65
	.4byte	0x300
	.uleb128 0x13
	.4byte	.LASF18
	.2byte	0x1f0
	.byte	0xa
	.4byte	0x78
	.byte	0
	.uleb128 0x11
	.4byte	0x84
	.uleb128 0x12
	.4byte	.LASF24
	.2byte	0x1bb
	.4byte	0x78
	.4byte	0x32d
	.uleb128 0x9
	.4byte	.LASF23
	.2byte	0x1bb
	.byte	0x55
	.4byte	0x300
	.uleb128 0x13
	.4byte	.LASF18
	.2byte	0x1bd
	.byte	0xe
	.4byte	0x78
	.byte	0
	.uleb128 0x19
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x163
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 5
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.sleb128 6
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
	.uleb128 0xb
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
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 5
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 57
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
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 55
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
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
.LLST6:
	.byte	0x8
	.4byte	.LVL6
	.uleb128 .LVL11-.LVL6
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x8
	.4byte	.LVL6
	.uleb128 .LVL11-.LVL6
	.uleb128 0x6
	.byte	0x3
	.4byte	os_interrupt__nest
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x8
	.4byte	.LVL8
	.uleb128 .LVL11-.LVL8
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST9:
	.byte	0x8
	.4byte	.LVL7
	.uleb128 .LVL8-.LVL7
	.uleb128 0x6
	.byte	0x3
	.4byte	os_interrupt__nest
	.byte	0x9f
	.byte	0
.LLST10:
	.byte	0x8
	.4byte	.LVL9
	.uleb128 .LVL10-.LVL9
	.uleb128 0x6
	.byte	0x3
	.4byte	os_interrupt__nest
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x8
	.4byte	.LVL9
	.uleb128 .LVL10-.LVL9
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST0:
	.byte	0x8
	.4byte	.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x8
	.4byte	.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x6
	.byte	0x3
	.4byte	os_interrupt__nest
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x8
	.4byte	.LVL2
	.uleb128 .LVL5-.LVL2
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST3:
	.byte	0x8
	.4byte	.LVL1
	.uleb128 .LVL2-.LVL1
	.uleb128 0x6
	.byte	0x3
	.4byte	os_interrupt__nest
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x8
	.4byte	.LVL3
	.uleb128 .LVL4-.LVL3
	.uleb128 0x6
	.byte	0x3
	.4byte	os_interrupt__nest
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x8
	.4byte	.LVL3
	.uleb128 .LVL4-.LVL3
	.uleb128 0x1
	.byte	0x53
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
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
	.4byte	.LFB45
	.uleb128 .LFE45-.LFB45
	.byte	0x7
	.4byte	.LFB46
	.uleb128 .LFE46-.LFB46
	.byte	0x7
	.4byte	.LFB47
	.uleb128 .LFE47-.LFB47
	.byte	0x7
	.4byte	.LFB48
	.uleb128 .LFE48-.LFB48
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF16:
	.ascii	"os_interrupt_exit\000"
.LASF26:
	.ascii	"D:/RTOS/Kernel/os_interrupt.c\000"
.LASF31:
	.ascii	"cpu_DMB\000"
.LASF27:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF2:
	.ascii	"short int\000"
.LASF14:
	.ascii	"os_uint_t\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF17:
	.ascii	"os_interrupt_enter\000"
.LASF24:
	.ascii	"cpu_LDREXW\000"
.LASF25:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions\000"
.LASF30:
	.ascii	"os_interrupt_init\000"
.LASF29:
	.ascii	"os_interrupt_nest\000"
.LASF21:
	.ascii	"cpu_STREXW\000"
.LASF6:
	.ascii	"long long int\000"
.LASF4:
	.ascii	"long int\000"
.LASF23:
	.ascii	"addr\000"
.LASF18:
	.ascii	"result\000"
.LASF28:
	.ascii	"os_interrupt__nest\000"
.LASF13:
	.ascii	"long double\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"signed char\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF20:
	.ascii	"cpu_atomic_add_return\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF12:
	.ascii	"cpu_atomic_t\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF15:
	.ascii	"char\000"
.LASF19:
	.ascii	"cpu_atomic_sub_return\000"
.LASF11:
	.ascii	"cpu_uint_t\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF22:
	.ascii	"value\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
