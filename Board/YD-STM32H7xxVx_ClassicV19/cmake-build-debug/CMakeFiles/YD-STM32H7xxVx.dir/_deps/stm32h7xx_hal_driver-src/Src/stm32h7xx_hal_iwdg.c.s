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
	.file	"stm32h7xx_hal_iwdg.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_iwdg.c"
	.section	.text.HAL_IWDG_Init,"ax",%progbits
	.align	1
	.global	HAL_IWDG_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_IWDG_Init, %function
HAL_IWDG_Init:
.LFB335:
	.loc 1 172 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	.loc 1 173 3
	.loc 1 176 3
	.loc 1 176 6 is_stmt 0
	cmp	r0, #0
	beq	.L6
	.loc 1 172 1
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 182 3 is_stmt 1
	.loc 1 183 3
	.loc 1 184 3
	.loc 1 185 3
	.loc 1 188 3
	.loc 1 188 12 is_stmt 0
	ldr	r3, [r0]
	.loc 1 188 28
	movw	r2, #52428
	str	r2, [r3]
	.loc 1 192 3 is_stmt 1
	.loc 1 192 12 is_stmt 0
	ldr	r3, [r0]
	.loc 1 192 28
	movw	r2, #21845
	str	r2, [r3]
	.loc 1 195 3 is_stmt 1
	.loc 1 195 8 is_stmt 0
	ldr	r3, [r0]
	.loc 1 195 36
	ldr	r2, [r0, #4]
	.loc 1 195 23
	str	r2, [r3, #4]
	.loc 1 196 3 is_stmt 1
	.loc 1 196 8 is_stmt 0
	ldr	r3, [r0]
	.loc 1 196 37
	ldr	r2, [r0, #8]
	.loc 1 196 24
	str	r2, [r3, #8]
	.loc 1 199 3 is_stmt 1
	.loc 1 199 15 is_stmt 0
	bl	HAL_GetTick
.LVL1:
	mov	r5, r0
.LVL2:
	.loc 1 202 3 is_stmt 1
.L3:
	.loc 1 202 88
	.loc 1 202 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 202 26
	ldr	r2, [r3, #12]
	.loc 1 202 88
	tst	r2, #7
	beq	.L12
	.loc 1 204 5 is_stmt 1
	.loc 1 204 10 is_stmt 0
	bl	HAL_GetTick
.LVL3:
	.loc 1 204 24
	subs	r0, r0, r5
	.loc 1 204 8
	cmp	r0, #49
	bls	.L3
	.loc 1 206 7 is_stmt 1
	.loc 1 206 17 is_stmt 0
	ldr	r3, [r4]
	.loc 1 206 27
	ldr	r3, [r3, #12]
	.loc 1 206 10
	tst	r3, #7
	beq	.L3
	.loc 1 208 16
	movs	r0, #3
	b	.L2
.L12:
	.loc 1 215 3 is_stmt 1
	.loc 1 215 22 is_stmt 0
	ldr	r1, [r3, #16]
	.loc 1 215 43
	ldr	r2, [r4, #12]
	.loc 1 215 6
	cmp	r1, r2
	beq	.L5
	.loc 1 220 5 is_stmt 1
	.loc 1 220 27 is_stmt 0
	str	r2, [r3, #16]
	.loc 1 229 10
	movs	r0, #0
.L2:
	.loc 1 230 1
	pop	{r3, r4, r5, pc}
.LVL4:
.L5:
	.loc 1 225 5 is_stmt 1
	.loc 1 225 30 is_stmt 0
	movw	r2, #43690
	str	r2, [r3]
	.loc 1 229 10
	movs	r0, #0
	b	.L2
.LVL5:
.L6:
	.cfi_def_cfa_offset 0
	.cfi_restore 3
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 14
	.loc 1 178 12
	movs	r0, #1
.LVL6:
	.loc 1 230 1
	bx	lr
	.cfi_endproc
.LFE335:
	.size	HAL_IWDG_Init, .-HAL_IWDG_Init
	.section	.text.HAL_IWDG_Refresh,"ax",%progbits
	.align	1
	.global	HAL_IWDG_Refresh
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_IWDG_Refresh, %function
HAL_IWDG_Refresh:
.LFB336:
	.loc 1 259 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL7:
	.loc 1 261 3
	.loc 1 261 12 is_stmt 0
	ldr	r3, [r0]
	.loc 1 261 28
	movw	r2, #43690
	str	r2, [r3]
	.loc 1 264 3 is_stmt 1
	.loc 1 265 1 is_stmt 0
	movs	r0, #0
.LVL8:
	bx	lr
	.cfi_endproc
.LFE336:
	.size	HAL_IWDG_Refresh, .-HAL_IWDG_Refresh
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_iwdg.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x218
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x1d
	.4byte	.LASF31
	.4byte	.LASF32
	.4byte	.LLRL3
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
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x2
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
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x49
	.uleb128 0xb
	.4byte	0x78
	.uleb128 0xc
	.byte	0x14
	.byte	0x4
	.2byte	0x457
	.byte	0x9
	.4byte	0xcf
	.uleb128 0x4
	.ascii	"KR\000"
	.2byte	0x459
	.4byte	0x84
	.byte	0
	.uleb128 0x4
	.ascii	"PR\000"
	.2byte	0x45a
	.4byte	0x84
	.byte	0x4
	.uleb128 0x4
	.ascii	"RLR\000"
	.2byte	0x45b
	.4byte	0x84
	.byte	0x8
	.uleb128 0x4
	.ascii	"SR\000"
	.2byte	0x45c
	.4byte	0x84
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF11
	.byte	0x4
	.2byte	0x45d
	.byte	0x15
	.4byte	0x84
	.byte	0x10
	.byte	0
	.uleb128 0xe
	.4byte	.LASF12
	.byte	0x4
	.2byte	0x45e
	.byte	0x3
	.4byte	0x89
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF13
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF16
	.uleb128 0xf
	.byte	0x1
	.4byte	0x34
	.byte	0x5
	.byte	0x28
	.byte	0x1
	.4byte	0x11e
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.4byte	.LASF21
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0xf8
	.uleb128 0x6
	.byte	0xc
	.byte	0x2e
	.4byte	0x156
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x30
	.byte	0xc
	.4byte	0x78
	.byte	0
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x33
	.byte	0xc
	.4byte	0x78
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x36
	.byte	0xc
	.4byte	0x78
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0x6
	.byte	0x39
	.byte	0x3
	.4byte	0x12a
	.uleb128 0x6
	.byte	0x10
	.byte	0x3e
	.4byte	0x182
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x40
	.byte	0x11
	.4byte	0x182
	.byte	0
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x42
	.byte	0x14
	.4byte	0x156
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	0xcf
	.uleb128 0x2
	.4byte	.LASF28
	.byte	0x6
	.byte	0x43
	.byte	0x3
	.4byte	0x162
	.uleb128 0x10
	.4byte	.LASF33
	.byte	0x7
	.2byte	0x433
	.byte	0xa
	.4byte	0x78
	.uleb128 0x11
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x102
	.byte	0x13
	.4byte	0x11e
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1cd
	.uleb128 0x12
	.4byte	.LASF29
	.byte	0x1
	.2byte	0x102
	.byte	0x38
	.4byte	0x1cd
	.4byte	.LLST2
	.byte	0
	.uleb128 0x7
	.4byte	0x187
	.uleb128 0x13
	.4byte	.LASF35
	.byte	0x1
	.byte	0xab
	.byte	0x13
	.4byte	0x11e
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF29
	.byte	0x1
	.byte	0xab
	.byte	0x35
	.4byte	0x1cd
	.4byte	.LLST0
	.uleb128 0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0xad
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST1
	.uleb128 0x8
	.4byte	.LVL1
	.4byte	0x193
	.uleb128 0x8
	.4byte	.LVL3
	.4byte	0x193
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
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
	.uleb128 0x12
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
	.uleb128 0x2
	.uleb128 0x17
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
	.uleb128 0x15
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
.LLST2:
	.byte	0x6
	.4byte	.LVL7
	.byte	0x4
	.uleb128 .LVL7-.LVL7
	.uleb128 .LVL8-.LVL7
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL8-.LVL7
	.uleb128 .LFE336-.LVL7
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
	.uleb128 .LVL1-1-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL1-1-.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LVL6-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL6-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x8
	.4byte	.LVL2
	.uleb128 .LVL5-.LVL2
	.uleb128 0x1
	.byte	0x55
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
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
	.byte	0x7
	.4byte	.LFB336
	.uleb128 .LFE336-.LFB336
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF11:
	.ascii	"WINR\000"
.LASF23:
	.ascii	"Reload\000"
.LASF18:
	.ascii	"HAL_ERROR\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF17:
	.ascii	"HAL_OK\000"
.LASF32:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF25:
	.ascii	"IWDG_InitTypeDef\000"
.LASF15:
	.ascii	"float\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF12:
	.ascii	"IWDG_TypeDef\000"
.LASF30:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF29:
	.ascii	"hiwdg\000"
.LASF28:
	.ascii	"IWDG_HandleTypeDef\000"
.LASF27:
	.ascii	"Init\000"
.LASF4:
	.ascii	"long int\000"
.LASF33:
	.ascii	"HAL_GetTick\000"
.LASF20:
	.ascii	"HAL_TIMEOUT\000"
.LASF16:
	.ascii	"double\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF31:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_iwdg.c\000"
.LASF21:
	.ascii	"HAL_StatusTypeDef\000"
.LASF6:
	.ascii	"long long int\000"
.LASF36:
	.ascii	"tickstart\000"
.LASF14:
	.ascii	"char\000"
.LASF26:
	.ascii	"Instance\000"
.LASF0:
	.ascii	"short int\000"
.LASF34:
	.ascii	"HAL_IWDG_Refresh\000"
.LASF24:
	.ascii	"Window\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF19:
	.ascii	"HAL_BUSY\000"
.LASF13:
	.ascii	"long double\000"
.LASF1:
	.ascii	"signed char\000"
.LASF22:
	.ascii	"Prescaler\000"
.LASF35:
	.ascii	"HAL_IWDG_Init\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
