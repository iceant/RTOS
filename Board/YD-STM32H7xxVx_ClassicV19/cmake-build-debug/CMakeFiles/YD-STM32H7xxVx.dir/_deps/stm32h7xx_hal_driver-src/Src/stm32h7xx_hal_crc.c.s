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
	.file	"stm32h7xx_hal_crc.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_crc.c"
	.section	.text.CRC_Handle_8,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	CRC_Handle_8, %function
CRC_Handle_8:
.LFB342:
	.loc 1 433 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 434 3
	.loc 1 435 3
	.loc 1 436 3
	.loc 1 441 3
.LVL1:
	.loc 1 441 10 is_stmt 0
	mov	ip, #0
	.loc 1 441 3
	b	.L2
.LVL2:
.L3:
	.loc 1 443 5 is_stmt 1 discriminator 3
	.loc 1 443 44 is_stmt 0 discriminator 3
	ldrb	r4, [r1, ip, lsl #2]	@ zero_extendqisi2
	.loc 1 444 44 discriminator 3
	add	lr, r1, ip, lsl #2
	ldrb	r3, [lr, #1]	@ zero_extendqisi2
	.loc 1 444 60 discriminator 3
	lsls	r3, r3, #16
	.loc 1 443 61 discriminator 3
	orr	r3, r3, r4, lsl #24
	.loc 1 445 44 discriminator 3
	ldrb	r4, [lr, #2]	@ zero_extendqisi2
	.loc 1 444 68 discriminator 3
	orr	r3, r3, r4, lsl #8
	.loc 1 446 43 discriminator 3
	ldrb	lr, [lr, #3]	@ zero_extendqisi2
	.loc 1 445 67 discriminator 3
	orr	r3, r3, lr
	.loc 1 443 24 discriminator 3
	ldr	r4, [r0]
	str	r3, [r4]
	.loc 1 441 42 is_stmt 1 discriminator 3
	add	ip, ip, #1
.LVL3:
.L2:
	.loc 1 441 18 discriminator 1
	cmp	ip, r2, lsr #2
	bcc	.L3
	.loc 1 449 3
	.loc 1 449 6 is_stmt 0
	ands	r2, r2, #3
.LVL4:
	beq	.L4
	.loc 1 451 5 is_stmt 1
	.loc 1 451 8 is_stmt 0
	cmp	r2, #1
	beq	.L8
.L5:
	.loc 1 455 5 is_stmt 1
	.loc 1 455 8 is_stmt 0
	cmp	r2, #2
	beq	.L9
.L6:
	.loc 1 461 5 is_stmt 1
	.loc 1 461 8 is_stmt 0
	cmp	r2, #3
	beq	.L10
.LVL5:
.L4:
	.loc 1 472 3 is_stmt 1
	.loc 1 472 14 is_stmt 0
	ldr	r3, [r0]
	.loc 1 472 24
	ldr	r0, [r3]
.LVL6:
	.loc 1 473 1
	pop	{r4, pc}
.LVL7:
.L8:
	.loc 1 453 7 is_stmt 1
	.loc 1 453 51 is_stmt 0
	ldr	r3, [r0]
	.loc 1 453 76
	ldrb	r4, [r1, ip, lsl #2]	@ zero_extendqisi2
	.loc 1 453 67
	strb	r4, [r3]
	b	.L5
.L9:
	.loc 1 457 7 is_stmt 1
	.loc 1 457 33 is_stmt 0
	ldrb	r4, [r1, ip, lsl #2]	@ zero_extendqisi2
	.loc 1 457 69
	add	r3, r1, ip, lsl #2
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	.loc 1 457 12
	orr	r3, r3, r4, lsl #8
.LVL8:
	.loc 1 458 7 is_stmt 1
	.loc 1 458 58 is_stmt 0
	ldr	r4, [r0]
.LVL9:
	.loc 1 459 7 is_stmt 1
	.loc 1 459 13 is_stmt 0
	strh	r3, [r4]	@ movhi
	b	.L6
.LVL10:
.L10:
	.loc 1 463 7 is_stmt 1
	.loc 1 463 33 is_stmt 0
	ldrb	r2, [r1, ip, lsl #2]	@ zero_extendqisi2
	.loc 1 463 69
	add	r1, r1, ip, lsl #2
.LVL11:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	.loc 1 463 12
	orr	r3, r3, r2, lsl #8
.LVL12:
	.loc 1 464 7 is_stmt 1
	.loc 1 464 58 is_stmt 0
	ldr	r2, [r0]
.LVL13:
	.loc 1 465 7 is_stmt 1
	.loc 1 465 13 is_stmt 0
	strh	r3, [r2]	@ movhi
	.loc 1 467 7 is_stmt 1
	.loc 1 467 51 is_stmt 0
	ldr	r3, [r0]
.LVL14:
	.loc 1 467 76
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
.LVL15:
	.loc 1 467 67
	strb	r2, [r3]
	b	.L4
	.cfi_endproc
.LFE342:
	.size	CRC_Handle_8, .-CRC_Handle_8
	.section	.text.CRC_Handle_16,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	CRC_Handle_16, %function
CRC_Handle_16:
.LFB343:
	.loc 1 484 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL16:
	.loc 1 485 3
	.loc 1 486 3
	.loc 1 491 3
	.loc 1 491 10 is_stmt 0
	movs	r3, #0
.LVL17:
	.loc 1 491 18 is_stmt 1
	cmp	r3, r2, lsr #1
	bcs	.L21
	.loc 1 484 1 is_stmt 0
	push	{r4, r5}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
.L13:
	.loc 1 493 5 is_stmt 1 discriminator 3
	.loc 1 493 44 is_stmt 0 discriminator 3
	ldrh	ip, [r1, r3, lsl #2]
	.loc 1 493 80 discriminator 3
	add	r4, r1, r3, lsl #2
	ldrh	r4, [r4, #2]
	.loc 1 493 61 discriminator 3
	orr	r4, r4, ip, lsl #16
	.loc 1 493 24 discriminator 3
	ldr	r5, [r0]
	str	r4, [r5]
	.loc 1 491 42 is_stmt 1 discriminator 3
	adds	r3, r3, #1
.LVL18:
	.loc 1 491 18 discriminator 3
	cmp	r3, r2, lsr #1
	bcc	.L13
	.loc 1 495 3
	.loc 1 495 6 is_stmt 0
	tst	r2, #1
	beq	.L14
	.loc 1 497 5 is_stmt 1
	.loc 1 497 56 is_stmt 0
	ldr	r2, [r0]
.LVL19:
	.loc 1 498 5 is_stmt 1
	.loc 1 498 20 is_stmt 0
	ldrh	r3, [r1, r3, lsl #2]
.LVL20:
	.loc 1 498 11
	strh	r3, [r2]	@ movhi
.LVL21:
.L14:
	.loc 1 502 3 is_stmt 1
	.loc 1 502 14 is_stmt 0
	ldr	r3, [r0]
	.loc 1 502 24
	ldr	r0, [r3]
.LVL22:
	.loc 1 503 1
	pop	{r4, r5}
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL23:
.L21:
	.loc 1 495 3 is_stmt 1
	.loc 1 495 6 is_stmt 0
	tst	r2, #1
	beq	.L19
	.loc 1 497 5 is_stmt 1
	.loc 1 497 56 is_stmt 0
	ldr	r2, [r0]
.LVL24:
	.loc 1 498 5 is_stmt 1
	.loc 1 498 20 is_stmt 0
	ldrh	r3, [r1, r3, lsl #2]
.LVL25:
	.loc 1 498 11
	strh	r3, [r2]	@ movhi
.LVL26:
.L19:
	.loc 1 502 3 is_stmt 1
	.loc 1 502 14 is_stmt 0
	ldr	r3, [r0]
	.loc 1 502 24
	ldr	r0, [r3]
.LVL27:
	.loc 1 503 1
	bx	lr
	.cfi_endproc
.LFE343:
	.size	CRC_Handle_16, .-CRC_Handle_16
	.section	.text.HAL_CRC_MspInit,"ax",%progbits
	.align	1
	.weak	HAL_CRC_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_CRC_MspInit, %function
HAL_CRC_MspInit:
.LFB337:
	.loc 1 224 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL28:
	.loc 1 226 3
	.loc 1 231 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_CRC_MspInit, .-HAL_CRC_MspInit
	.section	.text.HAL_CRC_Init,"ax",%progbits
	.align	1
	.global	HAL_CRC_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_CRC_Init, %function
HAL_CRC_Init:
.LFB335:
	.loc 1 104 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL29:
	.loc 1 106 3
	.loc 1 106 6 is_stmt 0
	cmp	r0, #0
	beq	.L30
	.loc 1 104 1
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 112 3 is_stmt 1
	.loc 1 114 3
	.loc 1 114 11 is_stmt 0
	ldrb	r3, [r0, #29]	@ zero_extendqisi2
	.loc 1 114 6
	cbz	r3, .L36
.LVL30:
.L25:
	.loc 1 122 3 is_stmt 1
	.loc 1 122 15 is_stmt 0
	movs	r3, #2
	strb	r3, [r4, #29]
	.loc 1 126 3 is_stmt 1
	.loc 1 127 3
	.loc 1 127 17 is_stmt 0
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	.loc 1 127 6
	cbnz	r3, .L26
	.loc 1 130 5 is_stmt 1
	.loc 1 130 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 130 28
	ldr	r2, .L37
	str	r2, [r3, #20]
	.loc 1 131 5 is_stmt 1
	.loc 1 131 41 is_stmt 0
	ldr	r2, [r4]
	.loc 1 131 51
	ldr	r3, [r2, #8]
	.loc 1 131 83
	bic	r3, r3, #24
	.loc 1 131 29
	str	r3, [r2, #8]
.L27:
	.loc 1 144 3 is_stmt 1
	.loc 1 145 3
	.loc 1 145 17 is_stmt 0
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	.loc 1 145 6
	cbnz	r3, .L28
	.loc 1 147 5 is_stmt 1
	.loc 1 147 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 147 29
	mov	r2, #-1
	str	r2, [r3, #16]
.L29:
	.loc 1 156 3 is_stmt 1
	.loc 1 157 3
	.loc 1 157 39 is_stmt 0
	ldr	r2, [r4]
	.loc 1 157 49
	ldr	r3, [r2, #8]
	.loc 1 157 57
	bic	r3, r3, #96
	.loc 1 157 94
	ldr	r1, [r4, #20]
	.loc 1 157 81
	orrs	r3, r3, r1
	.loc 1 157 27
	str	r3, [r2, #8]
	.loc 1 160 3 is_stmt 1
	.loc 1 161 3
	.loc 1 161 39 is_stmt 0
	ldr	r2, [r4]
	.loc 1 161 49
	ldr	r3, [r2, #8]
	.loc 1 161 57
	bic	r3, r3, #128
	.loc 1 161 94
	ldr	r1, [r4, #24]
	.loc 1 161 81
	orrs	r3, r3, r1
	.loc 1 161 27
	str	r3, [r2, #8]
	.loc 1 165 3 is_stmt 1
	.loc 1 168 3
	.loc 1 168 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #29]
	.loc 1 171 3 is_stmt 1
	.loc 1 171 10 is_stmt 0
	movs	r0, #0
.L24:
	.loc 1 172 1
	pop	{r4, pc}
.LVL31:
.L36:
	.loc 1 117 5 is_stmt 1
	.loc 1 117 16 is_stmt 0
	strb	r3, [r0, #28]
	.loc 1 119 5 is_stmt 1
	bl	HAL_CRC_MspInit
.LVL32:
	b	.L25
.L26:
	.loc 1 136 5
	.loc 1 136 9 is_stmt 0
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #8]
	mov	r0, r4
	bl	HAL_CRCEx_Polynomial_Set
.LVL33:
	.loc 1 136 8
	cmp	r0, #0
	beq	.L27
	.loc 1 138 14
	movs	r0, #1
	b	.L24
.L28:
	.loc 1 151 5 is_stmt 1
	.loc 1 151 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 151 42
	ldr	r2, [r4, #16]
	.loc 1 151 29
	str	r2, [r3, #16]
	b	.L29
.LVL34:
.L30:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 108 12
	movs	r0, #1
.LVL35:
	.loc 1 172 1
	bx	lr
.L38:
	.align	2
.L37:
	.word	79764919
	.cfi_endproc
.LFE335:
	.size	HAL_CRC_Init, .-HAL_CRC_Init
	.section	.text.HAL_CRC_MspDeInit,"ax",%progbits
	.align	1
	.weak	HAL_CRC_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_CRC_MspDeInit, %function
HAL_CRC_MspDeInit:
.LFB338:
	.loc 1 239 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL36:
	.loc 1 241 3
	.loc 1 246 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE338:
	.size	HAL_CRC_MspDeInit, .-HAL_CRC_MspDeInit
	.section	.text.HAL_CRC_DeInit,"ax",%progbits
	.align	1
	.global	HAL_CRC_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_CRC_DeInit, %function
HAL_CRC_DeInit:
.LFB336:
	.loc 1 180 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL37:
	.loc 1 182 3
	.loc 1 182 6 is_stmt 0
	cbz	r0, .L42
	.loc 1 180 1
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r5, r0
	.loc 1 188 3 is_stmt 1
	.loc 1 191 3
	.loc 1 191 11 is_stmt 0
	ldrb	r0, [r0, #29]	@ zero_extendqisi2
.LVL38:
	uxtb	r0, r0
	.loc 1 191 6
	cmp	r0, #2
	beq	.L41
	.loc 1 197 3 is_stmt 1
	.loc 1 197 15 is_stmt 0
	movs	r3, #2
	strb	r3, [r5, #29]
	.loc 1 200 3 is_stmt 1
	.loc 1 200 10 is_stmt 0
	ldr	r2, [r5]
	.loc 1 200 20
	ldr	r3, [r2, #8]
	.loc 1 200 25
	orr	r3, r3, #1
	str	r3, [r2, #8]
	.loc 1 203 3 is_stmt 1
	.loc 1 203 9 is_stmt 0
	ldr	r3, [r5]
	.loc 1 203 26
	movs	r4, #0
	str	r4, [r3, #4]
	.loc 1 206 3 is_stmt 1
	mov	r0, r5
	bl	HAL_CRC_MspDeInit
.LVL39:
	.loc 1 209 3
	.loc 1 209 15 is_stmt 0
	strb	r4, [r5, #29]
	.loc 1 212 3 is_stmt 1
	.loc 1 212 7
	.loc 1 212 20 is_stmt 0
	strb	r4, [r5, #28]
	.loc 1 212 5 is_stmt 1
	.loc 1 215 3
	.loc 1 215 10 is_stmt 0
	mov	r0, r4
.L41:
	.loc 1 216 1
	pop	{r3, r4, r5, pc}
.LVL40:
.L42:
	.cfi_def_cfa_offset 0
	.cfi_restore 3
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 14
	.loc 1 184 12
	movs	r0, #1
.LVL41:
	.loc 1 216 1
	bx	lr
	.cfi_endproc
.LFE336:
	.size	HAL_CRC_DeInit, .-HAL_CRC_DeInit
	.section	.text.HAL_CRC_Accumulate,"ax",%progbits
	.align	1
	.global	HAL_CRC_Accumulate
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_CRC_Accumulate, %function
HAL_CRC_Accumulate:
.LFB339:
	.loc 1 288 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL42:
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 289 3
	.loc 1 290 3
.LVL43:
	.loc 1 293 3
	.loc 1 293 15 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #29]
	.loc 1 295 3 is_stmt 1
	.loc 1 295 15 is_stmt 0
	ldr	r3, [r0, #32]
	.loc 1 295 3
	cmp	r3, #2
	beq	.L48
	cmp	r3, #3
	beq	.L53
	cmp	r3, #1
	beq	.L50
	movs	r0, #0
.LVL44:
.L51:
	.loc 1 318 3 is_stmt 1
	.loc 1 318 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #29]
	.loc 1 321 3 is_stmt 1
	.loc 1 322 1 is_stmt 0
	pop	{r3, r4, r5, pc}
.LVL45:
.L52:
	.loc 1 301 9 is_stmt 1 discriminator 3
	.loc 1 301 13 is_stmt 0 discriminator 3
	ldr	r0, [r4]
	.loc 1 301 28 discriminator 3
	ldr	r5, [r1, r3, lsl #2]
	str	r5, [r0]
	.loc 1 299 51 is_stmt 1 discriminator 3
	adds	r3, r3, #1
.LVL46:
.L49:
	.loc 1 299 30 discriminator 1
	cmp	r3, r2
	bcc	.L52
	.loc 1 303 7
	.loc 1 303 18 is_stmt 0
	ldr	r3, [r4]
.LVL47:
	.loc 1 303 12
	ldr	r0, [r3]
.LVL48:
	.loc 1 304 7 is_stmt 1
	b	.L51
.LVL49:
.L53:
	.loc 1 295 3 is_stmt 0
	movs	r3, #0
	b	.L49
.L50:
	.loc 1 307 7 is_stmt 1
	.loc 1 307 14 is_stmt 0
	bl	CRC_Handle_8
.LVL50:
	.loc 1 308 7 is_stmt 1
	b	.L51
.LVL51:
.L48:
	.loc 1 311 7
	.loc 1 311 14 is_stmt 0
	bl	CRC_Handle_16
.LVL52:
	.loc 1 312 7 is_stmt 1
	b	.L51
	.cfi_endproc
.LFE339:
	.size	HAL_CRC_Accumulate, .-HAL_CRC_Accumulate
	.section	.text.HAL_CRC_Calculate,"ax",%progbits
	.align	1
	.global	HAL_CRC_Calculate
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_CRC_Calculate, %function
HAL_CRC_Calculate:
.LFB340:
	.loc 1 340 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL53:
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 341 3
	.loc 1 342 3
.LVL54:
	.loc 1 345 3
	.loc 1 345 15 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #29]
	.loc 1 349 3 is_stmt 1
	.loc 1 349 10 is_stmt 0
	ldr	r0, [r0]
.LVL55:
	.loc 1 349 20
	ldr	r3, [r0, #8]
	.loc 1 349 25
	orr	r3, r3, #1
	str	r3, [r0, #8]
	.loc 1 351 3 is_stmt 1
	.loc 1 351 15 is_stmt 0
	ldr	r3, [r4, #32]
	.loc 1 351 3
	cmp	r3, #2
	beq	.L56
	cmp	r3, #3
	beq	.L61
	cmp	r3, #1
	beq	.L58
	movs	r0, #0
.LVL56:
.L59:
	.loc 1 377 3 is_stmt 1
	.loc 1 377 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #29]
	.loc 1 380 3 is_stmt 1
	.loc 1 381 1 is_stmt 0
	pop	{r3, r4, r5, pc}
.LVL57:
.L60:
	.loc 1 357 9 is_stmt 1 discriminator 3
	.loc 1 357 13 is_stmt 0 discriminator 3
	ldr	r0, [r4]
	.loc 1 357 28 discriminator 3
	ldr	r5, [r1, r3, lsl #2]
	str	r5, [r0]
	.loc 1 355 51 is_stmt 1 discriminator 3
	adds	r3, r3, #1
.LVL58:
.L57:
	.loc 1 355 30 discriminator 1
	cmp	r3, r2
	bcc	.L60
	.loc 1 359 7
	.loc 1 359 18 is_stmt 0
	ldr	r3, [r4]
.LVL59:
	.loc 1 359 12
	ldr	r0, [r3]
.LVL60:
	.loc 1 360 7 is_stmt 1
	b	.L59
.LVL61:
.L61:
	.loc 1 351 3 is_stmt 0
	movs	r3, #0
	b	.L57
.L58:
	.loc 1 364 7 is_stmt 1
	.loc 1 364 14 is_stmt 0
	mov	r0, r4
	bl	CRC_Handle_8
.LVL62:
	.loc 1 365 7 is_stmt 1
	b	.L59
.LVL63:
.L56:
	.loc 1 369 7
	.loc 1 369 14 is_stmt 0
	mov	r0, r4
	bl	CRC_Handle_16
.LVL64:
	.loc 1 370 7 is_stmt 1
	b	.L59
	.cfi_endproc
.LFE340:
	.size	HAL_CRC_Calculate, .-HAL_CRC_Calculate
	.section	.text.HAL_CRC_GetState,"ax",%progbits
	.align	1
	.global	HAL_CRC_GetState
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_CRC_GetState, %function
HAL_CRC_GetState:
.LFB341:
	.loc 1 407 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL65:
	.loc 1 409 3
	.loc 1 409 14 is_stmt 0
	ldrb	r0, [r0, #29]	@ zero_extendqisi2
.LVL66:
	.loc 1 410 1
	bx	lr
	.cfi_endproc
.LFE341:
	.size	HAL_CRC_GetState, .-HAL_CRC_GetState
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_crc.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_crc_ex.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5a2
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x18
	.4byte	.LASF66
	.byte	0x1d
	.4byte	.LASF67
	.4byte	.LASF68
	.4byte	.LLRL23
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
	.4byte	.LASF3
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x40
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x2
	.byte	0x39
	.byte	0x1c
	.4byte	0x53
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x6d
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x19
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x34
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x3
	.byte	0x24
	.byte	0x14
	.4byte	0x47
	.uleb128 0xa
	.4byte	0x9c
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x61
	.uleb128 0xa
	.4byte	0xad
	.uleb128 0x1a
	.byte	0x18
	.byte	0x4
	.2byte	0x1b0
	.byte	0x9
	.4byte	0x111
	.uleb128 0x9
	.ascii	"DR\000"
	.2byte	0x1b2
	.4byte	0xb9
	.byte	0
	.uleb128 0x9
	.ascii	"IDR\000"
	.2byte	0x1b3
	.4byte	0xb9
	.byte	0x4
	.uleb128 0x9
	.ascii	"CR\000"
	.2byte	0x1b4
	.4byte	0xb9
	.byte	0x8
	.uleb128 0xf
	.4byte	.LASF15
	.2byte	0x1b5
	.byte	0xc
	.4byte	0xad
	.byte	0xc
	.uleb128 0xf
	.4byte	.LASF16
	.2byte	0x1b6
	.byte	0x15
	.4byte	0xb9
	.byte	0x10
	.uleb128 0x9
	.ascii	"POL\000"
	.2byte	0x1b7
	.4byte	0xb9
	.byte	0x14
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x1b8
	.byte	0x3
	.4byte	0xbe
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF18
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF19
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.4byte	.LASF20
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF21
	.uleb128 0xb
	.4byte	0x40
	.byte	0x5
	.byte	0x28
	.4byte	0x15e
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0
	.uleb128 0x5
	.4byte	.LASF23
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0x13a
	.uleb128 0xb
	.4byte	0x40
	.byte	0x5
	.byte	0x33
	.4byte	0x182
	.uleb128 0x5
	.4byte	.LASF27
	.byte	0
	.uleb128 0x5
	.4byte	.LASF28
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF29
	.byte	0x5
	.byte	0x36
	.byte	0x3
	.4byte	0x16a
	.uleb128 0x6
	.4byte	0xad
	.uleb128 0x6
	.4byte	0x90
	.uleb128 0xb
	.4byte	0x40
	.byte	0x6
	.byte	0x2f
	.4byte	0x1c2
	.uleb128 0x5
	.4byte	.LASF30
	.byte	0
	.uleb128 0x5
	.4byte	.LASF31
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF32
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF33
	.byte	0x3
	.uleb128 0x5
	.4byte	.LASF34
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF35
	.byte	0x6
	.byte	0x35
	.byte	0x3
	.4byte	0x198
	.uleb128 0xa
	.4byte	0x1c2
	.uleb128 0x10
	.byte	0x18
	.byte	0x3a
	.4byte	0x22f
	.uleb128 0x2
	.4byte	.LASF36
	.byte	0x3c
	.byte	0xb
	.4byte	0x90
	.byte	0
	.uleb128 0x2
	.4byte	.LASF37
	.byte	0x44
	.byte	0xb
	.4byte	0x90
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF38
	.byte	0x49
	.byte	0xc
	.4byte	0xad
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF39
	.byte	0x4f
	.byte	0xc
	.4byte	0xad
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0x56
	.byte	0xc
	.4byte	0xad
	.byte	0xc
	.uleb128 0x2
	.4byte	.LASF41
	.byte	0x59
	.byte	0xc
	.4byte	0xad
	.byte	0x10
	.uleb128 0x2
	.4byte	.LASF42
	.byte	0x63
	.byte	0xc
	.4byte	0xad
	.byte	0x14
	.byte	0
	.uleb128 0x4
	.4byte	.LASF43
	.byte	0x6
	.byte	0x68
	.byte	0x3
	.4byte	0x1d3
	.uleb128 0x10
	.byte	0x24
	.byte	0x6d
	.4byte	0x27f
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x6f
	.byte	0x10
	.4byte	0x27f
	.byte	0
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0x71
	.byte	0x13
	.4byte	0x22f
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF46
	.byte	0x73
	.byte	0x13
	.4byte	0x182
	.byte	0x1c
	.uleb128 0x2
	.4byte	.LASF47
	.byte	0x75
	.byte	0x21
	.4byte	0x1ce
	.byte	0x1d
	.uleb128 0x2
	.4byte	.LASF48
	.byte	0x77
	.byte	0xc
	.4byte	0xad
	.byte	0x20
	.byte	0
	.uleb128 0x6
	.4byte	0x111
	.uleb128 0x4
	.4byte	.LASF49
	.byte	0x6
	.byte	0x83
	.byte	0x3
	.4byte	0x23b
	.uleb128 0x1c
	.4byte	0x284
	.uleb128 0x6
	.4byte	0x9c
	.uleb128 0x1d
	.4byte	.LASF69
	.byte	0x7
	.byte	0x7e
	.byte	0x13
	.4byte	0x15e
	.4byte	0x2ba
	.uleb128 0xc
	.4byte	0x2ba
	.uleb128 0xc
	.4byte	0xad
	.uleb128 0xc
	.4byte	0xad
	.byte	0
	.uleb128 0x6
	.4byte	0x284
	.uleb128 0x11
	.4byte	.LASF54
	.2byte	0x1e3
	.4byte	0xad
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x325
	.uleb128 0x3
	.4byte	.LASF50
	.2byte	0x1e3
	.byte	0x32
	.4byte	0x2ba
	.4byte	.LLST6
	.uleb128 0x1e
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x1e3
	.byte	0x41
	.4byte	0x295
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.4byte	.LASF52
	.2byte	0x1e3
	.byte	0x55
	.4byte	0xad
	.4byte	.LLST7
	.uleb128 0x12
	.ascii	"i\000"
	.2byte	0x1e5
	.4byte	0xad
	.4byte	.LLST8
	.uleb128 0x7
	.4byte	.LASF53
	.2byte	0x1e6
	.byte	0x16
	.4byte	0x325
	.4byte	.LLST9
	.byte	0
	.uleb128 0x6
	.4byte	0xa8
	.uleb128 0x11
	.4byte	.LASF55
	.2byte	0x1b0
	.4byte	0xad
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a1
	.uleb128 0x3
	.4byte	.LASF50
	.2byte	0x1b0
	.byte	0x31
	.4byte	0x2ba
	.4byte	.LLST0
	.uleb128 0x3
	.4byte	.LASF51
	.2byte	0x1b0
	.byte	0x3f
	.4byte	0x193
	.4byte	.LLST1
	.uleb128 0x3
	.4byte	.LASF52
	.2byte	0x1b0
	.byte	0x53
	.4byte	0xad
	.4byte	.LLST2
	.uleb128 0x12
	.ascii	"i\000"
	.2byte	0x1b2
	.4byte	0xad
	.4byte	.LLST3
	.uleb128 0x7
	.4byte	.LASF56
	.2byte	0x1b3
	.byte	0xc
	.4byte	0x9c
	.4byte	.LLST4
	.uleb128 0x7
	.4byte	.LASF53
	.2byte	0x1b4
	.byte	0x16
	.4byte	0x325
	.4byte	.LLST5
	.byte	0
	.uleb128 0xd
	.4byte	.LASF57
	.2byte	0x196
	.byte	0x16
	.4byte	0x1c2
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3cc
	.uleb128 0x3
	.4byte	.LASF50
	.2byte	0x196
	.byte	0x40
	.4byte	0x3cc
	.4byte	.LLST22
	.byte	0
	.uleb128 0x6
	.4byte	0x290
	.uleb128 0xd
	.4byte	.LASF58
	.2byte	0x153
	.byte	0xa
	.4byte	0xad
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x460
	.uleb128 0x3
	.4byte	.LASF50
	.2byte	0x153
	.byte	0x2f
	.4byte	0x2ba
	.4byte	.LLST17
	.uleb128 0x3
	.4byte	.LASF51
	.2byte	0x153
	.byte	0x3e
	.4byte	0x18e
	.4byte	.LLST18
	.uleb128 0x3
	.4byte	.LASF52
	.2byte	0x153
	.byte	0x52
	.4byte	0xad
	.4byte	.LLST19
	.uleb128 0x7
	.4byte	.LASF59
	.2byte	0x155
	.byte	0xc
	.4byte	0xad
	.4byte	.LLST20
	.uleb128 0x7
	.4byte	.LASF60
	.2byte	0x156
	.byte	0xc
	.4byte	0xad
	.4byte	.LLST21
	.uleb128 0x13
	.4byte	.LVL62
	.4byte	0x32a
	.4byte	0x44f
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.4byte	.LVL64
	.4byte	0x2bf
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF61
	.2byte	0x11f
	.byte	0xa
	.4byte	0xad
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4dd
	.uleb128 0x3
	.4byte	.LASF50
	.2byte	0x11f
	.byte	0x30
	.4byte	0x2ba
	.4byte	.LLST12
	.uleb128 0x3
	.4byte	.LASF51
	.2byte	0x11f
	.byte	0x3f
	.4byte	0x18e
	.4byte	.LLST13
	.uleb128 0x3
	.4byte	.LASF52
	.2byte	0x11f
	.byte	0x53
	.4byte	0xad
	.4byte	.LLST14
	.uleb128 0x7
	.4byte	.LASF59
	.2byte	0x121
	.byte	0xc
	.4byte	0xad
	.4byte	.LLST15
	.uleb128 0x7
	.4byte	.LASF60
	.2byte	0x122
	.byte	0xc
	.4byte	0xad
	.4byte	.LLST16
	.uleb128 0x14
	.4byte	.LVL50
	.4byte	0x32a
	.uleb128 0x14
	.4byte	.LVL52
	.4byte	0x2bf
	.byte	0
	.uleb128 0x15
	.4byte	.LASF62
	.byte	0xee
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4ff
	.uleb128 0x16
	.4byte	.LASF50
	.byte	0xee
	.byte	0x41
	.4byte	0x2ba
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0xdf
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x521
	.uleb128 0x16
	.4byte	.LASF50
	.byte	0xdf
	.byte	0x3f
	.4byte	0x2ba
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF64
	.byte	0x1
	.byte	0xb3
	.byte	0x13
	.4byte	0x15e
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x55b
	.uleb128 0x17
	.4byte	.LASF50
	.byte	0xb3
	.byte	0x35
	.4byte	0x2ba
	.4byte	.LLST11
	.uleb128 0xe
	.4byte	.LVL39
	.4byte	0x4dd
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF65
	.byte	0x1
	.byte	0x67
	.byte	0x13
	.4byte	0x15e
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF50
	.byte	0x67
	.byte	0x33
	.4byte	0x2ba
	.4byte	.LLST10
	.uleb128 0x13
	.4byte	.LVL32
	.4byte	0x4ff
	.4byte	0x594
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.4byte	.LVL33
	.4byte	0x29a
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0xa
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x5
	.byte	0
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
	.uleb128 0xe
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 17
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
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
.LLST6:
	.byte	0x6
	.4byte	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL22-.LVL16
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL22-.LVL16
	.uleb128 .LVL23-.LVL16
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL16
	.uleb128 .LVL27-.LVL16
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL27-.LVL16
	.uleb128 .LFE343-.LVL16
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL19-.LVL16
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL19-.LVL16
	.uleb128 .LVL23-.LVL16
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL16
	.uleb128 .LVL24-.LVL16
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL24-.LVL16
	.uleb128 .LFE343-.LVL16
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL17-.LVL16
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL17-.LVL16
	.uleb128 .LVL20-.LVL16
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL23-.LVL16
	.uleb128 .LVL25-.LVL16
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL25-.LVL16
	.uleb128 .LFE343-.LVL16
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL21-.LVL19
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL24-.LVL19
	.uleb128 .LVL26-.LVL19
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL6-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL6-.LVL0
	.uleb128 .LVL7-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LFE342-.LVL0
	.uleb128 0x1
	.byte	0x50
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
	.uleb128 .LVL7-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LVL11-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL11-.LVL0
	.uleb128 .LFE342-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL4-.LVL0
	.uleb128 .LFE342-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST3:
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
	.uleb128 .LFE342-.LVL1
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL8
	.byte	0x4
	.uleb128 .LVL8-.LVL8
	.uleb128 .LVL10-.LVL8
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL12-.LVL8
	.uleb128 .LVL14-.LVL8
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL14-.LVL8
	.uleb128 .LVL15-.LVL8
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL10-.LVL9
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL13-.LVL9
	.uleb128 .LVL15-.LVL9
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST22:
	.byte	0x6
	.4byte	.LVL65
	.byte	0x4
	.uleb128 .LVL65-.LVL65
	.uleb128 .LVL66-.LVL65
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL66-.LVL65
	.uleb128 .LFE341-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x6
	.4byte	.LVL53
	.byte	0x4
	.uleb128 .LVL53-.LVL53
	.uleb128 .LVL55-.LVL53
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL55-.LVL53
	.uleb128 .LFE340-.LVL53
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST18:
	.byte	0x6
	.4byte	.LVL53
	.byte	0x4
	.uleb128 .LVL53-.LVL53
	.uleb128 .LVL56-.LVL53
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL56-.LVL53
	.uleb128 .LVL57-.LVL53
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL57-.LVL53
	.uleb128 .LVL62-1-.LVL53
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL62-1-.LVL53
	.uleb128 .LVL63-.LVL53
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL63-.LVL53
	.uleb128 .LVL64-1-.LVL53
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL64-1-.LVL53
	.uleb128 .LFE340-.LVL53
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL53
	.byte	0x4
	.uleb128 .LVL53-.LVL53
	.uleb128 .LVL56-.LVL53
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL56-.LVL53
	.uleb128 .LVL57-.LVL53
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL57-.LVL53
	.uleb128 .LVL62-1-.LVL53
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL62-1-.LVL53
	.uleb128 .LVL63-.LVL53
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL63-.LVL53
	.uleb128 .LVL64-1-.LVL53
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL64-1-.LVL53
	.uleb128 .LFE340-.LVL53
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST20:
	.byte	0x8
	.4byte	.LVL57
	.uleb128 .LVL59-.LVL57
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST21:
	.byte	0x6
	.4byte	.LVL54
	.byte	0x4
	.uleb128 .LVL54-.LVL54
	.uleb128 .LVL56-.LVL54
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL56-.LVL54
	.uleb128 .LVL57-.LVL54
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL57-.LVL54
	.uleb128 .LVL60-.LVL54
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL60-.LVL54
	.uleb128 .LVL61-.LVL54
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL61-.LVL54
	.uleb128 .LVL62-.LVL54
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL62-.LVL54
	.uleb128 .LVL63-.LVL54
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL63-.LVL54
	.uleb128 .LVL64-.LVL54
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL64-.LVL54
	.uleb128 .LFE340-.LVL54
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST12:
	.byte	0x6
	.4byte	.LVL42
	.byte	0x4
	.uleb128 .LVL42-.LVL42
	.uleb128 .LVL44-.LVL42
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL44-.LVL42
	.uleb128 .LVL49-.LVL42
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL49-.LVL42
	.uleb128 .LVL50-1-.LVL42
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL50-1-.LVL42
	.uleb128 .LVL51-.LVL42
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL51-.LVL42
	.uleb128 .LVL52-1-.LVL42
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL52-1-.LVL42
	.uleb128 .LFE339-.LVL42
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL42
	.byte	0x4
	.uleb128 .LVL42-.LVL42
	.uleb128 .LVL44-.LVL42
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL44-.LVL42
	.uleb128 .LVL45-.LVL42
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL45-.LVL42
	.uleb128 .LVL50-1-.LVL42
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL50-1-.LVL42
	.uleb128 .LVL51-.LVL42
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL51-.LVL42
	.uleb128 .LVL52-1-.LVL42
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL52-1-.LVL42
	.uleb128 .LFE339-.LVL42
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL42
	.byte	0x4
	.uleb128 .LVL42-.LVL42
	.uleb128 .LVL44-.LVL42
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL44-.LVL42
	.uleb128 .LVL45-.LVL42
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL45-.LVL42
	.uleb128 .LVL50-1-.LVL42
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL50-1-.LVL42
	.uleb128 .LVL51-.LVL42
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL51-.LVL42
	.uleb128 .LVL52-1-.LVL42
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL52-1-.LVL42
	.uleb128 .LFE339-.LVL42
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x8
	.4byte	.LVL45
	.uleb128 .LVL47-.LVL45
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST16:
	.byte	0x6
	.4byte	.LVL43
	.byte	0x4
	.uleb128 .LVL43-.LVL43
	.uleb128 .LVL44-.LVL43
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL44-.LVL43
	.uleb128 .LVL45-.LVL43
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL45-.LVL43
	.uleb128 .LVL48-.LVL43
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL43
	.uleb128 .LVL49-.LVL43
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL49-.LVL43
	.uleb128 .LVL50-.LVL43
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL50-.LVL43
	.uleb128 .LVL51-.LVL43
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL51-.LVL43
	.uleb128 .LVL52-.LVL43
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL52-.LVL43
	.uleb128 .LFE339-.LVL43
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL37
	.byte	0x4
	.uleb128 .LVL37-.LVL37
	.uleb128 .LVL38-.LVL37
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL38-.LVL37
	.uleb128 .LVL40-.LVL37
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL40-.LVL37
	.uleb128 .LVL41-.LVL37
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL41-.LVL37
	.uleb128 .LFE336-.LVL37
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST10:
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
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL31-.LVL29
	.uleb128 .LVL32-1-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL32-1-.LVL29
	.uleb128 .LVL34-.LVL29
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL34-.LVL29
	.uleb128 .LVL35-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL35-.LVL29
	.uleb128 .LFE335-.LVL29
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x5c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
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
.LLRL23:
	.byte	0x7
	.4byte	.LFB342
	.uleb128 .LFE342-.LFB342
	.byte	0x7
	.4byte	.LFB343
	.uleb128 .LFE343-.LFB343
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
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF23:
	.ascii	"HAL_ERROR\000"
.LASF51:
	.ascii	"pBuffer\000"
.LASF27:
	.ascii	"HAL_UNLOCKED\000"
.LASF31:
	.ascii	"HAL_CRC_STATE_READY\000"
.LASF25:
	.ascii	"HAL_TIMEOUT\000"
.LASF47:
	.ascii	"State\000"
.LASF68:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF60:
	.ascii	"temp\000"
.LASF0:
	.ascii	"short int\000"
.LASF61:
	.ascii	"HAL_CRC_Accumulate\000"
.LASF37:
	.ascii	"DefaultInitValueUse\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF53:
	.ascii	"pReg\000"
.LASF22:
	.ascii	"HAL_OK\000"
.LASF69:
	.ascii	"HAL_CRCEx_Polynomial_Set\000"
.LASF59:
	.ascii	"index\000"
.LASF24:
	.ascii	"HAL_BUSY\000"
.LASF54:
	.ascii	"CRC_Handle_16\000"
.LASF62:
	.ascii	"HAL_CRC_MspDeInit\000"
.LASF52:
	.ascii	"BufferLength\000"
.LASF67:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_crc.c\000"
.LASF9:
	.ascii	"long long int\000"
.LASF57:
	.ascii	"HAL_CRC_GetState\000"
.LASF63:
	.ascii	"HAL_CRC_MspInit\000"
.LASF42:
	.ascii	"OutputDataInversionMode\000"
.LASF45:
	.ascii	"Init\000"
.LASF6:
	.ascii	"long int\000"
.LASF46:
	.ascii	"Lock\000"
.LASF16:
	.ascii	"INIT\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF26:
	.ascii	"HAL_StatusTypeDef\000"
.LASF18:
	.ascii	"long double\000"
.LASF48:
	.ascii	"InputDataFormat\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF43:
	.ascii	"CRC_InitTypeDef\000"
.LASF1:
	.ascii	"signed char\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF55:
	.ascii	"CRC_Handle_8\000"
.LASF49:
	.ascii	"CRC_HandleTypeDef\000"
.LASF44:
	.ascii	"Instance\000"
.LASF41:
	.ascii	"InputDataInversionMode\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF66:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF30:
	.ascii	"HAL_CRC_STATE_RESET\000"
.LASF19:
	.ascii	"char\000"
.LASF35:
	.ascii	"HAL_CRC_StateTypeDef\000"
.LASF40:
	.ascii	"InitValue\000"
.LASF56:
	.ascii	"data\000"
.LASF28:
	.ascii	"HAL_LOCKED\000"
.LASF13:
	.ascii	"uint16_t\000"
.LASF20:
	.ascii	"float\000"
.LASF15:
	.ascii	"RESERVED2\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF21:
	.ascii	"double\000"
.LASF32:
	.ascii	"HAL_CRC_STATE_BUSY\000"
.LASF34:
	.ascii	"HAL_CRC_STATE_ERROR\000"
.LASF36:
	.ascii	"DefaultPolynomialUse\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF17:
	.ascii	"CRC_TypeDef\000"
.LASF33:
	.ascii	"HAL_CRC_STATE_TIMEOUT\000"
.LASF38:
	.ascii	"GeneratingPolynomial\000"
.LASF58:
	.ascii	"HAL_CRC_Calculate\000"
.LASF39:
	.ascii	"CRCLength\000"
.LASF64:
	.ascii	"HAL_CRC_DeInit\000"
.LASF29:
	.ascii	"HAL_LockTypeDef\000"
.LASF65:
	.ascii	"HAL_CRC_Init\000"
.LASF50:
	.ascii	"hcrc\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
