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
	.file	"os_memory.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Kernel/os_memory.c"
	.section	.text.os_memory_init,"ax",%progbits
	.align	1
	.global	os_memory_init
	.syntax unified
	.thumb
	.thumb_func
	.type	os_memory_init, %function
os_memory_init:
.LFB45:
	.loc 1 12 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 13 5
	.loc 1 13 22 is_stmt 0
	ldr	r1, .L6
	mov	r0, #10240
	bl	init_memory_pool
.LVL0:
	.loc 1 14 5 is_stmt 1
	.loc 1 14 7 is_stmt 0
	cbz	r0, .L5
	.loc 1 15 16
	movs	r0, #0
.LVL1:
.L1:
	.loc 1 18 1
	pop	{r3, pc}
.LVL2:
.L5:
	.loc 1 17 12
	mov	r0, #-1
.LVL3:
	b	.L1
.L7:
	.align	2
.L6:
	.word	os_memory__blocks
	.cfi_endproc
.LFE45:
	.size	os_memory_init, .-os_memory_init
	.section	.text.os_memory_destroy,"ax",%progbits
	.align	1
	.global	os_memory_destroy
	.syntax unified
	.thumb
	.thumb_func
	.type	os_memory_destroy, %function
os_memory_destroy:
.LFB46:
	.loc 1 21 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 22 5
	ldr	r0, .L10
	bl	destroy_memory_pool
.LVL4:
	.loc 1 23 1 is_stmt 0
	pop	{r3, pc}
.L11:
	.align	2
.L10:
	.word	os_memory__blocks
	.cfi_endproc
.LFE46:
	.size	os_memory_destroy, .-os_memory_destroy
	.section	.text.os_memory_malloc,"ax",%progbits
	.align	1
	.global	os_memory_malloc
	.syntax unified
	.thumb
	.thumb_func
	.type	os_memory_malloc, %function
os_memory_malloc:
.LFB47:
	.loc 1 26 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL5:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 27 5
	.loc 1 27 12 is_stmt 0
	bl	tlsf_malloc
.LVL6:
	.loc 1 28 1
	pop	{r3, pc}
	.cfi_endproc
.LFE47:
	.size	os_memory_malloc, .-os_memory_malloc
	.section	.text.os_memory_calloc,"ax",%progbits
	.align	1
	.global	os_memory_calloc
	.syntax unified
	.thumb
	.thumb_func
	.type	os_memory_calloc, %function
os_memory_calloc:
.LFB48:
	.loc 1 31 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL7:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 32 5
	.loc 1 32 12 is_stmt 0
	bl	tlsf_calloc
.LVL8:
	.loc 1 33 1
	pop	{r3, pc}
	.cfi_endproc
.LFE48:
	.size	os_memory_calloc, .-os_memory_calloc
	.section	.text.os_memory_realloc,"ax",%progbits
	.align	1
	.global	os_memory_realloc
	.syntax unified
	.thumb
	.thumb_func
	.type	os_memory_realloc, %function
os_memory_realloc:
.LFB49:
	.loc 1 36 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL9:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 37 5
	.loc 1 37 12 is_stmt 0
	bl	tlsf_realloc
.LVL10:
	.loc 1 38 1
	pop	{r3, pc}
	.cfi_endproc
.LFE49:
	.size	os_memory_realloc, .-os_memory_realloc
	.section	.text.os_memory_free,"ax",%progbits
	.align	1
	.global	os_memory_free
	.syntax unified
	.thumb
	.thumb_func
	.type	os_memory_free, %function
os_memory_free:
.LFB50:
	.loc 1 41 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL11:
	.loc 1 42 5
	.loc 1 42 7 is_stmt 0
	cbz	r0, .L21
	.loc 1 41 1
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 43 9 is_stmt 1
	bl	tlsf_free
.LVL12:
	.loc 1 45 1 is_stmt 0
	pop	{r3, pc}
.LVL13:
.L21:
	.cfi_def_cfa_offset 0
	.cfi_restore 3
	.cfi_restore 14
	bx	lr
	.cfi_endproc
.LFE50:
	.size	os_memory_free, .-os_memory_free
	.section	.bss.os_memory__blocks,"aw",%nobits
	.align	2
	.type	os_memory__blocks, %object
	.size	os_memory__blocks, 10240
