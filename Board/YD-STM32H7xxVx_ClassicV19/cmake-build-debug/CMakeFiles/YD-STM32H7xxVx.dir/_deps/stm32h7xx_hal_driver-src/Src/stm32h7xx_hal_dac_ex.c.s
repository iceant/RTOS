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
	.file	"stm32h7xx_hal_dac_ex.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_dac_ex.c"
	.section	.text.HAL_DACEx_DualStart,"ax",%progbits
	.align	1
	.global	HAL_DACEx_DualStart
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_DualStart, %function
HAL_DACEx_DualStart:
.LFB335:
	.loc 1 128 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 129 3
	.loc 1 132 3
	.loc 1 132 6 is_stmt 0
	mov	r3, r0
	cbz	r0, .L5
	.loc 1 139 3 is_stmt 1
	.loc 1 139 7
	.loc 1 139 16 is_stmt 0
	ldrb	r2, [r0, #5]	@ zero_extendqisi2
	.loc 1 139 9
	cmp	r2, #1
	beq	.L6
	.loc 1 139 66 is_stmt 1 discriminator 2
	.loc 1 139 79 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #5]
	.loc 1 139 5 is_stmt 1 discriminator 2
	.loc 1 142 3 discriminator 2
	.loc 1 142 15 is_stmt 0 discriminator 2
	movs	r2, #2
	strb	r2, [r0, #4]
	.loc 1 145 3 is_stmt 1 discriminator 2
	.loc 1 145 10 is_stmt 0 discriminator 2
	ldr	r1, [r0]
	.loc 1 145 20 discriminator 2
	ldr	r2, [r1]
	.loc 1 145 25 discriminator 2
	orr	r2, r2, #1
	str	r2, [r1]
	.loc 1 146 3 is_stmt 1 discriminator 2
	.loc 1 146 10 is_stmt 0 discriminator 2
	ldr	r1, [r0]
	.loc 1 146 20 discriminator 2
	ldr	r2, [r1]
	.loc 1 146 25 discriminator 2
	orr	r2, r2, #65536
	str	r2, [r1]
	.loc 1 149 3 is_stmt 1 discriminator 2
	.loc 1 149 12 is_stmt 0 discriminator 2
	ldr	r2, [r0]
	.loc 1 149 22 discriminator 2
	ldr	r1, [r2]
	.loc 1 149 27 discriminator 2
	and	r1, r1, #62
	.loc 1 149 6 discriminator 2
	cmp	r1, #2
	beq	.L7
	.loc 1 129 12
	movs	r0, #0
.LVL1:
.L3:
	.loc 1 153 3 is_stmt 1
	.loc 1 153 22 is_stmt 0
	ldr	r1, [r2]
	.loc 1 153 27
	and	r1, r1, #4063232
	.loc 1 153 6
	cmp	r1, #131072
	beq	.L8
.L4:
	.loc 1 158 3 is_stmt 1
	.loc 1 158 19 is_stmt 0
	ldr	r1, [r2, #4]
	.loc 1 158 30
	orrs	r1, r1, r0
	str	r1, [r2, #4]
	.loc 1 161 3 is_stmt 1
	.loc 1 161 15 is_stmt 0
	movs	r2, #1
	strb	r2, [r3, #4]
	.loc 1 164 3 is_stmt 1
	.loc 1 164 7
	.loc 1 164 20 is_stmt 0
	movs	r0, #0
.LVL2:
	strb	r0, [r3, #5]
	.loc 1 164 5 is_stmt 1
	.loc 1 167 3
	.loc 1 167 10 is_stmt 0
	bx	lr
.LVL3:
.L7:
	.loc 1 151 16
	movs	r0, #1
.LVL4:
	b	.L3
.LVL5:
.L8:
	.loc 1 155 5 is_stmt 1
	.loc 1 155 16 is_stmt 0
	orr	r0, r0, #2
.LVL6:
	b	.L4
.LVL7:
.L5:
	.loc 1 134 12
	movs	r0, #1
.LVL8:
	bx	lr
.LVL9:
.L6:
	.loc 1 139 47
	movs	r0, #2
.LVL10:
	.loc 1 168 1
	bx	lr
	.cfi_endproc
.LFE335:
	.size	HAL_DACEx_DualStart, .-HAL_DACEx_DualStart
	.section	.text.HAL_DACEx_DualStop,"ax",%progbits
	.align	1
	.global	HAL_DACEx_DualStop
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_DualStop, %function
HAL_DACEx_DualStop:
.LFB336:
	.loc 1 177 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL11:
	.loc 1 179 3
	.loc 1 179 6 is_stmt 0
	cbz	r0, .L11
	.loc 1 186 3 is_stmt 1
	.loc 1 186 10 is_stmt 0
	ldr	r1, [r0]
	.loc 1 186 20
	ldr	r2, [r1]
	.loc 1 186 25
	bic	r2, r2, #1
	str	r2, [r1]
	.loc 1 187 3 is_stmt 1
	.loc 1 187 10 is_stmt 0
	ldr	r1, [r0]
	.loc 1 187 20
	ldr	r2, [r1]
	.loc 1 187 25
	bic	r2, r2, #65536
	str	r2, [r1]
	.loc 1 190 3 is_stmt 1
	.loc 1 190 15 is_stmt 0
	movs	r2, #1
	strb	r2, [r0, #4]
	.loc 1 193 3 is_stmt 1
	.loc 1 193 10 is_stmt 0
	movs	r0, #0
.LVL12:
	bx	lr
.LVL13:
.L11:
	.loc 1 181 12
	movs	r0, #1
.LVL14:
	.loc 1 194 1
	bx	lr
	.cfi_endproc
.LFE336:
	.size	HAL_DACEx_DualStop, .-HAL_DACEx_DualStop
	.section	.text.HAL_DACEx_DualStart_DMA,"ax",%progbits
	.align	1
	.global	HAL_DACEx_DualStart_DMA
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_DualStart_DMA, %function
HAL_DACEx_DualStart_DMA:
.LFB337:
	.loc 1 215 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL15:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	ldr	r6, [sp, #16]
	.loc 1 216 3
	.loc 1 217 3
.LVL16:
	.loc 1 220 3
	.loc 1 220 6 is_stmt 0
	cmp	r0, #0
	beq	.L22
	mov	r5, r1
	mov	r1, r2
.LVL17:
	mov	r4, r0
	.loc 1 226 3 is_stmt 1
	.loc 1 227 3
	.loc 1 230 3
	.loc 1 230 7
	.loc 1 230 16 is_stmt 0
	ldrb	r2, [r0, #5]	@ zero_extendqisi2
.LVL18:
	.loc 1 230 9
	cmp	r2, #1
	beq	.L23
	.loc 1 230 66 is_stmt 1 discriminator 2
	.loc 1 230 79 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #5]
	.loc 1 230 5 is_stmt 1 discriminator 2
	.loc 1 233 3 discriminator 2
	.loc 1 233 15 is_stmt 0 discriminator 2
	movs	r2, #2
	strb	r2, [r0, #4]
	.loc 1 235 3 is_stmt 1 discriminator 2
	.loc 1 235 6 is_stmt 0 discriminator 2
	cmp	r5, #0
	bne	.L14
	.loc 1 238 5 is_stmt 1
	.loc 1 238 9 is_stmt 0
	ldr	r2, [r0, #8]
	.loc 1 238 41
	ldr	r0, .L27
.LVL19:
	str	r0, [r2, #60]
	.loc 1 241 5 is_stmt 1
	.loc 1 241 9 is_stmt 0
	ldr	r2, [r4, #8]
	.loc 1 241 45
	ldr	r0, .L27+4
	str	r0, [r2, #64]
	.loc 1 244 5 is_stmt 1
	.loc 1 244 9 is_stmt 0
	ldr	r2, [r4, #8]
	.loc 1 244 42
	ldr	r0, .L27+8
	str	r0, [r2, #76]
	.loc 1 247 5 is_stmt 1
	.loc 1 247 11 is_stmt 0
	ldr	r0, [r4]
	.loc 1 247 21
	ldr	r2, [r0]
	.loc 1 247 27
	orr	r2, r2, #4096
	str	r2, [r0]
.L15:
	.loc 1 264 3 is_stmt 1
	cmp	r6, #4
	beq	.L16
	cmp	r6, #8
	beq	.L17
	cmp	r6, #0
	beq	.L26
	movs	r2, #0
.LVL20:
.L18:
	.loc 1 283 3
	.loc 1 283 6 is_stmt 0
	cmp	r5, #0
	bne	.L19
	.loc 1 286 5 is_stmt 1
	.loc 1 286 13 is_stmt 0
	ldr	r5, [r4]
.LVL21:
	.loc 1 286 23
	ldr	r0, [r5]
	.loc 1 286 29
	orr	r0, r0, #8192
	str	r0, [r5]
	.loc 1 289 5 is_stmt 1
	.loc 1 289 14 is_stmt 0
	ldr	r0, [r4, #8]
	bl	HAL_DMA_Start_IT
.LVL22:
.L20:
	.loc 1 301 3 is_stmt 1
	.loc 1 301 7
	.loc 1 301 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #5]
	.loc 1 301 5 is_stmt 1
	.loc 1 303 3
	.loc 1 303 6 is_stmt 0
	cmp	r0, #0
	bne	.L21
	.loc 1 306 5 is_stmt 1
	.loc 1 306 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 306 22
	ldr	r3, [r2]
	.loc 1 306 27
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 307 5 is_stmt 1
	.loc 1 307 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 307 22
	ldr	r3, [r2]
	.loc 1 307 27
	orr	r3, r3, #65536
	str	r3, [r2]
.LVL23:
.L13:
	.loc 1 316 1
	pop	{r4, r5, r6, pc}
.LVL24:
.L14:
	.loc 1 252 5 is_stmt 1
	.loc 1 252 9 is_stmt 0
	ldr	r2, [r0, #12]
	.loc 1 252 41
	ldr	r0, .L27+12
.LVL25:
	str	r0, [r2, #60]
	.loc 1 255 5 is_stmt 1
	.loc 1 255 9 is_stmt 0
	ldr	r2, [r4, #12]
	.loc 1 255 45
	ldr	r0, .L27+16
	str	r0, [r2, #64]
	.loc 1 258 5 is_stmt 1
	.loc 1 258 9 is_stmt 0
	ldr	r2, [r4, #12]
	.loc 1 258 42
	ldr	r0, .L27+20
	str	r0, [r2, #76]
	.loc 1 261 5 is_stmt 1
	.loc 1 261 11 is_stmt 0
	ldr	r0, [r4]
	.loc 1 261 21
	ldr	r2, [r0]
	.loc 1 261 27
	orr	r2, r2, #268435456
	str	r2, [r0]
	b	.L15
.L26:
	.loc 1 268 7 is_stmt 1
	.loc 1 268 31 is_stmt 0
	ldr	r0, [r4]
	.loc 1 268 26
	add	r2, r0, #32
.LVL26:
	.loc 1 269 7 is_stmt 1
	b	.L18
.LVL27:
.L16:
	.loc 1 272 7
	.loc 1 272 31 is_stmt 0
	ldr	r0, [r4]
	.loc 1 272 26
	add	r2, r0, #36
.LVL28:
	.loc 1 273 7 is_stmt 1
	b	.L18
.LVL29:
.L17:
	.loc 1 276 7
	.loc 1 276 31 is_stmt 0
	ldr	r0, [r4]
	.loc 1 276 26
	add	r2, r0, #40
.LVL30:
	.loc 1 277 7 is_stmt 1
	b	.L18
.L19:
	.loc 1 294 5
	.loc 1 294 13 is_stmt 0
	ldr	r5, [r4]
.LVL31:
	.loc 1 294 23
	ldr	r0, [r5]
	.loc 1 294 29
	orr	r0, r0, #536870912
	str	r0, [r5]
	.loc 1 297 5 is_stmt 1
	.loc 1 297 14 is_stmt 0
	ldr	r0, [r4, #12]
	bl	HAL_DMA_Start_IT
.LVL32:
	b	.L20
.L21:
	.loc 1 311 5 is_stmt 1
	.loc 1 311 9 is_stmt 0
	ldr	r3, [r4, #16]
	.loc 1 311 21
	orr	r3, r3, #4
	str	r3, [r4, #16]
	b	.L13
.LVL33:
.L22:
	.loc 1 222 12
	movs	r0, #1
.LVL34:
	b	.L13
.LVL35:
.L23:
	.loc 1 230 47
	movs	r0, #2
.LVL36:
	b	.L13
.L28:
	.align	2
.L27:
	.word	DAC_DMAConvCpltCh1
	.word	DAC_DMAHalfConvCpltCh1
	.word	DAC_DMAErrorCh1
	.word	DAC_DMAConvCpltCh2
	.word	DAC_DMAHalfConvCpltCh2
	.word	DAC_DMAErrorCh2
	.cfi_endproc
.LFE337:
	.size	HAL_DACEx_DualStart_DMA, .-HAL_DACEx_DualStart_DMA
	.section	.text.HAL_DACEx_DualStop_DMA,"ax",%progbits
	.align	1
	.global	HAL_DACEx_DualStop_DMA
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_DualStop_DMA, %function
HAL_DACEx_DualStop_DMA:
.LFB338:
	.loc 1 329 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL37:
	.loc 1 330 3
	.loc 1 333 3
	.loc 1 333 6 is_stmt 0
	cbz	r0, .L34
	.loc 1 329 1
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 340 3 is_stmt 1
	.loc 1 340 9 is_stmt 0
	ldr	r2, [r0]
	.loc 1 340 19
	ldr	r3, [r2]
	.loc 1 340 25
	bic	r3, r3, #268439552
	str	r3, [r2]
	.loc 1 343 3 is_stmt 1
	.loc 1 343 10 is_stmt 0
	ldr	r2, [r0]
	.loc 1 343 20
	ldr	r3, [r2]
	.loc 1 343 25
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 344 3 is_stmt 1
	.loc 1 344 10 is_stmt 0
	ldr	r2, [r0]
	.loc 1 344 20
	ldr	r3, [r2]
	.loc 1 344 25
	bic	r3, r3, #65536
	str	r3, [r2]
	.loc 1 349 3 is_stmt 1
	.loc 1 349 6 is_stmt 0
	cbnz	r1, .L31
	.loc 1 352 5 is_stmt 1
	.loc 1 352 14 is_stmt 0
	ldr	r0, [r0, #8]
.LVL38:
	bl	HAL_DMA_Abort
.LVL39:
	.loc 1 355 5 is_stmt 1
	.loc 1 355 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 355 23
	ldr	r3, [r2]
	.loc 1 355 29
	bic	r3, r3, #8192
	str	r3, [r2]
.L32:
	.loc 1 367 3 is_stmt 1
	.loc 1 367 6 is_stmt 0
	cbz	r0, .L33
	.loc 1 370 5 is_stmt 1
	.loc 1 370 17 is_stmt 0
	movs	r3, #4
	strb	r3, [r4, #4]
.L30:
	.loc 1 380 1
	pop	{r4, pc}
.LVL40:
.L31:
	.loc 1 360 5 is_stmt 1
	.loc 1 360 14 is_stmt 0
	ldr	r0, [r0, #12]
.LVL41:
	bl	HAL_DMA_Abort
.LVL42:
	.loc 1 363 5 is_stmt 1
	.loc 1 363 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 363 23
	ldr	r3, [r2]
	.loc 1 363 29
	bic	r3, r3, #536870912
	str	r3, [r2]
	b	.L32
.L33:
	.loc 1 375 5 is_stmt 1
	.loc 1 375 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #4]
	b	.L30
.LVL43:
.L34:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 335 12
	movs	r0, #1
.LVL44:
	.loc 1 380 1
	bx	lr
	.cfi_endproc
.LFE338:
	.size	HAL_DACEx_DualStop_DMA, .-HAL_DACEx_DualStop_DMA
	.section	.text.HAL_DACEx_TriangleWaveGenerate,"ax",%progbits
	.align	1
	.global	HAL_DACEx_TriangleWaveGenerate
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_TriangleWaveGenerate, %function
HAL_DACEx_TriangleWaveGenerate:
.LFB339:
	.loc 1 408 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL45:
	.loc 1 410 3
	.loc 1 410 6 is_stmt 0
	cbz	r0, .L41
	mov	r3, r0
	.loc 1 416 3 is_stmt 1
	.loc 1 417 3
	.loc 1 420 3
	.loc 1 420 7
	.loc 1 420 16 is_stmt 0
	ldrb	r0, [r0, #5]	@ zero_extendqisi2
.LVL46:
	.loc 1 420 9
	cmp	r0, #1
	beq	.L42
	.loc 1 408 1 discriminator 2
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 420 66 is_stmt 1 discriminator 2
	.loc 1 420 79 is_stmt 0 discriminator 2
	mov	lr, #1
	strb	lr, [r3, #5]
	.loc 1 420 5 is_stmt 1 discriminator 2
	.loc 1 423 3 discriminator 2
	.loc 1 423 15 is_stmt 0 discriminator 2
	movs	r0, #2
	strb	r0, [r3, #4]
	.loc 1 426 3 is_stmt 1 discriminator 2
	.loc 1 426 39 is_stmt 0 discriminator 2
	ldr	r4, [r3]
	.loc 1 426 49 discriminator 2
	ldr	r0, [r4]
	.loc 1 426 114 discriminator 2
	and	r1, r1, #16
.LVL47:
	.loc 1 426 102 discriminator 2
	mov	ip, #4032
	lsl	ip, ip, r1
	.loc 1 426 57 discriminator 2
	bic	r0, r0, ip
	.loc 1 426 147 discriminator 2
	orr	r2, r2, #128
.LVL48:
	.loc 1 426 160 discriminator 2
	lsls	r2, r2, r1
	.loc 1 426 127 discriminator 2
	orrs	r2, r2, r0
	.loc 1 426 27 discriminator 2
	str	r2, [r4]
	.loc 1 430 3 is_stmt 1 discriminator 2
	.loc 1 430 15 is_stmt 0 discriminator 2
	strb	lr, [r3, #4]
	.loc 1 433 3 is_stmt 1 discriminator 2
	.loc 1 433 7 discriminator 2
	.loc 1 433 20 is_stmt 0 discriminator 2
	movs	r0, #0
	strb	r0, [r3, #5]
	.loc 1 433 5 is_stmt 1 discriminator 2
	.loc 1 436 3 discriminator 2
	.loc 1 437 1 is_stmt 0 discriminator 2
	pop	{r4, pc}
.LVL49:
.L41:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 412 12
	movs	r0, #1
.LVL50:
	bx	lr
.LVL51:
.L42:
	.loc 1 420 47
	movs	r0, #2
	.loc 1 437 1
	bx	lr
	.cfi_endproc
.LFE339:
	.size	HAL_DACEx_TriangleWaveGenerate, .-HAL_DACEx_TriangleWaveGenerate
	.section	.text.HAL_DACEx_NoiseWaveGenerate,"ax",%progbits
	.align	1
	.global	HAL_DACEx_NoiseWaveGenerate
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_NoiseWaveGenerate, %function
HAL_DACEx_NoiseWaveGenerate:
.LFB340:
	.loc 1 464 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL52:
	.loc 1 466 3
	.loc 1 466 6 is_stmt 0
	cbz	r0, .L49
	mov	r3, r0
	.loc 1 472 3 is_stmt 1
	.loc 1 473 3
	.loc 1 476 3
	.loc 1 476 7
	.loc 1 476 16 is_stmt 0
	ldrb	r0, [r0, #5]	@ zero_extendqisi2
.LVL53:
	.loc 1 476 9
	cmp	r0, #1
	beq	.L50
	.loc 1 464 1 discriminator 2
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 476 66 is_stmt 1 discriminator 2
	.loc 1 476 79 is_stmt 0 discriminator 2
	mov	lr, #1
	strb	lr, [r3, #5]
	.loc 1 476 5 is_stmt 1 discriminator 2
	.loc 1 479 3 discriminator 2
	.loc 1 479 15 is_stmt 0 discriminator 2
	movs	r0, #2
	strb	r0, [r3, #4]
	.loc 1 482 3 is_stmt 1 discriminator 2
	.loc 1 482 39 is_stmt 0 discriminator 2
	ldr	r4, [r3]
	.loc 1 482 49 discriminator 2
	ldr	r0, [r4]
	.loc 1 482 114 discriminator 2
	and	r1, r1, #16
.LVL54:
	.loc 1 482 102 discriminator 2
	mov	ip, #4032
	lsl	ip, ip, r1
	.loc 1 482 57 discriminator 2
	bic	r0, r0, ip
	.loc 1 482 147 discriminator 2
	orr	r2, r2, #64
.LVL55:
	.loc 1 482 160 discriminator 2
	lsls	r2, r2, r1
	.loc 1 482 127 discriminator 2
	orrs	r2, r2, r0
	.loc 1 482 27 discriminator 2
	str	r2, [r4]
	.loc 1 486 3 is_stmt 1 discriminator 2
	.loc 1 486 15 is_stmt 0 discriminator 2
	strb	lr, [r3, #4]
	.loc 1 489 3 is_stmt 1 discriminator 2
	.loc 1 489 7 discriminator 2
	.loc 1 489 20 is_stmt 0 discriminator 2
	movs	r0, #0
	strb	r0, [r3, #5]
	.loc 1 489 5 is_stmt 1 discriminator 2
	.loc 1 492 3 discriminator 2
	.loc 1 493 1 is_stmt 0 discriminator 2
	pop	{r4, pc}
.LVL56:
.L49:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 468 12
	movs	r0, #1
.LVL57:
	bx	lr
.LVL58:
.L50:
	.loc 1 476 47
	movs	r0, #2
	.loc 1 493 1
	bx	lr
	.cfi_endproc
.LFE340:
	.size	HAL_DACEx_NoiseWaveGenerate, .-HAL_DACEx_NoiseWaveGenerate
	.section	.text.HAL_DACEx_DualSetValue,"ax",%progbits
	.align	1
	.global	HAL_DACEx_DualSetValue
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_DualSetValue, %function
HAL_DACEx_DualSetValue:
.LFB341:
	.loc 1 512 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL59:
	.loc 1 513 3
	.loc 1 514 3
	.loc 1 517 3
	.loc 1 517 6 is_stmt 0
	mov	ip, r0
	cbz	r0, .L59
	.loc 1 523 3 is_stmt 1
	.loc 1 524 3
	.loc 1 525 3
	.loc 1 528 3
	.loc 1 528 6 is_stmt 0
	cmp	r1, #8
	beq	.L60
	.loc 1 534 5 is_stmt 1
	.loc 1 534 10 is_stmt 0
	orr	r2, r2, r3, lsl #16
.LVL60:
.L58:
	.loc 1 537 3 is_stmt 1
	.loc 1 537 23 is_stmt 0
	ldr	r3, [ip]
.LVL61:
	.loc 1 538 3 is_stmt 1
	.loc 1 538 7 is_stmt 0
	add	r1, r1, r3
.LVL62:
	.loc 1 541 3 is_stmt 1
	.loc 1 541 29 is_stmt 0
	str	r2, [r1, #32]
	.loc 1 544 3 is_stmt 1
	.loc 1 544 10 is_stmt 0
	movs	r0, #0
.LVL63:
	bx	lr
.LVL64:
.L60:
	.loc 1 530 5 is_stmt 1
	.loc 1 530 10 is_stmt 0
	orr	r2, r2, r3, lsl #8
.LVL65:
	b	.L58
.LVL66:
.L59:
	.loc 1 519 12
	movs	r0, #1
.LVL67:
	.loc 1 545 1
	bx	lr
	.cfi_endproc
.LFE341:
	.size	HAL_DACEx_DualSetValue, .-HAL_DACEx_DualSetValue
	.section	.text.HAL_DACEx_ConvCpltCallbackCh2,"ax",%progbits
	.align	1
	.weak	HAL_DACEx_ConvCpltCallbackCh2
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_ConvCpltCallbackCh2, %function
HAL_DACEx_ConvCpltCallbackCh2:
.LFB342:
	.loc 1 554 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL68:
	.loc 1 556 3
	.loc 1 561 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE342:
	.size	HAL_DACEx_ConvCpltCallbackCh2, .-HAL_DACEx_ConvCpltCallbackCh2
	.section	.text.DAC_DMAConvCpltCh2,"ax",%progbits
	.align	1
	.global	DAC_DMAConvCpltCh2
	.syntax unified
	.thumb
	.thumb_func
	.type	DAC_DMAConvCpltCh2, %function
DAC_DMAConvCpltCh2:
.LFB350:
	.loc 1 861 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL69:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 862 3
	.loc 1 862 22 is_stmt 0
	ldr	r4, [r0, #56]
.LVL70:
	.loc 1 867 3 is_stmt 1
	mov	r0, r4
.LVL71:
	bl	HAL_DACEx_ConvCpltCallbackCh2
.LVL72:
	.loc 1 870 3
	.loc 1 870 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #4]
	.loc 1 871 1
	pop	{r4, pc}
	.cfi_endproc
.LFE350:
	.size	DAC_DMAConvCpltCh2, .-DAC_DMAConvCpltCh2
	.section	.text.HAL_DACEx_ConvHalfCpltCallbackCh2,"ax",%progbits
	.align	1
	.weak	HAL_DACEx_ConvHalfCpltCallbackCh2
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_ConvHalfCpltCallbackCh2, %function
HAL_DACEx_ConvHalfCpltCallbackCh2:
.LFB343:
	.loc 1 570 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL73:
	.loc 1 572 3
	.loc 1 577 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE343:
	.size	HAL_DACEx_ConvHalfCpltCallbackCh2, .-HAL_DACEx_ConvHalfCpltCallbackCh2
	.section	.text.DAC_DMAHalfConvCpltCh2,"ax",%progbits
	.align	1
	.global	DAC_DMAHalfConvCpltCh2
	.syntax unified
	.thumb
	.thumb_func
	.type	DAC_DMAHalfConvCpltCh2, %function
DAC_DMAHalfConvCpltCh2:
.LFB351:
	.loc 1 880 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL74:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 881 3
.LVL75:
	.loc 1 886 3
	ldr	r0, [r0, #56]
.LVL76:
	bl	HAL_DACEx_ConvHalfCpltCallbackCh2
.LVL77:
	.loc 1 888 1 is_stmt 0
	pop	{r3, pc}
	.cfi_endproc
.LFE351:
	.size	DAC_DMAHalfConvCpltCh2, .-DAC_DMAHalfConvCpltCh2
	.section	.text.HAL_DACEx_ErrorCallbackCh2,"ax",%progbits
	.align	1
	.weak	HAL_DACEx_ErrorCallbackCh2
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_ErrorCallbackCh2, %function
HAL_DACEx_ErrorCallbackCh2:
.LFB344:
	.loc 1 586 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL78:
	.loc 1 588 3
	.loc 1 593 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE344:
	.size	HAL_DACEx_ErrorCallbackCh2, .-HAL_DACEx_ErrorCallbackCh2
	.section	.text.DAC_DMAErrorCh2,"ax",%progbits
	.align	1
	.global	DAC_DMAErrorCh2
	.syntax unified
	.thumb
	.thumb_func
	.type	DAC_DMAErrorCh2, %function
DAC_DMAErrorCh2:
.LFB352:
	.loc 1 897 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL79:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 898 3
	.loc 1 898 22 is_stmt 0
	ldr	r4, [r0, #56]
.LVL80:
	.loc 1 901 3 is_stmt 1
	.loc 1 901 7 is_stmt 0
	ldr	r3, [r4, #16]
	.loc 1 901 19
	orr	r3, r3, #4
	str	r3, [r4, #16]
	.loc 1 906 3 is_stmt 1
	mov	r0, r4
.LVL81:
	bl	HAL_DACEx_ErrorCallbackCh2
.LVL82:
	.loc 1 909 3
	.loc 1 909 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #4]
	.loc 1 910 1
	pop	{r4, pc}
	.cfi_endproc
.LFE352:
	.size	DAC_DMAErrorCh2, .-DAC_DMAErrorCh2
	.section	.text.HAL_DACEx_DMAUnderrunCallbackCh2,"ax",%progbits
	.align	1
	.weak	HAL_DACEx_DMAUnderrunCallbackCh2
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_DMAUnderrunCallbackCh2, %function
HAL_DACEx_DMAUnderrunCallbackCh2:
.LFB345:
	.loc 1 602 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL83:
	.loc 1 604 3
	.loc 1 609 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE345:
	.size	HAL_DACEx_DMAUnderrunCallbackCh2, .-HAL_DACEx_DMAUnderrunCallbackCh2
	.section	.text.HAL_DACEx_SelfCalibrate,"ax",%progbits
	.align	1
	.global	HAL_DACEx_SelfCalibrate
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_SelfCalibrate, %function
HAL_DACEx_SelfCalibrate:
.LFB346:
	.loc 1 626 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL84:
	.loc 1 627 3
	.loc 1 629 3
	.loc 1 630 3
	.loc 1 631 3
	.loc 1 634 3
	.loc 1 637 3
	.loc 1 641 3
	.loc 1 641 6 is_stmt 0
	cmp	r1, #0
	it	ne
	cmpne	r0, #0
	beq	.L82
	.loc 1 626 1
	push	{r4, r5, r6, r7, r8, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 32
	mov	ip, r0
	mov	r5, r1
	.loc 1 645 8 is_stmt 1
	.loc 1 645 16 is_stmt 0
	ldrb	r3, [r0, #4]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 645 11
	cmp	r3, #2
	beq	.L83
	.loc 1 652 5 is_stmt 1
	.loc 1 652 9
	.loc 1 652 18 is_stmt 0
	ldrb	r3, [r0, #5]	@ zero_extendqisi2
	.loc 1 652 11
	cmp	r3, #1
	beq	.L84
	.loc 1 652 68 is_stmt 1 discriminator 2
	.loc 1 652 81 is_stmt 0 discriminator 2
	movs	r1, #1
.LVL85:
	strb	r1, [r0, #5]
	.loc 1 652 7 is_stmt 1 discriminator 2
	.loc 1 655 5 discriminator 2
	.loc 1 655 33 is_stmt 0 discriminator 2
	ldr	r0, [r0]
.LVL86:
	.loc 1 655 43 discriminator 2
	ldr	r6, [r0, #60]
	.loc 1 655 80 discriminator 2
	and	r2, r2, #16
.LVL87:
	.loc 1 655 68 discriminator 2
	movs	r3, #7
	lsls	r3, r3, r2
	.loc 1 655 26 discriminator 2
	ands	r6, r6, r3
.LVL88:
	.loc 1 658 5 is_stmt 1 discriminator 2
	.loc 1 658 22 is_stmt 0 discriminator 2
	ldr	r4, [r0]
	.loc 1 658 51 discriminator 2
	lsls	r1, r1, r2
	.loc 1 658 29 discriminator 2
	bic	r1, r4, r1
	str	r1, [r0]
	.loc 1 661 5 is_stmt 1 discriminator 2
	.loc 1 661 42 is_stmt 0 discriminator 2
	ldr	r0, [ip]
	.loc 1 661 52 discriminator 2
	ldr	r1, [r0, #60]
	.loc 1 661 64 discriminator 2
	mvns	r4, r3
	.loc 1 661 109 discriminator 2
	bic	r3, r1, r3
	.loc 1 661 30 discriminator 2
	str	r3, [r0, #60]
	.loc 1 665 5 is_stmt 1 discriminator 2
	.loc 1 665 12 is_stmt 0 discriminator 2
	ldr	r1, [ip]
	.loc 1 665 22 discriminator 2
	ldr	r3, [r1]
	.loc 1 665 51 discriminator 2
	mov	lr, #16384
	lsl	lr, lr, r2
	.loc 1 665 29 discriminator 2
	orr	r3, r3, lr
	str	r3, [r1]
	.loc 1 669 5 is_stmt 1 discriminator 2
.LVL89:
	.loc 1 670 5 discriminator 2
	.loc 1 671 5 discriminator 2
	.loc 1 670 11 is_stmt 0 discriminator 2
	movs	r1, #8
	.loc 1 669 19 discriminator 2
	movs	r0, #16
	.loc 1 671 11 discriminator 2
	b	.L73
.LVL90:
.L75:
	.loc 1 683 9 is_stmt 1
	.loc 1 683 24 is_stmt 0
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	str	r3, [sp, #4]
.L74:
	.loc 1 681 30 is_stmt 1
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L75
	.loc 1 686 7
	.loc 1 686 16 is_stmt 0
	ldr	r3, [ip]
	.loc 1 686 26
	ldr	r3, [r3, #52]
	.loc 1 686 10
	bics	r3, lr, r3
	beq	.L89
	.loc 1 694 9 is_stmt 1
	.loc 1 694 23 is_stmt 0
	add	r0, r0, r1
.LVL91:
.L77:
	.loc 1 696 7 is_stmt 1
	.loc 1 696 13 is_stmt 0
	lsrs	r1, r1, #1
.LVL92:
.L73:
	.loc 1 671 18 is_stmt 1
	cbz	r1, .L90
	.loc 1 674 7
	.loc 1 674 44 is_stmt 0
	ldr	r8, [ip]
	.loc 1 674 54
	ldr	r3, [r8, #56]
	.loc 1 674 86
	movs	r7, #31
	lsls	r7, r7, r2
	.loc 1 674 63
	bic	r3, r3, r7
	.loc 1 674 130
	lsl	r7, r0, r2
	.loc 1 674 112
	orrs	r3, r3, r7
	.loc 1 674 32
	str	r3, [r8, #56]
	.loc 1 680 7 is_stmt 1
	.loc 1 680 62 is_stmt 0
	ldr	r3, .L91
	ldr	r3, [r3]
	lsrs	r3, r3, #6
	ldr	r7, .L91+4
	umull	r7, r3, r7, r3
	lsrs	r3, r3, #6
	.loc 1 680 42
	adds	r3, r3, #1
	add	r3, r3, r3, lsl #2
	.loc 1 680 23
	str	r3, [sp, #4]
	.loc 1 681 7 is_stmt 1
	.loc 1 681 13 is_stmt 0
	b	.L74
.L89:
	.loc 1 689 9 is_stmt 1
	.loc 1 689 23 is_stmt 0
	subs	r0, r0, r1
.LVL93:
	b	.L77
.L90:
	.loc 1 702 5 is_stmt 1
	.loc 1 702 42 is_stmt 0
	ldr	r8, [ip]
	.loc 1 702 52
	ldr	r3, [r8, #56]
	.loc 1 702 84
	movs	r7, #31
	lsls	r7, r7, r2
	.loc 1 702 64
	mvns	r1, r7
.LVL94:
	.loc 1 702 61
	bic	r3, r3, r7
	.loc 1 702 128
	lsl	r7, r0, r2
	.loc 1 702 110
	orrs	r3, r3, r7
	.loc 1 702 30
	str	r3, [r8, #56]
	.loc 1 708 5 is_stmt 1
	.loc 1 708 60 is_stmt 0
	ldr	r3, .L91
	ldr	r3, [r3]
	lsrs	r3, r3, #6
	ldr	r7, .L91+4
	umull	r7, r3, r7, r3
	lsrs	r3, r3, #6
	.loc 1 708 40
	adds	r3, r3, #1
	add	r3, r3, r3, lsl #2
	.loc 1 708 21
	str	r3, [sp, #4]
	.loc 1 709 5 is_stmt 1
	.loc 1 709 11 is_stmt 0
	b	.L79
.L80:
	.loc 1 711 7 is_stmt 1
	.loc 1 711 22 is_stmt 0
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	str	r3, [sp, #4]
.L79:
	.loc 1 709 28 is_stmt 1
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L80
	.loc 1 714 5
	.loc 1 714 14 is_stmt 0
	ldr	r7, [ip]
	.loc 1 714 24
	ldr	r3, [r7, #52]
	.loc 1 714 8
	tst	lr, r3
	bne	.L81
	.loc 1 717 7 is_stmt 1
	.loc 1 717 20 is_stmt 0
	adds	r0, r0, #1
.LVL95:
	.loc 1 719 7 is_stmt 1
	.loc 1 719 54 is_stmt 0
	ldr	r3, [r7, #56]
	.loc 1 719 63
	ands	r3, r3, r1
	.loc 1 719 130
	lsl	r2, r0, r2
	.loc 1 719 112
	orrs	r3, r3, r2
	.loc 1 719 32
	str	r3, [r7, #56]
.L81:
	.loc 1 724 5 is_stmt 1
	.loc 1 724 12 is_stmt 0
	ldr	r2, [ip]
	.loc 1 724 22
	ldr	r3, [r2]
	.loc 1 724 29
	bic	r3, r3, lr
	str	r3, [r2]
	.loc 1 726 5 is_stmt 1
	.loc 1 726 32 is_stmt 0
	str	r0, [r5, #20]
	.loc 1 727 5 is_stmt 1
	.loc 1 727 31 is_stmt 0
	movs	r3, #1
	str	r3, [r5, #16]
	.loc 1 730 5 is_stmt 1
	.loc 1 730 42 is_stmt 0
	ldr	r3, [ip]
	.loc 1 730 52
	ldr	r2, [r3, #60]
	.loc 1 730 61
	ands	r4, r4, r2
	.loc 1 730 109
	orrs	r4, r4, r6
	.loc 1 730 30
	str	r4, [r3, #60]
	.loc 1 733 5 is_stmt 1
	.loc 1 733 9
	.loc 1 733 22 is_stmt 0
	movs	r0, #0
.LVL96:
	strb	r0, [ip, #5]
.LVL97:
.L72:
	.loc 1 737 1
	add	sp, sp, #8
	.cfi_def_cfa_offset 24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.LVL98:
.L82:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 7
	.cfi_restore 8
	.cfi_restore 14
	.loc 1 643 12
	movs	r0, #1
.LVL99:
	.loc 1 737 1
	bx	lr
.LVL100:
.L83:
	.cfi_def_cfa_offset 32
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
	.loc 1 647 12
	movs	r0, #1
.LVL101:
	b	.L72
.LVL102:
.L84:
	.loc 1 652 49
	movs	r0, #2
.LVL103:
	b	.L72
.L92:
	.align	2
.L91:
	.word	SystemCoreClock
	.word	87960931
	.cfi_endproc
.LFE346:
	.size	HAL_DACEx_SelfCalibrate, .-HAL_DACEx_SelfCalibrate
	.section	.text.HAL_DACEx_SetUserTrimming,"ax",%progbits
	.align	1
	.global	HAL_DACEx_SetUserTrimming
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_SetUserTrimming, %function
HAL_DACEx_SetUserTrimming:
.LFB347:
	.loc 1 753 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL104:
	.loc 1 754 3
	.loc 1 757 3
	.loc 1 758 3
	.loc 1 761 3
	.loc 1 761 6 is_stmt 0
	cmp	r1, #0
	it	ne
	cmpne	r0, #0
	beq	.L95
	.loc 1 753 1
	push	{r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	ip, r0
	mov	lr, r1
	.loc 1 768 5 is_stmt 1
	.loc 1 768 9
	.loc 1 768 18 is_stmt 0
	ldrb	r1, [r0, #5]	@ zero_extendqisi2
.LVL105:
	.loc 1 768 11
	cmp	r1, #1
	beq	.L96
	.loc 1 768 68 is_stmt 1 discriminator 2
	.loc 1 768 81 is_stmt 0 discriminator 2
	movs	r4, #1
	strb	r4, [r0, #5]
	.loc 1 768 7 is_stmt 1 discriminator 2
	.loc 1 771 5 discriminator 2
	.loc 1 771 42 is_stmt 0 discriminator 2
	ldr	r5, [r0]
	.loc 1 771 52 discriminator 2
	ldr	r1, [r5, #56]
	.loc 1 771 96 discriminator 2
	and	r2, r2, #16
.LVL106:
	.loc 1 771 84 discriminator 2
	movs	r0, #31
.LVL107:
	lsls	r0, r0, r2
	.loc 1 771 61 discriminator 2
	bic	r1, r1, r0
	.loc 1 771 131 discriminator 2
	lsl	r2, r3, r2
	.loc 1 771 110 discriminator 2
	orrs	r2, r2, r1
	.loc 1 771 30 discriminator 2
	str	r2, [r5, #56]
	.loc 1 774 5 is_stmt 1 discriminator 2
	.loc 1 774 31 is_stmt 0 discriminator 2
	str	r4, [lr, #16]
	.loc 1 775 5 is_stmt 1 discriminator 2
	.loc 1 775 32 is_stmt 0 discriminator 2
	str	r3, [lr, #20]
	.loc 1 778 5 is_stmt 1 discriminator 2
	.loc 1 778 9 discriminator 2
	.loc 1 778 22 is_stmt 0 discriminator 2
	movs	r0, #0
	strb	r0, [ip, #5]
.L94:
.LVL108:
	.loc 1 781 1
	pop	{r4, r5, pc}
.LVL109:
.L95:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 14
	.loc 1 763 12
	movs	r0, #1
.LVL110:
	.loc 1 781 1
	bx	lr
.LVL111:
.L96:
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	.loc 1 768 49
	movs	r0, #2
.LVL112:
	b	.L94
	.cfi_endproc
.LFE347:
	.size	HAL_DACEx_SetUserTrimming, .-HAL_DACEx_SetUserTrimming
	.section	.text.HAL_DACEx_GetTrimOffset,"ax",%progbits
	.align	1
	.global	HAL_DACEx_GetTrimOffset
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_GetTrimOffset, %function
HAL_DACEx_GetTrimOffset:
.LFB348:
	.loc 1 794 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL113:
	.loc 1 796 3
	.loc 1 799 3
	.loc 1 799 16 is_stmt 0
	ldr	r3, [r0]
	.loc 1 799 26
	ldr	r0, [r3, #56]
.LVL114:
	.loc 1 799 64
	and	r1, r1, #16
.LVL115:
	.loc 1 799 52
	movs	r3, #31
	lsls	r3, r3, r1
	.loc 1 799 32
	ands	r0, r0, r3
	.loc 1 800 1
	lsrs	r0, r0, r1
	bx	lr
	.cfi_endproc
.LFE348:
	.size	HAL_DACEx_GetTrimOffset, .-HAL_DACEx_GetTrimOffset
	.section	.text.HAL_DACEx_DualGetValue,"ax",%progbits
	.align	1
	.global	HAL_DACEx_DualGetValue
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DACEx_DualGetValue, %function
HAL_DACEx_DualGetValue:
.LFB349:
	.loc 1 828 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL116:
	.loc 1 829 3
	.loc 1 831 3
	.loc 1 831 14 is_stmt 0
	ldr	r3, [r0]
	.loc 1 831 24
	ldr	r2, [r3, #44]
.LVL117:
	.loc 1 833 3 is_stmt 1
	.loc 1 833 24 is_stmt 0
	ldr	r0, [r3, #48]
.LVL118:
	.loc 1 836 3 is_stmt 1
	.loc 1 837 1 is_stmt 0
	orr	r0, r2, r0, lsl #16
.LVL119:
	bx	lr
	.cfi_endproc
.LFE349:
	.size	HAL_DACEx_DualGetValue, .-HAL_DACEx_DualGetValue
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dma.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dac.h"
	.file 8 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/system_stm32h7xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xbe8
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x1e
	.4byte	.LASF150
	.byte	0x1d
	.4byte	.LASF151
	.4byte	.LASF152
	.4byte	.LLRL44
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
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x55
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x1f
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x49
	.uleb128 0x14
	.4byte	0x78
	.uleb128 0x18
	.4byte	0x78
	.uleb128 0x20
	.4byte	.LASF153
	.byte	0x8
	.byte	0x39
	.byte	0x11
	.4byte	0x78
	.uleb128 0xe
	.byte	0x50
	.2byte	0x1cb
	.4byte	0x191
	.uleb128 0xb
	.ascii	"CR\000"
	.2byte	0x1cd
	.4byte	0x84
	.byte	0
	.uleb128 0x3
	.4byte	.LASF11
	.2byte	0x1ce
	.4byte	0x84
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF12
	.2byte	0x1cf
	.4byte	0x84
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF13
	.2byte	0x1d0
	.4byte	0x84
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF14
	.2byte	0x1d1
	.4byte	0x84
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF15
	.2byte	0x1d2
	.4byte	0x84
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF16
	.2byte	0x1d3
	.4byte	0x84
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF17
	.2byte	0x1d4
	.4byte	0x84
	.byte	0x1c
	.uleb128 0x3
	.4byte	.LASF18
	.2byte	0x1d5
	.4byte	0x84
	.byte	0x20
	.uleb128 0x3
	.4byte	.LASF19
	.2byte	0x1d6
	.4byte	0x84
	.byte	0x24
	.uleb128 0x3
	.4byte	.LASF20
	.2byte	0x1d7
	.4byte	0x84
	.byte	0x28
	.uleb128 0x3
	.4byte	.LASF21
	.2byte	0x1d8
	.4byte	0x84
	.byte	0x2c
	.uleb128 0x3
	.4byte	.LASF22
	.2byte	0x1d9
	.4byte	0x84
	.byte	0x30
	.uleb128 0xb
	.ascii	"SR\000"
	.2byte	0x1da
	.4byte	0x84
	.byte	0x34
	.uleb128 0xb
	.ascii	"CCR\000"
	.2byte	0x1db
	.4byte	0x84
	.byte	0x38
	.uleb128 0xb
	.ascii	"MCR\000"
	.2byte	0x1dc
	.4byte	0x84
	.byte	0x3c
	.uleb128 0x3
	.4byte	.LASF23
	.2byte	0x1dd
	.4byte	0x84
	.byte	0x40
	.uleb128 0x3
	.4byte	.LASF24
	.2byte	0x1de
	.4byte	0x84
	.byte	0x44
	.uleb128 0x3
	.4byte	.LASF25
	.2byte	0x1df
	.4byte	0x84
	.byte	0x48
	.uleb128 0x3
	.4byte	.LASF26
	.2byte	0x1e0
	.4byte	0x84
	.byte	0x4c
	.byte	0
	.uleb128 0xf
	.4byte	.LASF27
	.2byte	0x1e1
	.byte	0x3
	.4byte	0x9a
	.uleb128 0xe
	.byte	0x4
	.2byte	0x250
	.4byte	0x1b2
	.uleb128 0xb
	.ascii	"CCR\000"
	.2byte	0x252
	.4byte	0x84
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	.LASF28
	.2byte	0x253
	.byte	0x2
	.4byte	0x19d
	.uleb128 0xe
	.byte	0x8
	.2byte	0x255
	.4byte	0x1df
	.uleb128 0xb
	.ascii	"CSR\000"
	.2byte	0x257
	.4byte	0x84
	.byte	0
	.uleb128 0xb
	.ascii	"CFR\000"
	.2byte	0x258
	.4byte	0x84
	.byte	0x4
	.byte	0
	.uleb128 0xf
	.4byte	.LASF29
	.2byte	0x259
	.byte	0x2
	.4byte	0x1be
	.uleb128 0xe
	.byte	0x4
	.2byte	0x25b
	.4byte	0x200
	.uleb128 0x3
	.4byte	.LASF30
	.2byte	0x25d
	.4byte	0x84
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	.LASF31
	.2byte	0x25e
	.byte	0x2
	.4byte	0x1eb
	.uleb128 0xe
	.byte	0x8
	.2byte	0x260
	.4byte	0x22d
	.uleb128 0x3
	.4byte	.LASF32
	.2byte	0x262
	.4byte	0x84
	.byte	0
	.uleb128 0x3
	.4byte	.LASF33
	.2byte	0x263
	.4byte	0x84
	.byte	0x4
	.byte	0
	.uleb128 0xf
	.4byte	.LASF34
	.2byte	0x264
	.byte	0x2
	.4byte	0x20c
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.4byte	.LASF35
	.uleb128 0x21
	.byte	0x4
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF36
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.4byte	.LASF37
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.4byte	.LASF38
	.uleb128 0x12
	.4byte	0x34
	.byte	0x5
	.byte	0x28
	.4byte	0x27b
	.uleb128 0x4
	.4byte	.LASF39
	.byte	0
	.uleb128 0x4
	.4byte	.LASF40
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF41
	.byte	0x2
	.uleb128 0x4
	.4byte	.LASF42
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.4byte	.LASF43
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0x257
	.uleb128 0x12
	.4byte	0x34
	.byte	0x5
	.byte	0x33
	.4byte	0x29f
	.uleb128 0x4
	.4byte	.LASF44
	.byte	0
	.uleb128 0x4
	.4byte	.LASF45
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.4byte	.LASF46
	.byte	0x5
	.byte	0x36
	.byte	0x3
	.4byte	0x287
	.uleb128 0x13
	.byte	0x30
	.byte	0x6
	.byte	0x30
	.4byte	0x350
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x6
	.byte	0x32
	.byte	0xc
	.4byte	0x78
	.byte	0
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0x6
	.byte	0x35
	.byte	0xc
	.4byte	0x78
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x6
	.byte	0x39
	.byte	0xc
	.4byte	0x78
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0x6
	.byte	0x3c
	.byte	0xc
	.4byte	0x78
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0x6
	.byte	0x3f
	.byte	0xc
	.4byte	0x78
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0x6
	.byte	0x42
	.byte	0xc
	.4byte	0x78
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x6
	.byte	0x45
	.byte	0xc
	.4byte	0x78
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x6
	.byte	0x4a
	.byte	0xc
	.4byte	0x78
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0x6
	.byte	0x4d
	.byte	0xc
	.4byte	0x78
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF56
	.byte	0x6
	.byte	0x52
	.byte	0xc
	.4byte	0x78
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0x6
	.byte	0x55
	.byte	0xc
	.4byte	0x78
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF58
	.byte	0x6
	.byte	0x5b
	.byte	0xc
	.4byte	0x78
	.byte	0x2c
	.byte	0
	.uleb128 0x7
	.4byte	.LASF59
	.byte	0x6
	.byte	0x60
	.byte	0x2
	.4byte	0x2ab
	.uleb128 0x12
	.4byte	0x34
	.byte	0x6
	.byte	0x66
	.4byte	0x386
	.uleb128 0x4
	.4byte	.LASF60
	.byte	0
	.uleb128 0x4
	.4byte	.LASF61
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF62
	.byte	0x2
	.uleb128 0x4
	.4byte	.LASF63
	.byte	0x3
	.uleb128 0x4
	.4byte	.LASF64
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF65
	.byte	0x6
	.byte	0x6c
	.byte	0x2
	.4byte	0x35c
	.uleb128 0x14
	.4byte	0x386
	.uleb128 0x22
	.4byte	.LASF154
	.byte	0x78
	.byte	0x6
	.byte	0x88
	.byte	0x10
	.4byte	0x4a9
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x6
	.byte	0x8a
	.byte	0x9
	.4byte	0x240
	.byte	0
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x6
	.byte	0x8c
	.byte	0x13
	.4byte	0x350
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x6
	.byte	0x8e
	.byte	0x13
	.4byte	0x29f
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x6
	.byte	0x90
	.byte	0x21
	.4byte	0x392
	.byte	0x35
	.uleb128 0x1
	.4byte	.LASF70
	.byte	0x6
	.byte	0x92
	.byte	0x9
	.4byte	0x240
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF71
	.byte	0x6
	.byte	0x94
	.byte	0xb
	.4byte	0x4b9
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0x6
	.byte	0x96
	.byte	0xb
	.4byte	0x4b9
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x6
	.byte	0x98
	.byte	0xb
	.4byte	0x4b9
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x6
	.byte	0x9a
	.byte	0xb
	.4byte	0x4b9
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF75
	.byte	0x6
	.byte	0x9c
	.byte	0xb
	.4byte	0x4b9
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0x6
	.byte	0x9e
	.byte	0xb
	.4byte	0x4b9
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF77
	.byte	0x6
	.byte	0xa0
	.byte	0x14
	.4byte	0x84
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0x6
	.byte	0xa2
	.byte	0xb
	.4byte	0x78
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x6
	.byte	0xa4
	.byte	0xb
	.4byte	0x78
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF80
	.byte	0x6
	.byte	0xa6
	.byte	0x1a
	.4byte	0x4be
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF81
	.byte	0x6
	.byte	0xa8
	.byte	0x20
	.4byte	0x4c3
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF82
	.byte	0x6
	.byte	0xaa
	.byte	0xb
	.4byte	0x78
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0x6
	.byte	0xad
	.byte	0x1d
	.4byte	0x4c8
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF84
	.byte	0x6
	.byte	0xaf
	.byte	0x23
	.4byte	0x4cd
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF85
	.byte	0x6
	.byte	0xb1
	.byte	0xb
	.4byte	0x78
	.byte	0x74
	.byte	0
	.uleb128 0x23
	.4byte	0x4b4
	.uleb128 0x8
	.4byte	0x4b4
	.byte	0
	.uleb128 0x6
	.4byte	0x397
	.uleb128 0x6
	.4byte	0x4a9
	.uleb128 0x6
	.4byte	0x1b2
	.uleb128 0x6
	.4byte	0x1df
	.uleb128 0x6
	.4byte	0x200
	.uleb128 0x6
	.4byte	0x22d
	.uleb128 0x7
	.4byte	.LASF86
	.byte	0x6
	.byte	0xb3
	.byte	0x2
	.4byte	0x397
	.uleb128 0x6
	.4byte	0x4d2
	.uleb128 0x12
	.4byte	0x34
	.byte	0x7
	.byte	0x32
	.4byte	0x50d
	.uleb128 0x4
	.4byte	.LASF87
	.byte	0
	.uleb128 0x4
	.4byte	.LASF88
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF89
	.byte	0x2
	.uleb128 0x4
	.4byte	.LASF90
	.byte	0x3
	.uleb128 0x4
	.4byte	.LASF91
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF92
	.byte	0x7
	.byte	0x39
	.byte	0x3
	.4byte	0x4e3
	.uleb128 0x14
	.4byte	0x50d
	.uleb128 0x13
	.byte	0x14
	.byte	0x7
	.byte	0x41
	.4byte	0x575
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x7
	.byte	0x44
	.byte	0x10
	.4byte	0x575
	.byte	0
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x7
	.byte	0x46
	.byte	0x21
	.4byte	0x519
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x7
	.byte	0x48
	.byte	0x13
	.4byte	0x29f
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0x7
	.byte	0x4a
	.byte	0x16
	.4byte	0x4de
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF94
	.byte	0x7
	.byte	0x4c
	.byte	0x16
	.4byte	0x4de
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF77
	.byte	0x7
	.byte	0x4e
	.byte	0x15
	.4byte	0x84
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.4byte	0x191
	.uleb128 0x7
	.4byte	.LASF95
	.byte	0x7
	.byte	0x60
	.byte	0x3
	.4byte	0x51e
	.uleb128 0x18
	.4byte	0x57a
	.uleb128 0x13
	.byte	0xc
	.byte	0x7
	.byte	0x65
	.4byte	0x5bb
	.uleb128 0x1
	.4byte	.LASF96
	.byte	0x7
	.byte	0x67
	.byte	0xc
	.4byte	0x78
	.byte	0
	.uleb128 0x1
	.4byte	.LASF97
	.byte	0x7
	.byte	0x6b
	.byte	0xc
	.4byte	0x78
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF98
	.byte	0x7
	.byte	0x6f
	.byte	0xc
	.4byte	0x78
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.4byte	.LASF99
	.byte	0x7
	.byte	0x72
	.byte	0x3
	.4byte	0x58b
	.uleb128 0x13
	.byte	0x24
	.byte	0x7
	.byte	0x77
	.4byte	0x62b
	.uleb128 0x1
	.4byte	.LASF100
	.byte	0x7
	.byte	0x79
	.byte	0xc
	.4byte	0x78
	.byte	0
	.uleb128 0x1
	.4byte	.LASF101
	.byte	0x7
	.byte	0x7c
	.byte	0xc
	.4byte	0x78
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF102
	.byte	0x7
	.byte	0x7f
	.byte	0xc
	.4byte	0x78
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF103
	.byte	0x7
	.byte	0x82
	.byte	0xc
	.4byte	0x78
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF104
	.byte	0x7
	.byte	0x85
	.byte	0xc
	.4byte	0x78
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF105
	.byte	0x7
	.byte	0x89
	.byte	0xc
	.4byte	0x78
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF106
	.byte	0x7
	.byte	0x8c
	.byte	0x20
	.4byte	0x5bb
	.byte	0x18
	.byte	0
	.uleb128 0x7
	.4byte	.LASF107
	.byte	0x7
	.byte	0x8d
	.byte	0x3
	.4byte	0x5c7
	.uleb128 0x19
	.4byte	.LASF108
	.2byte	0x4af
	.4byte	0x27b
	.4byte	0x64c
	.uleb128 0x8
	.4byte	0x4de
	.byte	0
	.uleb128 0x19
	.4byte	.LASF109
	.2byte	0x4ae
	.4byte	0x27b
	.4byte	0x670
	.uleb128 0x8
	.4byte	0x4de
	.uleb128 0x8
	.4byte	0x78
	.uleb128 0x8
	.4byte	0x78
	.uleb128 0x8
	.4byte	0x78
	.byte	0
	.uleb128 0x15
	.4byte	.LASF110
	.2byte	0x215
	.4byte	0x681
	.uleb128 0x8
	.4byte	0x4de
	.byte	0
	.uleb128 0x15
	.4byte	.LASF111
	.2byte	0x216
	.4byte	0x692
	.uleb128 0x8
	.4byte	0x4de
	.byte	0
	.uleb128 0x15
	.4byte	.LASF112
	.2byte	0x214
	.4byte	0x6a3
	.uleb128 0x8
	.4byte	0x4de
	.byte	0
	.uleb128 0xc
	.4byte	.LASF113
	.2byte	0x380
	.byte	0x6
	.4byte	.LFB352
	.4byte	.LFE352-.LFB352
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6e8
	.uleb128 0x2
	.4byte	.LASF115
	.2byte	0x380
	.byte	0x29
	.4byte	0x4de
	.4byte	.LLST28
	.uleb128 0x16
	.4byte	.LASF116
	.2byte	0x382
	.byte	0x16
	.4byte	0x6e8
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1a
	.4byte	.LVL82
	.4byte	0x919
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	0x57a
	.uleb128 0xc
	.4byte	.LASF114
	.2byte	0x36f
	.byte	0x6
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x72d
	.uleb128 0x2
	.4byte	.LASF115
	.2byte	0x36f
	.byte	0x30
	.4byte	0x4de
	.4byte	.LLST26
	.uleb128 0x9
	.4byte	.LASF116
	.2byte	0x371
	.byte	0x16
	.4byte	0x6e8
	.4byte	.LLST27
	.uleb128 0x10
	.4byte	.LVL77
	.4byte	0x93e
	.byte	0
	.uleb128 0xc
	.4byte	.LASF117
	.2byte	0x35c
	.byte	0x6
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x772
	.uleb128 0x2
	.4byte	.LASF115
	.2byte	0x35c
	.byte	0x2c
	.4byte	0x4de
	.4byte	.LLST25
	.uleb128 0x16
	.4byte	.LASF116
	.2byte	0x35e
	.byte	0x16
	.4byte	0x6e8
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1a
	.4byte	.LVL72
	.4byte	0x963
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF118
	.2byte	0x33b
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7ac
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x33b
	.byte	0x3a
	.4byte	0x7ac
	.4byte	.LLST42
	.uleb128 0x1c
	.ascii	"tmp\000"
	.2byte	0x33d
	.4byte	0x78
	.4byte	.LLST43
	.byte	0
	.uleb128 0x6
	.4byte	0x586
	.uleb128 0xa
	.4byte	.LASF119
	.2byte	0x319
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7ec
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x319
	.byte	0x3b
	.4byte	0x7ac
	.4byte	.LLST40
	.uleb128 0x2
	.4byte	.LASF120
	.2byte	0x319
	.byte	0x4a
	.4byte	0x78
	.4byte	.LLST41
	.byte	0
	.uleb128 0xa
	.4byte	.LASF121
	.2byte	0x2ef
	.byte	0x13
	.4byte	0x27b
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x855
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x2ef
	.byte	0x40
	.4byte	0x6e8
	.4byte	.LLST36
	.uleb128 0x2
	.4byte	.LASF122
	.2byte	0x2ef
	.byte	0x5e
	.4byte	0x855
	.4byte	.LLST37
	.uleb128 0x2
	.4byte	.LASF120
	.2byte	0x2ef
	.byte	0x70
	.4byte	0x78
	.4byte	.LLST38
	.uleb128 0x11
	.4byte	.LASF123
	.2byte	0x2f0
	.byte	0x36
	.4byte	0x78
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x9
	.4byte	.LASF124
	.2byte	0x2f2
	.byte	0x15
	.4byte	0x27b
	.4byte	.LLST39
	.byte	0
	.uleb128 0x6
	.4byte	0x62b
	.uleb128 0xa
	.4byte	.LASF125
	.2byte	0x271
	.byte	0x13
	.4byte	0x27b
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8f4
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x271
	.byte	0x3e
	.4byte	0x6e8
	.4byte	.LLST29
	.uleb128 0x2
	.4byte	.LASF122
	.2byte	0x271
	.byte	0x5c
	.4byte	0x855
	.4byte	.LLST30
	.uleb128 0x2
	.4byte	.LASF120
	.2byte	0x271
	.byte	0x6e
	.4byte	0x78
	.4byte	.LLST31
	.uleb128 0x9
	.4byte	.LASF124
	.2byte	0x273
	.byte	0x15
	.4byte	0x27b
	.4byte	.LLST32
	.uleb128 0x9
	.4byte	.LASF126
	.2byte	0x275
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST33
	.uleb128 0x9
	.4byte	.LASF127
	.2byte	0x276
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST34
	.uleb128 0x16
	.4byte	.LASF128
	.2byte	0x277
	.byte	0x15
	.4byte	0x84
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x9
	.4byte	.LASF129
	.2byte	0x27a
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST35
	.byte	0
	.uleb128 0xc
	.4byte	.LASF130
	.2byte	0x259
	.byte	0x1c
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x919
	.uleb128 0x11
	.4byte	.LASF116
	.2byte	0x259
	.byte	0x50
	.4byte	0x6e8
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF131
	.2byte	0x249
	.byte	0x1c
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x93e
	.uleb128 0x11
	.4byte	.LASF116
	.2byte	0x249
	.byte	0x4a
	.4byte	0x6e8
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF132
	.2byte	0x239
	.byte	0x1c
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x963
	.uleb128 0x11
	.4byte	.LASF116
	.2byte	0x239
	.byte	0x51
	.4byte	0x6e8
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF133
	.2byte	0x229
	.byte	0x1c
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x988
	.uleb128 0x11
	.4byte	.LASF116
	.2byte	0x229
	.byte	0x4d
	.4byte	0x6e8
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xa
	.4byte	.LASF134
	.2byte	0x1ff
	.byte	0x13
	.4byte	0x27b
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa02
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x1ff
	.byte	0x3d
	.4byte	0x6e8
	.4byte	.LLST19
	.uleb128 0x2
	.4byte	.LASF135
	.2byte	0x1ff
	.byte	0x4c
	.4byte	0x78
	.4byte	.LLST20
	.uleb128 0x2
	.4byte	.LASF136
	.2byte	0x1ff
	.byte	0x60
	.4byte	0x78
	.4byte	.LLST21
	.uleb128 0x2
	.4byte	.LASF137
	.2byte	0x1ff
	.byte	0x70
	.4byte	0x78
	.4byte	.LLST22
	.uleb128 0x9
	.4byte	.LASF138
	.2byte	0x201
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST23
	.uleb128 0x1c
	.ascii	"tmp\000"
	.2byte	0x202
	.4byte	0x78
	.4byte	.LLST24
	.byte	0
	.uleb128 0xa
	.4byte	.LASF139
	.2byte	0x1cf
	.byte	0x13
	.4byte	0x27b
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa4d
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x1cf
	.byte	0x42
	.4byte	0x6e8
	.4byte	.LLST16
	.uleb128 0x2
	.4byte	.LASF120
	.2byte	0x1cf
	.byte	0x51
	.4byte	0x78
	.4byte	.LLST17
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x1cf
	.byte	0x63
	.4byte	0x78
	.4byte	.LLST18
	.byte	0
	.uleb128 0xa
	.4byte	.LASF141
	.2byte	0x197
	.byte	0x13
	.4byte	0x27b
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa98
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x197
	.byte	0x45
	.4byte	0x6e8
	.4byte	.LLST13
	.uleb128 0x2
	.4byte	.LASF120
	.2byte	0x197
	.byte	0x54
	.4byte	0x78
	.4byte	.LLST14
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x197
	.byte	0x66
	.4byte	0x78
	.4byte	.LLST15
	.byte	0
	.uleb128 0xa
	.4byte	.LASF142
	.2byte	0x148
	.byte	0x13
	.4byte	0x27b
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xaf5
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x148
	.byte	0x3d
	.4byte	0x6e8
	.4byte	.LLST10
	.uleb128 0x2
	.4byte	.LASF120
	.2byte	0x148
	.byte	0x4c
	.4byte	0x78
	.4byte	.LLST11
	.uleb128 0x9
	.4byte	.LASF124
	.2byte	0x14a
	.byte	0x15
	.4byte	0x27b
	.4byte	.LLST12
	.uleb128 0x10
	.4byte	.LVL39
	.4byte	0x637
	.uleb128 0x10
	.4byte	.LVL42
	.4byte	0x637
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF143
	.byte	0xd5
	.4byte	0x27b
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb89
	.uleb128 0xd
	.4byte	.LASF116
	.byte	0xd5
	.byte	0x3e
	.4byte	0x6e8
	.4byte	.LLST3
	.uleb128 0xd
	.4byte	.LASF120
	.byte	0xd5
	.byte	0x4d
	.4byte	0x78
	.4byte	.LLST4
	.uleb128 0xd
	.4byte	.LASF144
	.byte	0xd6
	.byte	0x3b
	.4byte	0xb89
	.4byte	.LLST5
	.uleb128 0xd
	.4byte	.LASF145
	.byte	0xd6
	.byte	0x4b
	.4byte	0x78
	.4byte	.LLST6
	.uleb128 0xd
	.4byte	.LASF135
	.byte	0xd6
	.byte	0x5c
	.4byte	0x78
	.4byte	.LLST7
	.uleb128 0x17
	.4byte	.LASF124
	.byte	0xd8
	.byte	0x15
	.4byte	0x27b
	.4byte	.LLST8
	.uleb128 0x17
	.4byte	.LASF146
	.byte	0xd9
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST9
	.uleb128 0x10
	.4byte	.LVL22
	.4byte	0x64c
	.uleb128 0x10
	.4byte	.LVL32
	.4byte	0x64c
	.byte	0
	.uleb128 0x6
	.4byte	0x89
	.uleb128 0x1d
	.4byte	.LASF147
	.byte	0xb0
	.4byte	0x27b
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbb6
	.uleb128 0xd
	.4byte	.LASF116
	.byte	0xb0
	.byte	0x39
	.4byte	0x6e8
	.4byte	.LLST2
	.byte	0
	.uleb128 0x24
	.4byte	.LASF148
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.4byte	0x27b
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF116
	.byte	0x7f
	.byte	0x3a
	.4byte	0x6e8
	.4byte	.LLST0
	.uleb128 0x17
	.4byte	.LASF149
	.byte	0x81
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST1
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
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
	.sleb128 7
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x26
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
	.uleb128 0x1a
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
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
.LLST28:
	.byte	0x6
	.4byte	.LVL79
	.byte	0x4
	.uleb128 .LVL79-.LVL79
	.uleb128 .LVL81-.LVL79
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL81-.LVL79
	.uleb128 .LFE352-.LVL79
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST26:
	.byte	0x6
	.4byte	.LVL74
	.byte	0x4
	.uleb128 .LVL74-.LVL74
	.uleb128 .LVL76-.LVL74
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL76-.LVL74
	.uleb128 .LFE351-.LVL74
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST27:
	.byte	0x6
	.4byte	.LVL75
	.byte	0x4
	.uleb128 .LVL75-.LVL75
	.uleb128 .LVL76-.LVL75
	.uleb128 0x2
	.byte	0x70
	.sleb128 56
	.byte	0x4
	.uleb128 .LVL76-.LVL75
	.uleb128 .LVL77-1-.LVL75
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST25:
	.byte	0x6
	.4byte	.LVL69
	.byte	0x4
	.uleb128 .LVL69-.LVL69
	.uleb128 .LVL71-.LVL69
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL71-.LVL69
	.uleb128 .LFE350-.LVL69
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST42:
	.byte	0x6
	.4byte	.LVL116
	.byte	0x4
	.uleb128 .LVL116-.LVL116
	.uleb128 .LVL118-.LVL116
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL118-.LVL116
	.uleb128 .LFE349-.LVL116
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST43:
	.byte	0x6
	.4byte	.LVL116
	.byte	0x4
	.uleb128 .LVL116-.LVL116
	.uleb128 .LVL117-.LVL116
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL117-.LVL116
	.uleb128 .LVL118-.LVL116
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL118-.LVL116
	.uleb128 .LVL119-.LVL116
	.uleb128 0x8
	.byte	0x70
	.sleb128 0
	.byte	0x40
	.byte	0x24
	.byte	0x72
	.sleb128 0
	.byte	0x21
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL119-.LVL116
	.uleb128 .LFE349-.LVL116
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST40:
	.byte	0x6
	.4byte	.LVL113
	.byte	0x4
	.uleb128 .LVL113-.LVL113
	.uleb128 .LVL114-.LVL113
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL114-.LVL113
	.uleb128 .LFE348-.LVL113
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST41:
	.byte	0x6
	.4byte	.LVL113
	.byte	0x4
	.uleb128 .LVL113-.LVL113
	.uleb128 .LVL115-.LVL113
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL115-.LVL113
	.uleb128 .LFE348-.LVL113
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST36:
	.byte	0x6
	.4byte	.LVL104
	.byte	0x4
	.uleb128 .LVL104-.LVL104
	.uleb128 .LVL107-.LVL104
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL107-.LVL104
	.uleb128 .LVL109-.LVL104
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL109-.LVL104
	.uleb128 .LVL110-.LVL104
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL110-.LVL104
	.uleb128 .LVL111-.LVL104
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL111-.LVL104
	.uleb128 .LVL112-.LVL104
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL112-.LVL104
	.uleb128 .LFE347-.LVL104
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST37:
	.byte	0x6
	.4byte	.LVL104
	.byte	0x4
	.uleb128 .LVL104-.LVL104
	.uleb128 .LVL105-.LVL104
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL105-.LVL104
	.uleb128 .LVL109-.LVL104
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL109-.LVL104
	.uleb128 .LVL111-.LVL104
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL111-.LVL104
	.uleb128 .LFE347-.LVL104
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST38:
	.byte	0x6
	.4byte	.LVL104
	.byte	0x4
	.uleb128 .LVL104-.LVL104
	.uleb128 .LVL106-.LVL104
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL106-.LVL104
	.uleb128 .LVL109-.LVL104
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL109-.LVL104
	.uleb128 .LFE347-.LVL104
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST39:
	.byte	0x6
	.4byte	.LVL104
	.byte	0x4
	.uleb128 .LVL104-.LVL104
	.uleb128 .LVL108-.LVL104
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL109-.LVL104
	.uleb128 .LVL110-.LVL104
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL111-.LVL104
	.uleb128 .LFE347-.LVL104
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST29:
	.byte	0x6
	.4byte	.LVL84
	.byte	0x4
	.uleb128 .LVL84-.LVL84
	.uleb128 .LVL86-.LVL84
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL86-.LVL84
	.uleb128 .LVL98-.LVL84
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL98-.LVL84
	.uleb128 .LVL99-.LVL84
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL99-.LVL84
	.uleb128 .LVL100-.LVL84
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL100-.LVL84
	.uleb128 .LVL101-.LVL84
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL101-.LVL84
	.uleb128 .LVL102-.LVL84
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL102-.LVL84
	.uleb128 .LVL103-.LVL84
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL103-.LVL84
	.uleb128 .LFE346-.LVL84
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST30:
	.byte	0x6
	.4byte	.LVL84
	.byte	0x4
	.uleb128 .LVL84-.LVL84
	.uleb128 .LVL85-.LVL84
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL85-.LVL84
	.uleb128 .LVL98-.LVL84
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL98-.LVL84
	.uleb128 .LFE346-.LVL84
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST31:
	.byte	0x6
	.4byte	.LVL84
	.byte	0x4
	.uleb128 .LVL84-.LVL84
	.uleb128 .LVL87-.LVL84
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL87-.LVL84
	.uleb128 .LVL98-.LVL84
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL98-.LVL84
	.uleb128 .LFE346-.LVL84
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST32:
	.byte	0x6
	.4byte	.LVL84
	.byte	0x4
	.uleb128 .LVL84-.LVL84
	.uleb128 .LVL97-.LVL84
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL98-.LVL84
	.uleb128 .LVL99-.LVL84
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL100-.LVL84
	.uleb128 .LFE346-.LVL84
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST33:
	.byte	0x6
	.4byte	.LVL89
	.byte	0x4
	.uleb128 .LVL89-.LVL89
	.uleb128 .LVL90-.LVL89
	.uleb128 0x2
	.byte	0x40
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL90-.LVL89
	.uleb128 .LVL96-.LVL89
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST34:
	.byte	0x6
	.4byte	.LVL89
	.byte	0x4
	.uleb128 .LVL89-.LVL89
	.uleb128 .LVL90-.LVL89
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL90-.LVL89
	.uleb128 .LVL94-.LVL89
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST35:
	.byte	0x8
	.4byte	.LVL88
	.uleb128 .LVL97-.LVL88
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL63-.LVL59
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL63-.LVL59
	.uleb128 .LVL64-.LVL59
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL64-.LVL59
	.uleb128 .LVL67-.LVL59
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL67-.LVL59
	.uleb128 .LFE341-.LVL59
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST20:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL62-.LVL59
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL62-.LVL59
	.uleb128 .LVL64-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL64-.LVL59
	.uleb128 .LFE341-.LVL59
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST21:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL60-.LVL59
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL60-.LVL59
	.uleb128 .LVL64-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL64-.LVL59
	.uleb128 .LVL65-.LVL59
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL65-.LVL59
	.uleb128 .LVL66-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL66-.LVL59
	.uleb128 .LFE341-.LVL59
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST22:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL61-.LVL59
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL61-.LVL59
	.uleb128 .LVL64-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL64-.LVL59
	.uleb128 .LFE341-.LVL59
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST23:
	.byte	0x6
	.4byte	.LVL60
	.byte	0x4
	.uleb128 .LVL60-.LVL60
	.uleb128 .LVL64-.LVL60
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL65-.LVL60
	.uleb128 .LVL66-.LVL60
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST24:
	.byte	0x6
	.4byte	.LVL61
	.byte	0x4
	.uleb128 .LVL61-.LVL61
	.uleb128 .LVL62-.LVL61
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL62-.LVL61
	.uleb128 .LVL64-.LVL61
	.uleb128 0x3
	.byte	0x71
	.sleb128 32
	.byte	0x9f
	.byte	0
.LLST16:
	.byte	0x6
	.4byte	.LVL52
	.byte	0x4
	.uleb128 .LVL52-.LVL52
	.uleb128 .LVL53-.LVL52
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL53-.LVL52
	.uleb128 .LVL56-.LVL52
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL56-.LVL52
	.uleb128 .LVL57-.LVL52
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL57-.LVL52
	.uleb128 .LVL58-.LVL52
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL58-.LVL52
	.uleb128 .LFE340-.LVL52
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST17:
	.byte	0x6
	.4byte	.LVL52
	.byte	0x4
	.uleb128 .LVL52-.LVL52
	.uleb128 .LVL54-.LVL52
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL54-.LVL52
	.uleb128 .LVL56-.LVL52
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL56-.LVL52
	.uleb128 .LFE340-.LVL52
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST18:
	.byte	0x6
	.4byte	.LVL52
	.byte	0x4
	.uleb128 .LVL52-.LVL52
	.uleb128 .LVL55-.LVL52
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL55-.LVL52
	.uleb128 .LVL56-.LVL52
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL56-.LVL52
	.uleb128 .LFE340-.LVL52
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL45
	.byte	0x4
	.uleb128 .LVL45-.LVL45
	.uleb128 .LVL46-.LVL45
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL46-.LVL45
	.uleb128 .LVL49-.LVL45
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL49-.LVL45
	.uleb128 .LVL50-.LVL45
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL50-.LVL45
	.uleb128 .LVL51-.LVL45
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL51-.LVL45
	.uleb128 .LFE339-.LVL45
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL45
	.byte	0x4
	.uleb128 .LVL45-.LVL45
	.uleb128 .LVL47-.LVL45
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL47-.LVL45
	.uleb128 .LVL49-.LVL45
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL49-.LVL45
	.uleb128 .LFE339-.LVL45
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST15:
	.byte	0x6
	.4byte	.LVL45
	.byte	0x4
	.uleb128 .LVL45-.LVL45
	.uleb128 .LVL48-.LVL45
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL48-.LVL45
	.uleb128 .LVL49-.LVL45
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL49-.LVL45
	.uleb128 .LFE339-.LVL45
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST10:
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
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL40-.LVL37
	.uleb128 .LVL41-.LVL37
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL41-.LVL37
	.uleb128 .LVL43-.LVL37
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL43-.LVL37
	.uleb128 .LVL44-.LVL37
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL44-.LVL37
	.uleb128 .LFE338-.LVL37
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL37
	.byte	0x4
	.uleb128 .LVL37-.LVL37
	.uleb128 .LVL39-1-.LVL37
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL39-1-.LVL37
	.uleb128 .LVL40-.LVL37
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL40-.LVL37
	.uleb128 .LVL42-1-.LVL37
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL42-1-.LVL37
	.uleb128 .LVL43-.LVL37
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL37
	.uleb128 .LFE338-.LVL37
	.uleb128 0x1
	.byte	0x51
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
	.uleb128 .LVL42-.LVL39
	.uleb128 .LVL43-.LVL39
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL19-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL19-.LVL15
	.uleb128 .LVL23-.LVL15
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL23-.LVL15
	.uleb128 .LVL24-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL24-.LVL15
	.uleb128 .LVL25-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL25-.LVL15
	.uleb128 .LVL33-.LVL15
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL33-.LVL15
	.uleb128 .LVL34-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL34-.LVL15
	.uleb128 .LVL35-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL35-.LVL15
	.uleb128 .LVL36-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL36-.LVL15
	.uleb128 .LFE337-.LVL15
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL17-.LVL15
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL17-.LVL15
	.uleb128 .LVL21-.LVL15
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL21-.LVL15
	.uleb128 .LVL24-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL24-.LVL15
	.uleb128 .LVL31-.LVL15
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL31-.LVL15
	.uleb128 .LVL33-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL33-.LVL15
	.uleb128 .LVL35-.LVL15
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL35-.LVL15
	.uleb128 .LFE337-.LVL15
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL18-.LVL15
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL18-.LVL15
	.uleb128 .LVL22-1-.LVL15
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL22-1-.LVL15
	.uleb128 .LVL24-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL24-.LVL15
	.uleb128 .LVL32-1-.LVL15
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL32-1-.LVL15
	.uleb128 .LVL33-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL33-.LVL15
	.uleb128 .LVL35-.LVL15
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL35-.LVL15
	.uleb128 .LFE337-.LVL15
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL22-1-.LVL15
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL22-1-.LVL15
	.uleb128 .LVL24-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL24-.LVL15
	.uleb128 .LVL32-1-.LVL15
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL32-1-.LVL15
	.uleb128 .LVL33-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL33-.LVL15
	.uleb128 .LFE337-.LVL15
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL24-.LVL15
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL24-.LVL15
	.uleb128 .LFE337-.LVL15
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL32-.LVL22
	.uleb128 .LVL33-.LVL22
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL20-.LVL16
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL20-.LVL16
	.uleb128 .LVL22-1-.LVL16
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL24-.LVL16
	.uleb128 .LVL26-.LVL16
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL26-.LVL16
	.uleb128 .LVL27-.LVL16
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL27-.LVL16
	.uleb128 .LVL28-.LVL16
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL28-.LVL16
	.uleb128 .LVL29-.LVL16
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL29-.LVL16
	.uleb128 .LVL30-.LVL16
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL30-.LVL16
	.uleb128 .LVL32-1-.LVL16
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL33-.LVL16
	.uleb128 .LFE337-.LVL16
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL11
	.byte	0x4
	.uleb128 .LVL11-.LVL11
	.uleb128 .LVL12-.LVL11
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL12-.LVL11
	.uleb128 .LVL13-.LVL11
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL13-.LVL11
	.uleb128 .LVL14-.LVL11
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL14-.LVL11
	.uleb128 .LFE336-.LVL11
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
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL4-.LVL0
	.uleb128 .LVL7-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LVL8-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL8-.LVL0
	.uleb128 .LVL9-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL9-.LVL0
	.uleb128 .LVL10-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL10-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LVL7-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0xa4
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
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.4byte	.LFB352
	.4byte	.LFE352-.LFB352
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
.LLRL44:
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
	.4byte	.LFB350
	.uleb128 .LFE350-.LFB350
	.byte	0x7
	.4byte	.LFB343
	.uleb128 .LFE343-.LFB343
	.byte	0x7
	.4byte	.LFB351
	.uleb128 .LFE351-.LFB351
	.byte	0x7
	.4byte	.LFB344
	.uleb128 .LFE344-.LFB344
	.byte	0x7
	.4byte	.LFB352
	.uleb128 .LFE352-.LFB352
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
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF97:
	.ascii	"DAC_HoldTime\000"
.LASF90:
	.ascii	"HAL_DAC_STATE_TIMEOUT\000"
.LASF151:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_dac_ex.c\000"
.LASF130:
	.ascii	"HAL_DACEx_DMAUnderrunCallbackCh2\000"
.LASF85:
	.ascii	"DMAmuxRequestGenStatusMask\000"
.LASF136:
	.ascii	"Data1\000"
.LASF59:
	.ascii	"DMA_InitTypeDef\000"
.LASF134:
	.ascii	"HAL_DACEx_DualSetValue\000"
.LASF61:
	.ascii	"HAL_DMA_STATE_READY\000"
.LASF96:
	.ascii	"DAC_SampleTime\000"
.LASF81:
	.ascii	"DMAmuxChannelStatus\000"
.LASF100:
	.ascii	"DAC_SampleAndHold\000"
.LASF126:
	.ascii	"trimmingvalue\000"
.LASF142:
	.ascii	"HAL_DACEx_DualStop_DMA\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF125:
	.ascii	"HAL_DACEx_SelfCalibrate\000"
.LASF133:
	.ascii	"HAL_DACEx_ConvCpltCallbackCh2\000"
.LASF127:
	.ascii	"delta\000"
.LASF121:
	.ascii	"HAL_DACEx_SetUserTrimming\000"
.LASF144:
	.ascii	"pData\000"
.LASF6:
	.ascii	"long long int\000"
.LASF1:
	.ascii	"signed char\000"
.LASF72:
	.ascii	"XferHalfCpltCallback\000"
.LASF109:
	.ascii	"HAL_DMA_Start_IT\000"
.LASF73:
	.ascii	"XferM1CpltCallback\000"
.LASF102:
	.ascii	"DAC_OutputBuffer\000"
.LASF146:
	.ascii	"tmpreg\000"
.LASF46:
	.ascii	"HAL_LockTypeDef\000"
.LASF82:
	.ascii	"DMAmuxChannelStatusMask\000"
.LASF29:
	.ascii	"DMAMUX_ChannelStatus_TypeDef\000"
.LASF4:
	.ascii	"long int\000"
.LASF49:
	.ascii	"PeriphInc\000"
.LASF57:
	.ascii	"MemBurst\000"
.LASF111:
	.ascii	"DAC_DMAHalfConvCpltCh1\000"
.LASF114:
	.ascii	"DAC_DMAHalfConvCpltCh2\000"
.LASF140:
	.ascii	"Amplitude\000"
.LASF129:
	.ascii	"oldmodeconfiguration\000"
.LASF38:
	.ascii	"double\000"
.LASF78:
	.ascii	"StreamBaseAddress\000"
.LASF131:
	.ascii	"HAL_DACEx_ErrorCallbackCh2\000"
.LASF98:
	.ascii	"DAC_RefreshTime\000"
.LASF70:
	.ascii	"Parent\000"
.LASF26:
	.ascii	"SHRR\000"
.LASF68:
	.ascii	"Lock\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF53:
	.ascii	"Mode\000"
.LASF48:
	.ascii	"Direction\000"
.LASF83:
	.ascii	"DMAmuxRequestGen\000"
.LASF42:
	.ascii	"HAL_TIMEOUT\000"
.LASF93:
	.ascii	"DMA_Handle1\000"
.LASF94:
	.ascii	"DMA_Handle2\000"
.LASF92:
	.ascii	"HAL_DAC_StateTypeDef\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF60:
	.ascii	"HAL_DMA_STATE_RESET\000"
.LASF153:
	.ascii	"SystemCoreClock\000"
.LASF80:
	.ascii	"DMAmuxChannel\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF79:
	.ascii	"StreamIndex\000"
.LASF39:
	.ascii	"HAL_OK\000"
.LASF138:
	.ascii	"data\000"
.LASF103:
	.ascii	"DAC_ConnectOnChipPeripheral\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF123:
	.ascii	"NewTrimmingValue\000"
.LASF137:
	.ascii	"Data2\000"
.LASF150:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF64:
	.ascii	"HAL_DMA_STATE_ABORT\000"
.LASF77:
	.ascii	"ErrorCode\000"
.LASF52:
	.ascii	"MemDataAlignment\000"
.LASF33:
	.ascii	"RGCFR\000"
.LASF128:
	.ascii	"wait_loop_index\000"
.LASF132:
	.ascii	"HAL_DACEx_ConvHalfCpltCallbackCh2\000"
.LASF43:
	.ascii	"HAL_StatusTypeDef\000"
.LASF143:
	.ascii	"HAL_DACEx_DualStart_DMA\000"
.LASF108:
	.ascii	"HAL_DMA_Abort\000"
.LASF141:
	.ascii	"HAL_DACEx_TriangleWaveGenerate\000"
.LASF0:
	.ascii	"short int\000"
.LASF12:
	.ascii	"DHR12R1\000"
.LASF91:
	.ascii	"HAL_DAC_STATE_ERROR\000"
.LASF67:
	.ascii	"Init\000"
.LASF115:
	.ascii	"hdma\000"
.LASF101:
	.ascii	"DAC_Trigger\000"
.LASF45:
	.ascii	"HAL_LOCKED\000"
.LASF86:
	.ascii	"DMA_HandleTypeDef\000"
.LASF75:
	.ascii	"XferErrorCallback\000"
.LASF23:
	.ascii	"SHSR1\000"
.LASF24:
	.ascii	"SHSR2\000"
.LASF87:
	.ascii	"HAL_DAC_STATE_RESET\000"
.LASF31:
	.ascii	"DMAMUX_RequestGen_TypeDef\000"
.LASF30:
	.ascii	"RGCR\000"
.LASF21:
	.ascii	"DOR1\000"
.LASF22:
	.ascii	"DOR2\000"
.LASF37:
	.ascii	"float\000"
.LASF112:
	.ascii	"DAC_DMAConvCpltCh1\000"
.LASF117:
	.ascii	"DAC_DMAConvCpltCh2\000"
.LASF66:
	.ascii	"Instance\000"
.LASF149:
	.ascii	"tmp_swtrig\000"
.LASF107:
	.ascii	"DAC_ChannelConfTypeDef\000"
.LASF74:
	.ascii	"XferM1HalfCpltCallback\000"
.LASF120:
	.ascii	"Channel\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF110:
	.ascii	"DAC_DMAErrorCh1\000"
.LASF113:
	.ascii	"DAC_DMAErrorCh2\000"
.LASF104:
	.ascii	"DAC_UserTrimming\000"
.LASF65:
	.ascii	"HAL_DMA_StateTypeDef\000"
.LASF84:
	.ascii	"DMAmuxRequestGenStatus\000"
.LASF62:
	.ascii	"HAL_DMA_STATE_BUSY\000"
.LASF95:
	.ascii	"DAC_HandleTypeDef\000"
.LASF50:
	.ascii	"MemInc\000"
.LASF32:
	.ascii	"RGSR\000"
.LASF88:
	.ascii	"HAL_DAC_STATE_READY\000"
.LASF14:
	.ascii	"DHR8R1\000"
.LASF17:
	.ascii	"DHR8R2\000"
.LASF154:
	.ascii	"__DMA_HandleTypeDef\000"
.LASF139:
	.ascii	"HAL_DACEx_NoiseWaveGenerate\000"
.LASF15:
	.ascii	"DHR12R2\000"
.LASF55:
	.ascii	"FIFOMode\000"
.LASF40:
	.ascii	"HAL_ERROR\000"
.LASF20:
	.ascii	"DHR8RD\000"
.LASF118:
	.ascii	"HAL_DACEx_DualGetValue\000"
.LASF35:
	.ascii	"long double\000"
.LASF56:
	.ascii	"FIFOThreshold\000"
.LASF36:
	.ascii	"char\000"
.LASF47:
	.ascii	"Request\000"
.LASF69:
	.ascii	"State\000"
.LASF18:
	.ascii	"DHR12RD\000"
.LASF119:
	.ascii	"HAL_DACEx_GetTrimOffset\000"
.LASF135:
	.ascii	"Alignment\000"
.LASF145:
	.ascii	"Length\000"
.LASF51:
	.ascii	"PeriphDataAlignment\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF28:
	.ascii	"DMAMUX_Channel_TypeDef\000"
.LASF122:
	.ascii	"sConfig\000"
.LASF124:
	.ascii	"status\000"
.LASF11:
	.ascii	"SWTRIGR\000"
.LASF99:
	.ascii	"DAC_SampleAndHoldConfTypeDef\000"
.LASF106:
	.ascii	"DAC_SampleAndHoldConfig\000"
.LASF54:
	.ascii	"Priority\000"
.LASF116:
	.ascii	"hdac\000"
.LASF89:
	.ascii	"HAL_DAC_STATE_BUSY\000"
.LASF152:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF148:
	.ascii	"HAL_DACEx_DualStart\000"
.LASF105:
	.ascii	"DAC_TrimmingValue\000"
.LASF63:
	.ascii	"HAL_DMA_STATE_ERROR\000"
.LASF13:
	.ascii	"DHR12L1\000"
.LASF16:
	.ascii	"DHR12L2\000"
.LASF25:
	.ascii	"SHHR\000"
.LASF44:
	.ascii	"HAL_UNLOCKED\000"
.LASF27:
	.ascii	"DAC_TypeDef\000"
.LASF41:
	.ascii	"HAL_BUSY\000"
.LASF147:
	.ascii	"HAL_DACEx_DualStop\000"
.LASF76:
	.ascii	"XferAbortCallback\000"
.LASF19:
	.ascii	"DHR12LD\000"
.LASF34:
	.ascii	"DMAMUX_RequestGenStatus_TypeDef\000"
.LASF71:
	.ascii	"XferCpltCallback\000"
.LASF58:
	.ascii	"PeriphBurst\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
