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
	.file	"stm32h7xx_hal_rng.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_rng.c"
	.section	.text.HAL_RNG_MspInit,"ax",%progbits
	.align	1
	.weak	HAL_RNG_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_MspInit, %function
HAL_RNG_MspInit:
.LFB337:
	.loc 1 372 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 374 3
	.loc 1 378 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_RNG_MspInit, .-HAL_RNG_MspInit
	.section	.text.HAL_RNG_Init,"ax",%progbits
	.align	1
	.global	HAL_RNG_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_Init, %function
HAL_RNG_Init:
.LFB335:
	.loc 1 168 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL1:
	.loc 1 169 3
	.loc 1 171 3
	.loc 1 171 6 is_stmt 0
	cmp	r0, #0
	beq	.L8
	.loc 1 168 1
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 176 3 is_stmt 1
	.loc 1 177 3
	.loc 1 197 3
	.loc 1 197 11 is_stmt 0
	ldrb	r3, [r0, #9]	@ zero_extendqisi2
	.loc 1 197 6
	cbz	r3, .L13
.LVL2:
.L4:
	.loc 1 208 3 is_stmt 1
	.loc 1 208 15 is_stmt 0
	movs	r3, #2
	strb	r3, [r4, #9]
	.loc 1 245 3 is_stmt 1
	.loc 1 245 39 is_stmt 0
	ldr	r2, [r4]
	.loc 1 245 49
	ldr	r3, [r2]
	.loc 1 245 57
	bic	r3, r3, #32
	.loc 1 245 94
	ldr	r1, [r4, #4]
	.loc 1 245 81
	orrs	r3, r3, r1
	.loc 1 245 27
	str	r3, [r2]
	.loc 1 249 3 is_stmt 1
	.loc 1 249 10 is_stmt 0
	ldr	r2, [r4]
	.loc 1 249 20
	ldr	r3, [r2]
	.loc 1 249 25
	orr	r3, r3, #4
	str	r3, [r2]
	.loc 1 252 3 is_stmt 1
	.loc 1 252 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 252 25
	ldr	r3, [r3, #4]
	.loc 1 252 6
	tst	r3, #64
	beq	.L5
	.loc 1 254 5 is_stmt 1
	.loc 1 254 17 is_stmt 0
	movs	r3, #4
	strb	r3, [r4, #9]
	.loc 1 255 5 is_stmt 1
	.loc 1 255 12 is_stmt 0
	movs	r0, #1
.L3:
	.loc 1 282 1
	pop	{r3, r4, r5, pc}
.LVL3:
.L13:
	.loc 1 200 5 is_stmt 1
	.loc 1 200 16 is_stmt 0
	strb	r3, [r0, #8]
	.loc 1 203 5 is_stmt 1
	bl	HAL_RNG_MspInit
.LVL4:
	b	.L4
.L5:
	.loc 1 258 3
	.loc 1 258 15 is_stmt 0
	bl	HAL_GetTick
.LVL5:
	mov	r5, r0
.LVL6:
	.loc 1 260 3 is_stmt 1
.L6:
	.loc 1 260 76
	.loc 1 260 18 is_stmt 0
	ldr	r3, [r4]
	.loc 1 260 28
	ldr	r3, [r3, #4]
	.loc 1 260 76
	tst	r3, #4
	beq	.L14
	.loc 1 262 5 is_stmt 1
	.loc 1 262 10 is_stmt 0
	bl	HAL_GetTick
.LVL7:
	.loc 1 262 24
	subs	r0, r0, r5
	.loc 1 262 8
	cmp	r0, #2
	bls	.L6
	.loc 1 265 7 is_stmt 1
	.loc 1 265 19 is_stmt 0
	ldr	r3, [r4]
	.loc 1 265 29
	ldr	r3, [r3, #4]
	.loc 1 265 10
	tst	r3, #4
	beq	.L6
	.loc 1 267 9 is_stmt 1
	.loc 1 267 21 is_stmt 0
	movs	r3, #4
	strb	r3, [r4, #9]
	.loc 1 268 9 is_stmt 1
	.loc 1 268 25 is_stmt 0
	movs	r3, #2
	str	r3, [r4, #12]
	.loc 1 269 9 is_stmt 1
	.loc 1 269 16 is_stmt 0
	movs	r0, #1
	b	.L3
.L14:
	.loc 1 275 3 is_stmt 1
	.loc 1 275 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #9]
	.loc 1 278 3 is_stmt 1
	.loc 1 278 19 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #12]
	.loc 1 281 3 is_stmt 1
	.loc 1 281 10 is_stmt 0
	b	.L3
.LVL8:
.L8:
	.cfi_def_cfa_offset 0
	.cfi_restore 3
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 14
	.loc 1 173 12
	movs	r0, #1
.LVL9:
	.loc 1 282 1
	bx	lr
	.cfi_endproc
.LFE335:
	.size	HAL_RNG_Init, .-HAL_RNG_Init
	.section	.text.HAL_RNG_MspDeInit,"ax",%progbits
	.align	1
	.weak	HAL_RNG_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_MspDeInit, %function
HAL_RNG_MspDeInit:
.LFB338:
	.loc 1 387 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL10:
	.loc 1 389 3
	.loc 1 393 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE338:
	.size	HAL_RNG_MspDeInit, .-HAL_RNG_MspDeInit
	.section	.text.HAL_RNG_DeInit,"ax",%progbits
	.align	1
	.global	HAL_RNG_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_DeInit, %function
HAL_RNG_DeInit:
.LFB336:
	.loc 1 291 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL11:
	.loc 1 297 3
	.loc 1 297 6 is_stmt 0
	cbz	r0, .L18
	.loc 1 291 1
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 331 3 is_stmt 1
	.loc 1 331 9 is_stmt 0
	ldr	r2, [r0]
	.loc 1 331 19
	ldr	r3, [r2]
	.loc 1 331 25
	bic	r3, r3, #32
	str	r3, [r2]
	.loc 1 334 3 is_stmt 1
	.loc 1 334 9 is_stmt 0
	ldr	r2, [r0]
	.loc 1 334 19
	ldr	r3, [r2]
	.loc 1 334 25
	bic	r3, r3, #12
	str	r3, [r2]
	.loc 1 337 3 is_stmt 1
	.loc 1 337 9 is_stmt 0
	ldr	r2, [r0]
	.loc 1 337 19
	ldr	r3, [r2, #4]
	.loc 1 337 25
	bic	r3, r3, #96
	str	r3, [r2, #4]
	.loc 1 349 3 is_stmt 1
	bl	HAL_RNG_MspDeInit
.LVL12:
	.loc 1 353 3
	.loc 1 353 15 is_stmt 0
	movs	r0, #0
	strb	r0, [r4, #9]
	.loc 1 356 3 is_stmt 1
	.loc 1 356 19 is_stmt 0
	str	r0, [r4, #12]
	.loc 1 359 3 is_stmt 1
	.loc 1 359 7
	.loc 1 359 20 is_stmt 0
	strb	r0, [r4, #8]
	.loc 1 359 5 is_stmt 1
	.loc 1 362 3
	.loc 1 363 1 is_stmt 0
	pop	{r4, pc}
.LVL13:
.L18:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 299 12
	movs	r0, #1
.LVL14:
	.loc 1 363 1
	bx	lr
	.cfi_endproc
.LFE336:
	.size	HAL_RNG_DeInit, .-HAL_RNG_DeInit
	.section	.text.HAL_RNG_GenerateRandomNumber,"ax",%progbits
	.align	1
	.global	HAL_RNG_GenerateRandomNumber
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_GenerateRandomNumber, %function
HAL_RNG_GenerateRandomNumber:
.LFB339:
	.loc 1 654 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL15:
	push	{r3, r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	.loc 1 655 3
	.loc 1 656 3
.LVL16:
	.loc 1 659 3
	.loc 1 659 7
	.loc 1 659 16 is_stmt 0
	ldrb	r3, [r0, #8]	@ zero_extendqisi2
	.loc 1 659 9
	cmp	r3, #1
	beq	.L29
	mov	r4, r0
	mov	r6, r1
	.loc 1 659 66 is_stmt 1 discriminator 2
	.loc 1 659 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #8]
	.loc 1 659 5 is_stmt 1 discriminator 2
	.loc 1 662 3 discriminator 2
	.loc 1 662 11 is_stmt 0 discriminator 2
	ldrb	r5, [r0, #9]	@ zero_extendqisi2
	uxtb	r5, r5
	.loc 1 662 6 discriminator 2
	cmp	r5, r3
	beq	.L31
	.loc 1 724 5 is_stmt 1
	.loc 1 724 21 is_stmt 0
	movs	r3, #4
	str	r3, [r0, #12]
	.loc 1 725 5 is_stmt 1
.LVL17:
	.loc 1 725 12 is_stmt 0
	movs	r5, #1
.LVL18:
.L28:
	.loc 1 729 3 is_stmt 1
	.loc 1 729 7
	.loc 1 729 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #8]
	.loc 1 729 5 is_stmt 1
	.loc 1 731 3
.LVL19:
.L24:
	.loc 1 732 1 is_stmt 0
	mov	r0, r5
	pop	{r3, r4, r5, r6, r7, pc}
.LVL20:
.L31:
	.loc 1 665 5 is_stmt 1
	.loc 1 665 17 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #9]
	.loc 1 682 5 is_stmt 1
	.loc 1 682 17 is_stmt 0
	bl	HAL_GetTick
.LVL21:
	mov	r7, r0
.LVL22:
	.loc 1 685 5 is_stmt 1
.L26:
	.loc 1 685 78
	.loc 1 685 20 is_stmt 0
	ldr	r3, [r4]
	.loc 1 685 30
	ldr	r2, [r3, #4]
	.loc 1 685 78
	tst	r2, #1
	bne	.L32
	.loc 1 687 7 is_stmt 1
	.loc 1 687 12 is_stmt 0
	bl	HAL_GetTick
.LVL23:
	.loc 1 687 26
	subs	r0, r0, r7
	.loc 1 687 10
	cmp	r0, #2
	bls	.L26
	.loc 1 690 9 is_stmt 1
	.loc 1 690 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 690 31
	ldr	r3, [r3, #4]
	.loc 1 690 12
	tst	r3, #1
	bne	.L26
	.loc 1 692 11 is_stmt 1
	.loc 1 692 23 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #9]
	.loc 1 693 11 is_stmt 1
	.loc 1 693 27 is_stmt 0
	movs	r3, #2
	str	r3, [r4, #12]
	.loc 1 695 11 is_stmt 1
	.loc 1 695 15
	.loc 1 695 28 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #8]
	.loc 1 695 13 is_stmt 1
	.loc 1 696 11
	.loc 1 696 18 is_stmt 0
	b	.L24
.L32:
	.loc 1 702 5 is_stmt 1
	.loc 1 702 40 is_stmt 0
	ldr	r3, [r3, #8]
	.loc 1 702 24
	str	r3, [r4, #16]
	.loc 1 717 5 is_stmt 1
	.loc 1 717 18 is_stmt 0
	str	r3, [r6]
	.loc 1 720 5 is_stmt 1
	.loc 1 720 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #9]
	.loc 1 656 21
	movs	r5, #0
	b	.L28
.LVL24:
.L29:
	.loc 1 659 47
	movs	r5, #2
	b	.L24
	.cfi_endproc
.LFE339:
	.size	HAL_RNG_GenerateRandomNumber, .-HAL_RNG_GenerateRandomNumber
	.section	.text.HAL_RNG_GenerateRandomNumber_IT,"ax",%progbits
	.align	1
	.global	HAL_RNG_GenerateRandomNumber_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_GenerateRandomNumber_IT, %function
HAL_RNG_GenerateRandomNumber_IT:
.LFB340:
	.loc 1 741 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL25:
	.loc 1 742 3
	.loc 1 745 3
	.loc 1 745 7
	.loc 1 745 16 is_stmt 0
	ldrb	r3, [r0, #8]	@ zero_extendqisi2
	.loc 1 745 9
	cmp	r3, #1
	beq	.L36
	.loc 1 745 66 is_stmt 1 discriminator 2
	.loc 1 745 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #8]
	.loc 1 745 5 is_stmt 1 discriminator 2
	.loc 1 748 3 discriminator 2
	.loc 1 748 11 is_stmt 0 discriminator 2
	ldrb	r3, [r0, #9]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 748 6 discriminator 2
	cmp	r3, #1
	beq	.L37
	.loc 1 759 5 is_stmt 1
	.loc 1 759 9
	.loc 1 759 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r0, #8]
	.loc 1 759 7 is_stmt 1
	.loc 1 761 5
	.loc 1 761 21 is_stmt 0
	movs	r3, #4
	str	r3, [r0, #12]
	.loc 1 762 5 is_stmt 1
.LVL26:
	.loc 1 762 12 is_stmt 0
	movs	r0, #1
.LVL27:
	bx	lr
.LVL28:
.L37:
	.loc 1 751 5 is_stmt 1
	.loc 1 751 17 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #9]
	.loc 1 754 5 is_stmt 1
	.loc 1 754 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 754 22
	ldr	r3, [r2]
	.loc 1 754 27
	orr	r3, r3, #8
	str	r3, [r2]
	.loc 1 742 21
	movs	r0, #0
.LVL29:
	bx	lr
.LVL30:
.L36:
	.loc 1 745 47
	movs	r0, #2
.LVL31:
	.loc 1 766 1
	bx	lr
	.cfi_endproc
.LFE340:
	.size	HAL_RNG_GenerateRandomNumber_IT, .-HAL_RNG_GenerateRandomNumber_IT
	.section	.text.HAL_RNG_ReadLastRandomNumber,"ax",%progbits
	.align	1
	.global	HAL_RNG_ReadLastRandomNumber
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_ReadLastRandomNumber, %function
HAL_RNG_ReadLastRandomNumber:
.LFB342:
	.loc 1 877 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL32:
	.loc 1 878 3
	.loc 1 879 1 is_stmt 0
	ldr	r0, [r0, #16]
.LVL33:
	bx	lr
	.cfi_endproc
.LFE342:
	.size	HAL_RNG_ReadLastRandomNumber, .-HAL_RNG_ReadLastRandomNumber
	.section	.text.HAL_RNG_ReadyDataCallback,"ax",%progbits
	.align	1
	.weak	HAL_RNG_ReadyDataCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_ReadyDataCallback, %function
HAL_RNG_ReadyDataCallback:
.LFB343:
	.loc 1 894 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL34:
	.loc 1 896 3
	.loc 1 897 3
	.loc 1 901 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE343:
	.size	HAL_RNG_ReadyDataCallback, .-HAL_RNG_ReadyDataCallback
	.section	.text.HAL_RNG_ErrorCallback,"ax",%progbits
	.align	1
	.weak	HAL_RNG_ErrorCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_ErrorCallback, %function
HAL_RNG_ErrorCallback:
.LFB344:
	.loc 1 910 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL35:
	.loc 1 912 3
	.loc 1 916 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE344:
	.size	HAL_RNG_ErrorCallback, .-HAL_RNG_ErrorCallback
	.section	.text.HAL_RNG_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_RNG_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_IRQHandler, %function
HAL_RNG_IRQHandler:
.LFB341:
	.loc 1 790 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL36:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 791 3
.LVL37:
	.loc 1 792 3
	.loc 1 792 25 is_stmt 0
	ldr	r2, [r0]
	.loc 1 792 12
	ldr	r3, [r2, #4]
.LVL38:
	.loc 1 795 3 is_stmt 1
	.loc 1 795 6 is_stmt 0
	tst	r3, #32
	bne	.L48
	.loc 1 801 8 is_stmt 1
	.loc 1 801 11 is_stmt 0
	tst	r3, #64
	beq	.L44
	.loc 1 804 5 is_stmt 1
	.loc 1 804 8 is_stmt 0
	tst	r3, #4
	bne	.L45
	.loc 1 808 7 is_stmt 1
	.loc 1 808 23 is_stmt 0
	ldr	r1, [r2, #4]
	.loc 1 808 29
	bic	r1, r1, #64
	str	r1, [r2, #4]
	.loc 1 822 3 is_stmt 1
	.loc 1 824 3
.L44:
.LVL39:
	.loc 1 844 3
	.loc 1 844 6 is_stmt 0
	tst	r3, #1
	beq	.L41
	.loc 1 847 5 is_stmt 1
	.loc 1 847 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 847 22
	ldr	r3, [r2]
.LVL40:
	.loc 1 847 27
	bic	r3, r3, #8
	str	r3, [r2]
	.loc 1 850 5 is_stmt 1
	.loc 1 850 30 is_stmt 0
	ldr	r3, [r4]
	.loc 1 850 40
	ldr	r1, [r3, #8]
	.loc 1 850 24
	str	r1, [r4, #16]
	.loc 1 852 5 is_stmt 1
	.loc 1 852 13 is_stmt 0
	ldrb	r3, [r4, #9]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 852 8
	cmp	r3, #4
	beq	.L41
	.loc 1 855 7 is_stmt 1
	.loc 1 855 19 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #9]
	.loc 1 857 7 is_stmt 1
	.loc 1 857 11
	.loc 1 857 24 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #8]
	.loc 1 857 9 is_stmt 1
	.loc 1 864 7
	mov	r0, r4
.LVL41:
	bl	HAL_RNG_ReadyDataCallback
.LVL42:
	b	.L41
.LVL43:
.L48:
	.loc 1 798 5
	.loc 1 798 21 is_stmt 0
	movs	r3, #16
.LVL44:
	str	r3, [r0, #12]
	.loc 1 799 5 is_stmt 1
.LVL45:
	.loc 1 822 3
	.loc 1 824 3
.L43:
	.loc 1 827 5
	.loc 1 827 17 is_stmt 0
	movs	r3, #4
	strb	r3, [r4, #9]
	.loc 1 834 5 is_stmt 1
	mov	r0, r4
.LVL46:
	bl	HAL_RNG_ErrorCallback
.LVL47:
	.loc 1 838 5
	.loc 1 838 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 838 29
	mvn	r2, #96
	str	r2, [r3, #4]
	.loc 1 840 5 is_stmt 1
.LVL48:
.L41:
	.loc 1 868 1 is_stmt 0
	pop	{r4, pc}
.LVL49:
.L45:
	.loc 1 813 7 is_stmt 1
	.loc 1 813 23 is_stmt 0
	movs	r3, #8
.LVL50:
	str	r3, [r0, #12]
	.loc 1 814 7 is_stmt 1
.LVL51:
	.loc 1 816 7
	.loc 1 816 24 is_stmt 0
	ldr	r3, [r2]
	.loc 1 816 29
	bic	r3, r3, #8
	str	r3, [r2]
	.loc 1 822 3 is_stmt 1
	.loc 1 824 3
	b	.L43
	.cfi_endproc
.LFE341:
	.size	HAL_RNG_IRQHandler, .-HAL_RNG_IRQHandler
	.section	.text.HAL_RNG_GetState,"ax",%progbits
	.align	1
	.global	HAL_RNG_GetState
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_GetState, %function
HAL_RNG_GetState:
.LFB345:
	.loc 1 944 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL52:
	.loc 1 945 3
	.loc 1 945 14 is_stmt 0
	ldrb	r0, [r0, #9]	@ zero_extendqisi2
.LVL53:
	.loc 1 946 1
	bx	lr
	.cfi_endproc
.LFE345:
	.size	HAL_RNG_GetState, .-HAL_RNG_GetState
	.section	.text.HAL_RNG_GetError,"ax",%progbits
	.align	1
	.global	HAL_RNG_GetError
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RNG_GetError, %function
HAL_RNG_GetError:
.LFB346:
	.loc 1 954 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL54:
	.loc 1 956 3
	.loc 1 956 14 is_stmt 0
	ldr	r0, [r0, #12]
.LVL55:
	.loc 1 957 1
	bx	lr
	.cfi_endproc
.LFE346:
	.size	HAL_RNG_GetError, .-HAL_RNG_GetError
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h7xx.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_rng.h"
	.file 8 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x4f2
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x1d
	.4byte	.LASF59
	.4byte	.LASF60
	.4byte	.LLRL15
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
	.uleb128 0x4
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
	.uleb128 0x14
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x49
	.uleb128 0xf
	.4byte	0x78
	.uleb128 0x15
	.byte	0xc
	.byte	0x4
	.2byte	0x6df
	.byte	0x9
	.4byte	0xb5
	.uleb128 0xe
	.ascii	"CR\000"
	.2byte	0x6e1
	.4byte	0x84
	.byte	0
	.uleb128 0xe
	.ascii	"SR\000"
	.2byte	0x6e2
	.4byte	0x84
	.byte	0x4
	.uleb128 0xe
	.ascii	"DR\000"
	.2byte	0x6e3
	.4byte	0x84
	.byte	0x8
	.byte	0
	.uleb128 0x16
	.4byte	.LASF11
	.byte	0x4
	.2byte	0x6e4
	.byte	0x3
	.4byte	0x89
	.uleb128 0xa
	.4byte	0x34
	.byte	0x5
	.byte	0xb5
	.4byte	0xda
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0
	.uleb128 0x17
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
	.uleb128 0xa
	.4byte	0x34
	.byte	0x6
	.byte	0x28
	.4byte	0x11a
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF20
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x6
	.byte	0x2d
	.byte	0x3
	.4byte	0xf6
	.uleb128 0xa
	.4byte	0x34
	.byte	0x6
	.byte	0x33
	.4byte	0x13e
	.uleb128 0x2
	.4byte	.LASF22
	.byte	0
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x6
	.byte	0x36
	.byte	0x3
	.4byte	0x126
	.uleb128 0xb
	.4byte	0x78
	.uleb128 0x10
	.byte	0x4
	.byte	0x32
	.4byte	0x163
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x34
	.byte	0xc
	.4byte	0x78
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x7
	.byte	0x35
	.byte	0x3
	.4byte	0x14f
	.uleb128 0xa
	.4byte	0x34
	.byte	0x7
	.byte	0x3f
	.4byte	0x199
	.uleb128 0x2
	.4byte	.LASF27
	.byte	0
	.uleb128 0x2
	.4byte	.LASF28
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF29
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF30
	.byte	0x3
	.uleb128 0x2
	.4byte	.LASF31
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF32
	.byte	0x7
	.byte	0x46
	.byte	0x3
	.4byte	0x16f
	.uleb128 0xf
	.4byte	0x199
	.uleb128 0x10
	.byte	0x14
	.byte	0x52
	.4byte	0x1fa
	.uleb128 0x5
	.4byte	.LASF33
	.byte	0x55
	.byte	0x10
	.4byte	0x1fa
	.byte	0
	.uleb128 0x5
	.4byte	.LASF34
	.byte	0x57
	.byte	0x13
	.4byte	0x163
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF35
	.byte	0x59
	.byte	0x13
	.4byte	0x13e
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF36
	.byte	0x5b
	.byte	0x21
	.4byte	0x1a5
	.byte	0x9
	.uleb128 0x5
	.4byte	.LASF37
	.byte	0x5d
	.byte	0x15
	.4byte	0x84
	.byte	0xc
	.uleb128 0x5
	.4byte	.LASF38
	.byte	0x5f
	.byte	0xc
	.4byte	0x78
	.byte	0x10
	.byte	0
	.uleb128 0xb
	.4byte	0xb5
	.uleb128 0x4
	.4byte	.LASF39
	.byte	0x7
	.byte	0x69
	.byte	0x3
	.4byte	0x1aa
	.uleb128 0x18
	.4byte	0x1ff
	.uleb128 0x19
	.4byte	.LASF61
	.byte	0x8
	.2byte	0x433
	.byte	0xa
	.4byte	0x78
	.uleb128 0x6
	.4byte	.LASF40
	.2byte	0x3b9
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x248
	.uleb128 0x3
	.4byte	.LASF42
	.2byte	0x3b9
	.byte	0x34
	.4byte	0x248
	.4byte	.LLST14
	.byte	0
	.uleb128 0xb
	.4byte	0x20b
	.uleb128 0x6
	.4byte	.LASF41
	.2byte	0x3af
	.byte	0x16
	.4byte	0x199
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x278
	.uleb128 0x3
	.4byte	.LASF42
	.2byte	0x3af
	.byte	0x40
	.4byte	0x248
	.4byte	.LLST13
	.byte	0
	.uleb128 0x7
	.4byte	.LASF43
	.2byte	0x38d
	.byte	0x1c
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x29d
	.uleb128 0x8
	.4byte	.LASF42
	.2byte	0x38d
	.byte	0x45
	.4byte	0x29d
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xb
	.4byte	0x1ff
	.uleb128 0x7
	.4byte	.LASF44
	.2byte	0x37d
	.byte	0x1c
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d5
	.uleb128 0x8
	.4byte	.LASF42
	.2byte	0x37d
	.byte	0x49
	.4byte	0x29d
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x8
	.4byte	.LASF45
	.2byte	0x37d
	.byte	0x58
	.4byte	0x78
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x6
	.4byte	.LASF46
	.2byte	0x36c
	.byte	0xa
	.4byte	0x78
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x300
	.uleb128 0x3
	.4byte	.LASF42
	.2byte	0x36c
	.byte	0x40
	.4byte	0x248
	.4byte	.LLST9
	.byte	0
	.uleb128 0x7
	.4byte	.LASF47
	.2byte	0x315
	.byte	0x6
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x36b
	.uleb128 0x3
	.4byte	.LASF42
	.2byte	0x315
	.byte	0x2c
	.4byte	0x29d
	.4byte	.LLST10
	.uleb128 0x9
	.4byte	.LASF48
	.2byte	0x317
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST11
	.uleb128 0x9
	.4byte	.LASF49
	.2byte	0x318
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST12
	.uleb128 0x11
	.4byte	.LVL42
	.4byte	0x2a2
	.4byte	0x35a
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL47
	.4byte	0x278
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF50
	.2byte	0x2e4
	.byte	0x13
	.4byte	0x11a
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a6
	.uleb128 0x3
	.4byte	.LASF42
	.2byte	0x2e4
	.byte	0x46
	.4byte	0x29d
	.4byte	.LLST7
	.uleb128 0x9
	.4byte	.LASF51
	.2byte	0x2e6
	.byte	0x15
	.4byte	0x11a
	.4byte	.LLST8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF52
	.2byte	0x28d
	.byte	0x13
	.4byte	0x11a
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x413
	.uleb128 0x3
	.4byte	.LASF42
	.2byte	0x28d
	.byte	0x43
	.4byte	0x29d
	.4byte	.LLST3
	.uleb128 0x3
	.4byte	.LASF45
	.2byte	0x28d
	.byte	0x53
	.4byte	0x14a
	.4byte	.LLST4
	.uleb128 0x9
	.4byte	.LASF53
	.2byte	0x28f
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST5
	.uleb128 0x9
	.4byte	.LASF51
	.2byte	0x290
	.byte	0x15
	.4byte	0x11a
	.4byte	.LLST6
	.uleb128 0xd
	.4byte	.LVL21
	.4byte	0x210
	.uleb128 0xd
	.4byte	.LVL23
	.4byte	0x210
	.byte	0
	.uleb128 0x7
	.4byte	.LASF54
	.2byte	0x182
	.byte	0x1c
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x438
	.uleb128 0x8
	.4byte	.LASF42
	.2byte	0x182
	.byte	0x41
	.4byte	0x29d
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x7
	.4byte	.LASF55
	.2byte	0x173
	.byte	0x1c
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x45d
	.uleb128 0x8
	.4byte	.LASF42
	.2byte	0x173
	.byte	0x3f
	.4byte	0x29d
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.4byte	.LASF56
	.2byte	0x122
	.byte	0x13
	.4byte	0x11a
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x498
	.uleb128 0x3
	.4byte	.LASF42
	.2byte	0x122
	.byte	0x35
	.4byte	0x29d
	.4byte	.LLST2
	.uleb128 0x12
	.4byte	.LVL12
	.4byte	0x413
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF57
	.byte	0x1
	.byte	0xa7
	.byte	0x13
	.4byte	0x11a
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LASF42
	.byte	0x1
	.byte	0xa7
	.byte	0x33
	.4byte	0x29d
	.4byte	.LLST0
	.uleb128 0x1c
	.4byte	.LASF53
	.byte	0x1
	.byte	0xa9
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST1
	.uleb128 0x11
	.4byte	.LVL4
	.4byte	0x438
	.4byte	0x4e2
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL5
	.4byte	0x210
	.uleb128 0xd
	.4byte	.LVL7
	.4byte	0x210
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
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
	.uleb128 0x6
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
.LLST14:
	.byte	0x6
	.4byte	.LVL54
	.byte	0x4
	.uleb128 .LVL54-.LVL54
	.uleb128 .LVL55-.LVL54
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL55-.LVL54
	.uleb128 .LFE346-.LVL54
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL52
	.byte	0x4
	.uleb128 .LVL52-.LVL52
	.uleb128 .LVL53-.LVL52
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL53-.LVL52
	.uleb128 .LFE345-.LVL52
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL33-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL33-.LVL32
	.uleb128 .LFE342-.LVL32
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL36
	.byte	0x4
	.uleb128 .LVL36-.LVL36
	.uleb128 .LVL41-.LVL36
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL41-.LVL36
	.uleb128 .LVL43-.LVL36
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL43-.LVL36
	.uleb128 .LVL46-.LVL36
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL46-.LVL36
	.uleb128 .LVL49-.LVL36
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL49-.LVL36
	.uleb128 .LFE341-.LVL36
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL37
	.byte	0x4
	.uleb128 .LVL37-.LVL37
	.uleb128 .LVL39-.LVL37
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL37
	.uleb128 .LVL45-.LVL37
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL45-.LVL37
	.uleb128 .LVL48-.LVL37
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL49-.LVL37
	.uleb128 .LVL51-.LVL37
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL51-.LVL37
	.uleb128 .LFE341-.LVL37
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST12:
	.byte	0x6
	.4byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL40-.LVL38
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL43-.LVL38
	.uleb128 .LVL44-.LVL38
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL49-.LVL38
	.uleb128 .LVL50-.LVL38
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL25
	.byte	0x4
	.uleb128 .LVL25-.LVL25
	.uleb128 .LVL27-.LVL25
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL27-.LVL25
	.uleb128 .LVL28-.LVL25
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL28-.LVL25
	.uleb128 .LVL29-.LVL25
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL29-.LVL25
	.uleb128 .LVL30-.LVL25
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL30-.LVL25
	.uleb128 .LVL31-.LVL25
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL31-.LVL25
	.uleb128 .LFE340-.LVL25
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL25
	.byte	0x4
	.uleb128 .LVL25-.LVL25
	.uleb128 .LVL26-.LVL25
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL26-.LVL25
	.uleb128 .LVL28-.LVL25
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL28-.LVL25
	.uleb128 .LVL31-.LVL25
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL18-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL18-.LVL15
	.uleb128 .LVL19-.LVL15
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL19-.LVL15
	.uleb128 .LVL20-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL20-.LVL15
	.uleb128 .LVL21-1-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL21-1-.LVL15
	.uleb128 .LVL24-.LVL15
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL24-.LVL15
	.uleb128 .LFE339-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL18-.LVL15
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL18-.LVL15
	.uleb128 .LVL19-.LVL15
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL19-.LVL15
	.uleb128 .LVL20-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL20-.LVL15
	.uleb128 .LVL21-1-.LVL15
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL21-1-.LVL15
	.uleb128 .LVL24-.LVL15
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL24-.LVL15
	.uleb128 .LFE339-.LVL15
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST5:
	.byte	0x8
	.4byte	.LVL22
	.uleb128 .LVL24-.LVL22
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LLST6:
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
	.uleb128 .LVL18-.LVL16
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL18-.LVL16
	.uleb128 .LVL19-.LVL16
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL20-.LVL16
	.uleb128 .LFE339-.LVL16
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL11
	.byte	0x4
	.uleb128 .LVL11-.LVL11
	.uleb128 .LVL12-1-.LVL11
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL12-1-.LVL11
	.uleb128 .LVL13-.LVL11
	.uleb128 0x1
	.byte	0x54
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
	.4byte	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL2-.LVL1
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL2-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL3-.LVL1
	.uleb128 .LVL4-1-.LVL1
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL4-1-.LVL1
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
	.uleb128 .LFE335-.LVL1
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x8
	.4byte	.LVL6
	.uleb128 .LVL8-.LVL6
	.uleb128 0x1
	.byte	0x55
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x74
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
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
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
.LLRL15:
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
	.4byte	.LFB342
	.uleb128 .LFE342-.LFB342
	.byte	0x7
	.4byte	.LFB343
	.uleb128 .LFE343-.LFB343
	.byte	0x7
	.4byte	.LFB344
	.uleb128 .LFE344-.LFB344
	.byte	0x7
	.4byte	.LFB341
	.uleb128 .LFE341-.LFB341
	.byte	0x7
	.4byte	.LFB345
	.uleb128 .LFE345-.LFB345
	.byte	0x7
	.4byte	.LFB346
	.uleb128 .LFE346-.LFB346
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF28:
	.ascii	"HAL_RNG_STATE_READY\000"
.LASF43:
	.ascii	"HAL_RNG_ErrorCallback\000"
.LASF22:
	.ascii	"HAL_UNLOCKED\000"
.LASF50:
	.ascii	"HAL_RNG_GenerateRandomNumber_IT\000"
.LASF49:
	.ascii	"itflag\000"
.LASF20:
	.ascii	"HAL_TIMEOUT\000"
.LASF57:
	.ascii	"HAL_RNG_Init\000"
.LASF60:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF44:
	.ascii	"HAL_RNG_ReadyDataCallback\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF61:
	.ascii	"HAL_GetTick\000"
.LASF27:
	.ascii	"HAL_RNG_STATE_RESET\000"
.LASF47:
	.ascii	"HAL_RNG_IRQHandler\000"
.LASF30:
	.ascii	"HAL_RNG_STATE_TIMEOUT\000"
.LASF0:
	.ascii	"short int\000"
.LASF42:
	.ascii	"hrng\000"
.LASF58:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF17:
	.ascii	"HAL_OK\000"
.LASF19:
	.ascii	"HAL_BUSY\000"
.LASF15:
	.ascii	"float\000"
.LASF6:
	.ascii	"long long int\000"
.LASF41:
	.ascii	"HAL_RNG_GetState\000"
.LASF36:
	.ascii	"State\000"
.LASF34:
	.ascii	"Init\000"
.LASF4:
	.ascii	"long int\000"
.LASF35:
	.ascii	"Lock\000"
.LASF45:
	.ascii	"random32bit\000"
.LASF53:
	.ascii	"tickstart\000"
.LASF21:
	.ascii	"HAL_StatusTypeDef\000"
.LASF11:
	.ascii	"RNG_TypeDef\000"
.LASF13:
	.ascii	"long double\000"
.LASF18:
	.ascii	"HAL_ERROR\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF26:
	.ascii	"RNG_InitTypeDef\000"
.LASF48:
	.ascii	"rngclockerror\000"
.LASF1:
	.ascii	"signed char\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF31:
	.ascii	"HAL_RNG_STATE_ERROR\000"
.LASF33:
	.ascii	"Instance\000"
.LASF38:
	.ascii	"RandomNumber\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF59:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_rng.c\000"
.LASF51:
	.ascii	"status\000"
.LASF14:
	.ascii	"char\000"
.LASF29:
	.ascii	"HAL_RNG_STATE_BUSY\000"
.LASF40:
	.ascii	"HAL_RNG_GetError\000"
.LASF39:
	.ascii	"RNG_HandleTypeDef\000"
.LASF56:
	.ascii	"HAL_RNG_DeInit\000"
.LASF23:
	.ascii	"HAL_LOCKED\000"
.LASF54:
	.ascii	"HAL_RNG_MspDeInit\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF16:
	.ascii	"double\000"
.LASF55:
	.ascii	"HAL_RNG_MspInit\000"
.LASF25:
	.ascii	"ClockErrorDetection\000"
.LASF12:
	.ascii	"RESET\000"
.LASF52:
	.ascii	"HAL_RNG_GenerateRandomNumber\000"
.LASF32:
	.ascii	"HAL_RNG_StateTypeDef\000"
.LASF46:
	.ascii	"HAL_RNG_ReadLastRandomNumber\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF24:
	.ascii	"HAL_LockTypeDef\000"
.LASF37:
	.ascii	"ErrorCode\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
