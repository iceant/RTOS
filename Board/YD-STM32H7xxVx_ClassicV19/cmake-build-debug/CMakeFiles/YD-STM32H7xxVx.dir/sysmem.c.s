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
	.file	"sysmem.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/sysmem.c"
	.section	.text._sbrk,"ax",%progbits
	.align	1
	.global	_sbrk
	.syntax unified
	.thumb
	.thumb_func
	.type	_sbrk, %function
_sbrk:
.LFB0:
	.loc 1 54 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r3, r0
	.loc 1 56 3
	.loc 1 57 3
	.loc 1 58 3
	.loc 1 59 3
	.loc 1 59 18 is_stmt 0
	ldr	r2, .L8
	ldr	r1, .L8+4
.LVL1:
	.loc 1 60 3 is_stmt 1
	.loc 1 61 3
	.loc 1 64 3
	.loc 1 64 11 is_stmt 0
	ldr	r0, .L8+8
.LVL2:
	ldr	r0, [r0]
	.loc 1 64 6
	cbz	r0, .L6
.L2:
	.loc 1 70 3 is_stmt 1
	.loc 1 70 23 is_stmt 0
	ldr	r0, .L8+8
	ldr	r0, [r0]
	add	r3, r3, r0
.LVL3:
	.loc 1 70 6
	subs	r2, r2, r1
	cmp	r3, r2
	bhi	.L7
	.loc 1 76 3 is_stmt 1
.LVL4:
	.loc 1 77 3
	.loc 1 77 19 is_stmt 0
	ldr	r2, .L8+8
	str	r3, [r2]
	.loc 1 79 3 is_stmt 1
.LVL5:
.L1:
	.loc 1 82 1 is_stmt 0
	pop	{r4, pc}
.LVL6:
.L6:
	.loc 1 66 5 is_stmt 1
	.loc 1 66 21 is_stmt 0
	ldr	r0, .L8+8
	ldr	r4, .L8+12
	str	r4, [r0]
	b	.L2
.LVL7:
.L7:
	.loc 1 72 4 is_stmt 1
	.loc 1 72 6 is_stmt 0
	bl	__errno
.LVL8:
	.loc 1 72 10
	movs	r3, #12
	str	r3, [r0]
	.loc 1 73 5 is_stmt 1
	.loc 1 73 12 is_stmt 0
	mov	r0, #-1
	b	.L1
.L9:
	.align	2
.L8:
	.word	_estack
	.word	_Min_Stack_Size
	.word	__sbrk_heap_end
	.word	_end
	.cfi_endproc
.LFE0:
	.size	_sbrk, .-_sbrk
	.section	.bss.__sbrk_heap_end,"aw",%nobits
	.align	2
	.type	__sbrk_heap_end, %object
	.size	__sbrk_heap_end, 4
__sbrk_heap_end:
	.space	4
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\lib\\gcc\\arm-none-eabi\\12.2.1\\include\\stddef.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 4 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 5 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\errno.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x165
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x1d
	.4byte	.LASF24
	.4byte	.LASF25
	.4byte	.LLRL2
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x2
	.byte	0x91
	.byte	0xd
	.4byte	0x26
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF2
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x3
	.byte	0x2b
	.byte	0x17
	.4byte	0x61
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x89
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x9
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x55
	.uleb128 0x5
	.4byte	0xa0
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x7d
	.uleb128 0x5
	.4byte	0xb1
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0x1e
	.byte	0x11
	.4byte	0xd4
	.uleb128 0x5
	.byte	0x3
	.4byte	__sbrk_heap_end
	.uleb128 0x3
	.4byte	0xa0
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x5
	.byte	0x13
	.byte	0xd
	.4byte	0xe5
	.uleb128 0x3
	.4byte	0x26
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x1
	.byte	0x35
	.byte	0x7
	.4byte	0x97
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x163
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x1
	.byte	0x35
	.byte	0x17
	.4byte	0x2d
	.4byte	.LLST0
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x38
	.byte	0x12
	.4byte	0xa0
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x39
	.byte	0x12
	.4byte	0xa0
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x3a
	.byte	0x13
	.4byte	0xb1
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x3b
	.4byte	0xbd
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x3c
	.4byte	0x163
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x1
	.byte	0x3d
	.byte	0xc
	.4byte	0xd4
	.4byte	.LLST1
	.uleb128 0xf
	.4byte	.LVL8
	.4byte	0xd9
	.byte	0
	.uleb128 0x3
	.4byte	0xac
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x21
	.sleb128 18
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
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
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL3-.LVL0
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
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LFE0-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x8
	.4byte	.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x1
	.byte	0x50
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
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
.LLRL2:
	.byte	0x7
	.4byte	.LFB0
	.uleb128 .LFE0-.LFB0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF1:
	.ascii	"long long int\000"
.LASF8:
	.ascii	"short unsigned int\000"
.LASF17:
	.ascii	"_estack\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF22:
	.ascii	"prev_heap_end\000"
.LASF24:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/sysmem.c\000"
.LASF20:
	.ascii	"max_heap\000"
.LASF10:
	.ascii	"__uint32_t\000"
.LASF27:
	.ascii	"_sbrk\000"
.LASF4:
	.ascii	"ptrdiff_t\000"
.LASF11:
	.ascii	"long unsigned int\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF5:
	.ascii	"__uint8_t\000"
.LASF18:
	.ascii	"_Min_Stack_Size\000"
.LASF14:
	.ascii	"uint8_t\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF28:
	.ascii	"incr\000"
.LASF13:
	.ascii	"char\000"
.LASF21:
	.ascii	"__sbrk_heap_end\000"
.LASF15:
	.ascii	"uint32_t\000"
.LASF9:
	.ascii	"long int\000"
.LASF16:
	.ascii	"_end\000"
.LASF25:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF26:
	.ascii	"__errno\000"
.LASF3:
	.ascii	"signed char\000"
.LASF23:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF2:
	.ascii	"long double\000"
.LASF19:
	.ascii	"stack_limit\000"
.LASF7:
	.ascii	"short int\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
