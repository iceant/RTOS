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
	.file	"stm32h7xx_hal_opamp.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_opamp.c"
	.section	.text.HAL_OPAMP_MspInit,"ax",%progbits
	.align	1
	.weak	HAL_OPAMP_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMP_MspInit, %function
HAL_OPAMP_MspInit:
.LFB337:
	.loc 1 480 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 482 3
	.loc 1 487 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_OPAMP_MspInit, .-HAL_OPAMP_MspInit
	.section	.text.HAL_OPAMP_Init,"ax",%progbits
	.align	1
	.global	HAL_OPAMP_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMP_Init, %function
HAL_OPAMP_Init:
.LFB335:
	.loc 1 275 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL1:
	.loc 1 276 3
	.loc 1 277 3
	.loc 1 281 3
	.loc 1 281 5 is_stmt 0
	cmp	r0, #0
	beq	.L11
	.loc 1 275 1
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 285 8 is_stmt 1
	.loc 1 285 17 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 285 10
	cmp	r3, #5
	beq	.L12
	.loc 1 289 8 is_stmt 1
	.loc 1 289 17 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 289 10
	cmp	r3, #2
	beq	.L13
	.loc 1 296 5 is_stmt 1
	.loc 1 299 5
	.loc 1 300 5
	.loc 1 301 5
	.loc 1 312 5
	.loc 1 314 7
	.loc 1 317 5
	.loc 1 319 7
	.loc 1 320 7
	.loc 1 324 5
	.loc 1 326 5
	.loc 1 335 9
	.loc 1 336 9
	.loc 1 340 5
	.loc 1 340 14 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	.loc 1 340 7
	cbnz	r3, .L4
	.loc 1 343 7 is_stmt 1
	.loc 1 343 20 is_stmt 0
	strb	r3, [r0, #49]
.L4:
	.loc 1 350 5 is_stmt 1
	mov	r0, r4
.LVL2:
	bl	HAL_OPAMP_MspInit
.LVL3:
	.loc 1 354 5
	.loc 1 354 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 354 23
	ldr	r3, [r2]
	.loc 1 354 30
	bic	r3, r3, #2048
	str	r3, [r2]
	.loc 1 356 5 is_stmt 1
	.loc 1 356 21 is_stmt 0
	ldr	r3, [r4, #8]
	.loc 1 356 8
	cmp	r3, #64
	beq	.L18
.L5:
	.loc 1 367 5 is_stmt 1
	.loc 1 367 21 is_stmt 0
	ldr	r3, [r4, #8]
	.loc 1 367 8
	cmp	r3, #96
	beq	.L19
.L6:
	.loc 1 377 5 is_stmt 1
	.loc 1 377 21 is_stmt 0
	ldr	r3, [r4, #8]
	.loc 1 377 8
	cbnz	r3, .L7
	.loc 1 379 7 is_stmt 1
	.loc 1 379 48 is_stmt 0
	ldr	r1, [r4]
	.loc 1 379 58
	ldr	r0, [r1]
	.loc 1 379 67
	ldr	r2, .L21
	ands	r2, r2, r0
	.loc 1 379 181
	ldr	r0, [r4, #4]
	.loc 1 379 192
	orrs	r3, r3, r0
	.loc 1 379 226
	ldr	r0, [r4, #12]
	.loc 1 379 212
	orrs	r3, r3, r0
	.loc 1 379 256
	ldr	r0, [r4, #16]
	.loc 1 379 242
	orrs	r3, r3, r0
	.loc 1 379 289
	ldr	r0, [r4, #28]
	.loc 1 379 275
	orrs	r3, r3, r0
	.loc 1 379 166
	orrs	r2, r2, r3
	.loc 1 379 34
	str	r2, [r1]
.L7:
	.loc 1 387 5 is_stmt 1
	.loc 1 387 21 is_stmt 0
	ldr	r3, [r4, #28]
	.loc 1 387 8
	cmp	r3, #262144
	beq	.L20
.L8:
	.loc 1 412 5 is_stmt 1
	.loc 1 412 15 is_stmt 0
	ldrb	r3, [r4, #50]	@ zero_extendqisi2
	.loc 1 412 8
	cbnz	r3, .L10
	.loc 1 415 7 is_stmt 1
	.loc 1 415 21 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #50]
.L10:
	.loc 1 418 5 is_stmt 1
	.loc 1 418 12 is_stmt 0
	movs	r0, #0
.L3:
	.loc 1 420 1
	pop	{r4, pc}
.LVL4:
.L18:
	.loc 1 358 7 is_stmt 1
	.loc 1 358 48 is_stmt 0
	ldr	r1, [r4]
	.loc 1 358 58
	ldr	r0, [r1]
	.loc 1 358 67
	ldr	r2, .L21+4
	ands	r2, r2, r0
	.loc 1 358 201
	ldr	r0, [r4, #4]
	.loc 1 358 212
	orrs	r3, r3, r0
	.loc 1 358 246
	ldr	r0, [r4, #20]
	.loc 1 358 232
	orrs	r3, r3, r0
	.loc 1 358 269
	ldr	r0, [r4, #24]
	.loc 1 358 255
	orrs	r3, r3, r0
	.loc 1 358 295
	ldr	r0, [r4, #16]
	.loc 1 358 281
	orrs	r3, r3, r0
	.loc 1 358 328
	ldr	r0, [r4, #28]
	.loc 1 358 314
	orrs	r3, r3, r0
	.loc 1 358 186
	orrs	r2, r2, r3
	.loc 1 358 34
	str	r2, [r1]
	b	.L5
.L19:
	.loc 1 370 5 is_stmt 1
	.loc 1 370 46 is_stmt 0
	ldr	r1, [r4]
	.loc 1 370 56
	ldr	r0, [r1]
	.loc 1 370 65
	ldr	r2, .L21
	ands	r2, r2, r0
	.loc 1 370 160
	ldr	r0, [r4, #4]
	.loc 1 370 171
	orrs	r3, r3, r0
	.loc 1 370 205
	ldr	r0, [r4, #16]
	.loc 1 370 191
	orrs	r3, r3, r0
	.loc 1 370 238
	ldr	r0, [r4, #28]
	.loc 1 370 224
	orrs	r3, r3, r0
	.loc 1 370 145
	orrs	r2, r2, r3
	.loc 1 370 32
	str	r2, [r1]
	b	.L6
.L20:
	.loc 1 390 7 is_stmt 1
	.loc 1 390 23 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 390 10
	cmp	r3, #256
	beq	.L9
	.loc 1 396 9 is_stmt 1
	.loc 1 396 41 is_stmt 0
	ldr	r2, [r4, #32]
	.loc 1 397 41
	ldr	r3, [r4, #36]
	.loc 1 396 24
	orr	r2, r3, r2, lsl #8
.LVL5:
	.loc 1 398 9 is_stmt 1
	.loc 1 398 50 is_stmt 0
	ldr	r1, [r4]
	.loc 1 398 60
	ldr	r0, [r1, #4]
	.loc 1 398 69
	ldr	r3, .L21+8
	ands	r3, r3, r0
	.loc 1 398 113
	orrs	r3, r3, r2
	.loc 1 398 36
	str	r3, [r1, #4]
	b	.L8
.LVL6:
.L9:
	.loc 1 405 9 is_stmt 1
	.loc 1 405 41 is_stmt 0
	ldr	r2, [r4, #40]
	.loc 1 406 41
	ldr	r3, [r4, #44]
	.loc 1 405 24
	orr	r2, r3, r2, lsl #8
.LVL7:
	.loc 1 407 9 is_stmt 1
	.loc 1 407 52 is_stmt 0
	ldr	r1, [r4]
	.loc 1 407 62
	ldr	r0, [r1, #8]
	.loc 1 407 73
	ldr	r3, .L21+8
	ands	r3, r3, r0
	.loc 1 407 117
	orrs	r3, r3, r2
	.loc 1 407 38
	str	r3, [r1, #8]
	b	.L8
.LVL8:
.L11:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 283 12
	movs	r0, #1
.LVL9:
	.loc 1 420 1
	bx	lr
.LVL10:
.L12:
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 287 12
	movs	r0, #1
.LVL11:
	b	.L3
.LVL12:
.L13:
	.loc 1 291 12
	movs	r0, #1
.LVL13:
	b	.L3
.L22:
	.align	2
.L21:
	.word	-262509
	.word	-508269
	.word	-7968
	.cfi_endproc
.LFE335:
	.size	HAL_OPAMP_Init, .-HAL_OPAMP_Init
	.section	.text.HAL_OPAMP_MspDeInit,"ax",%progbits
	.align	1
	.weak	HAL_OPAMP_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMP_MspDeInit, %function
HAL_OPAMP_MspDeInit:
.LFB338:
	.loc 1 495 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL14:
	.loc 1 497 3
	.loc 1 501 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE338:
	.size	HAL_OPAMP_MspDeInit, .-HAL_OPAMP_MspDeInit
	.section	.text.HAL_OPAMP_DeInit,"ax",%progbits
	.align	1
	.global	HAL_OPAMP_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMP_DeInit, %function
HAL_OPAMP_DeInit:
.LFB336:
	.loc 1 430 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL15:
	.loc 1 431 3
	.loc 1 435 3
	.loc 1 435 5 is_stmt 0
	cbz	r0, .L26
	.loc 1 430 1
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r5, r0
	.loc 1 439 8 is_stmt 1
	.loc 1 439 17 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 439 10
	cmp	r3, #2
	bne	.L32
	.loc 1 441 12
	movs	r0, #1
.LVL16:
.L25:
	.loc 1 466 7 is_stmt 1 discriminator 1
	.loc 1 470 3 discriminator 1
	.loc 1 471 1 is_stmt 0 discriminator 1
	pop	{r3, r4, r5, pc}
.LVL17:
.L32:
	.loc 1 446 5 is_stmt 1
	.loc 1 449 5
	.loc 1 449 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 449 30
	movs	r4, #0
	str	r4, [r3]
	.loc 1 460 5 is_stmt 1
	bl	HAL_OPAMP_MspDeInit
.LVL18:
	.loc 1 464 5
	.loc 1 464 19 is_stmt 0
	strb	r4, [r5, #50]
	.loc 1 466 5 is_stmt 1
	.loc 1 466 9
	.loc 1 466 24 is_stmt 0
	strb	r4, [r5, #49]
	.loc 1 431 21
	mov	r0, r4
	b	.L25
.LVL19:
.L26:
	.cfi_def_cfa_offset 0
	.cfi_restore 3
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 14
	.loc 1 437 12
	movs	r0, #1
.LVL20:
	.loc 1 466 7 is_stmt 1
	.loc 1 470 3
	.loc 1 471 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE336:
	.size	HAL_OPAMP_DeInit, .-HAL_OPAMP_DeInit
	.section	.text.HAL_OPAMP_Start,"ax",%progbits
	.align	1
	.global	HAL_OPAMP_Start
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMP_Start, %function
HAL_OPAMP_Start:
.LFB339:
	.loc 1 529 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL21:
	.loc 1 530 3
	.loc 1 534 3
	.loc 1 534 5 is_stmt 0
	cbz	r0, .L35
	.loc 1 538 8 is_stmt 1
	.loc 1 538 17 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 538 10
	cmp	r3, #5
	beq	.L36
	.loc 1 545 5 is_stmt 1
	.loc 1 547 5
	.loc 1 547 14 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 547 7
	cmp	r3, #1
	beq	.L38
	.loc 1 558 14
	movs	r0, #1
.LVL22:
	.loc 1 562 3 is_stmt 1
	.loc 1 563 1 is_stmt 0
	bx	lr
.LVL23:
.L38:
	.loc 1 550 7 is_stmt 1
	.loc 1 550 15 is_stmt 0
	ldr	r1, [r0]
	.loc 1 550 25
	ldr	r3, [r1]
	.loc 1 550 32
	orr	r3, r3, #1
	str	r3, [r1]
	.loc 1 554 7 is_stmt 1
	.loc 1 554 21 is_stmt 0
	movs	r3, #4
	strb	r3, [r0, #50]
	.loc 1 530 21
	movs	r0, #0
.LVL24:
	bx	lr
.LVL25:
.L35:
	.loc 1 536 12
	movs	r0, #1
.LVL26:
	bx	lr
.LVL27:
.L36:
	.loc 1 540 12
	movs	r0, #1
.LVL28:
	bx	lr
	.cfi_endproc
.LFE339:
	.size	HAL_OPAMP_Start, .-HAL_OPAMP_Start
	.section	.text.HAL_OPAMP_Stop,"ax",%progbits
	.align	1
	.global	HAL_OPAMP_Stop
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMP_Stop, %function
HAL_OPAMP_Stop:
.LFB340:
	.loc 1 571 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL29:
	.loc 1 572 3
	.loc 1 577 3
	.loc 1 577 5 is_stmt 0
	cbz	r0, .L41
	.loc 1 581 8 is_stmt 1
	.loc 1 581 17 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 581 10
	cmp	r3, #5
	beq	.L42
	.loc 1 585 8 is_stmt 1
	.loc 1 585 17 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 585 10
	cmp	r3, #2
	beq	.L43
	.loc 1 592 5 is_stmt 1
	.loc 1 594 5
	.loc 1 594 14 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 594 7
	cmp	r3, #4
	beq	.L45
	.loc 1 605 14
	movs	r0, #1
.LVL30:
	.loc 1 608 3 is_stmt 1
	.loc 1 609 1 is_stmt 0
	bx	lr
.LVL31:
.L45:
	.loc 1 597 7 is_stmt 1
	.loc 1 597 15 is_stmt 0
	ldr	r1, [r0]
	.loc 1 597 25
	ldr	r3, [r1]
	.loc 1 597 32
	bic	r3, r3, #1
	str	r3, [r1]
	.loc 1 601 7 is_stmt 1
	.loc 1 601 21 is_stmt 0
	movs	r3, #1
	strb	r3, [r0, #50]
	.loc 1 572 21
	movs	r0, #0
.LVL32:
	bx	lr
.LVL33:
.L41:
	.loc 1 579 12
	movs	r0, #1
.LVL34:
	bx	lr
.LVL35:
.L42:
	.loc 1 583 12
	movs	r0, #1
.LVL36:
	bx	lr
.LVL37:
.L43:
	.loc 1 587 12
	movs	r0, #1
.LVL38:
	bx	lr
	.cfi_endproc
.LFE340:
	.size	HAL_OPAMP_Stop, .-HAL_OPAMP_Stop
	.section	.text.HAL_OPAMP_SelfCalibrate,"ax",%progbits
	.align	1
	.global	HAL_OPAMP_SelfCalibrate
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMP_SelfCalibrate, %function
HAL_OPAMP_SelfCalibrate:
.LFB341:
	.loc 1 622 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL39:
	.loc 1 624 3
	.loc 1 626 3
	.loc 1 627 3
	.loc 1 628 3
	.loc 1 629 3
	.loc 1 631 3
	.loc 1 635 3
	.loc 1 635 5 is_stmt 0
	cmp	r0, #0
	beq	.L62
	.loc 1 622 1
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 4, -28
	.cfi_offset 5, -24
	.cfi_offset 6, -20
	.cfi_offset 7, -16
	.cfi_offset 8, -12
	.cfi_offset 9, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 639 8 is_stmt 1
	.loc 1 639 17 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 639 10
	cmp	r3, #5
	beq	.L63
	.loc 1 647 5 is_stmt 1
	.loc 1 647 14 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 647 7
	cmp	r3, #1
	beq	.L69
	.loc 1 821 14
	movs	r0, #1
.LVL40:
.L47:
	.loc 1 824 3 is_stmt 1
	.loc 1 825 1 is_stmt 0
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.LVL41:
.L69:
	.loc 1 650 7 is_stmt 1
	.loc 1 651 7
	.loc 1 653 7
	.loc 1 653 27 is_stmt 0
	ldr	r3, [r0]
	.loc 1 653 37
	ldr	r2, [r3]
	.loc 1 653 17
	and	r9, r2, #96
.LVL42:
	.loc 1 656 7 is_stmt 1
	.loc 1 656 58 is_stmt 0
	ldr	r2, [r3]
	.loc 1 656 91
	bic	r2, r2, #96
	.loc 1 656 34
	str	r2, [r3]
	.loc 1 658 7 is_stmt 1
	.loc 1 658 15 is_stmt 0
	ldr	r2, [r0]
	.loc 1 658 25
	ldr	r3, [r2]
	.loc 1 658 32
	orr	r3, r3, #262144
	str	r3, [r2]
	.loc 1 661 7 is_stmt 1
	.loc 1 661 23 is_stmt 0
	ldr	r3, [r0, #4]
	.loc 1 661 10
	cbnz	r3, .L48
	.loc 1 663 9 is_stmt 1
	.loc 1 663 41 is_stmt 0
	ldr	r5, [r0]
	.loc 1 663 32
	adds	r5, r5, #4
.LVL43:
.L49:
	.loc 1 674 7 is_stmt 1
	.loc 1 674 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 674 25
	ldr	r3, [r2]
	.loc 1 674 32
	orr	r3, r3, #2048
	str	r3, [r2]
	.loc 1 677 7 is_stmt 1
	.loc 1 677 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 677 25
	ldr	r3, [r2]
	.loc 1 677 32
	orr	r3, r3, #2
	str	r3, [r2]
	.loc 1 680 7 is_stmt 1
	.loc 1 680 48 is_stmt 0
	ldr	r2, [r4]
	.loc 1 680 58
	ldr	r3, [r2]
	.loc 1 680 92
	orr	r3, r3, #12288
	.loc 1 680 34
	str	r3, [r2]
	.loc 1 683 7 is_stmt 1
	.loc 1 683 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 683 25
	ldr	r3, [r2]
	.loc 1 683 32
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 687 7 is_stmt 1
.LVL44:
	.loc 1 688 7
	.loc 1 690 7
	.loc 1 688 13 is_stmt 0
	movs	r6, #8
	.loc 1 687 22
	mov	r8, #16
	.loc 1 690 13
	b	.L50
.LVL45:
.L48:
	.loc 1 669 9 is_stmt 1
	.loc 1 669 41 is_stmt 0
	ldr	r5, [r0]
	.loc 1 669 32
	adds	r5, r5, #8
.LVL46:
	b	.L49
.LVL47:
.L51:
	.loc 1 709 11 is_stmt 1
	.loc 1 709 26 is_stmt 0
	sub	r8, r8, r6
.LVL48:
.L52:
	.loc 1 712 9 is_stmt 1
	.loc 1 712 15 is_stmt 0
	lsrs	r6, r6, #1
.LVL49:
.L50:
	.loc 1 690 20 is_stmt 1
	cbz	r6, .L70
	.loc 1 694 9
	.loc 1 694 46 is_stmt 0
	ldr	r3, [r5]
	.loc 1 694 73
	bic	r3, r3, #31
	.loc 1 694 98
	orr	r3, r3, r8
	.loc 1 694 38
	str	r3, [r5]
	.loc 1 699 9 is_stmt 1
	movs	r0, #2
	bl	HAL_Delay
.LVL50:
	.loc 1 701 9
	.loc 1 701 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 701 31
	ldr	r3, [r3]
	.loc 1 701 12
	tst	r3, #1073741824
	beq	.L51
	.loc 1 704 11 is_stmt 1
	.loc 1 704 26 is_stmt 0
	add	r8, r8, r6
.LVL51:
	b	.L52
.L70:
	.loc 1 718 7 is_stmt 1
	.loc 1 718 44 is_stmt 0
	ldr	r3, [r5]
	.loc 1 718 71
	bic	r3, r3, #31
	.loc 1 718 96
	orr	r3, r3, r8
	.loc 1 718 36
	str	r3, [r5]
	.loc 1 723 7 is_stmt 1
	movs	r0, #2
	bl	HAL_Delay
.LVL52:
	.loc 1 725 7
	.loc 1 725 20 is_stmt 0
	ldr	r3, [r4]
	.loc 1 725 30
	ldr	r3, [r3]
	.loc 1 725 10
	tst	r3, #1073741824
	beq	.L54
	.loc 1 728 9 is_stmt 1
	.loc 1 728 23 is_stmt 0
	add	r8, r8, #1
.LVL53:
	.loc 1 730 9 is_stmt 1
	.loc 1 730 46 is_stmt 0
	ldr	r3, [r5]
	.loc 1 730 73
	bic	r3, r3, #31
	.loc 1 730 98
	orr	r3, r3, r8
	.loc 1 730 38
	str	r3, [r5]
.L54:
	.loc 1 734 7 is_stmt 1
	.loc 1 734 48 is_stmt 0
	ldr	r2, [r4]
	.loc 1 734 58
	ldr	r3, [r2]
	.loc 1 734 67
	bic	r3, r3, #12288
	.loc 1 734 92
	orr	r3, r3, #4096
	.loc 1 734 34
	str	r3, [r2]
	.loc 1 738 7 is_stmt 1
.LVL54:
	.loc 1 739 7
	.loc 1 741 7
	.loc 1 739 13 is_stmt 0
	movs	r6, #8
	.loc 1 738 22
	movs	r7, #16
	.loc 1 741 13
	b	.L55
.LVL55:
.L56:
	.loc 1 760 11 is_stmt 1
	.loc 1 760 26 is_stmt 0
	subs	r7, r7, r6
.LVL56:
.L57:
	.loc 1 764 9 is_stmt 1
	.loc 1 764 15 is_stmt 0
	lsrs	r6, r6, #1
.LVL57:
.L55:
	.loc 1 741 20 is_stmt 1
	cbz	r6, .L71
	.loc 1 745 9
	.loc 1 745 46 is_stmt 0
	ldr	r3, [r5]
	.loc 1 745 73
	bic	r3, r3, #7936
	.loc 1 745 98
	orr	r3, r3, r7, lsl #8
	.loc 1 745 38
	str	r3, [r5]
	.loc 1 750 9 is_stmt 1
	movs	r0, #2
	bl	HAL_Delay
.LVL58:
	.loc 1 752 9
	.loc 1 752 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 752 31
	ldr	r3, [r3]
	.loc 1 752 12
	tst	r3, #1073741824
	beq	.L56
	.loc 1 755 11 is_stmt 1
	.loc 1 755 26 is_stmt 0
	add	r7, r7, r6
.LVL59:
	b	.L57
.L71:
	.loc 1 770 7 is_stmt 1
	.loc 1 770 44 is_stmt 0
	ldr	r3, [r5]
	.loc 1 770 71
	bic	r3, r3, #7936
	.loc 1 770 96
	orr	r3, r3, r7, lsl #8
	.loc 1 770 36
	str	r3, [r5]
	.loc 1 775 7 is_stmt 1
	movs	r0, #2
	bl	HAL_Delay
.LVL60:
	.loc 1 777 7
	.loc 1 777 19 is_stmt 0
	ldr	r3, [r4]
	.loc 1 777 29
	ldr	r3, [r3]
	.loc 1 777 10
	tst	r3, #1073741824
	beq	.L59
	.loc 1 780 9 is_stmt 1
	.loc 1 780 23 is_stmt 0
	adds	r7, r7, #1
.LVL61:
	.loc 1 781 9 is_stmt 1
	.loc 1 781 46 is_stmt 0
	ldr	r3, [r5]
	.loc 1 781 73
	bic	r3, r3, #7936
	.loc 1 781 98
	orr	r3, r3, r7, lsl #8
	.loc 1 781 38
	str	r3, [r5]
.L59:
	.loc 1 785 7 is_stmt 1
	.loc 1 785 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 785 25
	ldr	r3, [r2]
	.loc 1 785 32
	bic	r3, r3, #2048
	str	r3, [r2]
	.loc 1 788 7 is_stmt 1
	.loc 1 788 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 788 25
	ldr	r3, [r2]
	.loc 1 788 32
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 791 7 is_stmt 1
	.loc 1 791 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 791 25
	ldr	r3, [r2]
	.loc 1 791 32
	bic	r3, r3, #2
	str	r3, [r2]
	.loc 1 797 7 is_stmt 1
	.loc 1 797 33 is_stmt 0
	mov	r3, #262144
	str	r3, [r4, #28]
	.loc 1 800 7 is_stmt 1
	.loc 1 800 23 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 800 10
	cmp	r3, #256
	beq	.L60
	.loc 1 803 9 is_stmt 1
	.loc 1 803 37 is_stmt 0
	str	r8, [r4, #36]
	.loc 1 805 9 is_stmt 1
	.loc 1 805 37 is_stmt 0
	str	r7, [r4, #32]
.L61:
	.loc 1 815 5 is_stmt 1
	.loc 1 815 46 is_stmt 0
	ldr	r2, [r4]
	.loc 1 815 56
	ldr	r3, [r2]
	.loc 1 815 65
	bic	r3, r3, #96
	.loc 1 815 89
	orr	r3, r3, r9
	.loc 1 815 32
	str	r3, [r2]
	.loc 1 624 21
	movs	r0, #0
	b	.L47
.L60:
	.loc 1 810 9 is_stmt 1
	.loc 1 810 46 is_stmt 0
	str	r8, [r4, #44]
	.loc 1 812 9 is_stmt 1
	.loc 1 812 46 is_stmt 0
	str	r7, [r4, #40]
	b	.L61
.LVL62:
.L62:
	.cfi_def_cfa_offset 0
	.cfi_restore 3
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 7
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 14
	.loc 1 637 12
	movs	r0, #1
.LVL63:
	.loc 1 824 3 is_stmt 1
	.loc 1 825 1 is_stmt 0
	bx	lr
.LVL64:
.L63:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 4, -28
	.cfi_offset 5, -24
	.cfi_offset 6, -20
	.cfi_offset 7, -16
	.cfi_offset 8, -12
	.cfi_offset 9, -8
	.cfi_offset 14, -4
	.loc 1 641 12
	movs	r0, #1
.LVL65:
	b	.L47
	.cfi_endproc
.LFE341:
	.size	HAL_OPAMP_SelfCalibrate, .-HAL_OPAMP_SelfCalibrate
	.section	.text.HAL_OPAMP_Lock,"ax",%progbits
	.align	1
	.global	HAL_OPAMP_Lock
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMP_Lock, %function
HAL_OPAMP_Lock:
.LFB342:
	.loc 1 857 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL66:
	.loc 1 858 3
	.loc 1 864 3
	.loc 1 864 5 is_stmt 0
	cbz	r0, .L74
	.loc 1 869 8 is_stmt 1
	.loc 1 869 17 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 869 10
	cmp	r3, #4
	beq	.L76
	.loc 1 871 12
	movs	r0, #1
.LVL67:
	.loc 1 881 3 is_stmt 1
	.loc 1 882 1 is_stmt 0
	bx	lr
.LVL68:
.L76:
	.loc 1 876 5 is_stmt 1
	.loc 1 879 5
	.loc 1 879 19 is_stmt 0
	movs	r3, #5
	strb	r3, [r0, #50]
	.loc 1 858 21
	movs	r0, #0
.LVL69:
	bx	lr
.LVL70:
.L74:
	.loc 1 866 12
	movs	r0, #1
.LVL71:
	bx	lr
	.cfi_endproc
.LFE342:
	.size	HAL_OPAMP_Lock, .-HAL_OPAMP_Lock
	.section	.text.HAL_OPAMP_GetTrimOffset,"ax",%progbits
	.align	1
	.global	HAL_OPAMP_GetTrimOffset
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMP_GetTrimOffset, %function
HAL_OPAMP_GetTrimOffset:
.LFB343:
	.loc 1 906 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL72:
	.loc 1 907 3
	.loc 1 908 3
	.loc 1 912 3
	.loc 1 912 5 is_stmt 0
	mov	r2, r0
	cbz	r0, .L82
	.loc 1 917 3 is_stmt 1
	.loc 1 917 12 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 917 5
	cmp	r3, #1
	bne	.L83
	.loc 1 920 5 is_stmt 1
	.loc 1 921 5
	.loc 1 922 5
	.loc 1 925 5
	.loc 1 925 17 is_stmt 0
	ldr	r3, [r0]
	.loc 1 925 27
	ldr	r0, [r3]
.LVL73:
	.loc 1 925 8
	tst	r0, #262144
	bne	.L84
	.loc 1 937 7 is_stmt 1
	.loc 1 937 23 is_stmt 0
	ldr	r2, [r2, #4]
.LVL74:
	.loc 1 937 10
	cbnz	r2, .L79
	.loc 1 939 9 is_stmt 1
	.loc 1 939 32 is_stmt 0
	adds	r3, r3, #4
.LVL75:
.L80:
	.loc 1 947 7 is_stmt 1
	.loc 1 947 10 is_stmt 0
	cmp	r1, #1
	beq	.L85
	.loc 1 955 9 is_stmt 1
	.loc 1 955 26 is_stmt 0
	ldr	r0, [r3]
	.loc 1 955 23
	and	r0, r0, #31
.LVL76:
	bx	lr
.LVL77:
.L79:
	.loc 1 943 9 is_stmt 1
	.loc 1 943 32 is_stmt 0
	adds	r3, r3, #8
.LVL78:
	b	.L80
.L85:
	.loc 1 950 9 is_stmt 1
	.loc 1 950 27 is_stmt 0
	ldr	r0, [r3]
	.loc 1 950 23
	ubfx	r0, r0, #8, #5
.LVL79:
	bx	lr
.LVL80:
.L82:
	.loc 1 914 12
	mov	r0, #-1
.LVL81:
	bx	lr
.LVL82:
.L83:
	.loc 1 961 12
	mov	r0, #-1
.LVL83:
	bx	lr
.L84:
	.loc 1 932 21
	mov	r0, #-1
	.loc 1 965 1
	bx	lr
	.cfi_endproc
.LFE343:
	.size	HAL_OPAMP_GetTrimOffset, .-HAL_OPAMP_GetTrimOffset
	.section	.text.HAL_OPAMP_GetState,"ax",%progbits
	.align	1
	.global	HAL_OPAMP_GetState
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMP_GetState, %function
HAL_OPAMP_GetState:
.LFB344:
	.loc 1 1126 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL84:
	.loc 1 1128 3
	.loc 1 1128 5 is_stmt 0
	cbz	r0, .L88
	.loc 1 1134 3 is_stmt 1
	.loc 1 1137 3
	.loc 1 1137 16 is_stmt 0
	ldrb	r0, [r0, #50]	@ zero_extendqisi2
.LVL85:
	uxtb	r0, r0
	bx	lr
.LVL86:
.L88:
	.loc 1 1130 12
	movs	r0, #0
.LVL87:
	.loc 1 1138 1
	bx	lr
	.cfi_endproc
.LFE344:
	.size	HAL_OPAMP_GetState, .-HAL_OPAMP_GetState
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_opamp.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x576
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x12
	.4byte	.LASF70
	.byte	0x1d
	.4byte	.LASF71
	.4byte	.LASF72
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
	.uleb128 0x13
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
	.uleb128 0xe
	.4byte	0x78
	.uleb128 0x14
	.byte	0xc
	.byte	0x4
	.2byte	0x412
	.byte	0x9
	.4byte	0xba
	.uleb128 0xf
	.ascii	"CSR\000"
	.2byte	0x414
	.4byte	0x84
	.byte	0
	.uleb128 0xf
	.ascii	"OTR\000"
	.2byte	0x415
	.4byte	0x84
	.byte	0x4
	.uleb128 0x15
	.4byte	.LASF11
	.byte	0x4
	.2byte	0x416
	.byte	0x15
	.4byte	0x84
	.byte	0x8
	.byte	0
	.uleb128 0x16
	.4byte	.LASF12
	.byte	0x4
	.2byte	0x417
	.byte	0x3
	.4byte	0x89
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF13
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF16
	.uleb128 0x9
	.4byte	0x34
	.byte	0x5
	.byte	0x28
	.4byte	0x107
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
	.uleb128 0x5
	.4byte	.LASF21
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0xe3
	.uleb128 0x9
	.4byte	0x34
	.byte	0x5
	.byte	0x33
	.4byte	0x12b
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x5
	.byte	0x36
	.byte	0x3
	.4byte	0x113
	.uleb128 0x10
	.byte	0x2c
	.byte	0x30
	.4byte	0x1c3
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0x33
	.byte	0xc
	.4byte	0x78
	.byte	0
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0x36
	.byte	0xc
	.4byte	0x78
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0x3a
	.byte	0xc
	.4byte	0x78
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x41
	.byte	0xc
	.4byte	0x78
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x44
	.byte	0xc
	.4byte	0x78
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x48
	.byte	0xc
	.4byte	0x78
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x4e
	.byte	0xc
	.4byte	0x78
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x52
	.byte	0xc
	.4byte	0x78
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x57
	.byte	0xc
	.4byte	0x78
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x5c
	.byte	0xc
	.4byte	0x78
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x61
	.byte	0xc
	.4byte	0x78
	.byte	0x28
	.byte	0
	.uleb128 0x5
	.4byte	.LASF36
	.byte	0x6
	.byte	0x66
	.byte	0x2
	.4byte	0x137
	.uleb128 0x9
	.4byte	0x34
	.byte	0x6
	.byte	0x6d
	.4byte	0x1f9
	.uleb128 0x4
	.4byte	.LASF37
	.byte	0
	.uleb128 0x4
	.4byte	.LASF38
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF39
	.byte	0x2
	.uleb128 0x4
	.4byte	.LASF40
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF41
	.byte	0x5
	.byte	0
	.uleb128 0x5
	.4byte	.LASF42
	.byte	0x6
	.byte	0x77
	.byte	0x2
	.4byte	0x1cf
	.uleb128 0xe
	.4byte	0x1f9
	.uleb128 0x10
	.byte	0x34
	.byte	0x7f
	.4byte	0x24e
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x82
	.byte	0x12
	.4byte	0x24e
	.byte	0
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x83
	.byte	0x15
	.4byte	0x1c3
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x84
	.byte	0x15
	.4byte	0x107
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x85
	.byte	0x13
	.4byte	0x12b
	.byte	0x31
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x86
	.byte	0x23
	.4byte	0x205
	.byte	0x32
	.byte	0
	.uleb128 0xa
	.4byte	0xba
	.uleb128 0x5
	.4byte	.LASF48
	.byte	0x6
	.byte	0x8c
	.byte	0x3
	.4byte	0x20a
	.uleb128 0x5
	.4byte	.LASF49
	.byte	0x6
	.byte	0x92
	.byte	0x12
	.4byte	0x78
	.uleb128 0x17
	.4byte	.LASF73
	.byte	0x7
	.2byte	0x432
	.byte	0x6
	.4byte	0x27e
	.uleb128 0x18
	.4byte	0x78
	.byte	0
	.uleb128 0x7
	.4byte	.LASF50
	.2byte	0x465
	.byte	0x18
	.4byte	0x1f9
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2a9
	.uleb128 0x6
	.4byte	.LASF52
	.2byte	0x465
	.byte	0x40
	.4byte	0x2a9
	.4byte	.LLST20
	.byte	0
	.uleb128 0xa
	.4byte	0x253
	.uleb128 0x7
	.4byte	.LASF51
	.2byte	0x389
	.byte	0x20
	.4byte	0x25f
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x307
	.uleb128 0x6
	.4byte	.LASF52
	.2byte	0x389
	.byte	0x4e
	.4byte	0x2a9
	.4byte	.LLST17
	.uleb128 0xb
	.4byte	.LASF53
	.2byte	0x389
	.byte	0x5f
	.4byte	0x78
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.4byte	.LASF54
	.2byte	0x38b
	.byte	0x22
	.4byte	0x25f
	.4byte	.LLST18
	.uleb128 0x3
	.4byte	.LASF55
	.2byte	0x38c
	.byte	0x16
	.4byte	0x307
	.4byte	.LLST19
	.byte	0
	.uleb128 0xa
	.4byte	0x84
	.uleb128 0x7
	.4byte	.LASF56
	.2byte	0x358
	.byte	0x13
	.4byte	0x107
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x347
	.uleb128 0x6
	.4byte	.LASF52
	.2byte	0x358
	.byte	0x37
	.4byte	0x2a9
	.4byte	.LLST15
	.uleb128 0x3
	.4byte	.LASF57
	.2byte	0x35a
	.byte	0x15
	.4byte	0x107
	.4byte	.LLST16
	.byte	0
	.uleb128 0x7
	.4byte	.LASF58
	.2byte	0x26d
	.byte	0x13
	.4byte	0x107
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x41a
	.uleb128 0x6
	.4byte	.LASF52
	.2byte	0x26d
	.byte	0x40
	.4byte	0x2a9
	.4byte	.LLST8
	.uleb128 0x3
	.4byte	.LASF57
	.2byte	0x270
	.byte	0x15
	.4byte	0x107
	.4byte	.LLST9
	.uleb128 0x3
	.4byte	.LASF59
	.2byte	0x272
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST10
	.uleb128 0x3
	.4byte	.LASF60
	.2byte	0x273
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST11
	.uleb128 0x3
	.4byte	.LASF61
	.2byte	0x274
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST12
	.uleb128 0x3
	.4byte	.LASF62
	.2byte	0x275
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST13
	.uleb128 0x3
	.4byte	.LASF55
	.2byte	0x277
	.byte	0x16
	.4byte	0x307
	.4byte	.LLST14
	.uleb128 0xc
	.4byte	.LVL50
	.4byte	0x26b
	.4byte	0x3e4
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0xc
	.4byte	.LVL52
	.4byte	0x26b
	.4byte	0x3f7
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0xc
	.4byte	.LVL58
	.4byte	0x26b
	.4byte	0x40a
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0xd
	.4byte	.LVL60
	.4byte	0x26b
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF63
	.2byte	0x23a
	.byte	0x13
	.4byte	0x107
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x455
	.uleb128 0x6
	.4byte	.LASF52
	.2byte	0x23a
	.byte	0x37
	.4byte	0x2a9
	.4byte	.LLST6
	.uleb128 0x3
	.4byte	.LASF57
	.2byte	0x23c
	.byte	0x15
	.4byte	0x107
	.4byte	.LLST7
	.byte	0
	.uleb128 0x7
	.4byte	.LASF64
	.2byte	0x210
	.byte	0x13
	.4byte	0x107
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x490
	.uleb128 0x6
	.4byte	.LASF52
	.2byte	0x210
	.byte	0x38
	.4byte	0x2a9
	.4byte	.LLST4
	.uleb128 0x3
	.4byte	.LASF57
	.2byte	0x212
	.byte	0x15
	.4byte	0x107
	.4byte	.LLST5
	.byte	0
	.uleb128 0x11
	.4byte	.LASF65
	.2byte	0x1ee
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b4
	.uleb128 0xb
	.4byte	.LASF52
	.2byte	0x1ee
	.byte	0x45
	.4byte	0x2a9
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x11
	.4byte	.LASF66
	.2byte	0x1df
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4d8
	.uleb128 0xb
	.4byte	.LASF52
	.2byte	0x1df
	.byte	0x43
	.4byte	0x2a9
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x7
	.4byte	.LASF67
	.2byte	0x1ad
	.byte	0x13
	.4byte	0x107
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x523
	.uleb128 0x6
	.4byte	.LASF52
	.2byte	0x1ad
	.byte	0x39
	.4byte	0x2a9
	.4byte	.LLST2
	.uleb128 0x3
	.4byte	.LASF57
	.2byte	0x1af
	.byte	0x15
	.4byte	0x107
	.4byte	.LLST3
	.uleb128 0xd
	.4byte	.LVL18
	.4byte	0x490
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x112
	.byte	0x13
	.4byte	0x107
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF52
	.2byte	0x112
	.byte	0x37
	.4byte	0x2a9
	.4byte	.LLST0
	.uleb128 0x1a
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x114
	.byte	0x15
	.4byte	0x107
	.byte	0
	.uleb128 0x3
	.4byte	.LASF69
	.2byte	0x115
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST1
	.uleb128 0xd
	.4byte	.LVL3
	.4byte	0x4b4
	.uleb128 0x8
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x21
	.sleb128 28
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
	.uleb128 0x5
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
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1c
	.uleb128 0xb
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
	.4byte	.LVL84
	.byte	0x4
	.uleb128 .LVL84-.LVL84
	.uleb128 .LVL85-.LVL84
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL85-.LVL84
	.uleb128 .LVL86-.LVL84
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL86-.LVL84
	.uleb128 .LVL87-.LVL84
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL87-.LVL84
	.uleb128 .LFE344-.LVL84
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x6
	.4byte	.LVL72
	.byte	0x4
	.uleb128 .LVL72-.LVL72
	.uleb128 .LVL73-.LVL72
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL73-.LVL72
	.uleb128 .LVL74-.LVL72
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL74-.LVL72
	.uleb128 .LVL80-.LVL72
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL80-.LVL72
	.uleb128 .LVL81-.LVL72
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL81-.LVL72
	.uleb128 .LVL82-.LVL72
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL82-.LVL72
	.uleb128 .LVL83-.LVL72
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL83-.LVL72
	.uleb128 .LFE343-.LVL72
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST18:
	.byte	0x6
	.4byte	.LVL76
	.byte	0x4
	.uleb128 .LVL76-.LVL76
	.uleb128 .LVL77-.LVL76
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL79-.LVL76
	.uleb128 .LVL80-.LVL76
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL75
	.byte	0x4
	.uleb128 .LVL75-.LVL75
	.uleb128 .LVL77-.LVL75
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL78-.LVL75
	.uleb128 .LVL80-.LVL75
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST15:
	.byte	0x6
	.4byte	.LVL66
	.byte	0x4
	.uleb128 .LVL66-.LVL66
	.uleb128 .LVL67-.LVL66
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL67-.LVL66
	.uleb128 .LVL68-.LVL66
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL68-.LVL66
	.uleb128 .LVL69-.LVL66
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL69-.LVL66
	.uleb128 .LVL70-.LVL66
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL70-.LVL66
	.uleb128 .LVL71-.LVL66
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL71-.LVL66
	.uleb128 .LFE342-.LVL66
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST16:
	.byte	0x6
	.4byte	.LVL66
	.byte	0x4
	.uleb128 .LVL66-.LVL66
	.uleb128 .LVL67-.LVL66
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL67-.LVL66
	.uleb128 .LVL68-.LVL66
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL68-.LVL66
	.uleb128 .LFE342-.LVL66
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL40-.LVL39
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL40-.LVL39
	.uleb128 .LVL41-.LVL39
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL41-.LVL39
	.uleb128 .LVL47-.LVL39
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL47-.LVL39
	.uleb128 .LVL62-.LVL39
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL62-.LVL39
	.uleb128 .LVL63-.LVL39
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL63-.LVL39
	.uleb128 .LVL64-.LVL39
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL64-.LVL39
	.uleb128 .LVL65-.LVL39
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL65-.LVL39
	.uleb128 .LFE341-.LVL39
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL40-.LVL39
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL40-.LVL39
	.uleb128 .LVL41-.LVL39
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL41-.LVL39
	.uleb128 .LVL63-.LVL39
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL63-.LVL39
	.uleb128 .LVL64-.LVL39
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL64-.LVL39
	.uleb128 .LFE341-.LVL39
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL45-.LVL44
	.uleb128 0x2
	.byte	0x40
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL47-.LVL44
	.uleb128 .LVL62-.LVL44
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL54
	.byte	0x4
	.uleb128 .LVL54-.LVL54
	.uleb128 .LVL55-.LVL54
	.uleb128 0x2
	.byte	0x40
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL55-.LVL54
	.uleb128 .LVL62-.LVL54
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LLST12:
	.byte	0x6
	.4byte	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL45-.LVL44
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL47-.LVL44
	.uleb128 .LVL54-.LVL44
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL54-.LVL44
	.uleb128 .LVL55-.LVL44
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL55-.LVL44
	.uleb128 .LVL62-.LVL44
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST13:
	.byte	0x8
	.4byte	.LVL42
	.uleb128 .LVL62-.LVL42
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL43
	.byte	0x4
	.uleb128 .LVL43-.LVL43
	.uleb128 .LVL45-.LVL43
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL46-.LVL43
	.uleb128 .LVL62-.LVL43
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL29
	.byte	0x4
	.uleb128 .LVL29-.LVL29
	.uleb128 .LVL30-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL30-.LVL29
	.uleb128 .LVL31-.LVL29
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL31-.LVL29
	.uleb128 .LVL32-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL32-.LVL29
	.uleb128 .LVL33-.LVL29
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL33-.LVL29
	.uleb128 .LVL34-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL34-.LVL29
	.uleb128 .LVL35-.LVL29
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL35-.LVL29
	.uleb128 .LVL36-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL36-.LVL29
	.uleb128 .LVL37-.LVL29
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL37-.LVL29
	.uleb128 .LVL38-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL38-.LVL29
	.uleb128 .LFE340-.LVL29
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL29
	.byte	0x4
	.uleb128 .LVL29-.LVL29
	.uleb128 .LVL30-.LVL29
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL30-.LVL29
	.uleb128 .LVL31-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL31-.LVL29
	.uleb128 .LFE340-.LVL29
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL21
	.byte	0x4
	.uleb128 .LVL21-.LVL21
	.uleb128 .LVL22-.LVL21
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL22-.LVL21
	.uleb128 .LVL23-.LVL21
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL21
	.uleb128 .LVL24-.LVL21
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL24-.LVL21
	.uleb128 .LVL25-.LVL21
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL25-.LVL21
	.uleb128 .LVL26-.LVL21
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL26-.LVL21
	.uleb128 .LVL27-.LVL21
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL27-.LVL21
	.uleb128 .LVL28-.LVL21
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL28-.LVL21
	.uleb128 .LFE339-.LVL21
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL21
	.byte	0x4
	.uleb128 .LVL21-.LVL21
	.uleb128 .LVL22-.LVL21
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL22-.LVL21
	.uleb128 .LVL23-.LVL21
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL23-.LVL21
	.uleb128 .LFE339-.LVL21
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL16-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL16-.LVL15
	.uleb128 .LVL17-.LVL15
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL17-.LVL15
	.uleb128 .LVL18-1-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL18-1-.LVL15
	.uleb128 .LVL19-.LVL15
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL19-.LVL15
	.uleb128 .LVL20-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL20-.LVL15
	.uleb128 .LFE336-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL16-.LVL15
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL15
	.uleb128 .LVL17-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL17-.LVL15
	.uleb128 .LVL20-.LVL15
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL20-.LVL15
	.uleb128 .LFE336-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL2-.LVL1
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL2-.LVL1
	.uleb128 .LVL8-.LVL1
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL8-.LVL1
	.uleb128 .LVL9-.LVL1
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL9-.LVL1
	.uleb128 .LVL10-.LVL1
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL10-.LVL1
	.uleb128 .LVL11-.LVL1
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL11-.LVL1
	.uleb128 .LVL12-.LVL1
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL12-.LVL1
	.uleb128 .LVL13-.LVL1
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL13-.LVL1
	.uleb128 .LFE335-.LVL1
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL5
	.byte	0x4
	.uleb128 .LVL5-.LVL5
	.uleb128 .LVL6-.LVL5
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL7-.LVL5
	.uleb128 .LVL8-.LVL5
	.uleb128 0x1
	.byte	0x52
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x64
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
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
.LLRL21:
	.byte	0x7
	.4byte	.LFB337
	.uleb128 .LFE337-.LFB337
	.byte	0x7
	.4byte	.LFB335
	.uleb128 .LFE335-.LFB335
	.byte	0x7
	.4byte	.LFB338
	.uleb128 .LFE338-.LFB338
	.byte	0x7
	.4byte	.LFB336
	.uleb128 .LFE336-.LFB336
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
	.4byte	.LFB344
	.uleb128 .LFE344-.LFB344
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF18:
	.ascii	"HAL_ERROR\000"
.LASF22:
	.ascii	"HAL_UNLOCKED\000"
.LASF50:
	.ascii	"HAL_OPAMP_GetState\000"
.LASF63:
	.ascii	"HAL_OPAMP_Stop\000"
.LASF65:
	.ascii	"HAL_OPAMP_MspDeInit\000"
.LASF72:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF64:
	.ascii	"HAL_OPAMP_Start\000"
.LASF0:
	.ascii	"short int\000"
.LASF61:
	.ascii	"delta\000"
.LASF66:
	.ascii	"HAL_OPAMP_MspInit\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF62:
	.ascii	"opampmode\000"
.LASF35:
	.ascii	"TrimmingValueNHighSpeed\000"
.LASF33:
	.ascii	"TrimmingValueN\000"
.LASF25:
	.ascii	"PowerMode\000"
.LASF17:
	.ascii	"HAL_OK\000"
.LASF42:
	.ascii	"HAL_OPAMP_StateTypeDef\000"
.LASF48:
	.ascii	"OPAMP_HandleTypeDef\000"
.LASF19:
	.ascii	"HAL_BUSY\000"
.LASF30:
	.ascii	"PgaConnect\000"
.LASF15:
	.ascii	"float\000"
.LASF55:
	.ascii	"tmp_opamp_reg_trimming\000"
.LASF6:
	.ascii	"long long int\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF47:
	.ascii	"State\000"
.LASF44:
	.ascii	"Init\000"
.LASF4:
	.ascii	"long int\000"
.LASF29:
	.ascii	"PgaGain\000"
.LASF46:
	.ascii	"Lock\000"
.LASF51:
	.ascii	"HAL_OPAMP_GetTrimOffset\000"
.LASF11:
	.ascii	"HSOTR\000"
.LASF27:
	.ascii	"InvertingInput\000"
.LASF21:
	.ascii	"HAL_StatusTypeDef\000"
.LASF28:
	.ascii	"NonInvertingInput\000"
.LASF13:
	.ascii	"long double\000"
.LASF53:
	.ascii	"trimmingoffset\000"
.LASF69:
	.ascii	"updateotrlpotr\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF40:
	.ascii	"HAL_OPAMP_STATE_BUSY\000"
.LASF41:
	.ascii	"HAL_OPAMP_STATE_BUSYLOCKED\000"
.LASF1:
	.ascii	"signed char\000"
.LASF73:
	.ascii	"HAL_Delay\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF68:
	.ascii	"HAL_OPAMP_Init\000"
.LASF43:
	.ascii	"Instance\000"
.LASF56:
	.ascii	"HAL_OPAMP_Lock\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF70:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF57:
	.ascii	"status\000"
.LASF67:
	.ascii	"HAL_OPAMP_DeInit\000"
.LASF14:
	.ascii	"char\000"
.LASF20:
	.ascii	"HAL_TIMEOUT\000"
.LASF23:
	.ascii	"HAL_LOCKED\000"
.LASF36:
	.ascii	"OPAMP_InitTypeDef\000"
.LASF32:
	.ascii	"TrimmingValueP\000"
.LASF54:
	.ascii	"trimmingvalue\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF16:
	.ascii	"double\000"
.LASF58:
	.ascii	"HAL_OPAMP_SelfCalibrate\000"
.LASF38:
	.ascii	"HAL_OPAMP_STATE_READY\000"
.LASF12:
	.ascii	"OPAMP_TypeDef\000"
.LASF45:
	.ascii	"Status\000"
.LASF31:
	.ascii	"UserTrimming\000"
.LASF52:
	.ascii	"hopamp\000"
.LASF26:
	.ascii	"Mode\000"
.LASF71:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_opamp.c\000"
.LASF49:
	.ascii	"HAL_OPAMP_TrimmingValueTypeDef\000"
.LASF39:
	.ascii	"HAL_OPAMP_STATE_CALIBBUSY\000"
.LASF37:
	.ascii	"HAL_OPAMP_STATE_RESET\000"
.LASF24:
	.ascii	"HAL_LockTypeDef\000"
.LASF59:
	.ascii	"trimmingvaluen\000"
.LASF34:
	.ascii	"TrimmingValuePHighSpeed\000"
.LASF60:
	.ascii	"trimmingvaluep\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
