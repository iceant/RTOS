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
	.file	"stm32h7xx_hal_crc_ex.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_crc_ex.c"
	.section	.text.HAL_CRCEx_Polynomial_Set,"ax",%progbits
	.align	1
	.global	HAL_CRCEx_Polynomial_Set
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_CRCEx_Polynomial_Set, %function
HAL_CRCEx_Polynomial_Set:
.LFB335:
	.loc 1 90 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 91 3
	.loc 1 92 3
	.loc 1 95 3
	.loc 1 98 3
	.loc 1 98 6 is_stmt 0
	tst	r1, #1
	beq	.L10
	.loc 1 90 1
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 92 12
	movs	r3, #31
.LVL1:
.L4:
	.loc 1 113 5 is_stmt 1 discriminator 2
	.loc 1 111 25 discriminator 2
	mov	r4, r3
	.loc 1 111 16 is_stmt 0 discriminator 2
	subs	r3, r3, #1
.LVL2:
	.loc 1 111 25 discriminator 2
	cbz	r4, .L3
	.loc 1 111 62 discriminator 1
	and	ip, r3, #31
	.loc 1 111 73 discriminator 1
	lsr	ip, r1, ip
	.loc 1 111 25 discriminator 1
	tst	ip, #1
	beq	.L4
.L3:
	.loc 1 115 5 is_stmt 1
	cmp	r2, #24
	bhi	.L11
	tbb	[pc, r2]
.L6:
	.byte	(.L9-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L8-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L7-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L11-.L6)/2
	.byte	(.L5-.L6)/2
	.p2align 1
.L5:
	.loc 1 119 9
	.loc 1 119 12 is_stmt 0
	cmp	r3, #6
	bhi	.L12
.L9:
.LVL3:
	.loc 1 148 5 is_stmt 1
	.loc 1 148 11 is_stmt 0
	ldr	r3, [r0]
