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
	.file	"stm32h7xx_hal_dcmi.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_dcmi.c"
	.section	.text.DCMI_DMAXferCplt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	DCMI_DMAXferCplt, %function
DCMI_DMAXferCplt:
.LFB354:
	.loc 1 1132 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 1133 3
	.loc 1 1135 3
	.loc 1 1135 23 is_stmt 0
	ldr	r4, [r0, #56]
.LVL1:
	.loc 1 1137 3 is_stmt 1
	.loc 1 1137 12 is_stmt 0
	ldr	r3, [r4, #56]
	.loc 1 1137 6
	cbz	r3, .L2
	.loc 1 1140 5 is_stmt 1
	.loc 1 1140 42 is_stmt 0
	ldr	r0, [r4, #72]
.LVL2:
	.loc 1 1140 54
	ldr	r2, [r0]
	.loc 1 1140 66
	ldr	r3, [r2]
	.loc 1 1140 9
	and	r3, r3, #524288
.LVL3:
	.loc 1 1141 5 is_stmt 1
	.loc 1 1141 16 is_stmt 0
	ldr	r1, [r4, #56]
	.loc 1 1141 8
	tst	r1, #1
	bne	.L3
	.loc 1 1141 41 discriminator 1
	cbnz	r3, .L8
.L3:
	.loc 1 1148 10 is_stmt 1
	.loc 1 1148 68 is_stmt 0
	ldr	r3, [r2]
.LVL4:
	.loc 1 1148 13
	tst	r3, #524288
	beq	.L9
.LVL5:
.L4:
	.loc 1 1174 3 is_stmt 1
	.loc 1 1177 3
	.loc 1 1177 12 is_stmt 0
	ldr	r2, [r4, #56]
	.loc 1 1177 32
	ldr	r3, [r4, #64]
	.loc 1 1177 6
	cmp	r2, r3
	beq	.L10
.L1:
	.loc 1 1188 1
	pop	{r4, pc}
.LVL6:
.L8:
	.loc 1 1143 7 is_stmt 1
	.loc 1 1143 11 is_stmt 0
	ldr	r3, [r2, #12]
.LVL7:
	.loc 1 1144 7 is_stmt 1
	.loc 1 1144 73 is_stmt 0
	ldr	r1, [r4, #60]
	.loc 1 1144 13
	movs	r2, #0
	add	r1, r3, r1, lsl #3
	bl	HAL_DMAEx_ChangeMemory
.LVL8:
	.loc 1 1145 7 is_stmt 1
	.loc 1 1145 12 is_stmt 0
	ldr	r3, [r4, #56]
	.loc 1 1145 23
	subs	r3, r3, #1
	str	r3, [r4, #56]
	b	.L4
.L9:
	.loc 1 1150 7 is_stmt 1
	.loc 1 1150 11 is_stmt 0
	ldr	r3, [r2, #16]
.LVL9:
	.loc 1 1151 7 is_stmt 1
	.loc 1 1151 73 is_stmt 0
	ldr	r1, [r4, #60]
	.loc 1 1151 13
	movs	r2, #1
	add	r1, r3, r1, lsl #3
	bl	HAL_DMAEx_ChangeMemory
.LVL10:
	.loc 1 1152 7 is_stmt 1
	.loc 1 1152 12 is_stmt 0
	ldr	r3, [r4, #56]
	.loc 1 1152 23
	subs	r3, r3, #1
	str	r3, [r4, #56]
	b	.L4
.LVL11:
.L2:
	.loc 1 1160 8 is_stmt 1
	.loc 1 1160 42 is_stmt 0
	ldr	r3, [r4, #72]
	.loc 1 1160 54
	ldr	r3, [r3]
	.loc 1 1160 66
	ldr	r2, [r3]
	.loc 1 1160 11
	tst	r2, #524288
	beq	.L5
	.loc 1 1162 5 is_stmt 1
	.loc 1 1162 72 is_stmt 0
	ldr	r2, [r4, #68]
	.loc 1 1162 65
	str	r2, [r3, #12]
	b	.L4
.L5:
	.loc 1 1165 8 is_stmt 1
	.loc 1 1165 66 is_stmt 0
	ldr	r2, [r3]
	.loc 1 1165 11
	tst	r2, #524288
	bne	.L4
	.loc 1 1167 5 is_stmt 1
	.loc 1 1167 9 is_stmt 0
	ldr	r2, [r4, #68]
.LVL12:
	.loc 1 1168 5 is_stmt 1
	.loc 1 1168 85 is_stmt 0
	ldr	r1, [r4, #60]
	.loc 1 1168 72
	add	r2, r2, r1, lsl #2
.LVL13:
	.loc 1 1168 65
	str	r2, [r3, #16]
.LVL14:
	.loc 1 1169 5 is_stmt 1
	.loc 1 1169 29 is_stmt 0
	ldr	r3, [r4, #64]
	.loc 1 1169 22
	str	r3, [r4, #56]
	b	.L4
.LVL15:
.L10:
	.loc 1 1180 5 is_stmt 1
	.loc 1 1180 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1180 23
	ldr	r3, [r2, #12]
	.loc 1 1180 29
	orr	r3, r3, #1
	str	r3, [r2, #12]
	.loc 1 1183 5 is_stmt 1
	.loc 1 1183 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1183 25
	ldr	r3, [r3]
	.loc 1 1183 8
	tst	r3, #2
	beq	.L1
	.loc 1 1185 7 is_stmt 1
	.loc 1 1185 20 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #53]
	.loc 1 1188 1
	b	.L1
	.cfi_endproc
.LFE354:
	.size	DCMI_DMAXferCplt, .-DCMI_DMAXferCplt
	.section	.text.HAL_DCMI_MspInit,"ax",%progbits
	.align	1
	.weak	HAL_DCMI_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_MspInit, %function
HAL_DCMI_MspInit:
.LFB337:
	.loc 1 308 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL16:
	.loc 1 310 3
	.loc 1 315 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_DCMI_MspInit, .-HAL_DCMI_MspInit
	.section	.text.HAL_DCMI_Init,"ax",%progbits
	.align	1
	.global	HAL_DCMI_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_Init, %function
HAL_DCMI_Init:
.LFB335:
	.loc 1 179 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL17:
	.loc 1 181 3
	.loc 1 181 6 is_stmt 0
	cmp	r0, #0
	beq	.L17
	.loc 1 179 1
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 187 3 is_stmt 1
	.loc 1 188 3
	.loc 1 189 3
	.loc 1 190 3
	.loc 1 191 3
	.loc 1 192 3
	.loc 1 193 3
	.loc 1 194 3
	.loc 1 196 3
	.loc 1 197 3
	.loc 1 198 3
	.loc 1 199 3
	.loc 1 201 3
	.loc 1 201 12 is_stmt 0
	ldrb	r3, [r0, #53]	@ zero_extendqisi2
	.loc 1 201 6
	cmp	r3, #0
	beq	.L22
.LVL18:
.L14:
	.loc 1 225 3 is_stmt 1
	.loc 1 225 16 is_stmt 0
	movs	r3, #2
	strb	r3, [r4, #53]
	.loc 1 227 3 is_stmt 1
	.loc 1 227 18 is_stmt 0
	ldr	r3, [r4, #24]
	.loc 1 227 6
	cbz	r3, .L15
	.loc 1 231 5 is_stmt 1
	.loc 1 231 32 is_stmt 0
	movs	r3, #0
	str	r3, [r4, #36]
.L15:
	.loc 1 234 3 is_stmt 1
	.loc 1 234 8 is_stmt 0
	ldr	r2, [r4]
	.loc 1 234 18
	ldr	r1, [r2]
	.loc 1 234 23
	ldr	r3, .L24
	ands	r3, r3, r1
	str	r3, [r2]
	.loc 1 239 3 is_stmt 1
	.loc 1 239 8 is_stmt 0
	ldr	r2, [r4]
	.loc 1 239 18
	ldr	r1, [r2]
	.loc 1 239 48
	ldr	r3, [r4, #4]
	.loc 1 239 74
	ldr	r0, [r4, #20]
	.loc 1 239 61
	orrs	r3, r3, r0
	.loc 1 240 48
	ldr	r0, [r4, #12]
	.loc 1 239 87
	orrs	r3, r3, r0
	.loc 1 240 73
	ldr	r0, [r4, #16]
	.loc 1 240 60
	orrs	r3, r3, r0
	.loc 1 241 48
	ldr	r0, [r4, #8]
	.loc 1 240 85
	orrs	r3, r3, r0
	.loc 1 241 74
	ldr	r0, [r4, #24]
	.loc 1 241 61
	orrs	r3, r3, r0
	.loc 1 242 48
	ldr	r0, [r4, #32]
	.loc 1 241 92
	orrs	r3, r3, r0
	.loc 1 242 71
	ldr	r0, [r4, #36]
	.loc 1 242 58
	orrs	r3, r3, r0
	.loc 1 243 48
	ldr	r0, [r4, #40]
	.loc 1 242 87
	orrs	r3, r3, r0
	.loc 1 243 78
	ldr	r0, [r4, #44]
	.loc 1 243 65
	orrs	r3, r3, r0
	.loc 1 244 48
	ldr	r0, [r4, #48]
	.loc 1 243 94
	orrs	r3, r3, r0
	.loc 1 239 23
	orrs	r3, r3, r1
	str	r3, [r2]
	.loc 1 246 3 is_stmt 1
	.loc 1 246 18 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 246 6
	cmp	r3, #16
	beq	.L23
.L16:
	.loc 1 256 3 is_stmt 1
	.loc 1 256 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 256 21
	ldr	r3, [r2, #12]
	.loc 1 256 27
	orr	r3, r3, #30
	str	r3, [r2, #12]
	.loc 1 259 3 is_stmt 1
	.loc 1 259 20 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #76]
	.loc 1 262 3 is_stmt 1
	.loc 1 262 16 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #53]
	.loc 1 264 3 is_stmt 1
	.loc 1 265 1 is_stmt 0
	pop	{r4, pc}
.LVL19:
.L22:
	.loc 1 220 5 is_stmt 1
	bl	HAL_DCMI_MspInit
.LVL20:
	b	.L14
.L23:
	.loc 1 248 5
	.loc 1 248 63 is_stmt 0
	ldrb	r3, [r4, #28]	@ zero_extendqisi2
	.loc 1 249 63
	ldrb	r2, [r4, #29]	@ zero_extendqisi2
	.loc 1 248 80
	orr	r3, r3, r2, lsl #8
	.loc 1 250 63
	ldrb	r2, [r4, #30]	@ zero_extendqisi2
	.loc 1 249 87
	orr	r3, r3, r2, lsl #16
	.loc 1 251 63
	ldrb	r1, [r4, #31]	@ zero_extendqisi2
	.loc 1 248 10
	ldr	r2, [r4]
	.loc 1 250 86
	orr	r3, r3, r1, lsl #24
	.loc 1 248 27
	str	r3, [r2, #24]
	b	.L16
.LVL21:
.L17:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 183 12
	movs	r0, #1
.LVL22:
	.loc 1 265 1
	bx	lr
.L25:
	.align	2
.L24:
	.word	-2035705
	.cfi_endproc
.LFE335:
	.size	HAL_DCMI_Init, .-HAL_DCMI_Init
	.section	.text.HAL_DCMI_MspDeInit,"ax",%progbits
	.align	1
	.weak	HAL_DCMI_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_MspDeInit, %function
HAL_DCMI_MspDeInit:
.LFB338:
	.loc 1 324 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL23:
	.loc 1 326 3
	.loc 1 331 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE338:
	.size	HAL_DCMI_MspDeInit, .-HAL_DCMI_MspDeInit
	.section	.text.HAL_DCMI_DeInit,"ax",%progbits
	.align	1
	.global	HAL_DCMI_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_DeInit, %function
HAL_DCMI_DeInit:
.LFB336:
	.loc 1 276 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL24:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 286 3
	bl	HAL_DCMI_MspDeInit
.LVL25:
	.loc 1 290 3
	.loc 1 290 20 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #76]
	.loc 1 293 3 is_stmt 1
	.loc 1 293 16 is_stmt 0
	strb	r0, [r4, #53]
	.loc 1 296 3 is_stmt 1
	.loc 1 296 7
	.loc 1 296 21 is_stmt 0
	strb	r0, [r4, #52]
	.loc 1 296 5 is_stmt 1
	.loc 1 298 3
	.loc 1 299 1 is_stmt 0
	pop	{r4, pc}
	.cfi_endproc
.LFE336:
	.size	HAL_DCMI_DeInit, .-HAL_DCMI_DeInit
	.section	.text.HAL_DCMI_Start_DMA,"ax",%progbits
	.align	1
	.global	HAL_DCMI_Start_DMA
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_Start_DMA, %function
HAL_DCMI_Start_DMA:
.LFB339:
	.loc 1 363 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL26:
	push	{r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 24
	mov	r4, r0
	.loc 1 365 3
	.loc 1 368 3
	.loc 1 371 3
	.loc 1 371 7
	.loc 1 371 17 is_stmt 0
	ldrb	r0, [r0, #52]	@ zero_extendqisi2
.LVL27:
	.loc 1 371 9
	cmp	r0, #1
	beq	.L35
	.loc 1 371 67 is_stmt 1 discriminator 2
	.loc 1 371 81 is_stmt 0 discriminator 2
	movs	r0, #1
	strb	r0, [r4, #52]
	.loc 1 371 5 is_stmt 1 discriminator 2
	.loc 1 374 3 discriminator 2
	.loc 1 374 16 is_stmt 0 discriminator 2
	movs	r0, #2
	strb	r0, [r4, #53]
	.loc 1 377 3 is_stmt 1 discriminator 2
	.loc 1 377 11 is_stmt 0 discriminator 2
	ldr	r5, [r4]
	.loc 1 377 21 discriminator 2
	ldr	r0, [r5]
	.loc 1 377 26 discriminator 2
	orr	r0, r0, #16384
	str	r0, [r5]
	.loc 1 380 3 is_stmt 1 discriminator 2
	.loc 1 380 8 is_stmt 0 discriminator 2
	ldr	r5, [r4]
	.loc 1 380 18 discriminator 2
	ldr	r0, [r5]
	.loc 1 380 23 discriminator 2
	bic	r0, r0, #2
	str	r0, [r5]
	.loc 1 381 3 is_stmt 1 discriminator 2
	.loc 1 381 8 is_stmt 0 discriminator 2
	ldr	r5, [r4]
	.loc 1 381 18 discriminator 2
	ldr	r0, [r5]
	.loc 1 381 23 discriminator 2
	orrs	r1, r1, r0
.LVL28:
	str	r1, [r5]
	.loc 1 384 3 is_stmt 1 discriminator 2
	.loc 1 384 8 is_stmt 0 discriminator 2
	ldr	r1, [r4, #72]
	.loc 1 384 39 discriminator 2
	ldr	r0, .L39
	str	r0, [r1, #60]
	.loc 1 387 3 is_stmt 1 discriminator 2
	.loc 1 387 8 is_stmt 0 discriminator 2
	ldr	r1, [r4, #72]
	.loc 1 387 40 discriminator 2
	ldr	r0, .L39+4
	str	r0, [r1, #76]
	.loc 1 390 3 is_stmt 1 discriminator 2
	.loc 1 390 8 is_stmt 0 discriminator 2
	ldr	r0, [r4, #72]
	.loc 1 390 40 discriminator 2
	movs	r1, #0
	str	r1, [r0, #80]
	.loc 1 393 3 is_stmt 1 discriminator 2
	.loc 1 393 20 is_stmt 0 discriminator 2
	str	r1, [r4, #56]
	.loc 1 394 3 is_stmt 1 discriminator 2
	.loc 1 394 29 is_stmt 0 discriminator 2
	str	r1, [r4, #64]
	.loc 1 395 3 is_stmt 1 discriminator 2
	.loc 1 395 19 is_stmt 0 discriminator 2
	str	r1, [r4, #60]
	.loc 1 396 3 is_stmt 1 discriminator 2
	.loc 1 396 19 is_stmt 0 discriminator 2
	str	r1, [r4, #68]
	.loc 1 398 3 is_stmt 1 discriminator 2
	.loc 1 398 6 is_stmt 0 discriminator 2
	cmp	r3, #65536
	bcc	.L37
	.loc 1 416 5 is_stmt 1
	.loc 1 416 10 is_stmt 0
	ldr	r1, [r4, #72]
	.loc 1 416 43
	ldr	r0, .L39
	str	r0, [r1, #68]
	.loc 1 419 5 is_stmt 1
	.loc 1 419 22 is_stmt 0
	movs	r1, #1
	str	r1, [r4, #56]
	.loc 1 420 5 is_stmt 1
	.loc 1 420 21 is_stmt 0
	str	r3, [r4, #60]
	.loc 1 421 5 is_stmt 1
	.loc 1 421 21 is_stmt 0
	str	r2, [r4, #68]
	.loc 1 424 5 is_stmt 1
	.loc 1 424 11 is_stmt 0
	b	.L33
.L37:
	.loc 1 401 5 is_stmt 1
	.loc 1 401 61 is_stmt 0
	ldr	r1, [r4]
	.loc 1 401 9
	adds	r1, r1, #40
	ldr	r0, [r4, #72]
	bl	HAL_DMA_Start_IT
.LVL29:
	.loc 1 401 8
	cbz	r0, .L32
	.loc 1 404 7 is_stmt 1
	.loc 1 404 24 is_stmt 0
	movs	r3, #64
	str	r3, [r4, #76]
	.loc 1 406 7 is_stmt 1
	.loc 1 406 20 is_stmt 0
	movs	r0, #1
	strb	r0, [r4, #53]
	.loc 1 408 7 is_stmt 1
	.loc 1 408 11
	.loc 1 408 25 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 408 9 is_stmt 1
	.loc 1 410 7
	.loc 1 410 14 is_stmt 0
	b	.L30
.LVL30:
.L34:
	.loc 1 426 7 is_stmt 1
	.loc 1 426 31 is_stmt 0
	ldr	r3, [r4, #60]
	.loc 1 426 42
	lsrs	r3, r3, #1
	.loc 1 426 23
	str	r3, [r4, #60]
	.loc 1 427 7 is_stmt 1
	.loc 1 427 31 is_stmt 0
	ldr	r3, [r4, #56]
	.loc 1 427 43
	lsls	r3, r3, #1
	.loc 1 427 24
	str	r3, [r4, #56]
.L33:
	.loc 1 424 28 is_stmt 1
	.loc 1 424 17 is_stmt 0
	ldr	r3, [r4, #60]
	.loc 1 424 28
	cmp	r3, #65536
	bcs	.L34
	.loc 1 431 5 is_stmt 1
	.loc 1 431 30 is_stmt 0
	ldr	r3, [r4, #56]
	.loc 1 431 42
	subs	r3, r3, #2
	.loc 1 431 22
	str	r3, [r4, #56]
	.loc 1 432 5 is_stmt 1
	.loc 1 432 38 is_stmt 0
	ldr	r3, [r4, #56]
	.loc 1 432 31
	str	r3, [r4, #64]
	.loc 1 435 5 is_stmt 1
	.loc 1 435 54 is_stmt 0
	ldr	r3, [r4, #60]
.LVL31:
	.loc 1 438 5 is_stmt 1
	.loc 1 438 74 is_stmt 0
	ldr	r1, [r4]
	.loc 1 438 130
	ldr	r0, [r4, #60]
	.loc 1 438 9
	str	r0, [sp]
	add	r3, r2, r3, lsl #2
.LVL32:
	adds	r1, r1, #40
	ldr	r0, [r4, #72]
	bl	HAL_DMAEx_MultiBufferStart_IT
.LVL33:
	.loc 1 438 8
	cbnz	r0, .L38
.LVL34:
.L32:
	.loc 1 452 3 is_stmt 1
	.loc 1 452 8 is_stmt 0
	ldr	r2, [r4]
	.loc 1 452 18
	ldr	r3, [r2]
	.loc 1 452 23
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 455 3 is_stmt 1
	.loc 1 455 7
	.loc 1 455 21 is_stmt 0
	movs	r0, #0
	strb	r0, [r4, #52]
	.loc 1 455 5 is_stmt 1
	.loc 1 458 3
.L30:
	.loc 1 459 1 is_stmt 0
	add	sp, sp, #12
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	@ sp needed
	pop	{r4, r5, pc}
.LVL35:
.L38:
	.cfi_restore_state
	.loc 1 441 7 is_stmt 1
	.loc 1 441 24 is_stmt 0
	movs	r3, #64
	str	r3, [r4, #76]
	.loc 1 443 7 is_stmt 1
	.loc 1 443 20 is_stmt 0
	movs	r0, #1
	strb	r0, [r4, #53]
	.loc 1 445 7 is_stmt 1
	.loc 1 445 11
	.loc 1 445 25 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 445 9 is_stmt 1
	.loc 1 447 7
	.loc 1 447 14 is_stmt 0
	b	.L30
.LVL36:
.L35:
	.loc 1 371 48
	movs	r0, #2
	b	.L30
.L40:
	.align	2
.L39:
	.word	DCMI_DMAXferCplt
	.word	DCMI_DMAError
	.cfi_endproc
.LFE339:
	.size	HAL_DCMI_Start_DMA, .-HAL_DCMI_Start_DMA
	.section	.text.HAL_DCMI_Stop,"ax",%progbits
	.align	1
	.global	HAL_DCMI_Stop
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_Stop, %function
HAL_DCMI_Stop:
.LFB340:
	.loc 1 468 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL37:
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	.loc 1 469 3
	.loc 1 469 61 is_stmt 0
	ldr	r3, .L49
	ldr	r3, [r3]
	ldr	r2, .L49+4
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #9
	.loc 1 469 12
	mov	r2, #1000
	mul	r3, r2, r3
.LVL38:
	.loc 1 470 3 is_stmt 1
	.loc 1 473 3
	.loc 1 473 7
	.loc 1 473 17 is_stmt 0
	ldrb	r2, [r0, #52]	@ zero_extendqisi2
	.loc 1 473 9
	cmp	r2, #1
	beq	.L46
	mov	r4, r0
	.loc 1 473 67 is_stmt 1 discriminator 2
	.loc 1 473 81 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #52]
	.loc 1 473 5 is_stmt 1 discriminator 2
	.loc 1 476 3 discriminator 2
	.loc 1 476 16 is_stmt 0 discriminator 2
	movs	r2, #2
	strb	r2, [r0, #53]
	.loc 1 479 3 is_stmt 1 discriminator 2
	.loc 1 479 8 is_stmt 0 discriminator 2
	ldr	r1, [r0]
	.loc 1 479 18 discriminator 2
	ldr	r2, [r1]
	.loc 1 479 23 discriminator 2
	bic	r2, r2, #1
	str	r2, [r1]
.L45:
	.loc 1 482 3 is_stmt 1
	.loc 1 484 5
.LVL39:
	.loc 1 485 5
	.loc 1 485 8 is_stmt 0
	subs	r3, r3, #1
.LVL40:
	beq	.L48
	.loc 1 494 50 is_stmt 1
	.loc 1 494 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 494 26
	ldr	r2, [r2]
	.loc 1 494 50
	tst	r2, #1
	bne	.L45
	.loc 1 470 21
	movs	r5, #0
	b	.L44
.L48:
	.loc 1 488 7 is_stmt 1
	.loc 1 488 12 is_stmt 0
	ldr	r3, [r4, #76]
.LVL41:
	.loc 1 488 24
	orr	r3, r3, #32
	str	r3, [r4, #76]
	.loc 1 490 7 is_stmt 1
.LVL42:
	.loc 1 491 7
	.loc 1 490 14 is_stmt 0
	movs	r5, #3
.LVL43:
.L44:
	.loc 1 497 3 is_stmt 1
	.loc 1 497 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 497 21
	ldr	r3, [r2]
	.loc 1 497 26
	bic	r3, r3, #16384
	str	r3, [r2]
	.loc 1 500 3 is_stmt 1
	.loc 1 500 9 is_stmt 0
	ldr	r0, [r4, #72]
.LVL44:
	bl	HAL_DMA_Abort
.LVL45:
	.loc 1 503 3 is_stmt 1
	.loc 1 503 8 is_stmt 0
	ldr	r3, [r4, #76]
	.loc 1 503 20
	str	r3, [r4, #76]
	.loc 1 506 3 is_stmt 1
	.loc 1 506 16 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #53]
	.loc 1 509 3 is_stmt 1
	.loc 1 509 7
	.loc 1 509 21 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 509 5 is_stmt 1
	.loc 1 512 3
.LVL46:
.L42:
	.loc 1 513 1 is_stmt 0
	mov	r0, r5
	pop	{r3, r4, r5, pc}
.LVL47:
.L46:
	.loc 1 473 48
	movs	r5, #2
	b	.L42
.L50:
	.align	2
.L49:
	.word	SystemCoreClock
	.word	274877907
	.cfi_endproc
.LFE340:
	.size	HAL_DCMI_Stop, .-HAL_DCMI_Stop
	.section	.text.HAL_DCMI_Suspend,"ax",%progbits
	.align	1
	.global	HAL_DCMI_Suspend
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_Suspend, %function
HAL_DCMI_Suspend:
.LFB341:
	.loc 1 522 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL48:
	mov	r2, r0
	.loc 1 523 3
	.loc 1 523 61 is_stmt 0
	ldr	r3, .L60
	ldr	r3, [r3]
	ldr	r1, .L60+4
	umull	r1, r3, r1, r3
	lsrs	r3, r3, #9
	.loc 1 523 12
	mov	r1, #1000
	mul	r3, r1, r3
.LVL49:
	.loc 1 524 3 is_stmt 1
	.loc 1 527 3
	.loc 1 527 7
	.loc 1 527 17 is_stmt 0
	ldrb	r1, [r0, #52]	@ zero_extendqisi2
	.loc 1 527 9
	cmp	r1, #1
	beq	.L56
	.loc 1 527 67 is_stmt 1 discriminator 2
	.loc 1 527 81 is_stmt 0 discriminator 2
	movs	r1, #1
	strb	r1, [r0, #52]
	.loc 1 527 5 is_stmt 1 discriminator 2
	.loc 1 529 3 discriminator 2
	.loc 1 529 12 is_stmt 0 discriminator 2
	ldrb	r1, [r0, #53]	@ zero_extendqisi2
	uxtb	r1, r1
	.loc 1 529 6 discriminator 2
	cmp	r1, #2
	beq	.L58
	.loc 1 524 21
	movs	r0, #0
.LVL50:
.L53:
	.loc 1 556 3 is_stmt 1
	.loc 1 556 7
	.loc 1 556 21 is_stmt 0
	movs	r3, #0
	strb	r3, [r2, #52]
	.loc 1 556 5 is_stmt 1
	.loc 1 559 3
	.loc 1 559 10 is_stmt 0
	bx	lr
.LVL51:
.L58:
	.loc 1 532 5 is_stmt 1
	.loc 1 532 18 is_stmt 0
	movs	r1, #5
	strb	r1, [r0, #53]
	.loc 1 535 5 is_stmt 1
	.loc 1 535 10 is_stmt 0
	ldr	r0, [r0]
.LVL52:
	.loc 1 535 20
	ldr	r1, [r0]
	.loc 1 535 25
	bic	r1, r1, #1
	str	r1, [r0]
.L55:
	.loc 1 538 5 is_stmt 1
	.loc 1 540 7
.LVL53:
	.loc 1 541 7
	.loc 1 541 10 is_stmt 0
	subs	r3, r3, #1
.LVL54:
	beq	.L59
	.loc 1 553 52 is_stmt 1
	.loc 1 553 18 is_stmt 0
	ldr	r1, [r2]
	.loc 1 553 28
	ldr	r1, [r1]
	.loc 1 553 52
	tst	r1, #1
	bne	.L55
	.loc 1 524 21
	movs	r0, #0
	b	.L53
.L59:
	.loc 1 544 9 is_stmt 1
	.loc 1 544 14 is_stmt 0
	ldr	r3, [r2, #76]
.LVL55:
	.loc 1 544 26
	orr	r3, r3, #32
	str	r3, [r2, #76]
	.loc 1 547 9 is_stmt 1
	.loc 1 547 22 is_stmt 0
	movs	r3, #1
	strb	r3, [r2, #53]
	.loc 1 549 9 is_stmt 1
.LVL56:
	.loc 1 550 9
	.loc 1 549 16 is_stmt 0
	movs	r0, #3
	.loc 1 550 9
	b	.L53
.LVL57:
.L56:
	.loc 1 527 48
	movs	r0, #2
.LVL58:
	.loc 1 560 1
	bx	lr
.L61:
	.align	2
.L60:
	.word	SystemCoreClock
	.word	274877907
	.cfi_endproc
.LFE341:
	.size	HAL_DCMI_Suspend, .-HAL_DCMI_Suspend
	.section	.text.HAL_DCMI_Resume,"ax",%progbits
	.align	1
	.global	HAL_DCMI_Resume
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_Resume, %function
HAL_DCMI_Resume:
.LFB342:
	.loc 1 569 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL59:
	.loc 1 571 3
	.loc 1 571 7
	.loc 1 571 17 is_stmt 0
	ldrb	r3, [r0, #52]	@ zero_extendqisi2
	.loc 1 571 9
	cmp	r3, #1
	beq	.L65
	.loc 1 571 67 is_stmt 1 discriminator 2
	.loc 1 571 81 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #52]
	.loc 1 571 5 is_stmt 1 discriminator 2
	.loc 1 573 3 discriminator 2
	.loc 1 573 12 is_stmt 0 discriminator 2
	ldrb	r3, [r0, #53]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 573 6 discriminator 2
	cmp	r3, #5
	beq	.L66
.L64:
	.loc 1 582 3 is_stmt 1
	.loc 1 582 7
	.loc 1 582 21 is_stmt 0
	movs	r3, #0
	strb	r3, [r0, #52]
	.loc 1 582 5 is_stmt 1
	.loc 1 585 3
	.loc 1 585 10 is_stmt 0
	mov	r0, r3
.LVL60:
	bx	lr
.LVL61:
.L66:
	.loc 1 576 5 is_stmt 1
	.loc 1 576 18 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #53]
	.loc 1 579 5 is_stmt 1
	.loc 1 579 10 is_stmt 0
	ldr	r2, [r0]
	.loc 1 579 20
	ldr	r3, [r2]
	.loc 1 579 25
	orr	r3, r3, #1
	str	r3, [r2]
	b	.L64
.L65:
	.loc 1 571 48
	movs	r0, #2
.LVL62:
	.loc 1 586 1
	bx	lr
	.cfi_endproc
.LFE342:
	.size	HAL_DCMI_Resume, .-HAL_DCMI_Resume
	.section	.text.HAL_DCMI_ErrorCallback,"ax",%progbits
	.align	1
	.weak	HAL_DCMI_ErrorCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_ErrorCallback, %function
HAL_DCMI_ErrorCallback:
.LFB344:
	.loc 1 695 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL63:
	.loc 1 697 3
	.loc 1 702 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE344:
	.size	HAL_DCMI_ErrorCallback, .-HAL_DCMI_ErrorCallback
	.section	.text.DCMI_DMAError,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	DCMI_DMAError, %function
DCMI_DMAError:
.LFB355:
	.loc 1 1197 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL64:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 1198 3
	.loc 1 1198 23 is_stmt 0
	ldr	r0, [r0, #56]
.LVL65:
	.loc 1 1200 3 is_stmt 1
	.loc 1 1200 12 is_stmt 0
	ldr	r3, [r0, #72]
	.loc 1 1200 24
	ldr	r3, [r3, #84]
	.loc 1 1200 6
	cmp	r3, #2
	beq	.L69
	.loc 1 1203 5 is_stmt 1
	.loc 1 1203 18 is_stmt 0
	movs	r3, #1
	strb	r3, [r0, #53]
	.loc 1 1206 5 is_stmt 1
	.loc 1 1206 10 is_stmt 0
	ldr	r3, [r0, #76]
	.loc 1 1206 22
	orr	r3, r3, #64
	str	r3, [r0, #76]
.L69:
	.loc 1 1214 3 is_stmt 1
	bl	HAL_DCMI_ErrorCallback
.LVL66:
	.loc 1 1216 1 is_stmt 0
	pop	{r3, pc}
	.cfi_endproc
.LFE355:
	.size	DCMI_DMAError, .-DCMI_DMAError
	.section	.text.HAL_DCMI_LineEventCallback,"ax",%progbits
	.align	1
	.weak	HAL_DCMI_LineEventCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_LineEventCallback, %function
HAL_DCMI_LineEventCallback:
.LFB345:
	.loc 1 711 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL67:
	.loc 1 713 3
	.loc 1 717 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE345:
	.size	HAL_DCMI_LineEventCallback, .-HAL_DCMI_LineEventCallback
	.section	.text.HAL_DCMI_VsyncEventCallback,"ax",%progbits
	.align	1
	.weak	HAL_DCMI_VsyncEventCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_VsyncEventCallback, %function
HAL_DCMI_VsyncEventCallback:
.LFB346:
	.loc 1 726 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL68:
	.loc 1 728 3
	.loc 1 733 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE346:
	.size	HAL_DCMI_VsyncEventCallback, .-HAL_DCMI_VsyncEventCallback
	.section	.text.HAL_DCMI_FrameEventCallback,"ax",%progbits
	.align	1
	.weak	HAL_DCMI_FrameEventCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_FrameEventCallback, %function
HAL_DCMI_FrameEventCallback:
.LFB347:
	.loc 1 742 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL69:
	.loc 1 744 3
	.loc 1 749 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE347:
	.size	HAL_DCMI_FrameEventCallback, .-HAL_DCMI_FrameEventCallback
	.section	.text.HAL_DCMI_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_DCMI_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_IRQHandler, %function
HAL_DCMI_IRQHandler:
.LFB343:
	.loc 1 595 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL70:
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 596 3
	.loc 1 596 31 is_stmt 0
	ldr	r3, [r0]
	.loc 1 596 12
	ldr	r5, [r3, #16]
.LVL71:
	.loc 1 599 3 is_stmt 1
	.loc 1 599 6 is_stmt 0
	tst	r5, #4
	bne	.L82
.LVL72:
.L75:
	.loc 1 617 3 is_stmt 1
	.loc 1 617 6 is_stmt 0
	tst	r5, #2
	bne	.L83
.L76:
	.loc 1 635 3 is_stmt 1
	.loc 1 635 6 is_stmt 0
	tst	r5, #16
	bne	.L84
.L77:
	.loc 1 649 3 is_stmt 1
	.loc 1 649 6 is_stmt 0
	tst	r5, #8
	bne	.L85
.L78:
	.loc 1 663 3 is_stmt 1
	.loc 1 663 6 is_stmt 0
	tst	r5, #1
	beq	.L74
	.loc 1 666 5 is_stmt 1
	.loc 1 666 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 666 25
	ldr	r2, [r3]
	.loc 1 666 8
	tst	r2, #2
	beq	.L80
	.loc 1 669 7 is_stmt 1
	.loc 1 669 25 is_stmt 0
	ldr	r2, [r3, #12]
	.loc 1 669 31
	bic	r2, r2, #30
	str	r2, [r3, #12]
.L80:
	.loc 1 673 5 is_stmt 1
	.loc 1 673 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 673 23
	ldr	r3, [r2, #12]
	.loc 1 673 29
	bic	r3, r3, #1
	str	r3, [r2, #12]
	.loc 1 676 5 is_stmt 1
	.loc 1 676 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 676 29
	movs	r2, #1
	str	r2, [r3, #20]
	.loc 1 683 5 is_stmt 1
	mov	r0, r4
	bl	HAL_DCMI_FrameEventCallback
.LVL73:
.L74:
	.loc 1 686 1 is_stmt 0
	pop	{r3, r4, r5, pc}
.LVL74:
.L82:
	.loc 1 602 5 is_stmt 1
	.loc 1 602 29 is_stmt 0
	movs	r2, #4
	str	r2, [r3, #20]
	.loc 1 605 5 is_stmt 1
	.loc 1 605 10 is_stmt 0
	ldr	r3, [r0, #76]
	.loc 1 605 22
	orr	r3, r3, #2
	str	r3, [r0, #76]
	.loc 1 608 5 is_stmt 1
	.loc 1 608 18 is_stmt 0
	strb	r2, [r0, #53]
	.loc 1 611 5 is_stmt 1
	.loc 1 611 10 is_stmt 0
	ldr	r3, [r0, #72]
	.loc 1 611 42
	ldr	r2, .L86
	str	r2, [r3, #80]
	.loc 1 614 5 is_stmt 1
	.loc 1 614 11 is_stmt 0
	ldr	r0, [r0, #72]
.LVL75:
	bl	HAL_DMA_Abort_IT
.LVL76:
	b	.L75
.L83:
	.loc 1 620 5 is_stmt 1
	.loc 1 620 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 620 29
	movs	r2, #2
	str	r2, [r3, #20]
	.loc 1 623 5 is_stmt 1
	.loc 1 623 10 is_stmt 0
	ldr	r3, [r4, #76]
	.loc 1 623 22
	orr	r3, r3, #1
	str	r3, [r4, #76]
	.loc 1 626 5 is_stmt 1
	.loc 1 626 18 is_stmt 0
	movs	r3, #4
	strb	r3, [r4, #53]
	.loc 1 629 5 is_stmt 1
	.loc 1 629 10 is_stmt 0
	ldr	r3, [r4, #72]
	.loc 1 629 42
	ldr	r2, .L86
	str	r2, [r3, #80]
	.loc 1 632 5 is_stmt 1
	.loc 1 632 11 is_stmt 0
	ldr	r0, [r4, #72]
	bl	HAL_DMA_Abort_IT
.LVL77:
	b	.L76
.L84:
	.loc 1 638 5 is_stmt 1
	.loc 1 638 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 638 29
	movs	r2, #16
	str	r2, [r3, #20]
	.loc 1 645 5 is_stmt 1
	mov	r0, r4
	bl	HAL_DCMI_LineEventCallback
.LVL78:
	b	.L77
.L85:
	.loc 1 652 5
	.loc 1 652 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 652 29
	movs	r2, #8
	str	r2, [r3, #20]
	.loc 1 659 5 is_stmt 1
	mov	r0, r4
	bl	HAL_DCMI_VsyncEventCallback
.LVL79:
	b	.L78
.L87:
	.align	2
.L86:
	.word	DCMI_DMAError
	.cfi_endproc
.LFE343:
	.size	HAL_DCMI_IRQHandler, .-HAL_DCMI_IRQHandler
	.section	.text.HAL_DCMI_ConfigCrop,"ax",%progbits
	.align	1
	.global	HAL_DCMI_ConfigCrop
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_ConfigCrop, %function
HAL_DCMI_ConfigCrop:
.LFB348:
	.loc 1 782 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL80:
	mov	ip, r0
	.loc 1 784 3
	.loc 1 784 7
	.loc 1 784 17 is_stmt 0
	ldrb	r0, [r0, #52]	@ zero_extendqisi2
.LVL81:
	.loc 1 784 9
	cmp	r0, #1
	beq	.L90
	.loc 1 782 1 discriminator 2
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 784 67 is_stmt 1 discriminator 2
	.loc 1 784 81 is_stmt 0 discriminator 2
	movs	r0, #1
	strb	r0, [ip, #52]
	.loc 1 784 5 is_stmt 1 discriminator 2
	.loc 1 787 3 discriminator 2
	.loc 1 787 16 is_stmt 0 discriminator 2
	mov	lr, #2
	strb	lr, [ip, #53]
	.loc 1 790 3 is_stmt 1 discriminator 2
	.loc 1 791 3 discriminator 2
	.loc 1 792 3 discriminator 2
	.loc 1 793 3 discriminator 2
	.loc 1 796 3 discriminator 2
	.loc 1 796 37 is_stmt 0 discriminator 2
	ldr	r4, [sp, #8]
	orr	r3, r3, r4, lsl #16
.LVL82:
	.loc 1 796 28 discriminator 2
	ldr	r4, [ip]
	str	r3, [r4, #36]
	.loc 1 797 3 is_stmt 1 discriminator 2
	.loc 1 797 8 is_stmt 0 discriminator 2
	ldr	r3, [ip]
	.loc 1 797 34 discriminator 2
	orr	r1, r1, r2, lsl #16
.LVL83:
	.loc 1 797 28 discriminator 2
	str	r1, [r3, #32]
	.loc 1 800 3 is_stmt 1 discriminator 2
	.loc 1 800 16 is_stmt 0 discriminator 2
	strb	r0, [ip, #53]
	.loc 1 803 3 is_stmt 1 discriminator 2
	.loc 1 803 7 discriminator 2
	.loc 1 803 21 is_stmt 0 discriminator 2
	movs	r0, #0
	strb	r0, [ip, #52]
	.loc 1 803 5 is_stmt 1 discriminator 2
	.loc 1 805 3 discriminator 2
	.loc 1 806 1 is_stmt 0 discriminator 2
	pop	{r4, pc}
.LVL84:
.L90:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 784 48
	movs	r0, #2
	.loc 1 806 1
	bx	lr
	.cfi_endproc
.LFE348:
	.size	HAL_DCMI_ConfigCrop, .-HAL_DCMI_ConfigCrop
	.section	.text.HAL_DCMI_DisableCrop,"ax",%progbits
	.align	1
	.global	HAL_DCMI_DisableCrop
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_DisableCrop, %function
HAL_DCMI_DisableCrop:
.LFB349:
	.loc 1 815 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL85:
	.loc 1 817 3
	.loc 1 817 7
	.loc 1 817 17 is_stmt 0
	ldrb	r3, [r0, #52]	@ zero_extendqisi2
	.loc 1 817 9
	cmp	r3, #1
	beq	.L97
	.loc 1 817 67 is_stmt 1 discriminator 2
	.loc 1 817 81 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #52]
	.loc 1 817 5 is_stmt 1 discriminator 2
	.loc 1 820 3 discriminator 2
	.loc 1 820 16 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #53]
	.loc 1 823 3 is_stmt 1 discriminator 2
	.loc 1 823 8 is_stmt 0 discriminator 2
	ldr	r1, [r0]
	.loc 1 823 18 discriminator 2
	ldr	r3, [r1]
	.loc 1 823 23 discriminator 2
	bic	r3, r3, #4
	str	r3, [r1]
	.loc 1 826 3 is_stmt 1 discriminator 2
	.loc 1 826 16 is_stmt 0 discriminator 2
	strb	r2, [r0, #53]
	.loc 1 829 3 is_stmt 1 discriminator 2
	.loc 1 829 7 discriminator 2
	.loc 1 829 21 is_stmt 0 discriminator 2
	movs	r3, #0
	strb	r3, [r0, #52]
	.loc 1 829 5 is_stmt 1 discriminator 2
	.loc 1 831 3 discriminator 2
	.loc 1 831 10 is_stmt 0 discriminator 2
	mov	r0, r3
.LVL86:
	bx	lr
.LVL87:
.L97:
	.loc 1 817 48
	movs	r0, #2
.LVL88:
	.loc 1 832 1
	bx	lr
	.cfi_endproc
.LFE349:
	.size	HAL_DCMI_DisableCrop, .-HAL_DCMI_DisableCrop
	.section	.text.HAL_DCMI_EnableCrop,"ax",%progbits
	.align	1
	.global	HAL_DCMI_EnableCrop
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_EnableCrop, %function
HAL_DCMI_EnableCrop:
.LFB350:
	.loc 1 841 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL89:
	.loc 1 843 3
	.loc 1 843 7
	.loc 1 843 17 is_stmt 0
	ldrb	r3, [r0, #52]	@ zero_extendqisi2
	.loc 1 843 9
	cmp	r3, #1
	beq	.L100
	.loc 1 843 67 is_stmt 1 discriminator 2
	.loc 1 843 81 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #52]
	.loc 1 843 5 is_stmt 1 discriminator 2
	.loc 1 846 3 discriminator 2
	.loc 1 846 16 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #53]
	.loc 1 849 3 is_stmt 1 discriminator 2
	.loc 1 849 8 is_stmt 0 discriminator 2
	ldr	r1, [r0]
	.loc 1 849 18 discriminator 2
	ldr	r3, [r1]
	.loc 1 849 23 discriminator 2
	orr	r3, r3, #4
	str	r3, [r1]
	.loc 1 852 3 is_stmt 1 discriminator 2
	.loc 1 852 16 is_stmt 0 discriminator 2
	strb	r2, [r0, #53]
	.loc 1 855 3 is_stmt 1 discriminator 2
	.loc 1 855 7 discriminator 2
	.loc 1 855 21 is_stmt 0 discriminator 2
	movs	r3, #0
	strb	r3, [r0, #52]
	.loc 1 855 5 is_stmt 1 discriminator 2
	.loc 1 857 3 discriminator 2
	.loc 1 857 10 is_stmt 0 discriminator 2
	mov	r0, r3
.LVL90:
	bx	lr
.LVL91:
.L100:
	.loc 1 843 48
	movs	r0, #2
.LVL92:
	.loc 1 858 1
	bx	lr
	.cfi_endproc
.LFE350:
	.size	HAL_DCMI_EnableCrop, .-HAL_DCMI_EnableCrop
	.section	.text.HAL_DCMI_ConfigSyncUnmask,"ax",%progbits
	.align	1
	.global	HAL_DCMI_ConfigSyncUnmask
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_ConfigSyncUnmask, %function
HAL_DCMI_ConfigSyncUnmask:
.LFB351:
	.loc 1 869 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL93:
	mov	r3, r0
	.loc 1 871 3
	.loc 1 871 7
	.loc 1 871 17 is_stmt 0
	ldrb	r2, [r0, #52]	@ zero_extendqisi2
	.loc 1 871 9
	cmp	r2, #1
	beq	.L103
	.loc 1 871 67 is_stmt 1 discriminator 2
	.loc 1 871 81 is_stmt 0 discriminator 2
	movs	r0, #1
.LVL94:
	strb	r0, [r3, #52]
	.loc 1 871 5 is_stmt 1 discriminator 2
	.loc 1 874 3 discriminator 2
	.loc 1 874 16 is_stmt 0 discriminator 2
	movs	r2, #2
	strb	r2, [r3, #53]
	.loc 1 877 3 is_stmt 1 discriminator 2
	.loc 1 877 49 is_stmt 0 discriminator 2
	ldrb	r2, [r1]	@ zero_extendqisi2
	.loc 1 878 49 discriminator 2
	ldrb	ip, [r1, #1]	@ zero_extendqisi2
	.loc 1 877 69 discriminator 2
	orr	r2, r2, ip, lsl #8
	.loc 1 879 49 discriminator 2
	ldrb	ip, [r1, #2]	@ zero_extendqisi2
	.loc 1 878 76 discriminator 2
	orr	r2, r2, ip, lsl #16
	.loc 1 880 49 discriminator 2
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	.loc 1 877 8 discriminator 2
	ldr	r1, [r3]
.LVL95:
	.loc 1 879 75 discriminator 2
	orr	r2, r2, ip, lsl #24
	.loc 1 877 25 discriminator 2
	str	r2, [r1, #28]
	.loc 1 883 3 is_stmt 1 discriminator 2
	.loc 1 883 16 is_stmt 0 discriminator 2
	strb	r0, [r3, #53]
	.loc 1 886 3 is_stmt 1 discriminator 2
	.loc 1 886 7 discriminator 2
	.loc 1 886 21 is_stmt 0 discriminator 2
	movs	r0, #0
	strb	r0, [r3, #52]
	.loc 1 886 5 is_stmt 1 discriminator 2
	.loc 1 888 3 discriminator 2
	.loc 1 888 10 is_stmt 0 discriminator 2
	bx	lr
.LVL96:
.L103:
	.loc 1 871 48
	movs	r0, #2
.LVL97:
	.loc 1 889 1
	bx	lr
	.cfi_endproc
.LFE351:
	.size	HAL_DCMI_ConfigSyncUnmask, .-HAL_DCMI_ConfigSyncUnmask
	.section	.text.HAL_DCMI_GetState,"ax",%progbits
	.align	1
	.global	HAL_DCMI_GetState
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_GetState, %function
HAL_DCMI_GetState:
.LFB352:
	.loc 1 918 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL98:
	.loc 1 919 3
	.loc 1 919 15 is_stmt 0
	ldrb	r0, [r0, #53]	@ zero_extendqisi2
.LVL99:
	.loc 1 920 1
	bx	lr
	.cfi_endproc
.LFE352:
	.size	HAL_DCMI_GetState, .-HAL_DCMI_GetState
	.section	.text.HAL_DCMI_GetError,"ax",%progbits
	.align	1
	.global	HAL_DCMI_GetError
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DCMI_GetError, %function
HAL_DCMI_GetError:
.LFB353:
	.loc 1 929 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL100:
	.loc 1 930 3
	.loc 1 930 15 is_stmt 0
	ldr	r0, [r0, #76]
.LVL101:
	.loc 1 931 1
	bx	lr
	.cfi_endproc
.LFE353:
	.size	HAL_DCMI_GetError, .-HAL_DCMI_GetError
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dma.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dma_ex.h"
	.file 8 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dcmi.h"
	.file 9 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/system_stm32h7xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xcd1
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x1b
	.4byte	.LASF160
	.byte	0x1d
	.4byte	.LASF161
	.4byte	.LASF162
	.4byte	.LLRL29
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF0
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x40
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x61
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x1c
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x6
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
	.uleb128 0x15
	.4byte	0x90
	.uleb128 0x1d
	.4byte	.LASF163
	.byte	0x9
	.byte	0x39
	.byte	0x11
	.4byte	0x90
	.uleb128 0xd
	.byte	0x2c
	.2byte	0x21c
	.4byte	0x137
	.uleb128 0x8
	.ascii	"CR\000"
	.2byte	0x21e
	.4byte	0x9c
	.byte	0
	.uleb128 0x8
	.ascii	"SR\000"
	.2byte	0x21f
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF13
	.2byte	0x220
	.4byte	0x9c
	.byte	0x8
	.uleb128 0x8
	.ascii	"IER\000"
	.2byte	0x221
	.4byte	0x9c
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF14
	.2byte	0x222
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x8
	.ascii	"ICR\000"
	.2byte	0x223
	.4byte	0x9c
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF15
	.2byte	0x224
	.4byte	0x9c
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF16
	.2byte	0x225
	.4byte	0x9c
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF17
	.2byte	0x226
	.4byte	0x9c
	.byte	0x20
	.uleb128 0x7
	.4byte	.LASF18
	.2byte	0x227
	.4byte	0x9c
	.byte	0x24
	.uleb128 0x8
	.ascii	"DR\000"
	.2byte	0x228
	.4byte	0x9c
	.byte	0x28
	.byte	0
	.uleb128 0xe
	.4byte	.LASF19
	.2byte	0x229
	.byte	0x3
	.4byte	0xad
	.uleb128 0xd
	.byte	0x18
	.2byte	0x22f
	.4byte	0x193
	.uleb128 0x8
	.ascii	"CR\000"
	.2byte	0x231
	.4byte	0x9c
	.byte	0
	.uleb128 0x7
	.4byte	.LASF20
	.2byte	0x232
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x8
	.ascii	"PAR\000"
	.2byte	0x233
	.4byte	0x9c
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF21
	.2byte	0x234
	.4byte	0x9c
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF22
	.2byte	0x235
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x8
	.ascii	"FCR\000"
	.2byte	0x236
	.4byte	0x9c
	.byte	0x14
	.byte	0
	.uleb128 0xe
	.4byte	.LASF23
	.2byte	0x237
	.byte	0x3
	.4byte	0x143
	.uleb128 0xd
	.byte	0x4
	.2byte	0x250
	.4byte	0x1b4
	.uleb128 0x8
	.ascii	"CCR\000"
	.2byte	0x252
	.4byte	0x9c
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF24
	.2byte	0x253
	.byte	0x2
	.4byte	0x19f
	.uleb128 0xd
	.byte	0x8
	.2byte	0x255
	.4byte	0x1e1
	.uleb128 0x8
	.ascii	"CSR\000"
	.2byte	0x257
	.4byte	0x9c
	.byte	0
	.uleb128 0x8
	.ascii	"CFR\000"
	.2byte	0x258
	.4byte	0x9c
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.4byte	.LASF25
	.2byte	0x259
	.byte	0x2
	.4byte	0x1c0
	.uleb128 0xd
	.byte	0x4
	.2byte	0x25b
	.4byte	0x202
	.uleb128 0x7
	.4byte	.LASF26
	.2byte	0x25d
	.4byte	0x9c
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF27
	.2byte	0x25e
	.byte	0x2
	.4byte	0x1ed
	.uleb128 0xd
	.byte	0x8
	.2byte	0x260
	.4byte	0x22f
	.uleb128 0x7
	.4byte	.LASF28
	.2byte	0x262
	.4byte	0x9c
	.byte	0
	.uleb128 0x7
	.4byte	.LASF29
	.2byte	0x263
	.4byte	0x9c
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.4byte	.LASF30
	.2byte	0x264
	.byte	0x2
	.4byte	0x20e
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF31
	.uleb128 0x1e
	.byte	0x4
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF32
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.4byte	.LASF33
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF34
	.uleb128 0x12
	.4byte	0x40
	.byte	0x5
	.byte	0x28
	.4byte	0x27d
	.uleb128 0x3
	.4byte	.LASF35
	.byte	0
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF37
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF38
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.4byte	.LASF39
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0x259
	.uleb128 0x12
	.4byte	0x40
	.byte	0x5
	.byte	0x33
	.4byte	0x2a1
	.uleb128 0x3
	.4byte	.LASF40
	.byte	0
	.uleb128 0x3
	.4byte	.LASF41
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF42
	.byte	0x5
	.byte	0x36
	.byte	0x3
	.4byte	0x289
	.uleb128 0x13
	.byte	0x30
	.byte	0x6
	.byte	0x30
	.4byte	0x352
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x6
	.byte	0x32
	.byte	0xc
	.4byte	0x90
	.byte	0
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x6
	.byte	0x35
	.byte	0xc
	.4byte	0x90
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x6
	.byte	0x39
	.byte	0xc
	.4byte	0x90
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x6
	.byte	0x3c
	.byte	0xc
	.4byte	0x90
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x6
	.byte	0x3f
	.byte	0xc
	.4byte	0x90
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0x6
	.byte	0x42
	.byte	0xc
	.4byte	0x90
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x6
	.byte	0x45
	.byte	0xc
	.4byte	0x90
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0x6
	.byte	0x4a
	.byte	0xc
	.4byte	0x90
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0x6
	.byte	0x4d
	.byte	0xc
	.4byte	0x90
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0x6
	.byte	0x52
	.byte	0xc
	.4byte	0x90
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x6
	.byte	0x55
	.byte	0xc
	.4byte	0x90
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x6
	.byte	0x5b
	.byte	0xc
	.4byte	0x90
	.byte	0x2c
	.byte	0
	.uleb128 0x4
	.4byte	.LASF55
	.byte	0x6
	.byte	0x60
	.byte	0x2
	.4byte	0x2ad
	.uleb128 0x12
	.4byte	0x40
	.byte	0x6
	.byte	0x66
	.4byte	0x388
	.uleb128 0x3
	.4byte	.LASF56
	.byte	0
	.uleb128 0x3
	.4byte	.LASF57
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF58
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF59
	.byte	0x3
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF61
	.byte	0x6
	.byte	0x6c
	.byte	0x2
	.4byte	0x35e
	.uleb128 0x15
	.4byte	0x388
	.uleb128 0x1f
	.4byte	.LASF164
	.byte	0x78
	.byte	0x6
	.byte	0x88
	.byte	0x10
	.4byte	0x4ab
	.uleb128 0x1
	.4byte	.LASF62
	.byte	0x6
	.byte	0x8a
	.byte	0x9
	.4byte	0x242
	.byte	0
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0x6
	.byte	0x8c
	.byte	0x13
	.4byte	0x352
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x6
	.byte	0x8e
	.byte	0x13
	.4byte	0x2a1
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0x6
	.byte	0x90
	.byte	0x21
	.4byte	0x394
	.byte	0x35
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x6
	.byte	0x92
	.byte	0x9
	.4byte	0x242
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x6
	.byte	0x94
	.byte	0xb
	.4byte	0x4bb
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x6
	.byte	0x96
	.byte	0xb
	.4byte	0x4bb
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x6
	.byte	0x98
	.byte	0xb
	.4byte	0x4bb
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF70
	.byte	0x6
	.byte	0x9a
	.byte	0xb
	.4byte	0x4bb
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF71
	.byte	0x6
	.byte	0x9c
	.byte	0xb
	.4byte	0x4bb
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0x6
	.byte	0x9e
	.byte	0xb
	.4byte	0x4bb
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x6
	.byte	0xa0
	.byte	0x14
	.4byte	0x9c
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x6
	.byte	0xa2
	.byte	0xb
	.4byte	0x90
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF75
	.byte	0x6
	.byte	0xa4
	.byte	0xb
	.4byte	0x90
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0x6
	.byte	0xa6
	.byte	0x1a
	.4byte	0x4c0
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF77
	.byte	0x6
	.byte	0xa8
	.byte	0x20
	.4byte	0x4c5
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0x6
	.byte	0xaa
	.byte	0xb
	.4byte	0x90
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x6
	.byte	0xad
	.byte	0x1d
	.4byte	0x4ca
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF80
	.byte	0x6
	.byte	0xaf
	.byte	0x23
	.4byte	0x4cf
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF81
	.byte	0x6
	.byte	0xb1
	.byte	0xb
	.4byte	0x90
	.byte	0x74
	.byte	0
	.uleb128 0x20
	.4byte	0x4b6
	.uleb128 0x5
	.4byte	0x4b6
	.byte	0
	.uleb128 0xa
	.4byte	0x399
	.uleb128 0xa
	.4byte	0x4ab
	.uleb128 0xa
	.4byte	0x1b4
	.uleb128 0xa
	.4byte	0x1e1
	.uleb128 0xa
	.4byte	0x202
	.uleb128 0xa
	.4byte	0x22f
	.uleb128 0x4
	.4byte	.LASF82
	.byte	0x6
	.byte	0xb3
	.byte	0x2
	.4byte	0x399
	.uleb128 0x12
	.4byte	0x40
	.byte	0x7
	.byte	0x30
	.4byte	0x4f8
	.uleb128 0x3
	.4byte	.LASF83
	.byte	0
	.uleb128 0x3
	.4byte	.LASF84
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF85
	.byte	0x7
	.byte	0x34
	.byte	0x2
	.4byte	0x4e0
	.uleb128 0x12
	.4byte	0x40
	.byte	0x8
	.byte	0x30
	.4byte	0x534
	.uleb128 0x3
	.4byte	.LASF86
	.byte	0
	.uleb128 0x3
	.4byte	.LASF87
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF88
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF89
	.byte	0x3
	.uleb128 0x3
	.4byte	.LASF90
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF91
	.byte	0x5
	.byte	0
	.uleb128 0x4
	.4byte	.LASF92
	.byte	0x8
	.byte	0x37
	.byte	0x3
	.4byte	0x504
	.uleb128 0x15
	.4byte	0x534
	.uleb128 0x13
	.byte	0x4
	.byte	0x8
	.byte	0x3c
	.4byte	0x582
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0x8
	.byte	0x3e
	.byte	0xb
	.4byte	0x84
	.byte	0
	.uleb128 0x1
	.4byte	.LASF94
	.byte	0x8
	.byte	0x3f
	.byte	0xb
	.4byte	0x84
	.byte	0x1
	.uleb128 0x1
	.4byte	.LASF95
	.byte	0x8
	.byte	0x40
	.byte	0xb
	.4byte	0x84
	.byte	0x2
	.uleb128 0x1
	.4byte	.LASF96
	.byte	0x8
	.byte	0x41
	.byte	0xb
	.4byte	0x84
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.4byte	.LASF97
	.byte	0x8
	.byte	0x42
	.byte	0x3
	.4byte	0x545
	.uleb128 0x13
	.byte	0x4
	.byte	0x8
	.byte	0x47
	.4byte	0x5cb
	.uleb128 0x1
	.4byte	.LASF98
	.byte	0x8
	.byte	0x49
	.byte	0xb
	.4byte	0x84
	.byte	0
	.uleb128 0x1
	.4byte	.LASF99
	.byte	0x8
	.byte	0x4a
	.byte	0xb
	.4byte	0x84
	.byte	0x1
	.uleb128 0x1
	.4byte	.LASF100
	.byte	0x8
	.byte	0x4b
	.byte	0xb
	.4byte	0x84
	.byte	0x2
	.uleb128 0x1
	.4byte	.LASF101
	.byte	0x8
	.byte	0x4c
	.byte	0xb
	.4byte	0x84
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.4byte	.LASF102
	.byte	0x8
	.byte	0x4d
	.byte	0x3
	.4byte	0x58e
	.uleb128 0x13
	.byte	0x30
	.byte	0x8
	.byte	0x51
	.4byte	0x67c
	.uleb128 0x1
	.4byte	.LASF103
	.byte	0x8
	.byte	0x53
	.byte	0xc
	.4byte	0x90
	.byte	0
	.uleb128 0x1
	.4byte	.LASF104
	.byte	0x8
	.byte	0x56
	.byte	0xc
	.4byte	0x90
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF105
	.byte	0x8
	.byte	0x59
	.byte	0xc
	.4byte	0x90
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF106
	.byte	0x8
	.byte	0x5c
	.byte	0xc
	.4byte	0x90
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF107
	.byte	0x8
	.byte	0x5f
	.byte	0xc
	.4byte	0x90
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF108
	.byte	0x8
	.byte	0x62
	.byte	0xc
	.4byte	0x90
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF109
	.byte	0x8
	.byte	0x65
	.byte	0x19
	.4byte	0x582
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF110
	.byte	0x8
	.byte	0x68
	.byte	0xc
	.4byte	0x90
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF111
	.byte	0x8
	.byte	0x6b
	.byte	0xc
	.4byte	0x90
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF112
	.byte	0x8
	.byte	0x6e
	.byte	0xc
	.4byte	0x90
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF113
	.byte	0x8
	.byte	0x71
	.byte	0xc
	.4byte	0x90
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF114
	.byte	0x8
	.byte	0x74
	.byte	0xc
	.4byte	0x90
	.byte	0x2c
	.byte	0
	.uleb128 0x4
	.4byte	.LASF115
	.byte	0x8
	.byte	0x76
	.byte	0x3
	.4byte	0x5d7
	.uleb128 0x13
	.byte	0x50
	.byte	0x8
	.byte	0x7e
	.4byte	0x713
	.uleb128 0x1
	.4byte	.LASF62
	.byte	0x8
	.byte	0x81
	.byte	0x11
	.4byte	0x713
	.byte	0
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0x8
	.byte	0x83
	.byte	0x14
	.4byte	0x67c
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x8
	.byte	0x85
	.byte	0x13
	.4byte	0x2a1
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0x8
	.byte	0x87
	.byte	0x22
	.4byte	0x540
	.byte	0x35
	.uleb128 0x1
	.4byte	.LASF116
	.byte	0x8
	.byte	0x89
	.byte	0x15
	.4byte	0x9c
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF117
	.byte	0x8
	.byte	0x8b
	.byte	0x15
	.4byte	0x9c
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF118
	.byte	0x8
	.byte	0x8d
	.byte	0xc
	.4byte	0x90
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF119
	.byte	0x8
	.byte	0x8f
	.byte	0xc
	.4byte	0x90
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF120
	.byte	0x8
	.byte	0x91
	.byte	0x16
	.4byte	0x718
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x8
	.byte	0x93
	.byte	0x15
	.4byte	0x9c
	.byte	0x4c
	.byte	0
	.uleb128 0xa
	.4byte	0x137
	.uleb128 0xa
	.4byte	0x4d4
	.uleb128 0x4
	.4byte	.LASF121
	.byte	0x8
	.byte	0x9d
	.byte	0x3
	.4byte	0x688
	.uleb128 0x16
	.4byte	.LASF122
	.2byte	0x4b0
	.4byte	0x27d
	.4byte	0x73e
	.uleb128 0x5
	.4byte	0x718
	.byte	0
	.uleb128 0x16
	.4byte	.LASF123
	.2byte	0x4af
	.4byte	0x27d
	.4byte	0x753
	.uleb128 0x5
	.4byte	0x718
	.byte	0
	.uleb128 0x18
	.4byte	.LASF124
	.byte	0xef
	.4byte	0x27d
	.4byte	0x771
	.uleb128 0x5
	.4byte	0x718
	.uleb128 0x5
	.4byte	0x90
	.uleb128 0x5
	.4byte	0x4f8
	.byte	0
	.uleb128 0x18
	.4byte	.LASF125
	.byte	0xee
	.4byte	0x27d
	.4byte	0x799
	.uleb128 0x5
	.4byte	0x718
	.uleb128 0x5
	.4byte	0x90
	.uleb128 0x5
	.4byte	0x90
	.uleb128 0x5
	.4byte	0x90
	.uleb128 0x5
	.4byte	0x90
	.byte	0
	.uleb128 0x16
	.4byte	.LASF126
	.2byte	0x4ae
	.4byte	0x27d
	.4byte	0x7bd
	.uleb128 0x5
	.4byte	0x718
	.uleb128 0x5
	.4byte	0x90
	.uleb128 0x5
	.4byte	0x90
	.uleb128 0x5
	.4byte	0x90
	.byte	0
	.uleb128 0x19
	.4byte	.LASF127
	.2byte	0x4ac
	.4byte	.LFB355
	.4byte	.LFE355-.LFB355
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7fc
	.uleb128 0x2
	.4byte	.LASF129
	.2byte	0x4ac
	.byte	0x2e
	.4byte	0x718
	.4byte	.LLST16
	.uleb128 0xf
	.4byte	.LASF130
	.2byte	0x4ae
	.byte	0x17
	.4byte	0x7fc
	.4byte	.LLST17
	.uleb128 0x10
	.4byte	.LVL66
	.4byte	0xa2c
	.byte	0
	.uleb128 0xa
	.4byte	0x71d
	.uleb128 0x19
	.4byte	.LASF128
	.2byte	0x46b
	.4byte	.LFB354
	.4byte	.LFE354-.LFB354
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x868
	.uleb128 0x2
	.4byte	.LASF129
	.2byte	0x46b
	.byte	0x31
	.4byte	0x718
	.4byte	.LLST0
	.uleb128 0x21
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x46d
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST1
	.uleb128 0x1a
	.4byte	.LASF130
	.2byte	0x46f
	.byte	0x17
	.4byte	0x7fc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x17
	.4byte	.LVL8
	.4byte	0x753
	.4byte	0x858
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x14
	.4byte	.LVL10
	.4byte	0x753
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	.LASF131
	.2byte	0x3a0
	.byte	0xa
	.4byte	0x90
	.4byte	.LFB353
	.4byte	.LFE353-.LFB353
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x893
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x3a0
	.byte	0x30
	.4byte	0x7fc
	.4byte	.LLST28
	.byte	0
	.uleb128 0x9
	.4byte	.LASF132
	.2byte	0x395
	.byte	0x17
	.4byte	0x534
	.4byte	.LFB352
	.4byte	.LFE352-.LFB352
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8be
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x395
	.byte	0x3d
	.4byte	0x7fc
	.4byte	.LLST27
	.byte	0
	.uleb128 0x9
	.4byte	.LASF133
	.2byte	0x364
	.byte	0x13
	.4byte	0x27d
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8f9
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x364
	.byte	0x41
	.4byte	0x7fc
	.4byte	.LLST25
	.uleb128 0x2
	.4byte	.LASF134
	.2byte	0x364
	.byte	0x60
	.4byte	0x8f9
	.4byte	.LLST26
	.byte	0
	.uleb128 0xa
	.4byte	0x5cb
	.uleb128 0x9
	.4byte	.LASF135
	.2byte	0x348
	.byte	0x13
	.4byte	0x27d
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x929
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x348
	.byte	0x3b
	.4byte	0x7fc
	.4byte	.LLST24
	.byte	0
	.uleb128 0x9
	.4byte	.LASF136
	.2byte	0x32e
	.byte	0x13
	.4byte	0x27d
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x954
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x32e
	.byte	0x3c
	.4byte	0x7fc
	.4byte	.LLST23
	.byte	0
	.uleb128 0x9
	.4byte	.LASF137
	.2byte	0x30d
	.byte	0x13
	.4byte	0x27d
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9bd
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x30d
	.byte	0x3b
	.4byte	0x7fc
	.4byte	.LLST19
	.uleb128 0x22
	.ascii	"X0\000"
	.byte	0x1
	.2byte	0x30d
	.byte	0x4b
	.4byte	0x90
	.4byte	.LLST20
	.uleb128 0x23
	.ascii	"Y0\000"
	.byte	0x1
	.2byte	0x30d
	.byte	0x58
	.4byte	0x90
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.4byte	.LASF138
	.2byte	0x30d
	.byte	0x65
	.4byte	0x90
	.4byte	.LLST21
	.uleb128 0x2
	.4byte	.LASF139
	.2byte	0x30d
	.byte	0x75
	.4byte	0x90
	.4byte	.LLST22
	.byte	0
	.uleb128 0xc
	.4byte	.LASF140
	.2byte	0x2e5
	.byte	0x1c
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9e2
	.uleb128 0x11
	.4byte	.LASF130
	.2byte	0x2e5
	.byte	0x4c
	.4byte	0x7fc
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF141
	.2byte	0x2d5
	.byte	0x1c
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa07
	.uleb128 0x11
	.4byte	.LASF130
	.2byte	0x2d5
	.byte	0x4c
	.4byte	0x7fc
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF142
	.2byte	0x2c6
	.byte	0x1c
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa2c
	.uleb128 0x11
	.4byte	.LASF130
	.2byte	0x2c6
	.byte	0x4b
	.4byte	0x7fc
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF143
	.2byte	0x2b6
	.byte	0x1c
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa51
	.uleb128 0x11
	.4byte	.LASF130
	.2byte	0x2b6
	.byte	0x47
	.4byte	0x7fc
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF144
	.2byte	0x252
	.byte	0x6
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xad0
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x252
	.byte	0x2e
	.4byte	0x7fc
	.4byte	.LLST18
	.uleb128 0x1a
	.4byte	.LASF145
	.2byte	0x254
	.byte	0xc
	.4byte	0x90
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x17
	.4byte	.LVL73
	.4byte	0x9bd
	.4byte	0xa99
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x10
	.4byte	.LVL76
	.4byte	0x729
	.uleb128 0x10
	.4byte	.LVL77
	.4byte	0x729
	.uleb128 0x17
	.4byte	.LVL78
	.4byte	0xa07
	.4byte	0xabf
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL79
	.4byte	0x9e2
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	.LASF146
	.2byte	0x238
	.byte	0x13
	.4byte	0x27d
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xafb
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x238
	.byte	0x37
	.4byte	0x7fc
	.4byte	.LLST15
	.byte	0
	.uleb128 0x9
	.4byte	.LASF147
	.2byte	0x209
	.byte	0x13
	.4byte	0x27d
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb46
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x209
	.byte	0x38
	.4byte	0x7fc
	.4byte	.LLST12
	.uleb128 0xf
	.4byte	.LASF148
	.2byte	0x20b
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST13
	.uleb128 0xf
	.4byte	.LASF149
	.2byte	0x20c
	.byte	0x15
	.4byte	0x27d
	.4byte	.LLST14
	.byte	0
	.uleb128 0x9
	.4byte	.LASF150
	.2byte	0x1d3
	.byte	0x13
	.4byte	0x27d
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb9a
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x1d3
	.byte	0x35
	.4byte	0x7fc
	.4byte	.LLST9
	.uleb128 0xf
	.4byte	.LASF148
	.2byte	0x1d5
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST10
	.uleb128 0xf
	.4byte	.LASF149
	.2byte	0x1d6
	.byte	0x15
	.4byte	0x27d
	.4byte	.LLST11
	.uleb128 0x10
	.4byte	.LVL45
	.4byte	0x73e
	.byte	0
	.uleb128 0x9
	.4byte	.LASF151
	.2byte	0x16a
	.byte	0x13
	.4byte	0x27d
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc1f
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x16a
	.byte	0x3a
	.4byte	0x7fc
	.4byte	.LLST4
	.uleb128 0x2
	.4byte	.LASF152
	.2byte	0x16a
	.byte	0x4a
	.4byte	0x90
	.4byte	.LLST5
	.uleb128 0x2
	.4byte	.LASF153
	.2byte	0x16a
	.byte	0x5e
	.4byte	0x90
	.4byte	.LLST6
	.uleb128 0x2
	.4byte	.LASF154
	.2byte	0x16a
	.byte	0x6e
	.4byte	0x90
	.4byte	.LLST7
	.uleb128 0xf
	.4byte	.LASF155
	.2byte	0x16d
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST8
	.uleb128 0x10
	.4byte	.LVL29
	.4byte	0x799
	.uleb128 0x14
	.4byte	.LVL33
	.4byte	0x771
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF156
	.2byte	0x143
	.byte	0x1c
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc44
	.uleb128 0x11
	.4byte	.LASF130
	.2byte	0x143
	.byte	0x43
	.4byte	0x7fc
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF157
	.2byte	0x133
	.byte	0x1c
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc69
	.uleb128 0x11
	.4byte	.LASF130
	.2byte	0x133
	.byte	0x41
	.4byte	0x7fc
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x9
	.4byte	.LASF158
	.2byte	0x113
	.byte	0x13
	.4byte	0x27d
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xca4
	.uleb128 0x2
	.4byte	.LASF130
	.2byte	0x113
	.byte	0x37
	.4byte	0x7fc
	.4byte	.LLST3
	.uleb128 0x14
	.4byte	.LVL25
	.4byte	0xc1f
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LASF159
	.byte	0x1
	.byte	0xb2
	.byte	0x13
	.4byte	0x27d
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x25
	.4byte	.LASF130
	.byte	0x1
	.byte	0xb2
	.byte	0x35
	.4byte	0x7fc
	.4byte	.LLST2
	.uleb128 0x10
	.4byte	.LVL20
	.4byte	0xc44
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x21
	.sleb128 21
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
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
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
	.uleb128 0xd
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 19
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 19
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
	.uleb128 0x19
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
	.sleb128 13
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
	.uleb128 0x1a
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x25
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
	.byte	0
	.section	.debug_loclists,"",%progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST16:
	.byte	0x6
	.4byte	.LVL64
	.byte	0x4
	.uleb128 .LVL64-.LVL64
	.uleb128 .LVL65-.LVL64
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL65-.LVL64
	.uleb128 .LFE355-.LVL64
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x8
	.4byte	.LVL65
	.uleb128 .LVL66-1-.LVL65
	.uleb128 0x1
	.byte	0x50
	.byte	0
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
	.uleb128 .LVL11-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL11-.LVL0
	.uleb128 .LVL15-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL15-.LVL0
	.uleb128 .LFE354-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL3
	.byte	0x4
	.uleb128 .LVL3-.LVL3
	.uleb128 .LVL4-.LVL3
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL6-.LVL3
	.uleb128 .LVL8-1-.LVL3
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL9-.LVL3
	.uleb128 .LVL10-1-.LVL3
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL12-.LVL3
	.uleb128 .LVL13-.LVL3
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL13-.LVL3
	.uleb128 .LVL14-.LVL3
	.uleb128 0x3
	.byte	0x74
	.sleb128 68
	.byte	0
.LLST28:
	.byte	0x6
	.4byte	.LVL100
	.byte	0x4
	.uleb128 .LVL100-.LVL100
	.uleb128 .LVL101-.LVL100
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL101-.LVL100
	.uleb128 .LFE353-.LVL100
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST27:
	.byte	0x6
	.4byte	.LVL98
	.byte	0x4
	.uleb128 .LVL98-.LVL98
	.uleb128 .LVL99-.LVL98
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL99-.LVL98
	.uleb128 .LFE352-.LVL98
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST25:
	.byte	0x6
	.4byte	.LVL93
	.byte	0x4
	.uleb128 .LVL93-.LVL93
	.uleb128 .LVL94-.LVL93
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL94-.LVL93
	.uleb128 .LVL96-.LVL93
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL96-.LVL93
	.uleb128 .LVL97-.LVL93
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL97-.LVL93
	.uleb128 .LFE351-.LVL93
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST26:
	.byte	0x6
	.4byte	.LVL93
	.byte	0x4
	.uleb128 .LVL93-.LVL93
	.uleb128 .LVL95-.LVL93
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL95-.LVL93
	.uleb128 .LVL96-.LVL93
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL96-.LVL93
	.uleb128 .LFE351-.LVL93
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST24:
	.byte	0x6
	.4byte	.LVL89
	.byte	0x4
	.uleb128 .LVL89-.LVL89
	.uleb128 .LVL90-.LVL89
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL90-.LVL89
	.uleb128 .LVL91-.LVL89
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL91-.LVL89
	.uleb128 .LVL92-.LVL89
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL92-.LVL89
	.uleb128 .LFE350-.LVL89
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST23:
	.byte	0x6
	.4byte	.LVL85
	.byte	0x4
	.uleb128 .LVL85-.LVL85
	.uleb128 .LVL86-.LVL85
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL86-.LVL85
	.uleb128 .LVL87-.LVL85
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL87-.LVL85
	.uleb128 .LVL88-.LVL85
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL88-.LVL85
	.uleb128 .LFE349-.LVL85
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL80
	.byte	0x4
	.uleb128 .LVL80-.LVL80
	.uleb128 .LVL81-.LVL80
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL81-.LVL80
	.uleb128 .LFE348-.LVL80
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST20:
	.byte	0x6
	.4byte	.LVL80
	.byte	0x4
	.uleb128 .LVL80-.LVL80
	.uleb128 .LVL83-.LVL80
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL83-.LVL80
	.uleb128 .LVL84-.LVL80
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL84-.LVL80
	.uleb128 .LFE348-.LVL80
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST21:
	.byte	0x6
	.4byte	.LVL80
	.byte	0x4
	.uleb128 .LVL80-.LVL80
	.uleb128 .LVL82-.LVL80
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL82-.LVL80
	.uleb128 .LVL84-.LVL80
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL84-.LVL80
	.uleb128 .LFE348-.LVL80
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST22:
	.byte	0x6
	.4byte	.LVL80
	.byte	0x4
	.uleb128 .LVL80-.LVL80
	.uleb128 .LVL84-.LVL80
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL84-.LVL80
	.uleb128 .LFE348-.LVL80
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST18:
	.byte	0x6
	.4byte	.LVL70
	.byte	0x4
	.uleb128 .LVL70-.LVL70
	.uleb128 .LVL72-.LVL70
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL72-.LVL70
	.uleb128 .LVL74-.LVL70
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL74-.LVL70
	.uleb128 .LVL75-.LVL70
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL75-.LVL70
	.uleb128 .LFE343-.LVL70
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST15:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL60-.LVL59
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL60-.LVL59
	.uleb128 .LVL61-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL61-.LVL59
	.uleb128 .LVL62-.LVL59
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL62-.LVL59
	.uleb128 .LFE342-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST12:
	.byte	0x6
	.4byte	.LVL48
	.byte	0x4
	.uleb128 .LVL48-.LVL48
	.uleb128 .LVL50-.LVL48
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL50-.LVL48
	.uleb128 .LVL51-.LVL48
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL51-.LVL48
	.uleb128 .LVL52-.LVL48
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL52-.LVL48
	.uleb128 .LVL57-.LVL48
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL57-.LVL48
	.uleb128 .LVL58-.LVL48
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL58-.LVL48
	.uleb128 .LFE341-.LVL48
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL49
	.byte	0x4
	.uleb128 .LVL49-.LVL49
	.uleb128 .LVL50-.LVL49
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL51-.LVL49
	.uleb128 .LVL53-.LVL49
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL53-.LVL49
	.uleb128 .LVL54-.LVL49
	.uleb128 0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL54-.LVL49
	.uleb128 .LVL55-.LVL49
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL57-.LVL49
	.uleb128 .LFE341-.LVL49
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL49
	.byte	0x4
	.uleb128 .LVL49-.LVL49
	.uleb128 .LVL50-.LVL49
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL50-.LVL49
	.uleb128 .LVL51-.LVL49
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL51-.LVL49
	.uleb128 .LVL56-.LVL49
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL56-.LVL49
	.uleb128 .LVL57-.LVL49
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL57-.LVL49
	.uleb128 .LFE341-.LVL49
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL37
	.byte	0x4
	.uleb128 .LVL37-.LVL37
	.uleb128 .LVL44-.LVL37
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL44-.LVL37
	.uleb128 .LVL46-.LVL37
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL46-.LVL37
	.uleb128 .LVL47-.LVL37
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL47-.LVL37
	.uleb128 .LFE340-.LVL37
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL39-.LVL38
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL39-.LVL38
	.uleb128 .LVL40-.LVL38
	.uleb128 0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL40-.LVL38
	.uleb128 .LVL41-.LVL38
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL47-.LVL38
	.uleb128 .LFE340-.LVL38
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL42-.LVL38
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL42-.LVL38
	.uleb128 .LVL43-.LVL38
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL38
	.uleb128 .LVL46-.LVL38
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL47-.LVL38
	.uleb128 .LFE340-.LVL38
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL26
	.byte	0x4
	.uleb128 .LVL26-.LVL26
	.uleb128 .LVL27-.LVL26
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL27-.LVL26
	.uleb128 .LFE339-.LVL26
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL26
	.byte	0x4
	.uleb128 .LVL26-.LVL26
	.uleb128 .LVL28-.LVL26
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL28-.LVL26
	.uleb128 .LVL36-.LVL26
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL26
	.uleb128 .LFE339-.LVL26
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL26
	.byte	0x4
	.uleb128 .LVL26-.LVL26
	.uleb128 .LVL29-1-.LVL26
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL29-1-.LVL26
	.uleb128 .LVL30-.LVL26
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL30-.LVL26
	.uleb128 .LVL33-1-.LVL26
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL33-1-.LVL26
	.uleb128 .LVL36-.LVL26
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL26
	.uleb128 .LFE339-.LVL26
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL26
	.byte	0x4
	.uleb128 .LVL26-.LVL26
	.uleb128 .LVL29-1-.LVL26
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL29-1-.LVL26
	.uleb128 .LVL36-.LVL26
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL26
	.uleb128 .LFE339-.LVL26
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL31
	.byte	0x4
	.uleb128 .LVL31-.LVL31
	.uleb128 .LVL32-.LVL31
	.uleb128 0x8
	.byte	0x73
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL32-.LVL31
	.uleb128 .LVL33-1-.LVL31
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL24
	.byte	0x4
	.uleb128 .LVL24-.LVL24
	.uleb128 .LVL25-1-.LVL24
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL25-1-.LVL24
	.uleb128 .LFE336-.LVL24
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL18-.LVL17
	.uleb128 .LVL19-.LVL17
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL19-.LVL17
	.uleb128 .LVL20-1-.LVL17
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL20-1-.LVL17
	.uleb128 .LVL21-.LVL17
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL21-.LVL17
	.uleb128 .LVL22-.LVL17
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL22-.LVL17
	.uleb128 .LFE335-.LVL17
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0xbc
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB354
	.4byte	.LFE354-.LFB354
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
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.4byte	.LFB355
	.4byte	.LFE355-.LFB355
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.4byte	.LFB352
	.4byte	.LFE352-.LFB352
	.4byte	.LFB353
	.4byte	.LFE353-.LFB353
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
.LLRL29:
	.byte	0x7
	.4byte	.LFB354
	.uleb128 .LFE354-.LFB354
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
	.4byte	.LFB344
	.uleb128 .LFE344-.LFB344
	.byte	0x7
	.4byte	.LFB355
	.uleb128 .LFE355-.LFB355
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
	.4byte	.LFB343
	.uleb128 .LFE343-.LFB343
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
	.byte	0x7
	.4byte	.LFB352
	.uleb128 .LFE352-.LFB352
	.byte	0x7
	.4byte	.LFB353
	.uleb128 .LFE353-.LFB353
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF16:
	.ascii	"ESUR\000"
.LASF148:
	.ascii	"count\000"
.LASF85:
	.ascii	"HAL_DMA_MemoryTypeDef\000"
.LASF91:
	.ascii	"HAL_DCMI_STATE_SUSPENDED\000"
.LASF158:
	.ascii	"HAL_DCMI_DeInit\000"
.LASF145:
	.ascii	"isr_value\000"
.LASF21:
	.ascii	"M0AR\000"
.LASF81:
	.ascii	"DMAmuxRequestGenStatusMask\000"
.LASF63:
	.ascii	"Init\000"
.LASF55:
	.ascii	"DMA_InitTypeDef\000"
.LASF99:
	.ascii	"LineStartUnmask\000"
.LASF102:
	.ascii	"DCMI_SyncUnmaskTypeDef\000"
.LASF1:
	.ascii	"signed char\000"
.LASF5:
	.ascii	"__uint8_t\000"
.LASF77:
	.ascii	"DMAmuxChannelStatus\000"
.LASF37:
	.ascii	"HAL_BUSY\000"
.LASF110:
	.ascii	"JPEGMode\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF143:
	.ascii	"HAL_DCMI_ErrorCallback\000"
.LASF153:
	.ascii	"pData\000"
.LASF116:
	.ascii	"XferCount\000"
.LASF8:
	.ascii	"long long int\000"
.LASF144:
	.ascii	"HAL_DCMI_IRQHandler\000"
.LASF159:
	.ascii	"HAL_DCMI_Init\000"
.LASF68:
	.ascii	"XferHalfCpltCallback\000"
.LASF126:
	.ascii	"HAL_DMA_Start_IT\000"
.LASF105:
	.ascii	"VSPolarity\000"
.LASF69:
	.ascii	"XferM1CpltCallback\000"
.LASF42:
	.ascii	"HAL_LockTypeDef\000"
.LASF25:
	.ascii	"DMAMUX_ChannelStatus_TypeDef\000"
.LASF4:
	.ascii	"long int\000"
.LASF155:
	.ascii	"SecondMemAddress\000"
.LASF45:
	.ascii	"PeriphInc\000"
.LASF131:
	.ascii	"HAL_DCMI_GetError\000"
.LASF53:
	.ascii	"MemBurst\000"
.LASF97:
	.ascii	"DCMI_CodesInitTypeDef\000"
.LASF59:
	.ascii	"HAL_DMA_STATE_ERROR\000"
.LASF34:
	.ascii	"double\000"
.LASF95:
	.ascii	"LineEndCode\000"
.LASF112:
	.ascii	"ByteSelectStart\000"
.LASF74:
	.ascii	"StreamBaseAddress\000"
.LASF66:
	.ascii	"Parent\000"
.LASF152:
	.ascii	"DCMI_Mode\000"
.LASF64:
	.ascii	"Lock\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF49:
	.ascii	"Mode\000"
.LASF44:
	.ascii	"Direction\000"
.LASF79:
	.ascii	"DMAmuxRequestGen\000"
.LASF111:
	.ascii	"ByteSelectMode\000"
.LASF38:
	.ascii	"HAL_TIMEOUT\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF13:
	.ascii	"RISR\000"
.LASF56:
	.ascii	"HAL_DMA_STATE_RESET\000"
.LASF163:
	.ascii	"SystemCoreClock\000"
.LASF19:
	.ascii	"DCMI_TypeDef\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF122:
	.ascii	"HAL_DMA_Abort_IT\000"
.LASF75:
	.ascii	"StreamIndex\000"
.LASF35:
	.ascii	"HAL_OK\000"
.LASF18:
	.ascii	"CWSIZER\000"
.LASF142:
	.ascii	"HAL_DCMI_LineEventCallback\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF83:
	.ascii	"MEMORY0\000"
.LASF84:
	.ascii	"MEMORY1\000"
.LASF160:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF60:
	.ascii	"HAL_DMA_STATE_ABORT\000"
.LASF73:
	.ascii	"ErrorCode\000"
.LASF48:
	.ascii	"MemDataAlignment\000"
.LASF29:
	.ascii	"RGCFR\000"
.LASF39:
	.ascii	"HAL_StatusTypeDef\000"
.LASF123:
	.ascii	"HAL_DMA_Abort\000"
.LASF0:
	.ascii	"short int\000"
.LASF114:
	.ascii	"LineSelectStart\000"
.LASF140:
	.ascii	"HAL_DCMI_FrameEventCallback\000"
.LASF147:
	.ascii	"HAL_DCMI_Suspend\000"
.LASF89:
	.ascii	"HAL_DCMI_STATE_TIMEOUT\000"
.LASF57:
	.ascii	"HAL_DMA_STATE_READY\000"
.LASF129:
	.ascii	"hdma\000"
.LASF106:
	.ascii	"HSPolarity\000"
.LASF132:
	.ascii	"HAL_DCMI_GetState\000"
.LASF135:
	.ascii	"HAL_DCMI_EnableCrop\000"
.LASF156:
	.ascii	"HAL_DCMI_MspDeInit\000"
.LASF124:
	.ascii	"HAL_DMAEx_ChangeMemory\000"
.LASF139:
	.ascii	"YSize\000"
.LASF161:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_dcmi.c\000"
.LASF41:
	.ascii	"HAL_LOCKED\000"
.LASF146:
	.ascii	"HAL_DCMI_Resume\000"
.LASF82:
	.ascii	"DMA_HandleTypeDef\000"
.LASF71:
	.ascii	"XferErrorCallback\000"
.LASF93:
	.ascii	"FrameStartCode\000"
.LASF117:
	.ascii	"XferSize\000"
.LASF103:
	.ascii	"SynchroMode\000"
.LASF118:
	.ascii	"XferTransferNumber\000"
.LASF27:
	.ascii	"DMAMUX_RequestGen_TypeDef\000"
.LASF17:
	.ascii	"CWSTRTR\000"
.LASF26:
	.ascii	"RGCR\000"
.LASF108:
	.ascii	"ExtendedDataMode\000"
.LASF33:
	.ascii	"float\000"
.LASF125:
	.ascii	"HAL_DMAEx_MultiBufferStart_IT\000"
.LASF127:
	.ascii	"DCMI_DMAError\000"
.LASF62:
	.ascii	"Instance\000"
.LASF14:
	.ascii	"MISR\000"
.LASF70:
	.ascii	"XferM1HalfCpltCallback\000"
.LASF109:
	.ascii	"SyncroCode\000"
.LASF20:
	.ascii	"NDTR\000"
.LASF121:
	.ascii	"DCMI_HandleTypeDef\000"
.LASF134:
	.ascii	"SyncUnmask\000"
.LASF119:
	.ascii	"pBuffPtr\000"
.LASF107:
	.ascii	"CaptureRate\000"
.LASF136:
	.ascii	"HAL_DCMI_DisableCrop\000"
.LASF61:
	.ascii	"HAL_DMA_StateTypeDef\000"
.LASF80:
	.ascii	"DMAmuxRequestGenStatus\000"
.LASF58:
	.ascii	"HAL_DMA_STATE_BUSY\000"
.LASF46:
	.ascii	"MemInc\000"
.LASF101:
	.ascii	"FrameEndUnmask\000"
.LASF128:
	.ascii	"DCMI_DMAXferCplt\000"
.LASF90:
	.ascii	"HAL_DCMI_STATE_ERROR\000"
.LASF96:
	.ascii	"FrameEndCode\000"
.LASF98:
	.ascii	"FrameStartUnmask\000"
.LASF151:
	.ascii	"HAL_DCMI_Start_DMA\000"
.LASF164:
	.ascii	"__DMA_HandleTypeDef\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF51:
	.ascii	"FIFOMode\000"
.LASF36:
	.ascii	"HAL_ERROR\000"
.LASF150:
	.ascii	"HAL_DCMI_Stop\000"
.LASF133:
	.ascii	"HAL_DCMI_ConfigSyncUnmask\000"
.LASF31:
	.ascii	"long double\000"
.LASF52:
	.ascii	"FIFOThreshold\000"
.LASF32:
	.ascii	"char\000"
.LASF43:
	.ascii	"Request\000"
.LASF104:
	.ascii	"PCKPolarity\000"
.LASF130:
	.ascii	"hdcmi\000"
.LASF65:
	.ascii	"State\000"
.LASF92:
	.ascii	"HAL_DCMI_StateTypeDef\000"
.LASF76:
	.ascii	"DMAmuxChannel\000"
.LASF100:
	.ascii	"LineEndUnmask\000"
.LASF86:
	.ascii	"HAL_DCMI_STATE_RESET\000"
.LASF113:
	.ascii	"LineSelectMode\000"
.LASF120:
	.ascii	"DMA_Handle\000"
.LASF88:
	.ascii	"HAL_DCMI_STATE_BUSY\000"
.LASF23:
	.ascii	"DMA_Stream_TypeDef\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF154:
	.ascii	"Length\000"
.LASF141:
	.ascii	"HAL_DCMI_VsyncEventCallback\000"
.LASF28:
	.ascii	"RGSR\000"
.LASF15:
	.ascii	"ESCR\000"
.LASF22:
	.ascii	"M1AR\000"
.LASF47:
	.ascii	"PeriphDataAlignment\000"
.LASF115:
	.ascii	"DCMI_InitTypeDef\000"
.LASF78:
	.ascii	"DMAmuxChannelStatusMask\000"
.LASF24:
	.ascii	"DMAMUX_Channel_TypeDef\000"
.LASF149:
	.ascii	"status\000"
.LASF138:
	.ascii	"XSize\000"
.LASF50:
	.ascii	"Priority\000"
.LASF11:
	.ascii	"uint8_t\000"
.LASF162:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF87:
	.ascii	"HAL_DCMI_STATE_READY\000"
.LASF40:
	.ascii	"HAL_UNLOCKED\000"
.LASF94:
	.ascii	"LineStartCode\000"
.LASF137:
	.ascii	"HAL_DCMI_ConfigCrop\000"
.LASF157:
	.ascii	"HAL_DCMI_MspInit\000"
.LASF72:
	.ascii	"XferAbortCallback\000"
.LASF30:
	.ascii	"DMAMUX_RequestGenStatus_TypeDef\000"
.LASF67:
	.ascii	"XferCpltCallback\000"
.LASF54:
	.ascii	"PeriphBurst\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
