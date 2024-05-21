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
	.file	"os_priority.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Kernel/os_priority.c"
	.section	.text.os_priority_init,"ax",%progbits
	.align	1
	.global	os_priority_init
	.syntax unified
	.thumb
	.thumb_func
	.type	os_priority_init, %function
os_priority_init:
.LFB48:
	.loc 1 17 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 18 5
	.loc 1 19 5
.LVL0:
	.loc 1 19 10 is_stmt 0
	movs	r3, #0
.LVL1:
.L2:
	.loc 1 19 15 is_stmt 1 discriminator 1
	cbz	r3, .L3
	.loc 1 22 1 is_stmt 0
	bx	lr
.L3:
	.loc 1 20 9 is_stmt 1 discriminator 3
	.loc 1 20 31 is_stmt 0 discriminator 3
	ldr	r2, .L4
	movs	r1, #0
	str	r1, [r2, r3, lsl #2]
	.loc 1 19 54 is_stmt 1 discriminator 3
	adds	r3, r3, #1
.LVL2:
	b	.L2
.L5:
	.align	2
.L4:
	.word	os_priority__table
	.cfi_endproc
.LFE48:
	.size	os_priority_init, .-os_priority_init
	.section	.text.os_priority_get_highest,"ax",%progbits
	.align	1
	.global	os_priority_get_highest
	.syntax unified
	.thumb
	.thumb_func
	.type	os_priority_get_highest, %function
os_priority_get_highest:
.LFB49:
	.loc 1 24 44
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 25 5
	.loc 1 26 5
	.loc 1 28 5
.LVL3:
	.loc 1 34 5
	.loc 1 34 9
	.loc 1 34 19
	.loc 1 35 9
	.loc 1 36 9
	.loc 1 43 5
	.loc 1 43 55 is_stmt 0
	ldr	r3, .L10
	ldr	r0, [r3]
.LVL4:
.LBB5:
.LBB6:
	.file 2 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
	.loc 2 380 5 is_stmt 1
	.loc 2 381 5
	.syntax unified
@ 381 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	rbit r0, r0
@ 0 "" 2
.LVL5:
	.loc 2 382 5
	.thumb
	.syntax unified
	clz	r0, r0
.LVL6:
.LBE6:
.LBE5:
	.loc 1 44 5
	.loc 1 44 31 is_stmt 0
	cmp	r0, #32
	beq	.L9
.LVL7:
.L6:
	.loc 1 45 1
	bx	lr
.LVL8:
.L9:
	.loc 1 44 31
	mov	r0, #-1
.LVL9:
	b	.L6
.L11:
	.align	2
.L10:
	.word	os_priority__table
	.cfi_endproc
.LFE49:
	.size	os_priority_get_highest, .-os_priority_get_highest
	.section	.text.os_priority_mark,"ax",%progbits
	.align	1
	.global	os_priority_mark
	.syntax unified
	.thumb
	.thumb_func
	.type	os_priority_mark, %function
os_priority_mark:
.LFB50:
	.loc 1 48 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL10:
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 62 5
	.loc 1 62 45 is_stmt 0
	mov	r3, r0
	cmp	r0, #0
	blt	.L15
.L13:
	asrs	r3, r3, #3
	.loc 1 62 36
	ldr	r4, .L16
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	.loc 1 62 52
	and	r0, r0, #7
.LVL11:
	movs	r1, #1
	lsls	r1, r1, r0
	.loc 1 62 48
	orrs	r2, r2, r1
	strb	r2, [r4, r3]
	.loc 1 63 1
	ldr	r4, [sp], #4
	.cfi_remember_state
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL12:
.L15:
	.cfi_restore_state
	.loc 1 62 45
	adds	r3, r0, #7
	b	.L13
.L17:
	.align	2
.L16:
	.word	os_priority__table
	.cfi_endproc
.LFE50:
	.size	os_priority_mark, .-os_priority_mark
	.section	.text.os_priority_unmark,"ax",%progbits
	.align	1
	.global	os_priority_unmark
	.syntax unified
	.thumb
	.thumb_func
	.type	os_priority_unmark, %function
os_priority_unmark:
.LFB51:
	.loc 1 66 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL13:
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 78 5
	.loc 1 78 45 is_stmt 0
	mov	r2, r0
	cmp	r0, #0
	blt	.L21
.L19:
	asrs	r2, r2, #3
	.loc 1 78 36
	ldr	r4, .L22
	ldrb	r1, [r4, r2]	@ zero_extendqisi2
	.loc 1 78 55
	and	r0, r0, #7
.LVL14:
	movs	r3, #1
	lsls	r3, r3, r0
	.loc 1 78 49
	mvns	r3, r3
	sxtb	r3, r3
	ands	r3, r3, r1
	strb	r3, [r4, r2]
	.loc 1 79 1
	ldr	r4, [sp], #4
	.cfi_remember_state
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL15:
.L21:
	.cfi_restore_state
	.loc 1 78 45
	adds	r2, r0, #7
	b	.L19
.L23:
	.align	2
.L22:
	.word	os_priority__table
	.cfi_endproc
.LFE51:
	.size	os_priority_unmark, .-os_priority_unmark
	.section	.text.os_priority_is_marked,"ax",%progbits
	.align	1
	.global	os_priority_is_marked
	.syntax unified
	.thumb
	.thumb_func
	.type	os_priority_is_marked, %function
os_priority_is_marked:
.LFB52:
	.loc 1 81 50 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL16:
	.loc 1 83 5
	.loc 1 83 53 is_stmt 0
	mov	r3, r0
	cmp	r0, #0
	blt	.L26
.L25:
	asrs	r3, r3, #3
	.loc 1 83 44
	ldr	r2, .L27
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	.loc 1 83 57
	and	r0, r0, #7
.LVL17:
	asr	r0, r3, r0
	.loc 1 84 1
	and	r0, r0, #1
	bx	lr
.LVL18:
.L26:
	.loc 1 83 53
	adds	r3, r0, #7
	b	.L25
.L28:
	.align	2
.L27:
	.word	os_priority__table
	.cfi_endproc
.LFE52:
	.size	os_priority_is_marked, .-os_priority_is_marked
	.section	.text.os_priority_cmp,"ax",%progbits
	.align	1
	.global	os_priority_cmp
	.syntax unified
	.thumb
	.thumb_func
	.type	os_priority_cmp, %function
os_priority_cmp:
.LFB53:
	.loc 1 87 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL19:
	.loc 1 88 5
	.loc 1 88 22 is_stmt 0
	cmp	r0, r1
	beq	.L31
	.loc 1 88 35 discriminator 1
	bge	.L32
	.loc 1 88 35
	movs	r0, #1
.LVL20:
	bx	lr
.LVL21:
.L31:
	.loc 1 88 22
	movs	r0, #0
.LVL22:
	bx	lr
.LVL23:
.L32:
	.loc 1 88 35
	mov	r0, #-1
.LVL24:
	.loc 1 89 1
	bx	lr
	.cfi_endproc
.LFE53:
	.size	os_priority_cmp, .-os_priority_cmp
	.section	.text.os_priority_swap,"ax",%progbits
	.align	1
	.global	os_priority_swap
	.syntax unified
	.thumb
	.thumb_func
	.type	os_priority_swap, %function
os_priority_swap:
.LFB54:
	.loc 1 91 56 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL25:
	.loc 1 92 5
	.loc 1 93 5
	.loc 1 94 5
	.loc 1 95 5
	.loc 1 96 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE54:
	.size	os_priority_swap, .-os_priority_swap
	.section	.bss.os_priority__table,"aw",%nobits
	.align	2
	.type	os_priority__table, %object
	.size	os_priority__table, 4
os_priority__table:
	.space	4
	.text
.Letext0:
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 4 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 5 "D:/RTOS/Kernel/os_types.h"
	.file 6 "D:/RTOS/Kernel/os_priority.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2b5
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x1d
	.4byte	.LASF34
	.4byte	.LASF35
	.4byte	.LLRL9
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.4byte	.LASF4
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
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x3
	.byte	0x4d
	.byte	0x12
	.4byte	0x5a
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x6d
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x2d
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x4
	.byte	0x2c
	.byte	0x13
	.4byte	0x4e
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x61
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x5
	.byte	0x51
	.byte	0x11
	.4byte	0x9c
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x5
	.byte	0x52
	.byte	0x12
	.4byte	0xa8
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x5
	.byte	0x6b
	.byte	0x13
	.4byte	0xc7
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x6
	.byte	0xd
	.byte	0x12
	.4byte	0xbb
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF20
	.uleb128 0xa
	.4byte	0xc7
	.4byte	0x102
	.uleb128 0xb
	.4byte	0x89
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0xc
	.byte	0x12
	.4byte	0xf2
	.uleb128 0x5
	.byte	0x3
	.4byte	os_priority__table
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x5b
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x150
	.uleb128 0x4
	.ascii	"a\000"
	.byte	0x5b
	.byte	0x25
	.4byte	0xdf
	.4byte	.LLST7
	.uleb128 0x4
	.ascii	"b\000"
	.byte	0x5b
	.byte	0x36
	.4byte	0xdf
	.4byte	.LLST8
	.uleb128 0xc
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0x5c
	.byte	0x13
	.4byte	0xdf
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0x56
	.byte	0x5
	.4byte	0x82
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x183
	.uleb128 0x4
	.ascii	"a\000"
	.byte	0x56
	.byte	0x23
	.4byte	0xdf
	.4byte	.LLST6
	.uleb128 0xd
	.ascii	"b\000"
	.byte	0x1
	.byte	0x56
	.byte	0x34
	.4byte	0xdf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x5
	.4byte	.LASF23
	.byte	0x51
	.byte	0x5
	.4byte	0x1ac
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ac
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x51
	.byte	0x29
	.4byte	0xdf
	.4byte	.LLST5
	.byte	0
	.uleb128 0x1
	.byte	0x1
	.byte	0x2
	.4byte	.LASF25
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x41
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1d7
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x41
	.byte	0x27
	.4byte	0xdf
	.4byte	.LLST4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x2f
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1fb
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x2f
	.byte	0x25
	.4byte	0xdf
	.4byte	.LLST3
	.byte	0
	.uleb128 0x5
	.4byte	.LASF29
	.byte	0x18
	.byte	0xf
	.4byte	0xdf
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x266
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0x19
	.byte	0x10
	.4byte	0x266
	.uleb128 0x6
	.byte	0x3
	.4byte	os_priority__table
	.byte	0x9f
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0x1a
	.byte	0x13
	.4byte	0xdf
	.4byte	.LLST1
	.uleb128 0xf
	.4byte	0x246
	.uleb128 0x10
	.ascii	"i\000"
	.byte	0x1
	.byte	0x22
	.byte	0xd
	.4byte	0x82
	.byte	0
	.uleb128 0x11
	.4byte	0x28f
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.byte	0x1
	.byte	0x2b
	.byte	0x37
	.uleb128 0x12
	.4byte	0x29d
	.4byte	.LLST2
	.uleb128 0x13
	.4byte	0x2aa
	.byte	0
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0xc7
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x10
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28f
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x1
	.byte	0x12
	.byte	0xf
	.4byte	0xd3
	.4byte	.LLST0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF36
	.byte	0x2
	.2byte	0x17a
	.byte	0x37
	.4byte	0xa8
	.byte	0x3
	.uleb128 0x17
	.4byte	.LASF37
	.byte	0x2
	.2byte	0x17a
	.byte	0x49
	.4byte	0xa8
	.uleb128 0x18
	.4byte	.LASF32
	.byte	0x2
	.2byte	0x17c
	.byte	0xe
	.4byte	0xa8
	.byte	0
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
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
.LLST7:
	.byte	0x6
	.4byte	.LVL25
	.byte	0x4
	.uleb128 .LVL25-.LVL25
	.uleb128 .LVL25-.LVL25
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL25-.LVL25
	.uleb128 .LFE54-.LVL25
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL25
	.byte	0x4
	.uleb128 .LVL25-.LVL25
	.uleb128 .LVL25-.LVL25
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL25-.LVL25
	.uleb128 .LFE54-.LVL25
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL20-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL20-.LVL19
	.uleb128 .LVL21-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL21-.LVL19
	.uleb128 .LVL22-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL22-.LVL19
	.uleb128 .LVL23-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL19
	.uleb128 .LVL24-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL24-.LVL19
	.uleb128 .LFE53-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL17-.LVL16
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL17-.LVL16
	.uleb128 .LVL18-.LVL16
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL18-.LVL16
	.uleb128 .LFE52-.LVL16
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL13
	.byte	0x4
	.uleb128 .LVL13-.LVL13
	.uleb128 .LVL14-.LVL13
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL14-.LVL13
	.uleb128 .LVL15-.LVL13
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL13
	.uleb128 .LFE51-.LVL13
	.uleb128 0x1
	.byte	0x50
	.byte	0
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
	.uleb128 .LVL12-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL12-.LVL10
	.uleb128 .LFE50-.LVL10
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL3
	.byte	0x4
	.uleb128 .LVL3-.LVL3
	.uleb128 .LVL6-.LVL3
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL3
	.uleb128 .LVL7-.LVL3
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL8-.LVL3
	.uleb128 .LVL9-.LVL3
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST2:
	.byte	0x8
	.4byte	.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LFE48-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x4c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
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
.LLRL9:
	.byte	0x7
	.4byte	.LFB48
	.uleb128 .LFE48-.LFB48
	.byte	0x7
	.4byte	.LFB49
	.uleb128 .LFE49-.LFB49
	.byte	0x7
	.4byte	.LFB50
	.uleb128 .LFE50-.LFB50
	.byte	0x7
	.4byte	.LFB51
	.uleb128 .LFE51-.LFB51
	.byte	0x7
	.4byte	.LFB52
	.uleb128 .LFE52-.LFB52
	.byte	0x7
	.4byte	.LFB53
	.uleb128 .LFE53-.LFB53
	.byte	0x7
	.4byte	.LFB54
	.uleb128 .LFE54-.LFB54
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF4:
	.ascii	"__uint8_t\000"
.LASF23:
	.ascii	"os_priority_is_marked\000"
.LASF37:
	.ascii	"value\000"
.LASF5:
	.ascii	"__int32_t\000"
.LASF27:
	.ascii	"os_priority_unmark\000"
.LASF29:
	.ascii	"os_priority_get_highest\000"
.LASF35:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF33:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions\000"
.LASF21:
	.ascii	"os_priority__table\000"
.LASF36:
	.ascii	"cpu_RBIT\000"
.LASF19:
	.ascii	"os_priority_t\000"
.LASF34:
	.ascii	"D:/RTOS/Kernel/os_priority.c\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF18:
	.ascii	"os_size_t\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF24:
	.ascii	"priority\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF17:
	.ascii	"os_uint_t\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF32:
	.ascii	"result\000"
.LASF22:
	.ascii	"os_priority_cmp\000"
.LASF13:
	.ascii	"int32_t\000"
.LASF9:
	.ascii	"long long int\000"
.LASF20:
	.ascii	"char\000"
.LASF26:
	.ascii	"os_priority_swap\000"
.LASF31:
	.ascii	"os_priority_init\000"
.LASF28:
	.ascii	"os_priority_mark\000"
.LASF2:
	.ascii	"short int\000"
.LASF30:
	.ascii	"table_p\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF6:
	.ascii	"long int\000"
.LASF16:
	.ascii	"os_int_t\000"
.LASF15:
	.ascii	"long double\000"
.LASF0:
	.ascii	"signed char\000"
.LASF25:
	.ascii	"_Bool\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
