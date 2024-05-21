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
	.file	"stm32h7xx_hal_usart_ex.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_usart_ex.c"
	.section	.text.USARTEx_SetNbDataToProcess,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	USARTEx_SetNbDataToProcess, %function
USARTEx_SetNbDataToProcess:
.LFB344:
	.loc 1 500 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 501 3
	.loc 1 502 3
	.loc 1 503 3
	.loc 1 504 3
	.loc 1 506 3
	.loc 1 507 3
	.loc 1 509 3
	.loc 1 509 13 is_stmt 0
	ldr	r3, [r0, #68]
	.loc 1 509 6
	cbnz	r3, .L2
	.loc 1 511 5 is_stmt 1
	.loc 1 511 31 is_stmt 0
	movs	r3, #1
	strh	r3, [r0, #60]	@ movhi
	.loc 1 512 5 is_stmt 1
	.loc 1 512 31 is_stmt 0
	strh	r3, [r0, #58]	@ movhi
	bx	lr
.L2:
	.loc 1 500 1
	push	{r4, r5}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
	.loc 1 516 5 is_stmt 1
.LVL1:
	.loc 1 517 5
	.loc 1 518 5
	.loc 1 518 44 is_stmt 0
	ldr	r3, [r0]
	.loc 1 518 54
	ldr	r2, [r3, #8]
	.loc 1 518 23
	ubfx	r2, r2, #25, #3
.LVL2:
	.loc 1 520 5 is_stmt 1
	.loc 1 520 54 is_stmt 0
	ldr	r1, [r3, #8]
	.loc 1 520 23
	lsrs	r1, r1, #29
.LVL3:
	.loc 1 522 5 is_stmt 1
	.loc 1 522 69 is_stmt 0
	ldr	r5, .L7
	ldrb	r3, [r5, r1]	@ zero_extendqisi2
	.loc 1 522 58
	lsls	r3, r3, #4
	.loc 1 523 54
	ldr	r4, .L7+4
	ldrb	r1, [r4, r1]	@ zero_extendqisi2
.LVL4:
	.loc 1 522 90
	sdiv	r3, r3, r1
	.loc 1 522 31
	strh	r3, [r0, #60]	@ movhi
	.loc 1 524 5 is_stmt 1
	.loc 1 524 69 is_stmt 0
	ldrb	r3, [r5, r2]	@ zero_extendqisi2
	.loc 1 524 58
	lsls	r3, r3, #4
	.loc 1 525 54
	ldrb	r2, [r4, r2]	@ zero_extendqisi2
.LVL5:
	.loc 1 524 90
	sdiv	r3, r3, r2
	.loc 1 524 31
	strh	r3, [r0, #58]	@ movhi
	.loc 1 527 1
	pop	{r4, r5}
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L8:
	.align	2
.L7:
	.word	numerator.1
	.word	denominator.0
	.cfi_endproc
.LFE344:
	.size	USARTEx_SetNbDataToProcess, .-USARTEx_SetNbDataToProcess
	.section	.text.HAL_USARTEx_RxFifoFullCallback,"ax",%progbits
	.align	1
	.weak	HAL_USARTEx_RxFifoFullCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_USARTEx_RxFifoFullCallback, %function
HAL_USARTEx_RxFifoFullCallback:
.LFB335:
	.loc 1 110 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL6:
	.loc 1 112 3
	.loc 1 117 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE335:
	.size	HAL_USARTEx_RxFifoFullCallback, .-HAL_USARTEx_RxFifoFullCallback
	.section	.text.HAL_USARTEx_TxFifoEmptyCallback,"ax",%progbits
	.align	1
	.weak	HAL_USARTEx_TxFifoEmptyCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_USARTEx_TxFifoEmptyCallback, %function
HAL_USARTEx_TxFifoEmptyCallback:
.LFB336:
	.loc 1 125 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL7:
	.loc 1 127 3
	.loc 1 132 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE336:
	.size	HAL_USARTEx_TxFifoEmptyCallback, .-HAL_USARTEx_TxFifoEmptyCallback
	.section	.text.HAL_USARTEx_EnableSlaveMode,"ax",%progbits
	.align	1
	.global	HAL_USARTEx_EnableSlaveMode
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_USARTEx_EnableSlaveMode, %function
HAL_USARTEx_EnableSlaveMode:
.LFB337:
	.loc 1 175 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL8:
	.loc 1 176 3
	.loc 1 179 3
	.loc 1 182 3
	.loc 1 182 7
	.loc 1 182 18 is_stmt 0
	ldrb	r2, [r0, #88]	@ zero_extendqisi2
	.loc 1 182 9
	cmp	r2, #1
	beq	.L13
	.loc 1 175 1 discriminator 2
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	mov	r3, r0
	.loc 1 182 68 is_stmt 1 discriminator 2
	.loc 1 182 83 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #88]
	.loc 1 182 5 is_stmt 1 discriminator 2
	.loc 1 184 3 discriminator 2
	.loc 1 184 17 is_stmt 0 discriminator 2
	movs	r1, #2
	strb	r1, [r0, #89]
	.loc 1 187 3 is_stmt 1 discriminator 2
	.loc 1 187 20 is_stmt 0 discriminator 2
	ldr	r1, [r0]
	.loc 1 187 10 discriminator 2
	ldr	r4, [r1]
.LVL9:
	.loc 1 190 3 is_stmt 1 discriminator 2
	.loc 1 190 22 is_stmt 0 discriminator 2
	ldr	r0, [r1]
.LVL10:
	.loc 1 190 28 discriminator 2
	bic	r0, r0, #1
	str	r0, [r1]
	.loc 1 195 3 is_stmt 1 discriminator 2
	.loc 1 195 11 is_stmt 0 discriminator 2
	ldr	r0, [r3]
	.loc 1 195 21 discriminator 2
	ldr	r1, [r0, #4]
	.loc 1 195 28 discriminator 2
	bic	r1, r1, #18432
	str	r1, [r0, #4]
	.loc 1 196 3 is_stmt 1 discriminator 2
	.loc 1 196 11 is_stmt 0 discriminator 2
	ldr	r0, [r3]
	.loc 1 196 21 discriminator 2
	ldr	r1, [r0, #8]
	.loc 1 196 28 discriminator 2
	bic	r1, r1, #42
	str	r1, [r0, #8]
	.loc 1 199 3 is_stmt 1 discriminator 2
	.loc 1 199 11 is_stmt 0 discriminator 2
	ldr	r0, [r3]
	.loc 1 199 21 discriminator 2
	ldr	r1, [r0, #4]
	.loc 1 199 28 discriminator 2
	orrs	r1, r1, r2
	str	r1, [r0, #4]
	.loc 1 202 3 is_stmt 1 discriminator 2
	.loc 1 202 11 is_stmt 0 discriminator 2
	ldr	r1, [r3]
	.loc 1 202 28 discriminator 2
	str	r4, [r1]
	.loc 1 204 3 is_stmt 1 discriminator 2
	.loc 1 204 21 is_stmt 0 discriminator 2
	str	r2, [r3, #64]
	.loc 1 206 3 is_stmt 1 discriminator 2
	.loc 1 206 17 is_stmt 0 discriminator 2
	strb	r2, [r3, #89]
	.loc 1 209 3 is_stmt 1 discriminator 2
	.loc 1 209 12 is_stmt 0 discriminator 2
	ldr	r1, [r3]
	.loc 1 209 22 discriminator 2
	ldr	r2, [r1]
	.loc 1 209 28 discriminator 2
	orr	r2, r2, #1
	str	r2, [r1]
	.loc 1 212 3 is_stmt 1 discriminator 2
	.loc 1 212 7 discriminator 2
	.loc 1 212 22 is_stmt 0 discriminator 2
	movs	r0, #0
	strb	r0, [r3, #88]
	.loc 1 212 5 is_stmt 1 discriminator 2
	.loc 1 214 3 discriminator 2
	.loc 1 215 1 is_stmt 0 discriminator 2
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL11:
	bx	lr
.LVL12:
.L13:
	.loc 1 182 49
	movs	r0, #2
.LVL13:
	.loc 1 215 1
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_USARTEx_EnableSlaveMode, .-HAL_USARTEx_EnableSlaveMode
	.section	.text.HAL_USARTEx_DisableSlaveMode,"ax",%progbits
	.align	1
	.global	HAL_USARTEx_DisableSlaveMode
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_USARTEx_DisableSlaveMode, %function
HAL_USARTEx_DisableSlaveMode:
.LFB338:
	.loc 1 223 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL14:
	.loc 1 224 3
	.loc 1 227 3
	.loc 1 230 3
	.loc 1 230 7
	.loc 1 230 18 is_stmt 0
	ldrb	r3, [r0, #88]	@ zero_extendqisi2
	.loc 1 230 9
	cmp	r3, #1
	beq	.L20
	.loc 1 223 1 discriminator 2
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 230 68 is_stmt 1 discriminator 2
	.loc 1 230 83 is_stmt 0 discriminator 2
	movs	r1, #1
	strb	r1, [r0, #88]
	.loc 1 230 5 is_stmt 1 discriminator 2
	.loc 1 232 3 discriminator 2
	.loc 1 232 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #89]
	.loc 1 235 3 is_stmt 1 discriminator 2
	.loc 1 235 20 is_stmt 0 discriminator 2
	ldr	r3, [r0]
	.loc 1 235 10 discriminator 2
	ldr	r4, [r3]
.LVL15:
	.loc 1 238 3 is_stmt 1 discriminator 2
	.loc 1 238 22 is_stmt 0 discriminator 2
	ldr	r2, [r3]
	.loc 1 238 28 discriminator 2
	bic	r2, r2, #1
	str	r2, [r3]
	.loc 1 241 3 is_stmt 1 discriminator 2
	.loc 1 241 11 is_stmt 0 discriminator 2
	ldr	r2, [r0]
	.loc 1 241 21 discriminator 2
	ldr	r3, [r2, #4]
	.loc 1 241 28 discriminator 2
	bic	r3, r3, #1
	str	r3, [r2, #4]
	.loc 1 244 3 is_stmt 1 discriminator 2
	.loc 1 244 11 is_stmt 0 discriminator 2
	ldr	r3, [r0]
	.loc 1 244 28 discriminator 2
	str	r4, [r3]
	.loc 1 246 3 is_stmt 1 discriminator 2
	.loc 1 246 21 is_stmt 0 discriminator 2
	movs	r3, #0
	str	r3, [r0, #64]
	.loc 1 248 3 is_stmt 1 discriminator 2
	.loc 1 248 17 is_stmt 0 discriminator 2
	strb	r1, [r0, #89]
	.loc 1 251 3 is_stmt 1 discriminator 2
	.loc 1 251 7 discriminator 2
	.loc 1 251 22 is_stmt 0 discriminator 2
	strb	r3, [r0, #88]
	.loc 1 251 5 is_stmt 1 discriminator 2
	.loc 1 253 3 discriminator 2
	.loc 1 253 10 is_stmt 0 discriminator 2
	mov	r0, r3
.LVL16:
	.loc 1 254 1 discriminator 2
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL17:
	bx	lr
.LVL18:
.L20:
	.loc 1 230 49
	movs	r0, #2
.LVL19:
	.loc 1 254 1
	bx	lr
	.cfi_endproc
.LFE338:
	.size	HAL_USARTEx_DisableSlaveMode, .-HAL_USARTEx_DisableSlaveMode
	.section	.text.HAL_USARTEx_ConfigNSS,"ax",%progbits
	.align	1
	.global	HAL_USARTEx_ConfigNSS
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_USARTEx_ConfigNSS, %function
HAL_USARTEx_ConfigNSS:
.LFB339:
	.loc 1 271 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL20:
	.loc 1 272 3
	.loc 1 275 3
	.loc 1 276 3
	.loc 1 279 3
	.loc 1 279 7
	.loc 1 279 18 is_stmt 0
	ldrb	r2, [r0, #88]	@ zero_extendqisi2
	.loc 1 279 9
	cmp	r2, #1
	beq	.L27
	.loc 1 271 1 discriminator 2
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	mov	r3, r0
	.loc 1 279 68 is_stmt 1 discriminator 2
	.loc 1 279 83 is_stmt 0 discriminator 2
	mov	ip, #1
	strb	ip, [r0, #88]
	.loc 1 279 5 is_stmt 1 discriminator 2
	.loc 1 281 3 discriminator 2
	.loc 1 281 17 is_stmt 0 discriminator 2
	movs	r2, #2
	strb	r2, [r0, #89]
	.loc 1 284 3 is_stmt 1 discriminator 2
	.loc 1 284 20 is_stmt 0 discriminator 2
	ldr	r2, [r0]
	.loc 1 284 10 discriminator 2
	ldr	r4, [r2]
.LVL21:
	.loc 1 287 3 is_stmt 1 discriminator 2
	.loc 1 287 22 is_stmt 0 discriminator 2
	ldr	r0, [r2]
.LVL22:
	.loc 1 287 28 discriminator 2
	bic	r0, r0, #1
	str	r0, [r2]
	.loc 1 290 3 is_stmt 1 discriminator 2
	.loc 1 290 44 is_stmt 0 discriminator 2
	ldr	r0, [r3]
	.loc 1 290 54 discriminator 2
	ldr	r2, [r0, #4]
	.loc 1 290 63 discriminator 2
	bic	r2, r2, #8
	.loc 1 290 87 discriminator 2
	orrs	r1, r1, r2
.LVL23:
	.loc 1 290 30 discriminator 2
	str	r1, [r0, #4]
	.loc 1 293 3 is_stmt 1 discriminator 2
	.loc 1 293 11 is_stmt 0 discriminator 2
	ldr	r2, [r3]
	.loc 1 293 28 discriminator 2
	str	r4, [r2]
	.loc 1 295 3 is_stmt 1 discriminator 2
	.loc 1 295 17 is_stmt 0 discriminator 2
	strb	ip, [r3, #89]
	.loc 1 298 3 is_stmt 1 discriminator 2
	.loc 1 298 7 discriminator 2
	.loc 1 298 22 is_stmt 0 discriminator 2
	movs	r0, #0
	strb	r0, [r3, #88]
	.loc 1 298 5 is_stmt 1 discriminator 2
	.loc 1 300 3 discriminator 2
	.loc 1 301 1 is_stmt 0 discriminator 2
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL24:
	bx	lr
.LVL25:
.L27:
	.loc 1 279 49
	movs	r0, #2
.LVL26:
	.loc 1 301 1
	bx	lr
	.cfi_endproc
.LFE339:
	.size	HAL_USARTEx_ConfigNSS, .-HAL_USARTEx_ConfigNSS
	.section	.text.HAL_USARTEx_EnableFifoMode,"ax",%progbits
	.align	1
	.global	HAL_USARTEx_EnableFifoMode
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_USARTEx_EnableFifoMode, %function
HAL_USARTEx_EnableFifoMode:
.LFB340:
	.loc 1 309 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL27:
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	.loc 1 310 3
	.loc 1 313 3
	.loc 1 316 3
	.loc 1 316 7
	.loc 1 316 18 is_stmt 0
	ldrb	r3, [r0, #88]	@ zero_extendqisi2
	.loc 1 316 9
	cmp	r3, #1
	beq	.L34
	mov	r4, r0
	.loc 1 316 68 is_stmt 1 discriminator 2
	.loc 1 316 83 is_stmt 0 discriminator 2
	movs	r5, #1
	strb	r5, [r0, #88]
	.loc 1 316 5 is_stmt 1 discriminator 2
	.loc 1 318 3 discriminator 2
	.loc 1 318 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #89]
	.loc 1 321 3 is_stmt 1 discriminator 2
	.loc 1 321 20 is_stmt 0 discriminator 2
	ldr	r2, [r0]
	.loc 1 321 10 discriminator 2
	ldr	r3, [r2]
.LVL28:
	.loc 1 324 3 is_stmt 1 discriminator 2
	.loc 1 324 22 is_stmt 0 discriminator 2
	ldr	r1, [r2]
	.loc 1 324 28 discriminator 2
	bic	r1, r1, #1
	str	r1, [r2]
	.loc 1 327 3 is_stmt 1 discriminator 2
	.loc 1 327 13 is_stmt 0 discriminator 2
	orr	r3, r3, #536870912
.LVL29:
	.loc 1 328 3 is_stmt 1 discriminator 2
	.loc 1 328 20 is_stmt 0 discriminator 2
	mov	r2, #536870912
	str	r2, [r0, #68]
	.loc 1 331 3 is_stmt 1 discriminator 2
	.loc 1 331 11 is_stmt 0 discriminator 2
	ldr	r2, [r0]
	.loc 1 331 28 discriminator 2
	str	r3, [r2]
	.loc 1 334 3 is_stmt 1 discriminator 2
	bl	USARTEx_SetNbDataToProcess
.LVL30:
	.loc 1 336 3 discriminator 2
	.loc 1 336 17 is_stmt 0 discriminator 2
	strb	r5, [r4, #89]
	.loc 1 339 3 is_stmt 1 discriminator 2
	.loc 1 339 7 discriminator 2
	.loc 1 339 22 is_stmt 0 discriminator 2
	movs	r0, #0
	strb	r0, [r4, #88]
	.loc 1 339 5 is_stmt 1 discriminator 2
	.loc 1 341 3 discriminator 2
.LVL31:
.L33:
	.loc 1 342 1 is_stmt 0
	pop	{r3, r4, r5, pc}
.LVL32:
.L34:
	.loc 1 316 49
	movs	r0, #2
.LVL33:
	b	.L33
	.cfi_endproc
.LFE340:
	.size	HAL_USARTEx_EnableFifoMode, .-HAL_USARTEx_EnableFifoMode
	.section	.text.HAL_USARTEx_DisableFifoMode,"ax",%progbits
	.align	1
	.global	HAL_USARTEx_DisableFifoMode
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_USARTEx_DisableFifoMode, %function
HAL_USARTEx_DisableFifoMode:
.LFB341:
	.loc 1 350 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL34:
	.loc 1 351 3
	.loc 1 354 3
	.loc 1 357 3
	.loc 1 357 7
	.loc 1 357 18 is_stmt 0
	ldrb	r3, [r0, #88]	@ zero_extendqisi2
	.loc 1 357 9
	cmp	r3, #1
	beq	.L38
	.loc 1 357 68 is_stmt 1 discriminator 2
	.loc 1 357 83 is_stmt 0 discriminator 2
	mov	ip, #1
	strb	ip, [r0, #88]
	.loc 1 357 5 is_stmt 1 discriminator 2
	.loc 1 359 3 discriminator 2
	.loc 1 359 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #89]
	.loc 1 362 3 is_stmt 1 discriminator 2
	.loc 1 362 20 is_stmt 0 discriminator 2
	ldr	r3, [r0]
	.loc 1 362 10 discriminator 2
	ldr	r2, [r3]
.LVL35:
	.loc 1 365 3 is_stmt 1 discriminator 2
	.loc 1 365 22 is_stmt 0 discriminator 2
	ldr	r1, [r3]
	.loc 1 365 28 discriminator 2
	bic	r1, r1, #1
	str	r1, [r3]
	.loc 1 368 3 is_stmt 1 discriminator 2
	.loc 1 368 13 is_stmt 0 discriminator 2
	bic	r2, r2, #536870912
.LVL36:
	.loc 1 369 3 is_stmt 1 discriminator 2
	.loc 1 369 20 is_stmt 0 discriminator 2
	movs	r3, #0
	str	r3, [r0, #68]
	.loc 1 372 3 is_stmt 1 discriminator 2
	.loc 1 372 11 is_stmt 0 discriminator 2
	ldr	r1, [r0]
	.loc 1 372 28 discriminator 2
	str	r2, [r1]
	.loc 1 374 3 is_stmt 1 discriminator 2
	.loc 1 374 17 is_stmt 0 discriminator 2
	strb	ip, [r0, #89]
	.loc 1 377 3 is_stmt 1 discriminator 2
	.loc 1 377 7 discriminator 2
	.loc 1 377 22 is_stmt 0 discriminator 2
	strb	r3, [r0, #88]
	.loc 1 377 5 is_stmt 1 discriminator 2
	.loc 1 379 3 discriminator 2
	.loc 1 379 10 is_stmt 0 discriminator 2
	mov	r0, r3
.LVL37:
	bx	lr
.LVL38:
.L38:
	.loc 1 357 49
	movs	r0, #2
.LVL39:
	.loc 1 380 1
	bx	lr
	.cfi_endproc
.LFE341:
	.size	HAL_USARTEx_DisableFifoMode, .-HAL_USARTEx_DisableFifoMode
	.section	.text.HAL_USARTEx_SetTxFifoThreshold,"ax",%progbits
	.align	1
	.global	HAL_USARTEx_SetTxFifoThreshold
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_USARTEx_SetTxFifoThreshold, %function
HAL_USARTEx_SetTxFifoThreshold:
.LFB342:
	.loc 1 396 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL40:
	.loc 1 397 3
	.loc 1 400 3
	.loc 1 401 3
	.loc 1 404 3
	.loc 1 404 7
	.loc 1 404 18 is_stmt 0
	ldrb	r3, [r0, #88]	@ zero_extendqisi2
	.loc 1 404 9
	cmp	r3, #1
	beq	.L41
	.loc 1 396 1 discriminator 2
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 404 68 is_stmt 1 discriminator 2
	.loc 1 404 83 is_stmt 0 discriminator 2
	movs	r5, #1
	strb	r5, [r0, #88]
	.loc 1 404 5 is_stmt 1 discriminator 2
	.loc 1 406 3 discriminator 2
	.loc 1 406 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #89]
	.loc 1 409 3 is_stmt 1 discriminator 2
	.loc 1 409 20 is_stmt 0 discriminator 2
	ldr	r3, [r0]
	.loc 1 409 10 discriminator 2
	ldr	r6, [r3]
.LVL41:
	.loc 1 412 3 is_stmt 1 discriminator 2
	.loc 1 412 22 is_stmt 0 discriminator 2
	ldr	r2, [r3]
	.loc 1 412 28 discriminator 2
	bic	r2, r2, #1
	str	r2, [r3]
	.loc 1 415 3 is_stmt 1 discriminator 2
	.loc 1 415 44 is_stmt 0 discriminator 2
	ldr	r2, [r0]
	.loc 1 415 54 discriminator 2
	ldr	r3, [r2, #8]
	.loc 1 415 63 discriminator 2
	bic	r3, r3, #-536870912
	.loc 1 415 88 discriminator 2
	orrs	r1, r1, r3
.LVL42:
	.loc 1 415 30 discriminator 2
	str	r1, [r2, #8]
	.loc 1 418 3 is_stmt 1 discriminator 2
	bl	USARTEx_SetNbDataToProcess
.LVL43:
	.loc 1 421 3 discriminator 2
	.loc 1 421 11 is_stmt 0 discriminator 2
	ldr	r3, [r4]
	.loc 1 421 28 discriminator 2
	str	r6, [r3]
	.loc 1 423 3 is_stmt 1 discriminator 2
	.loc 1 423 17 is_stmt 0 discriminator 2
	strb	r5, [r4, #89]
	.loc 1 426 3 is_stmt 1 discriminator 2
	.loc 1 426 7 discriminator 2
	.loc 1 426 22 is_stmt 0 discriminator 2
	movs	r0, #0
	strb	r0, [r4, #88]
	.loc 1 426 5 is_stmt 1 discriminator 2
	.loc 1 428 3 discriminator 2
	.loc 1 429 1 is_stmt 0 discriminator 2
	pop	{r4, r5, r6, pc}
.LVL44:
.L41:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 14
	.loc 1 404 49
	movs	r0, #2
.LVL45:
	.loc 1 429 1
	bx	lr
	.cfi_endproc
.LFE342:
	.size	HAL_USARTEx_SetTxFifoThreshold, .-HAL_USARTEx_SetTxFifoThreshold
	.section	.text.HAL_USARTEx_SetRxFifoThreshold,"ax",%progbits
	.align	1
	.global	HAL_USARTEx_SetRxFifoThreshold
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_USARTEx_SetRxFifoThreshold, %function
HAL_USARTEx_SetRxFifoThreshold:
.LFB343:
	.loc 1 445 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL46:
	.loc 1 446 3
	.loc 1 449 3
	.loc 1 450 3
	.loc 1 453 3
	.loc 1 453 7
	.loc 1 453 18 is_stmt 0
	ldrb	r3, [r0, #88]	@ zero_extendqisi2
	.loc 1 453 9
	cmp	r3, #1
	beq	.L48
	.loc 1 445 1 discriminator 2
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 453 68 is_stmt 1 discriminator 2
	.loc 1 453 83 is_stmt 0 discriminator 2
	movs	r5, #1
	strb	r5, [r0, #88]
	.loc 1 453 5 is_stmt 1 discriminator 2
	.loc 1 455 3 discriminator 2
	.loc 1 455 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #89]
	.loc 1 458 3 is_stmt 1 discriminator 2
	.loc 1 458 20 is_stmt 0 discriminator 2
	ldr	r3, [r0]
	.loc 1 458 10 discriminator 2
	ldr	r6, [r3]
.LVL47:
	.loc 1 461 3 is_stmt 1 discriminator 2
	.loc 1 461 22 is_stmt 0 discriminator 2
	ldr	r2, [r3]
	.loc 1 461 28 discriminator 2
	bic	r2, r2, #1
	str	r2, [r3]
	.loc 1 464 3 is_stmt 1 discriminator 2
	.loc 1 464 44 is_stmt 0 discriminator 2
	ldr	r2, [r0]
	.loc 1 464 54 discriminator 2
	ldr	r3, [r2, #8]
	.loc 1 464 63 discriminator 2
	bic	r3, r3, #234881024
	.loc 1 464 88 discriminator 2
	orrs	r1, r1, r3
.LVL48:
	.loc 1 464 30 discriminator 2
	str	r1, [r2, #8]
	.loc 1 467 3 is_stmt 1 discriminator 2
	bl	USARTEx_SetNbDataToProcess
.LVL49:
	.loc 1 470 3 discriminator 2
	.loc 1 470 11 is_stmt 0 discriminator 2
	ldr	r3, [r4]
	.loc 1 470 28 discriminator 2
	str	r6, [r3]
	.loc 1 472 3 is_stmt 1 discriminator 2
	.loc 1 472 17 is_stmt 0 discriminator 2
	strb	r5, [r4, #89]
	.loc 1 475 3 is_stmt 1 discriminator 2
	.loc 1 475 7 discriminator 2
	.loc 1 475 22 is_stmt 0 discriminator 2
	movs	r0, #0
	strb	r0, [r4, #88]
	.loc 1 475 5 is_stmt 1 discriminator 2
	.loc 1 477 3 discriminator 2
	.loc 1 478 1 is_stmt 0 discriminator 2
	pop	{r4, r5, r6, pc}
.LVL50:
.L48:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 14
	.loc 1 453 49
	movs	r0, #2
.LVL51:
	.loc 1 478 1
	bx	lr
	.cfi_endproc
.LFE343:
	.size	HAL_USARTEx_SetRxFifoThreshold, .-HAL_USARTEx_SetRxFifoThreshold
	.section	.rodata.denominator.0,"a"
	.align	2
	.type	denominator.0, %object
	.size	denominator.0, 8
denominator.0:
	.ascii	"\010\004\002\004\010\001\001\001"
	.section	.rodata.numerator.1,"a"
	.align	2
	.type	numerator.1, %object
	.size	numerator.1, 8
numerator.1:
	.ascii	"\001\001\001\003\007\001\000\000"
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dma.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_usart.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x98d
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x1c
	.4byte	.LASF131
	.byte	0x1d
	.4byte	.LASF132
	.4byte	.LASF133
	.4byte	.LLRL19
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF0
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x40
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x39
	.byte	0x1c
	.4byte	0x53
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x6d
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x1d
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x34
	.uleb128 0x11
	.4byte	0x90
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x24
	.byte	0x14
	.4byte	0x47
	.uleb128 0xd
	.4byte	0xa1
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x61
	.uleb128 0xd
	.4byte	0xb2
	.uleb128 0xa
	.byte	0x4
	.2byte	0x250
	.4byte	0xd8
	.uleb128 0x6
	.ascii	"CCR\000"
	.2byte	0x252
	.4byte	0xbe
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF15
	.2byte	0x253
	.byte	0x2
	.4byte	0xc3
	.uleb128 0xa
	.byte	0x8
	.2byte	0x255
	.4byte	0x105
	.uleb128 0x6
	.ascii	"CSR\000"
	.2byte	0x257
	.4byte	0xbe
	.byte	0
	.uleb128 0x6
	.ascii	"CFR\000"
	.2byte	0x258
	.4byte	0xbe
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF16
	.2byte	0x259
	.byte	0x2
	.4byte	0xe4
	.uleb128 0xa
	.byte	0x4
	.2byte	0x25b
	.4byte	0x126
	.uleb128 0x9
	.4byte	.LASF17
	.2byte	0x25d
	.4byte	0xbe
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF18
	.2byte	0x25e
	.byte	0x2
	.4byte	0x111
	.uleb128 0xa
	.byte	0x8
	.2byte	0x260
	.4byte	0x153
	.uleb128 0x9
	.4byte	.LASF19
	.2byte	0x262
	.4byte	0xbe
	.byte	0
	.uleb128 0x9
	.4byte	.LASF20
	.2byte	0x263
	.4byte	0xbe
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF21
	.2byte	0x264
	.byte	0x2
	.4byte	0x132
	.uleb128 0xa
	.byte	0x30
	.2byte	0x638
	.4byte	0x1f8
	.uleb128 0x6
	.ascii	"CR1\000"
	.2byte	0x63a
	.4byte	0xbe
	.byte	0
	.uleb128 0x6
	.ascii	"CR2\000"
	.2byte	0x63b
	.4byte	0xbe
	.byte	0x4
	.uleb128 0x6
	.ascii	"CR3\000"
	.2byte	0x63c
	.4byte	0xbe
	.byte	0x8
	.uleb128 0x6
	.ascii	"BRR\000"
	.2byte	0x63d
	.4byte	0xbe
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF22
	.2byte	0x63e
	.4byte	0xbe
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF23
	.2byte	0x63f
	.4byte	0xbe
	.byte	0x14
	.uleb128 0x6
	.ascii	"RQR\000"
	.2byte	0x640
	.4byte	0xbe
	.byte	0x18
	.uleb128 0x6
	.ascii	"ISR\000"
	.2byte	0x641
	.4byte	0xbe
	.byte	0x1c
	.uleb128 0x6
	.ascii	"ICR\000"
	.2byte	0x642
	.4byte	0xbe
	.byte	0x20
	.uleb128 0x6
	.ascii	"RDR\000"
	.2byte	0x643
	.4byte	0xbe
	.byte	0x24
	.uleb128 0x6
	.ascii	"TDR\000"
	.2byte	0x644
	.4byte	0xbe
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF24
	.2byte	0x645
	.4byte	0xbe
	.byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF25
	.2byte	0x646
	.byte	0x3
	.4byte	0x15f
	.uleb128 0x4
	.byte	0x8
	.byte	0x4
	.4byte	.LASF26
	.uleb128 0x1e
	.byte	0x4
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF27
	.uleb128 0x4
	.byte	0x4
	.byte	0x4
	.4byte	.LASF28
	.uleb128 0x4
	.byte	0x8
	.byte	0x4
	.4byte	.LASF29
	.uleb128 0xe
	.4byte	0x40
	.byte	0x5
	.byte	0x28
	.4byte	0x246
	.uleb128 0x2
	.4byte	.LASF30
	.byte	0
	.uleb128 0x2
	.4byte	.LASF31
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF32
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF33
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF34
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0x222
	.uleb128 0xe
	.4byte	0x40
	.byte	0x5
	.byte	0x33
	.4byte	0x26a
	.uleb128 0x2
	.4byte	.LASF35
	.byte	0
	.uleb128 0x2
	.4byte	.LASF36
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF37
	.byte	0x5
	.byte	0x36
	.byte	0x3
	.4byte	0x252
	.uleb128 0x12
	.byte	0x30
	.byte	0x6
	.byte	0x30
	.4byte	0x31b
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0x6
	.byte	0x32
	.byte	0xc
	.4byte	0xb2
	.byte	0
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0x6
	.byte	0x35
	.byte	0xc
	.4byte	0xb2
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0x6
	.byte	0x39
	.byte	0xc
	.4byte	0xb2
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF41
	.byte	0x6
	.byte	0x3c
	.byte	0xc
	.4byte	0xb2
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x6
	.byte	0x3f
	.byte	0xc
	.4byte	0xb2
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x6
	.byte	0x42
	.byte	0xc
	.4byte	0xb2
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x6
	.byte	0x45
	.byte	0xc
	.4byte	0xb2
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x6
	.byte	0x4a
	.byte	0xc
	.4byte	0xb2
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x6
	.byte	0x4d
	.byte	0xc
	.4byte	0xb2
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x6
	.byte	0x52
	.byte	0xc
	.4byte	0xb2
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0x6
	.byte	0x55
	.byte	0xc
	.4byte	0xb2
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x6
	.byte	0x5b
	.byte	0xc
	.4byte	0xb2
	.byte	0x2c
	.byte	0
	.uleb128 0x3
	.4byte	.LASF50
	.byte	0x6
	.byte	0x60
	.byte	0x2
	.4byte	0x276
	.uleb128 0xe
	.4byte	0x40
	.byte	0x6
	.byte	0x66
	.4byte	0x351
	.uleb128 0x2
	.4byte	.LASF51
	.byte	0
	.uleb128 0x2
	.4byte	.LASF52
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF53
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF54
	.byte	0x3
	.uleb128 0x2
	.4byte	.LASF55
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF56
	.byte	0x6
	.byte	0x6c
	.byte	0x2
	.4byte	0x327
	.uleb128 0xd
	.4byte	0x351
	.uleb128 0x13
	.4byte	.LASF96
	.byte	0x78
	.byte	0x6
	.byte	0x88
	.4byte	0x473
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0x6
	.byte	0x8a
	.byte	0x9
	.4byte	0x20b
	.byte	0
	.uleb128 0x1
	.4byte	.LASF58
	.byte	0x6
	.byte	0x8c
	.byte	0x13
	.4byte	0x31b
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF59
	.byte	0x6
	.byte	0x8e
	.byte	0x13
	.4byte	0x26a
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF60
	.byte	0x6
	.byte	0x90
	.byte	0x21
	.4byte	0x35d
	.byte	0x35
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x6
	.byte	0x92
	.byte	0x9
	.4byte	0x20b
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF62
	.byte	0x6
	.byte	0x94
	.byte	0xb
	.4byte	0x483
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0x6
	.byte	0x96
	.byte	0xb
	.4byte	0x483
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x6
	.byte	0x98
	.byte	0xb
	.4byte	0x483
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0x6
	.byte	0x9a
	.byte	0xb
	.4byte	0x483
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x6
	.byte	0x9c
	.byte	0xb
	.4byte	0x483
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x6
	.byte	0x9e
	.byte	0xb
	.4byte	0x483
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x6
	.byte	0xa0
	.byte	0x14
	.4byte	0xbe
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x6
	.byte	0xa2
	.byte	0xb
	.4byte	0xb2
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF70
	.byte	0x6
	.byte	0xa4
	.byte	0xb
	.4byte	0xb2
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF71
	.byte	0x6
	.byte	0xa6
	.byte	0x1a
	.4byte	0x488
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0x6
	.byte	0xa8
	.byte	0x20
	.4byte	0x48d
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x6
	.byte	0xaa
	.byte	0xb
	.4byte	0xb2
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x6
	.byte	0xad
	.byte	0x1d
	.4byte	0x492
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF75
	.byte	0x6
	.byte	0xaf
	.byte	0x23
	.4byte	0x497
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0x6
	.byte	0xb1
	.byte	0xb
	.4byte	0xb2
	.byte	0x74
	.byte	0
	.uleb128 0x14
	.4byte	0x47e
	.uleb128 0x15
	.4byte	0x47e
	.byte	0
	.uleb128 0x5
	.4byte	0x362
	.uleb128 0x5
	.4byte	0x473
	.uleb128 0x5
	.4byte	0xd8
	.uleb128 0x5
	.4byte	0x105
	.uleb128 0x5
	.4byte	0x126
	.uleb128 0x5
	.4byte	0x153
	.uleb128 0x3
	.4byte	.LASF77
	.byte	0x6
	.byte	0xb3
	.byte	0x2
	.4byte	0x362
	.uleb128 0x5
	.4byte	0x49c
	.uleb128 0x5
	.4byte	0x90
	.uleb128 0x5
	.4byte	0x9c
	.uleb128 0x5
	.4byte	0x1f8
	.uleb128 0x12
	.byte	0x24
	.byte	0x7
	.byte	0x2e
	.4byte	0x53a
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0x7
	.byte	0x30
	.byte	0xc
	.4byte	0xb2
	.byte	0
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x7
	.byte	0x3c
	.byte	0xc
	.4byte	0xb2
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF80
	.byte	0x7
	.byte	0x3f
	.byte	0xc
	.4byte	0xb2
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF81
	.byte	0x7
	.byte	0x42
	.byte	0xc
	.4byte	0xb2
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x7
	.byte	0x49
	.byte	0xc
	.4byte	0xb2
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF82
	.byte	0x7
	.byte	0x4c
	.byte	0xc
	.4byte	0xb2
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0x7
	.byte	0x4f
	.byte	0xc
	.4byte	0xb2
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF84
	.byte	0x7
	.byte	0x52
	.byte	0xc
	.4byte	0xb2
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF85
	.byte	0x7
	.byte	0x56
	.byte	0xc
	.4byte	0xb2
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.4byte	.LASF86
	.byte	0x7
	.byte	0x58
	.byte	0x3
	.4byte	0x4bc
	.uleb128 0xe
	.4byte	0x40
	.byte	0x7
	.byte	0x5e
	.4byte	0x582
	.uleb128 0x2
	.4byte	.LASF87
	.byte	0
	.uleb128 0x2
	.4byte	.LASF88
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF89
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF90
	.byte	0x12
	.uleb128 0x2
	.4byte	.LASF91
	.byte	0x22
	.uleb128 0x2
	.4byte	.LASF92
	.byte	0x32
	.uleb128 0x2
	.4byte	.LASF93
	.byte	0x3
	.uleb128 0x2
	.4byte	.LASF94
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF95
	.byte	0x7
	.byte	0x67
	.byte	0x3
	.4byte	0x546
	.uleb128 0xd
	.4byte	0x582
	.uleb128 0x13
	.4byte	.LASF97
	.byte	0x60
	.byte	0x7
	.byte	0x7b
	.4byte	0x6a4
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0x7
	.byte	0x7d
	.byte	0x12
	.4byte	0x4b7
	.byte	0
	.uleb128 0x1
	.4byte	.LASF58
	.byte	0x7
	.byte	0x7f
	.byte	0x15
	.4byte	0x53a
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF98
	.byte	0x7
	.byte	0x81
	.byte	0x12
	.4byte	0x4b2
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF99
	.byte	0x7
	.byte	0x83
	.byte	0xc
	.4byte	0xa1
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF100
	.byte	0x7
	.byte	0x85
	.byte	0x15
	.4byte	0xad
	.byte	0x2e
	.uleb128 0x1
	.4byte	.LASF101
	.byte	0x7
	.byte	0x87
	.byte	0xc
	.4byte	0x4ad
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF102
	.byte	0x7
	.byte	0x89
	.byte	0xc
	.4byte	0xa1
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF103
	.byte	0x7
	.byte	0x8b
	.byte	0x15
	.4byte	0xad
	.byte	0x36
	.uleb128 0x1
	.4byte	.LASF104
	.byte	0x7
	.byte	0x8d
	.byte	0xc
	.4byte	0xa1
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF105
	.byte	0x7
	.byte	0x8f
	.byte	0xc
	.4byte	0xa1
	.byte	0x3a
	.uleb128 0x1
	.4byte	.LASF106
	.byte	0x7
	.byte	0x91
	.byte	0xc
	.4byte	0xa1
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF107
	.byte	0x7
	.byte	0x93
	.byte	0xc
	.4byte	0xb2
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF108
	.byte	0x7
	.byte	0x96
	.byte	0xc
	.4byte	0xb2
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF109
	.byte	0x7
	.byte	0x99
	.byte	0xa
	.4byte	0x6b4
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF110
	.byte	0x7
	.byte	0x9b
	.byte	0xa
	.4byte	0x6b4
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF111
	.byte	0x7
	.byte	0x9d
	.byte	0x16
	.4byte	0x4a8
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF112
	.byte	0x7
	.byte	0x9f
	.byte	0x16
	.4byte	0x4a8
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF59
	.byte	0x7
	.byte	0xa1
	.byte	0x13
	.4byte	0x26a
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF60
	.byte	0x7
	.byte	0xa3
	.byte	0x23
	.4byte	0x58e
	.byte	0x59
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x7
	.byte	0xa5
	.byte	0x15
	.4byte	0xbe
	.byte	0x5c
	.byte	0
	.uleb128 0x14
	.4byte	0x6af
	.uleb128 0x15
	.4byte	0x6af
	.byte	0
	.uleb128 0x5
	.4byte	0x593
	.uleb128 0x5
	.4byte	0x6a4
	.uleb128 0x3
	.4byte	.LASF113
	.byte	0x7
	.byte	0xb6
	.byte	0x3
	.4byte	0x593
	.uleb128 0x1f
	.4byte	.LASF134
	.byte	0x1
	.2byte	0x1f3
	.byte	0xd
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x744
	.uleb128 0x20
	.4byte	.LASF120
	.byte	0x1
	.2byte	0x1f3
	.byte	0x3d
	.4byte	0x744
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x16
	.4byte	.LASF114
	.2byte	0x1f5
	.4byte	0x90
	.uleb128 0x16
	.4byte	.LASF115
	.2byte	0x1f6
	.4byte	0x90
	.uleb128 0x8
	.4byte	.LASF116
	.2byte	0x1f7
	.byte	0xb
	.4byte	0x90
	.4byte	.LLST0
	.uleb128 0x8
	.4byte	.LASF117
	.2byte	0x1f8
	.byte	0xb
	.4byte	0x90
	.4byte	.LLST1
	.uleb128 0x17
	.4byte	.LASF118
	.2byte	0x1fa
	.4byte	0x759
	.uleb128 0x5
	.byte	0x3
	.4byte	numerator.1
	.uleb128 0x17
	.4byte	.LASF119
	.2byte	0x1fb
	.4byte	0x759
	.uleb128 0x5
	.byte	0x3
	.4byte	denominator.0
	.byte	0
	.uleb128 0x5
	.4byte	0x6b9
	.uleb128 0x21
	.4byte	0x9c
	.4byte	0x759
	.uleb128 0x22
	.4byte	0x89
	.byte	0x7
	.byte	0
	.uleb128 0x11
	.4byte	0x749
	.uleb128 0xc
	.4byte	.LASF123
	.2byte	0x1bc
	.4byte	0x246
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7b8
	.uleb128 0x7
	.4byte	.LASF120
	.2byte	0x1bc
	.byte	0x47
	.4byte	0x744
	.4byte	.LLST16
	.uleb128 0x7
	.4byte	.LASF121
	.2byte	0x1bc
	.byte	0x58
	.4byte	0xb2
	.4byte	.LLST17
	.uleb128 0x8
	.4byte	.LASF122
	.2byte	0x1be
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST18
	.uleb128 0xf
	.4byte	.LVL49
	.4byte	0x6c5
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF124
	.2byte	0x18b
	.4byte	0x246
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x812
	.uleb128 0x7
	.4byte	.LASF120
	.2byte	0x18b
	.byte	0x47
	.4byte	0x744
	.4byte	.LLST13
	.uleb128 0x7
	.4byte	.LASF121
	.2byte	0x18b
	.byte	0x58
	.4byte	0xb2
	.4byte	.LLST14
	.uleb128 0x8
	.4byte	.LASF122
	.2byte	0x18d
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST15
	.uleb128 0xf
	.4byte	.LVL43
	.4byte	0x6c5
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF125
	.2byte	0x15d
	.4byte	0x246
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x84c
	.uleb128 0x7
	.4byte	.LASF120
	.2byte	0x15d
	.byte	0x44
	.4byte	0x744
	.4byte	.LLST11
	.uleb128 0x8
	.4byte	.LASF122
	.2byte	0x15f
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST12
	.byte	0
	.uleb128 0xc
	.4byte	.LASF126
	.2byte	0x134
	.4byte	0x246
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x896
	.uleb128 0x7
	.4byte	.LASF120
	.2byte	0x134
	.byte	0x43
	.4byte	0x744
	.4byte	.LLST9
	.uleb128 0x8
	.4byte	.LASF122
	.2byte	0x136
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST10
	.uleb128 0xf
	.4byte	.LVL30
	.4byte	0x6c5
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF127
	.2byte	0x10e
	.4byte	0x246
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8e0
	.uleb128 0x7
	.4byte	.LASF120
	.2byte	0x10e
	.byte	0x3e
	.4byte	0x744
	.4byte	.LLST6
	.uleb128 0x7
	.4byte	.LASF128
	.2byte	0x10e
	.byte	0x4f
	.4byte	0xb2
	.4byte	.LLST7
	.uleb128 0x8
	.4byte	.LASF122
	.2byte	0x110
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST8
	.byte	0
	.uleb128 0x18
	.4byte	.LASF129
	.byte	0xde
	.4byte	0x246
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x916
	.uleb128 0x19
	.4byte	.LASF120
	.byte	0xde
	.byte	0x45
	.4byte	0x744
	.4byte	.LLST4
	.uleb128 0x1a
	.4byte	.LASF122
	.byte	0xe0
	.4byte	0xb2
	.4byte	.LLST5
	.byte	0
	.uleb128 0x18
	.4byte	.LASF130
	.byte	0xae
	.4byte	0x246
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x94c
	.uleb128 0x19
	.4byte	.LASF120
	.byte	0xae
	.byte	0x44
	.4byte	0x744
	.4byte	.LLST2
	.uleb128 0x1a
	.4byte	.LASF122
	.byte	0xb0
	.4byte	0xb2
	.4byte	.LLST3
	.byte	0
	.uleb128 0x23
	.4byte	.LASF135
	.byte	0x1
	.byte	0x7c
	.byte	0x1c
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x970
	.uleb128 0x1b
	.4byte	.LASF120
	.byte	0x7c
	.byte	0x51
	.4byte	0x744
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x24
	.4byte	.LASF136
	.byte	0x1
	.byte	0x6d
	.byte	0x1c
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LASF120
	.byte	0x6d
	.byte	0x50
	.4byte	0x744
	.uleb128 0x1
	.byte	0x50
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x5
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
	.uleb128 0xd
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.sleb128 11
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x21
	.sleb128 16
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.sleb128 24
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.section	.debug_loclists,"",%progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST0:
	.byte	0x8
	.4byte	.LVL2
	.uleb128 .LVL5-.LVL2
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST1:
	.byte	0x8
	.4byte	.LVL3
	.uleb128 .LVL4-.LVL3
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST16:
	.byte	0x6
	.4byte	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL49-1-.LVL46
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL49-1-.LVL46
	.uleb128 .LVL50-.LVL46
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL50-.LVL46
	.uleb128 .LVL51-.LVL46
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL51-.LVL46
	.uleb128 .LFE343-.LVL46
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x6
	.4byte	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL48-.LVL46
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL48-.LVL46
	.uleb128 .LVL50-.LVL46
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL50-.LVL46
	.uleb128 .LFE343-.LVL46
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST18:
	.byte	0x8
	.4byte	.LVL47
	.uleb128 .LVL50-.LVL47
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL40
	.byte	0x4
	.uleb128 .LVL40-.LVL40
	.uleb128 .LVL43-1-.LVL40
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL43-1-.LVL40
	.uleb128 .LVL44-.LVL40
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL44-.LVL40
	.uleb128 .LVL45-.LVL40
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL45-.LVL40
	.uleb128 .LFE342-.LVL40
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL40
	.byte	0x4
	.uleb128 .LVL40-.LVL40
	.uleb128 .LVL42-.LVL40
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL42-.LVL40
	.uleb128 .LVL44-.LVL40
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL44-.LVL40
	.uleb128 .LFE342-.LVL40
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST15:
	.byte	0x8
	.4byte	.LVL41
	.uleb128 .LVL44-.LVL41
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL34
	.byte	0x4
	.uleb128 .LVL34-.LVL34
	.uleb128 .LVL37-.LVL34
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL37-.LVL34
	.uleb128 .LVL38-.LVL34
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL38-.LVL34
	.uleb128 .LVL39-.LVL34
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL39-.LVL34
	.uleb128 .LFE341-.LVL34
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST12:
	.byte	0x8
	.4byte	.LVL35
	.uleb128 .LVL38-.LVL35
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL27
	.byte	0x4
	.uleb128 .LVL27-.LVL27
	.uleb128 .LVL30-1-.LVL27
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL30-1-.LVL27
	.uleb128 .LVL31-.LVL27
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL31-.LVL27
	.uleb128 .LVL32-.LVL27
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL32-.LVL27
	.uleb128 .LVL33-.LVL27
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL33-.LVL27
	.uleb128 .LFE340-.LVL27
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST10:
	.byte	0x8
	.4byte	.LVL28
	.uleb128 .LVL30-1-.LVL28
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL20
	.byte	0x4
	.uleb128 .LVL20-.LVL20
	.uleb128 .LVL22-.LVL20
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL22-.LVL20
	.uleb128 .LVL25-.LVL20
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL25-.LVL20
	.uleb128 .LVL26-.LVL20
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL26-.LVL20
	.uleb128 .LFE339-.LVL20
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL20
	.byte	0x4
	.uleb128 .LVL20-.LVL20
	.uleb128 .LVL23-.LVL20
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL23-.LVL20
	.uleb128 .LVL25-.LVL20
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL25-.LVL20
	.uleb128 .LFE339-.LVL20
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST8:
	.byte	0x8
	.4byte	.LVL21
	.uleb128 .LVL24-.LVL21
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL14
	.byte	0x4
	.uleb128 .LVL14-.LVL14
	.uleb128 .LVL16-.LVL14
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL16-.LVL14
	.uleb128 .LVL18-.LVL14
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL18-.LVL14
	.uleb128 .LVL19-.LVL14
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL19-.LVL14
	.uleb128 .LFE338-.LVL14
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x8
	.4byte	.LVL15
	.uleb128 .LVL17-.LVL15
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL8
	.byte	0x4
	.uleb128 .LVL8-.LVL8
	.uleb128 .LVL10-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL10-.LVL8
	.uleb128 .LVL12-.LVL8
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL12-.LVL8
	.uleb128 .LVL13-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL13-.LVL8
	.uleb128 .LFE337-.LVL8
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x8
	.4byte	.LVL9
	.uleb128 .LVL11-.LVL9
	.uleb128 0x1
	.byte	0x54
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
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
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
.LLRL19:
	.byte	0x7
	.4byte	.LFB344
	.uleb128 .LFE344-.LFB344
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
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF113:
	.ascii	"USART_HandleTypeDef\000"
.LASF92:
	.ascii	"HAL_USART_STATE_BUSY_TX_RX\000"
.LASF134:
	.ascii	"USARTEx_SetNbDataToProcess\000"
.LASF76:
	.ascii	"DMAmuxRequestGenStatusMask\000"
.LASF58:
	.ascii	"Init\000"
.LASF50:
	.ascii	"DMA_InitTypeDef\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF72:
	.ascii	"DMAmuxChannelStatus\000"
.LASF32:
	.ascii	"HAL_BUSY\000"
.LASF116:
	.ascii	"rx_fifo_threshold\000"
.LASF86:
	.ascii	"USART_InitTypeDef\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF88:
	.ascii	"HAL_USART_STATE_READY\000"
.LASF51:
	.ascii	"HAL_DMA_STATE_RESET\000"
.LASF100:
	.ascii	"TxXferCount\000"
.LASF9:
	.ascii	"long long int\000"
.LASF1:
	.ascii	"signed char\000"
.LASF107:
	.ascii	"SlaveMode\000"
.LASF136:
	.ascii	"HAL_USARTEx_RxFifoFullCallback\000"
.LASF22:
	.ascii	"GTPR\000"
.LASF78:
	.ascii	"BaudRate\000"
.LASF97:
	.ascii	"__USART_HandleTypeDef\000"
.LASF64:
	.ascii	"XferM1CpltCallback\000"
.LASF37:
	.ascii	"HAL_LockTypeDef\000"
.LASF16:
	.ascii	"DMAMUX_ChannelStatus_TypeDef\000"
.LASF6:
	.ascii	"long int\000"
.LASF98:
	.ascii	"pTxBuffPtr\000"
.LASF40:
	.ascii	"PeriphInc\000"
.LASF119:
	.ascii	"denominator\000"
.LASF48:
	.ascii	"MemBurst\000"
.LASF54:
	.ascii	"HAL_DMA_STATE_ERROR\000"
.LASF127:
	.ascii	"HAL_USARTEx_ConfigNSS\000"
.LASF63:
	.ascii	"XferHalfCpltCallback\000"
.LASF13:
	.ascii	"uint16_t\000"
.LASF29:
	.ascii	"double\000"
.LASF80:
	.ascii	"StopBits\000"
.LASF24:
	.ascii	"PRESC\000"
.LASF69:
	.ascii	"StreamBaseAddress\000"
.LASF61:
	.ascii	"Parent\000"
.LASF126:
	.ascii	"HAL_USARTEx_EnableFifoMode\000"
.LASF59:
	.ascii	"Lock\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF44:
	.ascii	"Mode\000"
.LASF39:
	.ascii	"Direction\000"
.LASF74:
	.ascii	"DMAmuxRequestGen\000"
.LASF112:
	.ascii	"hdmarx\000"
.LASF33:
	.ascii	"HAL_TIMEOUT\000"
.LASF120:
	.ascii	"husart\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF135:
	.ascii	"HAL_USARTEx_TxFifoEmptyCallback\000"
.LASF90:
	.ascii	"HAL_USART_STATE_BUSY_TX\000"
.LASF81:
	.ascii	"Parity\000"
.LASF71:
	.ascii	"DMAmuxChannel\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF70:
	.ascii	"StreamIndex\000"
.LASF30:
	.ascii	"HAL_OK\000"
.LASF114:
	.ascii	"rx_fifo_depth\000"
.LASF102:
	.ascii	"RxXferSize\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF45:
	.ascii	"Priority\000"
.LASF99:
	.ascii	"TxXferSize\000"
.LASF129:
	.ascii	"HAL_USARTEx_DisableSlaveMode\000"
.LASF131:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF55:
	.ascii	"HAL_DMA_STATE_ABORT\000"
.LASF68:
	.ascii	"ErrorCode\000"
.LASF43:
	.ascii	"MemDataAlignment\000"
.LASF20:
	.ascii	"RGCFR\000"
.LASF25:
	.ascii	"USART_TypeDef\000"
.LASF34:
	.ascii	"HAL_StatusTypeDef\000"
.LASF0:
	.ascii	"short int\000"
.LASF52:
	.ascii	"HAL_DMA_STATE_READY\000"
.LASF82:
	.ascii	"CLKPolarity\000"
.LASF89:
	.ascii	"HAL_USART_STATE_BUSY\000"
.LASF93:
	.ascii	"HAL_USART_STATE_TIMEOUT\000"
.LASF122:
	.ascii	"tmpcr1\000"
.LASF125:
	.ascii	"HAL_USARTEx_DisableFifoMode\000"
.LASF36:
	.ascii	"HAL_LOCKED\000"
.LASF77:
	.ascii	"DMA_HandleTypeDef\000"
.LASF66:
	.ascii	"XferErrorCallback\000"
.LASF94:
	.ascii	"HAL_USART_STATE_ERROR\000"
.LASF111:
	.ascii	"hdmatx\000"
.LASF83:
	.ascii	"CLKPhase\000"
.LASF18:
	.ascii	"DMAMUX_RequestGen_TypeDef\000"
.LASF91:
	.ascii	"HAL_USART_STATE_BUSY_RX\000"
.LASF17:
	.ascii	"RGCR\000"
.LASF28:
	.ascii	"float\000"
.LASF95:
	.ascii	"HAL_USART_StateTypeDef\000"
.LASF57:
	.ascii	"Instance\000"
.LASF65:
	.ascii	"XferM1HalfCpltCallback\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF109:
	.ascii	"RxISR\000"
.LASF56:
	.ascii	"HAL_DMA_StateTypeDef\000"
.LASF75:
	.ascii	"DMAmuxRequestGenStatus\000"
.LASF53:
	.ascii	"HAL_DMA_STATE_BUSY\000"
.LASF124:
	.ascii	"HAL_USARTEx_SetTxFifoThreshold\000"
.LASF123:
	.ascii	"HAL_USARTEx_SetRxFifoThreshold\000"
.LASF41:
	.ascii	"MemInc\000"
.LASF19:
	.ascii	"RGSR\000"
.LASF117:
	.ascii	"tx_fifo_threshold\000"
.LASF96:
	.ascii	"__DMA_HandleTypeDef\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF46:
	.ascii	"FIFOMode\000"
.LASF79:
	.ascii	"WordLength\000"
.LASF128:
	.ascii	"NSSConfig\000"
.LASF27:
	.ascii	"char\000"
.LASF84:
	.ascii	"CLKLastBit\000"
.LASF26:
	.ascii	"long double\000"
.LASF47:
	.ascii	"FIFOThreshold\000"
.LASF85:
	.ascii	"ClockPrescaler\000"
.LASF38:
	.ascii	"Request\000"
.LASF60:
	.ascii	"State\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF130:
	.ascii	"HAL_USARTEx_EnableSlaveMode\000"
.LASF104:
	.ascii	"Mask\000"
.LASF23:
	.ascii	"RTOR\000"
.LASF118:
	.ascii	"numerator\000"
.LASF31:
	.ascii	"HAL_ERROR\000"
.LASF106:
	.ascii	"NbTxDataToProcess\000"
.LASF132:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_usart_ex.c\000"
.LASF42:
	.ascii	"PeriphDataAlignment\000"
.LASF108:
	.ascii	"FifoMode\000"
.LASF121:
	.ascii	"Threshold\000"
.LASF73:
	.ascii	"DMAmuxChannelStatusMask\000"
.LASF15:
	.ascii	"DMAMUX_Channel_TypeDef\000"
.LASF115:
	.ascii	"tx_fifo_depth\000"
.LASF105:
	.ascii	"NbRxDataToProcess\000"
.LASF101:
	.ascii	"pRxBuffPtr\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF110:
	.ascii	"TxISR\000"
.LASF133:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF103:
	.ascii	"RxXferCount\000"
.LASF35:
	.ascii	"HAL_UNLOCKED\000"
.LASF87:
	.ascii	"HAL_USART_STATE_RESET\000"
.LASF67:
	.ascii	"XferAbortCallback\000"
.LASF21:
	.ascii	"DMAMUX_RequestGenStatus_TypeDef\000"
.LASF62:
	.ascii	"XferCpltCallback\000"
.LASF49:
	.ascii	"PeriphBurst\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
