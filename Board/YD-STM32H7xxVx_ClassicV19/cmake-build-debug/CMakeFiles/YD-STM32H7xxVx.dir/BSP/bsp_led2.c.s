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
	.file	"bsp_led2.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/BSP/bsp_led2.c"
	.section	.text.BSP_LED2_Init,"ax",%progbits
	.align	1
	.global	BSP_LED2_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	BSP_LED2_Init, %function
BSP_LED2_Init:
.LFB335:
	.loc 1 13 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 32
	.loc 1 14 5
	.loc 1 15 5
.LBB2:
	.loc 1 15 10
	.loc 1 15 36
	.loc 1 15 100 is_stmt 0
	ldr	r3, .L3
	ldr	r2, [r3, #224]
	.loc 1 15 111
	orr	r2, r2, #1
	str	r2, [r3, #224]
	.loc 1 15 134 is_stmt 1
	.loc 1 15 207 is_stmt 0
	ldr	r3, [r3, #224]
	.loc 1 15 218
	and	r3, r3, #1
	.loc 1 15 141
	str	r3, [sp]
	.loc 1 15 240 is_stmt 1
	.loc 1 15 241 is_stmt 0
	ldr	r3, [sp]
.LBE2:
	.loc 1 15 8 is_stmt 1
	.loc 1 17 5
	.loc 1 17 28 is_stmt 0
	mov	r3, #8192
	str	r3, [sp, #4]
	.loc 1 18 5 is_stmt 1
	.loc 1 18 29 is_stmt 0
	movs	r3, #1
	str	r3, [sp, #8]
	.loc 1 19 5 is_stmt 1
	.loc 1 19 29 is_stmt 0
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 20 5 is_stmt 1
	.loc 1 20 30 is_stmt 0
	movs	r3, #3
	str	r3, [sp, #16]
	.loc 1 21 5 is_stmt 1
	add	r1, sp, #4
	ldr	r0, .L3+4
	bl	HAL_GPIO_Init
.LVL0:
	.loc 1 22 1 is_stmt 0
	add	sp, sp, #28
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L4:
	.align	2
.L3:
	.word	1476543488
	.word	1476526080
	.cfi_endproc
.LFE335:
	.size	BSP_LED2_Init, .-BSP_LED2_Init
	.section	.text.BSP_LED2_On,"ax",%progbits
	.align	1
	.global	BSP_LED2_On
	.syntax unified
	.thumb
	.thumb_func
	.type	BSP_LED2_On, %function
BSP_LED2_On:
.LFB336:
	.loc 1 25 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 26 5
	movs	r2, #1
	mov	r1, #8192
	ldr	r0, .L7
	bl	HAL_GPIO_WritePin
.LVL1:
	.loc 1 27 1 is_stmt 0
	pop	{r3, pc}
.L8:
	.align	2
.L7:
	.word	1476526080
	.cfi_endproc
.LFE336:
	.size	BSP_LED2_On, .-BSP_LED2_On
	.section	.text.BSP_LED2_Off,"ax",%progbits
	.align	1
	.global	BSP_LED2_Off
	.syntax unified
	.thumb
	.thumb_func
	.type	BSP_LED2_Off, %function
BSP_LED2_Off:
.LFB337:
	.loc 1 29 24 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 30 5
	movs	r2, #0
	mov	r1, #8192
	ldr	r0, .L11
	bl	HAL_GPIO_WritePin
.LVL2:
	.loc 1 31 1 is_stmt 0
	pop	{r3, pc}
.L12:
	.align	2
.L11:
	.word	1476526080
	.cfi_endproc
.LFE337:
	.size	BSP_LED2_Off, .-BSP_LED2_Off
	.section	.text.BSP_LED2_Toggle,"ax",%progbits
	.align	1
	.global	BSP_LED2_Toggle
	.syntax unified
	.thumb
	.thumb_func
	.type	BSP_LED2_Toggle, %function
BSP_LED2_Toggle:
.LFB338:
	.loc 1 34 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 35 5
	mov	r1, #8192
	ldr	r0, .L15
	bl	HAL_GPIO_TogglePin
.LVL3:
	.loc 1 36 1 is_stmt 0
	pop	{r3, pc}
.L16:
	.align	2
.L15:
	.word	1476526080
	.cfi_endproc
.LFE338:
	.size	BSP_LED2_Toggle, .-BSP_LED2_Toggle
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_gpio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x69a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x13
	.4byte	.LASF102
	.byte	0x1d
	.4byte	.LASF103
	.4byte	.LASF104
	.4byte	.LLRL0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x39
	.byte	0x1c
	.4byte	0x47
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x61
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x14
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x3
	.byte	0x24
	.byte	0x14
	.4byte	0x3b
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x55
	.uleb128 0xd
	.4byte	0x90
	.uleb128 0xa
	.4byte	0x90
	.4byte	0xb1
	.uleb128 0xb
	.4byte	0x7d
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.4byte	0x9c
	.4byte	0xc1
	.uleb128 0xb
	.4byte	0x7d
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.4byte	0xb1
	.uleb128 0xa
	.4byte	0x90
	.4byte	0xd6
	.uleb128 0xb
	.4byte	0x7d
	.byte	0x8
	.byte	0
	.uleb128 0x15
	.byte	0x28
	.byte	0x4
	.2byte	0x401
	.byte	0x9
	.4byte	0x156
	.uleb128 0x1
	.4byte	.LASF13
	.2byte	0x403
	.byte	0x15
	.4byte	0x9c
	.byte	0
	.uleb128 0x1
	.4byte	.LASF14
	.2byte	0x404
	.byte	0x15
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF15
	.2byte	0x405
	.byte	0x15
	.4byte	0x9c
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF16
	.2byte	0x406
	.byte	0x15
	.4byte	0x9c
	.byte	0xc
	.uleb128 0x5
	.ascii	"IDR\000"
	.2byte	0x407
	.byte	0x15
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x5
	.ascii	"ODR\000"
	.2byte	0x408
	.byte	0x15
	.4byte	0x9c
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF17
	.2byte	0x409
	.byte	0x15
	.4byte	0x9c
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF18
	.2byte	0x40a
	.byte	0x15
	.4byte	0x9c
	.byte	0x1c
	.uleb128 0x5
	.ascii	"AFR\000"
	.2byte	0x40b
	.byte	0x15
	.4byte	0xc1
	.byte	0x20
	.byte	0
	.uleb128 0xe
	.4byte	.LASF19
	.2byte	0x40c
	.4byte	0xd6
	.uleb128 0x16
	.2byte	0x130
	.byte	0x4
	.2byte	0x4cd
	.byte	0x9
	.4byte	0x4c2
	.uleb128 0x5
	.ascii	"CR\000"
	.2byte	0x4cf
	.byte	0x14
	.4byte	0x9c
	.byte	0
	.uleb128 0x1
	.4byte	.LASF20
	.2byte	0x4d0
	.byte	0x14
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF21
	.2byte	0x4d1
	.byte	0x14
	.4byte	0x9c
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF22
	.2byte	0x4d2
	.byte	0x14
	.4byte	0x9c
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF23
	.2byte	0x4d3
	.byte	0x14
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF24
	.2byte	0x4d4
	.byte	0xb
	.4byte	0x90
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF25
	.2byte	0x4d5
	.byte	0x14
	.4byte	0x9c
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF26
	.2byte	0x4d6
	.byte	0x14
	.4byte	0x9c
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF27
	.2byte	0x4d7
	.byte	0x14
	.4byte	0x9c
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF28
	.2byte	0x4d8
	.byte	0xb
	.4byte	0x90
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF29
	.2byte	0x4d9
	.byte	0x14
	.4byte	0x9c
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF30
	.2byte	0x4da
	.byte	0x14
	.4byte	0x9c
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x4db
	.byte	0x14
	.4byte	0x9c
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF32
	.2byte	0x4dc
	.byte	0x14
	.4byte	0x9c
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF33
	.2byte	0x4dd
	.byte	0x14
	.4byte	0x9c
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF34
	.2byte	0x4de
	.byte	0x14
	.4byte	0x9c
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF35
	.2byte	0x4df
	.byte	0x14
	.4byte	0x9c
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF36
	.2byte	0x4e0
	.byte	0x14
	.4byte	0x9c
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x4e1
	.byte	0xb
	.4byte	0x90
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF38
	.2byte	0x4e2
	.byte	0x14
	.4byte	0x9c
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF39
	.2byte	0x4e3
	.byte	0x14
	.4byte	0x9c
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF40
	.2byte	0x4e4
	.byte	0x14
	.4byte	0x9c
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF41
	.2byte	0x4e5
	.byte	0x14
	.4byte	0x9c
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF42
	.2byte	0x4e6
	.byte	0xb
	.4byte	0x90
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF43
	.2byte	0x4e7
	.byte	0x14
	.4byte	0x9c
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF44
	.2byte	0x4e8
	.byte	0x14
	.4byte	0x9c
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF45
	.2byte	0x4e9
	.byte	0x14
	.4byte	0x9c
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF46
	.2byte	0x4ea
	.byte	0xb
	.4byte	0x90
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF47
	.2byte	0x4eb
	.byte	0x14
	.4byte	0x9c
	.byte	0x70
	.uleb128 0x5
	.ascii	"CSR\000"
	.2byte	0x4ec
	.byte	0x14
	.4byte	0x9c
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF48
	.2byte	0x4ed
	.byte	0xb
	.4byte	0x90
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF49
	.2byte	0x4ee
	.byte	0x14
	.4byte	0x9c
	.byte	0x7c
	.uleb128 0x1
	.4byte	.LASF50
	.2byte	0x4ef
	.byte	0x14
	.4byte	0x9c
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF51
	.2byte	0x4f0
	.byte	0x14
	.4byte	0x9c
	.byte	0x84
	.uleb128 0x1
	.4byte	.LASF52
	.2byte	0x4f1
	.byte	0x14
	.4byte	0x9c
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF53
	.2byte	0x4f2
	.byte	0x14
	.4byte	0x9c
	.byte	0x8c
	.uleb128 0x1
	.4byte	.LASF54
	.2byte	0x4f3
	.byte	0x14
	.4byte	0x9c
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF55
	.2byte	0x4f4
	.byte	0x14
	.4byte	0x9c
	.byte	0x94
	.uleb128 0x1
	.4byte	.LASF56
	.2byte	0x4f5
	.byte	0x14
	.4byte	0x9c
	.byte	0x98
	.uleb128 0x1
	.4byte	.LASF57
	.2byte	0x4f6
	.byte	0x14
	.4byte	0x9c
	.byte	0x9c
	.uleb128 0x5
	.ascii	"GCR\000"
	.2byte	0x4f7
	.byte	0x14
	.4byte	0x9c
	.byte	0xa0
	.uleb128 0x1
	.4byte	.LASF58
	.2byte	0x4f8
	.byte	0xb
	.4byte	0x90
	.byte	0xa4
	.uleb128 0x1
	.4byte	.LASF59
	.2byte	0x4f9
	.byte	0x14
	.4byte	0x9c
	.byte	0xa8
	.uleb128 0x1
	.4byte	.LASF60
	.2byte	0x4fa
	.byte	0xb
	.4byte	0xc6
	.byte	0xac
	.uleb128 0x5
	.ascii	"RSR\000"
	.2byte	0x4fb
	.byte	0x14
	.4byte	0x9c
	.byte	0xd0
	.uleb128 0x1
	.4byte	.LASF61
	.2byte	0x4fc
	.byte	0x14
	.4byte	0x9c
	.byte	0xd4
	.uleb128 0x1
	.4byte	.LASF62
	.2byte	0x4fd
	.byte	0x14
	.4byte	0x9c
	.byte	0xd8
	.uleb128 0x1
	.4byte	.LASF63
	.2byte	0x4fe
	.byte	0x14
	.4byte	0x9c
	.byte	0xdc
	.uleb128 0x1
	.4byte	.LASF64
	.2byte	0x4ff
	.byte	0x14
	.4byte	0x9c
	.byte	0xe0
	.uleb128 0x1
	.4byte	.LASF65
	.2byte	0x500
	.byte	0x14
	.4byte	0x9c
	.byte	0xe4
	.uleb128 0x1
	.4byte	.LASF66
	.2byte	0x501
	.byte	0x14
	.4byte	0x9c
	.byte	0xe8
	.uleb128 0x1
	.4byte	.LASF67
	.2byte	0x502
	.byte	0x14
	.4byte	0x9c
	.byte	0xec
	.uleb128 0x1
	.4byte	.LASF68
	.2byte	0x503
	.byte	0x14
	.4byte	0x9c
	.byte	0xf0
	.uleb128 0x1
	.4byte	.LASF69
	.2byte	0x504
	.byte	0x14
	.4byte	0x9c
	.byte	0xf4
	.uleb128 0x1
	.4byte	.LASF70
	.2byte	0x505
	.byte	0xb
	.4byte	0x90
	.byte	0xf8
	.uleb128 0x1
	.4byte	.LASF71
	.2byte	0x506
	.byte	0x14
	.4byte	0x9c
	.byte	0xfc
	.uleb128 0x4
	.4byte	.LASF72
	.2byte	0x507
	.byte	0x14
	.4byte	0x9c
	.2byte	0x100
	.uleb128 0x4
	.4byte	.LASF73
	.2byte	0x508
	.byte	0x14
	.4byte	0x9c
	.2byte	0x104
	.uleb128 0x4
	.4byte	.LASF74
	.2byte	0x509
	.byte	0x14
	.4byte	0x9c
	.2byte	0x108
	.uleb128 0x4
	.4byte	.LASF75
	.2byte	0x50a
	.byte	0x14
	.4byte	0x9c
	.2byte	0x10c
	.uleb128 0x4
	.4byte	.LASF76
	.2byte	0x50b
	.byte	0x14
	.4byte	0x9c
	.2byte	0x110
	.uleb128 0x4
	.4byte	.LASF77
	.2byte	0x50c
	.byte	0x14
	.4byte	0x9c
	.2byte	0x114
	.uleb128 0x4
	.4byte	.LASF78
	.2byte	0x50d
	.byte	0x14
	.4byte	0x9c
	.2byte	0x118
	.uleb128 0x4
	.4byte	.LASF79
	.2byte	0x50e
	.byte	0x14
	.4byte	0x9c
	.2byte	0x11c
	.uleb128 0x4
	.4byte	.LASF80
	.2byte	0x50f
	.byte	0xb
	.4byte	0xa1
	.2byte	0x120
	.byte	0
	.uleb128 0xe
	.4byte	.LASF81
	.2byte	0x511
	.4byte	0x161
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF82
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF83
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF84
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF85
	.uleb128 0x17
	.byte	0x14
	.byte	0x5
	.byte	0x2e
	.byte	0x9
	.4byte	0x52c
	.uleb128 0x18
	.ascii	"Pin\000"
	.byte	0x5
	.byte	0x30
	.byte	0xc
	.4byte	0x90
	.byte	0
	.uleb128 0x8
	.4byte	.LASF86
	.byte	0x33
	.4byte	0x90
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF87
	.byte	0x36
	.4byte	0x90
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF88
	.byte	0x39
	.4byte	0x90
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF89
	.byte	0x3c
	.4byte	0x90
	.byte	0x10
	.byte	0
	.uleb128 0x7
	.4byte	.LASF90
	.byte	0x5
	.byte	0x3e
	.byte	0x3
	.4byte	0x4e9
	.uleb128 0x19
	.byte	0x1
	.4byte	0x34
	.byte	0x5
	.byte	0x44
	.byte	0x1
	.4byte	0x552
	.uleb128 0xf
	.4byte	.LASF91
	.byte	0
	.uleb128 0xf
	.4byte	.LASF92
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.4byte	.LASF93
	.byte	0x5
	.byte	0x47
	.byte	0x3
	.4byte	0x538
	.uleb128 0x10
	.4byte	.LASF94
	.2byte	0x10b
	.4byte	0x574
	.uleb128 0x6
	.4byte	0x574
	.uleb128 0x6
	.4byte	0x84
	.byte	0
	.uleb128 0x11
	.4byte	0x156
	.uleb128 0x10
	.4byte	.LASF95
	.2byte	0x10a
	.4byte	0x594
	.uleb128 0x6
	.4byte	0x574
	.uleb128 0x6
	.4byte	0x84
	.uleb128 0x6
	.4byte	0x552
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF96
	.byte	0x5
	.byte	0xff
	.byte	0x6
	.4byte	0x5ab
	.uleb128 0x6
	.4byte	0x574
	.uleb128 0x6
	.4byte	0x5ab
	.byte	0
	.uleb128 0x11
	.4byte	0x52c
	.uleb128 0xc
	.4byte	.LASF97
	.byte	0x21
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5df
	.uleb128 0x9
	.4byte	.LVL3
	.4byte	0x55e
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0xc
	.4byte	0x58020000
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.2byte	0x2000
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF98
	.byte	0x1d
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x613
	.uleb128 0x9
	.4byte	.LVL2
	.4byte	0x579
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0xc
	.4byte	0x58020000
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.2byte	0x2000
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF99
	.byte	0x18
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x647
	.uleb128 0x9
	.4byte	.LVL1
	.4byte	0x579
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0xc
	.4byte	0x58020000
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.2byte	0x2000
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF105
	.byte	0x1
	.byte	0xc
	.byte	0x6
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF100
	.byte	0xe
	.byte	0x16
	.4byte	0x52c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x683
	.uleb128 0x12
	.4byte	.LASF101
	.byte	0xf
	.byte	0x1c
	.4byte	0x9c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x9
	.4byte	.LVL0
	.4byte	0x594
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0xc
	.4byte	0x58020000
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
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
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
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
	.uleb128 0xd
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x16
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
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
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
	.4byte	.LFB335
	.uleb128 .LFE335-.LFB335
	.byte	0x7
	.4byte	.LFB336
	.uleb128 .LFE336-.LFB336
	.byte	0x7
	.4byte	.LFB337
	.uleb128 .LFE337-.LFB337
	.byte	0x7
	.4byte	.LFB338
	.uleb128 .LFE338-.LFB338
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF19:
	.ascii	"GPIO_TypeDef\000"
.LASF76:
	.ascii	"APB1LLPENR\000"
.LASF31:
	.ascii	"PLL1DIVR\000"
.LASF105:
	.ascii	"BSP_LED2_Init\000"
.LASF77:
	.ascii	"APB1HLPENR\000"
.LASF40:
	.ascii	"D2CCIP2R\000"
.LASF91:
	.ascii	"GPIO_PIN_RESET\000"
.LASF55:
	.ascii	"APB1HRSTR\000"
.LASF104:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF0:
	.ascii	"short int\000"
.LASF57:
	.ascii	"APB4RSTR\000"
.LASF47:
	.ascii	"BDCR\000"
.LASF27:
	.ascii	"D3CFGR\000"
.LASF20:
	.ascii	"HSICFGR\000"
.LASF41:
	.ascii	"D3CCIPR\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF62:
	.ascii	"AHB1ENR\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF73:
	.ascii	"AHB2LPENR\000"
.LASF51:
	.ascii	"AHB2RSTR\000"
.LASF71:
	.ascii	"AHB3LPENR\000"
.LASF23:
	.ascii	"CFGR\000"
.LASF28:
	.ascii	"RESERVED2\000"
.LASF37:
	.ascii	"RESERVED3\000"
.LASF43:
	.ascii	"CIER\000"
.LASF52:
	.ascii	"AHB4RSTR\000"
.LASF94:
	.ascii	"HAL_GPIO_TogglePin\000"
.LASF53:
	.ascii	"APB3RSTR\000"
.LASF14:
	.ascii	"OTYPER\000"
.LASF68:
	.ascii	"APB2ENR\000"
.LASF63:
	.ascii	"AHB2ENR\000"
.LASF84:
	.ascii	"float\000"
.LASF61:
	.ascii	"AHB3ENR\000"
.LASF98:
	.ascii	"BSP_LED2_Off\000"
.LASF29:
	.ascii	"PLLCKSELR\000"
.LASF54:
	.ascii	"APB1LRSTR\000"
.LASF8:
	.ascii	"long long int\000"
.LASF16:
	.ascii	"PUPDR\000"
.LASF87:
	.ascii	"Pull\000"
.LASF4:
	.ascii	"long int\000"
.LASF33:
	.ascii	"PLL2DIVR\000"
.LASF81:
	.ascii	"RCC_TypeDef\000"
.LASF17:
	.ascii	"BSRR\000"
.LASF13:
	.ascii	"MODER\000"
.LASF56:
	.ascii	"APB2RSTR\000"
.LASF22:
	.ascii	"CSICFGR\000"
.LASF65:
	.ascii	"APB3ENR\000"
.LASF101:
	.ascii	"tmpreg\000"
.LASF75:
	.ascii	"APB3LPENR\000"
.LASF82:
	.ascii	"long double\000"
.LASF59:
	.ascii	"D3AMR\000"
.LASF67:
	.ascii	"APB1HENR\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF34:
	.ascii	"PLL2FRACR\000"
.LASF60:
	.ascii	"RESERVED11\000"
.LASF70:
	.ascii	"RESERVED12\000"
.LASF80:
	.ascii	"RESERVED13\000"
.LASF66:
	.ascii	"APB1LENR\000"
.LASF21:
	.ascii	"CRRCR\000"
.LASF1:
	.ascii	"signed char\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF90:
	.ascii	"GPIO_InitTypeDef\000"
.LASF32:
	.ascii	"PLL1FRACR\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF96:
	.ascii	"HAL_GPIO_Init\000"
.LASF95:
	.ascii	"HAL_GPIO_WritePin\000"
.LASF64:
	.ascii	"AHB4ENR\000"
.LASF25:
	.ascii	"D1CFGR\000"
.LASF69:
	.ascii	"APB4ENR\000"
.LASF30:
	.ascii	"PLLCFGR\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF102:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF83:
	.ascii	"char\000"
.LASF11:
	.ascii	"uint16_t\000"
.LASF38:
	.ascii	"D1CCIPR\000"
.LASF74:
	.ascii	"AHB4LPENR\000"
.LASF97:
	.ascii	"BSP_LED2_Toggle\000"
.LASF72:
	.ascii	"AHB1LPENR\000"
.LASF35:
	.ascii	"PLL3DIVR\000"
.LASF24:
	.ascii	"RESERVED1\000"
.LASF103:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/BSP/bsp_led"
	.ascii	"2.c\000"
.LASF15:
	.ascii	"OSPEEDR\000"
.LASF42:
	.ascii	"RESERVED4\000"
.LASF46:
	.ascii	"RESERVED5\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF48:
	.ascii	"RESERVED6\000"
.LASF58:
	.ascii	"RESERVED8\000"
.LASF85:
	.ascii	"double\000"
.LASF99:
	.ascii	"BSP_LED2_On\000"
.LASF44:
	.ascii	"CIFR\000"
.LASF39:
	.ascii	"D2CCIP1R\000"
.LASF45:
	.ascii	"CICR\000"
.LASF100:
	.ascii	"GPIO_InitStructure\000"
.LASF88:
	.ascii	"Speed\000"
.LASF86:
	.ascii	"Mode\000"
.LASF50:
	.ascii	"AHB1RSTR\000"
.LASF49:
	.ascii	"AHB3RSTR\000"
.LASF92:
	.ascii	"GPIO_PIN_SET\000"
.LASF26:
	.ascii	"D2CFGR\000"
.LASF89:
	.ascii	"Alternate\000"
.LASF93:
	.ascii	"GPIO_PinState\000"
.LASF79:
	.ascii	"APB4LPENR\000"
.LASF18:
	.ascii	"LCKR\000"
.LASF78:
	.ascii	"APB2LPENR\000"
.LASF36:
	.ascii	"PLL3FRACR\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
