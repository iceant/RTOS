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
	.file	"stm32h7xx_hal_ramecc.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_ramecc.c"
	.section	.text.HAL_RAMECC_Init,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_Init, %function
HAL_RAMECC_Init:
.LFB335:
	.loc 1 161 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 163 3
	.loc 1 163 6 is_stmt 0
	mov	r3, r0
	cbz	r0, .L3
	.loc 1 170 3 is_stmt 1
	.loc 1 173 3
	.loc 1 173 18 is_stmt 0
	movs	r2, #2
	strb	r2, [r0, #4]
	.loc 1 176 3 is_stmt 1
	.loc 1 176 10 is_stmt 0
	ldr	r1, [r0]
	.loc 1 176 20
	ldr	r2, [r1]
	.loc 1 176 25
	bic	r2, r2, #32
	str	r2, [r1]
	.loc 1 179 3 is_stmt 1
	.loc 1 179 40 is_stmt 0
	ldr	r2, [r0]
	.loc 1 179 66
	bic	r2, r2, #255
	ldr	r1, [r2]
	.loc 1 179 72
	bic	r1, r1, #15
	str	r1, [r2]
	.loc 1 183 3 is_stmt 1
	.loc 1 183 10 is_stmt 0
	ldr	r1, [r0]
	.loc 1 183 20
	ldr	r2, [r1]
	.loc 1 183 25
	bic	r2, r2, #28
	str	r2, [r1]
	.loc 1 186 3 is_stmt 1
	.loc 1 186 13 is_stmt 0
	ldr	r1, [r0]
	.loc 1 186 23
	ldr	r2, [r1, #4]
	.loc 1 186 28
	bic	r2, r2, #7
	str	r2, [r1, #4]
	.loc 1 189 3 is_stmt 1
	.loc 1 189 22 is_stmt 0
	movs	r0, #0
.LVL1:
	str	r0, [r3, #8]
	.loc 1 192 3 is_stmt 1
	.loc 1 192 28 is_stmt 0
	str	r0, [r3, #12]
	.loc 1 195 3 is_stmt 1
	.loc 1 195 18 is_stmt 0
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 198 3 is_stmt 1
	.loc 1 198 10 is_stmt 0
	bx	lr
.LVL2:
.L3:
	.loc 1 166 12
	movs	r0, #1
.LVL3:
	.loc 1 199 1
	bx	lr
	.cfi_endproc
.LFE335:
	.size	HAL_RAMECC_Init, .-HAL_RAMECC_Init
	.section	.text.HAL_RAMECC_DeInit,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_DeInit, %function
HAL_RAMECC_DeInit:
.LFB336:
	.loc 1 209 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL4:
	.loc 1 211 3
	.loc 1 211 6 is_stmt 0
	mov	r3, r0
	cbz	r0, .L6
	.loc 1 218 3 is_stmt 1
	.loc 1 221 3
	.loc 1 221 10 is_stmt 0
	ldr	r1, [r0]
	.loc 1 221 20
	ldr	r2, [r1]
	.loc 1 221 25
	bic	r2, r2, #32
	str	r2, [r1]
	.loc 1 224 3 is_stmt 1
	.loc 1 224 40 is_stmt 0
	ldr	r2, [r0]
	.loc 1 224 66
	bic	r2, r2, #255
	ldr	r1, [r2]
	.loc 1 224 72
	bic	r1, r1, #15
	str	r1, [r2]
	.loc 1 228 3 is_stmt 1
	.loc 1 228 10 is_stmt 0
	ldr	r1, [r0]
	.loc 1 228 20
	ldr	r2, [r1]
	.loc 1 228 25
	bic	r2, r2, #28
	str	r2, [r1]
	.loc 1 231 3 is_stmt 1
	.loc 1 231 13 is_stmt 0
	ldr	r1, [r0]
	.loc 1 231 23
	ldr	r2, [r1, #4]
	.loc 1 231 28
	bic	r2, r2, #7
	str	r2, [r1, #4]
	.loc 1 239 3 is_stmt 1
	.loc 1 239 22 is_stmt 0
	movs	r0, #0
.LVL5:
	str	r0, [r3, #8]
	.loc 1 242 3 is_stmt 1
	.loc 1 242 28 is_stmt 0
	str	r0, [r3, #12]
	.loc 1 245 3 is_stmt 1
	.loc 1 245 18 is_stmt 0
	strb	r0, [r3, #4]
	.loc 1 248 3 is_stmt 1
	.loc 1 248 10 is_stmt 0
	bx	lr
.LVL6:
.L6:
	.loc 1 214 12
	movs	r0, #1
.LVL7:
	.loc 1 249 1
	bx	lr
	.cfi_endproc
.LFE336:
	.size	HAL_RAMECC_DeInit, .-HAL_RAMECC_DeInit
	.section	.text.HAL_RAMECC_StartMonitor,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_StartMonitor
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_StartMonitor, %function
HAL_RAMECC_StartMonitor:
.LFB337:
	.loc 1 279 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL8:
	.loc 1 281 3
	.loc 1 284 3
	.loc 1 284 14 is_stmt 0
	ldrb	r3, [r0, #4]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 284 6
	cmp	r3, #1
	bne	.L8
	.loc 1 287 5 is_stmt 1
	.loc 1 287 20 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #4]
	.loc 1 290 5 is_stmt 1
	.loc 1 290 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 290 22
	ldr	r3, [r2]
	.loc 1 290 27
	orr	r3, r3, #32
	str	r3, [r2]
	.loc 1 293 5 is_stmt 1
	.loc 1 293 20 is_stmt 0
	movs	r3, #1
	strb	r3, [r0, #4]
	.loc 1 305 3 is_stmt 1
	.loc 1 305 10 is_stmt 0
	movs	r0, #0
.LVL9:
	bx	lr
.LVL10:
.L8:
	.loc 1 298 5 is_stmt 1
	.loc 1 298 24 is_stmt 0
	movs	r3, #2
	str	r3, [r0, #8]
	.loc 1 301 5 is_stmt 1
	.loc 1 301 12 is_stmt 0
	movs	r0, #1
.LVL11:
	.loc 1 306 1
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_RAMECC_StartMonitor, .-HAL_RAMECC_StartMonitor
	.section	.text.HAL_RAMECC_StopMonitor,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_StopMonitor
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_StopMonitor, %function
HAL_RAMECC_StopMonitor:
.LFB338:
	.loc 1 316 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL12:
	.loc 1 318 3
	.loc 1 321 3
	.loc 1 321 14 is_stmt 0
	ldrb	r3, [r0, #4]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 321 6
	cmp	r3, #1
	bne	.L11
	.loc 1 324 5 is_stmt 1
	.loc 1 324 20 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #4]
	.loc 1 327 5 is_stmt 1
	.loc 1 327 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 327 22
	ldr	r3, [r2]
	.loc 1 327 27
	bic	r3, r3, #32
	str	r3, [r2]
	.loc 1 330 5 is_stmt 1
	.loc 1 330 20 is_stmt 0
	movs	r3, #1
	strb	r3, [r0, #4]
	.loc 1 342 3 is_stmt 1
	.loc 1 342 10 is_stmt 0
	movs	r0, #0
.LVL13:
	bx	lr
.LVL14:
.L11:
	.loc 1 335 5 is_stmt 1
	.loc 1 335 24 is_stmt 0
	movs	r3, #2
	str	r3, [r0, #8]
	.loc 1 338 5 is_stmt 1
	.loc 1 338 12 is_stmt 0
	movs	r0, #1
.LVL15:
	.loc 1 343 1
	bx	lr
	.cfi_endproc
.LFE338:
	.size	HAL_RAMECC_StopMonitor, .-HAL_RAMECC_StopMonitor
	.section	.text.HAL_RAMECC_EnableNotification,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_EnableNotification
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_EnableNotification, %function
HAL_RAMECC_EnableNotification:
.LFB339:
	.loc 1 354 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL16:
	.loc 1 356 3
	.loc 1 357 3
	.loc 1 360 3
	.loc 1 360 14 is_stmt 0
	ldrb	r3, [r0, #4]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 360 6
	cmp	r3, #1
	bne	.L14
	.loc 1 363 5 is_stmt 1
	.loc 1 363 20 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #4]
	.loc 1 366 5 is_stmt 1
	.loc 1 366 63 is_stmt 0
	mvn	r3, #268435456
	add	r3, r3, r1
	.loc 1 366 467
	ldr	r2, .L20
	cmp	r1, r2
	it	ne
	cmpne	r3, #1
	bls	.L15
	.loc 1 366 254 discriminator 2
	ldr	r3, .L20+4
	cmp	r1, r3
	ite	ne
	movne	r3, #0
	moveq	r3, #1
	.loc 1 366 234 discriminator 2
	adds	r2, r2, #4
	cmp	r1, r2
	beq	.L15
	cbnz	r3, .L15
	.loc 1 366 481 discriminator 4
	ldr	r2, [r0]
	.loc 1 366 491 discriminator 4
	ldr	r3, [r2]
	.loc 1 366 518 discriminator 4
	bic	r1, r1, #536870912
.LVL17:
	.loc 1 366 496 discriminator 4
	orrs	r3, r3, r1
	str	r3, [r2]
	b	.L18
.LVL18:
.L15:
	.loc 1 366 393 discriminator 3
	ldr	r3, [r0]
	.loc 1 366 419 discriminator 3
	bic	r3, r3, #255
	ldr	r2, [r3]
	.loc 1 366 448 discriminator 3
	bic	r1, r1, #268435456
.LVL19:
	.loc 1 366 426 discriminator 3
	orrs	r1, r1, r2
	str	r1, [r3]
.L18:
	.loc 1 369 5 is_stmt 1
	.loc 1 369 20 is_stmt 0
	movs	r3, #1
	strb	r3, [r0, #4]
	.loc 1 381 3 is_stmt 1
	.loc 1 381 10 is_stmt 0
	movs	r0, #0
.LVL20:
	bx	lr
.LVL21:
.L14:
	.loc 1 374 5 is_stmt 1
	.loc 1 374 24 is_stmt 0
	movs	r3, #2
	str	r3, [r0, #8]
	.loc 1 377 5 is_stmt 1
	.loc 1 377 12 is_stmt 0
	movs	r0, #1
.LVL22:
	.loc 1 382 1
	bx	lr
.L21:
	.align	2
.L20:
	.word	268435460
	.word	268435471
	.cfi_endproc
.LFE339:
	.size	HAL_RAMECC_EnableNotification, .-HAL_RAMECC_EnableNotification
	.section	.text.HAL_RAMECC_DisableNotification,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_DisableNotification
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_DisableNotification, %function
HAL_RAMECC_DisableNotification:
.LFB340:
	.loc 1 393 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL23:
	.loc 1 395 3
	.loc 1 396 3
	.loc 1 399 3
	.loc 1 399 14 is_stmt 0
	ldrb	r3, [r0, #4]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 399 6
	cmp	r3, #1
	bne	.L23
	.loc 1 402 5 is_stmt 1
	.loc 1 402 20 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #4]
	.loc 1 405 5 is_stmt 1
	.loc 1 405 63 is_stmt 0
	mvn	r3, #268435456
	add	r3, r3, r1
	.loc 1 405 468
	ldr	r2, .L29
	cmp	r1, r2
	it	ne
	cmpne	r3, #1
	bls	.L24
	.loc 1 405 254 discriminator 2
	ldr	r3, .L29+4
	cmp	r1, r3
	ite	ne
	movne	r3, #0
	moveq	r3, #1
	.loc 1 405 234 discriminator 2
	adds	r2, r2, #4
	cmp	r1, r2
	beq	.L24
	cbnz	r3, .L24
	.loc 1 405 482 discriminator 4
	ldr	r2, [r0]
	.loc 1 405 492 discriminator 4
	ldr	r3, [r2]
	.loc 1 405 520 discriminator 4
	bic	r1, r1, #536870912
.LVL24:
	.loc 1 405 497 discriminator 4
	bic	r3, r3, r1
	str	r3, [r2]
	b	.L27
.LVL25:
.L24:
	.loc 1 405 393 discriminator 3
	ldr	r3, [r0]
	.loc 1 405 419 discriminator 3
	bic	r3, r3, #255
	ldr	r2, [r3]
	.loc 1 405 449 discriminator 3
	bic	r1, r1, #268435456
.LVL26:
	.loc 1 405 426 discriminator 3
	bic	r1, r2, r1
	str	r1, [r3]
.L27:
	.loc 1 408 5 is_stmt 1
	.loc 1 408 20 is_stmt 0
	movs	r3, #1
	strb	r3, [r0, #4]
	.loc 1 420 3 is_stmt 1
	.loc 1 420 10 is_stmt 0
	movs	r0, #0
.LVL27:
	bx	lr
.LVL28:
.L23:
	.loc 1 413 5 is_stmt 1
	.loc 1 413 24 is_stmt 0
	movs	r3, #2
	str	r3, [r0, #8]
	.loc 1 416 5 is_stmt 1
	.loc 1 416 12 is_stmt 0
	movs	r0, #1
.LVL29:
	.loc 1 421 1
	bx	lr
.L30:
	.align	2
.L29:
	.word	268435460
	.word	268435471
	.cfi_endproc
.LFE340:
	.size	HAL_RAMECC_DisableNotification, .-HAL_RAMECC_DisableNotification
	.section	.text.HAL_RAMECC_DetectErrorCallback,"ax",%progbits
	.align	1
	.weak	HAL_RAMECC_DetectErrorCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_DetectErrorCallback, %function
HAL_RAMECC_DetectErrorCallback:
.LFB342:
	.loc 1 578 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL30:
	.loc 1 580 3
	.loc 1 585 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE342:
	.size	HAL_RAMECC_DetectErrorCallback, .-HAL_RAMECC_DetectErrorCallback
	.section	.text.HAL_RAMECC_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_IRQHandler, %function
HAL_RAMECC_IRQHandler:
.LFB341:
	.loc 1 532 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL31:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 533 3
	.loc 1 533 59 is_stmt 0
	ldr	r2, [r0]
	.loc 1 533 70
	bic	r3, r2, #255
	.loc 1 533 12
	ldr	r3, [r3]
.LVL32:
	.loc 1 534 3 is_stmt 1
	.loc 1 534 38 is_stmt 0
	ldr	r1, [r2]
	.loc 1 534 12
	lsr	ip, r1, #1
.LVL33:
	.loc 1 535 3 is_stmt 1
	.loc 1 535 12 is_stmt 0
	ldr	r4, [r2, #4]
.LVL34:
	.loc 1 538 3 is_stmt 1
	.loc 1 538 6 is_stmt 0
	tst	r3, #1
	beq	.L33
	.loc 1 540 13
	ldr	r3, .L38
.LVL35:
.L33:
	.loc 1 544 3 is_stmt 1
	.loc 1 544 6 is_stmt 0
	tst	r4, #1
	beq	.L34
	.loc 1 546 5 is_stmt 1
	.loc 1 546 12 is_stmt 0
	ldr	r1, [r0, #12]
	.loc 1 546 30
	orr	r1, r1, #1
	str	r1, [r0, #12]
.L34:
	.loc 1 550 3 is_stmt 1
	.loc 1 550 6 is_stmt 0
	tst	r4, #6
	beq	.L35
	.loc 1 552 5 is_stmt 1
	.loc 1 552 12 is_stmt 0
	ldr	r1, [r0, #12]
	.loc 1 552 30
	orr	r1, r1, #2
	str	r1, [r0, #12]
.L35:
	.loc 1 556 3 is_stmt 1
	.loc 1 556 23 is_stmt 0
	ldr	r1, [r2, #4]
	.loc 1 556 44
	orr	r3, r3, ip
.LVL36:
	.loc 1 556 54
	and	r3, r3, r4, lsl #1
	.loc 1 556 28
	bic	r3, r1, r3, lsr #1
	str	r3, [r2, #4]
	.loc 1 567 3 is_stmt 1
	bl	HAL_RAMECC_DetectErrorCallback
.LVL37:
	.loc 1 569 1 is_stmt 0
	pop	{r4, pc}
.LVL38:
.L39:
	.align	2
.L38:
	.word	268435471
	.cfi_endproc
.LFE341:
	.size	HAL_RAMECC_IRQHandler, .-HAL_RAMECC_IRQHandler
	.section	.text.HAL_RAMECC_GetFailingAddress,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_GetFailingAddress
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_GetFailingAddress, %function
HAL_RAMECC_GetFailingAddress:
.LFB343:
	.loc 1 617 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL39:
	.loc 1 619 3
	.loc 1 622 3
	.loc 1 622 17 is_stmt 0
	ldr	r3, [r0]
	.loc 1 622 27
	ldr	r0, [r3, #8]
.LVL40:
	.loc 1 623 1
	bx	lr
	.cfi_endproc
.LFE343:
	.size	HAL_RAMECC_GetFailingAddress, .-HAL_RAMECC_GetFailingAddress
	.section	.text.HAL_RAMECC_GetFailingDataLow,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_GetFailingDataLow
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_GetFailingDataLow, %function
HAL_RAMECC_GetFailingDataLow:
.LFB344:
	.loc 1 633 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL41:
	.loc 1 635 3
	.loc 1 638 3
	.loc 1 638 17 is_stmt 0
	ldr	r3, [r0]
	.loc 1 638 27
	ldr	r0, [r3, #12]
.LVL42:
	.loc 1 639 1
	bx	lr
	.cfi_endproc
.LFE344:
	.size	HAL_RAMECC_GetFailingDataLow, .-HAL_RAMECC_GetFailingDataLow
	.section	.text.HAL_RAMECC_GetFailingDataHigh,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_GetFailingDataHigh
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_GetFailingDataHigh, %function
HAL_RAMECC_GetFailingDataHigh:
.LFB345:
	.loc 1 649 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL43:
	.loc 1 651 3
	.loc 1 654 3
	.loc 1 654 17 is_stmt 0
	ldr	r3, [r0]
	.loc 1 654 27
	ldr	r0, [r3, #16]
.LVL44:
	.loc 1 655 1
	bx	lr
	.cfi_endproc
.LFE345:
	.size	HAL_RAMECC_GetFailingDataHigh, .-HAL_RAMECC_GetFailingDataHigh
	.section	.text.HAL_RAMECC_GetHammingErrorCode,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_GetHammingErrorCode
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_GetHammingErrorCode, %function
HAL_RAMECC_GetHammingErrorCode:
.LFB346:
	.loc 1 665 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL45:
	.loc 1 667 3
	.loc 1 670 3
	.loc 1 670 17 is_stmt 0
	ldr	r3, [r0]
	.loc 1 670 27
	ldr	r0, [r3, #20]
.LVL46:
	.loc 1 671 1
	bx	lr
	.cfi_endproc
.LFE346:
	.size	HAL_RAMECC_GetHammingErrorCode, .-HAL_RAMECC_GetHammingErrorCode
	.section	.text.HAL_RAMECC_IsECCSingleErrorDetected,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_IsECCSingleErrorDetected
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_IsECCSingleErrorDetected, %function
HAL_RAMECC_IsECCSingleErrorDetected:
.LFB347:
	.loc 1 681 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL47:
	.loc 1 683 3
	.loc 1 686 3
	.loc 1 686 21 is_stmt 0
	ldr	r3, [r0]
	.loc 1 686 31
	ldr	r0, [r3, #4]
.LVL48:
	.loc 1 686 86
	ands	r0, r0, #1
	beq	.L44
	movs	r0, #1
.L44:
	.loc 1 687 1
	bx	lr
	.cfi_endproc
.LFE347:
	.size	HAL_RAMECC_IsECCSingleErrorDetected, .-HAL_RAMECC_IsECCSingleErrorDetected
	.section	.text.HAL_RAMECC_IsECCDoubleErrorDetected,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_IsECCDoubleErrorDetected
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_IsECCDoubleErrorDetected, %function
HAL_RAMECC_IsECCDoubleErrorDetected:
.LFB348:
	.loc 1 697 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL49:
	.loc 1 699 3
	.loc 1 702 3
	.loc 1 702 21 is_stmt 0
	ldr	r3, [r0]
	.loc 1 702 31
	ldr	r0, [r3, #4]
.LVL50:
	.loc 1 702 91
	ands	r0, r0, #6
	beq	.L46
	movs	r0, #1
.L46:
	.loc 1 703 1
	bx	lr
	.cfi_endproc
.LFE348:
	.size	HAL_RAMECC_IsECCDoubleErrorDetected, .-HAL_RAMECC_IsECCDoubleErrorDetected
	.section	.text.HAL_RAMECC_GetState,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_GetState
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_GetState, %function
HAL_RAMECC_GetState:
.LFB349:
	.loc 1 738 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL51:
	.loc 1 740 3
	.loc 1 740 17 is_stmt 0
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
.LVL52:
	.loc 1 741 1
	bx	lr
	.cfi_endproc
.LFE349:
	.size	HAL_RAMECC_GetState, .-HAL_RAMECC_GetState
	.section	.text.HAL_RAMECC_GetError,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_GetError
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_GetError, %function
HAL_RAMECC_GetError:
.LFB350:
	.loc 1 751 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL53:
	.loc 1 753 3
	.loc 1 753 17 is_stmt 0
	ldr	r0, [r0, #8]
.LVL54:
	.loc 1 754 1
	bx	lr
	.cfi_endproc
.LFE350:
	.size	HAL_RAMECC_GetError, .-HAL_RAMECC_GetError
	.section	.text.HAL_RAMECC_GetRAMECCError,"ax",%progbits
	.align	1
	.global	HAL_RAMECC_GetRAMECCError
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RAMECC_GetRAMECCError, %function
HAL_RAMECC_GetRAMECCError:
.LFB351:
	.loc 1 764 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL55:
	.loc 1 766 3
	.loc 1 766 17 is_stmt 0
	ldr	r0, [r0, #12]
.LVL56:
	.loc 1 767 1
	bx	lr
	.cfi_endproc
.LFE351:
	.size	HAL_RAMECC_GetRAMECCError, .-HAL_RAMECC_GetRAMECCError
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_ramecc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x4f3
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x11
	.4byte	.LASF57
	.byte	0x1d
	.4byte	.LASF58
	.4byte	.LASF59
	.4byte	.LLRL21
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
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x55
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x12
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x49
	.uleb128 0xa
	.4byte	0x78
	.uleb128 0xb
	.byte	0x18
	.2byte	0x668
	.4byte	0xd8
	.uleb128 0x6
	.ascii	"CR\000"
	.2byte	0x66a
	.4byte	0x84
	.byte	0
	.uleb128 0x6
	.ascii	"SR\000"
	.2byte	0x66b
	.4byte	0x84
	.byte	0x4
	.uleb128 0x6
	.ascii	"FAR\000"
	.2byte	0x66c
	.4byte	0x84
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF11
	.2byte	0x66d
	.4byte	0x84
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF12
	.2byte	0x66e
	.4byte	0x84
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF13
	.2byte	0x66f
	.4byte	0x84
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.4byte	.LASF14
	.2byte	0x670
	.4byte	0x89
	.uleb128 0xb
	.byte	0x4
	.2byte	0x672
	.4byte	0xf8
	.uleb128 0x6
	.ascii	"IER\000"
	.2byte	0x674
	.4byte	0x84
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF15
	.2byte	0x675
	.4byte	0xe3
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF16
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF17
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF18
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF19
	.uleb128 0xd
	.4byte	0x34
	.byte	0x5
	.byte	0x28
	.4byte	0x143
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x2
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0x11f
	.uleb128 0xd
	.4byte	0x34
	.byte	0x6
	.byte	0x31
	.4byte	0x173
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF27
	.byte	0x2
	.uleb128 0x4
	.4byte	.LASF28
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.4byte	.LASF29
	.byte	0x6
	.byte	0x36
	.byte	0x2
	.4byte	0x14f
	.uleb128 0xa
	.4byte	0x173
	.uleb128 0x13
	.byte	0x10
	.byte	0x6
	.byte	0x3f
	.byte	0x9
	.4byte	0x1be
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0x42
	.byte	0x1a
	.4byte	0x1be
	.byte	0
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x43
	.byte	0x24
	.4byte	0x17f
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0x44
	.byte	0x15
	.4byte	0x84
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF33
	.byte	0x45
	.byte	0x15
	.4byte	0x84
	.byte	0xc
	.byte	0
	.uleb128 0xe
	.4byte	0xd8
	.uleb128 0x5
	.4byte	.LASF34
	.byte	0x6
	.byte	0x49
	.byte	0x2
	.4byte	0x184
	.uleb128 0x3
	.4byte	.LASF35
	.2byte	0x2fb
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1fa
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x2fb
	.byte	0x3a
	.4byte	0x1fa
	.4byte	.LLST20
	.byte	0
	.uleb128 0xe
	.4byte	0x1c3
	.uleb128 0x3
	.4byte	.LASF36
	.2byte	0x2ee
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x22a
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x2ee
	.byte	0x34
	.4byte	0x1fa
	.4byte	.LLST19
	.byte	0
	.uleb128 0x3
	.4byte	.LASF38
	.2byte	0x2e1
	.byte	0x19
	.4byte	0x173
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x255
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x2e1
	.byte	0x43
	.4byte	0x1fa
	.4byte	.LLST18
	.byte	0
	.uleb128 0x3
	.4byte	.LASF39
	.2byte	0x2b8
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x280
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x2b8
	.byte	0x44
	.4byte	0x1fa
	.4byte	.LLST17
	.byte	0
	.uleb128 0x3
	.4byte	.LASF40
	.2byte	0x2a8
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ab
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x2a8
	.byte	0x44
	.4byte	0x1fa
	.4byte	.LLST16
	.byte	0
	.uleb128 0x3
	.4byte	.LASF41
	.2byte	0x298
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d6
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x298
	.byte	0x3f
	.4byte	0x1fa
	.4byte	.LLST15
	.byte	0
	.uleb128 0x3
	.4byte	.LASF42
	.2byte	0x288
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x301
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x288
	.byte	0x3e
	.4byte	0x1fa
	.4byte	.LLST14
	.byte	0
	.uleb128 0x3
	.4byte	.LASF43
	.2byte	0x278
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x32c
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x278
	.byte	0x3d
	.4byte	0x1fa
	.4byte	.LLST13
	.byte	0
	.uleb128 0x3
	.4byte	.LASF44
	.2byte	0x268
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x357
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x268
	.byte	0x3d
	.4byte	0x1fa
	.4byte	.LLST12
	.byte	0
	.uleb128 0xf
	.4byte	.LASF45
	.2byte	0x241
	.byte	0x1c
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x37d
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x241
	.byte	0x51
	.4byte	0x1fa
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF46
	.2byte	0x213
	.byte	0x6
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3da
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x213
	.byte	0x32
	.4byte	0x1fa
	.4byte	.LLST8
	.uleb128 0x9
	.4byte	.LASF47
	.2byte	0x215
	.4byte	0x78
	.4byte	.LLST9
	.uleb128 0x9
	.4byte	.LASF48
	.2byte	0x216
	.4byte	0x78
	.4byte	.LLST10
	.uleb128 0x9
	.4byte	.LASF49
	.2byte	0x217
	.4byte	0x78
	.4byte	.LLST11
	.uleb128 0x15
	.4byte	.LVL37
	.4byte	0x357
	.byte	0
	.uleb128 0x3
	.4byte	.LASF50
	.2byte	0x188
	.byte	0x13
	.4byte	0x143
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x415
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x188
	.byte	0x48
	.4byte	0x1fa
	.4byte	.LLST6
	.uleb128 0x1
	.4byte	.LASF51
	.2byte	0x188
	.byte	0x5a
	.4byte	0x78
	.4byte	.LLST7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF52
	.2byte	0x161
	.byte	0x13
	.4byte	0x143
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x450
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x161
	.byte	0x47
	.4byte	0x1fa
	.4byte	.LLST4
	.uleb128 0x1
	.4byte	.LASF51
	.2byte	0x161
	.byte	0x59
	.4byte	0x78
	.4byte	.LLST5
	.byte	0
	.uleb128 0x3
	.4byte	.LASF53
	.2byte	0x13b
	.byte	0x13
	.4byte	0x143
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x47b
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x13b
	.byte	0x40
	.4byte	0x1fa
	.4byte	.LLST3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF54
	.2byte	0x116
	.byte	0x13
	.4byte	0x143
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4a6
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x116
	.byte	0x41
	.4byte	0x1fa
	.4byte	.LLST2
	.byte	0
	.uleb128 0x16
	.4byte	.LASF55
	.byte	0x1
	.byte	0xd0
	.byte	0x13
	.4byte	0x143
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4d0
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0xd0
	.byte	0x3b
	.4byte	0x1fa
	.4byte	.LLST1
	.byte	0
	.uleb128 0x17
	.4byte	.LASF56
	.byte	0x1
	.byte	0xa0
	.byte	0x13
	.4byte	0x143
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0xa0
	.byte	0x39
	.4byte	0x1fa
	.4byte	.LLST0
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
	.uleb128 0x5
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
	.uleb128 0x8
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
	.uleb128 0x21
	.sleb128 21
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
.LLST20:
	.byte	0x6
	.4byte	.LVL55
	.byte	0x4
	.uleb128 .LVL55-.LVL55
	.uleb128 .LVL56-.LVL55
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL56-.LVL55
	.uleb128 .LFE351-.LVL55
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL53
	.byte	0x4
	.uleb128 .LVL53-.LVL53
	.uleb128 .LVL54-.LVL53
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL54-.LVL53
	.uleb128 .LFE350-.LVL53
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST18:
	.byte	0x6
	.4byte	.LVL51
	.byte	0x4
	.uleb128 .LVL51-.LVL51
	.uleb128 .LVL52-.LVL51
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL52-.LVL51
	.uleb128 .LFE349-.LVL51
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x6
	.4byte	.LVL49
	.byte	0x4
	.uleb128 .LVL49-.LVL49
	.uleb128 .LVL50-.LVL49
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL50-.LVL49
	.uleb128 .LFE348-.LVL49
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST16:
	.byte	0x6
	.4byte	.LVL47
	.byte	0x4
	.uleb128 .LVL47-.LVL47
	.uleb128 .LVL48-.LVL47
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL48-.LVL47
	.uleb128 .LFE347-.LVL47
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x6
	.4byte	.LVL45
	.byte	0x4
	.uleb128 .LVL45-.LVL45
	.uleb128 .LVL46-.LVL45
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL46-.LVL45
	.uleb128 .LFE346-.LVL45
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL43
	.byte	0x4
	.uleb128 .LVL43-.LVL43
	.uleb128 .LVL44-.LVL43
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL44-.LVL43
	.uleb128 .LFE345-.LVL43
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL41
	.byte	0x4
	.uleb128 .LVL41-.LVL41
	.uleb128 .LVL42-.LVL41
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL42-.LVL41
	.uleb128 .LFE344-.LVL41
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST12:
	.byte	0x6
	.4byte	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL40-.LVL39
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL40-.LVL39
	.uleb128 .LFE343-.LVL39
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL31
	.byte	0x4
	.uleb128 .LVL31-.LVL31
	.uleb128 .LVL37-1-.LVL31
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL37-1-.LVL31
	.uleb128 .LFE341-.LVL31
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x8
	.4byte	.LVL32
	.uleb128 .LVL36-.LVL32
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST10:
	.byte	0x8
	.4byte	.LVL33
	.uleb128 .LVL37-1-.LVL33
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST11:
	.byte	0x8
	.4byte	.LVL34
	.uleb128 .LVL38-.LVL34
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL23
	.byte	0x4
	.uleb128 .LVL23-.LVL23
	.uleb128 .LVL27-.LVL23
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL27-.LVL23
	.uleb128 .LVL28-.LVL23
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL28-.LVL23
	.uleb128 .LVL29-.LVL23
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL29-.LVL23
	.uleb128 .LFE340-.LVL23
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL23
	.byte	0x4
	.uleb128 .LVL23-.LVL23
	.uleb128 .LVL24-.LVL23
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL24-.LVL23
	.uleb128 .LVL25-.LVL23
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL25-.LVL23
	.uleb128 .LVL26-.LVL23
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL26-.LVL23
	.uleb128 .LVL28-.LVL23
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL28-.LVL23
	.uleb128 .LFE340-.LVL23
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL20-.LVL16
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL20-.LVL16
	.uleb128 .LVL21-.LVL16
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL21-.LVL16
	.uleb128 .LVL22-.LVL16
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL22-.LVL16
	.uleb128 .LFE339-.LVL16
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
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL17-.LVL16
	.uleb128 .LVL18-.LVL16
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL18-.LVL16
	.uleb128 .LVL19-.LVL16
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL19-.LVL16
	.uleb128 .LVL21-.LVL16
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL21-.LVL16
	.uleb128 .LFE339-.LVL16
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL12
	.byte	0x4
	.uleb128 .LVL12-.LVL12
	.uleb128 .LVL13-.LVL12
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL13-.LVL12
	.uleb128 .LVL14-.LVL12
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL12
	.uleb128 .LVL15-.LVL12
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL15-.LVL12
	.uleb128 .LFE338-.LVL12
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
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
	.uleb128 .LVL11-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL11-.LVL8
	.uleb128 .LFE337-.LVL8
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
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL6-.LVL4
	.uleb128 .LVL7-.LVL4
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL7-.LVL4
	.uleb128 .LFE336-.LVL4
	.uleb128 0x1
	.byte	0x53
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
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x9c
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
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
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
.LLRL21:
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
	.4byte	.LFB342
	.uleb128 .LFE342-.LFB342
	.byte	0x7
	.4byte	.LFB341
	.uleb128 .LFE341-.LFB341
	.byte	0x7
	.4byte	.LFB343
	.uleb128 .LFE343-.LFB343
	.byte	0x7
	.4byte	.LFB344
	.uleb128 .LFE344-.LFB344
	.byte	0x7
	.4byte	.LFB345
	.uleb128 .LFE345-.LFB345
	.byte	0x7
	.4byte	.LFB346
	.uleb128 .LFE346-.LFB346
	.byte	0x7
	.4byte	.LFB347
	.uleb128 .LFE347-.LFB347
	.byte	0x7
	.4byte	.LFB348
	.uleb128 .LFE348-.LFB348
	.byte	0x7
	.4byte	.LFB349
	.uleb128 .LFE349-.LFB349
	.byte	0x7
	.4byte	.LFB350
	.uleb128 .LFE350-.LFB350
	.byte	0x7
	.4byte	.LFB351
	.uleb128 .LFE351-.LFB351
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF35:
	.ascii	"HAL_RAMECC_GetRAMECCError\000"
.LASF21:
	.ascii	"HAL_ERROR\000"
.LASF29:
	.ascii	"HAL_RAMECC_StateTypeDef\000"
.LASF23:
	.ascii	"HAL_TIMEOUT\000"
.LASF13:
	.ascii	"FECR\000"
.LASF37:
	.ascii	"hramecc\000"
.LASF41:
	.ascii	"HAL_RAMECC_GetHammingErrorCode\000"
.LASF59:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF0:
	.ascii	"short int\000"
.LASF12:
	.ascii	"FDRH\000"
.LASF11:
	.ascii	"FDRL\000"
.LASF36:
	.ascii	"HAL_RAMECC_GetError\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF55:
	.ascii	"HAL_RAMECC_DeInit\000"
.LASF20:
	.ascii	"HAL_OK\000"
.LASF52:
	.ascii	"HAL_RAMECC_EnableNotification\000"
.LASF22:
	.ascii	"HAL_BUSY\000"
.LASF58:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_ramecc.c\000"
.LASF1:
	.ascii	"signed char\000"
.LASF49:
	.ascii	"sr_reg\000"
.LASF6:
	.ascii	"long long int\000"
.LASF31:
	.ascii	"State\000"
.LASF17:
	.ascii	"char\000"
.LASF42:
	.ascii	"HAL_RAMECC_GetFailingDataHigh\000"
.LASF56:
	.ascii	"HAL_RAMECC_Init\000"
.LASF33:
	.ascii	"RAMECCErrorCode\000"
.LASF24:
	.ascii	"HAL_StatusTypeDef\000"
.LASF16:
	.ascii	"long double\000"
.LASF14:
	.ascii	"RAMECC_MonitorTypeDef\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF53:
	.ascii	"HAL_RAMECC_StopMonitor\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF44:
	.ascii	"HAL_RAMECC_GetFailingAddress\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF28:
	.ascii	"HAL_RAMECC_STATE_ERROR\000"
.LASF47:
	.ascii	"ier_reg\000"
.LASF30:
	.ascii	"Instance\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF57:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF34:
	.ascii	"RAMECC_HandleTypeDef\000"
.LASF15:
	.ascii	"RAMECC_TypeDef\000"
.LASF4:
	.ascii	"long int\000"
.LASF39:
	.ascii	"HAL_RAMECC_IsECCDoubleErrorDetected\000"
.LASF18:
	.ascii	"float\000"
.LASF43:
	.ascii	"HAL_RAMECC_GetFailingDataLow\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF19:
	.ascii	"double\000"
.LASF27:
	.ascii	"HAL_RAMECC_STATE_BUSY\000"
.LASF46:
	.ascii	"HAL_RAMECC_IRQHandler\000"
.LASF40:
	.ascii	"HAL_RAMECC_IsECCSingleErrorDetected\000"
.LASF26:
	.ascii	"HAL_RAMECC_STATE_READY\000"
.LASF38:
	.ascii	"HAL_RAMECC_GetState\000"
.LASF45:
	.ascii	"HAL_RAMECC_DetectErrorCallback\000"
.LASF54:
	.ascii	"HAL_RAMECC_StartMonitor\000"
.LASF51:
	.ascii	"Notifications\000"
.LASF48:
	.ascii	"cr_reg\000"
.LASF32:
	.ascii	"ErrorCode\000"
.LASF25:
	.ascii	"HAL_RAMECC_STATE_RESET\000"
.LASF50:
	.ascii	"HAL_RAMECC_DisableNotification\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
