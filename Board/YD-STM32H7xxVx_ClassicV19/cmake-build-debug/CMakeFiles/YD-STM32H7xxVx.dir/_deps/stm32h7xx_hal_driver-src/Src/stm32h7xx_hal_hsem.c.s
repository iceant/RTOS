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
	.file	"stm32h7xx_hal_hsem.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_hsem.c"
	.section	.text.HAL_HSEM_Take,"ax",%progbits
	.align	1
	.global	HAL_HSEM_Take
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_HSEM_Take, %function
HAL_HSEM_Take:
.LFB335:
	.loc 1 160 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 162 3
	.loc 1 163 3
	.loc 1 177 3
	.loc 1 177 116 is_stmt 0
	ldr	r3, .L4
	orrs	r3, r3, r1
	.loc 1 177 77
	ldr	r2, .L4+4
	str	r3, [r2, r0, lsl #2]
	.loc 1 180 3 is_stmt 1
	.loc 1 180 73 is_stmt 0
	ldr	r2, [r2, r0, lsl #2]
	.loc 1 180 6
	cmp	r3, r2
	beq	.L3
	.loc 1 188 10
	movs	r0, #1
.LVL1:
	bx	lr
.LVL2:
.L3:
	.loc 1 183 12
	movs	r0, #0
.LVL3:
	.loc 1 189 1
	bx	lr
.L5:
	.align	2
.L4:
	.word	-2147482880
	.word	1476551680
	.cfi_endproc
.LFE335:
	.size	HAL_HSEM_Take, .-HAL_HSEM_Take
	.section	.text.HAL_HSEM_FastTake,"ax",%progbits
	.align	1
	.global	HAL_HSEM_FastTake
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_HSEM_FastTake, %function
HAL_HSEM_FastTake:
.LFB336:
	.loc 1 197 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL4:
	.loc 1 199 3
	.loc 1 210 3
	.loc 1 210 75 is_stmt 0
	adds	r0, r0, #32
.LVL5:
	ldr	r3, .L9
	ldr	r2, [r3, r0, lsl #2]
	.loc 1 210 6
	ldr	r3, .L9+4
	cmp	r2, r3
	beq	.L8
	.loc 1 218 10
	movs	r0, #1
.LVL6:
	bx	lr
.L8:
	.loc 1 213 12
	movs	r0, #0
	.loc 1 219 1
	bx	lr
.L10:
	.align	2
.L9:
	.word	1476551680
	.word	-2147482880
	.cfi_endproc
.LFE336:
	.size	HAL_HSEM_FastTake, .-HAL_HSEM_FastTake
	.section	.text.HAL_HSEM_IsSemTaken,"ax",%progbits
	.align	1
	.global	HAL_HSEM_IsSemTaken
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_HSEM_IsSemTaken, %function
HAL_HSEM_IsSemTaken:
.LFB337:
	.loc 1 226 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL7:
	.loc 1 227 3
	.loc 1 227 79 is_stmt 0
	ldr	r3, .L15
	ldr	r3, [r3, r0, lsl #2]
	.loc 1 227 120
	cmp	r3, #0
	blt	.L14
	movs	r0, #0
.LVL8:
	.loc 1 228 1
	bx	lr
.LVL9:
.L14:
	.loc 1 227 120
	movs	r0, #1
.LVL10:
	bx	lr
.L16:
	.align	2
.L15:
	.word	1476551680
	.cfi_endproc
.LFE337:
	.size	HAL_HSEM_IsSemTaken, .-HAL_HSEM_IsSemTaken
	.section	.text.HAL_HSEM_Release,"ax",%progbits
	.align	1
	.global	HAL_HSEM_Release
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_HSEM_Release, %function
HAL_HSEM_Release:
.LFB338:
	.loc 1 238 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL11:
	.loc 1 240 3
	.loc 1 241 3
	.loc 1 247 3
	.loc 1 247 90 is_stmt 0
	orr	r1, r1, #768
.LVL12:
	.loc 1 247 77
	ldr	r3, .L18
	str	r1, [r3, r0, lsl #2]
	.loc 1 250 1
	bx	lr
.L19:
	.align	2
.L18:
	.word	1476551680
	.cfi_endproc
.LFE338:
	.size	HAL_HSEM_Release, .-HAL_HSEM_Release
	.section	.text.HAL_HSEM_ReleaseAll,"ax",%progbits
	.align	1
	.global	HAL_HSEM_ReleaseAll
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_HSEM_ReleaseAll, %function
HAL_HSEM_ReleaseAll:
.LFB339:
	.loc 1 259 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL13:
	.loc 1 260 3
	.loc 1 261 3
	.loc 1 263 3
	.loc 1 263 99 is_stmt 0
	lsls	r1, r1, #8
.LVL14:
	.loc 1 263 89
	orr	r1, r1, r0, lsl #16
	.loc 1 263 71
	ldr	r3, .L21
	str	r1, [r3, #320]
	.loc 1 264 1
	bx	lr
.L22:
	.align	2
.L21:
	.word	1476551680
	.cfi_endproc
.LFE339:
	.size	HAL_HSEM_ReleaseAll, .-HAL_HSEM_ReleaseAll
	.section	.text.HAL_HSEM_SetClearKey,"ax",%progbits
	.align	1
	.global	HAL_HSEM_SetClearKey
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_HSEM_SetClearKey, %function
HAL_HSEM_SetClearKey:
.LFB340:
	.loc 1 291 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL15:
	.loc 1 292 3
	.loc 1 294 3
	.loc 1 294 149 is_stmt 0
	ldr	r2, .L24
	ldr	r3, [r2, #324]
	.loc 1 294 159
	uxth	r3, r3
	.loc 1 294 187
	orr	r3, r3, r0, lsl #16
	.loc 1 294 78
	str	r3, [r2, #324]
	.loc 1 296 1
	bx	lr
.L25:
	.align	2
.L24:
	.word	1476551680
	.cfi_endproc
.LFE340:
	.size	HAL_HSEM_SetClearKey, .-HAL_HSEM_SetClearKey
	.section	.text.HAL_HSEM_GetClearKey,"ax",%progbits
	.align	1
	.global	HAL_HSEM_GetClearKey
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_HSEM_GetClearKey, %function
HAL_HSEM_GetClearKey:
.LFB341:
	.loc 1 303 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 304 3
	.loc 1 304 74 is_stmt 0
	ldr	r3, .L27
	ldr	r0, [r3, #324]
	.loc 1 305 1
	lsrs	r0, r0, #16
	bx	lr
.L28:
	.align	2
.L27:
	.word	1476551680
	.cfi_endproc
.LFE341:
	.size	HAL_HSEM_GetClearKey, .-HAL_HSEM_GetClearKey
	.section	.text.HAL_HSEM_ActivateNotification,"ax",%progbits
	.align	1
	.global	HAL_HSEM_ActivateNotification
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_HSEM_ActivateNotification, %function
HAL_HSEM_ActivateNotification:
.LFB342:
	.loc 1 330 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL16:
	.loc 1 344 3
	.loc 1 344 85 is_stmt 0
	ldr	r2, .L30
	ldr	r3, [r2]
	.loc 1 344 91
	orrs	r3, r3, r0
	str	r3, [r2]
	.loc 1 346 1
	bx	lr
.L31:
	.align	2
.L30:
	.word	1476551936
	.cfi_endproc
.LFE342:
	.size	HAL_HSEM_ActivateNotification, .-HAL_HSEM_ActivateNotification
	.section	.text.HAL_HSEM_DeactivateNotification,"ax",%progbits
	.align	1
	.global	HAL_HSEM_DeactivateNotification
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_HSEM_DeactivateNotification, %function
HAL_HSEM_DeactivateNotification:
.LFB343:
	.loc 1 354 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL17:
	.loc 1 368 3
	.loc 1 368 85 is_stmt 0
	ldr	r2, .L33
	ldr	r3, [r2]
	.loc 1 368 91
	bic	r3, r3, r0
	str	r3, [r2]
	.loc 1 370 1
	bx	lr
.L34:
	.align	2
.L33:
	.word	1476551936
	.cfi_endproc
.LFE343:
	.size	HAL_HSEM_DeactivateNotification, .-HAL_HSEM_DeactivateNotification
	.section	.text.HAL_HSEM_FreeCallback,"ax",%progbits
	.align	1
	.weak	HAL_HSEM_FreeCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_HSEM_FreeCallback, %function
HAL_HSEM_FreeCallback:
.LFB345:
	.loc 1 423 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL18:
	.loc 1 425 3
	.loc 1 430 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE345:
	.size	HAL_HSEM_FreeCallback, .-HAL_HSEM_FreeCallback
	.section	.text.HAL_HSEM_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_HSEM_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_HSEM_IRQHandler, %function
HAL_HSEM_IRQHandler:
.LFB344:
	.loc 1 377 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 378 3
	.loc 1 404 3
	.loc 1 404 13 is_stmt 0
	ldr	r3, .L38
	ldr	r0, [r3, #12]
.LVL19:
	.loc 1 407 3 is_stmt 1
	.loc 1 407 85 is_stmt 0
	ldr	r2, [r3]
	.loc 1 407 91
	bic	r2, r2, r0
	str	r2, [r3]
	.loc 1 410 3 is_stmt 1
	.loc 1 410 91 is_stmt 0
	str	r0, [r3, #4]
	.loc 1 414 3 is_stmt 1
	bl	HAL_HSEM_FreeCallback
.LVL20:
	.loc 1 415 1 is_stmt 0
	pop	{r3, pc}
.L39:
	.align	2
.L38:
	.word	1476551936
	.cfi_endproc
.LFE344:
	.size	HAL_HSEM_IRQHandler, .-HAL_HSEM_IRQHandler
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x39a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x10
	.4byte	.LASF43
	.byte	0x1d
	.4byte	.LASF44
	.4byte	.LASF45
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
	.uleb128 0x7
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
	.uleb128 0x11
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x49
	.uleb128 0x9
	.4byte	0x78
	.uleb128 0xa
	.4byte	0x78
	.4byte	0x99
	.uleb128 0xb
	.4byte	0x71
	.byte	0xb
	.byte	0
	.uleb128 0xa
	.4byte	0x84
	.4byte	0xa9
	.uleb128 0xb
	.4byte	0x71
	.byte	0x1f
	.byte	0
	.uleb128 0x9
	.4byte	0x99
	.uleb128 0x12
	.2byte	0x148
	.byte	0x4
	.2byte	0x5a9
	.byte	0x9
	.4byte	0x132
	.uleb128 0x4
	.ascii	"R\000"
	.2byte	0x5ab
	.4byte	0xa9
	.byte	0
	.uleb128 0x4
	.ascii	"RLR\000"
	.2byte	0x5ac
	.4byte	0xa9
	.byte	0x80
	.uleb128 0x2
	.4byte	.LASF11
	.2byte	0x5ad
	.byte	0x15
	.4byte	0x84
	.2byte	0x100
	.uleb128 0x2
	.4byte	.LASF12
	.2byte	0x5ae
	.byte	0x15
	.4byte	0x84
	.2byte	0x104
	.uleb128 0x2
	.4byte	.LASF13
	.2byte	0x5af
	.byte	0x15
	.4byte	0x84
	.2byte	0x108
	.uleb128 0x2
	.4byte	.LASF14
	.2byte	0x5b0
	.byte	0x15
	.4byte	0x84
	.2byte	0x10c
	.uleb128 0x2
	.4byte	.LASF15
	.2byte	0x5b1
	.byte	0xc
	.4byte	0x89
	.2byte	0x110
	.uleb128 0x13
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x5b2
	.byte	0x15
	.4byte	0x84
	.2byte	0x140
	.uleb128 0x2
	.4byte	.LASF16
	.2byte	0x5b3
	.byte	0x15
	.4byte	0x84
	.2byte	0x144
	.byte	0
	.uleb128 0xc
	.4byte	.LASF17
	.2byte	0x5b5
	.4byte	0xae
	.uleb128 0x14
	.byte	0x10
	.byte	0x4
	.2byte	0x5b7
	.byte	0x9
	.4byte	0x17a
	.uleb128 0x4
	.ascii	"IER\000"
	.2byte	0x5b9
	.4byte	0x84
	.byte	0
	.uleb128 0x4
	.ascii	"ICR\000"
	.2byte	0x5ba
	.4byte	0x84
	.byte	0x4
	.uleb128 0x4
	.ascii	"ISR\000"
	.2byte	0x5bb
	.4byte	0x84
	.byte	0x8
	.uleb128 0x15
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x5bc
	.byte	0x15
	.4byte	0x84
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.4byte	.LASF19
	.2byte	0x5bd
	.4byte	0x13d
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF20
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF21
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.4byte	.LASF22
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF23
	.uleb128 0x16
	.byte	0x1
	.4byte	0x34
	.byte	0x5
	.byte	0x28
	.byte	0x1
	.4byte	0x1c7
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF26
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF27
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0x1a1
	.uleb128 0x3
	.4byte	.LASF29
	.2byte	0x1a6
	.byte	0x1c
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f8
	.uleb128 0x8
	.4byte	.LASF32
	.2byte	0x1a6
	.byte	0x3b
	.4byte	0x78
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x3
	.4byte	.LASF30
	.2byte	0x178
	.byte	0x6
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x229
	.uleb128 0x17
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x17a
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST5
	.uleb128 0x18
	.4byte	.LVL20
	.4byte	0x1d3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF31
	.2byte	0x161
	.byte	0x6
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24e
	.uleb128 0x8
	.4byte	.LASF32
	.2byte	0x161
	.byte	0x2f
	.4byte	0x78
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x3
	.4byte	.LASF33
	.2byte	0x149
	.byte	0x6
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x273
	.uleb128 0x8
	.4byte	.LASF32
	.2byte	0x149
	.byte	0x2d
	.4byte	0x78
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x19
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x12e
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF34
	.2byte	0x122
	.byte	0x6
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2af
	.uleb128 0xd
	.ascii	"Key\000"
	.2byte	0x122
	.byte	0x24
	.4byte	0x78
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x3
	.4byte	.LASF35
	.2byte	0x102
	.byte	0x6
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2e5
	.uleb128 0xd
	.ascii	"Key\000"
	.2byte	0x102
	.byte	0x23
	.4byte	0x78
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x102
	.byte	0x31
	.4byte	0x78
	.4byte	.LLST4
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF37
	.byte	0x1
	.byte	0xed
	.byte	0x6
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x318
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0xed
	.byte	0x20
	.4byte	0x78
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0xed
	.byte	0x30
	.4byte	0x78
	.4byte	.LLST3
	.byte	0
	.uleb128 0xf
	.4byte	.LASF40
	.byte	0xe1
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x341
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0xe1
	.byte	0x27
	.4byte	0x78
	.4byte	.LLST2
	.byte	0
	.uleb128 0xf
	.4byte	.LASF41
	.byte	0xc4
	.byte	0x13
	.4byte	0x1c7
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x36a
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0xc4
	.byte	0x2e
	.4byte	0x78
	.4byte	.LLST1
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF42
	.byte	0x1
	.byte	0x9f
	.byte	0x13
	.4byte	0x1c7
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x9f
	.byte	0x2a
	.4byte	0x78
	.4byte	.LLST0
	.uleb128 0xe
	.4byte	.LASF39
	.byte	0x9f
	.byte	0x3a
	.4byte	0x78
	.uleb128 0x1
	.byte	0x51
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
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.byte	0x8
	.4byte	.LVL19
	.uleb128 .LVL20-1-.LVL19
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
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL14-.LVL13
	.uleb128 .LFE339-.LVL13
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL11
	.byte	0x4
	.uleb128 .LVL11-.LVL11
	.uleb128 .LVL12-.LVL11
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL12-.LVL11
	.uleb128 .LFE338-.LVL11
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
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
	.uleb128 .LVL9-.LVL7
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL9-.LVL7
	.uleb128 .LVL10-.LVL7
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL10-.LVL7
	.uleb128 .LFE337-.LVL7
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL5-.LVL4
	.uleb128 .LVL6-.LVL4
	.uleb128 0x3
	.byte	0x70
	.sleb128 -32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL4
	.uleb128 .LFE336-.LVL4
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
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x6c
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
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
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
	.byte	0x7
	.4byte	.LFB338
	.uleb128 .LFE338-.LFB338
	.byte	0x7
	.4byte	.LFB339
	.uleb128 .LFE339-.LFB339
	.byte	0x7
	.4byte	.LFB340
	.uleb128 .LFE340-.LFB340
	.byte	0x7
	.4byte	.LFB341
	.uleb128 .LFE341-.LFB341
	.byte	0x7
	.4byte	.LFB342
	.uleb128 .LFE342-.LFB342
	.byte	0x7
	.4byte	.LFB343
	.uleb128 .LFE343-.LFB343
	.byte	0x7
	.4byte	.LFB345
	.uleb128 .LFE345-.LFB345
	.byte	0x7
	.4byte	.LFB344
	.uleb128 .LFE344-.LFB344
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF15:
	.ascii	"Reserved\000"
.LASF37:
	.ascii	"HAL_HSEM_Release\000"
.LASF43:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF41:
	.ascii	"HAL_HSEM_FastTake\000"
.LASF35:
	.ascii	"HAL_HSEM_ReleaseAll\000"
.LASF16:
	.ascii	"KEYR\000"
.LASF19:
	.ascii	"HSEM_Common_TypeDef\000"
.LASF39:
	.ascii	"ProcessID\000"
.LASF42:
	.ascii	"HAL_HSEM_Take\000"
.LASF25:
	.ascii	"HAL_ERROR\000"
.LASF46:
	.ascii	"statusreg\000"
.LASF24:
	.ascii	"HAL_OK\000"
.LASF45:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF34:
	.ascii	"HAL_HSEM_SetClearKey\000"
.LASF22:
	.ascii	"float\000"
.LASF1:
	.ascii	"signed char\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF30:
	.ascii	"HAL_HSEM_IRQHandler\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF13:
	.ascii	"C1ISR\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF14:
	.ascii	"C1MISR\000"
.LASF4:
	.ascii	"long int\000"
.LASF38:
	.ascii	"SemID\000"
.LASF27:
	.ascii	"HAL_TIMEOUT\000"
.LASF23:
	.ascii	"double\000"
.LASF17:
	.ascii	"HSEM_TypeDef\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF32:
	.ascii	"SemMask\000"
.LASF18:
	.ascii	"MISR\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF29:
	.ascii	"HAL_HSEM_FreeCallback\000"
.LASF44:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_hsem.c\000"
.LASF36:
	.ascii	"CoreID\000"
.LASF28:
	.ascii	"HAL_StatusTypeDef\000"
.LASF6:
	.ascii	"long long int\000"
.LASF40:
	.ascii	"HAL_HSEM_IsSemTaken\000"
.LASF21:
	.ascii	"char\000"
.LASF0:
	.ascii	"short int\000"
.LASF11:
	.ascii	"C1IER\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF26:
	.ascii	"HAL_BUSY\000"
.LASF31:
	.ascii	"HAL_HSEM_DeactivateNotification\000"
.LASF20:
	.ascii	"long double\000"
.LASF33:
	.ascii	"HAL_HSEM_ActivateNotification\000"
.LASF12:
	.ascii	"C1ICR\000"
.LASF47:
	.ascii	"HAL_HSEM_GetClearKey\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
