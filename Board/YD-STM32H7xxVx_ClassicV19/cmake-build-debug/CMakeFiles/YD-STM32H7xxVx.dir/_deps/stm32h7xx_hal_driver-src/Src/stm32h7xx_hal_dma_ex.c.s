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
	.file	"stm32h7xx_hal_dma_ex.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_dma_ex.c"
	.section	.text.DMA_MultiBufferSetConfig,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	DMA_MultiBufferSetConfig, %function
DMA_MultiBufferSetConfig:
.LFB343:
	.loc 1 649 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	push	{r4, r5, r6}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 6, -4
	.loc 1 650 3
	.loc 1 650 13 is_stmt 0
	ldr	r4, [r0]
	.loc 1 650 1609
	ldr	r6, .L11
	ldr	r5, .L11+4
	cmp	r4, r5
	it	ne
	cmpne	r4, r6
	beq	.L2
	.loc 1 650 218 discriminator 2
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 325 discriminator 4
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 432 discriminator 6
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 539 discriminator 8
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 646 discriminator 10
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 753 discriminator 12
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 860 discriminator 14
	add	r5, r5, #856
	cmp	r4, r5
	beq	.L2
	.loc 1 650 967 discriminator 16
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 1074 discriminator 18
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 1181 discriminator 20
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 1288 discriminator 22
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 1395 discriminator 24
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 1502 discriminator 26
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 650 1609 discriminator 28
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 677 5 is_stmt 1
	.loc 1 677 53 is_stmt 0
	str	r3, [r4, #4]
	.loc 1 680 5 is_stmt 1
	.loc 1 680 19 is_stmt 0
	ldr	r3, [r0, #8]
.LVL1:
	.loc 1 680 7
	cmp	r3, #64
	beq	.L9
	.loc 1 692 7 is_stmt 1
	.loc 1 692 36 is_stmt 0
	ldr	r3, [r0]
	.loc 1 692 54
	str	r1, [r3, #8]
.LVL2:
	.loc 1 695 7 is_stmt 1
	.loc 1 695 36 is_stmt 0
	ldr	r3, [r0]
	.loc 1 695 55
	str	r2, [r3, #12]
	.loc 1 698 1
	b	.L1
.LVL3:
.L2:
	.loc 1 653 5 is_stmt 1
	.loc 1 653 50 is_stmt 0
	str	r3, [r4, #4]
	.loc 1 656 5 is_stmt 1
	.loc 1 656 19 is_stmt 0
	ldr	r3, [r0, #8]
.LVL4:
	.loc 1 656 7
	cmp	r3, #64
	beq	.L10
	.loc 1 668 7 is_stmt 1
	.loc 1 668 34 is_stmt 0
	ldr	r3, [r0]
	.loc 1 668 51
	str	r1, [r3, #8]
.LVL5:
	.loc 1 671 7 is_stmt 1
	.loc 1 671 34 is_stmt 0
	ldr	r3, [r0]
	.loc 1 671 52
	str	r2, [r3, #12]
.L1:
	.loc 1 698 1
	pop	{r4, r5, r6}
	.cfi_remember_state
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL6:
.L10:
	.cfi_restore_state
	.loc 1 659 7 is_stmt 1
	.loc 1 659 34 is_stmt 0
	ldr	r3, [r0]
	.loc 1 659 51
	str	r2, [r3, #8]
.LVL7:
	.loc 1 662 7 is_stmt 1
	.loc 1 662 34 is_stmt 0
	ldr	r3, [r0]
	.loc 1 662 52
	str	r1, [r3, #12]
	b	.L1
.LVL8:
.L9:
	.loc 1 683 7 is_stmt 1
	.loc 1 683 36 is_stmt 0
	ldr	r3, [r0]
	.loc 1 683 54
	str	r2, [r3, #8]
.LVL9:
	.loc 1 686 7 is_stmt 1
	.loc 1 686 36 is_stmt 0
	ldr	r3, [r0]
	.loc 1 686 55
	str	r1, [r3, #12]
	b	.L1
.L12:
	.align	2
.L11:
	.word	1073872912
	.word	1073872936
	.cfi_endproc
.LFE343:
	.size	DMA_MultiBufferSetConfig, .-DMA_MultiBufferSetConfig
	.section	.text.HAL_DMAEx_MultiBufferStart,"ax",%progbits
	.align	1
	.global	HAL_DMAEx_MultiBufferStart
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMAEx_MultiBufferStart, %function
HAL_DMAEx_MultiBufferStart:
.LFB335:
	.loc 1 121 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL10:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 122 3
.LVL11:
	.loc 1 123 3
	.loc 1 126 3
	.loc 1 127 3
	.loc 1 130 3
	.loc 1 130 17 is_stmt 0
	ldr	r0, [r0, #8]
.LVL12:
	.loc 1 130 6
	cmp	r0, #128
	beq	.L25
	.loc 1 138 5 is_stmt 1
	.loc 1 138 9
	.loc 1 138 18 is_stmt 0
	ldrb	r0, [r4, #52]	@ zero_extendqisi2
	.loc 1 138 11
	cmp	r0, #1
	beq	.L23
	.loc 1 138 68 is_stmt 1 discriminator 2
	.loc 1 138 81 is_stmt 0 discriminator 2
	movs	r0, #1
	strb	r0, [r4, #52]
	.loc 1 138 7 is_stmt 1 discriminator 2
	.loc 1 140 5 discriminator 2
	.loc 1 140 35 is_stmt 0 discriminator 2
	ldrb	r0, [r4, #53]	@ zero_extendqisi2
	uxtb	r0, r0
	.loc 1 140 7 discriminator 2
	cmp	r0, #1
	beq	.L26
	.loc 1 198 7 is_stmt 1
	.loc 1 198 23 is_stmt 0
	mov	r3, #2048
.LVL13:
	str	r3, [r4, #84]
	.loc 1 201 7 is_stmt 1
.LVL14:
	.loc 1 201 14 is_stmt 0
	movs	r0, #1
.LVL15:
.L15:
	.loc 1 205 1
	pop	{r4, r5, r6, pc}
.LVL16:
.L25:
	.loc 1 132 5 is_stmt 1
	.loc 1 132 21 is_stmt 0
	mov	r3, #256
.LVL17:
	str	r3, [r4, #84]
	.loc 1 133 5 is_stmt 1
.LVL18:
	.loc 1 133 12 is_stmt 0
	movs	r0, #1
	b	.L15
.LVL19:
.L26:
	.loc 1 143 7 is_stmt 1
	.loc 1 143 19 is_stmt 0
	movs	r0, #2
	strb	r0, [r4, #53]
	.loc 1 146 7 is_stmt 1
	.loc 1 146 23 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #84]
	.loc 1 148 7 is_stmt 1
	.loc 1 148 17 is_stmt 0
	ldr	r0, [r4]
	.loc 1 148 1613
	ldr	r6, .L27
	ldr	r5, .L27+4
	cmp	r0, r5
	it	ne
	cmpne	r0, r6
	beq	.L17
	.loc 1 148 222 discriminator 2
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 329 discriminator 4
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 436 discriminator 6
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 543 discriminator 8
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 650 discriminator 10
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 757 discriminator 12
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 864 discriminator 14
	add	r5, r5, #856
	cmp	r0, r5
	beq	.L17
	.loc 1 148 971 discriminator 16
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 1078 discriminator 18
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 1185 discriminator 20
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 1292 discriminator 22
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 1399 discriminator 24
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 1506 discriminator 26
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 148 1613 discriminator 28
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L17
	.loc 1 165 9 is_stmt 1
	.loc 1 165 49 is_stmt 0
	ldr	r6, [r0]
	.loc 1 165 55
	movw	r5, #32800
	orrs	r5, r5, r6
	str	r5, [r0]
	.loc 1 168 9 is_stmt 1
	.loc 1 168 38 is_stmt 0
	ldr	r0, [r4]
	.loc 1 168 57
	str	r3, [r0, #16]
	.loc 1 171 9 is_stmt 1
	.loc 1 171 56 is_stmt 0
	ldr	r5, [r4, #88]
.LVL20:
	.loc 1 174 9 is_stmt 1
	.loc 1 174 55 is_stmt 0
	ldr	r3, [r4, #92]
.LVL21:
	.loc 1 174 69
	and	r0, r3, #31
.LVL22:
	.loc 1 174 47
	movs	r3, #1
	lsls	r3, r3, r0
	.loc 1 174 27
	str	r3, [r5, #4]
	b	.L18
.LVL23:
.L17:
	.loc 1 151 9 is_stmt 1
	.loc 1 151 47 is_stmt 0
	ldr	r5, [r0]
	.loc 1 151 52
	orr	r5, r5, #262144
	str	r5, [r0]
	.loc 1 154 9 is_stmt 1
	.loc 1 154 36 is_stmt 0
	ldr	r0, [r4]
	.loc 1 154 54
	str	r3, [r0, #16]
	.loc 1 157 9 is_stmt 1
	.loc 1 157 56 is_stmt 0
	ldr	r5, [r4, #88]
.LVL24:
	.loc 1 160 9 is_stmt 1
	.loc 1 160 44 is_stmt 0
	ldr	r3, [r4, #92]
.LVL25:
	.loc 1 160 58
	and	r0, r3, #31
.LVL26:
	.loc 1 160 36
	movs	r3, #63
	lsls	r3, r3, r0
	.loc 1 160 27
	str	r3, [r5, #8]
.LVL27:
.L18:
	.loc 1 177 7 is_stmt 1
	.loc 1 177 17 is_stmt 0
	ldr	r3, [r4]
	.loc 1 177 2490
	ldr	r5, .L27
	ldr	r0, .L27+4
	cmp	r3, r0
	it	ne
	cmpne	r3, r5
	beq	.L19
	.loc 1 177 222 discriminator 2
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 329 discriminator 4
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 436 discriminator 6
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 543 discriminator 8
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 650 discriminator 10
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 757 discriminator 12
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 864 discriminator 14
	add	r0, r0, #856
	cmp	r3, r0
	beq	.L19
	.loc 1 177 971 discriminator 16
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 1078 discriminator 18
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 1185 discriminator 20
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 1292 discriminator 22
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 1399 discriminator 24
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 1506 discriminator 26
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 1613 discriminator 28
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L19
	.loc 1 177 1720 discriminator 30
	ldr	r0, .L27+8
	cmp	r3, r0
	beq	.L19
	.loc 1 177 1830 discriminator 32
	adds	r0, r0, #20
	cmp	r3, r0
	beq	.L19
	.loc 1 177 1940 discriminator 34
	adds	r0, r0, #20
	cmp	r3, r0
	beq	.L19
	.loc 1 177 2050 discriminator 36
	adds	r0, r0, #20
	cmp	r3, r0
	beq	.L19
	.loc 1 177 2160 discriminator 38
	adds	r0, r0, #20
	cmp	r3, r0
	beq	.L19
	.loc 1 177 2270 discriminator 40
	adds	r0, r0, #20
	cmp	r3, r0
	beq	.L19
	.loc 1 177 2380 discriminator 42
	adds	r0, r0, #20
	cmp	r3, r0
	beq	.L19
	.loc 1 177 2490 discriminator 44
	adds	r0, r0, #20
	cmp	r3, r0
	bne	.L20
.L19:
	.loc 1 180 9 is_stmt 1
	ldr	r3, [sp, #16]
	mov	r0, r4
	bl	DMA_MultiBufferSetConfig
.LVL28:
	.loc 1 183 9
	.loc 1 183 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 183 46
	ldr	r2, [r4, #104]
	.loc 1 183 40
	str	r2, [r3, #4]
	.loc 1 185 9 is_stmt 1
	.loc 1 185 16 is_stmt 0
	ldr	r3, [r4, #108]
	.loc 1 185 11
	cbz	r3, .L20
	.loc 1 188 11 is_stmt 1
	.loc 1 188 15 is_stmt 0
	ldr	r3, [r4, #112]
	.loc 1 188 53
	ldr	r2, [r4, #116]
	.loc 1 188 47
	str	r2, [r3, #4]
.L20:
	.loc 1 193 7 is_stmt 1
	.loc 1 193 18 is_stmt 0
	ldr	r3, [r4]
	.loc 1 193 1820
	ldr	r1, .L27
	ldr	r2, .L27+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L21
	.loc 1 193 225 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 334 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 443 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 552 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 661 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 770 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 879 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L21
	.loc 1 193 988 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 1097 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 1206 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 1315 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 1424 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 1533 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 1642 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L21
	.loc 1 193 1865 discriminator 30
	ldr	r2, [r3]
	.loc 1 193 1871 discriminator 30
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 122 21 discriminator 30
	movs	r0, #0
	b	.L15
.L21:
	.loc 1 193 1795 discriminator 29
	ldr	r2, [r3]
	.loc 1 193 1800 discriminator 29
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 122 21 discriminator 29
	movs	r0, #0
	.loc 1 193 1820 discriminator 29
	b	.L15
.LVL29:
.L23:
	.loc 1 138 49
	movs	r0, #2
	b	.L15
.L28:
	.align	2
.L27:
	.word	1073872912
	.word	1073872936
	.word	1476547592
	.cfi_endproc
.LFE335:
	.size	HAL_DMAEx_MultiBufferStart, .-HAL_DMAEx_MultiBufferStart
	.section	.text.HAL_DMAEx_MultiBufferStart_IT,"ax",%progbits
	.align	1
	.global	HAL_DMAEx_MultiBufferStart_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMAEx_MultiBufferStart_IT, %function
HAL_DMAEx_MultiBufferStart_IT:
.LFB336:
	.loc 1 218 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL30:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 219 3
.LVL31:
	.loc 1 220 3
	.loc 1 223 3
	.loc 1 224 3
	.loc 1 227 3
	.loc 1 227 16 is_stmt 0
	ldr	r0, [r0, #8]
.LVL32:
	.loc 1 227 5
	cmp	r0, #128
	beq	.L50
	.loc 1 234 3 is_stmt 1
	.loc 1 234 7
	.loc 1 234 16 is_stmt 0
	ldrb	r0, [r4, #52]	@ zero_extendqisi2
	.loc 1 234 9
	cmp	r0, #1
	beq	.L47
	.loc 1 234 66 is_stmt 1 discriminator 2
	.loc 1 234 79 is_stmt 0 discriminator 2
	movs	r0, #1
	strb	r0, [r4, #52]
	.loc 1 234 5 is_stmt 1 discriminator 2
	.loc 1 236 3 discriminator 2
	.loc 1 236 33 is_stmt 0 discriminator 2
	ldrb	r0, [r4, #53]	@ zero_extendqisi2
	uxtb	r0, r0
	.loc 1 236 5 discriminator 2
	cmp	r0, #1
	beq	.L51
	.loc 1 335 5 is_stmt 1
	.loc 1 335 21 is_stmt 0
	mov	r3, #2048
.LVL33:
	str	r3, [r4, #84]
	.loc 1 338 5 is_stmt 1
.LVL34:
	.loc 1 338 12 is_stmt 0
	movs	r0, #1
.LVL35:
.L31:
	.loc 1 341 1
	pop	{r4, r5, r6, pc}
.LVL36:
.L50:
	.loc 1 229 5 is_stmt 1
	.loc 1 229 21 is_stmt 0
	mov	r3, #256
.LVL37:
	str	r3, [r4, #84]
	.loc 1 230 5 is_stmt 1
	.loc 1 230 12 is_stmt 0
	movs	r0, #1
	b	.L31
.LVL38:
.L51:
	.loc 1 239 5 is_stmt 1
	.loc 1 239 17 is_stmt 0
	movs	r0, #2
	strb	r0, [r4, #53]
	.loc 1 242 5 is_stmt 1
	.loc 1 242 21 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #84]
	.loc 1 244 5 is_stmt 1
	.loc 1 244 15 is_stmt 0
	ldr	r0, [r4]
	.loc 1 244 1611
	ldr	r6, .L54
	ldr	r5, .L54+4
	cmp	r0, r5
	it	ne
	cmpne	r0, r6
	beq	.L33
	.loc 1 244 220 discriminator 2
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 327 discriminator 4
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 434 discriminator 6
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 541 discriminator 8
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 648 discriminator 10
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 755 discriminator 12
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 862 discriminator 14
	add	r5, r5, #856
	cmp	r0, r5
	beq	.L33
	.loc 1 244 969 discriminator 16
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 1076 discriminator 18
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 1183 discriminator 20
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 1290 discriminator 22
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 1397 discriminator 24
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 1504 discriminator 26
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 244 1611 discriminator 28
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L33
	.loc 1 261 7 is_stmt 1
	.loc 1 261 47 is_stmt 0
	ldr	r6, [r0]
	.loc 1 261 53
	movw	r5, #32800
	orrs	r5, r5, r6
	str	r5, [r0]
	.loc 1 264 7 is_stmt 1
	.loc 1 264 36 is_stmt 0
	ldr	r0, [r4]
	.loc 1 264 55
	str	r3, [r0, #16]
	.loc 1 267 7 is_stmt 1
	.loc 1 267 54 is_stmt 0
	ldr	r5, [r4, #88]
.LVL39:
	.loc 1 270 7 is_stmt 1
	.loc 1 270 53 is_stmt 0
	ldr	r3, [r4, #92]
.LVL40:
	.loc 1 270 67
	and	r0, r3, #31
.LVL41:
	.loc 1 270 45
	movs	r3, #1
	lsls	r3, r3, r0
	.loc 1 270 25
	str	r3, [r5, #4]
	b	.L34
.LVL42:
.L33:
	.loc 1 247 7 is_stmt 1
	.loc 1 247 45 is_stmt 0
	ldr	r5, [r0]
	.loc 1 247 50
	orr	r5, r5, #262144
	str	r5, [r0]
	.loc 1 250 7 is_stmt 1
	.loc 1 250 34 is_stmt 0
	ldr	r0, [r4]
	.loc 1 250 52
	str	r3, [r0, #16]
	.loc 1 253 7 is_stmt 1
	.loc 1 253 54 is_stmt 0
	ldr	r5, [r4, #88]
.LVL43:
	.loc 1 256 7 is_stmt 1
	.loc 1 256 42 is_stmt 0
	ldr	r3, [r4, #92]
.LVL44:
	.loc 1 256 56
	and	r0, r3, #31
.LVL45:
	.loc 1 256 34
	movs	r3, #63
	lsls	r3, r3, r0
	.loc 1 256 25
	str	r3, [r5, #8]
.LVL46:
.L34:
	.loc 1 274 5 is_stmt 1
	ldr	r3, [sp, #16]
	mov	r0, r4
	bl	DMA_MultiBufferSetConfig
.LVL47:
	.loc 1 276 5
	.loc 1 276 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 276 2488
	ldr	r1, .L54
	ldr	r2, .L54+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L35
	.loc 1 276 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L35
	.loc 1 276 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L35
	.loc 1 276 1718 discriminator 30
	ldr	r2, .L54+8
	cmp	r3, r2
	beq	.L35
	.loc 1 276 1828 discriminator 32
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L35
	.loc 1 276 1938 discriminator 34
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L35
	.loc 1 276 2048 discriminator 36
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L35
	.loc 1 276 2158 discriminator 38
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L35
	.loc 1 276 2268 discriminator 40
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L35
	.loc 1 276 2378 discriminator 42
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L35
	.loc 1 276 2488 discriminator 44
	adds	r2, r2, #20
	cmp	r3, r2
	bne	.L36
.L35:
	.loc 1 279 7 is_stmt 1
	.loc 1 279 11 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 279 44
	ldr	r2, [r4, #104]
	.loc 1 279 38
	str	r2, [r3, #4]
	.loc 1 281 7 is_stmt 1
	.loc 1 281 14 is_stmt 0
	ldr	r3, [r4, #108]
	.loc 1 281 9
	cbz	r3, .L36
	.loc 1 284 9 is_stmt 1
	.loc 1 284 13 is_stmt 0
	ldr	r3, [r4, #112]
	.loc 1 284 51
	ldr	r2, [r4, #116]
	.loc 1 284 45
	str	r2, [r3, #4]
.L36:
	.loc 1 288 5 is_stmt 1
	.loc 1 288 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 288 1611
	ldr	r1, .L54
	ldr	r2, .L54+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L37
	.loc 1 288 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L37
	.loc 1 288 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 288 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L37
	.loc 1 303 7 is_stmt 1
	.loc 1 303 106 is_stmt 0
	ldr	r2, [r3]
	.loc 1 303 115
	bic	r2, r2, #14
	.loc 1 303 177
	orr	r2, r2, #10
	.loc 1 303 58
	str	r2, [r3]
	.loc 1 305 7 is_stmt 1
	.loc 1 305 15 is_stmt 0
	ldr	r3, [r4, #64]
	.loc 1 305 9
	cmp	r3, #0
	beq	.L52
.L38:
	.loc 1 308 9 is_stmt 1
	.loc 1 308 38 is_stmt 0
	ldr	r2, [r4]
	.loc 1 308 49
	ldr	r3, [r2]
	.loc 1 308 55
	orr	r3, r3, #4
	str	r3, [r2]
	b	.L41
.L55:
	.align	2
.L54:
	.word	1073872912
	.word	1073872936
	.word	1476547592
.L37:
	.loc 1 291 7 is_stmt 1
	.loc 1 291 101 is_stmt 0
	ldr	r2, [r3]
	.loc 1 291 109
	bic	r2, r2, #30
	.loc 1 291 237
	orr	r2, r2, #22
	.loc 1 291 55
	str	r2, [r3]
	.loc 1 292 7 is_stmt 1
	.loc 1 292 34 is_stmt 0
	ldr	r2, [r4]
	.loc 1 292 45
	ldr	r3, [r2, #20]
	.loc 1 292 51
	orr	r3, r3, #128
	str	r3, [r2, #20]
	.loc 1 294 7 is_stmt 1
	.loc 1 294 15 is_stmt 0
	ldr	r3, [r4, #64]
	.loc 1 294 9
	cmp	r3, #0
	beq	.L53
.L40:
	.loc 1 297 9 is_stmt 1
	.loc 1 297 36 is_stmt 0
	ldr	r2, [r4]
	.loc 1 297 47
	ldr	r3, [r2]
	.loc 1 297 52
	orr	r3, r3, #8
	str	r3, [r2]
.L41:
	.loc 1 312 5 is_stmt 1
	.loc 1 312 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 312 2488
	ldr	r1, .L56
	ldr	r2, .L56+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L42
	.loc 1 312 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L42
	.loc 1 312 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L42
	.loc 1 312 1718 discriminator 30
	ldr	r2, .L56+8
	cmp	r3, r2
	beq	.L42
	.loc 1 312 1828 discriminator 32
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L42
	.loc 1 312 1938 discriminator 34
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L42
	.loc 1 312 2048 discriminator 36
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L42
	.loc 1 312 2158 discriminator 38
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L42
	.loc 1 312 2268 discriminator 40
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L42
	.loc 1 312 2378 discriminator 42
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L42
	.loc 1 312 2488 discriminator 44
	adds	r2, r2, #20
	cmp	r3, r2
	bne	.L43
.L42:
	.loc 1 315 7 is_stmt 1
	.loc 1 315 15 is_stmt 0
	ldr	r3, [r4, #96]
	.loc 1 315 30
	ldr	r2, [r3]
	.loc 1 315 9
	tst	r2, #65536
	beq	.L44
	.loc 1 318 9 is_stmt 1
	.loc 1 318 28 is_stmt 0
	ldr	r2, [r3]
	.loc 1 318 34
	orr	r2, r2, #256
	str	r2, [r3]
.L44:
	.loc 1 321 7 is_stmt 1
	.loc 1 321 14 is_stmt 0
	ldr	r3, [r4, #108]
	.loc 1 321 9
	cbz	r3, .L43
	.loc 1 325 9 is_stmt 1
	.loc 1 325 31 is_stmt 0
	ldr	r2, [r3]
	.loc 1 325 38
	orr	r2, r2, #256
	str	r2, [r3]
.L43:
	.loc 1 330 5 is_stmt 1
	.loc 1 330 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 330 1818
	ldr	r1, .L56
	ldr	r2, .L56+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L45
	.loc 1 330 223 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 332 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 441 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 550 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 659 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 768 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 877 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L45
	.loc 1 330 986 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 1095 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 1204 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 1313 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 1422 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 1531 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 1640 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L45
	.loc 1 330 1863 discriminator 30
	ldr	r2, [r3]
	.loc 1 330 1869 discriminator 30
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 219 21 discriminator 30
	movs	r0, #0
	b	.L31
.L53:
	.loc 1 294 54 discriminator 1
	ldr	r3, [r4, #72]
	.loc 1 294 46 discriminator 1
	cmp	r3, #0
	bne	.L40
	b	.L41
.L52:
	.loc 1 305 54 discriminator 1
	ldr	r3, [r4, #72]
	.loc 1 305 46 discriminator 1
	cmp	r3, #0
	bne	.L38
	b	.L41
.L45:
	.loc 1 330 1793 discriminator 29
	ldr	r2, [r3]
	.loc 1 330 1798 discriminator 29
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 219 21 discriminator 29
	movs	r0, #0
	.loc 1 330 1818 discriminator 29
	b	.L31
.LVL48:
.L47:
	.loc 1 234 47
	movs	r0, #2
	b	.L31
.L57:
	.align	2
.L56:
	.word	1073872912
	.word	1073872936
	.word	1476547592
	.cfi_endproc
.LFE336:
	.size	HAL_DMAEx_MultiBufferStart_IT, .-HAL_DMAEx_MultiBufferStart_IT
	.section	.text.HAL_DMAEx_ChangeMemory,"ax",%progbits
	.align	1
	.global	HAL_DMAEx_ChangeMemory
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMAEx_ChangeMemory, %function
HAL_DMAEx_ChangeMemory:
.LFB337:
	.loc 1 358 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL49:
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 359 3
	.loc 1 359 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 359 1609
	ldr	r4, .L66
	ldr	r0, .L66+4
.LVL50:
	cmp	r3, r0
	it	ne
	cmpne	r3, r4
	beq	.L59
	.loc 1 359 218 discriminator 2
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 325 discriminator 4
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 432 discriminator 6
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 539 discriminator 8
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 646 discriminator 10
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 753 discriminator 12
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 860 discriminator 14
	add	r0, r0, #856
	cmp	r3, r0
	beq	.L59
	.loc 1 359 967 discriminator 16
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 1074 discriminator 18
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 1181 discriminator 20
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 1288 discriminator 22
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 1395 discriminator 24
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 1502 discriminator 26
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 359 1609 discriminator 28
	adds	r0, r0, #24
	cmp	r3, r0
	beq	.L59
	.loc 1 374 5 is_stmt 1
	.loc 1 374 7 is_stmt 0
	cbz	r2, .L60
	.loc 1 382 7 is_stmt 1
	.loc 1 382 55 is_stmt 0
	str	r1, [r3, #16]
	b	.L63
.L59:
	.loc 1 361 5 is_stmt 1
	.loc 1 361 7 is_stmt 0
	cbnz	r2, .L62
	.loc 1 364 7 is_stmt 1
	.loc 1 364 52 is_stmt 0
	str	r1, [r3, #12]
.L63:
	.loc 1 386 3 is_stmt 1
	.loc 1 387 1 is_stmt 0
	movs	r0, #0
	ldr	r4, [sp], #4
	.cfi_remember_state
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L62:
	.cfi_restore_state
	.loc 1 369 7 is_stmt 1
	.loc 1 369 52 is_stmt 0
	str	r1, [r3, #16]
	b	.L63
.L60:
	.loc 1 377 7 is_stmt 1
	.loc 1 377 55 is_stmt 0
	str	r1, [r3, #12]
	b	.L63
.L67:
	.align	2
.L66:
	.word	1073872912
	.word	1073872936
	.cfi_endproc
.LFE337:
	.size	HAL_DMAEx_ChangeMemory, .-HAL_DMAEx_ChangeMemory
	.section	.text.HAL_DMAEx_ConfigMuxSync,"ax",%progbits
	.align	1
	.global	HAL_DMAEx_ConfigMuxSync
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMAEx_ConfigMuxSync, %function
HAL_DMAEx_ConfigMuxSync:
.LFB338:
	.loc 1 397 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL51:
	push	{r4, r5, r6}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 6, -4
	.loc 1 398 3
.LVL52:
	.loc 1 399 3
	.loc 1 402 3
	.loc 1 403 3
	.loc 1 404 3
	.loc 1 405 3
	.loc 1 407 3
	.loc 1 407 17 is_stmt 0
	ldrb	r3, [r1, #8]	@ zero_extendqisi2
	.loc 1 407 5
	cmp	r3, #1
	beq	.L75
	.loc 1 399 12
	movs	r4, #0
	.loc 1 398 12
	mov	r5, r4
.LVL53:
.L69:
	.loc 1 424 3 is_stmt 1
	.loc 1 424 10 is_stmt 0
	ldrb	r3, [r0, #53]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 424 5
	cmp	r3, #1
	bne	.L70
	.loc 1 427 5 is_stmt 1
	.loc 1 427 9
	.loc 1 427 18 is_stmt 0
	ldrb	r3, [r0, #52]	@ zero_extendqisi2
	.loc 1 427 11
	cmp	r3, #1
	beq	.L73
	.loc 1 427 68 is_stmt 1 discriminator 2
	.loc 1 427 81 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #52]
	.loc 1 427 7 is_stmt 1 discriminator 2
	.loc 1 430 5 discriminator 2
	.loc 1 430 11 is_stmt 0 discriminator 2
	ldr	r2, [r0, #96]
	.loc 1 430 26 discriminator 2
	ldr	r3, [r2]
	.loc 1 430 33 discriminator 2
	bic	r3, r3, #66048
	str	r3, [r2]
	.loc 1 433 5 is_stmt 1 discriminator 2
	.loc 1 433 47 is_stmt 0 discriminator 2
	ldr	r6, [r0, #96]
	.loc 1 433 62 discriminator 2
	ldr	r2, [r6]
	.loc 1 433 71 discriminator 2
	uxtb	r2, r2
	.loc 1 433 141 discriminator 2
	ldr	r3, [r1, #12]
	.loc 1 433 157 discriminator 2
	subs	r3, r3, #1
	.loc 1 433 163 discriminator 2
	lsls	r3, r3, #19
	.loc 1 433 126 discriminator 2
	orr	r3, r3, r5, lsl #24
	.loc 1 433 173 discriminator 2
	orrs	r3, r3, r4
	.loc 1 433 212 discriminator 2
	ldrb	r4, [r1, #8]	@ zero_extendqisi2
.LVL54:
	.loc 1 433 188 discriminator 2
	orr	r3, r3, r4, lsl #16
	.loc 1 433 259 discriminator 2
	ldrb	r1, [r1, #9]	@ zero_extendqisi2
.LVL55:
	.loc 1 433 235 discriminator 2
	orr	r3, r3, r1, lsl #9
	.loc 1 433 99 discriminator 2
	orrs	r3, r3, r2
	.loc 1 433 35 discriminator 2
	str	r3, [r6]
	.loc 1 441 5 is_stmt 1 discriminator 2
	.loc 1 441 9 discriminator 2
	.loc 1 441 22 is_stmt 0 discriminator 2
	movs	r3, #0
	strb	r3, [r0, #52]
	.loc 1 441 7 is_stmt 1 discriminator 2
	.loc 1 443 5 discriminator 2
	.loc 1 443 12 is_stmt 0 discriminator 2
	mov	r0, r3
.LVL56:
	b	.L71
.LVL57:
.L75:
	.loc 1 409 5 is_stmt 1
	.loc 1 411 5
	.loc 1 417 7
	.loc 1 419 5
	.loc 1 419 18 is_stmt 0
	ldr	r5, [r1]
.LVL58:
	.loc 1 420 5 is_stmt 1
	.loc 1 420 18 is_stmt 0
	ldr	r4, [r1, #4]
.LVL59:
	b	.L69
.L70:
	.loc 1 448 5 is_stmt 1
	.loc 1 448 21 is_stmt 0
	mov	r3, #2048
	str	r3, [r0, #84]
	.loc 1 451 5 is_stmt 1
	.loc 1 451 12 is_stmt 0
	movs	r0, #1
.LVL60:
.L71:
	.loc 1 453 1
	pop	{r4, r5, r6}
	.cfi_remember_state
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL61:
	bx	lr
.LVL62:
.L73:
	.cfi_restore_state
	.loc 1 427 49
	movs	r0, #2
.LVL63:
	b	.L71
	.cfi_endproc
.LFE338:
	.size	HAL_DMAEx_ConfigMuxSync, .-HAL_DMAEx_ConfigMuxSync
	.section	.text.HAL_DMAEx_ConfigMuxRequestGenerator,"ax",%progbits
	.align	1
	.global	HAL_DMAEx_ConfigMuxRequestGenerator
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMAEx_ConfigMuxRequestGenerator, %function
HAL_DMAEx_ConfigMuxRequestGenerator:
.LFB339:
	.loc 1 465 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL64:
	.loc 1 466 3
	.loc 1 467 3
	.loc 1 467 24 is_stmt 0
	ldrb	r3, [r0, #53]	@ zero_extendqisi2
.LVL65:
	.loc 1 470 3 is_stmt 1
	.loc 1 472 3
	.loc 1 478 5
	.loc 1 482 3
	.loc 1 483 3
	.loc 1 488 3
	.loc 1 488 10 is_stmt 0
	ldr	r2, [r0, #108]
	.loc 1 488 5
	cbz	r2, .L84
	.loc 1 465 1
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	uxtb	r3, r3
	.loc 1 496 8 is_stmt 1
	.loc 1 496 35 is_stmt 0
	ldr	r4, [r2]
	.loc 1 496 10
	tst	r4, #65536
	bne	.L79
	.loc 1 496 69 discriminator 1
	cmp	r3, #1
	beq	.L85
.L79:
	.loc 1 515 5 is_stmt 1
	.loc 1 515 21 is_stmt 0
	mov	r3, #2048
.LVL66:
	str	r3, [r0, #84]
	.loc 1 518 5 is_stmt 1
.LVL67:
	.loc 1 521 10 is_stmt 0
	movs	r0, #1
.LVL68:
.L78:
	.loc 1 522 1
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL69:
.L84:
	.loc 1 491 5 is_stmt 1
	.loc 1 491 21 is_stmt 0
	movs	r3, #64
.LVL70:
	str	r3, [r0, #84]
	.loc 1 494 5 is_stmt 1
.LVL71:
	.loc 1 521 10 is_stmt 0
	movs	r0, #1
.LVL72:
	.loc 1 522 1
	bx	lr
.LVL73:
.L85:
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 501 5 is_stmt 1
	.loc 1 501 9
	.loc 1 501 18 is_stmt 0
	ldrb	r3, [r0, #52]	@ zero_extendqisi2
.LVL74:
	.loc 1 501 11
	cmp	r3, #1
	beq	.L80
	.loc 1 501 68 is_stmt 1 discriminator 2
	.loc 1 501 81 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #52]
	.loc 1 501 7 is_stmt 1 discriminator 2
	.loc 1 504 5 discriminator 2
	.loc 1 504 59 is_stmt 0 discriminator 2
	ldr	r3, [r1]
	.loc 1 505 60 discriminator 2
	ldr	r4, [r1, #8]
	.loc 1 505 76 discriminator 2
	subs	r4, r4, #1
	.loc 1 504 70 discriminator 2
	orr	r3, r3, r4, lsl #19
	.loc 1 506 58 discriminator 2
	ldr	r1, [r1, #4]
.LVL75:
	.loc 1 505 91 discriminator 2
	orrs	r3, r3, r1
	.loc 1 504 34 discriminator 2
	str	r3, [r2]
	.loc 1 508 5 is_stmt 1 discriminator 2
	.loc 1 508 9 discriminator 2
	.loc 1 508 22 is_stmt 0 discriminator 2
	movs	r3, #0
	strb	r3, [r0, #52]
	.loc 1 508 7 is_stmt 1 discriminator 2
	.loc 1 510 5 discriminator 2
	.loc 1 510 12 is_stmt 0 discriminator 2
	mov	r0, r3
.LVL76:
	b	.L78
.LVL77:
.L80:
	.loc 1 501 49
	movs	r0, #2
.LVL78:
	b	.L78
	.cfi_endproc
.LFE339:
	.size	HAL_DMAEx_ConfigMuxRequestGenerator, .-HAL_DMAEx_ConfigMuxRequestGenerator
	.section	.text.HAL_DMAEx_EnableMuxRequestGenerator,"ax",%progbits
	.align	1
	.global	HAL_DMAEx_EnableMuxRequestGenerator
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMAEx_EnableMuxRequestGenerator, %function
HAL_DMAEx_EnableMuxRequestGenerator:
.LFB340:
	.loc 1 531 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL79:
	.loc 1 533 3
	.loc 1 537 3
	.loc 1 537 11 is_stmt 0
	ldrb	r3, [r0, #53]	@ zero_extendqisi2
	.loc 1 537 5
	cbz	r3, .L88
	.loc 1 537 51 discriminator 1
	ldr	r3, [r0, #108]
	.loc 1 537 43 discriminator 1
	cbz	r3, .L89
	.loc 1 540 5 is_stmt 1
	.loc 1 540 27 is_stmt 0
	ldr	r2, [r3]
	.loc 1 540 34
	orr	r2, r2, #65536
	str	r2, [r3]
	.loc 1 542 4 is_stmt 1
	.loc 1 542 11 is_stmt 0
	movs	r0, #0
.LVL80:
	bx	lr
.LVL81:
.L88:
	.loc 1 546 11
	movs	r0, #1
.LVL82:
	bx	lr
.LVL83:
.L89:
	movs	r0, #1
.LVL84:
	.loc 1 548 1
	bx	lr
	.cfi_endproc
.LFE340:
	.size	HAL_DMAEx_EnableMuxRequestGenerator, .-HAL_DMAEx_EnableMuxRequestGenerator
	.section	.text.HAL_DMAEx_DisableMuxRequestGenerator,"ax",%progbits
	.align	1
	.global	HAL_DMAEx_DisableMuxRequestGenerator
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMAEx_DisableMuxRequestGenerator, %function
HAL_DMAEx_DisableMuxRequestGenerator:
.LFB341:
	.loc 1 557 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL85:
	.loc 1 559 3
	.loc 1 563 3
	.loc 1 563 11 is_stmt 0
	ldrb	r3, [r0, #53]	@ zero_extendqisi2
	.loc 1 563 5
	cbz	r3, .L92
	.loc 1 563 51 discriminator 1
	ldr	r3, [r0, #108]
	.loc 1 563 43 discriminator 1
	cbz	r3, .L93
	.loc 1 566 5 is_stmt 1
	.loc 1 566 27 is_stmt 0
	ldr	r2, [r3]
	.loc 1 566 34
	bic	r2, r2, #65536
	str	r2, [r3]
	.loc 1 568 4 is_stmt 1
	.loc 1 568 11 is_stmt 0
	movs	r0, #0
.LVL86:
	bx	lr
.LVL87:
.L92:
	.loc 1 572 11
	movs	r0, #1
.LVL88:
	bx	lr
.LVL89:
.L93:
	movs	r0, #1
.LVL90:
	.loc 1 574 1
	bx	lr
	.cfi_endproc
.LFE341:
	.size	HAL_DMAEx_DisableMuxRequestGenerator, .-HAL_DMAEx_DisableMuxRequestGenerator
	.section	.text.HAL_DMAEx_MUX_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_DMAEx_MUX_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMAEx_MUX_IRQHandler, %function
HAL_DMAEx_MUX_IRQHandler:
.LFB342:
	.loc 1 583 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL91:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 585 3
	.loc 1 585 11 is_stmt 0
	ldr	r3, [r0, #100]
	.loc 1 585 32
	ldr	r2, [r3]
	.loc 1 585 44
	ldr	r3, [r0, #104]
	.loc 1 585 5
	tst	r2, r3
	beq	.L95
	.loc 1 588 5 is_stmt 1
	.loc 1 588 9 is_stmt 0
	ldr	r2, [r0, #96]
	.loc 1 588 24
	ldr	r3, [r2]
	.loc 1 588 30
	bic	r3, r3, #256
	str	r3, [r2]
	.loc 1 591 5 is_stmt 1
	.loc 1 591 9 is_stmt 0
	ldr	r3, [r0, #100]
	.loc 1 591 42
	ldr	r2, [r0, #104]
	.loc 1 591 36
	str	r2, [r3, #4]
	.loc 1 594 5 is_stmt 1
	.loc 1 594 9 is_stmt 0
	ldr	r3, [r0, #84]
	.loc 1 594 21
	orr	r3, r3, #512
	str	r3, [r0, #84]
	.loc 1 596 5 is_stmt 1
	.loc 1 596 12 is_stmt 0
	ldr	r3, [r0, #76]
	.loc 1 596 7
	cbz	r3, .L95
	.loc 1 599 7 is_stmt 1
	blx	r3
.LVL92:
.L95:
	.loc 1 603 3
	.loc 1 603 10 is_stmt 0
	ldr	r3, [r4, #108]
	.loc 1 603 5
	cbz	r3, .L94
	.loc 1 606 5 is_stmt 1
	.loc 1 606 13 is_stmt 0
	ldr	r2, [r4, #112]
	.loc 1 606 37
	ldr	r1, [r2]
	.loc 1 606 50
	ldr	r2, [r4, #116]
	.loc 1 606 7
	tst	r1, r2
	beq	.L94
	.loc 1 609 7 is_stmt 1
	.loc 1 609 29 is_stmt 0
	ldr	r2, [r3]
	.loc 1 609 36
	bic	r2, r2, #256
	str	r2, [r3]
	.loc 1 612 7 is_stmt 1
	.loc 1 612 11 is_stmt 0
	ldr	r3, [r4, #112]
	.loc 1 612 49
	ldr	r2, [r4, #116]
	.loc 1 612 43
	str	r2, [r3, #4]
	.loc 1 615 7 is_stmt 1
	.loc 1 615 11 is_stmt 0
	ldr	r3, [r4, #84]
	.loc 1 615 23
	orr	r3, r3, #1024
	str	r3, [r4, #84]
	.loc 1 617 7 is_stmt 1
	.loc 1 617 14 is_stmt 0
	ldr	r3, [r4, #76]
	.loc 1 617 9
	cbz	r3, .L94
	.loc 1 620 9 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL93:
.L94:
	.loc 1 624 1 is_stmt 0
	pop	{r4, pc}
	.cfi_endproc
.LFE342:
	.size	HAL_DMAEx_MUX_IRQHandler, .-HAL_DMAEx_MUX_IRQHandler
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h7xx.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dma.h"
	.file 8 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dma_ex.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x878
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x15
	.4byte	.LASF116
	.byte	0x1d
	.4byte	.LASF117
	.4byte	.LASF118
	.4byte	.LLRL27
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x55
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x16
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x49
	.uleb128 0x13
	.4byte	0x78
	.uleb128 0xa
	.byte	0x18
	.2byte	0x22f
	.4byte	0xd9
	.uleb128 0x9
	.ascii	"CR\000"
	.2byte	0x231
	.4byte	0x84
	.byte	0
	.uleb128 0x5
	.4byte	.LASF11
	.2byte	0x232
	.4byte	0x84
	.byte	0x4
	.uleb128 0x9
	.ascii	"PAR\000"
	.2byte	0x233
	.4byte	0x84
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF12
	.2byte	0x234
	.4byte	0x84
	.byte	0xc
	.uleb128 0x5
	.4byte	.LASF13
	.2byte	0x235
	.4byte	0x84
	.byte	0x10
	.uleb128 0x9
	.ascii	"FCR\000"
	.2byte	0x236
	.4byte	0x84
	.byte	0x14
	.byte	0
	.uleb128 0xb
	.4byte	.LASF14
	.2byte	0x237
	.byte	0x3
	.4byte	0x89
	.uleb128 0xa
	.byte	0x14
	.2byte	0x241
	.4byte	0x12a
	.uleb128 0x9
	.ascii	"CCR\000"
	.2byte	0x243
	.4byte	0x84
	.byte	0
	.uleb128 0x5
	.4byte	.LASF15
	.2byte	0x244
	.4byte	0x84
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF16
	.2byte	0x245
	.4byte	0x84
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF17
	.2byte	0x246
	.4byte	0x84
	.byte	0xc
	.uleb128 0x5
	.4byte	.LASF18
	.2byte	0x247
	.4byte	0x84
	.byte	0x10
	.byte	0
	.uleb128 0xb
	.4byte	.LASF19
	.2byte	0x248
	.byte	0x3
	.4byte	0xe5
	.uleb128 0xa
	.byte	0x4
	.2byte	0x250
	.4byte	0x14b
	.uleb128 0x9
	.ascii	"CCR\000"
	.2byte	0x252
	.4byte	0x84
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF20
	.2byte	0x253
	.byte	0x2
	.4byte	0x136
	.uleb128 0xa
	.byte	0x8
	.2byte	0x255
	.4byte	0x178
	.uleb128 0x9
	.ascii	"CSR\000"
	.2byte	0x257
	.4byte	0x84
	.byte	0
	.uleb128 0x9
	.ascii	"CFR\000"
	.2byte	0x258
	.4byte	0x84
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF21
	.2byte	0x259
	.byte	0x2
	.4byte	0x157
	.uleb128 0xa
	.byte	0x4
	.2byte	0x25b
	.4byte	0x199
	.uleb128 0x5
	.4byte	.LASF22
	.2byte	0x25d
	.4byte	0x84
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF23
	.2byte	0x25e
	.byte	0x2
	.4byte	0x184
	.uleb128 0xa
	.byte	0x8
	.2byte	0x260
	.4byte	0x1c6
	.uleb128 0x5
	.4byte	.LASF24
	.2byte	0x262
	.4byte	0x84
	.byte	0
	.uleb128 0x5
	.4byte	.LASF25
	.2byte	0x263
	.4byte	0x84
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF26
	.2byte	0x264
	.byte	0x2
	.4byte	0x1a5
	.uleb128 0xd
	.4byte	0x34
	.byte	0x5
	.byte	0xbb
	.4byte	0x1ea
	.uleb128 0x2
	.4byte	.LASF27
	.byte	0
	.uleb128 0x2
	.4byte	.LASF28
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF29
	.byte	0x5
	.byte	0xbe
	.byte	0x3
	.4byte	0x1d2
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF30
	.uleb128 0x17
	.byte	0x4
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF31
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF32
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF33
	.uleb128 0xd
	.4byte	0x34
	.byte	0x6
	.byte	0x28
	.4byte	0x238
	.uleb128 0x2
	.4byte	.LASF34
	.byte	0
	.uleb128 0x2
	.4byte	.LASF35
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF36
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF37
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.4byte	.LASF38
	.byte	0x6
	.byte	0x2d
	.byte	0x3
	.4byte	0x214
	.uleb128 0xd
	.4byte	0x34
	.byte	0x6
	.byte	0x33
	.4byte	0x25c
	.uleb128 0x2
	.4byte	.LASF39
	.byte	0
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF41
	.byte	0x6
	.byte	0x36
	.byte	0x3
	.4byte	0x244
	.uleb128 0x12
	.byte	0x30
	.byte	0x7
	.byte	0x30
	.4byte	0x30d
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x7
	.byte	0x32
	.byte	0xc
	.4byte	0x78
	.byte	0
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x7
	.byte	0x35
	.byte	0xc
	.4byte	0x78
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x7
	.byte	0x39
	.byte	0xc
	.4byte	0x78
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x7
	.byte	0x3c
	.byte	0xc
	.4byte	0x78
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x7
	.byte	0x3f
	.byte	0xc
	.4byte	0x78
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x7
	.byte	0x42
	.byte	0xc
	.4byte	0x78
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0x7
	.byte	0x45
	.byte	0xc
	.4byte	0x78
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x7
	.byte	0x4a
	.byte	0xc
	.4byte	0x78
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0x7
	.byte	0x4d
	.byte	0xc
	.4byte	0x78
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0x7
	.byte	0x52
	.byte	0xc
	.4byte	0x78
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0x7
	.byte	0x55
	.byte	0xc
	.4byte	0x78
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x7
	.byte	0x5b
	.byte	0xc
	.4byte	0x78
	.byte	0x2c
	.byte	0
	.uleb128 0x4
	.4byte	.LASF54
	.byte	0x7
	.byte	0x60
	.byte	0x2
	.4byte	0x268
	.uleb128 0xd
	.4byte	0x34
	.byte	0x7
	.byte	0x66
	.4byte	0x343
	.uleb128 0x2
	.4byte	.LASF55
	.byte	0
	.uleb128 0x2
	.4byte	.LASF56
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF57
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF58
	.byte	0x3
	.uleb128 0x2
	.4byte	.LASF59
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF60
	.byte	0x7
	.byte	0x6c
	.byte	0x2
	.4byte	0x319
	.uleb128 0x13
	.4byte	0x343
	.uleb128 0x18
	.4byte	.LASF119
	.byte	0x78
	.byte	0x7
	.byte	0x88
	.byte	0x10
	.4byte	0x466
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x7
	.byte	0x8a
	.byte	0x9
	.4byte	0x1fd
	.byte	0
	.uleb128 0x1
	.4byte	.LASF62
	.byte	0x7
	.byte	0x8c
	.byte	0x13
	.4byte	0x30d
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0x7
	.byte	0x8e
	.byte	0x13
	.4byte	0x25c
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x7
	.byte	0x90
	.byte	0x21
	.4byte	0x34f
	.byte	0x35
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0x7
	.byte	0x92
	.byte	0x9
	.4byte	0x1fd
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x7
	.byte	0x94
	.byte	0xb
	.4byte	0x476
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x7
	.byte	0x96
	.byte	0xb
	.4byte	0x476
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x7
	.byte	0x98
	.byte	0xb
	.4byte	0x476
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x7
	.byte	0x9a
	.byte	0xb
	.4byte	0x476
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF70
	.byte	0x7
	.byte	0x9c
	.byte	0xb
	.4byte	0x476
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF71
	.byte	0x7
	.byte	0x9e
	.byte	0xb
	.4byte	0x476
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0x7
	.byte	0xa0
	.byte	0x14
	.4byte	0x84
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x7
	.byte	0xa2
	.byte	0xb
	.4byte	0x78
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x7
	.byte	0xa4
	.byte	0xb
	.4byte	0x78
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF75
	.byte	0x7
	.byte	0xa6
	.byte	0x1a
	.4byte	0x47b
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0x7
	.byte	0xa8
	.byte	0x20
	.4byte	0x480
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF77
	.byte	0x7
	.byte	0xaa
	.byte	0xb
	.4byte	0x78
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0x7
	.byte	0xad
	.byte	0x1d
	.4byte	0x485
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x7
	.byte	0xaf
	.byte	0x23
	.4byte	0x48a
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF80
	.byte	0x7
	.byte	0xb1
	.byte	0xb
	.4byte	0x78
	.byte	0x74
	.byte	0
	.uleb128 0x19
	.4byte	0x471
	.uleb128 0x1a
	.4byte	0x471
	.byte	0
	.uleb128 0x6
	.4byte	0x354
	.uleb128 0x6
	.4byte	0x466
	.uleb128 0x6
	.4byte	0x14b
	.uleb128 0x6
	.4byte	0x178
	.uleb128 0x6
	.4byte	0x199
	.uleb128 0x6
	.4byte	0x1c6
	.uleb128 0x4
	.4byte	.LASF81
	.byte	0x7
	.byte	0xb3
	.byte	0x2
	.4byte	0x354
	.uleb128 0xd
	.4byte	0x34
	.byte	0x8
	.byte	0x30
	.4byte	0x4b3
	.uleb128 0x2
	.4byte	.LASF82
	.byte	0
	.uleb128 0x2
	.4byte	.LASF83
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF84
	.byte	0x8
	.byte	0x34
	.byte	0x2
	.4byte	0x49b
	.uleb128 0x12
	.byte	0x10
	.byte	0x8
	.byte	0x39
	.4byte	0x509
	.uleb128 0x1
	.4byte	.LASF85
	.byte	0x8
	.byte	0x3b
	.byte	0xc
	.4byte	0x78
	.byte	0
	.uleb128 0x1
	.4byte	.LASF86
	.byte	0x8
	.byte	0x3e
	.byte	0xc
	.4byte	0x78
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF87
	.byte	0x8
	.byte	0x41
	.byte	0x13
	.4byte	0x1ea
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF88
	.byte	0x8
	.byte	0x45
	.byte	0x13
	.4byte	0x1ea
	.byte	0x9
	.uleb128 0x1
	.4byte	.LASF89
	.byte	0x8
	.byte	0x48
	.byte	0xc
	.4byte	0x78
	.byte	0xc
	.byte	0
	.uleb128 0x4
	.4byte	.LASF90
	.byte	0x8
	.byte	0x4b
	.byte	0x2
	.4byte	0x4bf
	.uleb128 0x12
	.byte	0xc
	.byte	0x8
	.byte	0x51
	.4byte	0x545
	.uleb128 0x1
	.4byte	.LASF91
	.byte	0x8
	.byte	0x53
	.byte	0xb
	.4byte	0x78
	.byte	0
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x8
	.byte	0x56
	.byte	0xc
	.4byte	0x78
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF89
	.byte	0x8
	.byte	0x59
	.byte	0xc
	.4byte	0x78
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.4byte	.LASF93
	.byte	0x8
	.byte	0x5c
	.byte	0x2
	.4byte	0x515
	.uleb128 0x6
	.4byte	0x48f
	.uleb128 0x1b
	.4byte	.LASF120
	.byte	0x1
	.2byte	0x288
	.byte	0xd
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5a8
	.uleb128 0xe
	.4byte	.LASF94
	.2byte	0x288
	.byte	0x39
	.4byte	0x551
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xe
	.4byte	.LASF95
	.2byte	0x288
	.byte	0x48
	.4byte	0x78
	.uleb128 0x1
	.byte	0x51
	.uleb128 0xe
	.4byte	.LASF96
	.2byte	0x288
	.byte	0x5d
	.4byte	0x78
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x8
	.4byte	.LASF97
	.2byte	0x288
	.byte	0x72
	.4byte	0x78
	.4byte	.LLST0
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF114
	.byte	0x1
	.2byte	0x246
	.byte	0x6
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ec
	.uleb128 0x8
	.4byte	.LASF94
	.2byte	0x246
	.byte	0x32
	.4byte	0x551
	.4byte	.LLST26
	.uleb128 0x1d
	.4byte	.LVL92
	.4byte	0x5df
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL93
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	.LASF98
	.2byte	0x22c
	.4byte	0x238
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x616
	.uleb128 0x8
	.4byte	.LASF94
	.2byte	0x22c
	.byte	0x4c
	.4byte	0x551
	.4byte	.LLST25
	.byte	0
	.uleb128 0xf
	.4byte	.LASF99
	.2byte	0x212
	.4byte	0x238
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x640
	.uleb128 0x8
	.4byte	.LASF94
	.2byte	0x212
	.byte	0x4b
	.4byte	0x551
	.4byte	.LLST24
	.byte	0
	.uleb128 0xf
	.4byte	.LASF100
	.2byte	0x1d0
	.4byte	0x238
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x69a
	.uleb128 0x8
	.4byte	.LASF94
	.2byte	0x1d0
	.byte	0x4b
	.4byte	0x551
	.4byte	.LLST20
	.uleb128 0x8
	.4byte	.LASF101
	.2byte	0x1d0
	.byte	0x7b
	.4byte	0x69a
	.4byte	.LLST21
	.uleb128 0x10
	.4byte	.LASF102
	.2byte	0x1d2
	.byte	0x15
	.4byte	0x238
	.4byte	.LLST22
	.uleb128 0x10
	.4byte	.LASF103
	.2byte	0x1d3
	.byte	0x18
	.4byte	0x343
	.4byte	.LLST23
	.byte	0
	.uleb128 0x6
	.4byte	0x545
	.uleb128 0xf
	.4byte	.LASF104
	.2byte	0x18c
	.4byte	0x238
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6f9
	.uleb128 0x8
	.4byte	.LASF94
	.2byte	0x18c
	.byte	0x3e
	.4byte	0x551
	.4byte	.LLST16
	.uleb128 0x8
	.4byte	.LASF105
	.2byte	0x18c
	.byte	0x62
	.4byte	0x6f9
	.4byte	.LLST17
	.uleb128 0x10
	.4byte	.LASF106
	.2byte	0x18e
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST18
	.uleb128 0x10
	.4byte	.LASF107
	.2byte	0x18f
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST19
	.byte	0
	.uleb128 0x6
	.4byte	0x509
	.uleb128 0xf
	.4byte	.LASF108
	.2byte	0x165
	.4byte	0x238
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x744
	.uleb128 0x8
	.4byte	.LASF94
	.2byte	0x165
	.byte	0x3d
	.4byte	0x551
	.4byte	.LLST15
	.uleb128 0xe
	.4byte	.LASF109
	.2byte	0x165
	.byte	0x4c
	.4byte	0x78
	.uleb128 0x1
	.byte	0x51
	.uleb128 0xe
	.4byte	.LASF110
	.2byte	0x165
	.byte	0x6b
	.4byte	0x4b3
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF111
	.byte	0x1
	.byte	0xd9
	.byte	0x13
	.4byte	0x238
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7df
	.uleb128 0x7
	.4byte	.LASF94
	.byte	0xd9
	.byte	0x44
	.4byte	0x551
	.4byte	.LLST8
	.uleb128 0x7
	.4byte	.LASF95
	.byte	0xd9
	.byte	0x53
	.4byte	0x78
	.4byte	.LLST9
	.uleb128 0x7
	.4byte	.LASF96
	.byte	0xd9
	.byte	0x68
	.4byte	0x78
	.4byte	.LLST10
	.uleb128 0x7
	.4byte	.LASF112
	.byte	0xd9
	.byte	0x7d
	.4byte	0x78
	.4byte	.LLST11
	.uleb128 0x7
	.4byte	.LASF97
	.byte	0xd9
	.byte	0x98
	.4byte	0x78
	.4byte	.LLST12
	.uleb128 0x11
	.4byte	.LASF102
	.byte	0xdb
	.byte	0x15
	.4byte	0x238
	.4byte	.LLST13
	.uleb128 0x11
	.4byte	.LASF113
	.byte	0xdc
	.byte	0x16
	.4byte	0x7df
	.4byte	.LLST14
	.uleb128 0x14
	.4byte	.LVL47
	.4byte	0x556
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	0x84
	.uleb128 0x20
	.4byte	.LASF115
	.byte	0x1
	.byte	0x78
	.byte	0x13
	.4byte	0x238
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF94
	.byte	0x78
	.byte	0x41
	.4byte	0x551
	.4byte	.LLST1
	.uleb128 0x7
	.4byte	.LASF95
	.byte	0x78
	.byte	0x50
	.4byte	0x78
	.4byte	.LLST2
	.uleb128 0x7
	.4byte	.LASF96
	.byte	0x78
	.byte	0x65
	.4byte	0x78
	.4byte	.LLST3
	.uleb128 0x7
	.4byte	.LASF112
	.byte	0x78
	.byte	0x7a
	.4byte	0x78
	.4byte	.LLST4
	.uleb128 0x7
	.4byte	.LASF97
	.byte	0x78
	.byte	0x95
	.4byte	0x78
	.4byte	.LLST5
	.uleb128 0x11
	.4byte	.LASF102
	.byte	0x7a
	.byte	0x15
	.4byte	0x238
	.4byte	.LLST6
	.uleb128 0x11
	.4byte	.LASF113
	.byte	0x7b
	.byte	0x16
	.4byte	0x7df
	.4byte	.LLST7
	.uleb128 0x14
	.4byte	.LVL28
	.4byte	0x556
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
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
	.uleb128 0x17
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
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1d
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
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
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x2
	.byte	0x74
	.sleb128 4
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL4-.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x2
	.byte	0x74
	.sleb128 4
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LVL6-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL0
	.uleb128 .LVL7-.LVL0
	.uleb128 0x2
	.byte	0x74
	.sleb128 4
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LVL8-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL8-.LVL0
	.uleb128 .LVL9-.LVL0
	.uleb128 0x2
	.byte	0x74
	.sleb128 4
	.byte	0x4
	.uleb128 .LVL9-.LVL0
	.uleb128 .LFE343-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0
.LLST26:
	.byte	0x6
	.4byte	.LVL91
	.byte	0x4
	.uleb128 .LVL91-.LVL91
	.uleb128 .LVL92-1-.LVL91
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL92-1-.LVL91
	.uleb128 .LFE342-.LVL91
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST25:
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
	.uleb128 .LVL89-.LVL85
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL89-.LVL85
	.uleb128 .LVL90-.LVL85
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL90-.LVL85
	.uleb128 .LFE341-.LVL85
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST24:
	.byte	0x6
	.4byte	.LVL79
	.byte	0x4
	.uleb128 .LVL79-.LVL79
	.uleb128 .LVL80-.LVL79
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL80-.LVL79
	.uleb128 .LVL81-.LVL79
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL81-.LVL79
	.uleb128 .LVL82-.LVL79
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL82-.LVL79
	.uleb128 .LVL83-.LVL79
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL83-.LVL79
	.uleb128 .LVL84-.LVL79
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL84-.LVL79
	.uleb128 .LFE340-.LVL79
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST20:
	.byte	0x6
	.4byte	.LVL64
	.byte	0x4
	.uleb128 .LVL64-.LVL64
	.uleb128 .LVL68-.LVL64
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL68-.LVL64
	.uleb128 .LVL69-.LVL64
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL69-.LVL64
	.uleb128 .LVL72-.LVL64
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL72-.LVL64
	.uleb128 .LVL73-.LVL64
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL73-.LVL64
	.uleb128 .LVL76-.LVL64
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL76-.LVL64
	.uleb128 .LVL77-.LVL64
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL77-.LVL64
	.uleb128 .LVL78-.LVL64
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL78-.LVL64
	.uleb128 .LFE339-.LVL64
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST21:
	.byte	0x6
	.4byte	.LVL64
	.byte	0x4
	.uleb128 .LVL64-.LVL64
	.uleb128 .LVL68-.LVL64
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL68-.LVL64
	.uleb128 .LVL69-.LVL64
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL69-.LVL64
	.uleb128 .LVL75-.LVL64
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL75-.LVL64
	.uleb128 .LVL77-.LVL64
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL77-.LVL64
	.uleb128 .LFE339-.LVL64
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST22:
	.byte	0x6
	.4byte	.LVL67
	.byte	0x4
	.uleb128 .LVL67-.LVL67
	.uleb128 .LVL68-.LVL67
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL71-.LVL67
	.uleb128 .LVL72-.LVL67
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST23:
	.byte	0x6
	.4byte	.LVL65
	.byte	0x4
	.uleb128 .LVL65-.LVL65
	.uleb128 .LVL66-.LVL65
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL69-.LVL65
	.uleb128 .LVL70-.LVL65
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL73-.LVL65
	.uleb128 .LVL74-.LVL65
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST16:
	.byte	0x6
	.4byte	.LVL51
	.byte	0x4
	.uleb128 .LVL51-.LVL51
	.uleb128 .LVL56-.LVL51
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL56-.LVL51
	.uleb128 .LVL57-.LVL51
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL57-.LVL51
	.uleb128 .LVL60-.LVL51
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL60-.LVL51
	.uleb128 .LVL62-.LVL51
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL62-.LVL51
	.uleb128 .LVL63-.LVL51
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL63-.LVL51
	.uleb128 .LFE338-.LVL51
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x6
	.4byte	.LVL51
	.byte	0x4
	.uleb128 .LVL51-.LVL51
	.uleb128 .LVL55-.LVL51
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL55-.LVL51
	.uleb128 .LVL57-.LVL51
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL57-.LVL51
	.uleb128 .LVL60-.LVL51
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL60-.LVL51
	.uleb128 .LVL62-.LVL51
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL62-.LVL51
	.uleb128 .LFE338-.LVL51
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST18:
	.byte	0x6
	.4byte	.LVL52
	.byte	0x4
	.uleb128 .LVL52-.LVL52
	.uleb128 .LVL53-.LVL52
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL53-.LVL52
	.uleb128 .LVL57-.LVL52
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL57-.LVL52
	.uleb128 .LVL58-.LVL52
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL58-.LVL52
	.uleb128 .LVL61-.LVL52
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL62-.LVL52
	.uleb128 .LFE338-.LVL52
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL52
	.byte	0x4
	.uleb128 .LVL52-.LVL52
	.uleb128 .LVL53-.LVL52
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL53-.LVL52
	.uleb128 .LVL54-.LVL52
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL57-.LVL52
	.uleb128 .LVL59-.LVL52
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL59-.LVL52
	.uleb128 .LVL60-.LVL52
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL62-.LVL52
	.uleb128 .LFE338-.LVL52
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST15:
	.byte	0x6
	.4byte	.LVL49
	.byte	0x4
	.uleb128 .LVL49-.LVL49
	.uleb128 .LVL50-.LVL49
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL50-.LVL49
	.uleb128 .LFE337-.LVL49
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL30
	.byte	0x4
	.uleb128 .LVL30-.LVL30
	.uleb128 .LVL32-.LVL30
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL32-.LVL30
	.uleb128 .LFE336-.LVL30
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL30
	.byte	0x4
	.uleb128 .LVL30-.LVL30
	.uleb128 .LVL35-.LVL30
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL35-.LVL30
	.uleb128 .LVL36-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL30
	.uleb128 .LVL47-1-.LVL30
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL47-1-.LVL30
	.uleb128 .LVL48-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL30
	.uleb128 .LFE336-.LVL30
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL30
	.byte	0x4
	.uleb128 .LVL30-.LVL30
	.uleb128 .LVL35-.LVL30
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL35-.LVL30
	.uleb128 .LVL36-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL30
	.uleb128 .LVL47-1-.LVL30
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL47-1-.LVL30
	.uleb128 .LVL48-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL30
	.uleb128 .LFE336-.LVL30
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL30
	.byte	0x4
	.uleb128 .LVL30-.LVL30
	.uleb128 .LVL33-.LVL30
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL33-.LVL30
	.uleb128 .LVL36-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL30
	.uleb128 .LVL37-.LVL30
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL37-.LVL30
	.uleb128 .LVL38-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL38-.LVL30
	.uleb128 .LVL40-.LVL30
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL40-.LVL30
	.uleb128 .LVL41-.LVL30
	.uleb128 0x2
	.byte	0x70
	.sleb128 16
	.byte	0x4
	.uleb128 .LVL41-.LVL30
	.uleb128 .LVL42-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL42-.LVL30
	.uleb128 .LVL44-.LVL30
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL44-.LVL30
	.uleb128 .LVL45-.LVL30
	.uleb128 0x2
	.byte	0x70
	.sleb128 16
	.byte	0x4
	.uleb128 .LVL45-.LVL30
	.uleb128 .LVL48-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL30
	.uleb128 .LFE336-.LVL30
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST12:
	.byte	0x6
	.4byte	.LVL30
	.byte	0x4
	.uleb128 .LVL30-.LVL30
	.uleb128 .LVL36-.LVL30
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL36-.LVL30
	.uleb128 .LFE336-.LVL30
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL31
	.byte	0x4
	.uleb128 .LVL31-.LVL31
	.uleb128 .LVL34-.LVL31
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL34-.LVL31
	.uleb128 .LVL35-.LVL31
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL31
	.uleb128 .LFE336-.LVL31
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL42-.LVL39
	.uleb128 0x3
	.byte	0x75
	.sleb128 4
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL39
	.uleb128 .LVL46-.LVL39
	.uleb128 0x3
	.byte	0x75
	.sleb128 8
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL12-.LVL10
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL12-.LVL10
	.uleb128 .LFE335-.LVL10
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL15-.LVL10
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL15-.LVL10
	.uleb128 .LVL16-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL10
	.uleb128 .LVL28-1-.LVL10
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL28-1-.LVL10
	.uleb128 .LVL29-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL29-.LVL10
	.uleb128 .LFE335-.LVL10
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL15-.LVL10
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL15-.LVL10
	.uleb128 .LVL16-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL10
	.uleb128 .LVL28-1-.LVL10
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL28-1-.LVL10
	.uleb128 .LVL29-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL29-.LVL10
	.uleb128 .LFE335-.LVL10
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL13-.LVL10
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL13-.LVL10
	.uleb128 .LVL16-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL10
	.uleb128 .LVL17-.LVL10
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL17-.LVL10
	.uleb128 .LVL19-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL19-.LVL10
	.uleb128 .LVL21-.LVL10
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL21-.LVL10
	.uleb128 .LVL22-.LVL10
	.uleb128 0x2
	.byte	0x70
	.sleb128 16
	.byte	0x4
	.uleb128 .LVL22-.LVL10
	.uleb128 .LVL23-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL10
	.uleb128 .LVL25-.LVL10
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL25-.LVL10
	.uleb128 .LVL26-.LVL10
	.uleb128 0x2
	.byte	0x70
	.sleb128 16
	.byte	0x4
	.uleb128 .LVL26-.LVL10
	.uleb128 .LVL29-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL29-.LVL10
	.uleb128 .LFE335-.LVL10
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL16-.LVL10
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL16-.LVL10
	.uleb128 .LFE335-.LVL10
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL11
	.byte	0x4
	.uleb128 .LVL11-.LVL11
	.uleb128 .LVL14-.LVL11
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL11
	.uleb128 .LVL15-.LVL11
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL11
	.uleb128 .LVL18-.LVL11
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL18-.LVL11
	.uleb128 .LVL19-.LVL11
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL19-.LVL11
	.uleb128 .LFE335-.LVL11
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL20
	.byte	0x4
	.uleb128 .LVL20-.LVL20
	.uleb128 .LVL23-.LVL20
	.uleb128 0x3
	.byte	0x75
	.sleb128 4
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL24-.LVL20
	.uleb128 .LVL27-.LVL20
	.uleb128 0x3
	.byte	0x75
	.sleb128 8
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
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
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
.LLRL27:
	.byte	0x7
	.4byte	.LFB343
	.uleb128 .LFE343-.LFB343
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
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF84:
	.ascii	"HAL_DMA_MemoryTypeDef\000"
.LASF95:
	.ascii	"SrcAddress\000"
.LASF12:
	.ascii	"M0AR\000"
.LASF80:
	.ascii	"DMAmuxRequestGenStatusMask\000"
.LASF62:
	.ascii	"Init\000"
.LASF107:
	.ascii	"syncPolarity\000"
.LASF54:
	.ascii	"DMA_InitTypeDef\000"
.LASF76:
	.ascii	"DMAmuxChannelStatus\000"
.LASF36:
	.ascii	"HAL_BUSY\000"
.LASF27:
	.ascii	"DISABLE\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF17:
	.ascii	"CM0AR\000"
.LASF55:
	.ascii	"HAL_DMA_STATE_RESET\000"
.LASF113:
	.ascii	"ifcRegister_Base\000"
.LASF6:
	.ascii	"long long int\000"
.LASF1:
	.ascii	"signed char\000"
.LASF67:
	.ascii	"XferHalfCpltCallback\000"
.LASF96:
	.ascii	"DstAddress\000"
.LASF68:
	.ascii	"XferM1CpltCallback\000"
.LASF41:
	.ascii	"HAL_LockTypeDef\000"
.LASF21:
	.ascii	"DMAMUX_ChannelStatus_TypeDef\000"
.LASF4:
	.ascii	"long int\000"
.LASF112:
	.ascii	"SecondMemAddress\000"
.LASF44:
	.ascii	"PeriphInc\000"
.LASF52:
	.ascii	"MemBurst\000"
.LASF92:
	.ascii	"Polarity\000"
.LASF28:
	.ascii	"ENABLE\000"
.LASF33:
	.ascii	"double\000"
.LASF73:
	.ascii	"StreamBaseAddress\000"
.LASF65:
	.ascii	"Parent\000"
.LASF63:
	.ascii	"Lock\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF48:
	.ascii	"Mode\000"
.LASF43:
	.ascii	"Direction\000"
.LASF78:
	.ascii	"DMAmuxRequestGen\000"
.LASF99:
	.ascii	"HAL_DMAEx_EnableMuxRequestGenerator\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF37:
	.ascii	"HAL_TIMEOUT\000"
.LASF75:
	.ascii	"DMAmuxChannel\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF74:
	.ascii	"StreamIndex\000"
.LASF34:
	.ascii	"HAL_OK\000"
.LASF87:
	.ascii	"SyncEnable\000"
.LASF82:
	.ascii	"MEMORY0\000"
.LASF83:
	.ascii	"MEMORY1\000"
.LASF89:
	.ascii	"RequestNumber\000"
.LASF116:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF59:
	.ascii	"HAL_DMA_STATE_ABORT\000"
.LASF105:
	.ascii	"pSyncConfig\000"
.LASF72:
	.ascii	"ErrorCode\000"
.LASF114:
	.ascii	"HAL_DMAEx_MUX_IRQHandler\000"
.LASF47:
	.ascii	"MemDataAlignment\000"
.LASF25:
	.ascii	"RGCFR\000"
.LASF110:
	.ascii	"memory\000"
.LASF93:
	.ascii	"HAL_DMA_MuxRequestGeneratorConfigTypeDef\000"
.LASF38:
	.ascii	"HAL_StatusTypeDef\000"
.LASF109:
	.ascii	"Address\000"
.LASF0:
	.ascii	"short int\000"
.LASF23:
	.ascii	"DMAMUX_RequestGen_TypeDef\000"
.LASF86:
	.ascii	"SyncPolarity\000"
.LASF56:
	.ascii	"HAL_DMA_STATE_READY\000"
.LASF90:
	.ascii	"HAL_DMA_MuxSyncConfigTypeDef\000"
.LASF91:
	.ascii	"SignalID\000"
.LASF94:
	.ascii	"hdma\000"
.LASF16:
	.ascii	"CPAR\000"
.LASF98:
	.ascii	"HAL_DMAEx_DisableMuxRequestGenerator\000"
.LASF108:
	.ascii	"HAL_DMAEx_ChangeMemory\000"
.LASF40:
	.ascii	"HAL_LOCKED\000"
.LASF81:
	.ascii	"DMA_HandleTypeDef\000"
.LASF70:
	.ascii	"XferErrorCallback\000"
.LASF29:
	.ascii	"FunctionalState\000"
.LASF101:
	.ascii	"pRequestGeneratorConfig\000"
.LASF22:
	.ascii	"RGCR\000"
.LASF32:
	.ascii	"float\000"
.LASF111:
	.ascii	"HAL_DMAEx_MultiBufferStart_IT\000"
.LASF61:
	.ascii	"Instance\000"
.LASF69:
	.ascii	"XferM1HalfCpltCallback\000"
.LASF120:
	.ascii	"DMA_MultiBufferSetConfig\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF97:
	.ascii	"DataLength\000"
.LASF60:
	.ascii	"HAL_DMA_StateTypeDef\000"
.LASF79:
	.ascii	"DMAmuxRequestGenStatus\000"
.LASF57:
	.ascii	"HAL_DMA_STATE_BUSY\000"
.LASF45:
	.ascii	"MemInc\000"
.LASF24:
	.ascii	"RGSR\000"
.LASF119:
	.ascii	"__DMA_HandleTypeDef\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF50:
	.ascii	"FIFOMode\000"
.LASF88:
	.ascii	"EventEnable\000"
.LASF35:
	.ascii	"HAL_ERROR\000"
.LASF104:
	.ascii	"HAL_DMAEx_ConfigMuxSync\000"
.LASF19:
	.ascii	"BDMA_Channel_TypeDef\000"
.LASF30:
	.ascii	"long double\000"
.LASF51:
	.ascii	"FIFOThreshold\000"
.LASF31:
	.ascii	"char\000"
.LASF42:
	.ascii	"Request\000"
.LASF64:
	.ascii	"State\000"
.LASF103:
	.ascii	"temp_state\000"
.LASF11:
	.ascii	"NDTR\000"
.LASF14:
	.ascii	"DMA_Stream_TypeDef\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF13:
	.ascii	"M1AR\000"
.LASF46:
	.ascii	"PeriphDataAlignment\000"
.LASF77:
	.ascii	"DMAmuxChannelStatusMask\000"
.LASF106:
	.ascii	"syncSignalID\000"
.LASF20:
	.ascii	"DMAMUX_Channel_TypeDef\000"
.LASF102:
	.ascii	"status\000"
.LASF115:
	.ascii	"HAL_DMAEx_MultiBufferStart\000"
.LASF15:
	.ascii	"CNDTR\000"
.LASF49:
	.ascii	"Priority\000"
.LASF85:
	.ascii	"SyncSignalID\000"
.LASF118:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF18:
	.ascii	"CM1AR\000"
.LASF58:
	.ascii	"HAL_DMA_STATE_ERROR\000"
.LASF100:
	.ascii	"HAL_DMAEx_ConfigMuxRequestGenerator\000"
.LASF39:
	.ascii	"HAL_UNLOCKED\000"
.LASF117:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_dma_ex.c\000"
.LASF71:
	.ascii	"XferAbortCallback\000"
.LASF26:
	.ascii	"DMAMUX_RequestGenStatus_TypeDef\000"
.LASF66:
	.ascii	"XferCpltCallback\000"
.LASF53:
	.ascii	"PeriphBurst\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
