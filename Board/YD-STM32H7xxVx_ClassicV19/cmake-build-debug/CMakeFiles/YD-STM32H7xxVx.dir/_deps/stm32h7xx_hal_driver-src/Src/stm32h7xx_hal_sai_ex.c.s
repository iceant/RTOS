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
	.file	"stm32h7xx_hal_sai_ex.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_sai_ex.c"
	.section	.text.HAL_SAIEx_ConfigPdmMicDelay,"ax",%progbits
	.align	1
	.global	HAL_SAIEx_ConfigPdmMicDelay
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SAIEx_ConfigPdmMicDelay, %function
HAL_SAIEx_ConfigPdmMicDelay:
.LFB335:
	.loc 1 72 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	push	{r4, r5}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
	.loc 1 73 3
.LVL1:
	.loc 1 74 3
	.loc 1 75 3
	.loc 1 79 3
	.loc 1 79 26 is_stmt 0
	ldr	r3, [r0]
	.loc 1 79 186
	ldr	r2, .L10
	cmp	r3, r2
	beq	.L4
	.loc 1 80 186
	add	r2, r2, #402653184
	sub	r2, r2, #66560
	cmp	r3, r2
	beq	.L9
	.loc 1 89 12
	movs	r0, #1
.LVL2:
.L3:
	.loc 1 115 3 is_stmt 1
	.loc 1 116 1 is_stmt 0
	pop	{r4, r5}
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL3:
.L9:
	.cfi_restore_state
	.loc 1 80 186
	ldr	r4, .L10+4
	b	.L2
.L4:
	.loc 1 79 186
	ldr	r4, .L10+8
.L2:
	.loc 1 94 5 is_stmt 1
	.loc 1 95 5
	.loc 1 96 5
	.loc 1 99 5
	.loc 1 99 31 is_stmt 0
	ldr	r3, [r1]
	.loc 1 99 41
	subs	r3, r3, #1
	.loc 1 99 12
	lsls	r3, r3, #3
