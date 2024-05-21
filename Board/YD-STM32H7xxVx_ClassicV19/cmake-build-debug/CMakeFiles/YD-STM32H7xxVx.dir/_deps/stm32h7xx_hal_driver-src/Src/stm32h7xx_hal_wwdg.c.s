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
	.file	"stm32h7xx_hal_wwdg.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_wwdg.c"
	.section	.text.HAL_WWDG_MspInit,"ax",%progbits
	.align	1
	.weak	HAL_WWDG_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_WWDG_MspInit, %function
HAL_WWDG_MspInit:
.LFB336:
	.loc 1 240 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 242 3
	.loc 1 247 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE336:
	.size	HAL_WWDG_MspInit, .-HAL_WWDG_MspInit
	.section	.text.HAL_WWDG_Init,"ax",%progbits
	.align	1
	.global	HAL_WWDG_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_WWDG_Init, %function
HAL_WWDG_Init:
.LFB335:
	.loc 1 186 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL1:
	.loc 1 188 3
	.loc 1 188 6 is_stmt 0
	cbz	r0, .L4
	.loc 1 186 1
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 194 3 is_stmt 1
	.loc 1 195 3
	.loc 1 196 3
	.loc 1 197 3
	.loc 1 198 3
	.loc 1 216 3
	bl	HAL_WWDG_MspInit
