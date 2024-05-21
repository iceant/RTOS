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
	.file	"stm32h7xx_it.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/stm32h7xx_it.c"
	.section	.rodata.NMI_Handler.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"NMI_Handler\015\012\000"
	.section	.text.NMI_Handler,"ax",%progbits
	.align	1
	.global	NMI_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	NMI_Handler, %function
NMI_Handler:
.LFB383:
	.loc 1 49 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 50 5
	ldr	r0, .L3
	bl	BSP_USART1_Printf
.LVL0:
	.loc 1 51 1 is_stmt 0
	pop	{r3, pc}
.L4:
	.align	2
.L3:
	.word	.LC0
	.cfi_endproc
.LFE383:
	.size	NMI_Handler, .-NMI_Handler
	.section	.rodata.MemManage_Handler.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"MemManage_Handler\015\012\000"
	.section	.text.MemManage_Handler,"ax",%progbits
	.align	1
	.global	MemManage_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	MemManage_Handler, %function
MemManage_Handler:
.LFB384:
	.loc 1 72 1 is_stmt 1
	.cfi_startproc
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 73 5
	ldr	r0, .L8
	bl	BSP_USART1_Printf
.LVL1:
	.loc 1 74 5
	bl	HardFault_Handler
.LVL2:
.L6:
	.loc 1 76 3 discriminator 1
	.loc 1 78 3 discriminator 1
	.loc 1 76 9 discriminator 1
	b	.L6
.L9:
	.align	2
.L8:
	.word	.LC1
	.cfi_endproc
.LFE384:
	.size	MemManage_Handler, .-MemManage_Handler
	.section	.rodata.BusFault_Handler.str1.4,"aMS",%progbits,1
	.align	2
.LC2:
	.ascii	"BusFault_Handler\015\012\000"
	.section	.text.BusFault_Handler,"ax",%progbits
	.align	1
	.global	BusFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	BusFault_Handler, %function
BusFault_Handler:
.LFB385:
	.loc 1 87 1
	.cfi_startproc
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 88 5
	ldr	r0, .L13
	bl	BSP_USART1_Printf
.LVL3:
.L11:
	.loc 1 90 3 discriminator 1
	.loc 1 92 3 discriminator 1
	.loc 1 90 9 discriminator 1
	b	.L11
.L14:
	.align	2
.L13:
	.word	.LC2
	.cfi_endproc
.LFE385:
	.size	BusFault_Handler, .-BusFault_Handler
	.section	.rodata.UsageFault_Handler.str1.4,"aMS",%progbits,1
	.align	2
.LC3:
	.ascii	"UsageFault_Handler\015\012\000"
	.section	.text.UsageFault_Handler,"ax",%progbits
	.align	1
	.global	UsageFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	UsageFault_Handler, %function
UsageFault_Handler:
.LFB386:
	.loc 1 101 1
	.cfi_startproc
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 102 5
	ldr	r0, .L18
	bl	BSP_USART1_Printf
.LVL4:
.L16:
	.loc 1 104 3 discriminator 1
	.loc 1 106 3 discriminator 1
	.loc 1 104 9 discriminator 1
	b	.L16
.L19:
	.align	2
.L18:
	.word	.LC3
	.cfi_endproc
.LFE386:
	.size	UsageFault_Handler, .-UsageFault_Handler
	.section	.rodata.DebugMon_Handler.str1.4,"aMS",%progbits,1
	.align	2
.LC4:
	.ascii	"DebugMon_Handler\015\012\000"
	.section	.text.DebugMon_Handler,"ax",%progbits
	.align	1
	.global	DebugMon_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	DebugMon_Handler, %function
DebugMon_Handler:
.LFB387:
	.loc 1 124 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 125 5
	ldr	r0, .L22
	bl	BSP_USART1_Printf
.LVL5:
	.loc 1 126 1 is_stmt 0
	pop	{r3, pc}
.L23:
	.align	2
.L22:
	.word	.LC4
	.cfi_endproc
.LFE387:
	.size	DebugMon_Handler, .-DebugMon_Handler
	.section	.text.SysTick_Handler,"ax",%progbits
	.align	1
	.global	SysTick_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	SysTick_Handler, %function
SysTick_Handler:
.LFB388:
	.loc 1 143 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 145 5
	bl	os_scheduler_on_systick