.LVL4:
	.loc 1 102 5 is_stmt 1
	.loc 1 102 14 is_stmt 0
	ldrb	r2, [r0, #145]	@ zero_extendqisi2
	.loc 1 102 8
	cbz	r2, .L6
	.loc 1 102 46 discriminator 1
	cmp	r3, #24
	bhi	.L7
	.loc 1 105 7 is_stmt 1
	.loc 1 105 21 is_stmt 0
	ldr	r2, [r4, #72]
	.loc 1 105 41
	movs	r0, #119
.LVL5:
	lsls	r0, r0, r3
	.loc 1 105 30
	bic	r2, r2, r0
	str	r2, [r4, #72]
	.loc 1 108 7 is_stmt 1
	.loc 1 108 21 is_stmt 0
	ldr	r0, [r4, #72]
	.loc 1 108 47
	ldr	r5, [r1, #8]
	.loc 1 108 80
	ldr	r2, [r1, #4]
	.loc 1 108 67
	orr	r2, r2, r5, lsl #4
	.loc 1 108 93
	lsl	r3, r2, r3
.LVL6:
	.loc 1 108 30
	orrs	r3, r3, r0
	str	r3, [r4, #72]
	.loc 1 73 21
	movs	r0, #0
	.loc 1 108 30
	b	.L3
.LVL7:
.L6:
	.loc 1 112 14
	movs	r0, #1
.LVL8:
	b	.L3
.LVL9:
.L7:
	movs	r0, #1
.LVL10:
	b	.L3
.L11:
	.align	2
.L10:
	.word	1073829892
	.word	1476416512
	.word	1073829888
	.cfi_endproc
.LFE335:
	.size	HAL_SAIEx_ConfigPdmMicDelay, .-HAL_SAIEx_ConfigPdmMicDelay
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h7xx.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dma.h"
	.file 8 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_sai.h"
	.file 9 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_sai_ex.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x8bd
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x12
	.4byte	.LASF145
	.byte	0x1d
	.4byte	.LASF146
	.4byte	.LASF147
	.4byte	.LLRL3
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.4byte	.LASF0
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x40
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x2
	.byte	0x39
	.byte	0x1c
	.4byte	0x53
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x6d
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x13
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x34
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x3
	.byte	0x24
	.byte	0x14
	.4byte	0x47
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x61
	.uleb128 0xc
	.4byte	0xa8
	.uleb128 0x8
	.byte	0x4
	.2byte	0x250
	.4byte	0xce
	.uleb128 0x6
	.ascii	"CCR\000"
	.2byte	0x252
	.4byte	0xb4
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	.LASF15
	.2byte	0x253
	.byte	0x2
	.4byte	0xb9
	.uleb128 0x8
	.byte	0x8
	.2byte	0x255
	.4byte	0xfb
	.uleb128 0x6
	.ascii	"CSR\000"
	.2byte	0x257
	.4byte	0xb4
	.byte	0
	.uleb128 0x6
	.ascii	"CFR\000"
	.2byte	0x258
	.4byte	0xb4
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.4byte	.LASF16
	.2byte	0x259
	.byte	0x2
	.4byte	0xda
	.uleb128 0x8
	.byte	0x4
	.2byte	0x25b
	.4byte	0x11d
	.uleb128 0x7
	.4byte	.LASF17
	.2byte	0x25d
	.byte	0x15
	.4byte	0xb4
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	.LASF18
	.2byte	0x25e
	.byte	0x2
	.4byte	0x107
	.uleb128 0x8
	.byte	0x8
	.2byte	0x260
	.4byte	0x14c
	.uleb128 0x7
	.4byte	.LASF19
	.2byte	0x262
	.byte	0x15
	.4byte	0xb4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF20
	.2byte	0x263
	.byte	0x15
	.4byte	0xb4
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.4byte	.LASF21
	.2byte	0x264
	.byte	0x2
	.4byte	0x129
	.uleb128 0x8
	.byte	0x4c
	.2byte	0x553
	.4byte	0x194
	.uleb128 0x6
	.ascii	"GCR\000"
	.2byte	0x555
	.4byte	0xb4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF22
	.2byte	0x556
	.byte	0xc
	.4byte	0x194
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF23
	.2byte	0x557
	.byte	0x15
	.4byte	0xb4
	.byte	0x44
	.uleb128 0x7
	.4byte	.LASF24
	.2byte	0x558
	.byte	0x15
	.4byte	0xb4
	.byte	0x48
	.byte	0
	.uleb128 0x14
	.4byte	0xa8
	.4byte	0x1a4
	.uleb128 0x15
	.4byte	0x89
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.4byte	.LASF25
	.2byte	0x559
	.byte	0x3
	.4byte	0x158
	.uleb128 0x8
	.byte	0x20
	.2byte	0x55b
	.4byte	0x21a
	.uleb128 0x6
	.ascii	"CR1\000"
	.2byte	0x55d
	.4byte	0xb4
	.byte	0
	.uleb128 0x6
	.ascii	"CR2\000"
	.2byte	0x55e
	.4byte	0xb4
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF26
	.2byte	0x55f
	.byte	0x15
	.4byte	0xb4
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF27
	.2byte	0x560
	.byte	0x15
	.4byte	0xb4
	.byte	0xc
	.uleb128 0x6
	.ascii	"IMR\000"
	.2byte	0x561
	.4byte	0xb4
	.byte	0x10
	.uleb128 0x6
	.ascii	"SR\000"
	.2byte	0x562
	.4byte	0xb4
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF28
	.2byte	0x563
	.byte	0x15
	.4byte	0xb4
	.byte	0x18
	.uleb128 0x6
	.ascii	"DR\000"
	.2byte	0x564
	.4byte	0xb4
	.byte	0x1c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF29
	.2byte	0x565
	.byte	0x3
	.4byte	0x1b0
	.uleb128 0xb
	.4byte	0x40
	.byte	0x5
	.byte	0xbb
	.4byte	0x23e
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.4byte	.LASF32
	.byte	0x5
	.byte	0xbe
	.byte	0x3
	.4byte	0x226
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.4byte	.LASF33
	.uleb128 0x16
	.byte	0x4
	.uleb128 0x4
	.4byte	0x258
	.uleb128 0x17
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF34
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.4byte	.LASF35
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.4byte	.LASF36
	.uleb128 0xb
	.4byte	0x40
	.byte	0x6
	.byte	0x28
	.4byte	0x292
	.uleb128 0x3
	.4byte	.LASF37
	.byte	0
	.uleb128 0x3
	.4byte	.LASF38
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF39
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF40
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.4byte	.LASF41
	.byte	0x6
	.byte	0x2d
	.byte	0x3
	.4byte	0x26e
	.uleb128 0xb
	.4byte	0x40
	.byte	0x6
	.byte	0x33
	.4byte	0x2b6
	.uleb128 0x3
	.4byte	.LASF42
	.byte	0
	.uleb128 0x3
	.4byte	.LASF43
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x6
	.byte	0x36
	.byte	0x3
	.4byte	0x29e
	.uleb128 0xa
	.byte	0x30
	.byte	0x7
	.byte	0x30
	.4byte	0x367
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x7
	.byte	0x32
	.byte	0xc
	.4byte	0xa8
	.byte	0
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x7
	.byte	0x35
	.byte	0xc
	.4byte	0xa8
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x7
	.byte	0x39
	.byte	0xc
	.4byte	0xa8
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0x7
	.byte	0x3c
	.byte	0xc
	.4byte	0xa8
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x7
	.byte	0x3f
	.byte	0xc
	.4byte	0xa8
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0x7
	.byte	0x42
	.byte	0xc
	.4byte	0xa8
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0x7
	.byte	0x45
	.byte	0xc
	.4byte	0xa8
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0x7
	.byte	0x4a
	.byte	0xc
	.4byte	0xa8
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x7
	.byte	0x4d
	.byte	0xc
	.4byte	0xa8
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x7
	.byte	0x52
	.byte	0xc
	.4byte	0xa8
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0x7
	.byte	0x55
	.byte	0xc
	.4byte	0xa8
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF56
	.byte	0x7
	.byte	0x5b
	.byte	0xc
	.4byte	0xa8
	.byte	0x2c
	.byte	0
	.uleb128 0x2
	.4byte	.LASF57
	.byte	0x7
	.byte	0x60
	.byte	0x2
	.4byte	0x2c2
	.uleb128 0xb
	.4byte	0x40
	.byte	0x7
	.byte	0x66
	.4byte	0x39d
	.uleb128 0x3
	.4byte	.LASF58
	.byte	0
	.uleb128 0x3
	.4byte	.LASF59
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF61
	.byte	0x3
	.uleb128 0x3
	.4byte	.LASF62
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.4byte	.LASF63
	.byte	0x7
	.byte	0x6c
	.byte	0x2
	.4byte	0x373
	.uleb128 0xc
	.4byte	0x39d
	.uleb128 0xd
	.4byte	.LASF125
	.byte	0x78
	.byte	0x7
	.byte	0x88
	.4byte	0x4bf
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x7
	.byte	0x8a
	.byte	0x9
	.4byte	0x251
	.byte	0
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0x7
	.byte	0x8c
	.byte	0x13
	.4byte	0x367
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x7
	.byte	0x8e
	.byte	0x13
	.4byte	0x2b6
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x7
	.byte	0x90
	.byte	0x21
	.4byte	0x3a9
	.byte	0x35
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x7
	.byte	0x92
	.byte	0x9
	.4byte	0x251
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x7
	.byte	0x94
	.byte	0xb
	.4byte	0x4cf
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF70
	.byte	0x7
	.byte	0x96
	.byte	0xb
	.4byte	0x4cf
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF71
	.byte	0x7
	.byte	0x98
	.byte	0xb
	.4byte	0x4cf
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0x7
	.byte	0x9a
	.byte	0xb
	.4byte	0x4cf
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x7
	.byte	0x9c
	.byte	0xb
	.4byte	0x4cf
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x7
	.byte	0x9e
	.byte	0xb
	.4byte	0x4cf
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF75
	.byte	0x7
	.byte	0xa0
	.byte	0x14
	.4byte	0xb4
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0x7
	.byte	0xa2
	.byte	0xb
	.4byte	0xa8
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF77
	.byte	0x7
	.byte	0xa4
	.byte	0xb
	.4byte	0xa8
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0x7
	.byte	0xa6
	.byte	0x1a
	.4byte	0x4d4
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x7
	.byte	0xa8
	.byte	0x20
	.4byte	0x4d9
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF80
	.byte	0x7
	.byte	0xaa
	.byte	0xb
	.4byte	0xa8
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF81
	.byte	0x7
	.byte	0xad
	.byte	0x1d
	.4byte	0x4de
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF82
	.byte	0x7
	.byte	0xaf
	.byte	0x23
	.4byte	0x4e3
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0x7
	.byte	0xb1
	.byte	0xb
	.4byte	0xa8
	.byte	0x74
	.byte	0
	.uleb128 0xe
	.4byte	0x4ca
	.uleb128 0xf
	.4byte	0x4ca
	.byte	0
	.uleb128 0x4
	.4byte	0x3ae
	.uleb128 0x4
	.4byte	0x4bf
	.uleb128 0x4
	.4byte	0xce
	.uleb128 0x4
	.4byte	0xfb
	.uleb128 0x4
	.4byte	0x11d
	.uleb128 0x4
	.4byte	0x14c
	.uleb128 0x2
	.4byte	.LASF84
	.byte	0x7
	.byte	0xb3
	.byte	0x2
	.4byte	0x3ae
	.uleb128 0x4
	.4byte	0x4e8
	.uleb128 0x4
	.4byte	0x90
	.uleb128 0xb
	.4byte	0x40
	.byte	0x8
	.byte	0x2f
	.4byte	0x528
	.uleb128 0x3
	.4byte	.LASF85
	.byte	0
	.uleb128 0x3
	.4byte	.LASF86
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF87
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF88
	.byte	0x12
	.uleb128 0x3
	.4byte	.LASF89
	.byte	0x22
	.byte	0
	.uleb128 0x2
	.4byte	.LASF90
	.byte	0x8
	.byte	0x35
	.byte	0x3
	.4byte	0x4fe
	.uleb128 0xc
	.4byte	0x528
	.uleb128 0x2
	.4byte	.LASF91
	.byte	0x8
	.byte	0x3a
	.byte	0x10
	.4byte	0x253
	.uleb128 0xa
	.byte	0xc
	.byte	0x8
	.byte	0x40
	.4byte	0x575
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x8
	.byte	0x42
	.byte	0x13
	.4byte	0x23e
	.byte	0
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0x8
	.byte	0x43
	.byte	0xc
	.4byte	0xa8
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF94
	.byte	0x8
	.byte	0x45
	.byte	0xc
	.4byte	0xa8
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.4byte	.LASF95
	.byte	0x8
	.byte	0x47
	.byte	0x3
	.4byte	0x545
	.uleb128 0xa
	.byte	0x50
	.byte	0x8
	.byte	0x50
	.4byte	0x674
	.uleb128 0x1
	.4byte	.LASF96
	.byte	0x8
	.byte	0x52
	.byte	0xc
	.4byte	0xa8
	.byte	0
	.uleb128 0x1
	.4byte	.LASF97
	.byte	0x8
	.byte	0x55
	.byte	0xc
	.4byte	0xa8
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF98
	.byte	0x8
	.byte	0x58
	.byte	0xc
	.4byte	0xa8
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF99
	.byte	0x8
	.byte	0x5e
	.byte	0xc
	.4byte	0xa8
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF100
	.byte	0x8
	.byte	0x62
	.byte	0xc
	.4byte	0xa8
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF101
	.byte	0x8
	.byte	0x67
	.byte	0xc
	.4byte	0xa8
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x8
	.byte	0x6f
	.byte	0xc
	.4byte	0xa8
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF102
	.byte	0x8
	.byte	0x72
	.byte	0xc
	.4byte	0xa8
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF103
	.byte	0x8
	.byte	0x75
	.byte	0xc
	.4byte	0xa8
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF104
	.byte	0x8
	.byte	0x7a
	.byte	0xc
	.4byte	0xa8
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF105
	.byte	0x8
	.byte	0x7d
	.byte	0xc
	.4byte	0xa8
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF106
	.byte	0x8
	.byte	0x80
	.byte	0xc
	.4byte	0xa8
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF107
	.byte	0x8
	.byte	0x83
	.byte	0xc
	.4byte	0xa8
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF108
	.byte	0x8
	.byte	0x86
	.byte	0x16
	.4byte	0x575
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF109
	.byte	0x8
	.byte	0x8b
	.byte	0xc
	.4byte	0xa8
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF110
	.byte	0x8
	.byte	0x8e
	.byte	0xc
	.4byte	0xa8
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF111
	.byte	0x8
	.byte	0x91
	.byte	0xc
	.4byte	0xa8
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF112
	.byte	0x8
	.byte	0x94
	.byte	0xc
	.4byte	0xa8
	.byte	0x4c
	.byte	0
	.uleb128 0x2
	.4byte	.LASF113
	.byte	0x8
	.byte	0x96
	.byte	0x3
	.4byte	0x581
	.uleb128 0xa
	.byte	0x14
	.byte	0x8
	.byte	0xa0
	.4byte	0x6ca
	.uleb128 0x1
	.4byte	.LASF114
	.byte	0x8
	.byte	0xa3
	.byte	0xc
	.4byte	0xa8
	.byte	0
	.uleb128 0x1
	.4byte	.LASF115
	.byte	0x8
	.byte	0xa9
	.byte	0xc
	.4byte	0xa8
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF116
	.byte	0x8
	.byte	0xae
	.byte	0xc
	.4byte	0xa8
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF117
	.byte	0x8
	.byte	0xb1
	.byte	0xc
	.4byte	0xa8
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF118
	.byte	0x8
	.byte	0xb4
	.byte	0xc
	.4byte	0xa8
	.byte	0x10
	.byte	0
	.uleb128 0x2
	.4byte	.LASF119
	.byte	0x8
	.byte	0xb7
	.byte	0x3
	.4byte	0x680
	.uleb128 0xa
	.byte	0x10
	.byte	0x8
	.byte	0xc2
	.4byte	0x713
	.uleb128 0x1
	.4byte	.LASF120
	.byte	0x8
	.byte	0xc4
	.byte	0xc
	.4byte	0xa8
	.byte	0
	.uleb128 0x1
	.4byte	.LASF121
	.byte	0x8
	.byte	0xc7
	.byte	0xc
	.4byte	0xa8
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF122
	.byte	0x8
	.byte	0xca
	.byte	0xc
	.4byte	0xa8
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF123
	.byte	0x8
	.byte	0xcd
	.byte	0xc
	.4byte	0xa8
	.byte	0xc
	.byte	0
	.uleb128 0x2
	.4byte	.LASF124
	.byte	0x8
	.byte	0xcf
	.byte	0x3
	.4byte	0x6d6
	.uleb128 0xd
	.4byte	.LASF126
	.byte	0x98
	.byte	0x8
	.byte	0xd8
	.4byte	0x7e2
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x8
	.byte	0xda
	.byte	0x16
	.4byte	0x7e2
	.byte	0
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0x8
	.byte	0xdc
	.byte	0x13
	.4byte	0x674
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF127
	.byte	0x8
	.byte	0xde
	.byte	0x18
	.4byte	0x6ca
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF128
	.byte	0x8
	.byte	0xe0
	.byte	0x17
	.4byte	0x713
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF129
	.byte	0x8
	.byte	0xe2
	.byte	0xc
	.4byte	0x4f9
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF130
	.byte	0x8
	.byte	0xe4
	.byte	0xc
	.4byte	0x9c
	.byte	0x7c
	.uleb128 0x1
	.4byte	.LASF131
	.byte	0x8
	.byte	0xe6
	.byte	0xc
	.4byte	0x9c
	.byte	0x7e
	.uleb128 0x1
	.4byte	.LASF132
	.byte	0x8
	.byte	0xe8
	.byte	0x16
	.4byte	0x4f4
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF133
	.byte	0x8
	.byte	0xea
	.byte	0x16
	.4byte	0x4f4
	.byte	0x84
	.uleb128 0x1
	.4byte	.LASF134
	.byte	0x8
	.byte	0xec
	.byte	0xf
	.4byte	0x539
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF135
	.byte	0x8
	.byte	0xee
	.byte	0xa
	.4byte	0x7f7
	.byte	0x8c
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x8
	.byte	0xf0
	.byte	0x13
	.4byte	0x2b6
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x8
	.byte	0xf2
	.byte	0x21
	.4byte	0x534
	.byte	0x91
	.uleb128 0x1
	.4byte	.LASF75
	.byte	0x8
	.byte	0xf4
	.byte	0x15
	.4byte	0xb4
	.byte	0x94
	.byte	0
	.uleb128 0x4
	.4byte	0x21a
	.uleb128 0xe
	.4byte	0x7f2
	.uleb128 0xf
	.4byte	0x7f2
	.byte	0
	.uleb128 0x4
	.4byte	0x71f
	.uleb128 0x4
	.4byte	0x7e7
	.uleb128 0x2
	.4byte	.LASF136
	.byte	0x8
	.byte	0xff
	.byte	0x3
	.4byte	0x71f
	.uleb128 0x10
	.4byte	0x7fc
	.uleb128 0xa
	.byte	0xc
	.byte	0x9
	.byte	0x2e
	.4byte	0x83d
	.uleb128 0x1
	.4byte	.LASF137
	.byte	0x9
	.byte	0x30
	.byte	0xc
	.4byte	0xa8
	.byte	0
	.uleb128 0x1
	.4byte	.LASF138
	.byte	0x9
	.byte	0x33
	.byte	0xc
	.4byte	0xa8
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF139
	.byte	0x9
	.byte	0x36
	.byte	0xc
	.4byte	0xa8
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.4byte	.LASF140
	.byte	0x9
	.byte	0x38
	.byte	0x3
	.4byte	0x80d
	.uleb128 0x10
	.4byte	0x83d
	.uleb128 0x18
	.4byte	.LASF148
	.byte	0x1
	.byte	0x46
	.byte	0x13
	.4byte	0x292
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8b1
	.uleb128 0x19
	.4byte	.LASF141
	.byte	0x1
	.byte	0x46
	.byte	0x48
	.4byte	0x8b1
	.4byte	.LLST0
	.uleb128 0x1a
	.4byte	.LASF142
	.byte	0x1
	.byte	0x47
	.byte	0x54
	.4byte	0x8b6
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x11
	.4byte	.LASF143
	.byte	0x49
	.byte	0x15
	.4byte	0x292
	.4byte	.LLST1
	.uleb128 0x11
	.4byte	.LASF144
	.byte	0x4a
	.byte	0xc
	.4byte	0xa8
	.4byte	.LLST2
	.uleb128 0x1b
	.4byte	.LASF149
	.byte	0x1
	.byte	0x4b
	.byte	0x10
	.4byte	0x8bb
	.byte	0
	.uleb128 0x4
	.4byte	0x808
	.uleb128 0x4
	.4byte	0x849
	.uleb128 0x4
	.4byte	0x1a4
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x21
	.sleb128 21
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LVL7-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LVL8-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL8-.LVL0
	.uleb128 .LVL9-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL9-.LVL0
	.uleb128 .LVL10-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL10-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL2-.LVL1
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL2-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-.LVL1
	.uleb128 .LFE335-.LVL1
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL6-.LVL4
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL7-.LVL4
	.uleb128 .LFE335-.LVL4
	.uleb128 0x1
	.byte	0x53
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
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
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
.LLRL3:
	.byte	0x7
	.4byte	.LFB335
	.uleb128 .LFE335-.LFB335
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF25:
	.ascii	"SAI_TypeDef\000"
.LASF106:
	.ascii	"CompandingMode\000"
.LASF88:
	.ascii	"HAL_SAI_STATE_BUSY_TX\000"
.LASF83:
	.ascii	"DMAmuxRequestGenStatusMask\000"
.LASF65:
	.ascii	"Init\000"
.LASF57:
	.ascii	"DMA_InitTypeDef\000"
.LASF138:
	.ascii	"LeftDelay\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF79:
	.ascii	"DMAmuxChannelStatus\000"
.LASF39:
	.ascii	"HAL_BUSY\000"
.LASF86:
	.ascii	"HAL_SAI_STATE_READY\000"
.LASF30:
	.ascii	"DISABLE\000"
.LASF135:
	.ascii	"InterruptServiceRoutine\000"
.LASF142:
	.ascii	"pdmMicDelay\000"
.LASF124:
	.ascii	"SAI_SlotInitTypeDef\000"
.LASF109:
	.ascii	"Protocol\000"
.LASF131:
	.ascii	"XferCount\000"
.LASF71:
	.ascii	"XferM1CpltCallback\000"
.LASF9:
	.ascii	"long long int\000"
.LASF1:
	.ascii	"signed char\000"
.LASF103:
	.ascii	"Mckdiv\000"
.LASF70:
	.ascii	"XferHalfCpltCallback\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF119:
	.ascii	"SAI_FrameInitTypeDef\000"
.LASF27:
	.ascii	"SLOTR\000"
.LASF44:
	.ascii	"HAL_LockTypeDef\000"
.LASF126:
	.ascii	"__SAI_HandleTypeDef\000"
.LASF16:
	.ascii	"DMAMUX_ChannelStatus_TypeDef\000"
.LASF6:
	.ascii	"long int\000"
.LASF136:
	.ascii	"SAI_HandleTypeDef\000"
.LASF47:
	.ascii	"PeriphInc\000"
.LASF141:
	.ascii	"hsai\000"
.LASF55:
	.ascii	"MemBurst\000"
.LASF31:
	.ascii	"ENABLE\000"
.LASF101:
	.ascii	"NoDivider\000"
.LASF120:
	.ascii	"FirstBitOffset\000"
.LASF36:
	.ascii	"double\000"
.LASF76:
	.ascii	"StreamBaseAddress\000"
.LASF68:
	.ascii	"Parent\000"
.LASF107:
	.ascii	"TriState\000"
.LASF66:
	.ascii	"Lock\000"
.LASF140:
	.ascii	"SAIEx_PdmMicDelayParamTypeDef\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF105:
	.ascii	"MonoStereoMode\000"
.LASF51:
	.ascii	"Mode\000"
.LASF46:
	.ascii	"Direction\000"
.LASF23:
	.ascii	"PDMCR\000"
.LASF81:
	.ascii	"DMAmuxRequestGen\000"
.LASF133:
	.ascii	"hdmarx\000"
.LASF91:
	.ascii	"SAIcallback\000"
.LASF40:
	.ascii	"HAL_TIMEOUT\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF58:
	.ascii	"HAL_DMA_STATE_RESET\000"
.LASF13:
	.ascii	"uint16_t\000"
.LASF149:
	.ascii	"SaiBaseAddress\000"
.LASF118:
	.ascii	"FSOffset\000"
.LASF78:
	.ascii	"DMAmuxChannel\000"
.LASF100:
	.ascii	"OutputDrive\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF77:
	.ascii	"StreamIndex\000"
.LASF37:
	.ascii	"HAL_OK\000"
.LASF96:
	.ascii	"AudioMode\000"
.LASF122:
	.ascii	"SlotNumber\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF145:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF62:
	.ascii	"HAL_DMA_STATE_ABORT\000"
.LASF75:
	.ascii	"ErrorCode\000"
.LASF50:
	.ascii	"MemDataAlignment\000"
.LASF20:
	.ascii	"RGCFR\000"
.LASF146:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_sai_ex.c\000"
.LASF41:
	.ascii	"HAL_StatusTypeDef\000"
.LASF0:
	.ascii	"short int\000"
.LASF18:
	.ascii	"DMAMUX_RequestGen_TypeDef\000"
.LASF123:
	.ascii	"SlotActive\000"
.LASF148:
	.ascii	"HAL_SAIEx_ConfigPdmMicDelay\000"
.LASF59:
	.ascii	"HAL_DMA_STATE_READY\000"
.LASF117:
	.ascii	"FSPolarity\000"
.LASF128:
	.ascii	"SlotInit\000"
.LASF43:
	.ascii	"HAL_LOCKED\000"
.LASF24:
	.ascii	"PDMDLY\000"
.LASF121:
	.ascii	"SlotSize\000"
.LASF116:
	.ascii	"FSDefinition\000"
.LASF84:
	.ascii	"DMA_HandleTypeDef\000"
.LASF90:
	.ascii	"HAL_SAI_StateTypeDef\000"
.LASF73:
	.ascii	"XferErrorCallback\000"
.LASF32:
	.ascii	"FunctionalState\000"
.LASF132:
	.ascii	"hdmatx\000"
.LASF111:
	.ascii	"FirstBit\000"
.LASF134:
	.ascii	"mutecallback\000"
.LASF17:
	.ascii	"RGCR\000"
.LASF139:
	.ascii	"RightDelay\000"
.LASF35:
	.ascii	"float\000"
.LASF99:
	.ascii	"MckOutput\000"
.LASF87:
	.ascii	"HAL_SAI_STATE_BUSY\000"
.LASF92:
	.ascii	"Activation\000"
.LASF22:
	.ascii	"RESERVED0\000"
.LASF64:
	.ascii	"Instance\000"
.LASF72:
	.ascii	"XferM1HalfCpltCallback\000"
.LASF113:
	.ascii	"SAI_InitTypeDef\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF61:
	.ascii	"HAL_DMA_STATE_ERROR\000"
.LASF129:
	.ascii	"pBuffPtr\000"
.LASF137:
	.ascii	"MicPair\000"
.LASF112:
	.ascii	"ClockStrobing\000"
.LASF104:
	.ascii	"MckOverSampling\000"
.LASF63:
	.ascii	"HAL_DMA_StateTypeDef\000"
.LASF82:
	.ascii	"DMAmuxRequestGenStatus\000"
.LASF60:
	.ascii	"HAL_DMA_STATE_BUSY\000"
.LASF102:
	.ascii	"AudioFrequency\000"
.LASF114:
	.ascii	"FrameLength\000"
.LASF29:
	.ascii	"SAI_Block_TypeDef\000"
.LASF48:
	.ascii	"MemInc\000"
.LASF19:
	.ascii	"RGSR\000"
.LASF94:
	.ascii	"ClockEnable\000"
.LASF108:
	.ascii	"PdmInit\000"
.LASF28:
	.ascii	"CLRFR\000"
.LASF125:
	.ascii	"__DMA_HandleTypeDef\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF53:
	.ascii	"FIFOMode\000"
.LASF38:
	.ascii	"HAL_ERROR\000"
.LASF89:
	.ascii	"HAL_SAI_STATE_BUSY_RX\000"
.LASF34:
	.ascii	"char\000"
.LASF33:
	.ascii	"long double\000"
.LASF54:
	.ascii	"FIFOThreshold\000"
.LASF144:
	.ascii	"offset\000"
.LASF45:
	.ascii	"Request\000"
.LASF95:
	.ascii	"SAI_PdmInitTypeDef\000"
.LASF67:
	.ascii	"State\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF110:
	.ascii	"DataSize\000"
.LASF115:
	.ascii	"ActiveFrameLength\000"
.LASF93:
	.ascii	"MicPairsNbr\000"
.LASF49:
	.ascii	"PeriphDataAlignment\000"
.LASF80:
	.ascii	"DMAmuxChannelStatusMask\000"
.LASF130:
	.ascii	"XferSize\000"
.LASF15:
	.ascii	"DMAMUX_Channel_TypeDef\000"
.LASF143:
	.ascii	"status\000"
.LASF52:
	.ascii	"Priority\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF26:
	.ascii	"FRCR\000"
.LASF147:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF98:
	.ascii	"SynchroExt\000"
.LASF85:
	.ascii	"HAL_SAI_STATE_RESET\000"
.LASF97:
	.ascii	"Synchro\000"
.LASF42:
	.ascii	"HAL_UNLOCKED\000"
.LASF74:
	.ascii	"XferAbortCallback\000"
.LASF21:
	.ascii	"DMAMUX_RequestGenStatus_TypeDef\000"
.LASF69:
	.ascii	"XferCpltCallback\000"
.LASF56:
	.ascii	"PeriphBurst\000"
.LASF127:
	.ascii	"FrameInit\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
