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
	.file	"stm32h7xx_hal_opamp_ex.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_opamp_ex.c"
	.section	.text.HAL_OPAMPEx_SelfCalibrateAll,"ax",%progbits
	.align	1
	.global	HAL_OPAMPEx_SelfCalibrateAll
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMPEx_SelfCalibrateAll, %function
HAL_OPAMPEx_SelfCalibrateAll:
.LFB335:
	.loc 1 78 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	.loc 1 79 3
	.loc 1 81 3
	.loc 1 82 3
	.loc 1 83 3
	.loc 1 84 3
	.loc 1 87 3
	.loc 1 88 3
	.loc 1 90 3
	.loc 1 91 3
	.loc 1 92 3
	.loc 1 94 3
	.loc 1 94 5 is_stmt 0
	cmp	r1, #0
	it	ne
	cmpne	r0, #0
	beq	.L25
	.loc 1 78 1
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 56
	mov	r4, r0
	mov	r5, r1
	.loc 1 99 8 is_stmt 1
	.loc 1 99 18 is_stmt 0
	ldrb	r0, [r0, #50]	@ zero_extendqisi2
.LVL1:
	uxtb	r0, r0
	.loc 1 99 10
	cmp	r0, #1
	beq	.L33
	.loc 1 101 12
	movs	r0, #1
.LVL2:
.L2:
	.loc 1 361 3 is_stmt 1
	.loc 1 362 1 is_stmt 0
	add	sp, sp, #20
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.LVL3:
.L33:
	.cfi_restore_state
	.loc 1 103 8 is_stmt 1
	.loc 1 103 18 is_stmt 0
	ldrb	r3, [r1, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 103 10
	cmp	r3, #1
	bne	.L2
	.loc 1 110 7 is_stmt 1
	.loc 1 111 7
	.loc 1 113 7
	.loc 1 114 7
	.loc 1 118 7
	.loc 1 118 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 118 26
	ldr	r3, [r2]
	.loc 1 118 33
	orr	r3, r3, #2
	str	r3, [r2]
	.loc 1 119 7 is_stmt 1
	.loc 1 119 16 is_stmt 0
	ldr	r2, [r1]
	.loc 1 119 26
	ldr	r3, [r2]
	.loc 1 119 33
	orr	r3, r3, #2
	str	r3, [r2]
	.loc 1 122 7 is_stmt 1
	.loc 1 122 29 is_stmt 0
	ldr	r3, [r4]
	.loc 1 122 39
	ldr	r2, [r3]
	.loc 1 122 18
	and	r2, r2, #96
	str	r2, [sp, #8]
.LVL4:
	.loc 1 123 7 is_stmt 1
	.loc 1 123 29 is_stmt 0
	ldr	r2, [r1]
.LVL5:
	.loc 1 123 39
	ldr	r2, [r2]
	.loc 1 123 18
	and	r2, r2, #96
	str	r2, [sp, #12]
.LVL6:
	.loc 1 126 7 is_stmt 1
	.loc 1 126 60 is_stmt 0
	ldr	r2, [r3]
.LVL7:
	.loc 1 126 93
	bic	r2, r2, #96
	.loc 1 126 35
	str	r2, [r3]
	.loc 1 127 7 is_stmt 1
	.loc 1 127 50 is_stmt 0
	ldr	r2, [r1]
	.loc 1 127 60
	ldr	r3, [r2]
	.loc 1 127 93
	bic	r3, r3, #96
	.loc 1 127 35
	str	r3, [r2]
	.loc 1 130 7 is_stmt 1
	.loc 1 130 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 130 26
	ldr	r3, [r2]
	.loc 1 130 33
	orr	r3, r3, #262144
	str	r3, [r2]
	.loc 1 131 7 is_stmt 1
	.loc 1 131 16 is_stmt 0
	ldr	r2, [r1]
	.loc 1 131 26
	ldr	r3, [r2]
	.loc 1 131 33
	orr	r3, r3, #262144
	str	r3, [r2]
	.loc 1 134 7 is_stmt 1
	.loc 1 134 24 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 134 10
	cbnz	r3, .L27
	.loc 1 136 33
	ldr	r7, .L36
.L3:
.LVL8:
	.loc 1 143 7 is_stmt 1
	.loc 1 143 24 is_stmt 0
	ldr	r3, [r5, #4]
	.loc 1 143 10
	cbnz	r3, .L28
	.loc 1 145 33
	ldr	r6, .L36+4
.L4:
.LVL9:
	.loc 1 153 7 is_stmt 1
	.loc 1 153 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 153 26
	ldr	r3, [r2]
	.loc 1 153 33
	orr	r3, r3, #2048
	str	r3, [r2]
	.loc 1 154 7 is_stmt 1
	.loc 1 154 16 is_stmt 0
	ldr	r2, [r5]
	.loc 1 154 26
	ldr	r3, [r2]
	.loc 1 154 33
	orr	r3, r3, #2048
	str	r3, [r2]
	.loc 1 158 7 is_stmt 1
	.loc 1 158 50 is_stmt 0
	ldr	r2, [r4]
	.loc 1 158 60
	ldr	r3, [r2]
	.loc 1 158 94
	orr	r3, r3, #12288
	.loc 1 158 35
	str	r3, [r2]
	.loc 1 159 7 is_stmt 1
	.loc 1 159 50 is_stmt 0
	ldr	r2, [r5]
	.loc 1 159 60
	ldr	r3, [r2]
	.loc 1 159 94
	orr	r3, r3, #12288
	.loc 1 159 35
	str	r3, [r2]
	.loc 1 162 7 is_stmt 1
	.loc 1 162 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 162 26
	ldr	r3, [r2]
	.loc 1 162 33
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 163 7 is_stmt 1
	.loc 1 163 16 is_stmt 0
	ldr	r2, [r5]
	.loc 1 163 26
	ldr	r3, [r2]
	.loc 1 163 33
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 167 7 is_stmt 1
.LVL10:
	.loc 1 168 7
	.loc 1 169 7
	.loc 1 171 7
	.loc 1 169 13 is_stmt 0
	mov	r8, #8
	.loc 1 168 23
	mov	r10, #16
	.loc 1 167 23
	mov	fp, r10
	.loc 1 171 13
	b	.L5
.LVL11:
.L27:
	.loc 1 140 33
	ldr	r7, .L36+8
	b	.L3
.LVL12:
.L28:
	.loc 1 149 33
	ldr	r6, .L36+12
	b	.L4
.LVL13:
.L6:
	.loc 1 191 11 is_stmt 1
	.loc 1 191 27 is_stmt 0
	sub	fp, fp, r8
.LVL14:
	b	.L7
.L8:
	.loc 1 202 11 is_stmt 1
	.loc 1 202 27 is_stmt 0
	sub	r10, r10, r8
.LVL15:
.L9:
	.loc 1 205 9 is_stmt 1
	.loc 1 205 15 is_stmt 0
	lsr	r8, r8, #1
.LVL16:
.L5:
	.loc 1 171 20 is_stmt 1
	cmp	r8, #0
	beq	.L34
	.loc 1 175 9
	.loc 1 175 47 is_stmt 0
	ldr	r3, [r7]
	.loc 1 175 75
	bic	r3, r3, #31
	.loc 1 175 100
	orr	r3, r3, fp
	.loc 1 175 39
	str	r3, [r7]
	.loc 1 176 9 is_stmt 1
	.loc 1 176 47 is_stmt 0
	ldr	r3, [r6]
	.loc 1 176 75
	bic	r3, r3, #31
	.loc 1 176 100
	orr	r3, r3, r10
	.loc 1 176 39
	str	r3, [r6]
	.loc 1 181 9 is_stmt 1
	movs	r0, #2
	bl	HAL_Delay
.LVL17:
	.loc 1 183 9
	.loc 1 183 22 is_stmt 0
	ldr	r3, [r4]
	.loc 1 183 32
	ldr	r3, [r3]
	.loc 1 183 12
	tst	r3, #1073741824
	beq	.L6
	.loc 1 186 11 is_stmt 1
	.loc 1 186 27 is_stmt 0
	add	fp, fp, r8
.LVL18:
.L7:
	.loc 1 194 9 is_stmt 1
	.loc 1 194 22 is_stmt 0
	ldr	r3, [r5]
	.loc 1 194 32
	ldr	r3, [r3]
	.loc 1 194 12
	tst	r3, #1073741824
	beq	.L8
	.loc 1 197 11 is_stmt 1
	.loc 1 197 27 is_stmt 0
	add	r10, r10, r8
.LVL19:
	b	.L9
.L34:
	.loc 1 211 7 is_stmt 1
	.loc 1 211 45 is_stmt 0
	ldr	r3, [r7]
	.loc 1 211 73
	bic	r3, r3, #31
	.loc 1 211 98
	orr	r3, r3, fp
	.loc 1 211 37
	str	r3, [r7]
	.loc 1 212 7 is_stmt 1
	.loc 1 212 45 is_stmt 0
	ldr	r3, [r6]
	.loc 1 212 73
	bic	r3, r3, #31
	.loc 1 212 98
	orr	r3, r3, r10
	.loc 1 212 37
	str	r3, [r6]
	.loc 1 217 7 is_stmt 1
	movs	r0, #2
	bl	HAL_Delay
.LVL20:
	.loc 1 219 7
	.loc 1 219 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 219 31
	ldr	r3, [r3]
	.loc 1 219 10
	tst	r3, #1073741824
	beq	.L11
	.loc 1 222 9 is_stmt 1
	.loc 1 222 24 is_stmt 0
	add	fp, fp, #1
.LVL21:
	.loc 1 223 9 is_stmt 1
	.loc 1 223 47 is_stmt 0
	ldr	r3, [r7]
	.loc 1 223 75
	bic	r3, r3, #31
	.loc 1 223 100
	orr	r3, r3, fp
	.loc 1 223 39
	str	r3, [r7]
.L11:
	.loc 1 226 7 is_stmt 1
	.loc 1 226 21 is_stmt 0
	ldr	r3, [r5]
	.loc 1 226 31
	ldr	r3, [r3]
	.loc 1 226 10
	tst	r3, #1073741824
	beq	.L12
	.loc 1 229 9 is_stmt 1
	.loc 1 229 24 is_stmt 0
	add	r10, r10, #1
.LVL22:
	.loc 1 230 9 is_stmt 1
	.loc 1 230 47 is_stmt 0
	ldr	r3, [r6]
	.loc 1 230 75
	bic	r3, r3, #31
	.loc 1 230 100
	orr	r3, r3, r10
	.loc 1 230 39
	str	r3, [r6]
.L12:
	.loc 1 235 7 is_stmt 1
	.loc 1 235 50 is_stmt 0
	ldr	r2, [r4]
	.loc 1 235 60
	ldr	r3, [r2]
	.loc 1 235 69
	bic	r3, r3, #12288
	.loc 1 235 94
	orr	r3, r3, #4096
	.loc 1 235 35
	str	r3, [r2]
	.loc 1 236 7 is_stmt 1
	.loc 1 236 50 is_stmt 0
	ldr	r2, [r5]
	.loc 1 236 60
	ldr	r3, [r2]
	.loc 1 236 69
	bic	r3, r3, #12288
	.loc 1 236 94
	orr	r3, r3, #4096
	.loc 1 236 35
	str	r3, [r2]
	.loc 1 240 7 is_stmt 1
.LVL23:
	.loc 1 241 7
	.loc 1 242 7
	.loc 1 244 7
	.loc 1 242 13 is_stmt 0
	mov	r8, #8
	.loc 1 241 23
	mov	r9, #16
	.loc 1 240 23
	str	r9, [sp, #4]
	.loc 1 244 13
	b	.L13
.LVL24:
.L14:
	.loc 1 264 11 is_stmt 1
	.loc 1 264 27 is_stmt 0
	ldr	r3, [sp, #4]
	sub	r3, r3, r8
	str	r3, [sp, #4]
.LVL25:
	b	.L15
.LVL26:
.L16:
	.loc 1 275 11 is_stmt 1
	.loc 1 275 27 is_stmt 0
	sub	r9, r9, r8
.LVL27:
.L17:
	.loc 1 278 9 is_stmt 1
	.loc 1 278 15 is_stmt 0
	lsr	r8, r8, #1
.LVL28:
.L13:
	.loc 1 244 20 is_stmt 1
	cmp	r8, #0
	beq	.L35
	.loc 1 248 9
	.loc 1 248 47 is_stmt 0
	ldr	r3, [r7]
	.loc 1 248 75
	bic	r3, r3, #7936
	.loc 1 248 100
	ldr	r2, [sp, #4]
	orr	r3, r3, r2, lsl #8
	.loc 1 248 39
	str	r3, [r7]
	.loc 1 249 9 is_stmt 1
	.loc 1 249 47 is_stmt 0
	ldr	r3, [r6]
	.loc 1 249 75
	bic	r3, r3, #7936
	.loc 1 249 100
	orr	r3, r3, r9, lsl #8
	.loc 1 249 39
	str	r3, [r6]
	.loc 1 254 9 is_stmt 1
	movs	r0, #2
	bl	HAL_Delay
.LVL29:
	.loc 1 256 9
	.loc 1 256 22 is_stmt 0
	ldr	r3, [r4]
	.loc 1 256 32
	ldr	r3, [r3]
	.loc 1 256 12
	tst	r3, #1073741824
	beq	.L14
	.loc 1 259 11 is_stmt 1
	.loc 1 259 27 is_stmt 0
	ldr	r2, [sp, #4]
	add	r2, r2, r8
	str	r2, [sp, #4]
.LVL30:
.L15:
	.loc 1 267 9 is_stmt 1
	.loc 1 267 22 is_stmt 0
	ldr	r3, [r5]
	.loc 1 267 32
	ldr	r3, [r3]
	.loc 1 267 12
	tst	r3, #1073741824
	beq	.L16
	.loc 1 270 11 is_stmt 1
	.loc 1 270 27 is_stmt 0
	add	r9, r9, r8
.LVL31:
	b	.L17
.L35:
	.loc 1 284 7 is_stmt 1
	.loc 1 284 45 is_stmt 0
	ldr	r3, [r7]
	.loc 1 284 73
	bic	r3, r3, #7936
	.loc 1 284 98
	ldr	r2, [sp, #4]
	orr	r3, r3, r2, lsl #8
	.loc 1 284 37
	str	r3, [r7]
	.loc 1 285 7 is_stmt 1
	.loc 1 285 45 is_stmt 0
	ldr	r3, [r6]
	.loc 1 285 73
	bic	r3, r3, #7936
	.loc 1 285 98
	orr	r3, r3, r9, lsl #8
	.loc 1 285 37
	str	r3, [r6]
	.loc 1 290 7 is_stmt 1
	movs	r0, #2
	bl	HAL_Delay
.LVL32:
	.loc 1 292 7
	.loc 1 292 20 is_stmt 0
	ldr	r3, [r4]
	.loc 1 292 30
	ldr	r3, [r3]
	.loc 1 292 10
	tst	r3, #1073741824
	beq	.L19
	.loc 1 295 9 is_stmt 1
	.loc 1 295 24 is_stmt 0
	ldr	r2, [sp, #4]
	adds	r2, r2, #1
	str	r2, [sp, #4]
.LVL33:
	.loc 1 296 9 is_stmt 1
	.loc 1 296 47 is_stmt 0
	ldr	r3, [r7]
	.loc 1 296 75
	bic	r3, r3, #7936
	.loc 1 296 100
	orr	r3, r3, r2, lsl #8
	.loc 1 296 39
	str	r3, [r7]
.LVL34:
.L19:
	.loc 1 299 7 is_stmt 1
	.loc 1 299 20 is_stmt 0
	ldr	r3, [r5]
	.loc 1 299 30
	ldr	r3, [r3]
	.loc 1 299 10
	tst	r3, #1073741824
	beq	.L20
	.loc 1 302 9 is_stmt 1
	.loc 1 302 24 is_stmt 0
	add	r9, r9, #1
.LVL35:
	.loc 1 303 9 is_stmt 1
	.loc 1 303 47 is_stmt 0
	ldr	r3, [r6]
	.loc 1 303 75
	bic	r3, r3, #7936
	.loc 1 303 100
	orr	r3, r3, r9, lsl #8
	.loc 1 303 39
	str	r3, [r6]
.L20:
	.loc 1 307 7 is_stmt 1
	.loc 1 307 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 307 26
	ldr	r3, [r2]
	.loc 1 307 33
	bic	r3, r3, #2048
	str	r3, [r2]
	.loc 1 308 7 is_stmt 1
	.loc 1 308 16 is_stmt 0
	ldr	r2, [r5]
	.loc 1 308 26
	ldr	r3, [r2]
	.loc 1 308 33
	bic	r3, r3, #2048
	str	r3, [r2]
	.loc 1 311 7 is_stmt 1
	.loc 1 311 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 311 26
	ldr	r3, [r2]
	.loc 1 311 33
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 312 7 is_stmt 1
	.loc 1 312 16 is_stmt 0
	ldr	r2, [r5]
	.loc 1 312 26
	ldr	r3, [r2]
	.loc 1 312 33
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 318 7 is_stmt 1
	.loc 1 318 34 is_stmt 0
	mov	r3, #262144
	str	r3, [r4, #28]
	.loc 1 319 7 is_stmt 1
	.loc 1 319 34 is_stmt 0
	str	r3, [r5, #28]
	.loc 1 322 7 is_stmt 1
	.loc 1 322 24 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 322 10
	cmp	r3, #256
	beq	.L21
	.loc 1 325 9 is_stmt 1
	.loc 1 325 38 is_stmt 0
	str	fp, [r4, #36]
	.loc 1 327 9 is_stmt 1
	.loc 1 327 38 is_stmt 0
	ldr	r3, [sp, #4]
	str	r3, [r4, #32]
.L22:
	.loc 1 337 7 is_stmt 1
	.loc 1 337 24 is_stmt 0
	ldr	r3, [r5, #4]
	.loc 1 337 10
	cmp	r3, #256
	beq	.L23
	.loc 1 340 9 is_stmt 1
	.loc 1 340 38 is_stmt 0
	str	r10, [r5, #36]
	.loc 1 342 9 is_stmt 1
	.loc 1 342 38 is_stmt 0
	str	r9, [r5, #32]
.L24:
	.loc 1 353 7 is_stmt 1
	.loc 1 353 22 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #50]
	.loc 1 354 7 is_stmt 1
	.loc 1 354 22 is_stmt 0
	strb	r3, [r5, #50]
	.loc 1 357 7 is_stmt 1
	.loc 1 357 50 is_stmt 0
	ldr	r2, [r4]
	.loc 1 357 60
	ldr	r3, [r2]
	.loc 1 357 69
	bic	r3, r3, #96
	.loc 1 357 93
	ldr	r1, [sp, #8]
	orrs	r3, r3, r1
	.loc 1 357 35
	str	r3, [r2]
	.loc 1 358 7 is_stmt 1
	.loc 1 358 50 is_stmt 0
	ldr	r2, [r5]
	.loc 1 358 60
	ldr	r3, [r2]
	.loc 1 358 69
	bic	r3, r3, #96
	.loc 1 358 93
	ldr	r1, [sp, #12]
	orrs	r3, r3, r1
	.loc 1 358 35
	str	r3, [r2]
	.loc 1 79 21
	movs	r0, #0
	b	.L2
.L21:
	.loc 1 332 9 is_stmt 1
	.loc 1 332 47 is_stmt 0
	str	fp, [r4, #44]
	.loc 1 334 9 is_stmt 1
	.loc 1 334 47 is_stmt 0
	ldr	r3, [sp, #4]
	str	r3, [r4, #40]
	b	.L22
.L23:
	.loc 1 347 9 is_stmt 1
	.loc 1 347 47 is_stmt 0
	str	r10, [r5, #44]
	.loc 1 349 9 is_stmt 1
	.loc 1 349 47 is_stmt 0
	str	r9, [r5, #40]
	b	.L24
.LVL36:
.L25:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 7
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 10
	.cfi_restore 11
	.cfi_restore 14
	.loc 1 96 12
	movs	r0, #1
.LVL37:
	.loc 1 361 3 is_stmt 1
	.loc 1 362 1 is_stmt 0
	bx	lr
.L37:
	.align	2
.L36:
	.word	1073778692
	.word	1073778708
	.word	1073778696
	.word	1073778712
	.cfi_endproc
.LFE335:
	.size	HAL_OPAMPEx_SelfCalibrateAll, .-HAL_OPAMPEx_SelfCalibrateAll
	.section	.text.HAL_OPAMPEx_Unlock,"ax",%progbits
	.align	1
	.global	HAL_OPAMPEx_Unlock
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_OPAMPEx_Unlock, %function
HAL_OPAMPEx_Unlock:
.LFB336:
	.loc 1 389 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL38:
	.loc 1 390 3
	.loc 1 394 3
	.loc 1 394 5 is_stmt 0
	cbz	r0, .L40
	.loc 1 400 8 is_stmt 1
	.loc 1 400 17 is_stmt 0
	ldrb	r3, [r0, #50]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 400 10
	cmp	r3, #5
	beq	.L42
	.loc 1 410 12
	movs	r0, #1
.LVL39:
	.loc 1 413 3 is_stmt 1
	.loc 1 414 1 is_stmt 0
	bx	lr
.LVL40:
.L42:
	.loc 1 403 5 is_stmt 1
	.loc 1 406 5
	.loc 1 406 19 is_stmt 0
	movs	r3, #4
	strb	r3, [r0, #50]
	.loc 1 390 21
	movs	r0, #0
.LVL41:
	bx	lr
.LVL42:
.L40:
	.loc 1 396 12
	movs	r0, #1
.LVL43:
	bx	lr
	.cfi_endproc
.LFE336:
	.size	HAL_OPAMPEx_Unlock, .-HAL_OPAMPEx_Unlock
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
	.4byte	0x3ce
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xe
	.4byte	.LASF64
	.byte	0x1d
	.4byte	.LASF65
	.4byte	.LASF66
	.4byte	.LLRL14
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
	.uleb128 0xf
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
	.uleb128 0x10
	.byte	0xc
	.byte	0x4
	.2byte	0x412
	.byte	0x9
	.4byte	0xba
	.uleb128 0xb
	.ascii	"CSR\000"
	.2byte	0x414
	.4byte	0x84
	.byte	0
	.uleb128 0xb
	.ascii	"OTR\000"
	.2byte	0x415
	.4byte	0x84
	.byte	0x4
	.uleb128 0x11
	.4byte	.LASF11
	.byte	0x4
	.2byte	0x416
	.byte	0x15
	.4byte	0x84
	.byte	0x8
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x7
	.4byte	0x34
	.byte	0x5
	.byte	0x28
	.4byte	0x107
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.4byte	.LASF21
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0xe3
	.uleb128 0x7
	.4byte	0x34
	.byte	0x5
	.byte	0x33
	.4byte	0x12b
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x5
	.byte	0x36
	.byte	0x3
	.4byte	0x113
	.uleb128 0xc
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
	.uleb128 0x7
	.4byte	0x34
	.byte	0x6
	.byte	0x6d
	.4byte	0x1f9
	.uleb128 0x3
	.4byte	.LASF37
	.byte	0
	.uleb128 0x3
	.4byte	.LASF38
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF39
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF40
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF41
	.byte	0x5
	.byte	0
	.uleb128 0x5
	.4byte	.LASF42
	.byte	0x6
	.byte	0x77
	.byte	0x2
	.4byte	0x1cf
	.uleb128 0xa
	.4byte	0x1f9
	.uleb128 0xc
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
	.uleb128 0x8
	.4byte	0xba
	.uleb128 0x5
	.4byte	.LASF48
	.byte	0x6
	.byte	0x8c
	.byte	0x3
	.4byte	0x20a
	.uleb128 0x13
	.4byte	.LASF67
	.byte	0x7
	.2byte	0x432
	.byte	0x6
	.4byte	0x272
	.uleb128 0x14
	.4byte	0x78
	.byte	0
	.uleb128 0x15
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x184
	.byte	0x13
	.4byte	0x107
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b0
	.uleb128 0x16
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x184
	.byte	0x3b
	.4byte	0x2b0
	.4byte	.LLST12
	.uleb128 0x17
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x186
	.byte	0x15
	.4byte	0x107
	.4byte	.LLST13
	.byte	0
	.uleb128 0x8
	.4byte	0x253
	.uleb128 0x18
	.4byte	.LASF50
	.byte	0x1
	.byte	0x4d
	.byte	0x13
	.4byte	0x107
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3cc
	.uleb128 0xd
	.4byte	.LASF52
	.byte	0x4d
	.byte	0x45
	.4byte	0x2b0
	.4byte	.LLST0
	.uleb128 0xd
	.4byte	.LASF53
	.byte	0x4d
	.byte	0x63
	.4byte	0x2b0
	.4byte	.LLST1
	.uleb128 0x4
	.4byte	.LASF54
	.byte	0x4f
	.byte	0x15
	.4byte	0x107
	.4byte	.LLST2
	.uleb128 0x4
	.4byte	.LASF55
	.byte	0x51
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST3
	.uleb128 0x4
	.4byte	.LASF56
	.byte	0x52
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST4
	.uleb128 0x4
	.4byte	.LASF57
	.byte	0x53
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST5
	.uleb128 0x4
	.4byte	.LASF58
	.byte	0x54
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST6
	.uleb128 0x4
	.4byte	.LASF59
	.byte	0x57
	.byte	0x16
	.4byte	0x3cc
	.4byte	.LLST7
	.uleb128 0x4
	.4byte	.LASF60
	.byte	0x58
	.byte	0x16
	.4byte	0x3cc
	.4byte	.LLST8
	.uleb128 0x4
	.4byte	.LASF61
	.byte	0x5a
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST9
	.uleb128 0x4
	.4byte	.LASF62
	.byte	0x5b
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST10
	.uleb128 0x4
	.4byte	.LASF63
	.byte	0x5c
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST11
	.uleb128 0x9
	.4byte	.LVL17
	.4byte	0x25f
	.4byte	0x396
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x9
	.4byte	.LVL20
	.4byte	0x25f
	.4byte	0x3a9
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x9
	.4byte	.LVL29
	.4byte	0x25f
	.4byte	0x3bc
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x19
	.4byte	.LVL32
	.4byte	0x25f
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	0x84
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x5
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
	.uleb128 0x19
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
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
.LLST12:
	.byte	0x6
	.4byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL39-.LVL38
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL39-.LVL38
	.uleb128 .LVL40-.LVL38
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL40-.LVL38
	.uleb128 .LVL41-.LVL38
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL41-.LVL38
	.uleb128 .LVL42-.LVL38
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL42-.LVL38
	.uleb128 .LVL43-.LVL38
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL43-.LVL38
	.uleb128 .LFE336-.LVL38
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL39-.LVL38
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL39-.LVL38
	.uleb128 .LVL40-.LVL38
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL40-.LVL38
	.uleb128 .LFE336-.LVL38
	.uleb128 0x2
	.byte	0x30
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
	.uleb128 .LVL36-.LVL0
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL36-.LVL0
	.uleb128 .LVL37-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL37-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LVL13-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL13-.LVL0
	.uleb128 .LVL36-.LVL0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL36-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LVL37-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL37-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL11-.LVL10
	.uleb128 0x2
	.byte	0x40
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL13-.LVL10
	.uleb128 .LVL36-.LVL10
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL23
	.byte	0x4
	.uleb128 .LVL23-.LVL23
	.uleb128 .LVL24-.LVL23
	.uleb128 0x2
	.byte	0x40
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL24-.LVL23
	.uleb128 .LVL25-.LVL23
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0x4
	.uleb128 .LVL25-.LVL23
	.uleb128 .LVL26-.LVL23
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL26-.LVL23
	.uleb128 .LVL33-.LVL23
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0x4
	.uleb128 .LVL33-.LVL23
	.uleb128 .LVL34-.LVL23
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL34-.LVL23
	.uleb128 .LVL36-.LVL23
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL11-.LVL10
	.uleb128 0x2
	.byte	0x40
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL13-.LVL10
	.uleb128 .LVL36-.LVL10
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL23
	.byte	0x4
	.uleb128 .LVL23-.LVL23
	.uleb128 .LVL24-.LVL23
	.uleb128 0x2
	.byte	0x40
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL24-.LVL23
	.uleb128 .LVL36-.LVL23
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL8
	.byte	0x4
	.uleb128 .LVL8-.LVL8
	.uleb128 .LVL11-.LVL8
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL12-.LVL8
	.uleb128 .LVL36-.LVL8
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL11-.LVL9
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL13-.LVL9
	.uleb128 .LVL36-.LVL9
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL11-.LVL10
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL13-.LVL10
	.uleb128 .LVL23-.LVL10
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL23-.LVL10
	.uleb128 .LVL24-.LVL10
	.uleb128 0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL24-.LVL10
	.uleb128 .LVL36-.LVL10
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL5-.LVL4
	.uleb128 .LVL36-.LVL4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL6
	.byte	0x4
	.uleb128 .LVL6-.LVL6
	.uleb128 .LVL7-.LVL6
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL7-.LVL6
	.uleb128 .LVL36-.LVL6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
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
.LLRL14:
	.byte	0x7
	.4byte	.LFB335
	.uleb128 .LFE335-.LFB335
	.byte	0x7
	.4byte	.LFB336
	.uleb128 .LFE336-.LFB336
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF65:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_opamp_ex.c\000"
.LASF18:
	.ascii	"HAL_ERROR\000"
.LASF22:
	.ascii	"HAL_UNLOCKED\000"
.LASF20:
	.ascii	"HAL_TIMEOUT\000"
.LASF50:
	.ascii	"HAL_OPAMPEx_SelfCalibrateAll\000"
.LASF66:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF0:
	.ascii	"short int\000"
.LASF61:
	.ascii	"delta\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF35:
	.ascii	"TrimmingValueNHighSpeed\000"
.LASF33:
	.ascii	"TrimmingValueN\000"
.LASF25:
	.ascii	"PowerMode\000"
.LASF64:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
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
.LASF55:
	.ascii	"trimmingvaluen1\000"
.LASF57:
	.ascii	"trimmingvaluen2\000"
.LASF27:
	.ascii	"InvertingInput\000"
.LASF21:
	.ascii	"HAL_StatusTypeDef\000"
.LASF28:
	.ascii	"NonInvertingInput\000"
.LASF59:
	.ascii	"tmp_opamp1_reg_trimming\000"
.LASF13:
	.ascii	"long double\000"
.LASF60:
	.ascii	"tmp_opamp2_reg_trimming\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF40:
	.ascii	"HAL_OPAMP_STATE_BUSY\000"
.LASF41:
	.ascii	"HAL_OPAMP_STATE_BUSYLOCKED\000"
.LASF1:
	.ascii	"signed char\000"
.LASF67:
	.ascii	"HAL_Delay\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF52:
	.ascii	"hopamp1\000"
.LASF43:
	.ascii	"Instance\000"
.LASF53:
	.ascii	"hopamp2\000"
.LASF11:
	.ascii	"HSOTR\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF62:
	.ascii	"opampmode1\000"
.LASF54:
	.ascii	"status\000"
.LASF63:
	.ascii	"opampmode2\000"
.LASF14:
	.ascii	"char\000"
.LASF49:
	.ascii	"HAL_OPAMPEx_Unlock\000"
.LASF23:
	.ascii	"HAL_LOCKED\000"
.LASF36:
	.ascii	"OPAMP_InitTypeDef\000"
.LASF32:
	.ascii	"TrimmingValueP\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF16:
	.ascii	"double\000"
.LASF38:
	.ascii	"HAL_OPAMP_STATE_READY\000"
.LASF12:
	.ascii	"OPAMP_TypeDef\000"
.LASF45:
	.ascii	"Status\000"
.LASF31:
	.ascii	"UserTrimming\000"
.LASF51:
	.ascii	"hopamp\000"
.LASF26:
	.ascii	"Mode\000"
.LASF39:
	.ascii	"HAL_OPAMP_STATE_CALIBBUSY\000"
.LASF56:
	.ascii	"trimmingvaluep1\000"
.LASF58:
	.ascii	"trimmingvaluep2\000"
.LASF37:
	.ascii	"HAL_OPAMP_STATE_RESET\000"
.LASF24:
	.ascii	"HAL_LockTypeDef\000"
.LASF34:
	.ascii	"TrimmingValuePHighSpeed\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