.LVL6:
	.loc 1 147 1 is_stmt 0
	pop	{r3, pc}
	.cfi_endproc
.LFE388:
	.size	SysTick_Handler, .-SysTick_Handler
	.text
.Letext0:
	.file 2 "D:/RTOS/Kernel/os_scheduler.h"
	.file 3 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/stm32h7xx_it.h"
	.file 4 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1a6
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x1d
	.4byte	.LASF21
	.4byte	.LASF22
	.4byte	.LLRL0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
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
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF9
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x9
	.4byte	0x73
	.uleb128 0xa
	.byte	0x4
	.4byte	0x7a
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x2
	.byte	0x25
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x3
	.byte	0x22
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x4
	.byte	0xce
	.byte	0x4
	.4byte	0x5e
	.4byte	0xb8
	.uleb128 0xc
	.4byte	0x7f
	.uleb128 0xd
	.byte	0
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x8e
	.4byte	.LFB388
	.4byte	.LFE388-.LFB388
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd6
	.uleb128 0x6
	.4byte	.LVL6
	.4byte	0x93
	.byte	0
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x7b
	.4byte	.LFB387
	.4byte	.LFE387-.LFB387
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfe
	.uleb128 0x4
	.4byte	.LVL5
	.4byte	0xa1
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC4
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x64
	.4byte	.LFB386
	.4byte	.LFE386-.LFB386
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x126
	.uleb128 0x4
	.4byte	.LVL4
	.4byte	0xa1
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x56
	.4byte	.LFB385
	.4byte	.LFE385-.LFB385
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x14e
	.uleb128 0x4
	.4byte	.LVL3
	.4byte	0xa1
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x47
	.4byte	.LFB384
	.4byte	.LFE384-.LFB384
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x183
	.uleb128 0xe
	.4byte	.LVL1
	.4byte	0xa1
	.4byte	0x179
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x6
	.4byte	.LVL2
	.4byte	0x9a
	.byte	0
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x1
	.byte	0x30
	.byte	0x6
	.4byte	.LFB383
	.4byte	.LFE383-.LFB383
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LVL0
	.4byte	0xa1
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
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
	.uleb128 0x3
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x44
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB383
	.4byte	.LFE383-.LFB383
	.4byte	.LFB384
	.4byte	.LFE384-.LFB384
	.4byte	.LFB385
	.4byte	.LFE385-.LFB385
	.4byte	.LFB386
	.4byte	.LFE386-.LFB386
	.4byte	.LFB387
	.4byte	.LFE387-.LFB387
	.4byte	.LFB388
	.4byte	.LFE388-.LFB388
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
.LLRL0:
	.byte	0x7
	.4byte	.LFB383
	.uleb128 .LFE383-.LFB383
	.byte	0x7
	.4byte	.LFB384
	.uleb128 .LFE384-.LFB384
	.byte	0x7
	.4byte	.LFB385
	.uleb128 .LFE385-.LFB385
	.byte	0x7
	.4byte	.LFB386
	.uleb128 .LFE386-.LFB386
	.byte	0x7
	.4byte	.LFB387
	.uleb128 .LFE387-.LFB387
	.byte	0x7
	.4byte	.LFB388
	.uleb128 .LFE388-.LFB388
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF6:
	.ascii	"long long int\000"
.LASF19:
	.ascii	"MemManage_Handler\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF23:
	.ascii	"BSP_USART1_Printf\000"
.LASF17:
	.ascii	"UsageFault_Handler\000"
.LASF16:
	.ascii	"DebugMon_Handler\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF18:
	.ascii	"BusFault_Handler\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF13:
	.ascii	"os_scheduler_on_systick\000"
.LASF11:
	.ascii	"float\000"
.LASF21:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/stm32h7xx_i"
	.ascii	"t.c\000"
.LASF14:
	.ascii	"HardFault_Handler\000"
.LASF24:
	.ascii	"NMI_Handler\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF10:
	.ascii	"char\000"
.LASF15:
	.ascii	"SysTick_Handler\000"
.LASF4:
	.ascii	"long int\000"
.LASF12:
	.ascii	"double\000"
.LASF22:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF1:
	.ascii	"signed char\000"
.LASF20:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF9:
	.ascii	"long double\000"
.LASF0:
	.ascii	"short int\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