.LVL2:
	.loc 1 220 3
	.loc 1 220 59 is_stmt 0
	ldr	r3, [r4, #12]
	.loc 1 220 10
	ldr	r2, [r4]
	.loc 1 220 46
	orr	r3, r3, #128
	.loc 1 220 26
	str	r3, [r2]
	.loc 1 223 3 is_stmt 1
	.loc 1 223 42 is_stmt 0
	ldr	r3, [r4, #16]
	.loc 1 223 64
	ldr	r2, [r4, #4]
	.loc 1 223 51
	orrs	r3, r3, r2
	.loc 1 223 88
	ldr	r1, [r4, #8]
	.loc 1 223 10
	ldr	r2, [r4]
	.loc 1 223 75
	orrs	r3, r3, r1
	.loc 1 223 27
	str	r3, [r2, #4]
	.loc 1 226 3 is_stmt 1
	.loc 1 226 10 is_stmt 0
	movs	r0, #0
	.loc 1 227 1
	pop	{r4, pc}
.LVL3:
.L4:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 190 12
	movs	r0, #1
.LVL4:
	.loc 1 227 1
	bx	lr
	.cfi_endproc
.LFE335:
	.size	HAL_WWDG_Init, .-HAL_WWDG_Init
	.section	.text.HAL_WWDG_Refresh,"ax",%progbits
	.align	1
	.global	HAL_WWDG_Refresh
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_WWDG_Refresh, %function
HAL_WWDG_Refresh:
.LFB337:
	.loc 1 353 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL5:
	.loc 1 355 3
	.loc 1 355 10 is_stmt 0
	ldr	r3, [r0]
	.loc 1 355 41
	ldr	r2, [r0, #12]
	.loc 1 355 26
	str	r2, [r3]
	.loc 1 358 3 is_stmt 1
	.loc 1 359 1 is_stmt 0
	movs	r0, #0
.LVL6:
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_WWDG_Refresh, .-HAL_WWDG_Refresh
	.section	.text.HAL_WWDG_EarlyWakeupCallback,"ax",%progbits
	.align	1
	.weak	HAL_WWDG_EarlyWakeupCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_WWDG_EarlyWakeupCallback, %function
HAL_WWDG_EarlyWakeupCallback:
.LFB339:
	.loc 1 405 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL7:
	.loc 1 407 3
	.loc 1 412 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE339:
	.size	HAL_WWDG_EarlyWakeupCallback, .-HAL_WWDG_EarlyWakeupCallback
	.section	.text.HAL_WWDG_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_WWDG_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_WWDG_IRQHandler, %function
HAL_WWDG_IRQHandler:
.LFB338:
	.loc 1 376 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL8:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 378 3
	.loc 1 378 16 is_stmt 0
	ldr	r3, [r0]
	.loc 1 378 26
	ldr	r2, [r3, #4]
	.loc 1 378 6
	tst	r2, #512
	beq	.L11
	.loc 1 381 5 is_stmt 1
	.loc 1 381 28 is_stmt 0
	ldr	r2, [r3, #8]
	.loc 1 381 8
	tst	r2, #1
	bne	.L14
.LVL9:
.L11:
	.loc 1 395 1
	pop	{r3, pc}
.LVL10:
.L14:
	.loc 1 384 7 is_stmt 1
	.loc 1 384 30 is_stmt 0
	mvn	r2, #1
	str	r2, [r3, #8]
	.loc 1 391 7 is_stmt 1
	bl	HAL_WWDG_EarlyWakeupCallback
.LVL11:
	.loc 1 395 1 is_stmt 0
	b	.L11
	.cfi_endproc
.LFE338:
	.size	HAL_WWDG_IRQHandler, .-HAL_WWDG_IRQHandler
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h7xx.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_wwdg.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x27c
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x1d
	.4byte	.LASF36
	.4byte	.LASF37
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
	.uleb128 0x3
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
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x49
	.uleb128 0xd
	.4byte	0x78
	.uleb128 0xe
	.byte	0xc
	.byte	0x4
	.2byte	0x65d
	.byte	0x9
	.4byte	0xb6
	.uleb128 0x5
	.ascii	"CR\000"
	.2byte	0x65f
	.4byte	0x84
	.byte	0
	.uleb128 0x5
	.ascii	"CFR\000"
	.2byte	0x660
	.4byte	0x84
	.byte	0x4
	.uleb128 0x5
	.ascii	"SR\000"
	.2byte	0x661
	.4byte	0x84
	.byte	0x8
	.byte	0
	.uleb128 0xf
	.4byte	.LASF11
	.byte	0x4
	.2byte	0x662
	.byte	0x3
	.4byte	0x89
	.uleb128 0x6
	.4byte	0x34
	.byte	0x5
	.byte	0xb5
	.4byte	0xdb
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0
	.uleb128 0x10
	.ascii	"SET\000"
	.byte	0x1
	.byte	0
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
	.uleb128 0x6
	.4byte	0x34
	.byte	0x6
	.byte	0x28
	.4byte	0x11b
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x2
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x6
	.byte	0x2d
	.byte	0x3
	.4byte	0xf7
	.uleb128 0x7
	.byte	0x10
	.byte	0x2f
	.4byte	0x15f
	.uleb128 0x2
	.4byte	.LASF22
	.byte	0x31
	.byte	0xc
	.4byte	0x78
	.byte	0
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0x34
	.byte	0xc
	.4byte	0x78
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x37
	.byte	0xc
	.4byte	0x78
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0x3a
	.byte	0xc
	.4byte	0x78
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x7
	.byte	0x3d
	.byte	0x3
	.4byte	0x127
	.uleb128 0x7
	.byte	0x14
	.byte	0x45
	.4byte	0x18b
	.uleb128 0x2
	.4byte	.LASF27
	.byte	0x48
	.byte	0x11
	.4byte	0x18b
	.byte	0
	.uleb128 0x2
	.4byte	.LASF28
	.byte	0x4a
	.byte	0x14
	.4byte	0x15f
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.4byte	0xb6
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0x7
	.byte	0x51
	.byte	0x3
	.4byte	0x16b
	.uleb128 0x9
	.4byte	.LASF30
	.2byte	0x194
	.byte	0x1c
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c2
	.uleb128 0x11
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x194
	.byte	0x4d
	.4byte	0x1c2
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x8
	.4byte	0x190
	.uleb128 0x9
	.4byte	.LASF31
	.2byte	0x177
	.byte	0x6
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f7
	.uleb128 0xa
	.4byte	.LASF32
	.2byte	0x177
	.byte	0x2e
	.4byte	0x1c2
	.4byte	.LLST2
	.uleb128 0x12
	.4byte	.LVL11
	.4byte	0x19c
	.byte	0
	.uleb128 0x13
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x160
	.byte	0x13
	.4byte	0x11b
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x223
	.uleb128 0xa
	.4byte	.LASF32
	.2byte	0x160
	.byte	0x38
	.4byte	0x1c2
	.4byte	.LLST1
	.byte	0
	.uleb128 0x14
	.4byte	.LASF33
	.byte	0x1
	.byte	0xef
	.byte	0x1c
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x248
	.uleb128 0x15
	.4byte	.LASF32
	.byte	0x1
	.byte	0xef
	.byte	0x41
	.4byte	0x1c2
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x16
	.4byte	.LASF34
	.byte	0x1
	.byte	0xb9
	.byte	0x13
	.4byte	0x11b
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF32
	.byte	0x1
	.byte	0xb9
	.byte	0x35
	.4byte	0x1c2
	.4byte	.LLST0
	.uleb128 0x18
	.4byte	.LVL2
	.4byte	0x223
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
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
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
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
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
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
	.4byte	.LVL8
	.byte	0x4
	.uleb128 .LVL8-.LVL8
	.uleb128 .LVL9-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL9-.LVL8
	.uleb128 .LVL10-.LVL8
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL10-.LVL8
	.uleb128 .LVL11-1-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL11-1-.LVL8
	.uleb128 .LFE338-.LVL8
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL5
	.byte	0x4
	.uleb128 .LVL5-.LVL5
	.uleb128 .LVL6-.LVL5
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL6-.LVL5
	.uleb128 .LFE337-.LVL5
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL2-1-.LVL1
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL2-1-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL3-.LVL1
	.uleb128 .LVL4-.LVL1
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL4-.LVL1
	.uleb128 .LFE335-.LVL1
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
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
.LLRL3:
	.byte	0x7
	.4byte	.LFB336
	.uleb128 .LFE336-.LFB336
	.byte	0x7
	.4byte	.LFB335
	.uleb128 .LFE335-.LFB335
	.byte	0x7
	.4byte	.LFB337
	.uleb128 .LFE337-.LFB337
	.byte	0x7
	.4byte	.LFB339
	.uleb128 .LFE339-.LFB339
	.byte	0x7
	.4byte	.LFB338
	.uleb128 .LFE338-.LFB338
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF38:
	.ascii	"HAL_WWDG_Refresh\000"
.LASF25:
	.ascii	"EWIMode\000"
.LASF18:
	.ascii	"HAL_ERROR\000"
.LASF36:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_wwdg.c\000"
.LASF30:
	.ascii	"HAL_WWDG_EarlyWakeupCallback\000"
.LASF11:
	.ascii	"WWDG_TypeDef\000"
.LASF17:
	.ascii	"HAL_OK\000"
.LASF37:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF31:
	.ascii	"HAL_WWDG_IRQHandler\000"
.LASF15:
	.ascii	"float\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF34:
	.ascii	"HAL_WWDG_Init\000"
.LASF32:
	.ascii	"hwwdg\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF28:
	.ascii	"Init\000"
.LASF4:
	.ascii	"long int\000"
.LASF26:
	.ascii	"WWDG_InitTypeDef\000"
.LASF20:
	.ascii	"HAL_TIMEOUT\000"
.LASF29:
	.ascii	"WWDG_HandleTypeDef\000"
.LASF16:
	.ascii	"double\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF24:
	.ascii	"Counter\000"
.LASF33:
	.ascii	"HAL_WWDG_MspInit\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF35:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF21:
	.ascii	"HAL_StatusTypeDef\000"
.LASF6:
	.ascii	"long long int\000"
.LASF14:
	.ascii	"char\000"
.LASF27:
	.ascii	"Instance\000"
.LASF0:
	.ascii	"short int\000"
.LASF23:
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
.LASF12:
	.ascii	"RESET\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
