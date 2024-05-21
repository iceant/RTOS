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
	.file	"stm32h7xx_hal_dma2d.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_dma2d.c"
	.section	.text.DMA2D_SetConfig,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	DMA2D_SetConfig, %function
DMA2D_SetConfig:
.LFB366:
	.loc 1 2106 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	push	{r4, r5}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
	.loc 1 2107 3
	.loc 1 2108 3
	.loc 1 2109 3
	.loc 1 2110 3
	.loc 1 2111 3
	.loc 1 2114 3
	.loc 1 2114 44 is_stmt 0
	ldr	r5, [r0]
	.loc 1 2114 54
	ldr	r4, [r5, #68]
	.loc 1 2114 63
	and	ip, r4, #-1073741824
	.loc 1 2114 125
	ldr	r4, [sp, #8]
	orr	r4, r4, r3, lsl #16
	.loc 1 2114 114
	orr	r4, ip, r4
	.loc 1 2114 30
	str	r4, [r5, #68]
	.loc 1 2117 3 is_stmt 1
	.loc 1 2117 11 is_stmt 0
	ldr	r3, [r0]
.LVL1:
	.loc 1 2117 29
	str	r2, [r3, #60]
	.loc 1 2120 3 is_stmt 1
	.loc 1 2120 19 is_stmt 0
	ldr	r3, [r0, #4]
	.loc 1 2120 6
	cmp	r3, #196608
	beq	.L10
	.loc 1 2162 8 is_stmt 1
	.loc 1 2162 11 is_stmt 0
	cmp	r3, #262144
	beq	.L11
	.loc 1 2169 5 is_stmt 1
	.loc 1 2169 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 2169 32
	str	r1, [r3, #12]
.LVL2:
.L1:
	.loc 1 2171 1
	pop	{r4, r5}
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL3:
	bx	lr
.LVL4:
.L10:
	.cfi_restore_state
	.loc 1 2122 5 is_stmt 1
	.loc 1 2122 10 is_stmt 0
	and	ip, r1, #-16777216
.LVL5:
	.loc 1 2123 5 is_stmt 1
	.loc 1 2123 10 is_stmt 0
	and	r3, r1, #16711680
.LVL6:
	.loc 1 2124 5 is_stmt 1
	.loc 1 2124 10 is_stmt 0
	and	r5, r1, #65280
.LVL7:
	.loc 1 2125 5 is_stmt 1
	.loc 1 2125 10 is_stmt 0
	uxtb	r2, r1
.LVL8:
	.loc 1 2128 5 is_stmt 1
	.loc 1 2128 21 is_stmt 0
	ldr	r4, [r0, #8]
	.loc 1 2128 8
	cbz	r4, .L3
	.loc 1 2132 10 is_stmt 1
	.loc 1 2132 13 is_stmt 0
	cmp	r4, #1
	beq	.L12
	.loc 1 2136 10 is_stmt 1
	.loc 1 2136 13 is_stmt 0
	cmp	r4, #2
	beq	.L13
	.loc 1 2143 10 is_stmt 1
	.loc 1 2143 13 is_stmt 0
	cmp	r4, #3
	beq	.L14
	.loc 1 2153 7 is_stmt 1
	.loc 1 2153 12 is_stmt 0
	lsr	ip, ip, #28
.LVL9:
	.loc 1 2154 7 is_stmt 1
	.loc 1 2154 12 is_stmt 0
	lsrs	r3, r3, #20
.LVL10:
	.loc 1 2155 7 is_stmt 1
	.loc 1 2155 12 is_stmt 0
	lsrs	r5, r5, #12
.LVL11:
	.loc 1 2156 7 is_stmt 1
	.loc 1 2157 7
	.loc 1 2157 35 is_stmt 0
	lsls	r3, r3, #8
.LVL12:
	.loc 1 2157 27
	orr	r3, r3, r5, lsl #4
	.loc 1 2157 42
	orr	r3, r3, ip, lsl #12
	.loc 1 2157 11
	orr	r1, r3, r2, lsr #4
.LVL13:
	b	.L3
.LVL14:
.L12:
	.loc 1 2134 7 is_stmt 1
	.loc 1 2134 11 is_stmt 0
	bic	r1, r1, #-16777216
.LVL15:
.L3:
	.loc 1 2160 5 is_stmt 1
	.loc 1 2160 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 2160 32
	str	r1, [r3, #56]
	b	.L1
.LVL16:
.L13:
	.loc 1 2138 7 is_stmt 1
	.loc 1 2138 12 is_stmt 0
	lsrs	r3, r3, #19
.LVL17:
	.loc 1 2139 7 is_stmt 1
	.loc 1 2139 12 is_stmt 0
	lsrs	r5, r5, #10
.LVL18:
	.loc 1 2140 7 is_stmt 1
	.loc 1 2141 7
	.loc 1 2141 35 is_stmt 0
	lsls	r3, r3, #11
.LVL19:
	.loc 1 2141 27
	orr	r3, r3, r5, lsl #5
	.loc 1 2141 11
	orr	r1, r3, r2, lsr #3
.LVL20:
	b	.L3
.LVL21:
.L14:
	.loc 1 2145 7 is_stmt 1
	.loc 1 2145 12 is_stmt 0
	lsr	ip, ip, #31
.LVL22:
	.loc 1 2146 7 is_stmt 1
	.loc 1 2146 12 is_stmt 0
	lsrs	r3, r3, #19
.LVL23:
	.loc 1 2147 7 is_stmt 1
	.loc 1 2147 12 is_stmt 0
	lsrs	r5, r5, #11
.LVL24:
	.loc 1 2148 7 is_stmt 1
	.loc 1 2149 7
	.loc 1 2149 35 is_stmt 0
	lsls	r3, r3, #10
.LVL25:
	.loc 1 2149 27
	orr	r3, r3, r5, lsl #5
	.loc 1 2149 43
	orr	r3, r3, ip, lsl #15
	.loc 1 2149 11
	orr	r1, r3, r2, lsr #3
.LVL26:
	b	.L3
.LVL27:
.L11:
	.loc 1 2164 5 is_stmt 1
	.loc 1 2164 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 2164 32
	str	r1, [r3, #20]
	b	.L1
	.cfi_endproc
.LFE366:
	.size	DMA2D_SetConfig, .-DMA2D_SetConfig
	.section	.text.HAL_DMA2D_MspInit,"ax",%progbits
	.align	1
	.weak	HAL_DMA2D_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_MspInit, %function
HAL_DMA2D_MspInit:
.LFB337:
	.loc 1 406 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL28:
	.loc 1 408 3
	.loc 1 413 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_DMA2D_MspInit, .-HAL_DMA2D_MspInit
	.section	.text.HAL_DMA2D_Init,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_Init, %function
HAL_DMA2D_Init:
.LFB335:
	.loc 1 239 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL29:
	.loc 1 241 3
	.loc 1 241 6 is_stmt 0
	cmp	r0, #0
	beq	.L19
	.loc 1 239 1
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 247 3 is_stmt 1
	.loc 1 248 3
	.loc 1 249 3
	.loc 1 250 3
	.loc 1 251 3
	.loc 1 252 3
	.loc 1 253 3
	.loc 1 254 3
	.loc 1 271 3
	.loc 1 271 13 is_stmt 0
	ldrb	r3, [r0, #97]	@ zero_extendqisi2
	.loc 1 271 6
	cmp	r3, #0
	beq	.L24
.LVL30:
.L18:
	.loc 1 281 3 is_stmt 1
	.loc 1 281 17 is_stmt 0
	movs	r3, #2
	strb	r3, [r4, #97]
	.loc 1 284 3 is_stmt 1
	.loc 1 284 43 is_stmt 0
	ldr	r1, [r4]
	.loc 1 284 53
	ldr	r2, [r1]
	.loc 1 284 61
	ldr	r3, .L25
	ands	r3, r3, r2
	.loc 1 284 119
	ldr	r2, [r4, #4]
	.loc 1 284 139
	ldr	r0, [r4, #28]
	.loc 1 284 125
	orrs	r2, r2, r0
	.loc 1 284 104
	orrs	r3, r3, r2
	.loc 1 284 29
	str	r3, [r1]
	.loc 1 287 3 is_stmt 1
	.loc 1 287 47 is_stmt 0
	ldr	r1, [r4]
	.loc 1 287 57
	ldr	r2, [r1, #52]
	.loc 1 287 69
	ldr	r3, .L25+4
	ands	r3, r3, r2
	.loc 1 287 126
	ldr	r2, [r4, #8]
	.loc 1 287 151
	ldr	r0, [r4, #24]
	.loc 1 287 137
	orrs	r2, r2, r0
	.loc 1 287 111
	orrs	r3, r3, r2
	.loc 1 287 33
	str	r3, [r1, #52]
	.loc 1 291 3 is_stmt 1
	.loc 1 291 44 is_stmt 0
	ldr	r2, [r4]
	.loc 1 291 54
	ldr	r1, [r2, #64]
	.loc 1 291 63
	ldr	r3, .L25+8
	ands	r3, r3, r1
	.loc 1 291 105
	ldr	r1, [r4, #12]
	.loc 1 291 90
	orrs	r3, r3, r1
	.loc 1 291 30
	str	r3, [r2, #64]
	.loc 1 293 3 is_stmt 1
	.loc 1 293 47 is_stmt 0
	ldr	r1, [r4]
	.loc 1 293 57
	ldr	r3, [r1, #52]
	.loc 1 293 69
	bic	r3, r3, #3145728
	.loc 1 293 132
	ldr	r0, [r4, #16]
	.loc 1 293 172
	ldr	r2, [r4, #20]
	.loc 1 293 185
	lsls	r2, r2, #21
	.loc 1 293 157
	orr	r2, r2, r0, lsl #20
	.loc 1 293 115
	orrs	r3, r3, r2
	.loc 1 293 33
	str	r3, [r1, #52]
	.loc 1 299 3 is_stmt 1
	.loc 1 299 21 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #100]
	.loc 1 302 3 is_stmt 1
	.loc 1 302 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #97]
	.loc 1 304 3 is_stmt 1
	.loc 1 305 1 is_stmt 0
	pop	{r4, pc}
.LVL31:
.L24:
	.loc 1 274 5 is_stmt 1
	.loc 1 274 18 is_stmt 0
	strb	r3, [r0, #96]
	.loc 1 276 5 is_stmt 1
	bl	HAL_DMA2D_MspInit
.LVL32:
	b	.L18
.LVL33:
.L19:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 243 12 is_stmt 0
	movs	r0, #1
.LVL34:
	.loc 1 305 1
	bx	lr
.L26:
	.align	2
.L25:
	.word	-458817
	.word	-264
	.word	-65536
	.cfi_endproc
.LFE335:
	.size	HAL_DMA2D_Init, .-HAL_DMA2D_Init
	.section	.text.HAL_DMA2D_MspDeInit,"ax",%progbits
	.align	1
	.weak	HAL_DMA2D_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_MspDeInit, %function
HAL_DMA2D_MspDeInit:
.LFB338:
	.loc 1 422 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL35:
	.loc 1 424 3
	.loc 1 429 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE338:
	.size	HAL_DMA2D_MspDeInit, .-HAL_DMA2D_MspDeInit
	.section	.text.HAL_DMA2D_Start,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_Start
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_Start, %function
HAL_DMA2D_Start:
.LFB339:
	.loc 1 679 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL36:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	mov	r4, r0
	.loc 1 681 3
	.loc 1 682 3
	.loc 1 685 3
	.loc 1 685 7
	.loc 1 685 18 is_stmt 0
	ldrb	r0, [r0, #96]	@ zero_extendqisi2
.LVL37:
	.loc 1 685 9
	cmp	r0, #1
	beq	.L30
	.loc 1 685 68 is_stmt 1 discriminator 2
	.loc 1 685 83 is_stmt 0 discriminator 2
	movs	r0, #1
	strb	r0, [r4, #96]
	.loc 1 685 5 is_stmt 1 discriminator 2
	.loc 1 688 3 discriminator 2
	.loc 1 688 17 is_stmt 0 discriminator 2
	movs	r0, #2
	strb	r0, [r4, #97]
	.loc 1 691 3 is_stmt 1 discriminator 2
	ldr	r0, [sp, #16]
	str	r0, [sp]
	mov	r0, r4
	bl	DMA2D_SetConfig
.LVL38:
	.loc 1 694 3 discriminator 2
	.loc 1 694 12 is_stmt 0 discriminator 2
	ldr	r2, [r4]
	.loc 1 694 22 discriminator 2
	ldr	r3, [r2]
	.loc 1 694 27 discriminator 2
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 696 3 is_stmt 1 discriminator 2
	.loc 1 696 10 is_stmt 0 discriminator 2
	movs	r0, #0
.L29:
	.loc 1 697 1
	add	sp, sp, #8
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
.LVL39:
.L30:
	.cfi_restore_state
	.loc 1 685 49
	movs	r0, #2
	b	.L29
	.cfi_endproc
.LFE339:
	.size	HAL_DMA2D_Start, .-HAL_DMA2D_Start
	.section	.text.HAL_DMA2D_Start_IT,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_Start_IT, %function
HAL_DMA2D_Start_IT:
.LFB340:
	.loc 1 715 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL40:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	mov	r4, r0
	.loc 1 717 3
	.loc 1 718 3
	.loc 1 721 3
	.loc 1 721 7
	.loc 1 721 18 is_stmt 0
	ldrb	r0, [r0, #96]	@ zero_extendqisi2
.LVL41:
	.loc 1 721 9
	cmp	r0, #1
	beq	.L34
	.loc 1 721 68 is_stmt 1 discriminator 2
	.loc 1 721 83 is_stmt 0 discriminator 2
	movs	r0, #1
	strb	r0, [r4, #96]
	.loc 1 721 5 is_stmt 1 discriminator 2
	.loc 1 724 3 discriminator 2
	.loc 1 724 17 is_stmt 0 discriminator 2
	movs	r0, #2
	strb	r0, [r4, #97]
	.loc 1 727 3 is_stmt 1 discriminator 2
	ldr	r0, [sp, #16]
	str	r0, [sp]
	mov	r0, r4
	bl	DMA2D_SetConfig
.LVL42:
	.loc 1 730 3 discriminator 2
	.loc 1 730 12 is_stmt 0 discriminator 2
	ldr	r2, [r4]
	.loc 1 730 22 discriminator 2
	ldr	r3, [r2]
	.loc 1 730 27 discriminator 2
	orr	r3, r3, #8960
	str	r3, [r2]
	.loc 1 733 3 is_stmt 1 discriminator 2
	.loc 1 733 12 is_stmt 0 discriminator 2
	ldr	r2, [r4]
	.loc 1 733 22 discriminator 2
	ldr	r3, [r2]
	.loc 1 733 27 discriminator 2
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 735 3 is_stmt 1 discriminator 2
	.loc 1 735 10 is_stmt 0 discriminator 2
	movs	r0, #0
.L33:
	.loc 1 736 1
	add	sp, sp, #8
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
.LVL43:
.L34:
	.cfi_restore_state
	.loc 1 721 49
	movs	r0, #2
	b	.L33
	.cfi_endproc
.LFE340:
	.size	HAL_DMA2D_Start_IT, .-HAL_DMA2D_Start_IT
	.section	.text.HAL_DMA2D_BlendingStart,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_BlendingStart
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_BlendingStart, %function
HAL_DMA2D_BlendingStart:
.LFB341:
	.loc 1 752 1 is_stmt 1
	.cfi_startproc
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL44:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	mov	r4, r0
	mov	r0, r2
.LVL45:
	mov	r2, r3
.LVL46:
	.loc 1 754 3
	.loc 1 755 3
	.loc 1 758 3
	.loc 1 758 7
	.loc 1 758 18 is_stmt 0
	ldrb	r3, [r4, #96]	@ zero_extendqisi2
.LVL47:
	.loc 1 758 9
	cmp	r3, #1
	beq	.L41
	.loc 1 758 68 is_stmt 1 discriminator 2
	.loc 1 758 83 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r4, #96]
	.loc 1 758 5 is_stmt 1 discriminator 2
	.loc 1 761 3 discriminator 2
	.loc 1 761 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r4, #97]
	.loc 1 763 3 is_stmt 1 discriminator 2
	.loc 1 763 19 is_stmt 0 discriminator 2
	ldr	r3, [r4, #4]
	.loc 1 763 6 discriminator 2
	cmp	r3, #262144
	beq	.L43
	.loc 1 770 8 is_stmt 1
	.loc 1 770 11 is_stmt 0
	cmp	r3, #327680
	beq	.L44
	.loc 1 780 5 is_stmt 1
	.loc 1 780 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 780 32
	str	r0, [r3, #20]
	.loc 1 783 5 is_stmt 1
	ldr	r3, [sp, #20]
	str	r3, [sp]
	ldr	r3, [sp, #16]
	mov	r0, r4
.LVL48:
	bl	DMA2D_SetConfig
.LVL49:
.L39:
	.loc 1 787 3
	.loc 1 787 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 787 22
	ldr	r3, [r2]
	.loc 1 787 27
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 789 3 is_stmt 1
	.loc 1 789 10 is_stmt 0
	movs	r0, #0
.L37:
	.loc 1 790 1
	add	sp, sp, #8
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
.LVL50:
.L43:
	.cfi_restore_state
	.loc 1 766 5 is_stmt 1
	.loc 1 766 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 766 33
	str	r1, [r3, #32]
	.loc 1 768 5 is_stmt 1
	ldr	r3, [sp, #20]
	str	r3, [sp]
	ldr	r3, [sp, #16]
	mov	r1, r0
.LVL51:
	mov	r0, r4
.LVL52:
	bl	DMA2D_SetConfig
.LVL53:
	b	.L39
.LVL54:
.L44:
	.loc 1 773 5
	.loc 1 773 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 773 33
	str	r0, [r3, #40]
	.loc 1 775 5 is_stmt 1
	ldr	r3, [sp, #20]
	str	r3, [sp]
	ldr	r3, [sp, #16]
	mov	r0, r4
.LVL55:
	bl	DMA2D_SetConfig
.LVL56:
	b	.L39
.LVL57:
.L41:
	.loc 1 758 49 is_stmt 0
	movs	r0, #2
.LVL58:
	b	.L37
	.cfi_endproc
.LFE341:
	.size	HAL_DMA2D_BlendingStart, .-HAL_DMA2D_BlendingStart
	.section	.text.HAL_DMA2D_BlendingStart_IT,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_BlendingStart_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_BlendingStart_IT, %function
HAL_DMA2D_BlendingStart_IT:
.LFB342:
	.loc 1 806 1 is_stmt 1
	.cfi_startproc
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL59:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	mov	r4, r0
	mov	r0, r2
.LVL60:
	mov	r2, r3
.LVL61:
	.loc 1 808 3
	.loc 1 809 3
	.loc 1 812 3
	.loc 1 812 7
	.loc 1 812 18 is_stmt 0
	ldrb	r3, [r4, #96]	@ zero_extendqisi2
.LVL62:
	.loc 1 812 9
	cmp	r3, #1
	beq	.L50
	.loc 1 812 68 is_stmt 1 discriminator 2
	.loc 1 812 83 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r4, #96]
	.loc 1 812 5 is_stmt 1 discriminator 2
	.loc 1 815 3 discriminator 2
	.loc 1 815 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r4, #97]
	.loc 1 817 3 is_stmt 1 discriminator 2
	.loc 1 817 19 is_stmt 0 discriminator 2
	ldr	r3, [r4, #4]
	.loc 1 817 6 discriminator 2
	cmp	r3, #262144
	beq	.L52
	.loc 1 824 8 is_stmt 1
	.loc 1 824 11 is_stmt 0
	cmp	r3, #327680
	beq	.L53
	.loc 1 833 5 is_stmt 1
	.loc 1 833 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 833 32
	str	r0, [r3, #20]
	.loc 1 836 5 is_stmt 1
	ldr	r3, [sp, #20]
	str	r3, [sp]
	ldr	r3, [sp, #16]
	mov	r0, r4
.LVL63:
	bl	DMA2D_SetConfig
.LVL64:
.L48:
	.loc 1 840 3
	.loc 1 840 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 840 22
	ldr	r3, [r2]
	.loc 1 840 27
	orr	r3, r3, #8960
	str	r3, [r2]
	.loc 1 843 3 is_stmt 1
	.loc 1 843 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 843 22
	ldr	r3, [r2]
	.loc 1 843 27
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 845 3 is_stmt 1
	.loc 1 845 10 is_stmt 0
	movs	r0, #0
.L46:
	.loc 1 846 1
	add	sp, sp, #8
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
.LVL65:
.L52:
	.cfi_restore_state
	.loc 1 820 5 is_stmt 1
	.loc 1 820 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 820 33
	str	r1, [r3, #32]
	.loc 1 822 5 is_stmt 1
	ldr	r3, [sp, #20]
	str	r3, [sp]
	ldr	r3, [sp, #16]
	mov	r1, r0
.LVL66:
	mov	r0, r4
.LVL67:
	bl	DMA2D_SetConfig
.LVL68:
	b	.L48
.LVL69:
.L53:
	.loc 1 827 5
	.loc 1 827 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 827 33
	str	r0, [r3, #40]
	.loc 1 829 5 is_stmt 1
	ldr	r3, [sp, #20]
	str	r3, [sp]
	ldr	r3, [sp, #16]
	mov	r0, r4
.LVL70:
	bl	DMA2D_SetConfig
.LVL71:
	b	.L48
.LVL72:
.L50:
	.loc 1 812 49 is_stmt 0
	movs	r0, #2
.LVL73:
	b	.L46
	.cfi_endproc
.LFE342:
	.size	HAL_DMA2D_BlendingStart_IT, .-HAL_DMA2D_BlendingStart_IT
	.section	.text.HAL_DMA2D_Abort,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_Abort
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_Abort, %function
HAL_DMA2D_Abort:
.LFB343:
	.loc 1 855 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL74:
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 856 3
	.loc 1 862 3
	.loc 1 862 43 is_stmt 0
	ldr	r2, [r0]
	.loc 1 862 53
	ldr	r3, [r2]
	.loc 1 862 61
	bic	r3, r3, #5
	.loc 1 862 103
	orr	r3, r3, #4
	.loc 1 862 29
	str	r3, [r2]
	.loc 1 865 3 is_stmt 1
	.loc 1 865 15 is_stmt 0
	bl	HAL_GetTick
.LVL75:
	mov	r5, r0
.LVL76:
	.loc 1 868 3 is_stmt 1
.L55:
	.loc 1 868 51
	.loc 1 868 17 is_stmt 0
	ldr	r3, [r4]
	.loc 1 868 27
	ldr	r2, [r3]
	.loc 1 868 51
	tst	r2, #1
	beq	.L59
	.loc 1 870 5 is_stmt 1
	.loc 1 870 10 is_stmt 0
	bl	HAL_GetTick
.LVL77:
	.loc 1 870 24
	subs	r0, r0, r5
	.loc 1 870 8
	cmp	r0, #1000
	bls	.L55
	.loc 1 873 7 is_stmt 1
	.loc 1 873 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 873 25
	orr	r3, r3, #32
	str	r3, [r4, #100]
	.loc 1 876 7 is_stmt 1
	.loc 1 876 21 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #97]
	.loc 1 879 7 is_stmt 1
	.loc 1 879 11
	.loc 1 879 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #96]
	.loc 1 879 9 is_stmt 1
	.loc 1 881 7
	.loc 1 881 14 is_stmt 0
	b	.L56
.L59:
	.loc 1 886 3 is_stmt 1
	.loc 1 886 22 is_stmt 0
	ldr	r2, [r3]
	.loc 1 886 27
	bic	r2, r2, #8960
	str	r2, [r3]
	.loc 1 889 3 is_stmt 1
	.loc 1 889 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #97]
	.loc 1 892 3 is_stmt 1
	.loc 1 892 7
	.loc 1 892 22 is_stmt 0
	movs	r0, #0
	strb	r0, [r4, #96]
	.loc 1 892 5 is_stmt 1
	.loc 1 894 3
.L56:
	.loc 1 895 1 is_stmt 0
	pop	{r3, r4, r5, pc}
	.cfi_endproc
.LFE343:
	.size	HAL_DMA2D_Abort, .-HAL_DMA2D_Abort
	.section	.text.HAL_DMA2D_Suspend,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_Suspend
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_Suspend, %function
HAL_DMA2D_Suspend:
.LFB344:
	.loc 1 904 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL78:
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 905 3
	.loc 1 911 3
	.loc 1 911 43 is_stmt 0
	ldr	r2, [r0]
	.loc 1 911 53
	ldr	r3, [r2]
	.loc 1 911 61
	bic	r3, r3, #3
	.loc 1 911 103
	orr	r3, r3, #2
	.loc 1 911 29
	str	r3, [r2]
	.loc 1 914 3 is_stmt 1
	.loc 1 914 15 is_stmt 0
	bl	HAL_GetTick
.LVL79:
	mov	r5, r0
.LVL80:
	.loc 1 917 3 is_stmt 1
.L61:
	.loc 1 917 71
	.loc 1 917 17 is_stmt 0
	ldr	r2, [r4]
	.loc 1 917 27
	ldr	r3, [r2]
	.loc 1 917 32
	and	r3, r3, #3
	.loc 1 917 71
	cmp	r3, #1
	bne	.L66
	.loc 1 919 5 is_stmt 1
	.loc 1 919 10 is_stmt 0
	bl	HAL_GetTick
.LVL81:
	.loc 1 919 24
	subs	r0, r0, r5
	.loc 1 919 8
	cmp	r0, #1000
	bls	.L61
	.loc 1 922 7 is_stmt 1
	.loc 1 922 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 922 25
	orr	r3, r3, #32
	str	r3, [r4, #100]
	.loc 1 925 7 is_stmt 1
	.loc 1 925 21 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #97]
	.loc 1 927 7 is_stmt 1
.L62:
	.loc 1 944 1 is_stmt 0
	pop	{r3, r4, r5, pc}
.LVL82:
.L66:
	.loc 1 932 3 is_stmt 1
	.loc 1 932 24 is_stmt 0
	ldr	r3, [r2]
	.loc 1 932 6
	tst	r3, #1
	beq	.L64
	.loc 1 934 5 is_stmt 1
	.loc 1 934 19 is_stmt 0
	movs	r3, #5
	strb	r3, [r4, #97]
	.loc 1 943 10
	movs	r0, #0
	b	.L62
.L64:
	.loc 1 940 5 is_stmt 1
	.loc 1 940 23 is_stmt 0
	ldr	r3, [r2]
	.loc 1 940 29
	bic	r3, r3, #2
	str	r3, [r2]
	.loc 1 943 10
	movs	r0, #0
	b	.L62
	.cfi_endproc
.LFE344:
	.size	HAL_DMA2D_Suspend, .-HAL_DMA2D_Suspend
	.section	.text.HAL_DMA2D_Resume,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_Resume
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_Resume, %function
HAL_DMA2D_Resume:
.LFB345:
	.loc 1 953 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL83:
	.loc 1 955 3
	.loc 1 955 14 is_stmt 0
	ldr	r3, [r0]
	.loc 1 955 24
	ldr	r2, [r3]
	.loc 1 955 29
	and	r2, r2, #3
	.loc 1 955 6
	cmp	r2, #3
	beq	.L69
.L68:
	.loc 1 965 3 is_stmt 1
	.loc 1 965 21 is_stmt 0
	ldr	r2, [r3]
	.loc 1 965 27
	bic	r2, r2, #3
	str	r2, [r3]
	.loc 1 967 3 is_stmt 1
	.loc 1 968 1 is_stmt 0
	movs	r0, #0
.LVL84:
	bx	lr
.LVL85:
.L69:
	.loc 1 958 5 is_stmt 1
	.loc 1 958 19 is_stmt 0
	movs	r2, #2
	strb	r2, [r0, #97]
	b	.L68
	.cfi_endproc
.LFE345:
	.size	HAL_DMA2D_Resume, .-HAL_DMA2D_Resume
	.section	.text.HAL_DMA2D_EnableCLUT,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_EnableCLUT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_EnableCLUT, %function
HAL_DMA2D_EnableCLUT:
.LFB346:
	.loc 1 981 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL86:
	.loc 1 983 3
	.loc 1 986 3
	.loc 1 986 7
	.loc 1 986 18 is_stmt 0
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	.loc 1 986 9
	cmp	r3, #1
	beq	.L73
	.loc 1 986 68 is_stmt 1 discriminator 2
	.loc 1 986 83 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #96]
	.loc 1 986 5 is_stmt 1 discriminator 2
	.loc 1 989 3 discriminator 2
	.loc 1 989 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #97]
	.loc 1 991 3 is_stmt 1 discriminator 2
	.loc 1 991 6 is_stmt 0 discriminator 2
	cbnz	r1, .L72
	.loc 1 994 5 is_stmt 1
	.loc 1 994 13 is_stmt 0
	ldr	r2, [r0]
	.loc 1 994 23
	ldr	r3, [r2, #36]
	.loc 1 994 34
	orr	r3, r3, #32
	str	r3, [r2, #36]
	.loc 1 1002 10
	movs	r0, #0
.LVL87:
	bx	lr
.LVL88:
.L72:
	.loc 1 999 5 is_stmt 1
	.loc 1 999 13 is_stmt 0
	ldr	r2, [r0]
	.loc 1 999 23
	ldr	r3, [r2, #28]
	.loc 1 999 34
	orr	r3, r3, #32
	str	r3, [r2, #28]
	.loc 1 1002 10
	movs	r0, #0
.LVL89:
	bx	lr
.LVL90:
.L73:
	.loc 1 986 49
	movs	r0, #2
.LVL91:
	.loc 1 1003 1
	bx	lr
	.cfi_endproc
.LFE346:
	.size	HAL_DMA2D_EnableCLUT, .-HAL_DMA2D_EnableCLUT
	.section	.text.HAL_DMA2D_CLUTStartLoad,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_CLUTStartLoad
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_CLUTStartLoad, %function
HAL_DMA2D_CLUTStartLoad:
.LFB347:
	.loc 1 1017 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL92:
	.loc 1 1019 3
	.loc 1 1020 3
	.loc 1 1021 3
	.loc 1 1024 3
	.loc 1 1024 7
	.loc 1 1024 18 is_stmt 0
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	.loc 1 1024 9
	cmp	r3, #1
	beq	.L77
	.loc 1 1017 1 discriminator 2
	push	{r4, r5}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
	.loc 1 1024 68 is_stmt 1 discriminator 2
	.loc 1 1024 83 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #96]
	.loc 1 1024 5 is_stmt 1 discriminator 2
	.loc 1 1027 3 discriminator 2
	.loc 1 1027 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #97]
	.loc 1 1030 3 is_stmt 1 discriminator 2
	.loc 1 1030 6 is_stmt 0 discriminator 2
	cbnz	r2, .L76
	.loc 1 1033 5 is_stmt 1
	.loc 1 1033 53 is_stmt 0
	ldr	r2, [r1]
.LVL93:
	.loc 1 1033 13
	ldr	r3, [r0]
	.loc 1 1033 33
	str	r2, [r3, #48]
	.loc 1 1036 5 is_stmt 1
	.loc 1 1036 50 is_stmt 0
	ldr	r4, [r0]
	.loc 1 1036 60
	ldr	r2, [r4, #36]
	.loc 1 1036 73
	ldr	r3, .L82
	ands	r3, r3, r2
	.loc 1 1036 130
	ldr	r5, [r1, #8]
	.loc 1 1036 156
	ldr	r2, [r1, #4]
	.loc 1 1036 172
	lsls	r2, r2, #4
	.loc 1 1036 146
	orr	r2, r2, r5, lsl #8
	.loc 1 1036 118
	orrs	r3, r3, r2
	.loc 1 1036 36
	str	r3, [r4, #36]
	.loc 1 1040 5 is_stmt 1
	.loc 1 1040 13 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1040 23
	ldr	r3, [r2, #36]
	.loc 1 1040 34
	orr	r3, r3, #32
	str	r3, [r2, #36]
	.loc 1 1056 10
	movs	r0, #0
.LVL94:
.L75:
	.loc 1 1057 1
	pop	{r4, r5}
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL95:
.L76:
	.cfi_restore_state
	.loc 1 1046 5 is_stmt 1
	.loc 1 1046 53 is_stmt 0
	ldr	r2, [r1]
.LVL96:
	.loc 1 1046 13
	ldr	r3, [r0]
	.loc 1 1046 33
	str	r2, [r3, #44]
	.loc 1 1049 5 is_stmt 1
	.loc 1 1049 50 is_stmt 0
	ldr	r4, [r0]
	.loc 1 1049 60
	ldr	r2, [r4, #28]
	.loc 1 1049 73
	ldr	r3, .L82
	ands	r3, r3, r2
	.loc 1 1049 130
	ldr	r5, [r1, #8]
	.loc 1 1049 156
	ldr	r2, [r1, #4]
	.loc 1 1049 172
	lsls	r2, r2, #4
	.loc 1 1049 146
	orr	r2, r2, r5, lsl #8
	.loc 1 1049 118
	orrs	r3, r3, r2
	.loc 1 1049 36
	str	r3, [r4, #28]
	.loc 1 1053 5 is_stmt 1
	.loc 1 1053 13 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1053 23
	ldr	r3, [r2, #28]
	.loc 1 1053 34
	orr	r3, r3, #32
	str	r3, [r2, #28]
	.loc 1 1056 10
	movs	r0, #0
.LVL97:
	b	.L75
.LVL98:
.L77:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.loc 1 1024 49
	movs	r0, #2
.LVL99:
	.loc 1 1057 1
	bx	lr
.L83:
	.align	2
.L82:
	.word	-65297
	.cfi_endproc
.LFE347:
	.size	HAL_DMA2D_CLUTStartLoad, .-HAL_DMA2D_CLUTStartLoad
	.section	.text.HAL_DMA2D_CLUTStartLoad_IT,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_CLUTStartLoad_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_CLUTStartLoad_IT, %function
HAL_DMA2D_CLUTStartLoad_IT:
.LFB348:
	.loc 1 1072 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL100:
	.loc 1 1074 3
	.loc 1 1075 3
	.loc 1 1076 3
	.loc 1 1079 3
	.loc 1 1079 7
	.loc 1 1079 18 is_stmt 0
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	.loc 1 1079 9
	cmp	r3, #1
	beq	.L87
	.loc 1 1072 1 discriminator 2
	push	{r4, r5}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
	.loc 1 1079 68 is_stmt 1 discriminator 2
	.loc 1 1079 83 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #96]
	.loc 1 1079 5 is_stmt 1 discriminator 2
	.loc 1 1082 3 discriminator 2
	.loc 1 1082 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #97]
	.loc 1 1085 3 is_stmt 1 discriminator 2
	.loc 1 1085 6 is_stmt 0 discriminator 2
	cbnz	r2, .L86
	.loc 1 1088 5 is_stmt 1
	.loc 1 1088 53 is_stmt 0
	ldr	r2, [r1]
.LVL101:
	.loc 1 1088 13
	ldr	r3, [r0]
	.loc 1 1088 33
	str	r2, [r3, #48]
	.loc 1 1091 5 is_stmt 1
	.loc 1 1091 50 is_stmt 0
	ldr	r4, [r0]
	.loc 1 1091 60
	ldr	r2, [r4, #36]
	.loc 1 1091 73
	ldr	r3, .L92
	ands	r3, r3, r2
	.loc 1 1091 130
	ldr	r5, [r1, #8]
	.loc 1 1091 156
	ldr	r2, [r1, #4]
	.loc 1 1091 172
	lsls	r2, r2, #4
	.loc 1 1091 146
	orr	r2, r2, r5, lsl #8
	.loc 1 1091 118
	orrs	r3, r3, r2
	.loc 1 1091 36
	str	r3, [r4, #36]
	.loc 1 1095 5 is_stmt 1
	.loc 1 1095 14 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1095 24
	ldr	r3, [r2]
	.loc 1 1095 29
	orr	r3, r3, #14592
	str	r3, [r2]
	.loc 1 1098 5 is_stmt 1
	.loc 1 1098 13 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1098 23
	ldr	r3, [r2, #36]
	.loc 1 1098 34
	orr	r3, r3, #32
	str	r3, [r2, #36]
	.loc 1 1117 10
	movs	r0, #0
.LVL102:
.L85:
	.loc 1 1118 1
	pop	{r4, r5}
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL103:
.L86:
	.cfi_restore_state
	.loc 1 1104 5 is_stmt 1
	.loc 1 1104 53 is_stmt 0
	ldr	r2, [r1]
.LVL104:
	.loc 1 1104 13
	ldr	r3, [r0]
	.loc 1 1104 33
	str	r2, [r3, #44]
	.loc 1 1107 5 is_stmt 1
	.loc 1 1107 50 is_stmt 0
	ldr	r4, [r0]
	.loc 1 1107 60
	ldr	r2, [r4, #28]
	.loc 1 1107 73
	ldr	r3, .L92
	ands	r3, r3, r2
	.loc 1 1107 130
	ldr	r5, [r1, #8]
	.loc 1 1107 156
	ldr	r2, [r1, #4]
	.loc 1 1107 172
	lsls	r2, r2, #4
	.loc 1 1107 146
	orr	r2, r2, r5, lsl #8
	.loc 1 1107 118
	orrs	r3, r3, r2
	.loc 1 1107 36
	str	r3, [r4, #28]
	.loc 1 1111 5 is_stmt 1
	.loc 1 1111 14 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1111 24
	ldr	r3, [r2]
	.loc 1 1111 29
	orr	r3, r3, #14592
	str	r3, [r2]
	.loc 1 1114 5 is_stmt 1
	.loc 1 1114 13 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1114 23
	ldr	r3, [r2, #28]
	.loc 1 1114 34
	orr	r3, r3, #32
	str	r3, [r2, #28]
	.loc 1 1117 10
	movs	r0, #0
.LVL105:
	b	.L85
.LVL106:
.L87:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.loc 1 1079 49
	movs	r0, #2
.LVL107:
	.loc 1 1118 1
	bx	lr
.L93:
	.align	2
.L92:
	.word	-65297
	.cfi_endproc
.LFE348:
	.size	HAL_DMA2D_CLUTStartLoad_IT, .-HAL_DMA2D_CLUTStartLoad_IT
	.section	.text.HAL_DMA2D_CLUTLoad,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_CLUTLoad
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_CLUTLoad, %function
HAL_DMA2D_CLUTLoad:
.LFB349:
	.loc 1 1135 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL108:
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	add	r4, sp, #16
	stmdb	r4, {r1, r2, r3}
	.loc 1 1137 3
	.loc 1 1138 3
	.loc 1 1139 3
	.loc 1 1142 3
	.loc 1 1142 7
	.loc 1 1142 18 is_stmt 0
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	.loc 1 1142 9
	cmp	r3, #1
	beq	.L97
	.loc 1 1142 68 is_stmt 1 discriminator 2
	.loc 1 1142 83 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #96]
	.loc 1 1142 5 is_stmt 1 discriminator 2
	.loc 1 1145 3 discriminator 2
	.loc 1 1145 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #97]
	.loc 1 1148 3 is_stmt 1 discriminator 2
	.loc 1 1148 6 is_stmt 0 discriminator 2
	ldr	r3, [sp, #24]
	cbnz	r3, .L96
	.loc 1 1151 5 is_stmt 1
	.loc 1 1151 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1151 33
	str	r1, [r3, #48]
	.loc 1 1154 5 is_stmt 1
	.loc 1 1154 50 is_stmt 0
	ldr	r1, [r0]
	.loc 1 1154 60
	ldr	r2, [r1, #36]
	.loc 1 1154 73
	ldr	r3, .L99
	ands	r3, r3, r2
	.loc 1 1154 155
	ldr	r2, [sp, #8]
	.loc 1 1154 170
	lsls	r2, r2, #4
	.loc 1 1154 145
	ldr	r4, [sp, #12]
	orr	r2, r2, r4, lsl #8
	.loc 1 1154 118
	orrs	r3, r3, r2
	.loc 1 1154 36
	str	r3, [r1, #36]
	.loc 1 1158 5 is_stmt 1
	.loc 1 1158 13 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1158 23
	ldr	r3, [r2, #36]
	.loc 1 1158 34
	orr	r3, r3, #32
	str	r3, [r2, #36]
	.loc 1 1174 10
	movs	r0, #0
.LVL109:
.L95:
	.loc 1 1175 1
	add	sp, sp, #20
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL110:
	bx	lr
.LVL111:
.L96:
	.cfi_restore_state
	.loc 1 1164 5 is_stmt 1
	.loc 1 1164 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1164 33
	ldr	r2, [sp, #4]
	str	r2, [r3, #44]
	.loc 1 1167 5 is_stmt 1
	.loc 1 1167 50 is_stmt 0
	ldr	r1, [r0]
	.loc 1 1167 60
	ldr	r2, [r1, #28]
	.loc 1 1167 73
	ldr	r3, .L99
	ands	r3, r3, r2
	.loc 1 1167 155
	ldr	r2, [sp, #8]
	.loc 1 1167 170
	lsls	r2, r2, #4
	.loc 1 1167 145
	ldr	r4, [sp, #12]
	orr	r2, r2, r4, lsl #8
	.loc 1 1167 118
	orrs	r3, r3, r2
	.loc 1 1167 36
	str	r3, [r1, #28]
	.loc 1 1171 5 is_stmt 1
	.loc 1 1171 13 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1171 23
	ldr	r3, [r2, #28]
	.loc 1 1171 34
	orr	r3, r3, #32
	str	r3, [r2, #28]
	.loc 1 1174 10
	movs	r0, #0
.LVL112:
	b	.L95
.LVL113:
.L97:
	.loc 1 1142 49
	movs	r0, #2
.LVL114:
	b	.L95
.L100:
	.align	2
.L99:
	.word	-65297
	.cfi_endproc
.LFE349:
	.size	HAL_DMA2D_CLUTLoad, .-HAL_DMA2D_CLUTLoad
	.section	.text.HAL_DMA2D_CLUTLoad_IT,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_CLUTLoad_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_CLUTLoad_IT, %function
HAL_DMA2D_CLUTLoad_IT:
.LFB350:
	.loc 1 1192 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL115:
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	add	r4, sp, #16
	stmdb	r4, {r1, r2, r3}
	.loc 1 1194 3
	.loc 1 1195 3
	.loc 1 1196 3
	.loc 1 1199 3
	.loc 1 1199 7
	.loc 1 1199 18 is_stmt 0
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	.loc 1 1199 9
	cmp	r3, #1
	beq	.L104
	.loc 1 1199 68 is_stmt 1 discriminator 2
	.loc 1 1199 83 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #96]
	.loc 1 1199 5 is_stmt 1 discriminator 2
	.loc 1 1202 3 discriminator 2
	.loc 1 1202 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #97]
	.loc 1 1205 3 is_stmt 1 discriminator 2
	.loc 1 1205 6 is_stmt 0 discriminator 2
	ldr	r3, [sp, #24]
	cbnz	r3, .L103
	.loc 1 1208 5 is_stmt 1
	.loc 1 1208 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1208 33
	str	r1, [r3, #48]
	.loc 1 1211 5 is_stmt 1
	.loc 1 1211 50 is_stmt 0
	ldr	r1, [r0]
	.loc 1 1211 60
	ldr	r2, [r1, #36]
	.loc 1 1211 73
	ldr	r3, .L106
	ands	r3, r3, r2
	.loc 1 1211 155
	ldr	r2, [sp, #8]
	.loc 1 1211 170
	lsls	r2, r2, #4
	.loc 1 1211 145
	ldr	r4, [sp, #12]
	orr	r2, r2, r4, lsl #8
	.loc 1 1211 118
	orrs	r3, r3, r2
	.loc 1 1211 36
	str	r3, [r1, #36]
	.loc 1 1215 5 is_stmt 1
	.loc 1 1215 14 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1215 24
	ldr	r3, [r2]
	.loc 1 1215 29
	orr	r3, r3, #14592
	str	r3, [r2]
	.loc 1 1218 5 is_stmt 1
	.loc 1 1218 13 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1218 23
	ldr	r3, [r2, #36]
	.loc 1 1218 34
	orr	r3, r3, #32
	str	r3, [r2, #36]
	.loc 1 1237 10
	movs	r0, #0
.LVL116:
.L102:
	.loc 1 1238 1
	add	sp, sp, #20
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL117:
	bx	lr
.LVL118:
.L103:
	.cfi_restore_state
	.loc 1 1224 5 is_stmt 1
	.loc 1 1224 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1224 33
	ldr	r2, [sp, #4]
	str	r2, [r3, #44]
	.loc 1 1227 5 is_stmt 1
	.loc 1 1227 50 is_stmt 0
	ldr	r1, [r0]
	.loc 1 1227 60
	ldr	r2, [r1, #28]
	.loc 1 1227 73
	ldr	r3, .L106
	ands	r3, r3, r2
	.loc 1 1227 155
	ldr	r2, [sp, #8]
	.loc 1 1227 170
	lsls	r2, r2, #4
	.loc 1 1227 145
	ldr	r4, [sp, #12]
	orr	r2, r2, r4, lsl #8
	.loc 1 1227 118
	orrs	r3, r3, r2
	.loc 1 1227 36
	str	r3, [r1, #28]
	.loc 1 1231 5 is_stmt 1
	.loc 1 1231 14 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1231 24
	ldr	r3, [r2]
	.loc 1 1231 29
	orr	r3, r3, #14592
	str	r3, [r2]
	.loc 1 1234 5 is_stmt 1
	.loc 1 1234 13 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1234 23
	ldr	r3, [r2, #28]
	.loc 1 1234 34
	orr	r3, r3, #32
	str	r3, [r2, #28]
	.loc 1 1237 10
	movs	r0, #0
.LVL119:
	b	.L102
.LVL120:
.L104:
	.loc 1 1199 49
	movs	r0, #2
.LVL121:
	b	.L102
.L107:
	.align	2
.L106:
	.word	-65297
	.cfi_endproc
.LFE350:
	.size	HAL_DMA2D_CLUTLoad_IT, .-HAL_DMA2D_CLUTLoad_IT
	.section	.text.HAL_DMA2D_CLUTLoading_Abort,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_CLUTLoading_Abort
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_CLUTLoading_Abort, %function
HAL_DMA2D_CLUTLoading_Abort:
.LFB351:
	.loc 1 1250 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL122:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r6, r0
	.loc 1 1251 3
	.loc 1 1252 3
	.loc 1 1252 42 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1252 28
	mov	r4, r2
.LVL123:
	.loc 1 1255 3 is_stmt 1
	.loc 1 1255 21 is_stmt 0
	ldr	r3, [r4], #36
.LVL124:
	.loc 1 1255 27
	orr	r3, r3, #4
	str	r3, [r2]
	.loc 1 1258 3 is_stmt 1
	.loc 1 1258 6 is_stmt 0
	cmp	r1, #1
	beq	.L114
.L109:
	.loc 1 1265 3 is_stmt 1
	.loc 1 1265 15 is_stmt 0
	bl	HAL_GetTick
.LVL125:
	mov	r5, r0
.LVL126:
	.loc 1 1268 3 is_stmt 1
.L110:
	.loc 1 1268 35
	.loc 1 1268 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1268 35
	tst	r3, #32
	beq	.L115
	.loc 1 1270 5 is_stmt 1
	.loc 1 1270 10 is_stmt 0
	bl	HAL_GetTick
.LVL127:
	.loc 1 1270 24
	subs	r0, r0, r5
	.loc 1 1270 8
	cmp	r0, #1000
	bls	.L110
	.loc 1 1273 7 is_stmt 1
	.loc 1 1273 13 is_stmt 0
	ldr	r3, [r6, #100]
	.loc 1 1273 25
	orr	r3, r3, #32
	str	r3, [r6, #100]
	.loc 1 1276 7 is_stmt 1
	.loc 1 1276 21 is_stmt 0
	movs	r0, #3
	strb	r0, [r6, #97]
	.loc 1 1279 7 is_stmt 1
	.loc 1 1279 11
	.loc 1 1279 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r6, #96]
	.loc 1 1279 9 is_stmt 1
	.loc 1 1281 7
	.loc 1 1281 14 is_stmt 0
	b	.L111
.LVL128:
.L114:
	.loc 1 1260 5 is_stmt 1
	.loc 1 1260 19 is_stmt 0
	ldr	r4, [r0]
.LVL129:
	.loc 1 1260 9
	adds	r4, r4, #28
.LVL130:
	b	.L109
.LVL131:
.L115:
	.loc 1 1286 3 is_stmt 1
	.loc 1 1286 12 is_stmt 0
	ldr	r2, [r6]
	.loc 1 1286 22
	ldr	r3, [r2]
	.loc 1 1286 27
	bic	r3, r3, #14592
	str	r3, [r2]
	.loc 1 1289 3 is_stmt 1
	.loc 1 1289 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r6, #97]
	.loc 1 1292 3 is_stmt 1
	.loc 1 1292 7
	.loc 1 1292 22 is_stmt 0
	movs	r0, #0
	strb	r0, [r6, #96]
	.loc 1 1292 5 is_stmt 1
	.loc 1 1294 3
.L111:
	.loc 1 1295 1 is_stmt 0
	pop	{r4, r5, r6, pc}
	.cfi_endproc
.LFE351:
	.size	HAL_DMA2D_CLUTLoading_Abort, .-HAL_DMA2D_CLUTLoading_Abort
	.section	.text.HAL_DMA2D_DeInit,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_DeInit, %function
HAL_DMA2D_DeInit:
.LFB336:
	.loc 1 316 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL132:
	.loc 1 319 3
	.loc 1 319 6 is_stmt 0
	cmp	r0, #0
	beq	.L121
	.loc 1 316 1
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r5, r0
	.loc 1 326 3 is_stmt 1
	.loc 1 326 71 is_stmt 0
	ldr	r3, .L132
	ldr	r3, [r3, #212]
	.loc 1 326 6
	tst	r3, #16
	beq	.L118
	.loc 1 329 5 is_stmt 1
	.loc 1 329 16 is_stmt 0
	ldr	r3, [r0]
	.loc 1 329 26
	ldr	r2, [r3]
	.loc 1 329 8
	tst	r2, #1
	bne	.L129
	.loc 1 340 7 is_stmt 1
	.loc 1 340 28 is_stmt 0
	ldr	r2, [r3, #36]
	.loc 1 340 10
	tst	r2, #32
	bne	.L130
	.loc 1 351 9 is_stmt 1
	.loc 1 351 30 is_stmt 0
	ldr	r3, [r3, #28]
	.loc 1 351 12
	tst	r3, #32
	bne	.L131
.LVL133:
.L118:
	.loc 1 364 3 is_stmt 1
	.loc 1 364 9 is_stmt 0
	ldr	r3, [r5]
	.loc 1 364 24
	movs	r4, #0
	str	r4, [r3]
	.loc 1 365 3 is_stmt 1
	.loc 1 365 9 is_stmt 0
	ldr	r3, [r5]
	.loc 1 365 26
	movs	r2, #63
	str	r2, [r3, #8]
	.loc 1 366 3 is_stmt 1
	.loc 1 366 9 is_stmt 0
	ldr	r3, [r5]
	.loc 1 366 26
	str	r4, [r3, #16]
	.loc 1 367 3 is_stmt 1
	.loc 1 367 9 is_stmt 0
	ldr	r3, [r5]
	.loc 1 367 26
	str	r4, [r3, #24]
	.loc 1 368 3 is_stmt 1
	.loc 1 368 9 is_stmt 0
	ldr	r3, [r5]
	.loc 1 368 29
	str	r4, [r3, #28]
	.loc 1 369 3 is_stmt 1
	.loc 1 369 9 is_stmt 0
	ldr	r3, [r5]
	.loc 1 369 29
	str	r4, [r3, #36]
	.loc 1 370 3 is_stmt 1
	.loc 1 370 9 is_stmt 0
	ldr	r3, [r5]
	.loc 1 370 28
	str	r4, [r3, #52]
	.loc 1 384 3 is_stmt 1
	mov	r0, r5
	bl	HAL_DMA2D_MspDeInit
.LVL134:
	.loc 1 388 3
	.loc 1 388 21 is_stmt 0
	str	r4, [r5, #100]
	.loc 1 391 3 is_stmt 1
	.loc 1 391 17 is_stmt 0
	strb	r4, [r5, #97]
	.loc 1 394 3 is_stmt 1
	.loc 1 394 7
	.loc 1 394 22 is_stmt 0
	strb	r4, [r5, #96]
	.loc 1 394 5 is_stmt 1
	.loc 1 396 3
	.loc 1 396 10 is_stmt 0
	mov	r0, r4
.L117:
	.loc 1 397 1
	pop	{r3, r4, r5, pc}
.LVL135:
.L129:
	.loc 1 331 7 is_stmt 1
	.loc 1 331 11 is_stmt 0
	bl	HAL_DMA2D_Abort
.LVL136:
	.loc 1 331 10
	cmp	r0, #0
	beq	.L118
	.loc 1 334 16
	movs	r0, #1
	b	.L117
.LVL137:
.L130:
	.loc 1 342 9 is_stmt 1
	.loc 1 342 13 is_stmt 0
	movs	r1, #0
	bl	HAL_DMA2D_CLUTLoading_Abort
.LVL138:
	.loc 1 342 12
	cmp	r0, #0
	beq	.L118
	.loc 1 345 18
	movs	r0, #1
	b	.L117
.LVL139:
.L131:
	.loc 1 353 11 is_stmt 1
	.loc 1 353 15 is_stmt 0
	movs	r1, #1
	bl	HAL_DMA2D_CLUTLoading_Abort
.LVL140:
	.loc 1 353 14
	cmp	r0, #0
	beq	.L118
	.loc 1 356 20
	movs	r0, #1
	b	.L117
.LVL141:
.L121:
	.cfi_def_cfa_offset 0
	.cfi_restore 3
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 14
	.loc 1 321 12
	movs	r0, #1
.LVL142:
	.loc 1 397 1
	bx	lr
.L133:
	.align	2
.L132:
	.word	1476543488
	.cfi_endproc
.LFE336:
	.size	HAL_DMA2D_DeInit, .-HAL_DMA2D_DeInit
	.section	.text.HAL_DMA2D_CLUTLoading_Suspend,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_CLUTLoading_Suspend
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_CLUTLoading_Suspend, %function
HAL_DMA2D_CLUTLoading_Suspend:
.LFB352:
	.loc 1 1307 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL143:
	push	{r3, r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	mov	r5, r0
	.loc 1 1308 3
	.loc 1 1309 3
	.loc 1 1310 3
	.loc 1 1310 42 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1310 28
	mov	r6, r2
.LVL144:
	.loc 1 1313 3 is_stmt 1
	.loc 1 1313 21 is_stmt 0
	ldr	r3, [r6], #36
.LVL145:
	.loc 1 1313 27
	orr	r3, r3, #2
	str	r3, [r2]
	.loc 1 1316 3 is_stmt 1
	.loc 1 1316 6 is_stmt 0
	cmp	r1, #1
	beq	.L147
.L135:
	.loc 1 1322 3 is_stmt 1
	.loc 1 1322 15 is_stmt 0
	bl	HAL_GetTick
.LVL146:
	mov	r7, r0
.LVL147:
	.loc 1 1326 3 is_stmt 1
	.loc 1 1326 27 is_stmt 0
	ldr	r3, [r5]
	.loc 1 1326 37
	ldr	r4, [r3]
	.loc 1 1326 87
	ands	r4, r4, #2
	beq	.L136
	movs	r4, #1
.L136:
.LVL148:
	.loc 1 1328 3 is_stmt 1 discriminator 4
	.loc 1 1328 22 is_stmt 0 discriminator 4
	ldr	r3, [r6]
	.loc 1 1328 72 discriminator 4
	tst	r3, #32
	bne	.L145
	.loc 1 1328 72
	movs	r3, #1
.L137:
	.loc 1 1328 17 discriminator 4
	orrs	r4, r4, r3
.LVL149:
	.loc 1 1329 3 is_stmt 1 discriminator 4
	.loc 1 1329 9 is_stmt 0 discriminator 4
	b	.L138
.LVL150:
.L147:
	.loc 1 1318 5 is_stmt 1
	.loc 1 1318 19 is_stmt 0
	ldr	r6, [r0]
.LVL151:
	.loc 1 1318 9
	adds	r6, r6, #28
.LVL152:
	b	.L135
.LVL153:
.L145:
	.loc 1 1328 72
	movs	r3, #0
	b	.L137
.LVL154:
.L149:
	.loc 1 1334 7 is_stmt 1
	.loc 1 1334 13 is_stmt 0
	ldr	r3, [r5, #100]
	.loc 1 1334 25
	orr	r3, r3, #32
	str	r3, [r5, #100]
	.loc 1 1337 7 is_stmt 1
	.loc 1 1337 21 is_stmt 0
	movs	r0, #3
	strb	r0, [r5, #97]
	.loc 1 1339 7 is_stmt 1
.L140:
	.loc 1 1360 1 is_stmt 0
	pop	{r3, r4, r5, r6, r7, pc}
.LVL155:
.L142:
	.loc 1 1344 19 discriminator 4
	orrs	r4, r4, r3
.LVL156:
.L138:
	.loc 1 1329 24 is_stmt 1
	cbnz	r4, .L148
	.loc 1 1331 5
	.loc 1 1331 10 is_stmt 0
	bl	HAL_GetTick
.LVL157:
	.loc 1 1331 24
	subs	r0, r0, r7
	.loc 1 1331 8
	cmp	r0, #1000
	bhi	.L149
	.loc 1 1342 5 is_stmt 1
	.loc 1 1342 29 is_stmt 0
	ldr	r3, [r5]
	.loc 1 1342 39
	ldr	r3, [r3]
	.loc 1 1342 89
	ands	r3, r3, #2
	beq	.L141
	movs	r3, #1
.L141:
.LVL158:
	.loc 1 1344 5 is_stmt 1 discriminator 4
	.loc 1 1344 24 is_stmt 0 discriminator 4
	ldr	r2, [r6]
	.loc 1 1344 74 discriminator 4
	tst	r2, #32
	bne	.L142
	.loc 1 1344 74
	movs	r4, #1
	b	.L142
.LVL159:
.L148:
	.loc 1 1348 3 is_stmt 1
	.loc 1 1348 8 is_stmt 0
	ldr	r3, [r6]
	.loc 1 1348 6
	tst	r3, #32
	beq	.L144
	.loc 1 1350 5 is_stmt 1
	.loc 1 1350 19 is_stmt 0
	movs	r3, #5
	strb	r3, [r5, #97]
	.loc 1 1359 10
	movs	r0, #0
	b	.L140
.L144:
	.loc 1 1356 5 is_stmt 1
	.loc 1 1356 13 is_stmt 0
	ldr	r2, [r5]
	.loc 1 1356 23
	ldr	r3, [r2]
	.loc 1 1356 29
	bic	r3, r3, #2
	str	r3, [r2]
	.loc 1 1359 10
	movs	r0, #0
	b	.L140
	.cfi_endproc
.LFE352:
	.size	HAL_DMA2D_CLUTLoading_Suspend, .-HAL_DMA2D_CLUTLoading_Suspend
	.section	.text.HAL_DMA2D_CLUTLoading_Resume,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_CLUTLoading_Resume
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_CLUTLoading_Resume, %function
HAL_DMA2D_CLUTLoading_Resume:
.LFB353:
	.loc 1 1372 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL160:
	.loc 1 1374 3
	.loc 1 1374 6 is_stmt 0
	cbnz	r1, .L151
	.loc 1 1377 5 is_stmt 1
	.loc 1 1377 16 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1377 26
	ldr	r2, [r3]
	.loc 1 1377 8
	tst	r2, #2
	beq	.L152
	.loc 1 1379 7 is_stmt 1
	.loc 1 1379 28 is_stmt 0
	ldr	r3, [r3, #36]
	.loc 1 1379 10
	tst	r3, #32
	beq	.L152
	.loc 1 1382 9 is_stmt 1
	.loc 1 1382 23 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #97]
.L152:
	.loc 1 1400 3 is_stmt 1
	.loc 1 1400 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1400 21
	ldr	r3, [r2]
	.loc 1 1400 27
	bic	r3, r3, #2
	str	r3, [r2]
	.loc 1 1402 3 is_stmt 1
	.loc 1 1403 1 is_stmt 0
	movs	r0, #0
.LVL161:
	bx	lr
.LVL162:
.L151:
	.loc 1 1389 5 is_stmt 1
	.loc 1 1389 16 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1389 26
	ldr	r2, [r3]
	.loc 1 1389 8
	tst	r2, #2
	beq	.L152
	.loc 1 1391 7 is_stmt 1
	.loc 1 1391 28 is_stmt 0
	ldr	r3, [r3, #28]
	.loc 1 1391 10
	tst	r3, #32
	beq	.L152
	.loc 1 1394 9 is_stmt 1
	.loc 1 1394 23 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #97]
	b	.L152
	.cfi_endproc
.LFE353:
	.size	HAL_DMA2D_CLUTLoading_Resume, .-HAL_DMA2D_CLUTLoading_Resume
	.section	.text.HAL_DMA2D_PollForTransfer,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_PollForTransfer
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_PollForTransfer, %function
HAL_DMA2D_PollForTransfer:
.LFB354:
	.loc 1 1415 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL163:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 24
	mov	r4, r0
	mov	r5, r1
	.loc 1 1416 3
	.loc 1 1417 3
	.loc 1 1418 3
	.loc 1 1418 21 is_stmt 0
	movs	r3, #0
	str	r3, [sp, #4]
	.loc 1 1421 3 is_stmt 1
	.loc 1 1421 14 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1421 24
	ldr	r3, [r3]
	.loc 1 1421 6
	tst	r3, #1
	bne	.L173
.LVL164:
.L154:
	.loc 1 1470 3 is_stmt 1
	.loc 1 1470 23 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1470 33
	ldr	r3, [r2, #28]
.LVL165:
	.loc 1 1471 3 is_stmt 1
	.loc 1 1471 34 is_stmt 0
	ldr	r2, [r2, #36]
	.loc 1 1471 15
	orrs	r3, r3, r2
.LVL166:
	.loc 1 1472 3 is_stmt 1
	.loc 1 1472 6 is_stmt 0
	tst	r3, #32
	bne	.L174
.LVL167:
.L163:
	.loc 1 1526 3 is_stmt 1
	.loc 1 1526 12 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1526 29
	movs	r2, #18
	str	r2, [r3, #8]
	.loc 1 1529 3 is_stmt 1
	.loc 1 1529 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #97]
	.loc 1 1532 3 is_stmt 1
	.loc 1 1532 7
	.loc 1 1532 22 is_stmt 0
	movs	r0, #0
	strb	r0, [r4, #96]
	.loc 1 1532 5 is_stmt 1
	.loc 1 1534 3
.LVL168:
.L159:
	.loc 1 1535 1 is_stmt 0
	add	sp, sp, #8
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	@ sp needed
	pop	{r4, r5, r6, pc}
.LVL169:
.L173:
	.cfi_restore_state
	.loc 1 1424 5 is_stmt 1
	.loc 1 1424 17 is_stmt 0
	bl	HAL_GetTick
.LVL170:
	mov	r6, r0
.LVL171:
	.loc 1 1426 5 is_stmt 1
.L160:
	.loc 1 1426 58
	.loc 1 1426 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1426 31
	ldr	r2, [r3, #4]
	.loc 1 1426 58
	tst	r2, #2
	bne	.L154
	.loc 1 1428 7 is_stmt 1
	.loc 1 1428 36 is_stmt 0
	ldr	r2, [r3, #4]
	.loc 1 1428 16
	str	r2, [sp, #4]
	.loc 1 1429 7 is_stmt 1
	.loc 1 1429 21 is_stmt 0
	ldr	r2, [sp, #4]
	.loc 1 1429 10
	tst	r2, #33
	bne	.L175
	.loc 1 1451 7 is_stmt 1
	.loc 1 1451 10 is_stmt 0
	cmp	r5, #-1
	beq	.L160
	.loc 1 1453 9 is_stmt 1
	.loc 1 1453 15 is_stmt 0
	bl	HAL_GetTick
.LVL172:
	.loc 1 1453 29
	subs	r0, r0, r6
	.loc 1 1453 12
	cmp	r0, r5
	bhi	.L161
	.loc 1 1453 53 discriminator 1
	cmp	r5, #0
	bne	.L160
.L161:
	.loc 1 1456 11 is_stmt 1
	.loc 1 1456 17 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1456 29
	orr	r3, r3, #32
	str	r3, [r4, #100]
	.loc 1 1459 11 is_stmt 1
	.loc 1 1459 25 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #97]
	.loc 1 1462 11 is_stmt 1
	.loc 1 1462 15
	.loc 1 1462 30 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #96]
	.loc 1 1462 13 is_stmt 1
	.loc 1 1464 11
	.loc 1 1464 18 is_stmt 0
	b	.L159
.L175:
	.loc 1 1431 9 is_stmt 1
	.loc 1 1431 23 is_stmt 0
	ldr	r2, [sp, #4]
	.loc 1 1431 12
	tst	r2, #32
	beq	.L157
	.loc 1 1433 11 is_stmt 1
	.loc 1 1433 17 is_stmt 0
	ldr	r2, [r4, #100]
	.loc 1 1433 29
	orr	r2, r2, #2
	str	r2, [r4, #100]
.L157:
	.loc 1 1435 9 is_stmt 1
	.loc 1 1435 23 is_stmt 0
	ldr	r2, [sp, #4]
	.loc 1 1435 12
	tst	r2, #1
	beq	.L158
	.loc 1 1437 11 is_stmt 1
	.loc 1 1437 17 is_stmt 0
	ldr	r2, [r4, #100]
	.loc 1 1437 29
	orr	r2, r2, #1
	str	r2, [r4, #100]
.L158:
	.loc 1 1440 9 is_stmt 1
	.loc 1 1440 35 is_stmt 0
	movs	r2, #33
	str	r2, [r3, #8]
	.loc 1 1443 9 is_stmt 1
	.loc 1 1443 23 is_stmt 0
	movs	r3, #4
	strb	r3, [r4, #97]
	.loc 1 1446 9 is_stmt 1
	.loc 1 1446 13
	.loc 1 1446 28 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #96]
	.loc 1 1446 11 is_stmt 1
	.loc 1 1448 9
	.loc 1 1448 16 is_stmt 0
	movs	r0, #1
	b	.L159
.LVL173:
.L174:
	.loc 1 1475 5 is_stmt 1
	.loc 1 1475 17 is_stmt 0
	bl	HAL_GetTick
.LVL174:
	mov	r6, r0
.LVL175:
	.loc 1 1477 5 is_stmt 1
.L169:
	.loc 1 1477 58
	.loc 1 1477 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1477 31
	ldr	r2, [r3, #4]
	.loc 1 1477 58
	tst	r2, #16
	bne	.L163
	.loc 1 1479 7 is_stmt 1
	.loc 1 1479 36 is_stmt 0
	ldr	r2, [r3, #4]
	.loc 1 1479 16
	str	r2, [sp, #4]
	.loc 1 1480 7 is_stmt 1
	.loc 1 1480 21 is_stmt 0
	ldr	r2, [sp, #4]
	.loc 1 1480 10
	tst	r2, #41
	bne	.L176
	.loc 1 1506 7 is_stmt 1
	.loc 1 1506 10 is_stmt 0
	cmp	r5, #-1
	beq	.L169
	.loc 1 1508 9 is_stmt 1
	.loc 1 1508 15 is_stmt 0
	bl	HAL_GetTick
.LVL176:
	.loc 1 1508 29
	subs	r0, r0, r6
	.loc 1 1508 12
	cmp	r0, r5
	bhi	.L170
	.loc 1 1508 53 discriminator 1
	cmp	r5, #0
	bne	.L169
.L170:
	.loc 1 1511 11 is_stmt 1
	.loc 1 1511 17 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1511 29
	orr	r3, r3, #32
	str	r3, [r4, #100]
	.loc 1 1514 11 is_stmt 1
	.loc 1 1514 25 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #97]
	.loc 1 1517 11 is_stmt 1
	.loc 1 1517 15
	.loc 1 1517 30 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #96]
	.loc 1 1517 13 is_stmt 1
	.loc 1 1519 11
	.loc 1 1519 18 is_stmt 0
	b	.L159
.L176:
	.loc 1 1482 9 is_stmt 1
	.loc 1 1482 23 is_stmt 0
	ldr	r2, [sp, #4]
	.loc 1 1482 12
	tst	r2, #8
	beq	.L166
	.loc 1 1484 11 is_stmt 1
	.loc 1 1484 17 is_stmt 0
	ldr	r2, [r4, #100]
	.loc 1 1484 29
	orr	r2, r2, #4
	str	r2, [r4, #100]
.L166:
	.loc 1 1486 9 is_stmt 1
	.loc 1 1486 23 is_stmt 0
	ldr	r2, [sp, #4]
	.loc 1 1486 12
	tst	r2, #32
	beq	.L167
	.loc 1 1488 11 is_stmt 1
	.loc 1 1488 17 is_stmt 0
	ldr	r2, [r4, #100]
	.loc 1 1488 29
	orr	r2, r2, #2
	str	r2, [r4, #100]
.L167:
	.loc 1 1490 9 is_stmt 1
	.loc 1 1490 23 is_stmt 0
	ldr	r2, [sp, #4]
	.loc 1 1490 12
	tst	r2, #1
	beq	.L168
	.loc 1 1492 11 is_stmt 1
	.loc 1 1492 17 is_stmt 0
	ldr	r2, [r4, #100]
	.loc 1 1492 29
	orr	r2, r2, #1
	str	r2, [r4, #100]
.L168:
	.loc 1 1495 9 is_stmt 1
	.loc 1 1495 35 is_stmt 0
	movs	r2, #41
	str	r2, [r3, #8]
	.loc 1 1498 9 is_stmt 1
	.loc 1 1498 23 is_stmt 0
	movs	r3, #4
	strb	r3, [r4, #97]
	.loc 1 1501 9 is_stmt 1
	.loc 1 1501 13
	.loc 1 1501 28 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #96]
	.loc 1 1501 11 is_stmt 1
	.loc 1 1503 9
	.loc 1 1503 16 is_stmt 0
	movs	r0, #1
	b	.L159
	.cfi_endproc
.LFE354:
	.size	HAL_DMA2D_PollForTransfer, .-HAL_DMA2D_PollForTransfer
	.section	.text.HAL_DMA2D_LineEventCallback,"ax",%progbits
	.align	1
	.weak	HAL_DMA2D_LineEventCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_LineEventCallback, %function
HAL_DMA2D_LineEventCallback:
.LFB356:
	.loc 1 1713 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL177:
	.loc 1 1715 3
	.loc 1 1720 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE356:
	.size	HAL_DMA2D_LineEventCallback, .-HAL_DMA2D_LineEventCallback
	.section	.text.HAL_DMA2D_CLUTLoadingCpltCallback,"ax",%progbits
	.align	1
	.weak	HAL_DMA2D_CLUTLoadingCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_CLUTLoadingCpltCallback, %function
HAL_DMA2D_CLUTLoadingCpltCallback:
.LFB357:
	.loc 1 1729 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL178:
	.loc 1 1731 3
	.loc 1 1736 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE357:
	.size	HAL_DMA2D_CLUTLoadingCpltCallback, .-HAL_DMA2D_CLUTLoadingCpltCallback
	.section	.text.HAL_DMA2D_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_IRQHandler, %function
HAL_DMA2D_IRQHandler:
.LFB355:
	.loc 1 1543 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL179:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 1544 3
	.loc 1 1544 31 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1544 12
	ldr	r5, [r3, #4]
.LVL180:
	.loc 1 1545 3 is_stmt 1
	.loc 1 1545 12 is_stmt 0
	ldr	r6, [r3]
.LVL181:
	.loc 1 1548 3 is_stmt 1
	.loc 1 1548 6 is_stmt 0
	tst	r5, #1
	beq	.L180
	.loc 1 1550 5 is_stmt 1
	.loc 1 1550 8 is_stmt 0
	tst	r6, #256
	beq	.L180
	.loc 1 1553 7 is_stmt 1
	.loc 1 1553 26 is_stmt 0
	ldr	r2, [r3]
	.loc 1 1553 31
	bic	r2, r2, #256
	str	r2, [r3]
	.loc 1 1556 7 is_stmt 1
	.loc 1 1556 13 is_stmt 0
	ldr	r3, [r0, #100]
	.loc 1 1556 25
	orr	r3, r3, #1
	str	r3, [r0, #100]
	.loc 1 1559 7 is_stmt 1
	.loc 1 1559 16 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1559 33
	movs	r2, #1
	str	r2, [r3, #8]
	.loc 1 1562 7 is_stmt 1
	.loc 1 1562 21 is_stmt 0
	movs	r3, #4
	strb	r3, [r0, #97]
	.loc 1 1565 7 is_stmt 1
	.loc 1 1565 11
	.loc 1 1565 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r0, #96]
	.loc 1 1565 9 is_stmt 1
	.loc 1 1567 7
	.loc 1 1567 17 is_stmt 0
	ldr	r3, [r0, #36]
	.loc 1 1567 10
	cbz	r3, .L180
	.loc 1 1570 9 is_stmt 1
	blx	r3
.LVL182:
.L180:
	.loc 1 1575 3
	.loc 1 1575 6 is_stmt 0
	tst	r5, #32
	beq	.L181
	.loc 1 1577 5 is_stmt 1
	.loc 1 1577 8 is_stmt 0
	tst	r6, #8192
	beq	.L181
	.loc 1 1580 7 is_stmt 1
	.loc 1 1580 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1580 26
	ldr	r3, [r2]
	.loc 1 1580 31
	bic	r3, r3, #8192
	str	r3, [r2]
	.loc 1 1583 7 is_stmt 1
	.loc 1 1583 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1583 33
	movs	r2, #32
	str	r2, [r3, #8]
	.loc 1 1586 7 is_stmt 1
	.loc 1 1586 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1586 25
	orr	r3, r3, #2
	str	r3, [r4, #100]
	.loc 1 1589 7 is_stmt 1
	.loc 1 1589 21 is_stmt 0
	movs	r3, #4
	strb	r3, [r4, #97]
	.loc 1 1592 7 is_stmt 1
	.loc 1 1592 11
	.loc 1 1592 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #96]
	.loc 1 1592 9 is_stmt 1
	.loc 1 1594 7
	.loc 1 1594 17 is_stmt 0
	ldr	r3, [r4, #36]
	.loc 1 1594 10
	cbz	r3, .L181
	.loc 1 1597 9 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL183:
.L181:
	.loc 1 1602 3
	.loc 1 1602 6 is_stmt 0
	tst	r5, #8
	beq	.L182
	.loc 1 1604 5 is_stmt 1
	.loc 1 1604 8 is_stmt 0
	tst	r6, #2048
	beq	.L182
	.loc 1 1607 7 is_stmt 1
	.loc 1 1607 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1607 26
	ldr	r3, [r2]
	.loc 1 1607 31
	bic	r3, r3, #2048
	str	r3, [r2]
	.loc 1 1610 7 is_stmt 1
	.loc 1 1610 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1610 33
	movs	r2, #8
	str	r2, [r3, #8]
	.loc 1 1613 7 is_stmt 1
	.loc 1 1613 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1613 25
	orr	r3, r3, #4
	str	r3, [r4, #100]
	.loc 1 1616 7 is_stmt 1
	.loc 1 1616 21 is_stmt 0
	movs	r3, #4
	strb	r3, [r4, #97]
	.loc 1 1619 7 is_stmt 1
	.loc 1 1619 11
	.loc 1 1619 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #96]
	.loc 1 1619 9 is_stmt 1
	.loc 1 1621 7
	.loc 1 1621 17 is_stmt 0
	ldr	r3, [r4, #36]
	.loc 1 1621 10
	cbz	r3, .L182
	.loc 1 1624 9 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL184:
.L182:
	.loc 1 1629 3
	.loc 1 1629 6 is_stmt 0
	tst	r5, #4
	beq	.L183
	.loc 1 1631 5 is_stmt 1
	.loc 1 1631 8 is_stmt 0
	tst	r6, #1024
	bne	.L187
.L183:
	.loc 1 1649 3 is_stmt 1
	.loc 1 1649 6 is_stmt 0
	tst	r5, #2
	beq	.L184
	.loc 1 1651 5 is_stmt 1
	.loc 1 1651 8 is_stmt 0
	tst	r6, #512
	beq	.L184
	.loc 1 1654 7 is_stmt 1
	.loc 1 1654 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1654 26
	ldr	r3, [r2]
	.loc 1 1654 31
	bic	r3, r3, #512
	str	r3, [r2]
	.loc 1 1657 7 is_stmt 1
	.loc 1 1657 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1657 33
	movs	r2, #2
	str	r2, [r3, #8]
	.loc 1 1660 7 is_stmt 1
	.loc 1 1660 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1660 25
	str	r3, [r4, #100]
	.loc 1 1663 7 is_stmt 1
	.loc 1 1663 21 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #97]
	.loc 1 1666 7 is_stmt 1
	.loc 1 1666 11
	.loc 1 1666 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #96]
	.loc 1 1666 9 is_stmt 1
	.loc 1 1668 7
	.loc 1 1668 17 is_stmt 0
	ldr	r3, [r4, #32]
	.loc 1 1668 10
	cbz	r3, .L184
	.loc 1 1671 9 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL185:
.L184:
	.loc 1 1676 3
	.loc 1 1676 6 is_stmt 0
	tst	r5, #16
	beq	.L179
	.loc 1 1678 5 is_stmt 1
	.loc 1 1678 8 is_stmt 0
	tst	r6, #4096
	bne	.L188
.L179:
	.loc 1 1704 1
	pop	{r4, r5, r6, pc}
.LVL186:
.L187:
	.loc 1 1634 7 is_stmt 1
	.loc 1 1634 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1634 26
	ldr	r3, [r2]
	.loc 1 1634 31
	bic	r3, r3, #1024
	str	r3, [r2]
	.loc 1 1637 7 is_stmt 1
	.loc 1 1637 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1637 33
	movs	r2, #4
	str	r2, [r3, #8]
	.loc 1 1643 7 is_stmt 1
	mov	r0, r4
	bl	HAL_DMA2D_LineEventCallback
.LVL187:
	b	.L183
.L188:
	.loc 1 1681 7
	.loc 1 1681 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1681 26
	ldr	r3, [r2]
	.loc 1 1681 31
	bic	r3, r3, #4096
	str	r3, [r2]
	.loc 1 1684 7 is_stmt 1
	.loc 1 1684 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1684 33
	movs	r2, #16
	str	r2, [r3, #8]
	.loc 1 1687 7 is_stmt 1
	.loc 1 1687 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1687 25
	str	r3, [r4, #100]
	.loc 1 1690 7 is_stmt 1
	.loc 1 1690 21 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #97]
	.loc 1 1693 7 is_stmt 1
	.loc 1 1693 11
	.loc 1 1693 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #96]
	.loc 1 1693 9 is_stmt 1
	.loc 1 1699 7
	mov	r0, r4
	bl	HAL_DMA2D_CLUTLoadingCpltCallback
.LVL188:
	.loc 1 1704 1 is_stmt 0
	b	.L179
	.cfi_endproc
.LFE355:
	.size	HAL_DMA2D_IRQHandler, .-HAL_DMA2D_IRQHandler
	.section	.text.HAL_DMA2D_ConfigLayer,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_ConfigLayer
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_ConfigLayer, %function
HAL_DMA2D_ConfigLayer:
.LFB358:
	.loc 1 1772 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL189:
	.loc 1 1773 3
	.loc 1 1774 3
	.loc 1 1775 3
	.loc 1 1778 3
	.loc 1 1779 3
	.loc 1 1780 3
	.loc 1 1785 7
	.loc 1 1788 3
	.loc 1 1789 3
	.loc 1 1791 3
	.loc 1 1793 5
	.loc 1 1797 3
	.loc 1 1797 7
	.loc 1 1797 18 is_stmt 0
	ldrb	r2, [r0, #96]	@ zero_extendqisi2
	.loc 1 1797 9
	cmp	r2, #1
	beq	.L196
	.loc 1 1772 1 discriminator 2
	push	{r4, r5}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
	mov	r3, r0
	.loc 1 1797 68 is_stmt 1 discriminator 2
	.loc 1 1797 83 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #96]
	.loc 1 1797 5 is_stmt 1 discriminator 2
	.loc 1 1800 3 discriminator 2
	.loc 1 1800 17 is_stmt 0 discriminator 2
	movs	r2, #2
	strb	r2, [r0, #97]
	.loc 1 1802 3 is_stmt 1 discriminator 2
.LVL190:
	.loc 1 1805 3 discriminator 2
	.loc 1 1805 23 is_stmt 0 discriminator 2
	rsb	r0, r1, r1, lsl #3
.LVL191:
	add	r0, r3, r0, lsl #2
	ldr	r4, [r0, #44]
	.loc 1 1805 52 discriminator 2
	ldr	r2, [r0, #48]
	.loc 1 1805 40 discriminator 2
	orr	r2, r4, r2, lsl #16
	.loc 1 1805 74 discriminator 2
	ldr	r5, [r0, #56]
	orr	r2, r2, r5, lsl #20
	.loc 1 1806 62 discriminator 2
	ldr	r0, [r0, #60]
	.loc 1 1805 12 discriminator 2
	orr	r2, r2, r0, lsl #21
.LVL192:
	.loc 1 1807 3 is_stmt 1 discriminator 2
	.loc 1 1810 3 discriminator 2
	.loc 1 1810 50 is_stmt 0 discriminator 2
	sub	r0, r4, #9
	.loc 1 1810 6 discriminator 2
	cmp	r0, #1
	bls	.L202
	.loc 1 1816 5 is_stmt 1
	.loc 1 1816 27 is_stmt 0
	rsb	r0, r1, r1, lsl #3
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #52]
	.loc 1 1816 14
	orr	r2, r2, r0, lsl #24
.LVL193:
.L192:
	.loc 1 1820 3 is_stmt 1
	.loc 1 1820 6 is_stmt 0
	cbnz	r1, .L193
	.loc 1 1823 5 is_stmt 1
	.loc 1 1823 50 is_stmt 0
	ldr	r4, [r3]
	.loc 1 1823 60
	ldr	r5, [r4, #36]
	.loc 1 1823 73
	ldr	r0, .L205
	ands	r0, r0, r5
	.loc 1 1823 89
	orrs	r0, r0, r2
	.loc 1 1823 36
	str	r0, [r4, #36]
	.loc 1 1826 5 is_stmt 1
	.loc 1 1826 13 is_stmt 0
	ldr	r0, [r3]
	.loc 1 1826 43
	rsb	r2, r1, r1, lsl #3
.LVL194:
	add	r2, r3, r2, lsl #2
	ldr	r4, [r2, #40]
	.loc 1 1826 31
	str	r4, [r0, #24]
	.loc 1 1829 5 is_stmt 1
	.loc 1 1829 19 is_stmt 0
	ldr	r2, [r2, #44]
	.loc 1 1829 52
	subs	r2, r2, #9
	.loc 1 1829 8
	cmp	r2, #1
	bls	.L203
.LVL195:
.L194:
	.loc 1 1859 3 is_stmt 1
	.loc 1 1859 17 is_stmt 0
	movs	r2, #1
	strb	r2, [r3, #97]
	.loc 1 1862 3 is_stmt 1
	.loc 1 1862 7
	.loc 1 1862 22 is_stmt 0
	movs	r0, #0
	strb	r0, [r3, #96]
	.loc 1 1862 5 is_stmt 1
	.loc 1 1864 3
	.loc 1 1865 1 is_stmt 0
	pop	{r4, r5}
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL196:
.L202:
	.cfi_restore_state
	.loc 1 1812 5 is_stmt 1
	.loc 1 1812 27 is_stmt 0
	rsb	r0, r1, r1, lsl #3
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #52]
	.loc 1 1812 40
	and	r0, r0, #-16777216
	.loc 1 1812 14
	orrs	r2, r2, r0
.LVL197:
	b	.L192
.LVL198:
.L203:
	.loc 1 1831 7 is_stmt 1
	.loc 1 1831 47 is_stmt 0
	rsb	r1, r1, r1, lsl #3
.LVL199:
	add	r1, r3, r1, lsl #2
	ldr	r2, [r1, #52]
	.loc 1 1831 15
	ldr	r1, [r3]
	.loc 1 1831 60
	bic	r2, r2, #-16777216
	.loc 1 1831 35
	str	r2, [r1, #40]
	b	.L194
.LVL200:
.L193:
	.loc 1 1839 5 is_stmt 1
	.loc 1 1839 8 is_stmt 0
	cmp	r4, #11
	beq	.L204
	.loc 1 1807 11
	ldr	r5, .L205+4
.LVL201:
.L195:
	.loc 1 1846 5 is_stmt 1
	.loc 1 1846 50 is_stmt 0
	ldr	r4, [r3]
	.loc 1 1846 60
	ldr	r0, [r4, #28]
	.loc 1 1846 73
	bic	r0, r0, r5
	.loc 1 1846 89
	orrs	r2, r2, r0
.LVL202:
	.loc 1 1846 36
	str	r2, [r4, #28]
	.loc 1 1849 5 is_stmt 1
	.loc 1 1849 13 is_stmt 0
	ldr	r0, [r3]
	.loc 1 1849 43
	rsb	r2, r1, r1, lsl #3
	add	r2, r3, r2, lsl #2
	ldr	r4, [r2, #40]
	.loc 1 1849 31
	str	r4, [r0, #16]
	.loc 1 1852 5 is_stmt 1
	.loc 1 1852 19 is_stmt 0
	ldr	r2, [r2, #44]
	.loc 1 1852 52
	subs	r2, r2, #9
	.loc 1 1852 8
	cmp	r2, #1
	bhi	.L194
	.loc 1 1854 7 is_stmt 1
	.loc 1 1854 47 is_stmt 0
	rsb	r1, r1, r1, lsl #3
.LVL203:
	add	r1, r3, r1, lsl #2
	ldr	r2, [r1, #52]
	.loc 1 1854 15
	ldr	r1, [r3]
	.loc 1 1854 60
	bic	r2, r2, #-16777216
	.loc 1 1854 35
	str	r2, [r1, #32]
	b	.L194
.LVL204:
.L204:
	.loc 1 1841 7 is_stmt 1
	.loc 1 1841 29 is_stmt 0
	rsb	r0, r1, r1, lsl #3
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #64]
	.loc 1 1841 16
	orr	r2, r2, r0, lsl #18
.LVL205:
	.loc 1 1842 7 is_stmt 1
	.loc 1 1842 15 is_stmt 0
	ldr	r5, .L205+8
	b	.L195
.LVL206:
.L196:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.loc 1 1797 49
	movs	r0, #2
.LVL207:
	.loc 1 1865 1
	bx	lr
.L206:
	.align	2
.L205:
	.word	13434864
	.word	-13434865
	.word	-12648433
	.cfi_endproc
.LFE358:
	.size	HAL_DMA2D_ConfigLayer, .-HAL_DMA2D_ConfigLayer
	.section	.text.HAL_DMA2D_ConfigCLUT,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_ConfigCLUT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_ConfigCLUT, %function
HAL_DMA2D_ConfigCLUT:
.LFB359:
	.loc 1 1882 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL208:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	ip, r0
	add	r0, sp, #16
.LVL209:
	stmdb	r0, {r1, r2, r3}
	.loc 1 1884 3
	.loc 1 1885 3
	.loc 1 1886 3
	.loc 1 1889 3
	.loc 1 1889 7
	.loc 1 1889 18 is_stmt 0
	ldrb	r3, [ip, #96]	@ zero_extendqisi2
	.loc 1 1889 9
	cmp	r3, #1
	beq	.L211
	.loc 1 1889 68 is_stmt 1 discriminator 2
	.loc 1 1889 83 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [ip, #96]
	.loc 1 1889 5 is_stmt 1 discriminator 2
	.loc 1 1892 3 discriminator 2
	.loc 1 1892 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [ip, #97]
	.loc 1 1895 3 is_stmt 1 discriminator 2
	.loc 1 1895 6 is_stmt 0 discriminator 2
	ldr	r3, [sp, #16]
	cbnz	r3, .L209
	.loc 1 1898 5 is_stmt 1
	.loc 1 1898 13 is_stmt 0
	ldr	r3, [ip]
	.loc 1 1898 33
	str	r1, [r3, #48]
	.loc 1 1901 5 is_stmt 1
	.loc 1 1901 50 is_stmt 0
	ldr	r1, [ip]
	.loc 1 1901 60
	ldr	r2, [r1, #36]
	.loc 1 1901 73
	ldr	r3, .L213
	ands	r3, r3, r2
	.loc 1 1901 155
	ldr	r2, [sp, #8]
	.loc 1 1901 170
	lsls	r2, r2, #4
	.loc 1 1901 145
	ldr	r0, [sp, #12]
.LVL210:
	orr	r2, r2, r0, lsl #8
	.loc 1 1901 118
	orrs	r3, r3, r2
	.loc 1 1901 36
	str	r3, [r1, #36]
.L210:
	.loc 1 1916 3 is_stmt 1
	.loc 1 1916 17 is_stmt 0
	movs	r3, #1
	strb	r3, [ip, #97]
	.loc 1 1919 3 is_stmt 1
	.loc 1 1919 7
	.loc 1 1919 22 is_stmt 0
	movs	r0, #0
	strb	r0, [ip, #96]
	.loc 1 1919 5 is_stmt 1
	.loc 1 1921 3
.L208:
	.loc 1 1922 1 is_stmt 0
	add	sp, sp, #16
	.cfi_remember_state
	.cfi_def_cfa_offset 0
.LVL211:
	@ sp needed
	bx	lr
.LVL212:
.L209:
	.cfi_restore_state
	.loc 1 1908 5 is_stmt 1
	.loc 1 1908 13 is_stmt 0
	ldr	r3, [ip]
.LVL213:
	.loc 1 1908 33
	ldr	r2, [sp, #4]
	str	r2, [r3, #44]
	.loc 1 1911 5 is_stmt 1
	.loc 1 1911 50 is_stmt 0
	ldr	r1, [ip]
	.loc 1 1911 60
	ldr	r2, [r1, #28]
	.loc 1 1911 73
	ldr	r3, .L213
	ands	r3, r3, r2
	.loc 1 1911 155
	ldr	r2, [sp, #8]
	.loc 1 1911 170
	lsls	r2, r2, #4
	.loc 1 1911 145
	ldr	r0, [sp, #12]
.LVL214:
	orr	r2, r2, r0, lsl #8
	.loc 1 1911 118
	orrs	r3, r3, r2
	.loc 1 1911 36
	str	r3, [r1, #28]
	b	.L210
.LVL215:
.L211:
	.loc 1 1889 49
	movs	r0, #2
.LVL216:
	b	.L208
.L214:
	.align	2
.L213:
	.word	-65297
	.cfi_endproc
.LFE359:
	.size	HAL_DMA2D_ConfigCLUT, .-HAL_DMA2D_ConfigCLUT
	.section	.text.HAL_DMA2D_ProgramLineEvent,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_ProgramLineEvent
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_ProgramLineEvent, %function
HAL_DMA2D_ProgramLineEvent:
.LFB360:
	.loc 1 1936 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL217:
	.loc 1 1938 3
	.loc 1 1938 6 is_stmt 0
	cmp	r1, #65536
	bcs	.L217
	.loc 1 1945 5 is_stmt 1
	.loc 1 1945 9
	.loc 1 1945 20 is_stmt 0
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	.loc 1 1945 11
	cmp	r3, #1
	beq	.L218
	.loc 1 1945 70 is_stmt 1 discriminator 2
	.loc 1 1945 85 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #96]
	.loc 1 1945 7 is_stmt 1 discriminator 2
	.loc 1 1948 5 discriminator 2
	.loc 1 1948 19 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #97]
	.loc 1 1951 5 is_stmt 1 discriminator 2
	.loc 1 1951 13 is_stmt 0 discriminator 2
	ldr	r3, [r0]
	.loc 1 1951 30 discriminator 2
	str	r1, [r3, #72]
	.loc 1 1954 5 is_stmt 1 discriminator 2
	.loc 1 1954 14 is_stmt 0 discriminator 2
	ldr	r1, [r0]
.LVL218:
	.loc 1 1954 24 discriminator 2
	ldr	r3, [r1]
.LVL219:
	.loc 1 1954 29 discriminator 2
	orr	r3, r3, #1024
	str	r3, [r1]
	.loc 1 1957 5 is_stmt 1 discriminator 2
	.loc 1 1957 19 is_stmt 0 discriminator 2
	strb	r2, [r0, #97]
	.loc 1 1960 5 is_stmt 1 discriminator 2
	.loc 1 1960 9 discriminator 2
	.loc 1 1960 24 is_stmt 0 discriminator 2
	movs	r3, #0
	strb	r3, [r0, #96]
	.loc 1 1960 7 is_stmt 1 discriminator 2
	.loc 1 1962 5 discriminator 2
	.loc 1 1962 12 is_stmt 0 discriminator 2
	mov	r0, r3
.LVL220:
	bx	lr
.LVL221:
.L217:
	.loc 1 1940 12
	movs	r0, #1
.LVL222:
	bx	lr
.LVL223:
.L218:
	.loc 1 1945 51
	movs	r0, #2
.LVL224:
	.loc 1 1964 1
	bx	lr
	.cfi_endproc
.LFE360:
	.size	HAL_DMA2D_ProgramLineEvent, .-HAL_DMA2D_ProgramLineEvent
	.section	.text.HAL_DMA2D_EnableDeadTime,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_EnableDeadTime
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_EnableDeadTime, %function
HAL_DMA2D_EnableDeadTime:
.LFB361:
	.loc 1 1972 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL225:
	.loc 1 1974 3
	.loc 1 1974 7
	.loc 1 1974 18 is_stmt 0
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	.loc 1 1974 9
	cmp	r3, #1
	beq	.L221
	.loc 1 1974 68 is_stmt 1 discriminator 2
	.loc 1 1974 83 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #96]
	.loc 1 1974 5 is_stmt 1 discriminator 2
	.loc 1 1976 3 discriminator 2
	.loc 1 1976 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #97]
	.loc 1 1979 3 is_stmt 1 discriminator 2
	.loc 1 1979 11 is_stmt 0 discriminator 2
	ldr	r1, [r0]
	.loc 1 1979 21 discriminator 2
	ldr	r3, [r1, #76]
	.loc 1 1979 30 discriminator 2
	orrs	r3, r3, r2
	str	r3, [r1, #76]
	.loc 1 1981 3 is_stmt 1 discriminator 2
	.loc 1 1981 17 is_stmt 0 discriminator 2
	strb	r2, [r0, #97]
	.loc 1 1984 3 is_stmt 1 discriminator 2
	.loc 1 1984 7 discriminator 2
	.loc 1 1984 22 is_stmt 0 discriminator 2
	movs	r3, #0
	strb	r3, [r0, #96]
	.loc 1 1984 5 is_stmt 1 discriminator 2
	.loc 1 1986 3 discriminator 2
	.loc 1 1986 10 is_stmt 0 discriminator 2
	mov	r0, r3
.LVL226:
	bx	lr
.LVL227:
.L221:
	.loc 1 1974 49
	movs	r0, #2
.LVL228:
	.loc 1 1987 1
	bx	lr
	.cfi_endproc
.LFE361:
	.size	HAL_DMA2D_EnableDeadTime, .-HAL_DMA2D_EnableDeadTime
	.section	.text.HAL_DMA2D_DisableDeadTime,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_DisableDeadTime
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_DisableDeadTime, %function
HAL_DMA2D_DisableDeadTime:
.LFB362:
	.loc 1 1995 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL229:
	.loc 1 1997 3
	.loc 1 1997 7
	.loc 1 1997 18 is_stmt 0
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	.loc 1 1997 9
	cmp	r3, #1
	beq	.L224
	.loc 1 1997 68 is_stmt 1 discriminator 2
	.loc 1 1997 83 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #96]
	.loc 1 1997 5 is_stmt 1 discriminator 2
	.loc 1 1999 3 discriminator 2
	.loc 1 1999 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #97]
	.loc 1 2002 3 is_stmt 1 discriminator 2
	.loc 1 2002 11 is_stmt 0 discriminator 2
	ldr	r1, [r0]
	.loc 1 2002 21 discriminator 2
	ldr	r3, [r1, #76]
	.loc 1 2002 30 discriminator 2
	bic	r3, r3, #1
	str	r3, [r1, #76]
	.loc 1 2004 3 is_stmt 1 discriminator 2
	.loc 1 2004 17 is_stmt 0 discriminator 2
	strb	r2, [r0, #97]
	.loc 1 2007 3 is_stmt 1 discriminator 2
	.loc 1 2007 7 discriminator 2
	.loc 1 2007 22 is_stmt 0 discriminator 2
	movs	r3, #0
	strb	r3, [r0, #96]
	.loc 1 2007 5 is_stmt 1 discriminator 2
	.loc 1 2009 3 discriminator 2
	.loc 1 2009 10 is_stmt 0 discriminator 2
	mov	r0, r3
.LVL230:
	bx	lr
.LVL231:
.L224:
	.loc 1 1997 49
	movs	r0, #2
.LVL232:
	.loc 1 2010 1
	bx	lr
	.cfi_endproc
.LFE362:
	.size	HAL_DMA2D_DisableDeadTime, .-HAL_DMA2D_DisableDeadTime
	.section	.text.HAL_DMA2D_ConfigDeadTime,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_ConfigDeadTime
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_ConfigDeadTime, %function
HAL_DMA2D_ConfigDeadTime:
.LFB363:
	.loc 1 2021 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL233:
	.loc 1 2023 3
	.loc 1 2023 7
	.loc 1 2023 18 is_stmt 0
	ldrb	r3, [r0, #96]	@ zero_extendqisi2
	.loc 1 2023 9
	cmp	r3, #1
	beq	.L227
	.loc 1 2021 1 discriminator 2
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 2023 68 is_stmt 1 discriminator 2
	.loc 1 2023 83 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #96]
	.loc 1 2023 5 is_stmt 1 discriminator 2
	.loc 1 2025 3 discriminator 2
	.loc 1 2025 17 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #97]
	.loc 1 2028 3 is_stmt 1 discriminator 2
	.loc 1 2028 46 is_stmt 0 discriminator 2
	ldr	r4, [r0]
	.loc 1 2028 56 discriminator 2
	ldr	r3, [r4, #76]
	.loc 1 2028 67 discriminator 2
	bic	r3, r3, #65280
	.loc 1 2028 92 discriminator 2
	orr	r1, r3, r1, lsl #8
.LVL234:
	.loc 1 2028 32 discriminator 2
	str	r1, [r4, #76]
	.loc 1 2030 3 is_stmt 1 discriminator 2
	.loc 1 2030 17 is_stmt 0 discriminator 2
	strb	r2, [r0, #97]
	.loc 1 2033 3 is_stmt 1 discriminator 2
	.loc 1 2033 7 discriminator 2
	.loc 1 2033 22 is_stmt 0 discriminator 2
	movs	r3, #0
	strb	r3, [r0, #96]
	.loc 1 2033 5 is_stmt 1 discriminator 2
	.loc 1 2035 3 discriminator 2
	.loc 1 2035 10 is_stmt 0 discriminator 2
	mov	r0, r3
.LVL235:
	.loc 1 2036 1 discriminator 2
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL236:
.L227:
	.loc 1 2023 49
	movs	r0, #2
.LVL237:
	.loc 1 2036 1
	bx	lr
	.cfi_endproc
.LFE363:
	.size	HAL_DMA2D_ConfigDeadTime, .-HAL_DMA2D_ConfigDeadTime
	.section	.text.HAL_DMA2D_GetState,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_GetState
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_GetState, %function
HAL_DMA2D_GetState:
.LFB364:
	.loc 1 2066 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL238:
	.loc 1 2067 3
	.loc 1 2067 16 is_stmt 0
	ldrb	r0, [r0, #97]	@ zero_extendqisi2
.LVL239:
	.loc 1 2068 1
	bx	lr
	.cfi_endproc
.LFE364:
	.size	HAL_DMA2D_GetState, .-HAL_DMA2D_GetState
	.section	.text.HAL_DMA2D_GetError,"ax",%progbits
	.align	1
	.global	HAL_DMA2D_GetError
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA2D_GetError, %function
HAL_DMA2D_GetError:
.LFB365:
	.loc 1 2077 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL240:
	.loc 1 2078 3
	.loc 1 2078 16 is_stmt 0
	ldr	r0, [r0, #100]
.LVL241:
	.loc 1 2079 1
	bx	lr
	.cfi_endproc
.LFE365:
	.size	HAL_DMA2D_GetError, .-HAL_DMA2D_GetError
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dma2d.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x136a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x1c
	.4byte	.LASF195
	.byte	0x1d
	.4byte	.LASF196
	.4byte	.LASF197
	.4byte	.LLRL75
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
	.uleb128 0xb
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
	.uleb128 0xb
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
	.uleb128 0x1d
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0xb
	.4byte	.LASF11
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x34
	.uleb128 0xb
	.4byte	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x55
	.uleb128 0x16
	.4byte	0x90
	.uleb128 0x1e
	.4byte	0x9c
	.uleb128 0x11
	.4byte	0x90
	.4byte	0xb6
	.uleb128 0x12
	.4byte	0x7d
	.byte	0x3
	.byte	0
	.uleb128 0x1a
	.2byte	0xc00
	.2byte	0x284
	.4byte	0x1ec
	.uleb128 0xd
	.ascii	"CR\000"
	.2byte	0x286
	.byte	0x15
	.4byte	0x9c
	.byte	0
	.uleb128 0xd
	.ascii	"ISR\000"
	.2byte	0x287
	.byte	0x15
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF13
	.2byte	0x288
	.byte	0x15
	.4byte	0x9c
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF14
	.2byte	0x289
	.byte	0x15
	.4byte	0x9c
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF15
	.2byte	0x28a
	.byte	0x15
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF16
	.2byte	0x28b
	.byte	0x15
	.4byte	0x9c
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF17
	.2byte	0x28c
	.byte	0x15
	.4byte	0x9c
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF18
	.2byte	0x28d
	.byte	0x15
	.4byte	0x9c
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF19
	.2byte	0x28e
	.byte	0x15
	.4byte	0x9c
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF20
	.2byte	0x28f
	.byte	0x15
	.4byte	0x9c
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF21
	.2byte	0x290
	.byte	0x15
	.4byte	0x9c
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF22
	.2byte	0x291
	.byte	0x15
	.4byte	0x9c
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF23
	.2byte	0x292
	.byte	0x15
	.4byte	0x9c
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF24
	.2byte	0x293
	.byte	0x15
	.4byte	0x9c
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF25
	.2byte	0x294
	.byte	0x15
	.4byte	0x9c
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF26
	.2byte	0x295
	.byte	0x15
	.4byte	0x9c
	.byte	0x3c
	.uleb128 0xd
	.ascii	"OOR\000"
	.2byte	0x296
	.byte	0x15
	.4byte	0x9c
	.byte	0x40
	.uleb128 0xd
	.ascii	"NLR\000"
	.2byte	0x297
	.byte	0x15
	.4byte	0x9c
	.byte	0x44
	.uleb128 0xd
	.ascii	"LWR\000"
	.2byte	0x298
	.byte	0x15
	.4byte	0x9c
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF27
	.2byte	0x299
	.byte	0x15
	.4byte	0x9c
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF28
	.2byte	0x29a
	.byte	0xc
	.4byte	0x1ec
	.byte	0x50
	.uleb128 0xc
	.4byte	.LASF29
	.2byte	0x29b
	.byte	0x15
	.4byte	0x20c
	.2byte	0x400
	.uleb128 0xc
	.4byte	.LASF30
	.2byte	0x29c
	.byte	0x15
	.4byte	0x20c
	.2byte	0x800
	.byte	0
	.uleb128 0x11
	.4byte	0x90
	.4byte	0x1fc
	.uleb128 0x12
	.4byte	0x7d
	.byte	0xeb
	.byte	0
	.uleb128 0x11
	.4byte	0x9c
	.4byte	0x20c
	.uleb128 0x12
	.4byte	0x7d
	.byte	0xff
	.byte	0
	.uleb128 0x16
	.4byte	0x1fc
	.uleb128 0x1b
	.4byte	.LASF31
	.2byte	0x29d
	.4byte	0xb6
	.uleb128 0x11
	.4byte	0x90
	.4byte	0x22c
	.uleb128 0x12
	.4byte	0x7d
	.byte	0x8
	.byte	0
	.uleb128 0x1a
	.2byte	0x130
	.2byte	0x4cd
	.4byte	0x58b
	.uleb128 0xd
	.ascii	"CR\000"
	.2byte	0x4cf
	.byte	0x14
	.4byte	0x9c
	.byte	0
	.uleb128 0x1
	.4byte	.LASF32
	.2byte	0x4d0
	.byte	0x14
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF33
	.2byte	0x4d1
	.byte	0x14
	.4byte	0x9c
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF34
	.2byte	0x4d2
	.byte	0x14
	.4byte	0x9c
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF35
	.2byte	0x4d3
	.byte	0x14
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF36
	.2byte	0x4d4
	.byte	0xb
	.4byte	0x90
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x4d5
	.byte	0x14
	.4byte	0x9c
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF38
	.2byte	0x4d6
	.byte	0x14
	.4byte	0x9c
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF39
	.2byte	0x4d7
	.byte	0x14
	.4byte	0x9c
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF40
	.2byte	0x4d8
	.byte	0xb
	.4byte	0x90
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF41
	.2byte	0x4d9
	.byte	0x14
	.4byte	0x9c
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF42
	.2byte	0x4da
	.byte	0x14
	.4byte	0x9c
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF43
	.2byte	0x4db
	.byte	0x14
	.4byte	0x9c
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF44
	.2byte	0x4dc
	.byte	0x14
	.4byte	0x9c
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF45
	.2byte	0x4dd
	.byte	0x14
	.4byte	0x9c
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF46
	.2byte	0x4de
	.byte	0x14
	.4byte	0x9c
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF47
	.2byte	0x4df
	.byte	0x14
	.4byte	0x9c
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF48
	.2byte	0x4e0
	.byte	0x14
	.4byte	0x9c
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF49
	.2byte	0x4e1
	.byte	0xb
	.4byte	0x90
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF50
	.2byte	0x4e2
	.byte	0x14
	.4byte	0x9c
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF51
	.2byte	0x4e3
	.byte	0x14
	.4byte	0x9c
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF52
	.2byte	0x4e4
	.byte	0x14
	.4byte	0x9c
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF53
	.2byte	0x4e5
	.byte	0x14
	.4byte	0x9c
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF54
	.2byte	0x4e6
	.byte	0xb
	.4byte	0x90
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF55
	.2byte	0x4e7
	.byte	0x14
	.4byte	0x9c
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF56
	.2byte	0x4e8
	.byte	0x14
	.4byte	0x9c
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF57
	.2byte	0x4e9
	.byte	0x14
	.4byte	0x9c
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF58
	.2byte	0x4ea
	.byte	0xb
	.4byte	0x90
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF59
	.2byte	0x4eb
	.byte	0x14
	.4byte	0x9c
	.byte	0x70
	.uleb128 0xd
	.ascii	"CSR\000"
	.2byte	0x4ec
	.byte	0x14
	.4byte	0x9c
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF60
	.2byte	0x4ed
	.byte	0xb
	.4byte	0x90
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF61
	.2byte	0x4ee
	.byte	0x14
	.4byte	0x9c
	.byte	0x7c
	.uleb128 0x1
	.4byte	.LASF62
	.2byte	0x4ef
	.byte	0x14
	.4byte	0x9c
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF63
	.2byte	0x4f0
	.byte	0x14
	.4byte	0x9c
	.byte	0x84
	.uleb128 0x1
	.4byte	.LASF64
	.2byte	0x4f1
	.byte	0x14
	.4byte	0x9c
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF65
	.2byte	0x4f2
	.byte	0x14
	.4byte	0x9c
	.byte	0x8c
	.uleb128 0x1
	.4byte	.LASF66
	.2byte	0x4f3
	.byte	0x14
	.4byte	0x9c
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF67
	.2byte	0x4f4
	.byte	0x14
	.4byte	0x9c
	.byte	0x94
	.uleb128 0x1
	.4byte	.LASF68
	.2byte	0x4f5
	.byte	0x14
	.4byte	0x9c
	.byte	0x98
	.uleb128 0x1
	.4byte	.LASF69
	.2byte	0x4f6
	.byte	0x14
	.4byte	0x9c
	.byte	0x9c
	.uleb128 0xd
	.ascii	"GCR\000"
	.2byte	0x4f7
	.byte	0x14
	.4byte	0x9c
	.byte	0xa0
	.uleb128 0x1
	.4byte	.LASF70
	.2byte	0x4f8
	.byte	0xb
	.4byte	0x90
	.byte	0xa4
	.uleb128 0x1
	.4byte	.LASF71
	.2byte	0x4f9
	.byte	0x14
	.4byte	0x9c
	.byte	0xa8
	.uleb128 0x1
	.4byte	.LASF72
	.2byte	0x4fa
	.byte	0xb
	.4byte	0x21c
	.byte	0xac
	.uleb128 0xd
	.ascii	"RSR\000"
	.2byte	0x4fb
	.byte	0x14
	.4byte	0x9c
	.byte	0xd0
	.uleb128 0x1
	.4byte	.LASF73
	.2byte	0x4fc
	.byte	0x14
	.4byte	0x9c
	.byte	0xd4
	.uleb128 0x1
	.4byte	.LASF74
	.2byte	0x4fd
	.byte	0x14
	.4byte	0x9c
	.byte	0xd8
	.uleb128 0x1
	.4byte	.LASF75
	.2byte	0x4fe
	.byte	0x14
	.4byte	0x9c
	.byte	0xdc
	.uleb128 0x1
	.4byte	.LASF76
	.2byte	0x4ff
	.byte	0x14
	.4byte	0x9c
	.byte	0xe0
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0x500
	.byte	0x14
	.4byte	0x9c
	.byte	0xe4
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x501
	.byte	0x14
	.4byte	0x9c
	.byte	0xe8
	.uleb128 0x1
	.4byte	.LASF79
	.2byte	0x502
	.byte	0x14
	.4byte	0x9c
	.byte	0xec
	.uleb128 0x1
	.4byte	.LASF80
	.2byte	0x503
	.byte	0x14
	.4byte	0x9c
	.byte	0xf0
	.uleb128 0x1
	.4byte	.LASF81
	.2byte	0x504
	.byte	0x14
	.4byte	0x9c
	.byte	0xf4
	.uleb128 0x1
	.4byte	.LASF82
	.2byte	0x505
	.byte	0xb
	.4byte	0x90
	.byte	0xf8
	.uleb128 0x1
	.4byte	.LASF83
	.2byte	0x506
	.byte	0x14
	.4byte	0x9c
	.byte	0xfc
	.uleb128 0xc
	.4byte	.LASF84
	.2byte	0x507
	.byte	0x14
	.4byte	0x9c
	.2byte	0x100
	.uleb128 0xc
	.4byte	.LASF85
	.2byte	0x508
	.byte	0x14
	.4byte	0x9c
	.2byte	0x104
	.uleb128 0xc
	.4byte	.LASF86
	.2byte	0x509
	.byte	0x14
	.4byte	0x9c
	.2byte	0x108
	.uleb128 0xc
	.4byte	.LASF87
	.2byte	0x50a
	.byte	0x14
	.4byte	0x9c
	.2byte	0x10c
	.uleb128 0xc
	.4byte	.LASF88
	.2byte	0x50b
	.byte	0x14
	.4byte	0x9c
	.2byte	0x110
	.uleb128 0xc
	.4byte	.LASF89
	.2byte	0x50c
	.byte	0x14
	.4byte	0x9c
	.2byte	0x114
	.uleb128 0xc
	.4byte	.LASF90
	.2byte	0x50d
	.byte	0x14
	.4byte	0x9c
	.2byte	0x118
	.uleb128 0xc
	.4byte	.LASF91
	.2byte	0x50e
	.byte	0x14
	.4byte	0x9c
	.2byte	0x11c
	.uleb128 0xc
	.4byte	.LASF92
	.2byte	0x50f
	.byte	0xb
	.4byte	0xa6
	.2byte	0x120
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF93
	.2byte	0x511
	.4byte	0x22c
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF94
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF95
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.4byte	.LASF96
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF97
	.uleb128 0x17
	.4byte	0x40
	.byte	0x5
	.byte	0x28
	.4byte	0x5d6
	.uleb128 0x8
	.4byte	.LASF98
	.byte	0
	.uleb128 0x8
	.4byte	.LASF99
	.byte	0x1
	.uleb128 0x8
	.4byte	.LASF100
	.byte	0x2
	.uleb128 0x8
	.4byte	.LASF101
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.4byte	.LASF102
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0x5b2
	.uleb128 0x17
	.4byte	0x40
	.byte	0x5
	.byte	0x33
	.4byte	0x5fa
	.uleb128 0x8
	.4byte	.LASF103
	.byte	0
	.uleb128 0x8
	.4byte	.LASF104
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.4byte	.LASF105
	.byte	0x5
	.byte	0x36
	.byte	0x3
	.4byte	0x5e2
	.uleb128 0x18
	.byte	0xc
	.byte	0x32
	.4byte	0x632
	.uleb128 0x4
	.4byte	.LASF106
	.byte	0x34
	.byte	0xd
	.4byte	0x632
	.byte	0
	.uleb128 0x4
	.4byte	.LASF107
	.byte	0x36
	.byte	0xc
	.4byte	0x90
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF108
	.byte	0x39
	.byte	0xc
	.4byte	0x90
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.4byte	0x90
	.uleb128 0xb
	.4byte	.LASF109
	.byte	0x6
	.byte	0x3b
	.byte	0x3
	.4byte	0x606
	.uleb128 0x18
	.byte	0x1c
	.byte	0x40
	.4byte	0x69f
	.uleb128 0x4
	.4byte	.LASF110
	.byte	0x42
	.byte	0xc
	.4byte	0x90
	.byte	0
	.uleb128 0x4
	.4byte	.LASF111
	.byte	0x45
	.byte	0xc
	.4byte	0x90
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF112
	.byte	0x48
	.byte	0xc
	.4byte	0x90
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF113
	.byte	0x4b
	.byte	0xc
	.4byte	0x90
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF114
	.byte	0x4e
	.byte	0xc
	.4byte	0x90
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF115
	.byte	0x53
	.byte	0xc
	.4byte	0x90
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF116
	.byte	0x56
	.byte	0xc
	.4byte	0x90
	.byte	0x18
	.byte	0
	.uleb128 0xb
	.4byte	.LASF117
	.byte	0x6
	.byte	0x59
	.byte	0x3
	.4byte	0x643
	.uleb128 0x18
	.byte	0x1c
	.byte	0x5f
	.4byte	0x707
	.uleb128 0x4
	.4byte	.LASF118
	.byte	0x61
	.byte	0xc
	.4byte	0x90
	.byte	0
	.uleb128 0x4
	.4byte	.LASF119
	.byte	0x65
	.byte	0xc
	.4byte	0x90
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF120
	.byte	0x68
	.byte	0xc
	.4byte	0x90
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF121
	.byte	0x6b
	.byte	0xc
	.4byte	0x90
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF113
	.byte	0x76
	.byte	0xc
	.4byte	0x90
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF114
	.byte	0x79
	.byte	0xc
	.4byte	0x90
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF122
	.byte	0x7c
	.byte	0xc
	.4byte	0x90
	.byte	0x18
	.byte	0
	.uleb128 0xb
	.4byte	.LASF123
	.byte	0x6
	.byte	0x7f
	.byte	0x3
	.4byte	0x6ab
	.uleb128 0x17
	.4byte	0x40
	.byte	0x6
	.byte	0x85
	.4byte	0x743
	.uleb128 0x8
	.4byte	.LASF124
	.byte	0
	.uleb128 0x8
	.4byte	.LASF125
	.byte	0x1
	.uleb128 0x8
	.4byte	.LASF126
	.byte	0x2
	.uleb128 0x8
	.4byte	.LASF127
	.byte	0x3
	.uleb128 0x8
	.4byte	.LASF128
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF129
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.4byte	.LASF130
	.byte	0x6
	.byte	0x8c
	.byte	0x3
	.4byte	0x713
	.uleb128 0x16
	.4byte	0x743
	.uleb128 0x1f
	.4byte	.LASF198
	.byte	0x68
	.byte	0x6
	.byte	0x91
	.byte	0x10
	.4byte	0x7c2
	.uleb128 0x4
	.4byte	.LASF131
	.byte	0x93
	.byte	0x12
	.4byte	0x7c2
	.byte	0
	.uleb128 0x4
	.4byte	.LASF132
	.byte	0x95
	.byte	0x15
	.4byte	0x69f
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF133
	.byte	0x97
	.byte	0xb
	.4byte	0x7d7
	.byte	0x20
	.uleb128 0x4
	.4byte	.LASF134
	.byte	0x99
	.byte	0xb
	.4byte	0x7d7
	.byte	0x24
	.uleb128 0x4
	.4byte	.LASF135
	.byte	0xa6
	.byte	0x19
	.4byte	0x7dc
	.byte	0x28
	.uleb128 0x4
	.4byte	.LASF136
	.byte	0xa8
	.byte	0x13
	.4byte	0x5fa
	.byte	0x60
	.uleb128 0x4
	.4byte	.LASF137
	.byte	0xaa
	.byte	0x23
	.4byte	0x74f
	.byte	0x61
	.uleb128 0x4
	.4byte	.LASF138
	.byte	0xac
	.byte	0x15
	.4byte	0x9c
	.byte	0x64
	.byte	0
	.uleb128 0xe
	.4byte	0x211
	.uleb128 0x20
	.4byte	0x7d2
	.uleb128 0x21
	.4byte	0x7d2
	.byte	0
	.uleb128 0xe
	.4byte	0x754
	.uleb128 0xe
	.4byte	0x7c7
	.uleb128 0x11
	.4byte	0x707
	.4byte	0x7ec
	.uleb128 0x12
	.4byte	0x7d
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.4byte	.LASF139
	.byte	0x6
	.byte	0xad
	.byte	0x3
	.4byte	0x754
	.uleb128 0x22
	.4byte	.LASF199
	.byte	0x7
	.2byte	0x433
	.byte	0xa
	.4byte	0x90
	.uleb128 0x23
	.4byte	.LASF200
	.byte	0x1
	.2byte	0x838
	.byte	0xd
	.4byte	.LFB366
	.4byte	.LFE366-.LFB366
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8bb
	.uleb128 0x9
	.4byte	.LASF140
	.2byte	0x838
	.byte	0x32
	.4byte	0x8bb
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x838
	.byte	0x43
	.4byte	0x90
	.4byte	.LLST0
	.uleb128 0x2
	.4byte	.LASF142
	.2byte	0x838
	.byte	0x53
	.4byte	0x90
	.4byte	.LLST1
	.uleb128 0x2
	.4byte	.LASF143
	.2byte	0x838
	.byte	0x68
	.4byte	0x90
	.4byte	.LLST2
	.uleb128 0x2
	.4byte	.LASF144
	.2byte	0x839
	.byte	0x26
	.4byte	0x90
	.4byte	.LLST3
	.uleb128 0x19
	.ascii	"tmp\000"
	.2byte	0x83b
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST4
	.uleb128 0xa
	.4byte	.LASF145
	.2byte	0x83c
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST5
	.uleb128 0xa
	.4byte	.LASF146
	.2byte	0x83d
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST6
	.uleb128 0xa
	.4byte	.LASF147
	.2byte	0x83e
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST7
	.uleb128 0xa
	.4byte	.LASF148
	.2byte	0x83f
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST8
	.byte	0
	.uleb128 0xe
	.4byte	0x7ec
	.uleb128 0x5
	.4byte	.LASF149
	.2byte	0x81c
	.byte	0xa
	.4byte	0x90
	.4byte	.LFB365
	.4byte	.LFE365-.LFB365
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8eb
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x81c
	.byte	0x32
	.4byte	0x8bb
	.4byte	.LLST74
	.byte	0
	.uleb128 0x5
	.4byte	.LASF150
	.2byte	0x811
	.byte	0x18
	.4byte	0x743
	.4byte	.LFB364
	.4byte	.LFE364-.LFB364
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x916
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x811
	.byte	0x40
	.4byte	0x8bb
	.4byte	.LLST73
	.byte	0
	.uleb128 0x5
	.4byte	.LASF151
	.2byte	0x7e4
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB363
	.4byte	.LFE363-.LFB363
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x951
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x7e4
	.byte	0x41
	.4byte	0x8bb
	.4byte	.LLST71
	.uleb128 0x2
	.4byte	.LASF152
	.2byte	0x7e4
	.byte	0x51
	.4byte	0x84
	.4byte	.LLST72
	.byte	0
	.uleb128 0x5
	.4byte	.LASF153
	.2byte	0x7ca
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB362
	.4byte	.LFE362-.LFB362
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x97c
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x7ca
	.byte	0x42
	.4byte	0x8bb
	.4byte	.LLST70
	.byte	0
	.uleb128 0x5
	.4byte	.LASF154
	.2byte	0x7b3
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB361
	.4byte	.LFE361-.LFB361
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9a7
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x7b3
	.byte	0x41
	.4byte	0x8bb
	.4byte	.LLST69
	.byte	0
	.uleb128 0x5
	.4byte	.LASF155
	.2byte	0x78f
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB360
	.4byte	.LFE360-.LFB360
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9e2
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x78f
	.byte	0x43
	.4byte	0x8bb
	.4byte	.LLST67
	.uleb128 0x2
	.4byte	.LASF156
	.2byte	0x78f
	.byte	0x54
	.4byte	0x90
	.4byte	.LLST68
	.byte	0
	.uleb128 0x5
	.4byte	.LASF157
	.2byte	0x759
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB359
	.4byte	.LFE359-.LFB359
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa2c
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x759
	.byte	0x3d
	.4byte	0x8bb
	.4byte	.LLST65
	.uleb128 0x9
	.4byte	.LASF158
	.2byte	0x759
	.byte	0x5a
	.4byte	0x637
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.4byte	.LASF159
	.2byte	0x759
	.byte	0x6c
	.4byte	0x90
	.4byte	.LLST66
	.byte	0
	.uleb128 0x5
	.4byte	.LASF160
	.2byte	0x6eb
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB358
	.4byte	.LFE358-.LFB358
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa97
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x6eb
	.byte	0x3e
	.4byte	0x8bb
	.4byte	.LLST60
	.uleb128 0x2
	.4byte	.LASF159
	.2byte	0x6eb
	.byte	0x4f
	.4byte	0x90
	.4byte	.LLST61
	.uleb128 0xa
	.4byte	.LASF161
	.2byte	0x6ed
	.byte	0x1a
	.4byte	0xa97
	.4byte	.LLST62
	.uleb128 0xa
	.4byte	.LASF162
	.2byte	0x6ee
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST63
	.uleb128 0xa
	.4byte	.LASF163
	.2byte	0x6ef
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST64
	.byte	0
	.uleb128 0xe
	.4byte	0x707
	.uleb128 0x13
	.4byte	.LASF164
	.2byte	0x6c0
	.byte	0x1c
	.4byte	.LFB357
	.4byte	.LFE357-.LFB357
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xac1
	.uleb128 0x9
	.4byte	.LASF140
	.2byte	0x6c0
	.byte	0x53
	.4byte	0x8bb
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x13
	.4byte	.LASF165
	.2byte	0x6b0
	.byte	0x1c
	.4byte	.LFB356
	.4byte	.LFE356-.LFB356
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xae6
	.uleb128 0x9
	.4byte	.LASF140
	.2byte	0x6b0
	.byte	0x4d
	.4byte	0x8bb
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x13
	.4byte	.LASF166
	.2byte	0x606
	.byte	0x6
	.4byte	.LFB355
	.4byte	.LFE355-.LFB355
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb8d
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x606
	.byte	0x30
	.4byte	0x8bb
	.4byte	.LLST59
	.uleb128 0x14
	.4byte	.LASF167
	.2byte	0x608
	.byte	0xc
	.4byte	0x90
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x14
	.4byte	.LASF168
	.2byte	0x609
	.byte	0xc
	.4byte	0x90
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x15
	.4byte	.LVL182
	.4byte	0xb38
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.4byte	.LVL183
	.4byte	0xb48
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.4byte	.LVL184
	.4byte	0xb58
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.4byte	.LVL185
	.4byte	0xb68
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.4byte	.LVL187
	.4byte	0xac1
	.4byte	0xb7c
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x10
	.4byte	.LVL188
	.4byte	0xa9c
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x5
	.4byte	.LASF169
	.2byte	0x586
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB354
	.4byte	.LFE354-.LFB354
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc1b
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x586
	.byte	0x42
	.4byte	0x8bb
	.4byte	.LLST55
	.uleb128 0x2
	.4byte	.LASF170
	.2byte	0x586
	.byte	0x53
	.4byte	0x90
	.4byte	.LLST56
	.uleb128 0xa
	.4byte	.LASF171
	.2byte	0x588
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST57
	.uleb128 0xa
	.4byte	.LASF172
	.2byte	0x589
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST58
	.uleb128 0x14
	.4byte	.LASF167
	.2byte	0x58a
	.byte	0x15
	.4byte	0x9c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.4byte	.LVL170
	.4byte	0x7f8
	.uleb128 0x7
	.4byte	.LVL172
	.4byte	0x7f8
	.uleb128 0x7
	.4byte	.LVL174
	.4byte	0x7f8
	.uleb128 0x7
	.4byte	.LVL176
	.4byte	0x7f8
	.byte	0
	.uleb128 0x5
	.4byte	.LASF173
	.2byte	0x55b
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB353
	.4byte	.LFE353-.LFB353
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc54
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x55b
	.byte	0x45
	.4byte	0x8bb
	.4byte	.LLST54
	.uleb128 0x9
	.4byte	.LASF159
	.2byte	0x55b
	.byte	0x56
	.4byte	0x90
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x5
	.4byte	.LASF174
	.2byte	0x51a
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB352
	.4byte	.LFE352-.LFB352
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcd1
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x51a
	.byte	0x46
	.4byte	0x8bb
	.4byte	.LLST49
	.uleb128 0x2
	.4byte	.LASF159
	.2byte	0x51a
	.byte	0x57
	.4byte	0x90
	.4byte	.LLST50
	.uleb128 0xa
	.4byte	.LASF171
	.2byte	0x51c
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST51
	.uleb128 0xa
	.4byte	.LASF175
	.2byte	0x51d
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST52
	.uleb128 0x19
	.ascii	"reg\000"
	.2byte	0x51e
	.byte	0x1c
	.4byte	0xcd1
	.4byte	.LLST53
	.uleb128 0x7
	.4byte	.LVL146
	.4byte	0x7f8
	.uleb128 0x7
	.4byte	.LVL157
	.4byte	0x7f8
	.byte	0
	.uleb128 0xe
	.4byte	0xa1
	.uleb128 0x5
	.4byte	.LASF176
	.2byte	0x4e1
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd43
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x4e1
	.byte	0x44
	.4byte	0x8bb
	.4byte	.LLST44
	.uleb128 0x2
	.4byte	.LASF159
	.2byte	0x4e1
	.byte	0x55
	.4byte	0x90
	.4byte	.LLST45
	.uleb128 0xa
	.4byte	.LASF171
	.2byte	0x4e3
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST46
	.uleb128 0x19
	.ascii	"reg\000"
	.2byte	0x4e4
	.byte	0x1c
	.4byte	0xcd1
	.4byte	.LLST47
	.uleb128 0x7
	.4byte	.LVL125
	.4byte	0x7f8
	.uleb128 0x7
	.4byte	.LVL127
	.4byte	0x7f8
	.byte	0
	.uleb128 0x5
	.4byte	.LASF177
	.2byte	0x4a7
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd8d
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x4a7
	.byte	0x3e
	.4byte	0x8bb
	.4byte	.LLST42
	.uleb128 0x9
	.4byte	.LASF158
	.2byte	0x4a7
	.byte	0x5b
	.4byte	0x637
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2
	.4byte	.LASF159
	.2byte	0x4a7
	.byte	0x6d
	.4byte	0x90
	.4byte	.LLST43
	.byte	0
	.uleb128 0x5
	.4byte	.LASF178
	.2byte	0x46e
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdd7
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x46e
	.byte	0x3b
	.4byte	0x8bb
	.4byte	.LLST40
	.uleb128 0x9
	.4byte	.LASF158
	.2byte	0x46e
	.byte	0x58
	.4byte	0x637
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2
	.4byte	.LASF159
	.2byte	0x46e
	.byte	0x6a
	.4byte	0x90
	.4byte	.LLST41
	.byte	0
	.uleb128 0x5
	.4byte	.LASF179
	.2byte	0x42e
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe20
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x42e
	.byte	0x43
	.4byte	0x8bb
	.4byte	.LLST38
	.uleb128 0x9
	.4byte	.LASF158
	.2byte	0x42e
	.byte	0x61
	.4byte	0xe20
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.4byte	.LASF159
	.2byte	0x42f
	.byte	0x37
	.4byte	0x90
	.4byte	.LLST39
	.byte	0
	.uleb128 0xe
	.4byte	0x637
	.uleb128 0x5
	.4byte	.LASF180
	.2byte	0x3f8
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe6e
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x3f8
	.byte	0x40
	.4byte	0x8bb
	.4byte	.LLST36
	.uleb128 0x9
	.4byte	.LASF158
	.2byte	0x3f8
	.byte	0x5e
	.4byte	0xe20
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.4byte	.LASF159
	.2byte	0x3f8
	.byte	0x70
	.4byte	0x90
	.4byte	.LLST37
	.byte	0
	.uleb128 0x5
	.4byte	.LASF181
	.2byte	0x3d4
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xea7
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x3d4
	.byte	0x3d
	.4byte	0x8bb
	.4byte	.LLST35
	.uleb128 0x9
	.4byte	.LASF159
	.2byte	0x3d4
	.byte	0x4e
	.4byte	0x90
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x5
	.4byte	.LASF182
	.2byte	0x3b8
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xed2
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x3b8
	.byte	0x39
	.4byte	0x8bb
	.4byte	.LLST34
	.byte	0
	.uleb128 0x5
	.4byte	.LASF183
	.2byte	0x387
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf1d
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x387
	.byte	0x3a
	.4byte	0x8bb
	.4byte	.LLST33
	.uleb128 0x14
	.4byte	.LASF171
	.2byte	0x389
	.byte	0xc
	.4byte	0x90
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x7
	.4byte	.LVL79
	.4byte	0x7f8
	.uleb128 0x7
	.4byte	.LVL81
	.4byte	0x7f8
	.byte	0
	.uleb128 0x5
	.4byte	.LASF184
	.2byte	0x356
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf68
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x356
	.byte	0x38
	.4byte	0x8bb
	.4byte	.LLST32
	.uleb128 0x14
	.4byte	.LASF171
	.2byte	0x358
	.byte	0xc
	.4byte	0x90
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x7
	.4byte	.LVL75
	.4byte	0x7f8
	.uleb128 0x7
	.4byte	.LVL77
	.4byte	0x7f8
	.byte	0
	.uleb128 0x5
	.4byte	.LASF185
	.2byte	0x324
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x105d
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x324
	.byte	0x43
	.4byte	0x8bb
	.4byte	.LLST26
	.uleb128 0x2
	.4byte	.LASF186
	.2byte	0x324
	.byte	0x54
	.4byte	0x90
	.4byte	.LLST27
	.uleb128 0x2
	.4byte	.LASF187
	.2byte	0x324
	.byte	0x6a
	.4byte	0x90
	.4byte	.LLST28
	.uleb128 0x2
	.4byte	.LASF142
	.2byte	0x325
	.byte	0x37
	.4byte	0x90
	.4byte	.LLST29
	.uleb128 0x2
	.4byte	.LASF143
	.2byte	0x325
	.byte	0x4c
	.4byte	0x90
	.4byte	.LLST30
	.uleb128 0x2
	.4byte	.LASF144
	.2byte	0x325
	.byte	0x5c
	.4byte	0x90
	.4byte	.LLST31
	.uleb128 0xf
	.4byte	.LVL64
	.4byte	0x805
	.4byte	0x1013
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0xf
	.4byte	.LVL68
	.4byte	0x805
	.4byte	0x103d
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0x10
	.4byte	.LVL71
	.4byte	0x805
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x5
	.4byte	.LASF188
	.2byte	0x2ee
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1152
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x2ee
	.byte	0x40
	.4byte	0x8bb
	.4byte	.LLST20
	.uleb128 0x2
	.4byte	.LASF186
	.2byte	0x2ee
	.byte	0x51
	.4byte	0x90
	.4byte	.LLST21
	.uleb128 0x2
	.4byte	.LASF187
	.2byte	0x2ee
	.byte	0x67
	.4byte	0x90
	.4byte	.LLST22
	.uleb128 0x2
	.4byte	.LASF142
	.2byte	0x2ef
	.byte	0x34
	.4byte	0x90
	.4byte	.LLST23
	.uleb128 0x2
	.4byte	.LASF143
	.2byte	0x2ef
	.byte	0x49
	.4byte	0x90
	.4byte	.LLST24
	.uleb128 0x2
	.4byte	.LASF144
	.2byte	0x2ef
	.byte	0x59
	.4byte	0x90
	.4byte	.LLST25
	.uleb128 0xf
	.4byte	.LVL49
	.4byte	0x805
	.4byte	0x1108
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0xf
	.4byte	.LVL53
	.4byte	0x805
	.4byte	0x1132
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0x10
	.4byte	.LVL56
	.4byte	0x805
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x5
	.4byte	.LASF189
	.2byte	0x2c9
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11ea
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x2c9
	.byte	0x3b
	.4byte	0x8bb
	.4byte	.LLST15
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x2c9
	.byte	0x4c
	.4byte	0x90
	.4byte	.LLST16
	.uleb128 0x2
	.4byte	.LASF142
	.2byte	0x2c9
	.byte	0x5c
	.4byte	0x90
	.4byte	.LLST17
	.uleb128 0x2
	.4byte	.LASF143
	.2byte	0x2c9
	.byte	0x71
	.4byte	0x90
	.4byte	.LLST18
	.uleb128 0x2
	.4byte	.LASF144
	.2byte	0x2ca
	.byte	0x2f
	.4byte	0x90
	.4byte	.LLST19
	.uleb128 0x10
	.4byte	.LVL42
	.4byte	0x805
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x5
	.4byte	.LASF190
	.2byte	0x2a5
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1282
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x2a5
	.byte	0x38
	.4byte	0x8bb
	.4byte	.LLST10
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x2a5
	.byte	0x49
	.4byte	0x90
	.4byte	.LLST11
	.uleb128 0x2
	.4byte	.LASF142
	.2byte	0x2a5
	.byte	0x59
	.4byte	0x90
	.4byte	.LLST12
	.uleb128 0x2
	.4byte	.LASF143
	.2byte	0x2a5
	.byte	0x6e
	.4byte	0x90
	.4byte	.LLST13
	.uleb128 0x2
	.4byte	.LASF144
	.2byte	0x2a6
	.byte	0x2c
	.4byte	0x90
	.4byte	.LLST14
	.uleb128 0x10
	.4byte	.LVL38
	.4byte	0x805
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF191
	.2byte	0x1a5
	.byte	0x1c
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12a7
	.uleb128 0x9
	.4byte	.LASF140
	.2byte	0x1a5
	.byte	0x45
	.4byte	0x8bb
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x13
	.4byte	.LASF192
	.2byte	0x195
	.byte	0x1c
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12cc
	.uleb128 0x9
	.4byte	.LASF140
	.2byte	0x195
	.byte	0x43
	.4byte	0x8bb
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x5
	.4byte	.LASF193
	.2byte	0x13b
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1336
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x13b
	.byte	0x39
	.4byte	0x8bb
	.4byte	.LLST48
	.uleb128 0xf
	.4byte	.LVL134
	.4byte	0x1282
	.4byte	0x130a
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL136
	.4byte	0xf1d
	.uleb128 0xf
	.4byte	.LVL138
	.4byte	0xcd6
	.4byte	0x1326
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x10
	.4byte	.LVL140
	.4byte	0xcd6
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LASF194
	.byte	0x1
	.byte	0xee
	.byte	0x13
	.4byte	0x5d6
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x25
	.4byte	.LASF140
	.byte	0x1
	.byte	0xee
	.byte	0x37
	.4byte	0x8bb
	.4byte	.LLST9
	.uleb128 0x10
	.4byte	.LVL32
	.4byte	0x12a7
	.uleb128 0x3
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
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x10
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x1b
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
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
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL4-.LVL0
	.uleb128 .LVL13-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL13-.LVL0
	.uleb128 .LVL14-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL0
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
	.uleb128 .LVL20-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL20-.LVL0
	.uleb128 .LVL21-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL21-.LVL0
	.uleb128 .LVL26-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL26-.LVL0
	.uleb128 .LVL27-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL27-.LVL0
	.uleb128 .LFE366-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL4-.LVL0
	.uleb128 .LVL8-.LVL0
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL8-.LVL0
	.uleb128 .LVL27-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL27-.LVL0
	.uleb128 .LFE366-.LVL0
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LFE366-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL4-.LVL0
	.uleb128 .LFE366-.LVL0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
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
	.uleb128 .LVL15-.LVL13
	.uleb128 .LVL16-.LVL13
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL20-.LVL13
	.uleb128 .LVL21-.LVL13
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL26-.LVL13
	.uleb128 .LVL27-.LVL13
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST5:
	.byte	0x8
	.4byte	.LVL5
	.uleb128 .LVL27-.LVL5
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL6
	.byte	0x4
	.uleb128 .LVL6-.LVL6
	.uleb128 .LVL12-.LVL6
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL12-.LVL6
	.uleb128 .LVL13-.LVL6
	.uleb128 0xa
	.byte	0x71
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x40
	.byte	0x24
	.byte	0x1a
	.byte	0x44
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL13-.LVL6
	.uleb128 .LVL14-.LVL6
	.uleb128 0xb
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x8
	.byte	0xff
	.byte	0x40
	.byte	0x24
	.byte	0x1a
	.byte	0x44
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL6
	.uleb128 .LVL15-.LVL6
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL16-.LVL6
	.uleb128 .LVL19-.LVL6
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL19-.LVL6
	.uleb128 .LVL20-.LVL6
	.uleb128 0xa
	.byte	0x71
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x40
	.byte	0x24
	.byte	0x1a
	.byte	0x43
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL20-.LVL6
	.uleb128 .LVL21-.LVL6
	.uleb128 0xb
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x8
	.byte	0xff
	.byte	0x40
	.byte	0x24
	.byte	0x1a
	.byte	0x43
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL21-.LVL6
	.uleb128 .LVL25-.LVL6
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL25-.LVL6
	.uleb128 .LVL26-.LVL6
	.uleb128 0xa
	.byte	0x71
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x40
	.byte	0x24
	.byte	0x1a
	.byte	0x43
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL26-.LVL6
	.uleb128 .LVL27-.LVL6
	.uleb128 0xb
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x8
	.byte	0xff
	.byte	0x40
	.byte	0x24
	.byte	0x1a
	.byte	0x43
	.byte	0x25
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x8
	.4byte	.LVL7
	.uleb128 .LVL27-.LVL7
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL8
	.byte	0x4
	.uleb128 .LVL8-.LVL8
	.uleb128 .LVL11-.LVL8
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL11-.LVL8
	.uleb128 .LVL14-.LVL8
	.uleb128 0x5
	.byte	0x72
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL8
	.uleb128 .LVL15-.LVL8
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL16-.LVL8
	.uleb128 .LVL18-.LVL8
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL18-.LVL8
	.uleb128 .LVL21-.LVL8
	.uleb128 0x5
	.byte	0x72
	.sleb128 0
	.byte	0x33
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL21-.LVL8
	.uleb128 .LVL24-.LVL8
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL24-.LVL8
	.uleb128 .LVL27-.LVL8
	.uleb128 0x5
	.byte	0x72
	.sleb128 0
	.byte	0x33
	.byte	0x25
	.byte	0x9f
	.byte	0
.LLST74:
	.byte	0x6
	.4byte	.LVL240
	.byte	0x4
	.uleb128 .LVL240-.LVL240
	.uleb128 .LVL241-.LVL240
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL241-.LVL240
	.uleb128 .LFE365-.LVL240
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST73:
	.byte	0x6
	.4byte	.LVL238
	.byte	0x4
	.uleb128 .LVL238-.LVL238
	.uleb128 .LVL239-.LVL238
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL239-.LVL238
	.uleb128 .LFE364-.LVL238
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST71:
	.byte	0x6
	.4byte	.LVL233
	.byte	0x4
	.uleb128 .LVL233-.LVL233
	.uleb128 .LVL235-.LVL233
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL235-.LVL233
	.uleb128 .LVL236-.LVL233
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL236-.LVL233
	.uleb128 .LVL237-.LVL233
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL237-.LVL233
	.uleb128 .LFE363-.LVL233
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST72:
	.byte	0x6
	.4byte	.LVL233
	.byte	0x4
	.uleb128 .LVL233-.LVL233
	.uleb128 .LVL234-.LVL233
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL234-.LVL233
	.uleb128 .LVL236-.LVL233
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL236-.LVL233
	.uleb128 .LFE363-.LVL233
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST70:
	.byte	0x6
	.4byte	.LVL229
	.byte	0x4
	.uleb128 .LVL229-.LVL229
	.uleb128 .LVL230-.LVL229
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL230-.LVL229
	.uleb128 .LVL231-.LVL229
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL231-.LVL229
	.uleb128 .LVL232-.LVL229
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL232-.LVL229
	.uleb128 .LFE362-.LVL229
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST69:
	.byte	0x6
	.4byte	.LVL225
	.byte	0x4
	.uleb128 .LVL225-.LVL225
	.uleb128 .LVL226-.LVL225
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL226-.LVL225
	.uleb128 .LVL227-.LVL225
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL227-.LVL225
	.uleb128 .LVL228-.LVL225
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL228-.LVL225
	.uleb128 .LFE361-.LVL225
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST67:
	.byte	0x6
	.4byte	.LVL217
	.byte	0x4
	.uleb128 .LVL217-.LVL217
	.uleb128 .LVL220-.LVL217
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL220-.LVL217
	.uleb128 .LVL221-.LVL217
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL221-.LVL217
	.uleb128 .LVL222-.LVL217
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL222-.LVL217
	.uleb128 .LVL223-.LVL217
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL223-.LVL217
	.uleb128 .LVL224-.LVL217
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL224-.LVL217
	.uleb128 .LFE360-.LVL217
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST68:
	.byte	0x6
	.4byte	.LVL217
	.byte	0x4
	.uleb128 .LVL217-.LVL217
	.uleb128 .LVL218-.LVL217
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL218-.LVL217
	.uleb128 .LVL219-.LVL217
	.uleb128 0x3
	.byte	0x73
	.sleb128 72
	.byte	0x4
	.uleb128 .LVL219-.LVL217
	.uleb128 .LVL221-.LVL217
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL221-.LVL217
	.uleb128 .LFE360-.LVL217
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST65:
	.byte	0x6
	.4byte	.LVL208
	.byte	0x4
	.uleb128 .LVL208-.LVL208
	.uleb128 .LVL209-.LVL208
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL209-.LVL208
	.uleb128 .LFE359-.LVL208
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST66:
	.byte	0x6
	.4byte	.LVL208
	.byte	0x4
	.uleb128 .LVL208-.LVL208
	.uleb128 .LVL209-.LVL208
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL209-.LVL208
	.uleb128 .LVL210-.LVL208
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL210-.LVL208
	.uleb128 .LVL211-.LVL208
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL211-.LVL208
	.uleb128 .LVL212-.LVL208
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL212-.LVL208
	.uleb128 .LVL213-.LVL208
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL213-.LVL208
	.uleb128 .LVL214-.LVL208
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL214-.LVL208
	.uleb128 .LVL215-.LVL208
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL215-.LVL208
	.uleb128 .LVL216-.LVL208
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL216-.LVL208
	.uleb128 .LFE359-.LVL208
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST60:
	.byte	0x6
	.4byte	.LVL189
	.byte	0x4
	.uleb128 .LVL189-.LVL189
	.uleb128 .LVL191-.LVL189
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL191-.LVL189
	.uleb128 .LVL206-.LVL189
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL206-.LVL189
	.uleb128 .LVL207-.LVL189
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL207-.LVL189
	.uleb128 .LFE358-.LVL189
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST61:
	.byte	0x6
	.4byte	.LVL189
	.byte	0x4
	.uleb128 .LVL189-.LVL189
	.uleb128 .LVL195-.LVL189
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL195-.LVL189
	.uleb128 .LVL196-.LVL189
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL196-.LVL189
	.uleb128 .LVL199-.LVL189
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL199-.LVL189
	.uleb128 .LVL200-.LVL189
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL200-.LVL189
	.uleb128 .LVL203-.LVL189
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL203-.LVL189
	.uleb128 .LVL204-.LVL189
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL204-.LVL189
	.uleb128 .LFE358-.LVL189
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST62:
	.byte	0x6
	.4byte	.LVL190
	.byte	0x4
	.uleb128 .LVL190-.LVL190
	.uleb128 .LVL191-.LVL190
	.uleb128 0xa
	.byte	0x71
	.sleb128 0
	.byte	0x4c
	.byte	0x1e
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x28
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL191-.LVL190
	.uleb128 .LVL195-.LVL190
	.uleb128 0xa
	.byte	0x71
	.sleb128 0
	.byte	0x4c
	.byte	0x1e
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x28
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL195-.LVL190
	.uleb128 .LVL196-.LVL190
	.uleb128 0xb
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x4c
	.byte	0x1e
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x28
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL196-.LVL190
	.uleb128 .LVL199-.LVL190
	.uleb128 0xa
	.byte	0x71
	.sleb128 0
	.byte	0x4c
	.byte	0x1e
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x28
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL199-.LVL190
	.uleb128 .LVL200-.LVL190
	.uleb128 0xb
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x4c
	.byte	0x1e
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x28
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL200-.LVL190
	.uleb128 .LVL203-.LVL190
	.uleb128 0xa
	.byte	0x71
	.sleb128 0
	.byte	0x4c
	.byte	0x1e
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x28
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL203-.LVL190
	.uleb128 .LVL204-.LVL190
	.uleb128 0xb
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x4c
	.byte	0x1e
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x28
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL204-.LVL190
	.uleb128 .LVL206-.LVL190
	.uleb128 0xa
	.byte	0x71
	.sleb128 0
	.byte	0x4c
	.byte	0x1e
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x28
	.byte	0x9f
	.byte	0
.LLST63:
	.byte	0x6
	.4byte	.LVL192
	.byte	0x4
	.uleb128 .LVL192-.LVL192
	.uleb128 .LVL195-.LVL192
	.uleb128 0x6
	.byte	0x11
	.sleb128 -13434865
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL196-.LVL192
	.uleb128 .LVL201-.LVL192
	.uleb128 0x6
	.byte	0x11
	.sleb128 -13434865
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL201-.LVL192
	.uleb128 .LVL204-.LVL192
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL204-.LVL192
	.uleb128 .LVL205-.LVL192
	.uleb128 0x6
	.byte	0x11
	.sleb128 -13434865
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL205-.LVL192
	.uleb128 .LVL206-.LVL192
	.uleb128 0x6
	.byte	0x11
	.sleb128 -12648433
	.byte	0x9f
	.byte	0
.LLST64:
	.byte	0x6
	.4byte	.LVL192
	.byte	0x4
	.uleb128 .LVL192-.LVL192
	.uleb128 .LVL194-.LVL192
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL196-.LVL192
	.uleb128 .LVL198-.LVL192
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL200-.LVL192
	.uleb128 .LVL202-.LVL192
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL204-.LVL192
	.uleb128 .LVL206-.LVL192
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST59:
	.byte	0x6
	.4byte	.LVL179
	.byte	0x4
	.uleb128 .LVL179-.LVL179
	.uleb128 .LVL182-1-.LVL179
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL182-1-.LVL179
	.uleb128 .LFE355-.LVL179
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST55:
	.byte	0x6
	.4byte	.LVL163
	.byte	0x4
	.uleb128 .LVL163-.LVL163
	.uleb128 .LVL164-.LVL163
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL164-.LVL163
	.uleb128 .LVL169-.LVL163
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL169-.LVL163
	.uleb128 .LVL170-1-.LVL163
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL170-1-.LVL163
	.uleb128 .LFE354-.LVL163
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST56:
	.byte	0x6
	.4byte	.LVL163
	.byte	0x4
	.uleb128 .LVL163-.LVL163
	.uleb128 .LVL164-.LVL163
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL164-.LVL163
	.uleb128 .LVL169-.LVL163
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL169-.LVL163
	.uleb128 .LVL170-1-.LVL163
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL170-1-.LVL163
	.uleb128 .LFE354-.LVL163
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST57:
	.byte	0x6
	.4byte	.LVL171
	.byte	0x4
	.uleb128 .LVL171-.LVL171
	.uleb128 .LVL173-.LVL171
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL175-.LVL171
	.uleb128 .LFE354-.LVL171
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST58:
	.byte	0x6
	.4byte	.LVL165
	.byte	0x4
	.uleb128 .LVL165-.LVL165
	.uleb128 .LVL167-.LVL165
	.uleb128 0x6
	.byte	0x73
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL173-.LVL165
	.uleb128 .LVL174-1-.LVL165
	.uleb128 0x6
	.byte	0x73
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST54:
	.byte	0x6
	.4byte	.LVL160
	.byte	0x4
	.uleb128 .LVL160-.LVL160
	.uleb128 .LVL161-.LVL160
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL161-.LVL160
	.uleb128 .LVL162-.LVL160
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL162-.LVL160
	.uleb128 .LFE353-.LVL160
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST49:
	.byte	0x6
	.4byte	.LVL143
	.byte	0x4
	.uleb128 .LVL143-.LVL143
	.uleb128 .LVL146-1-.LVL143
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL146-1-.LVL143
	.uleb128 .LVL150-.LVL143
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL150-.LVL143
	.uleb128 .LVL153-.LVL143
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL153-.LVL143
	.uleb128 .LFE352-.LVL143
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST50:
	.byte	0x6
	.4byte	.LVL143
	.byte	0x4
	.uleb128 .LVL143-.LVL143
	.uleb128 .LVL146-1-.LVL143
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL146-1-.LVL143
	.uleb128 .LVL150-.LVL143
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL150-.LVL143
	.uleb128 .LVL153-.LVL143
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL153-.LVL143
	.uleb128 .LFE352-.LVL143
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST51:
	.byte	0x6
	.4byte	.LVL147
	.byte	0x4
	.uleb128 .LVL147-.LVL147
	.uleb128 .LVL150-.LVL147
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL153-.LVL147
	.uleb128 .LVL154-.LVL147
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL154-.LVL147
	.uleb128 .LFE352-.LVL147
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LLST52:
	.byte	0x6
	.4byte	.LVL148
	.byte	0x4
	.uleb128 .LVL148-.LVL148
	.uleb128 .LVL150-.LVL148
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL153-.LVL148
	.uleb128 .LVL155-.LVL148
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL155-.LVL148
	.uleb128 .LVL156-.LVL148
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL156-.LVL148
	.uleb128 .LVL158-.LVL148
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL158-.LVL148
	.uleb128 .LVL159-.LVL148
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL159-.LVL148
	.uleb128 .LFE352-.LVL148
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST53:
	.byte	0x6
	.4byte	.LVL144
	.byte	0x4
	.uleb128 .LVL144-.LVL144
	.uleb128 .LVL145-.LVL144
	.uleb128 0x3
	.byte	0x72
	.sleb128 36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL145-.LVL144
	.uleb128 .LVL151-.LVL144
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL151-.LVL144
	.uleb128 .LVL152-.LVL144
	.uleb128 0x3
	.byte	0x72
	.sleb128 36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL152-.LVL144
	.uleb128 .LFE352-.LVL144
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST44:
	.byte	0x6
	.4byte	.LVL122
	.byte	0x4
	.uleb128 .LVL122-.LVL122
	.uleb128 .LVL125-1-.LVL122
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL125-1-.LVL122
	.uleb128 .LVL128-.LVL122
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL128-.LVL122
	.uleb128 .LVL131-.LVL122
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL131-.LVL122
	.uleb128 .LFE351-.LVL122
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST45:
	.byte	0x6
	.4byte	.LVL122
	.byte	0x4
	.uleb128 .LVL122-.LVL122
	.uleb128 .LVL125-1-.LVL122
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL125-1-.LVL122
	.uleb128 .LVL128-.LVL122
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL128-.LVL122
	.uleb128 .LVL131-.LVL122
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL131-.LVL122
	.uleb128 .LFE351-.LVL122
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST46:
	.byte	0x6
	.4byte	.LVL126
	.byte	0x4
	.uleb128 .LVL126-.LVL126
	.uleb128 .LVL128-.LVL126
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL131-.LVL126
	.uleb128 .LFE351-.LVL126
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST47:
	.byte	0x6
	.4byte	.LVL123
	.byte	0x4
	.uleb128 .LVL123-.LVL123
	.uleb128 .LVL124-.LVL123
	.uleb128 0x3
	.byte	0x72
	.sleb128 36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL124-.LVL123
	.uleb128 .LVL129-.LVL123
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL129-.LVL123
	.uleb128 .LVL130-.LVL123
	.uleb128 0x3
	.byte	0x72
	.sleb128 36
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL130-.LVL123
	.uleb128 .LFE351-.LVL123
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST42:
	.byte	0x6
	.4byte	.LVL115
	.byte	0x4
	.uleb128 .LVL115-.LVL115
	.uleb128 .LVL116-.LVL115
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL116-.LVL115
	.uleb128 .LVL118-.LVL115
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL118-.LVL115
	.uleb128 .LVL119-.LVL115
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL119-.LVL115
	.uleb128 .LVL120-.LVL115
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL120-.LVL115
	.uleb128 .LVL121-.LVL115
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL121-.LVL115
	.uleb128 .LFE350-.LVL115
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST43:
	.byte	0x6
	.4byte	.LVL115
	.byte	0x4
	.uleb128 .LVL115-.LVL115
	.uleb128 .LVL117-.LVL115
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL117-.LVL115
	.uleb128 .LVL118-.LVL115
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL118-.LVL115
	.uleb128 .LFE350-.LVL115
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST40:
	.byte	0x6
	.4byte	.LVL108
	.byte	0x4
	.uleb128 .LVL108-.LVL108
	.uleb128 .LVL109-.LVL108
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL109-.LVL108
	.uleb128 .LVL111-.LVL108
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL111-.LVL108
	.uleb128 .LVL112-.LVL108
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL112-.LVL108
	.uleb128 .LVL113-.LVL108
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL113-.LVL108
	.uleb128 .LVL114-.LVL108
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL114-.LVL108
	.uleb128 .LFE349-.LVL108
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST41:
	.byte	0x6
	.4byte	.LVL108
	.byte	0x4
	.uleb128 .LVL108-.LVL108
	.uleb128 .LVL110-.LVL108
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL110-.LVL108
	.uleb128 .LVL111-.LVL108
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL111-.LVL108
	.uleb128 .LFE349-.LVL108
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST38:
	.byte	0x6
	.4byte	.LVL100
	.byte	0x4
	.uleb128 .LVL100-.LVL100
	.uleb128 .LVL102-.LVL100
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL102-.LVL100
	.uleb128 .LVL103-.LVL100
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL103-.LVL100
	.uleb128 .LVL105-.LVL100
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL105-.LVL100
	.uleb128 .LVL106-.LVL100
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL106-.LVL100
	.uleb128 .LVL107-.LVL100
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL107-.LVL100
	.uleb128 .LFE348-.LVL100
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST39:
	.byte	0x6
	.4byte	.LVL100
	.byte	0x4
	.uleb128 .LVL100-.LVL100
	.uleb128 .LVL101-.LVL100
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL101-.LVL100
	.uleb128 .LVL103-.LVL100
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL103-.LVL100
	.uleb128 .LVL104-.LVL100
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL104-.LVL100
	.uleb128 .LVL106-.LVL100
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL106-.LVL100
	.uleb128 .LFE348-.LVL100
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST36:
	.byte	0x6
	.4byte	.LVL92
	.byte	0x4
	.uleb128 .LVL92-.LVL92
	.uleb128 .LVL94-.LVL92
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL94-.LVL92
	.uleb128 .LVL95-.LVL92
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL95-.LVL92
	.uleb128 .LVL97-.LVL92
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL97-.LVL92
	.uleb128 .LVL98-.LVL92
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL98-.LVL92
	.uleb128 .LVL99-.LVL92
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL99-.LVL92
	.uleb128 .LFE347-.LVL92
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST37:
	.byte	0x6
	.4byte	.LVL92
	.byte	0x4
	.uleb128 .LVL92-.LVL92
	.uleb128 .LVL93-.LVL92
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL93-.LVL92
	.uleb128 .LVL95-.LVL92
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL95-.LVL92
	.uleb128 .LVL96-.LVL92
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL96-.LVL92
	.uleb128 .LVL98-.LVL92
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL98-.LVL92
	.uleb128 .LFE347-.LVL92
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST35:
	.byte	0x6
	.4byte	.LVL86
	.byte	0x4
	.uleb128 .LVL86-.LVL86
	.uleb128 .LVL87-.LVL86
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL87-.LVL86
	.uleb128 .LVL88-.LVL86
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL88-.LVL86
	.uleb128 .LVL89-.LVL86
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL89-.LVL86
	.uleb128 .LVL90-.LVL86
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL90-.LVL86
	.uleb128 .LVL91-.LVL86
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL91-.LVL86
	.uleb128 .LFE346-.LVL86
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST34:
	.byte	0x6
	.4byte	.LVL83
	.byte	0x4
	.uleb128 .LVL83-.LVL83
	.uleb128 .LVL84-.LVL83
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL84-.LVL83
	.uleb128 .LVL85-.LVL83
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL85-.LVL83
	.uleb128 .LFE345-.LVL83
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST33:
	.byte	0x6
	.4byte	.LVL78
	.byte	0x4
	.uleb128 .LVL78-.LVL78
	.uleb128 .LVL79-1-.LVL78
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL79-1-.LVL78
	.uleb128 .LFE344-.LVL78
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST32:
	.byte	0x6
	.4byte	.LVL74
	.byte	0x4
	.uleb128 .LVL74-.LVL74
	.uleb128 .LVL75-1-.LVL74
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL75-1-.LVL74
	.uleb128 .LFE343-.LVL74
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST26:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL60-.LVL59
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL60-.LVL59
	.uleb128 .LFE342-.LVL59
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST27:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL64-1-.LVL59
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL64-1-.LVL59
	.uleb128 .LVL65-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL65-.LVL59
	.uleb128 .LVL66-.LVL59
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL66-.LVL59
	.uleb128 .LVL69-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL69-.LVL59
	.uleb128 .LVL71-1-.LVL59
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL71-1-.LVL59
	.uleb128 .LVL72-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL72-.LVL59
	.uleb128 .LFE342-.LVL59
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST28:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL61-.LVL59
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL61-.LVL59
	.uleb128 .LVL63-.LVL59
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL63-.LVL59
	.uleb128 .LVL65-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL65-.LVL59
	.uleb128 .LVL67-.LVL59
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL67-.LVL59
	.uleb128 .LVL68-1-.LVL59
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL68-1-.LVL59
	.uleb128 .LVL69-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL69-.LVL59
	.uleb128 .LVL70-.LVL59
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL70-.LVL59
	.uleb128 .LVL72-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL72-.LVL59
	.uleb128 .LVL73-.LVL59
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL73-.LVL59
	.uleb128 .LFE342-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST29:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL62-.LVL59
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL62-.LVL59
	.uleb128 .LVL64-1-.LVL59
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL64-1-.LVL59
	.uleb128 .LVL65-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL65-.LVL59
	.uleb128 .LVL68-1-.LVL59
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL68-1-.LVL59
	.uleb128 .LVL69-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL69-.LVL59
	.uleb128 .LVL71-1-.LVL59
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL71-1-.LVL59
	.uleb128 .LVL72-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL72-.LVL59
	.uleb128 .LFE342-.LVL59
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST30:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL65-.LVL59
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL65-.LVL59
	.uleb128 .LFE342-.LVL59
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST31:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL65-.LVL59
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0x4
	.uleb128 .LVL65-.LVL59
	.uleb128 .LFE342-.LVL59
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
.LLST20:
	.byte	0x6
	.4byte	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL45-.LVL44
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL45-.LVL44
	.uleb128 .LFE341-.LVL44
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST21:
	.byte	0x6
	.4byte	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL49-1-.LVL44
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL49-1-.LVL44
	.uleb128 .LVL50-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL50-.LVL44
	.uleb128 .LVL51-.LVL44
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL51-.LVL44
	.uleb128 .LVL54-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL54-.LVL44
	.uleb128 .LVL56-1-.LVL44
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL56-1-.LVL44
	.uleb128 .LVL57-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL57-.LVL44
	.uleb128 .LFE341-.LVL44
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST22:
	.byte	0x6
	.4byte	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL46-.LVL44
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL46-.LVL44
	.uleb128 .LVL48-.LVL44
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL48-.LVL44
	.uleb128 .LVL50-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL50-.LVL44
	.uleb128 .LVL52-.LVL44
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL52-.LVL44
	.uleb128 .LVL53-1-.LVL44
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL53-1-.LVL44
	.uleb128 .LVL54-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL54-.LVL44
	.uleb128 .LVL55-.LVL44
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL55-.LVL44
	.uleb128 .LVL57-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL57-.LVL44
	.uleb128 .LVL58-.LVL44
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL58-.LVL44
	.uleb128 .LFE341-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST23:
	.byte	0x6
	.4byte	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL47-.LVL44
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL47-.LVL44
	.uleb128 .LVL49-1-.LVL44
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL49-1-.LVL44
	.uleb128 .LVL50-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL50-.LVL44
	.uleb128 .LVL53-1-.LVL44
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL53-1-.LVL44
	.uleb128 .LVL54-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL54-.LVL44
	.uleb128 .LVL56-1-.LVL44
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL56-1-.LVL44
	.uleb128 .LVL57-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL57-.LVL44
	.uleb128 .LFE341-.LVL44
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST24:
	.byte	0x6
	.4byte	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL50-.LVL44
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL50-.LVL44
	.uleb128 .LFE341-.LVL44
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST25:
	.byte	0x6
	.4byte	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL50-.LVL44
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0x4
	.uleb128 .LVL50-.LVL44
	.uleb128 .LFE341-.LVL44
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
.LLST15:
	.byte	0x6
	.4byte	.LVL40
	.byte	0x4
	.uleb128 .LVL40-.LVL40
	.uleb128 .LVL41-.LVL40
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL41-.LVL40
	.uleb128 .LFE340-.LVL40
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST16:
	.byte	0x6
	.4byte	.LVL40
	.byte	0x4
	.uleb128 .LVL40-.LVL40
	.uleb128 .LVL42-1-.LVL40
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL42-1-.LVL40
	.uleb128 .LVL43-.LVL40
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL40
	.uleb128 .LFE340-.LVL40
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST17:
	.byte	0x6
	.4byte	.LVL40
	.byte	0x4
	.uleb128 .LVL40-.LVL40
	.uleb128 .LVL42-1-.LVL40
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL42-1-.LVL40
	.uleb128 .LVL43-.LVL40
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL40
	.uleb128 .LFE340-.LVL40
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST18:
	.byte	0x6
	.4byte	.LVL40
	.byte	0x4
	.uleb128 .LVL40-.LVL40
	.uleb128 .LVL42-1-.LVL40
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL42-1-.LVL40
	.uleb128 .LVL43-.LVL40
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL40
	.uleb128 .LFE340-.LVL40
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL40
	.byte	0x4
	.uleb128 .LVL40-.LVL40
	.uleb128 .LVL43-.LVL40
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL43-.LVL40
	.uleb128 .LFE340-.LVL40
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL36
	.byte	0x4
	.uleb128 .LVL36-.LVL36
	.uleb128 .LVL37-.LVL36
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL37-.LVL36
	.uleb128 .LFE339-.LVL36
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL36
	.byte	0x4
	.uleb128 .LVL36-.LVL36
	.uleb128 .LVL38-1-.LVL36
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL38-1-.LVL36
	.uleb128 .LVL39-.LVL36
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL39-.LVL36
	.uleb128 .LFE339-.LVL36
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST12:
	.byte	0x6
	.4byte	.LVL36
	.byte	0x4
	.uleb128 .LVL36-.LVL36
	.uleb128 .LVL38-1-.LVL36
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL38-1-.LVL36
	.uleb128 .LVL39-.LVL36
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL39-.LVL36
	.uleb128 .LFE339-.LVL36
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL36
	.byte	0x4
	.uleb128 .LVL36-.LVL36
	.uleb128 .LVL38-1-.LVL36
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL38-1-.LVL36
	.uleb128 .LVL39-.LVL36
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL39-.LVL36
	.uleb128 .LFE339-.LVL36
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL36
	.byte	0x4
	.uleb128 .LVL36-.LVL36
	.uleb128 .LVL39-.LVL36
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL39-.LVL36
	.uleb128 .LFE339-.LVL36
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST48:
	.byte	0x6
	.4byte	.LVL132
	.byte	0x4
	.uleb128 .LVL132-.LVL132
	.uleb128 .LVL133-.LVL132
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL133-.LVL132
	.uleb128 .LVL135-.LVL132
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL135-.LVL132
	.uleb128 .LVL136-1-.LVL132
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL136-1-.LVL132
	.uleb128 .LVL137-.LVL132
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL137-.LVL132
	.uleb128 .LVL138-1-.LVL132
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL138-1-.LVL132
	.uleb128 .LVL139-.LVL132
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL139-.LVL132
	.uleb128 .LVL140-1-.LVL132
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL140-1-.LVL132
	.uleb128 .LVL141-.LVL132
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL141-.LVL132
	.uleb128 .LVL142-.LVL132
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL142-.LVL132
	.uleb128 .LFE336-.LVL132
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST9:
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
	.uleb128 .LVL33-.LVL29
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL33-.LVL29
	.uleb128 .LVL34-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL34-.LVL29
	.uleb128 .LFE335-.LVL29
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x114
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB366
	.4byte	.LFE366-.LFB366
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
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
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.4byte	.LFB352
	.4byte	.LFE352-.LFB352
	.4byte	.LFB353
	.4byte	.LFE353-.LFB353
	.4byte	.LFB354
	.4byte	.LFE354-.LFB354
	.4byte	.LFB356
	.4byte	.LFE356-.LFB356
	.4byte	.LFB357
	.4byte	.LFE357-.LFB357
	.4byte	.LFB355
	.4byte	.LFE355-.LFB355
	.4byte	.LFB358
	.4byte	.LFE358-.LFB358
	.4byte	.LFB359
	.4byte	.LFE359-.LFB359
	.4byte	.LFB360
	.4byte	.LFE360-.LFB360
	.4byte	.LFB361
	.4byte	.LFE361-.LFB361
	.4byte	.LFB362
	.4byte	.LFE362-.LFB362
	.4byte	.LFB363
	.4byte	.LFE363-.LFB363
	.4byte	.LFB364
	.4byte	.LFE364-.LFB364
	.4byte	.LFB365
	.4byte	.LFE365-.LFB365
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
.LLRL75:
	.byte	0x7
	.4byte	.LFB366
	.uleb128 .LFE366-.LFB366
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
	.byte	0x7
	.4byte	.LFB336
	.uleb128 .LFE336-.LFB336
	.byte	0x7
	.4byte	.LFB352
	.uleb128 .LFE352-.LFB352
	.byte	0x7
	.4byte	.LFB353
	.uleb128 .LFE353-.LFB353
	.byte	0x7
	.4byte	.LFB354
	.uleb128 .LFE354-.LFB354
	.byte	0x7
	.4byte	.LFB356
	.uleb128 .LFE356-.LFB356
	.byte	0x7
	.4byte	.LFB357
	.uleb128 .LFE357-.LFB357
	.byte	0x7
	.4byte	.LFB355
	.uleb128 .LFE355-.LFB355
	.byte	0x7
	.4byte	.LFB358
	.uleb128 .LFE358-.LFB358
	.byte	0x7
	.4byte	.LFB359
	.uleb128 .LFE359-.LFB359
	.byte	0x7
	.4byte	.LFB360
	.uleb128 .LFE360-.LFB360
	.byte	0x7
	.4byte	.LFB361
	.uleb128 .LFE361-.LFB361
	.byte	0x7
	.4byte	.LFB362
	.uleb128 .LFE362-.LFB362
	.byte	0x7
	.4byte	.LFB363
	.uleb128 .LFE363-.LFB363
	.byte	0x7
	.4byte	.LFB364
	.uleb128 .LFE364-.LFB364
	.byte	0x7
	.4byte	.LFB365
	.uleb128 .LFE365-.LFB365
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF190:
	.ascii	"HAL_DMA2D_Start\000"
.LASF43:
	.ascii	"PLL1DIVR\000"
.LASF186:
	.ascii	"SrcAddress1\000"
.LASF130:
	.ascii	"HAL_DMA2D_StateTypeDef\000"
.LASF132:
	.ascii	"Init\000"
.LASF144:
	.ascii	"Height\000"
.LASF178:
	.ascii	"HAL_DMA2D_CLUTLoad\000"
.LASF66:
	.ascii	"APB1LRSTR\000"
.LASF5:
	.ascii	"__uint8_t\000"
.LASF100:
	.ascii	"HAL_BUSY\000"
.LASF160:
	.ascii	"HAL_DMA2D_ConfigLayer\000"
.LASF161:
	.ascii	"pLayerCfg\000"
.LASF89:
	.ascii	"APB1HLPENR\000"
.LASF106:
	.ascii	"pCLUT\000"
.LASF119:
	.ascii	"InputColorMode\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF115:
	.ascii	"BytesSwap\000"
.LASF71:
	.ascii	"D3AMR\000"
.LASF150:
	.ascii	"HAL_DMA2D_GetState\000"
.LASF147:
	.ascii	"tmp3\000"
.LASF145:
	.ascii	"tmp1\000"
.LASF29:
	.ascii	"FGCLUT\000"
.LASF84:
	.ascii	"AHB1LPENR\000"
.LASF193:
	.ascii	"HAL_DMA2D_DeInit\000"
.LASF146:
	.ascii	"tmp2\000"
.LASF184:
	.ascii	"HAL_DMA2D_Abort\000"
.LASF148:
	.ascii	"tmp4\000"
.LASF8:
	.ascii	"long long int\000"
.LASF1:
	.ascii	"signed char\000"
.LASF62:
	.ascii	"AHB1RSTR\000"
.LASF142:
	.ascii	"DstAddress\000"
.LASF72:
	.ascii	"RESERVED11\000"
.LASF82:
	.ascii	"RESERVED12\000"
.LASF92:
	.ascii	"RESERVED13\000"
.LASF105:
	.ascii	"HAL_LockTypeDef\000"
.LASF93:
	.ascii	"RCC_TypeDef\000"
.LASF4:
	.ascii	"long int\000"
.LASF163:
	.ascii	"regValue\000"
.LASF68:
	.ascii	"APB2RSTR\000"
.LASF135:
	.ascii	"LayerCfg\000"
.LASF21:
	.ascii	"BGCOLR\000"
.LASF97:
	.ascii	"double\000"
.LASF64:
	.ascii	"AHB4RSTR\000"
.LASF39:
	.ascii	"D3CFGR\000"
.LASF42:
	.ascii	"PLLCFGR\000"
.LASF127:
	.ascii	"HAL_DMA2D_STATE_TIMEOUT\000"
.LASF110:
	.ascii	"Mode\000"
.LASF33:
	.ascii	"CRRCR\000"
.LASF56:
	.ascii	"CIFR\000"
.LASF47:
	.ascii	"PLL3DIVR\000"
.LASF136:
	.ascii	"Lock\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF51:
	.ascii	"D2CCIP1R\000"
.LASF170:
	.ascii	"Timeout\000"
.LASF194:
	.ascii	"HAL_DMA2D_Init\000"
.LASF53:
	.ascii	"D3CCIPR\000"
.LASF90:
	.ascii	"APB2LPENR\000"
.LASF126:
	.ascii	"HAL_DMA2D_STATE_BUSY\000"
.LASF22:
	.ascii	"FGCMAR\000"
.LASF101:
	.ascii	"HAL_TIMEOUT\000"
.LASF46:
	.ascii	"PLL2FRACR\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF30:
	.ascii	"BGCLUT\000"
.LASF109:
	.ascii	"DMA2D_CLUTCfgTypeDef\000"
.LASF181:
	.ascii	"HAL_DMA2D_EnableCLUT\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF154:
	.ascii	"HAL_DMA2D_EnableDeadTime\000"
.LASF153:
	.ascii	"HAL_DMA2D_DisableDeadTime\000"
.LASF169:
	.ascii	"HAL_DMA2D_PollForTransfer\000"
.LASF98:
	.ascii	"HAL_OK\000"
.LASF172:
	.ascii	"layer_start\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF41:
	.ascii	"PLLCKSELR\000"
.LASF19:
	.ascii	"FGCOLR\000"
.LASF187:
	.ascii	"SrcAddress2\000"
.LASF32:
	.ascii	"HSICFGR\000"
.LASF167:
	.ascii	"isrflags\000"
.LASF61:
	.ascii	"AHB3RSTR\000"
.LASF14:
	.ascii	"FGMAR\000"
.LASF52:
	.ascii	"D2CCIP2R\000"
.LASF107:
	.ascii	"CLUTColorMode\000"
.LASF102:
	.ascii	"HAL_StatusTypeDef\000"
.LASF164:
	.ascii	"HAL_DMA2D_CLUTLoadingCpltCallback\000"
.LASF48:
	.ascii	"PLL3FRACR\000"
.LASF196:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_dma2d.c\000"
.LASF69:
	.ascii	"APB4RSTR\000"
.LASF133:
	.ascii	"XferCpltCallback\000"
.LASF120:
	.ascii	"AlphaMode\000"
.LASF15:
	.ascii	"FGOR\000"
.LASF81:
	.ascii	"APB4ENR\000"
.LASF191:
	.ascii	"HAL_DMA2D_MspDeInit\000"
.LASF192:
	.ascii	"HAL_DMA2D_MspInit\000"
.LASF116:
	.ascii	"LineOffsetMode\000"
.LASF118:
	.ascii	"InputOffset\000"
.LASF23:
	.ascii	"BGCMAR\000"
.LASF138:
	.ascii	"ErrorCode\000"
.LASF175:
	.ascii	"loadsuspended\000"
.LASF195:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF149:
	.ascii	"HAL_DMA2D_GetError\000"
.LASF111:
	.ascii	"ColorMode\000"
.LASF104:
	.ascii	"HAL_LOCKED\000"
.LASF67:
	.ascii	"APB1HRSTR\000"
.LASF199:
	.ascii	"HAL_GetTick\000"
.LASF134:
	.ascii	"XferErrorCallback\000"
.LASF85:
	.ascii	"AHB2LPENR\000"
.LASF87:
	.ascii	"APB3LPENR\000"
.LASF26:
	.ascii	"OMAR\000"
.LASF176:
	.ascii	"HAL_DMA2D_CLUTLoading_Abort\000"
.LASF114:
	.ascii	"RedBlueSwap\000"
.LASF166:
	.ascii	"HAL_DMA2D_IRQHandler\000"
.LASF117:
	.ascii	"DMA2D_InitTypeDef\000"
.LASF77:
	.ascii	"APB3ENR\000"
.LASF25:
	.ascii	"OCOLR\000"
.LASF76:
	.ascii	"AHB4ENR\000"
.LASF108:
	.ascii	"Size\000"
.LASF27:
	.ascii	"AMTCR\000"
.LASF131:
	.ascii	"Instance\000"
.LASF40:
	.ascii	"RESERVED2\000"
.LASF49:
	.ascii	"RESERVED3\000"
.LASF38:
	.ascii	"D2CFGR\000"
.LASF58:
	.ascii	"RESERVED5\000"
.LASF60:
	.ascii	"RESERVED6\000"
.LASF70:
	.ascii	"RESERVED8\000"
.LASF159:
	.ascii	"LayerIdx\000"
.LASF155:
	.ascii	"HAL_DMA2D_ProgramLineEvent\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF162:
	.ascii	"regMask\000"
.LASF182:
	.ascii	"HAL_DMA2D_Resume\000"
.LASF0:
	.ascii	"short int\000"
.LASF141:
	.ascii	"pdata\000"
.LASF83:
	.ascii	"AHB3LPENR\000"
.LASF171:
	.ascii	"tickstart\000"
.LASF91:
	.ascii	"APB4LPENR\000"
.LASF28:
	.ascii	"RESERVED\000"
.LASF128:
	.ascii	"HAL_DMA2D_STATE_ERROR\000"
.LASF183:
	.ascii	"HAL_DMA2D_Suspend\000"
.LASF80:
	.ascii	"APB2ENR\000"
.LASF45:
	.ascii	"PLL2DIVR\000"
.LASF158:
	.ascii	"CLUTCfg\000"
.LASF73:
	.ascii	"AHB3ENR\000"
.LASF179:
	.ascii	"HAL_DMA2D_CLUTStartLoad_IT\000"
.LASF122:
	.ascii	"ChromaSubSampling\000"
.LASF54:
	.ascii	"RESERVED4\000"
.LASF20:
	.ascii	"BGPFCCR\000"
.LASF113:
	.ascii	"AlphaInverted\000"
.LASF123:
	.ascii	"DMA2D_LayerCfgTypeDef\000"
.LASF151:
	.ascii	"HAL_DMA2D_ConfigDeadTime\000"
.LASF99:
	.ascii	"HAL_ERROR\000"
.LASF50:
	.ascii	"D1CCIPR\000"
.LASF79:
	.ascii	"APB1HENR\000"
.LASF94:
	.ascii	"long double\000"
.LASF95:
	.ascii	"char\000"
.LASF137:
	.ascii	"State\000"
.LASF152:
	.ascii	"DeadTime\000"
.LASF180:
	.ascii	"HAL_DMA2D_CLUTStartLoad\000"
.LASF63:
	.ascii	"AHB2RSTR\000"
.LASF139:
	.ascii	"DMA2D_HandleTypeDef\000"
.LASF200:
	.ascii	"DMA2D_SetConfig\000"
.LASF188:
	.ascii	"HAL_DMA2D_BlendingStart\000"
.LASF18:
	.ascii	"FGPFCCR\000"
.LASF124:
	.ascii	"HAL_DMA2D_STATE_RESET\000"
.LASF156:
	.ascii	"Line\000"
.LASF86:
	.ascii	"AHB4LPENR\000"
.LASF157:
	.ascii	"HAL_DMA2D_ConfigCLUT\000"
.LASF165:
	.ascii	"HAL_DMA2D_LineEventCallback\000"
.LASF177:
	.ascii	"HAL_DMA2D_CLUTLoad_IT\000"
.LASF36:
	.ascii	"RESERVED1\000"
.LASF75:
	.ascii	"AHB2ENR\000"
.LASF55:
	.ascii	"CIER\000"
.LASF168:
	.ascii	"crflags\000"
.LASF65:
	.ascii	"APB3RSTR\000"
.LASF34:
	.ascii	"CSICFGR\000"
.LASF140:
	.ascii	"hdma2d\000"
.LASF185:
	.ascii	"HAL_DMA2D_BlendingStart_IT\000"
.LASF189:
	.ascii	"HAL_DMA2D_Start_IT\000"
.LASF198:
	.ascii	"__DMA2D_HandleTypeDef\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF88:
	.ascii	"APB1LLPENR\000"
.LASF57:
	.ascii	"CICR\000"
.LASF112:
	.ascii	"OutputOffset\000"
.LASF59:
	.ascii	"BDCR\000"
.LASF16:
	.ascii	"BGMAR\000"
.LASF11:
	.ascii	"uint8_t\000"
.LASF31:
	.ascii	"DMA2D_TypeDef\000"
.LASF96:
	.ascii	"float\000"
.LASF197:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF129:
	.ascii	"HAL_DMA2D_STATE_SUSPEND\000"
.LASF17:
	.ascii	"BGOR\000"
.LASF125:
	.ascii	"HAL_DMA2D_STATE_READY\000"
.LASF74:
	.ascii	"AHB1ENR\000"
.LASF35:
	.ascii	"CFGR\000"
.LASF13:
	.ascii	"IFCR\000"
.LASF24:
	.ascii	"OPFCCR\000"
.LASF103:
	.ascii	"HAL_UNLOCKED\000"
.LASF143:
	.ascii	"Width\000"
.LASF173:
	.ascii	"HAL_DMA2D_CLUTLoading_Resume\000"
.LASF174:
	.ascii	"HAL_DMA2D_CLUTLoading_Suspend\000"
.LASF78:
	.ascii	"APB1LENR\000"
.LASF37:
	.ascii	"D1CFGR\000"
.LASF44:
	.ascii	"PLL1FRACR\000"
.LASF121:
	.ascii	"InputAlpha\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