.LVL4:
	.loc 1 148 28
	str	r1, [r3, #20]
	.loc 1 151 5 is_stmt 1
	.loc 1 151 41 is_stmt 0
	ldr	r1, [r0]
.LVL5:
	.loc 1 151 51
	ldr	r3, [r1, #8]
.LVL6:
	.loc 1 151 59
	bic	r3, r3, #24
	.loc 1 151 83
	orrs	r3, r3, r2
	.loc 1 151 29
	str	r3, [r1, #8]
	movs	r0, #0
.LVL7:
	b	.L2
.LVL8:
.L7:
	.loc 1 125 9 is_stmt 1
	.loc 1 125 12 is_stmt 0
	cmp	r3, #7
	bls	.L9
	.loc 1 127 18
	movs	r0, #1
.LVL9:
	b	.L2
.LVL10:
.L8:
	.loc 1 131 9 is_stmt 1
	.loc 1 131 12 is_stmt 0
	cmp	r3, #15
	bls	.L9
	.loc 1 133 18
	movs	r0, #1
.LVL11:
	b	.L2
.LVL12:
.L10:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.loc 1 100 12
	movs	r0, #1
.LVL13:
	.loc 1 154 3 is_stmt 1
	.loc 1 155 1 is_stmt 0
	bx	lr
.LVL14:
.L11:
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 115 5
	movs	r0, #1
.LVL15:
.L2:
	.loc 1 154 3 is_stmt 1
	.loc 1 155 1 is_stmt 0
	ldr	r4, [sp], #4
	.cfi_remember_state
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL16:
.L12:
	.cfi_restore_state
	.loc 1 121 18
	movs	r0, #1
.LVL17:
	b	.L2
	.cfi_endproc
.LFE335:
	.size	HAL_CRCEx_Polynomial_Set, .-HAL_CRCEx_Polynomial_Set
	.section	.text.HAL_CRCEx_Input_Data_Reverse,"ax",%progbits
	.align	1
	.global	HAL_CRCEx_Input_Data_Reverse
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_CRCEx_Input_Data_Reverse, %function
HAL_CRCEx_Input_Data_Reverse:
.LFB336:
	.loc 1 169 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL18:
	.loc 1 171 3
	.loc 1 174 3
	.loc 1 174 15 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #29]
	.loc 1 177 3 is_stmt 1
	.loc 1 177 39 is_stmt 0
	ldr	r2, [r0]
	.loc 1 177 49
	ldr	r3, [r2, #8]
	.loc 1 177 57
	bic	r3, r3, #96
	.loc 1 177 81
	orrs	r3, r3, r1
	.loc 1 177 27
	str	r3, [r2, #8]
	.loc 1 179 3 is_stmt 1
	.loc 1 179 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r0, #29]
	.loc 1 182 3 is_stmt 1
	.loc 1 183 1 is_stmt 0
	movs	r0, #0
.LVL19:
	bx	lr
	.cfi_endproc
.LFE336:
	.size	HAL_CRCEx_Input_Data_Reverse, .-HAL_CRCEx_Input_Data_Reverse
	.section	.text.HAL_CRCEx_Output_Data_Reverse,"ax",%progbits
	.align	1
	.global	HAL_CRCEx_Output_Data_Reverse
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_CRCEx_Output_Data_Reverse, %function
HAL_CRCEx_Output_Data_Reverse:
.LFB337:
	.loc 1 195 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL20:
	.loc 1 197 3
	.loc 1 200 3
	.loc 1 200 15 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #29]
	.loc 1 203 3 is_stmt 1
	.loc 1 203 39 is_stmt 0
	ldr	r2, [r0]
	.loc 1 203 49
	ldr	r3, [r2, #8]
	.loc 1 203 57
	bic	r3, r3, #128
	.loc 1 203 81
	orrs	r3, r3, r1
	.loc 1 203 27
	str	r3, [r2, #8]
	.loc 1 206 3 is_stmt 1
	.loc 1 206 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r0, #29]
	.loc 1 209 3 is_stmt 1
	.loc 1 210 1 is_stmt 0
	movs	r0, #0
.LVL21:
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_CRCEx_Output_Data_Reverse, .-HAL_CRCEx_Output_Data_Reverse
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_crc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x338
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xe
	.4byte	.LASF55
	.byte	0x1d
	.4byte	.LASF56
	.4byte	.LASF57
	.4byte	.LLRL6
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
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x40
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
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x2
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
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x34
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x55
	.uleb128 0x9
	.4byte	0x90
	.uleb128 0x10
	.byte	0x18
	.byte	0x4
	.2byte	0x1b0
	.byte	0x9
	.4byte	0xf4
	.uleb128 0x5
	.ascii	"DR\000"
	.2byte	0x1b2
	.4byte	0x9c
	.byte	0
	.uleb128 0x5
	.ascii	"IDR\000"
	.2byte	0x1b3
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x5
	.ascii	"CR\000"
	.2byte	0x1b4
	.4byte	0x9c
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF13
	.2byte	0x1b5
	.byte	0xc
	.4byte	0x90
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF14
	.2byte	0x1b6
	.byte	0x15
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x5
	.ascii	"POL\000"
	.2byte	0x1b7
	.4byte	0x9c
	.byte	0x14
	.byte	0
	.uleb128 0x11
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x1b8
	.byte	0x3
	.4byte	0xa1
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF16
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF17
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.4byte	.LASF18
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF19
	.uleb128 0x6
	.4byte	0x40
	.byte	0x5
	.byte	0x28
	.4byte	0x141
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0x11d
	.uleb128 0x6
	.4byte	0x40
	.byte	0x5
	.byte	0x33
	.4byte	0x165
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF27
	.byte	0x5
	.byte	0x36
	.byte	0x3
	.4byte	0x14d
	.uleb128 0x6
	.4byte	0x40
	.byte	0x6
	.byte	0x2f
	.4byte	0x19b
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x3
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF33
	.byte	0x6
	.byte	0x35
	.byte	0x3
	.4byte	0x171
	.uleb128 0x9
	.4byte	0x19b
	.uleb128 0xb
	.byte	0x18
	.byte	0x3a
	.4byte	0x208
	.uleb128 0x2
	.4byte	.LASF34
	.byte	0x3c
	.byte	0xb
	.4byte	0x84
	.byte	0
	.uleb128 0x2
	.4byte	.LASF35
	.byte	0x44
	.byte	0xb
	.4byte	0x84
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF36
	.byte	0x49
	.byte	0xc
	.4byte	0x90
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF37
	.byte	0x4f
	.byte	0xc
	.4byte	0x90
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF38
	.byte	0x56
	.byte	0xc
	.4byte	0x90
	.byte	0xc
	.uleb128 0x2
	.4byte	.LASF39
	.byte	0x59
	.byte	0xc
	.4byte	0x90
	.byte	0x10
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0x63
	.byte	0xc
	.4byte	0x90
	.byte	0x14
	.byte	0
	.uleb128 0x4
	.4byte	.LASF41
	.byte	0x6
	.byte	0x68
	.byte	0x3
	.4byte	0x1ac
	.uleb128 0xb
	.byte	0x24
	.byte	0x6d
	.4byte	0x258
	.uleb128 0x2
	.4byte	.LASF42
	.byte	0x6f
	.byte	0x10
	.4byte	0x258
	.byte	0
	.uleb128 0x2
	.4byte	.LASF43
	.byte	0x71
	.byte	0x13
	.4byte	0x208
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x73
	.byte	0x13
	.4byte	0x165
	.byte	0x1c
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0x75
	.byte	0x21
	.4byte	0x1a7
	.byte	0x1d
	.uleb128 0x2
	.4byte	.LASF46
	.byte	0x77
	.byte	0xc
	.4byte	0x90
	.byte	0x20
	.byte	0
	.uleb128 0xc
	.4byte	0xf4
	.uleb128 0x4
	.4byte	.LASF47
	.byte	0x6
	.byte	0x83
	.byte	0x3
	.4byte	0x214
	.uleb128 0xd
	.4byte	.LASF50
	.byte	0xc2
	.4byte	0x141
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x29e
	.uleb128 0x7
	.4byte	.LASF48
	.byte	0xc2
	.byte	0x44
	.4byte	0x29e
	.4byte	.LLST5
	.uleb128 0x8
	.4byte	.LASF49
	.byte	0xc2
	.byte	0x53
	.4byte	0x90
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0xc
	.4byte	0x25d
	.uleb128 0xd
	.4byte	.LASF51
	.byte	0xa8
	.4byte	0x141
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d8
	.uleb128 0x7
	.4byte	.LASF48
	.byte	0xa8
	.byte	0x43
	.4byte	0x29e
	.4byte	.LLST4
	.uleb128 0x8
	.4byte	.LASF52
	.byte	0xa8
	.byte	0x52
	.4byte	0x90
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x12
	.4byte	.LASF58
	.byte	0x1
	.byte	0x59
	.byte	0x13
	.4byte	0x141
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF48
	.byte	0x59
	.byte	0x3f
	.4byte	0x29e
	.4byte	.LLST0
	.uleb128 0x13
	.ascii	"Pol\000"
	.byte	0x1
	.byte	0x59
	.byte	0x4e
	.4byte	0x90
	.4byte	.LLST1
	.uleb128 0x8
	.4byte	.LASF53
	.byte	0x59
	.byte	0x5c
	.4byte	0x90
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x14
	.4byte	.LASF54
	.byte	0x1
	.byte	0x5b
	.byte	0x15
	.4byte	0x141
	.4byte	.LLST2
	.uleb128 0x15
	.ascii	"msb\000"
	.byte	0x1
	.byte	0x5c
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST3
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
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
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
	.uleb128 0x21
	.sleb128 21
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.sleb128 19
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x16
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.4byte	.LVL20
	.byte	0x4
	.uleb128 .LVL20-.LVL20
	.uleb128 .LVL21-.LVL20
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL21-.LVL20
	.uleb128 .LFE337-.LVL20
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL18
	.byte	0x4
	.uleb128 .LVL18-.LVL18
	.uleb128 .LVL19-.LVL18
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL19-.LVL18
	.uleb128 .LFE336-.LVL18
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
	.uleb128 .LVL10-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL10-.LVL0
	.uleb128 .LVL11-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL11-.LVL0
	.uleb128 .LVL12-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL12-.LVL0
	.uleb128 .LVL13-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL13-.LVL0
	.uleb128 .LVL14-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL0
	.uleb128 .LVL15-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL15-.LVL0
	.uleb128 .LVL16-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL0
	.uleb128 .LVL17-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL17-.LVL0
	.uleb128 .LFE335-.LVL0
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
	.uleb128 .LVL5-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LVL6-.LVL0
	.uleb128 0x2
	.byte	0x73
	.sleb128 20
	.byte	0x4
	.uleb128 .LVL6-.LVL0
	.uleb128 .LVL8-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL8-.LVL0
	.uleb128 .LVL15-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL15-.LVL0
	.uleb128 .LVL16-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL8-.LVL0
	.uleb128 .LVL13-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL0
	.uleb128 .LVL15-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x2
	.byte	0x4f
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL8-.LVL0
	.uleb128 .LVL12-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL12-.LVL0
	.uleb128 .LVL14-.LVL0
	.uleb128 0x2
	.byte	0x4f
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL0
	.uleb128 .LVL15-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL16-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x1
	.byte	0x53
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
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
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
.LLRL6:
	.byte	0x7
	.4byte	.LFB335
	.uleb128 .LFE335-.LFB335
	.byte	0x7
	.4byte	.LFB336
	.uleb128 .LFE336-.LFB336
	.byte	0x7
	.4byte	.LFB337
	.uleb128 .LFE337-.LFB337
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF21:
	.ascii	"HAL_ERROR\000"
.LASF25:
	.ascii	"HAL_UNLOCKED\000"
.LASF29:
	.ascii	"HAL_CRC_STATE_READY\000"
.LASF23:
	.ascii	"HAL_TIMEOUT\000"
.LASF45:
	.ascii	"State\000"
.LASF51:
	.ascii	"HAL_CRCEx_Input_Data_Reverse\000"
.LASF57:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF0:
	.ascii	"short int\000"
.LASF50:
	.ascii	"HAL_CRCEx_Output_Data_Reverse\000"
.LASF35:
	.ascii	"DefaultInitValueUse\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF28:
	.ascii	"HAL_CRC_STATE_RESET\000"
.LASF20:
	.ascii	"HAL_OK\000"
.LASF58:
	.ascii	"HAL_CRCEx_Polynomial_Set\000"
.LASF11:
	.ascii	"uint8_t\000"
.LASF22:
	.ascii	"HAL_BUSY\000"
.LASF36:
	.ascii	"GeneratingPolynomial\000"
.LASF18:
	.ascii	"float\000"
.LASF8:
	.ascii	"long long int\000"
.LASF40:
	.ascii	"OutputDataInversionMode\000"
.LASF43:
	.ascii	"Init\000"
.LASF4:
	.ascii	"long int\000"
.LASF49:
	.ascii	"OutputReverseMode\000"
.LASF44:
	.ascii	"Lock\000"
.LASF14:
	.ascii	"INIT\000"
.LASF56:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_crc_ex.c\000"
.LASF5:
	.ascii	"__uint8_t\000"
.LASF24:
	.ascii	"HAL_StatusTypeDef\000"
.LASF16:
	.ascii	"long double\000"
.LASF46:
	.ascii	"InputDataFormat\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF41:
	.ascii	"CRC_InitTypeDef\000"
.LASF1:
	.ascii	"signed char\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF47:
	.ascii	"CRC_HandleTypeDef\000"
.LASF42:
	.ascii	"Instance\000"
.LASF39:
	.ascii	"InputDataInversionMode\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF55:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF54:
	.ascii	"status\000"
.LASF17:
	.ascii	"char\000"
.LASF33:
	.ascii	"HAL_CRC_StateTypeDef\000"
.LASF38:
	.ascii	"InitValue\000"
.LASF26:
	.ascii	"HAL_LOCKED\000"
.LASF13:
	.ascii	"RESERVED2\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF19:
	.ascii	"double\000"
.LASF30:
	.ascii	"HAL_CRC_STATE_BUSY\000"
.LASF32:
	.ascii	"HAL_CRC_STATE_ERROR\000"
.LASF34:
	.ascii	"DefaultPolynomialUse\000"
.LASF15:
	.ascii	"CRC_TypeDef\000"
.LASF31:
	.ascii	"HAL_CRC_STATE_TIMEOUT\000"
.LASF52:
	.ascii	"InputReverseMode\000"
.LASF37:
	.ascii	"CRCLength\000"
.LASF27:
	.ascii	"HAL_LockTypeDef\000"
.LASF53:
	.ascii	"PolyLength\000"
.LASF48:
	.ascii	"hcrc\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