os_memory__blocks:
	.space	10240
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\lib\\gcc\\arm-none-eabi\\12.2.1\\include\\stddef.h"
	.file 5 "D:/RTOS/Kernel/os_types.h"
	.file 6 "D:/RTOS/Kernel/os_errors.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/tlsf-src-src/src/tlsf.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x39b
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x1d
	.4byte	.LASF42
	.4byte	.LASF43
	.4byte	.LLRL15
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x39
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x4d
	.byte	0x12
	.4byte	0x5a
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x6d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x2d
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x2c
	.byte	0x13
	.4byte	0x4e
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x61
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x4
	.byte	0xd6
	.byte	0x16
	.4byte	0x89
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF16
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x5
	.byte	0x51
	.byte	0x11
	.4byte	0x9c
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x5
	.byte	0x52
	.byte	0x12
	.4byte	0xa8
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x5
	.byte	0x6b
	.byte	0x13
	.4byte	0xd3
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x6
	.byte	0xc
	.byte	0x12
	.4byte	0xc7
	.uleb128 0xd
	.byte	0x4
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF21
	.uleb128 0xe
	.4byte	0xf9
	.uleb128 0xf
	.4byte	0x90
	.4byte	0x116
	.uleb128 0x10
	.4byte	0x89
	.2byte	0x27ff
	.byte	0
	.uleb128 0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0xa
	.byte	0x10
	.4byte	0x105
	.uleb128 0x5
	.byte	0x3
	.4byte	os_memory__blocks
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x23
	.4byte	0x138
	.uleb128 0x4
	.4byte	0xf7
	.byte	0
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x24
	.byte	0xe
	.4byte	0xf7
	.4byte	0x152
	.uleb128 0x4
	.4byte	0xf7
	.uleb128 0x4
	.4byte	0xb4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x25
	.byte	0xe
	.4byte	0xf7
	.4byte	0x16c
	.uleb128 0x4
	.4byte	0xb4
	.uleb128 0x4
	.4byte	0xb4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x22
	.byte	0xe
	.4byte	0xf7
	.4byte	0x181
	.uleb128 0x4
	.4byte	0xb4
	.byte	0
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x1b
	.4byte	0x191
	.uleb128 0x4
	.4byte	0xf7
	.byte	0
	.uleb128 0x7
	.4byte	.LASF27
	.byte	0x18
	.byte	0xf
	.4byte	0xb4
	.4byte	0x1ab
	.uleb128 0x4
	.4byte	0xb4
	.uleb128 0x4
	.4byte	0xf7
	.byte	0
	.uleb128 0xa
	.4byte	.LASF36
	.byte	0x28
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1fe
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x28
	.byte	0x1b
	.4byte	0xf7
	.4byte	.LLST12
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x28
	.byte	0x2f
	.4byte	0x1fe
	.4byte	.LLST13
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x28
	.byte	0x3f
	.4byte	0xdf
	.4byte	.LLST14
	.uleb128 0x6
	.4byte	.LVL12
	.4byte	0x128
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x100
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x23
	.4byte	0xf7
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x271
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x23
	.byte	0x20
	.4byte	0xf7
	.4byte	.LLST8
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x23
	.byte	0x32
	.4byte	0xdf
	.4byte	.LLST9
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x23
	.byte	0x46
	.4byte	0x1fe
	.4byte	.LLST10
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x23
	.byte	0x56
	.4byte	0xdf
	.4byte	.LLST11
	.uleb128 0x6
	.4byte	.LVL10
	.4byte	0x138
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x1e
	.4byte	0xf7
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2de
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x1e
	.byte	0x23
	.4byte	0xdf
	.4byte	.LLST4
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x1e
	.byte	0x35
	.4byte	0xdf
	.4byte	.LLST5
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x1e
	.byte	0x49
	.4byte	0x1fe
	.4byte	.LLST6
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x1e
	.byte	0x59
	.4byte	0xdf
	.4byte	.LLST7
	.uleb128 0x6
	.4byte	.LVL8
	.4byte	0x152
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF35
	.byte	0x19
	.4byte	0xf7
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x335
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x19
	.byte	0x23
	.4byte	0xdf
	.4byte	.LLST1
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x19
	.byte	0x37
	.4byte	0x1fe
	.4byte	.LLST2
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x19
	.byte	0x47
	.4byte	0xdf
	.4byte	.LLST3
	.uleb128 0x6
	.4byte	.LVL6
	.4byte	0x16c
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF37
	.byte	0x14
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x35d
	.uleb128 0x6
	.4byte	.LVL4
	.4byte	0x181
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	os_memory__blocks
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF38
	.byte	0x1
	.byte	0xb
	.byte	0xa
	.4byte	0xeb
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x1
	.byte	0xd
	.byte	0xf
	.4byte	0xdf
	.4byte	.LLST0
	.uleb128 0x6
	.4byte	.LVL0
	.4byte	0x191
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa
	.2byte	0x2800
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	os_memory__blocks
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
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
	.uleb128 0x8
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
	.sleb128 8
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
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.byte	0
	.section	.debug_loclists,"",%progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST12:
	.byte	0x6
	.4byte	.LVL11
	.byte	0x4
	.uleb128 .LVL11-.LVL11
	.uleb128 .LVL12-1-.LVL11
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL12-1-.LVL11
	.uleb128 .LVL13-.LVL11
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL13-.LVL11
	.uleb128 .LFE50-.LVL11
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL11
	.byte	0x4
	.uleb128 .LVL11-.LVL11
	.uleb128 .LVL12-1-.LVL11
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL12-1-.LVL11
	.uleb128 .LVL13-.LVL11
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL13-.LVL11
	.uleb128 .LFE50-.LVL11
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL11
	.byte	0x4
	.uleb128 .LVL11-.LVL11
	.uleb128 .LVL12-1-.LVL11
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL12-1-.LVL11
	.uleb128 .LVL13-.LVL11
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL13-.LVL11
	.uleb128 .LFE50-.LVL11
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL10-1-.LVL9
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL10-1-.LVL9
	.uleb128 .LFE49-.LVL9
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL10-1-.LVL9
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL10-1-.LVL9
	.uleb128 .LFE49-.LVL9
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL10-1-.LVL9
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL10-1-.LVL9
	.uleb128 .LFE49-.LVL9
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL10-1-.LVL9
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL10-1-.LVL9
	.uleb128 .LFE49-.LVL9
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL7
	.byte	0x4
	.uleb128 .LVL7-.LVL7
	.uleb128 .LVL8-1-.LVL7
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL8-1-.LVL7
	.uleb128 .LFE48-.LVL7
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL7
	.byte	0x4
	.uleb128 .LVL7-.LVL7
	.uleb128 .LVL8-1-.LVL7
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL8-1-.LVL7
	.uleb128 .LFE48-.LVL7
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL7
	.byte	0x4
	.uleb128 .LVL7-.LVL7
	.uleb128 .LVL8-1-.LVL7
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL8-1-.LVL7
	.uleb128 .LFE48-.LVL7
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL7
	.byte	0x4
	.uleb128 .LVL7-.LVL7
	.uleb128 .LVL8-1-.LVL7
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL8-1-.LVL7
	.uleb128 .LFE48-.LVL7
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL5
	.byte	0x4
	.uleb128 .LVL5-.LVL5
	.uleb128 .LVL6-1-.LVL5
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL6-1-.LVL5
	.uleb128 .LFE47-.LVL5
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL5
	.byte	0x4
	.uleb128 .LVL5-.LVL5
	.uleb128 .LVL6-1-.LVL5
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL6-1-.LVL5
	.uleb128 .LFE47-.LVL5
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL5
	.byte	0x4
	.uleb128 .LVL5-.LVL5
	.uleb128 .LVL6-1-.LVL5
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL6-1-.LVL5
	.uleb128 .LFE47-.LVL5
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x44
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
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
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
.LLRL15:
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
	.byte	0x7
	.4byte	.LFB49
	.uleb128 .LFE49-.LFB49
	.byte	0x7
	.4byte	.LFB50
	.uleb128 .LFE50-.LFB50
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF24:
	.ascii	"tlsf_malloc\000"
