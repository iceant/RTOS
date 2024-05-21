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
	.file	"os_idle.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Kernel/os_idle.c"
	.section	.text.os_idle_thread,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	os_idle_thread, %function
os_idle_thread:
.LFB45:
	.loc 1 13 36
	.cfi_startproc
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	b	.L2
.LVL1:
.L5:
	.loc 1 16 13
	ldr	r2, .L6
	ldr	r0, [r2]
	blx	r3
.LVL2:
.L2:
	.loc 1 14 5
	.loc 1 15 9
	.loc 1 15 12 is_stmt 0
	ldr	r3, .L6+4
	ldr	r3, [r3]
	.loc 1 15 11
	cmp	r3, #0
	bne	.L5
	b	.L2
.L7:
	.align	2
.L6:
	.word	os_idle__handler_parameter
	.word	os_idle__handler
	.cfi_endproc
.LFE45:
	.size	os_idle_thread, .-os_idle_thread
	.section	.rodata.os_idle_init.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"idle\000"
	.section	.text.os_idle_init,"ax",%progbits
	.align	1
	.global	os_idle_init
	.syntax unified
	.thumb
	.thumb_func
	.type	os_idle_init, %function
os_idle_init:
.LFB46:
	.loc 1 26 28 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	.loc 1 27 5
	ldr	r4, .L10
	movs	r3, #5
	str	r3, [sp, #12]
	movs	r3, #31
	str	r3, [sp, #8]
	mov	r3, #512
	str	r3, [sp, #4]
	ldr	r3, .L10+4
	str	r3, [sp]
	movs	r3, #0
	ldr	r2, .L10+8
	ldr	r1, .L10+12
	mov	r0, r4
	bl	os_thread_init
.LVL3:
	.loc 1 28 5
	mov	r0, r4
	bl	os_thread_startup
.LVL4:
	.loc 1 29 5
	.loc 1 30 1 is_stmt 0
	movs	r0, #0
	add	sp, sp, #16
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
.L11:
	.align	2
.L10:
	.word	os_idle__task
	.word	os_idle__task_stack
	.word	os_idle_thread
	.word	.LC0
	.cfi_endproc
.LFE46:
	.size	os_idle_init, .-os_idle_init
	.section	.text.os_idle_set_handler,"ax",%progbits
	.align	1
	.global	os_idle_set_handler
	.syntax unified
	.thumb
	.thumb_func
	.type	os_idle_set_handler, %function
os_idle_set_handler:
.LFB47:
	.loc 1 32 59 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL5:
	.loc 1 33 5
	.loc 1 33 22 is_stmt 0
	ldr	r3, .L13
	str	r0, [r3]
	.loc 1 34 5 is_stmt 1
	.loc 1 34 32 is_stmt 0
	ldr	r3, .L13+4
	str	r1, [r3]
	.loc 1 35 1
	bx	lr
.L14:
	.align	2
.L13:
	.word	os_idle__handler
	.word	os_idle__handler_parameter
	.cfi_endproc
.LFE47:
	.size	os_idle_set_handler, .-os_idle_set_handler
	.section	.bss.os_idle__handler_parameter,"aw",%nobits
	.align	2
	.type	os_idle__handler_parameter, %object
	.size	os_idle__handler_parameter, 4
os_idle__handler_parameter:
	.space	4
	.section	.bss.os_idle__handler,"aw",%nobits
	.align	2
	.type	os_idle__handler, %object
	.size	os_idle__handler, 4
os_idle__handler:
	.space	4
	.section	.bss.os_idle__task,"aw",%nobits
	.align	2
	.type	os_idle__task, %object
	.size	os_idle__task, 100
os_idle__task:
	.space	100
	.section	.bss.os_idle__task_stack,"aw",%nobits
	.align	2
	.type	os_idle__task_stack, %object
	.size	os_idle__task_stack, 512
os_idle__task_stack:
	.space	512
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Kernel/os_types.h"
	.file 5 "D:/RTOS/Kernel/os_errors.h"
	.file 6 "D:/RTOS/Kernel/os_priority.h"
	.file 7 "D:/RTOS/Kernel/os_tick.h"
	.file 8 "D:/RTOS/Kernel/os_list.h"
	.file 9 "D:/RTOS/Kernel/os_timer.h"
	.file 10 "D:/RTOS/Kernel/os_thread.h"
	.file 11 "D:/RTOS/Kernel/os_idle.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x481
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xc
	.4byte	.LASF61
	.byte	0x1d
	.4byte	.LASF62
	.4byte	.LASF63
	.4byte	.LLRL1
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x39
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x2
	.byte	0x4d
	.byte	0x12
	.4byte	0x5a
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x6d
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0xd
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x2d
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x3
	.byte	0x2c
	.byte	0x13
	.4byte	0x4e
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x61
	.uleb128 0x4
	.byte	0x8
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x4
	.byte	0x51
	.byte	0x11
	.4byte	0x9c
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x4
	.byte	0x52
	.byte	0x12
	.4byte	0xa8
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x4
	.byte	0x6b
	.byte	0x13
	.4byte	0xc7
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x5
	.byte	0xc
	.byte	0x12
	.4byte	0xbb
	.uleb128 0x2
	.4byte	.LASF20
	.byte	0x6
	.byte	0xd
	.byte	0x12
	.4byte	0xbb
	.uleb128 0x2
	.4byte	.LASF21
	.byte	0x7
	.byte	0x10
	.byte	0x13
	.4byte	0xc7
	.uleb128 0x2
	.4byte	.LASF22
	.byte	0x8
	.byte	0x6
	.byte	0x1f
	.4byte	0x10f
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x8
	.byte	0x8
	.byte	0x9
	.4byte	0x136
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0x8
	.byte	0xa
	.byte	0x16
	.4byte	0x136
	.byte	0
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x8
	.byte	0xb
	.byte	0x16
	.4byte	0x136
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.4byte	0x103
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0x9
	.byte	0x1f
	.byte	0x1b
	.4byte	0x147
	.uleb128 0x7
	.4byte	.LASF27
	.byte	0x1c
	.byte	0x9
	.byte	0x23
	.4byte	0x1a2
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x9
	.byte	0x24
	.byte	0x14
	.4byte	0x103
	.byte	0
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x9
	.byte	0x25
	.byte	0x18
	.4byte	0x1a2
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x9
	.byte	0x26
	.byte	0xb
	.4byte	0x1c8
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x9
	.byte	0x27
	.byte	0xf
	.4byte	0xf7
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x9
	.byte	0x28
	.byte	0xf
	.4byte	0xf7
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x9
	.byte	0x29
	.byte	0x9
	.4byte	0x82
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.4byte	.LASF34
	.byte	0x9
	.byte	0x21
	.byte	0x10
	.4byte	0x1ae
	.uleb128 0x6
	.4byte	0x1b3
	.uleb128 0x8
	.4byte	0x1c3
	.uleb128 0x3
	.4byte	0x1c3
	.uleb128 0x3
	.4byte	0x1c8
	.byte	0
	.uleb128 0x6
	.4byte	0x13b
	.uleb128 0xe
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF35
	.byte	0xa
	.byte	0x20
	.byte	0x1c
	.4byte	0x1d6
	.uleb128 0x7
	.4byte	.LASF36
	.byte	0x64
	.byte	0xa
	.byte	0x24
	.4byte	0x2b2
	.uleb128 0xf
	.ascii	"sp\000"
	.byte	0xa
	.byte	0x25
	.byte	0xb
	.4byte	0x1c8
	.byte	0
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0xa
	.byte	0x26
	.byte	0xa
	.4byte	0x2ef
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0xa
	.byte	0x27
	.byte	0x17
	.4byte	0x2b2
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0xa
	.byte	0x28
	.byte	0xb
	.4byte	0x1c8
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0xa
	.byte	0x29
	.byte	0xb
	.4byte	0x1c8
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF41
	.byte	0xa
	.byte	0x2a
	.byte	0xf
	.4byte	0xd3
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0xa
	.byte	0x2b
	.byte	0x14
	.4byte	0x103
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0xa
	.byte	0x2c
	.byte	0x14
	.4byte	0x103
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0xa
	.byte	0x2d
	.byte	0x10
	.4byte	0x13b
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0xa
	.byte	0x2e
	.byte	0x13
	.4byte	0xeb
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0xa
	.byte	0x2f
	.byte	0x13
	.4byte	0xeb
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0xa
	.byte	0x30
	.byte	0xf
	.4byte	0xf7
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0xa
	.byte	0x31
	.byte	0xf
	.4byte	0xf7
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0xa
	.byte	0x32
	.byte	0x9
	.4byte	0x82
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0xa
	.byte	0x33
	.byte	0xe
	.4byte	0xdf
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0xa
	.byte	0x34
	.byte	0x16
	.4byte	0x2ce
	.byte	0x60
	.byte	0
	.uleb128 0x2
	.4byte	.LASF51
	.byte	0xa
	.byte	0x21
	.byte	0x10
	.4byte	0x2be
	.uleb128 0x6
	.4byte	0x2c3
	.uleb128 0x8
	.4byte	0x2ce
	.uleb128 0x3
	.4byte	0x1c8
	.byte	0
	.uleb128 0x2
	.4byte	.LASF52
	.byte	0xa
	.byte	0x22
	.byte	0x10
	.4byte	0x2da
	.uleb128 0x6
	.4byte	0x2df
	.uleb128 0x8
	.4byte	0x2ea
	.uleb128 0x3
	.4byte	0x2ea
	.byte	0
	.uleb128 0x6
	.4byte	0x1ca
	.uleb128 0xa
	.4byte	0x2ff
	.4byte	0x2ff
	.uleb128 0x10
	.4byte	0x89
	.byte	0x7
	.byte	0
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF53
	.uleb128 0x11
	.4byte	0x2ff
	.uleb128 0x2
	.4byte	.LASF54
	.byte	0xb
	.byte	0xd
	.byte	0x10
	.4byte	0x2be
	.uleb128 0xa
	.4byte	0x90
	.4byte	0x328
	.uleb128 0x12
	.4byte	0x89
	.2byte	0x1ff
	.byte	0
	.uleb128 0x13
	.4byte	.LASF64
	.byte	0x1
	.byte	0x7
	.byte	0x10
	.4byte	0x317
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.4byte	os_idle__task_stack
	.uleb128 0x9
	.4byte	.LASF55
	.byte	0x9
	.byte	0x14
	.4byte	0x1ca
	.uleb128 0x5
	.byte	0x3
	.4byte	os_idle__task
	.uleb128 0x9
	.4byte	.LASF56
	.byte	0xa
	.byte	0x18
	.4byte	0x30b
	.uleb128 0x5
	.byte	0x3
	.4byte	os_idle__handler
	.uleb128 0x9
	.4byte	.LASF57
	.byte	0xb
	.byte	0xe
	.4byte	0x1c8
	.uleb128 0x5
	.byte	0x3
	.4byte	os_idle__handler_parameter
	.uleb128 0xb
	.4byte	.LASF58
	.byte	0x4f
	.4byte	0xdf
	.4byte	0x382
	.uleb128 0x3
	.4byte	0x2ea
	.byte	0
	.uleb128 0xb
	.4byte	.LASF59
	.byte	0x49
	.4byte	0xdf
	.4byte	0x3b9
	.uleb128 0x3
	.4byte	0x2ea
	.uleb128 0x3
	.4byte	0x3b9
	.uleb128 0x3
	.4byte	0x2b2
	.uleb128 0x3
	.4byte	0x1c8
	.uleb128 0x3
	.4byte	0x1c8
	.uleb128 0x3
	.4byte	0xd3
	.uleb128 0x3
	.4byte	0xeb
	.uleb128 0x3
	.4byte	0xf7
	.byte	0
	.uleb128 0x6
	.4byte	0x306
	.uleb128 0x14
	.4byte	.LASF65
	.byte	0x1
	.byte	0x20
	.byte	0x6
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ef
	.uleb128 0x15
	.4byte	.LASF60
	.byte	0x1
	.byte	0x20
	.byte	0x2a
	.4byte	0x30b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x16
	.ascii	"p\000"
	.byte	0x1
	.byte	0x20
	.byte	0x39
	.4byte	0x1c8
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF66
	.byte	0x1
	.byte	0x1a
	.byte	0xa
	.4byte	0xdf
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x463
	.uleb128 0x18
	.4byte	.LVL3
	.4byte	0x382
	.4byte	0x452
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	os_idle_thread
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x5
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x5
	.byte	0x3
	.4byte	os_idle__task_stack
	.uleb128 0x5
	.uleb128 0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x3
	.byte	0xa
	.2byte	0x200
	.uleb128 0x5
	.uleb128 0x2
	.byte	0x7d
	.sleb128 8
	.uleb128 0x1
	.byte	0x4f
	.uleb128 0x5
	.uleb128 0x2
	.byte	0x7d
	.sleb128 12
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x19
	.4byte	.LVL4
	.4byte	0x36e
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF67
	.byte	0x1
	.byte	0xd
	.byte	0xd
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.ascii	"p\000"
	.byte	0x1
	.byte	0xd
	.byte	0x22
	.4byte	0x1c8
	.4byte	.LLST0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 10
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 10
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x88
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.byte	0
	.section	.debug_loclists,"",%progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LFE45-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
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
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
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
	.byte	0x7
	.4byte	.LFB45
	.uleb128 .LFE45-.LFB45
	.byte	0x7
	.4byte	.LFB46
	.uleb128 .LFE46-.LFB46
	.byte	0x7
	.4byte	.LFB47
	.uleb128 .LFE47-.LFB47
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF31:
	.ascii	"ticks\000"
.LASF50:
	.ascii	"exit_function\000"
.LASF63:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF2:
	.ascii	"short int\000"
.LASF17:
	.ascii	"os_uint_t\000"
.LASF30:
	.ascii	"userdata\000"
.LASF45:
	.ascii	"curr_priority\000"
.LASF43:
	.ascii	"timer_node\000"
.LASF34:
	.ascii	"os_timer_timeout_t\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF60:
	.ascii	"handler\000"
.LASF61:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF47:
	.ascii	"remain_ticks\000"
.LASF55:
	.ascii	"os_idle__task\000"
.LASF9:
	.ascii	"long long int\000"
.LASF65:
	.ascii	"os_idle_set_handler\000"
.LASF67:
	.ascii	"os_idle_thread\000"
.LASF6:
	.ascii	"long int\000"
.LASF57:
	.ascii	"os_idle__handler_parameter\000"
.LASF51:
	.ascii	"os_thread_entry_t\000"
.LASF4:
	.ascii	"__uint8_t\000"
.LASF32:
	.ascii	"expire_tick\000"
.LASF48:
	.ascii	"state\000"
.LASF37:
	.ascii	"name\000"
.LASF18:
	.ascii	"os_size_t\000"
.LASF59:
	.ascii	"os_thread_init\000"
.LASF15:
	.ascii	"long double\000"
.LASF28:
	.ascii	"wait_node\000"
.LASF38:
	.ascii	"thread_entry\000"
.LASF42:
	.ascii	"ready_node\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"signed char\000"
.LASF33:
	.ascii	"flags\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF52:
	.ascii	"os_thread_exit_t\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF39:
	.ascii	"parameter\000"
.LASF44:
	.ascii	"init_priority\000"
.LASF62:
	.ascii	"D:/RTOS/Kernel/os_idle.c\000"
.LASF53:
	.ascii	"char\000"
.LASF13:
	.ascii	"int32_t\000"
.LASF19:
	.ascii	"os_err_t\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF46:
	.ascii	"init_ticks\000"
.LASF58:
	.ascii	"os_thread_startup\000"
.LASF64:
	.ascii	"os_idle__task_stack\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF16:
	.ascii	"os_int_t\000"
.LASF21:
	.ascii	"os_tick_t\000"
.LASF20:
	.ascii	"os_priority_t\000"
.LASF5:
	.ascii	"__int32_t\000"
.LASF27:
	.ascii	"os_timer_s\000"
.LASF25:
	.ascii	"os_timer_t\000"
.LASF41:
	.ascii	"stack_size\000"
.LASF36:
	.ascii	"os_thread_s\000"
.LASF35:
	.ascii	"os_thread_t\000"
.LASF26:
	.ascii	"os_list_node_s\000"
.LASF22:
	.ascii	"os_list_node_t\000"
.LASF56:
	.ascii	"os_idle__handler\000"
.LASF49:
	.ascii	"error\000"
.LASF23:
	.ascii	"prev\000"
.LASF40:
	.ascii	"stack_addr\000"
.LASF54:
	.ascii	"os_idle_handler\000"
.LASF66:
	.ascii	"os_idle_init\000"
.LASF29:
	.ascii	"timeout\000"
.LASF24:
	.ascii	"next\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