.LASF4:
	.ascii	"__uint8_t\000"
.LASF15:
	.ascii	"size_t\000"
.LASF27:
	.ascii	"init_memory_pool\000"
.LASF20:
	.ascii	"os_err_t\000"
.LASF5:
	.ascii	"__int32_t\000"
.LASF25:
	.ascii	"tlsf_free\000"
.LASF31:
	.ascii	"nBytes\000"
.LASF39:
	.ascii	"os_memory__blocks\000"
.LASF43:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF41:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions\000"
.LASF22:
	.ascii	"tlsf_realloc\000"
.LASF29:
	.ascii	"file\000"
.LASF40:
	.ascii	"size\000"
.LASF19:
	.ascii	"os_size_t\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF34:
	.ascii	"nCount\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF32:
	.ascii	"os_memory_realloc\000"
.LASF38:
	.ascii	"os_memory_init\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF33:
	.ascii	"os_memory_calloc\000"
.LASF35:
	.ascii	"os_memory_malloc\000"
.LASF37:
	.ascii	"os_memory_destroy\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF18:
	.ascii	"os_uint_t\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF30:
	.ascii	"line\000"
.LASF13:
	.ascii	"int32_t\000"
.LASF42:
	.ascii	"D:/RTOS/Kernel/os_memory.c\000"
.LASF9:
	.ascii	"long long int\000"
.LASF21:
	.ascii	"char\000"
.LASF2:
	.ascii	"short int\000"
.LASF23:
	.ascii	"tlsf_calloc\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF6:
	.ascii	"long int\000"
.LASF17:
	.ascii	"os_int_t\000"
.LASF16:
	.ascii	"long double\000"
.LASF0:
	.ascii	"signed char\000"
.LASF36:
	.ascii	"os_memory_free\000"
.LASF28:
	.ascii	"memory\000"
.LASF26:
	.ascii	"destroy_memory_pool\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
