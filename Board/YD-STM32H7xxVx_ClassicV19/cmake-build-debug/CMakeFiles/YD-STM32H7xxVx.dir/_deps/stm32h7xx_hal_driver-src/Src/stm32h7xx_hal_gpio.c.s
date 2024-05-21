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
	.file	"stm32h7xx_hal_gpio.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_gpio.c"
	.section	.text.HAL_GPIO_Init,"ax",%progbits
	.align	1
	.global	HAL_GPIO_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_GPIO_Init, %function
HAL_GPIO_Init:
.LFB335:
	.loc 1 166 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 20
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 32
	.loc 1 167 3
.LVL1:
	.loc 1 168 3
	.loc 1 169 3
	.loc 1 170 3
	.loc 1 175 3
	.loc 1 179 3
	.loc 1 180 3
	.loc 1 181 3
	.loc 1 184 3
	.loc 1 167 12 is_stmt 0
	movs	r3, #0
	.loc 1 184 9
	b	.L2
.LVL2:
.L25:
	.loc 1 196 9 is_stmt 1
	.loc 1 199 9
	.loc 1 199 14 is_stmt 0
	ldr	r5, [r0, #8]
.LVL3:
	.loc 1 200 9 is_stmt 1
	.loc 1 200 48 is_stmt 0
	lsls	r6, r3, #1
	.loc 1 200 35
	movs	r4, #3
	lsls	r4, r4, r6
	.loc 1 200 14
	bic	r5, r5, r4
.LVL4:
	.loc 1 201 9 is_stmt 1
	.loc 1 201 27 is_stmt 0
	ldr	r4, [r1, #12]
	.loc 1 201 35
	lsls	r4, r4, r6
	.loc 1 201 14
	orrs	r4, r4, r5
.LVL5:
	.loc 1 202 9 is_stmt 1
	.loc 1 202 24 is_stmt 0
	str	r4, [r0, #8]
	.loc 1 205 9 is_stmt 1
	.loc 1 205 14 is_stmt 0
	ldr	r5, [r0, #4]
.LVL6:
	.loc 1 206 9 is_stmt 1
	.loc 1 206 14 is_stmt 0
	bic	r5, r5, ip
.LVL7:
	.loc 1 207 9 is_stmt 1
	.loc 1 207 29 is_stmt 0
	ldr	r4, [r1, #4]
	.loc 1 207 53
	ubfx	r4, r4, #4, #1
	.loc 1 207 60
	lsls	r4, r4, r3
	.loc 1 207 14
	orrs	r4, r4, r5
.LVL8:
	.loc 1 208 9 is_stmt 1
	.loc 1 208 23 is_stmt 0
	str	r4, [r0, #4]
	b	.L4
.LVL9:
.L26:
	.loc 1 227 9 is_stmt 1
	.loc 1 228 9
	.loc 1 231 9
	.loc 1 231 36 is_stmt 0
	lsrs	r5, r3, #3
	.loc 1 231 14
	adds	r5, r5, #8
	ldr	r4, [r0, r5, lsl #2]
.LVL10:
	.loc 1 232 9 is_stmt 1
	.loc 1 232 38 is_stmt 0
	and	ip, r3, #7
	.loc 1 232 47
	lsl	ip, ip, #2
	.loc 1 232 24
	mov	lr, #15
	lsl	lr, lr, ip
	.loc 1 232 14
	bic	lr, r4, lr
.LVL11:
	.loc 1 233 9 is_stmt 1
	.loc 1 233 28 is_stmt 0
	ldr	r4, [r1, #16]
	.loc 1 233 41
	lsl	r4, r4, ip
	.loc 1 233 14
	orr	r4, r4, lr
.LVL12:
	.loc 1 234 9 is_stmt 1
	.loc 1 234 36 is_stmt 0
	str	r4, [r0, r5, lsl #2]
	b	.L6
.LVL13:
.L27:
	.loc 1 252 877
	movs	r4, #9
	b	.L7
.L13:
	.loc 1 252 103
	movs	r4, #0
.L7:
	.loc 1 252 885 discriminator 40
	lsl	r4, r4, lr
	.loc 1 252 14 discriminator 40
	orrs	r4, r4, r5
.LVL14:
	.loc 1 253 9 is_stmt 1 discriminator 40
	.loc 1 253 99 is_stmt 0 discriminator 40
	add	ip, ip, #2
	ldr	r5, .L28
	str	r4, [r5, ip, lsl #2]
	.loc 1 256 9 is_stmt 1 discriminator 40
	.loc 1 256 14 is_stmt 0 discriminator 40
	mov	r4, #1476395008
.LVL15:
	ldr	r5, [r4]
.LVL16:
	.loc 1 257 9 is_stmt 1 discriminator 40
	.loc 1 257 17 is_stmt 0 discriminator 40
	mvns	r4, r2
	.loc 1 257 14 discriminator 40
	bic	r6, r5, r2
.LVL17:
	.loc 1 258 9 is_stmt 1 discriminator 40
	.loc 1 258 12 is_stmt 0 discriminator 40
	ldr	r7, [r1, #4]
	tst	r7, #1048576
	beq	.L8
	.loc 1 260 11 is_stmt 1
	.loc 1 260 16 is_stmt 0
	orr	r6, r2, r5
.LVL18:
.L8:
	.loc 1 262 9 is_stmt 1
	.loc 1 262 80 is_stmt 0
	mov	r5, #1476395008
	str	r6, [r5]
	.loc 1 264 9 is_stmt 1
	.loc 1 264 14 is_stmt 0
	ldr	r5, [r5, #4]
.LVL19:
	.loc 1 265 9 is_stmt 1
	.loc 1 265 14 is_stmt 0
	and	r6, r4, r5
.LVL20:
	.loc 1 266 9 is_stmt 1
	.loc 1 266 12 is_stmt 0
	ldr	r7, [r1, #4]
	tst	r7, #2097152
	beq	.L9
	.loc 1 268 11 is_stmt 1
	.loc 1 268 16 is_stmt 0
	orr	r6, r2, r5
.LVL21:
.L9:
	.loc 1 270 9 is_stmt 1
	.loc 1 270 80 is_stmt 0
	mov	r5, #1476395008
	str	r6, [r5, #4]
	.loc 1 272 9 is_stmt 1
	.loc 1 272 14 is_stmt 0
	ldr	r5, [r5, #132]
.LVL22:
	.loc 1 273 9 is_stmt 1
	.loc 1 273 14 is_stmt 0
	and	r6, r4, r5
.LVL23:
	.loc 1 274 9 is_stmt 1
	.loc 1 274 12 is_stmt 0
	ldr	r7, [r1, #4]
	tst	r7, #131072
	beq	.L10
	.loc 1 276 11 is_stmt 1
	.loc 1 276 16 is_stmt 0
	orr	r6, r2, r5
.LVL24:
.L10:
	.loc 1 278 9 is_stmt 1
	.loc 1 278 31 is_stmt 0
	mov	r5, #1476395008
	str	r6, [r5, #132]
	.loc 1 281 9 is_stmt 1
	.loc 1 281 14 is_stmt 0
	ldr	r5, [r5, #128]
.LVL25:
	.loc 1 282 9 is_stmt 1
	.loc 1 282 14 is_stmt 0
	ands	r4, r4, r5
.LVL26:
	.loc 1 283 9 is_stmt 1
	.loc 1 283 23 is_stmt 0
	ldr	r6, [r1, #4]
	.loc 1 283 12
	tst	r6, #65536
	beq	.L11
	.loc 1 285 11 is_stmt 1
	.loc 1 285 16 is_stmt 0
	orr	r4, r2, r5
.LVL27:
.L11:
	.loc 1 287 9 is_stmt 1
	.loc 1 287 31 is_stmt 0
	mov	r2, #1476395008
.LVL28:
	str	r4, [r2, #128]
.LVL29:
.L3:
	.loc 1 291 5 is_stmt 1
	.loc 1 291 13 is_stmt 0
	adds	r3, r3, #1
.LVL30:
.L2:
	.loc 1 184 41 is_stmt 1
	.loc 1 184 21 is_stmt 0
	ldr	r2, [r1]
	.loc 1 184 41
	lsrs	r4, r2, r3
	beq	.L24
	.loc 1 187 5 is_stmt 1
	.loc 1 187 41 is_stmt 0
	mov	ip, #1
	lsl	ip, ip, r3
.LVL31:
	.loc 1 189 5 is_stmt 1
	.loc 1 189 8 is_stmt 0
	ands	r2, ip, r2
.LVL32:
	beq	.L3
	.loc 1 193 7 is_stmt 1
	.loc 1 193 22 is_stmt 0
	ldr	r4, [r1, #4]
	.loc 1 193 29
	and	r4, r4, #3
	.loc 1 193 64
	subs	r4, r4, #1
	.loc 1 193 10
	cmp	r4, #1
	bls	.L25
.L4:
	.loc 1 211 7 is_stmt 1
	.loc 1 211 21 is_stmt 0
	ldr	r4, [r1, #4]
	.loc 1 211 28
	and	r4, r4, #3
	.loc 1 211 10
	cmp	r4, #3
	beq	.L5
	.loc 1 214 8 is_stmt 1
	.loc 1 217 7
	.loc 1 217 12 is_stmt 0
	ldr	r4, [r0, #12]
.LVL33:
	.loc 1 218 7 is_stmt 1
	.loc 1 218 46 is_stmt 0
	lsls	r5, r3, #1
	.loc 1 218 33
	mov	ip, #3
	lsl	ip, ip, r5
	.loc 1 218 12
	bic	ip, r4, ip
.LVL34:
	.loc 1 219 7 is_stmt 1
	.loc 1 219 26 is_stmt 0
	ldr	r4, [r1, #8]
	.loc 1 219 34
	lsls	r4, r4, r5
	.loc 1 219 12
	orr	r4, r4, ip
.LVL35:
	.loc 1 220 7 is_stmt 1
	.loc 1 220 20 is_stmt 0
	str	r4, [r0, #12]
.LVL36:
.L5:
	.loc 1 224 7 is_stmt 1
	.loc 1 224 21 is_stmt 0
	ldr	r4, [r1, #4]
	.loc 1 224 28
	and	r4, r4, #3
	.loc 1 224 10
	cmp	r4, #2
	beq	.L26
.L6:
	.loc 1 238 7 is_stmt 1
	.loc 1 238 12 is_stmt 0
	ldr	r4, [r0]
.LVL37:
	.loc 1 239 7 is_stmt 1
	.loc 1 239 46 is_stmt 0
	lsl	lr, r3, #1
	.loc 1 239 33
	mov	ip, #3
	lsl	ip, ip, lr
	.loc 1 239 12
	bic	ip, r4, ip
.LVL38:
	.loc 1 240 7 is_stmt 1
	.loc 1 240 26 is_stmt 0
	ldr	r4, [r1, #4]
	.loc 1 240 33
	and	r4, r4, #3
	.loc 1 240 50
	lsl	r4, r4, lr
	.loc 1 240 12
	orr	r4, r4, ip
.LVL39:
	.loc 1 241 7 is_stmt 1
	.loc 1 241 20 is_stmt 0
	str	r4, [r0]
	.loc 1 245 7 is_stmt 1
	.loc 1 245 21 is_stmt 0
	ldr	r4, [r1, #4]
.LVL40:
	.loc 1 245 10
	tst	r4, #196608
	beq	.L3
	.loc 1 248 9 is_stmt 1
.LBB2:
	.loc 1 248 14
	.loc 1 248 40
	.loc 1 248 104 is_stmt 0
	ldr	r4, .L28+4
	ldr	r5, [r4, #244]
	.loc 1 248 115
	orr	r5, r5, #2
	str	r5, [r4, #244]
.LVL41:
	.loc 1 248 138 is_stmt 1
	.loc 1 248 211 is_stmt 0
	ldr	r4, [r4, #244]
	.loc 1 248 222
	and	r4, r4, #2
	.loc 1 248 145
	str	r4, [sp, #4]
	.loc 1 248 244 is_stmt 1
	.loc 1 248 245 is_stmt 0
	ldr	r4, [sp, #4]
.LBE2:
	.loc 1 248 12 is_stmt 1
	.loc 1 250 9
	.loc 1 250 99 is_stmt 0
	lsr	ip, r3, #2
	.loc 1 250 14
	add	r5, ip, #2
	ldr	r4, .L28
	ldr	r5, [r4, r5, lsl #2]
.LVL42:
	.loc 1 251 9 is_stmt 1
	.loc 1 251 45 is_stmt 0
	and	lr, r3, #3
	.loc 1 251 33
	lsl	lr, lr, #2
	.loc 1 251 26
	movs	r4, #15
	lsl	r4, r4, lr
	.loc 1 251 14
	bic	r5, r5, r4
.LVL43:
	.loc 1 252 9 is_stmt 1
	.loc 1 252 103 is_stmt 0
	ldr	r4, .L28+8
	cmp	r0, r4
	beq	.L13
	.loc 1 252 189 discriminator 1
	add	r4, r4, #1024
	cmp	r0, r4
	beq	.L14
	.loc 1 252 275 discriminator 3
	add	r4, r4, #1024
	cmp	r0, r4
	beq	.L15
	.loc 1 252 361 discriminator 5
	add	r4, r4, #1024
	cmp	r0, r4
	beq	.L16
	.loc 1 252 447 discriminator 7
	add	r4, r4, #1024
	cmp	r0, r4
	beq	.L17
	.loc 1 252 533 discriminator 9
	add	r4, r4, #1024
	cmp	r0, r4
	beq	.L18
	.loc 1 252 619 discriminator 11
	add	r4, r4, #1024
	cmp	r0, r4
	beq	.L19
	.loc 1 252 705 discriminator 13
	add	r4, r4, #1024
	cmp	r0, r4
	beq	.L20
	.loc 1 252 791 discriminator 15
	add	r4, r4, #1024
	cmp	r0, r4
	beq	.L21
	.loc 1 252 877 discriminator 17
	add	r4, r4, #1024
	cmp	r0, r4
	beq	.L27
	.loc 1 252 877
	movs	r4, #10
	b	.L7
.L14:
	.loc 1 252 189
	movs	r4, #1
	b	.L7
.L15:
	.loc 1 252 275
	movs	r4, #2
	b	.L7
.L16:
	.loc 1 252 361
	movs	r4, #3
	b	.L7
.L17:
	.loc 1 252 447
	movs	r4, #4
	b	.L7
.L18:
	.loc 1 252 533
	movs	r4, #5
	b	.L7
.L19:
	.loc 1 252 619
	movs	r4, #6
	b	.L7
.L20:
	.loc 1 252 705
	movs	r4, #7
	b	.L7
.L21:
	.loc 1 252 791
	movs	r4, #8
	b	.L7
.LVL44:
.L24:
	.loc 1 293 1
	add	sp, sp, #12
	.cfi_def_cfa_offset 20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L29:
	.align	2
.L28:
	.word	1476396032
	.word	1476543488
	.word	1476526080
	.cfi_endproc
.LFE335:
	.size	HAL_GPIO_Init, .-HAL_GPIO_Init
	.section	.text.HAL_GPIO_DeInit,"ax",%progbits
	.align	1
	.global	HAL_GPIO_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_GPIO_DeInit, %function
HAL_GPIO_DeInit:
.LFB336:
	.loc 1 303 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL45:
	.loc 1 304 3
	.loc 1 305 3
	.loc 1 306 3
	.loc 1 307 3
	.loc 1 312 3
	.loc 1 316 3
	.loc 1 317 3
	.loc 1 320 3
	.loc 1 304 12 is_stmt 0
	movs	r3, #0
.LVL46:
	.loc 1 320 33 is_stmt 1
	lsrs	r2, r1, r3
	beq	.L49
	.loc 1 303 1 is_stmt 0
	push	{r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 20
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	b	.L35
.LVL47:
.L52:
	.loc 1 331 878
	movs	r5, #9
	b	.L33
.L36:
	.loc 1 331 104
	movs	r5, #0
.L33:
	.loc 1 331 886 discriminator 40
	lsl	r5, r5, ip
	.loc 1 331 10 discriminator 40
	cmp	r5, r4
	beq	.L50
.LVL48:
.L34:
	.loc 1 347 7 is_stmt 1
	.loc 1 347 12 is_stmt 0
	ldr	r4, [r0]
	.loc 1 347 53
	lsls	r5, r3, #1
	.loc 1 347 40
	mov	ip, #3
	lsl	ip, ip, r5
	.loc 1 347 20
	orr	r4, r4, ip
	str	r4, [r0]
	.loc 1 350 7 is_stmt 1
	.loc 1 350 17 is_stmt 0
	lsr	lr, r3, #3
.LVL49:
	add	lr, lr, #8
	ldr	r4, [r0, lr, lsl #2]
	.loc 1 350 58
	and	r6, r3, #7
	.loc 1 350 67
	lsls	r6, r6, #2
	.loc 1 350 44
	movs	r5, #15
	lsls	r5, r5, r6
	.loc 1 350 34
	bic	r4, r4, r5
	str	r4, [r0, lr, lsl #2]
	.loc 1 353 7 is_stmt 1
	.loc 1 353 12 is_stmt 0
	ldr	r4, [r0, #12]
	.loc 1 353 20
	bic	r4, r4, ip
	str	r4, [r0, #12]
	.loc 1 356 7 is_stmt 1
	.loc 1 356 12 is_stmt 0
	ldr	r4, [r0, #4]
	.loc 1 356 21
	bic	r2, r4, r2
.LVL50:
	str	r2, [r0, #4]
	.loc 1 359 7 is_stmt 1
	.loc 1 359 12 is_stmt 0
	ldr	r2, [r0, #8]
	.loc 1 359 22
	bic	r2, r2, ip
	str	r2, [r0, #8]
.L32:
	.loc 1 362 5 is_stmt 1
	.loc 1 362 13 is_stmt 0
	adds	r3, r3, #1
.LVL51:
	.loc 1 320 33 is_stmt 1
	lsrs	r2, r1, r3
	beq	.L51
.LVL52:
.L35:
	.loc 1 323 5
	.loc 1 323 33 is_stmt 0
	movs	r2, #1
	lsls	r2, r2, r3
.LVL53:
	.loc 1 325 5 is_stmt 1
	.loc 1 325 8 is_stmt 0
	ands	lr, r2, r1
.LVL54:
	beq	.L32
	.loc 1 329 7 is_stmt 1
	.loc 1 329 96 is_stmt 0
	lsrs	r6, r3, #2
	.loc 1 329 11
	adds	r5, r6, #2
	ldr	r4, .L53
	ldr	r4, [r4, r5, lsl #2]
.LVL55:
	.loc 1 330 7 is_stmt 1
	.loc 1 330 41 is_stmt 0
	and	ip, r3, #3
	.loc 1 330 29
	lsl	ip, ip, #2
	.loc 1 330 22
	movs	r5, #15
	lsl	r7, r5, ip
	.loc 1 330 11
	ands	r4, r4, r7
.LVL56:
	.loc 1 331 7 is_stmt 1
	.loc 1 331 104 is_stmt 0
	ldr	r5, .L53+4
	cmp	r0, r5
	beq	.L36
	.loc 1 331 190 discriminator 1
	add	r5, r5, #1024
	cmp	r0, r5
	beq	.L37
	.loc 1 331 276 discriminator 3
	add	r5, r5, #1024
	cmp	r0, r5
	beq	.L38
	.loc 1 331 362 discriminator 5
	add	r5, r5, #1024
	cmp	r0, r5
	beq	.L39
	.loc 1 331 448 discriminator 7
	add	r5, r5, #1024
	cmp	r0, r5
	beq	.L40
	.loc 1 331 534 discriminator 9
	add	r5, r5, #1024
	cmp	r0, r5
	beq	.L41
	.loc 1 331 620 discriminator 11
	add	r5, r5, #1024
	cmp	r0, r5
	beq	.L42
	.loc 1 331 706 discriminator 13
	add	r5, r5, #1024
	cmp	r0, r5
	beq	.L43
	.loc 1 331 792 discriminator 15
	add	r5, r5, #1024
	cmp	r0, r5
	beq	.L44
	.loc 1 331 878 discriminator 17
	add	r5, r5, #1024
	cmp	r0, r5
	beq	.L52
	.loc 1 331 878
	movs	r5, #10
	b	.L33
.L37:
	.loc 1 331 190
	movs	r5, #1
	b	.L33
.L38:
	.loc 1 331 276
	movs	r5, #2
	b	.L33
.L39:
	.loc 1 331 362
	movs	r5, #3
	b	.L33
.L40:
	.loc 1 331 448
	movs	r5, #4
	b	.L33
.L41:
	.loc 1 331 534
	movs	r5, #5
	b	.L33
.L42:
	.loc 1 331 620
	movs	r5, #6
	b	.L33
.L43:
	.loc 1 331 706
	movs	r5, #7
	b	.L33
.L44:
	.loc 1 331 792
	movs	r5, #8
	b	.L33
.L50:
	.loc 1 334 9 is_stmt 1
	.loc 1 334 24 is_stmt 0
	mov	r4, #1476395008
.LVL57:
	ldr	r5, [r4, #128]
	.loc 1 334 31
	bic	r5, r5, lr
	str	r5, [r4, #128]
	.loc 1 335 9 is_stmt 1
	.loc 1 335 24 is_stmt 0
	ldr	r5, [r4, #132]
	.loc 1 335 31
	bic	r5, r5, lr
	str	r5, [r4, #132]
	.loc 1 338 9 is_stmt 1
	.loc 1 338 72 is_stmt 0
	ldr	r5, [r4, #4]
	.loc 1 338 80
	bic	r5, r5, lr
	str	r5, [r4, #4]
	.loc 1 339 9 is_stmt 1
	.loc 1 339 72 is_stmt 0
	ldr	r5, [r4]
	.loc 1 339 80
	bic	r5, r5, lr
	str	r5, [r4]
	.loc 1 341 9 is_stmt 1
.LVL58:
	.loc 1 342 9
	.loc 1 342 82 is_stmt 0
	ldr	ip, .L53
	adds	r4, r6, #2
	ldr	r5, [ip, r4, lsl #2]
	.loc 1 342 99
	bic	r5, r5, r7
	str	r5, [ip, r4, lsl #2]
	b	.L34
.LVL59:
.L51:
	.loc 1 364 1
	pop	{r4, r5, r6, r7, pc}
.LVL60:
.L49:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 7
	.cfi_restore 14
	bx	lr
.L54:
	.align	2
.L53:
	.word	1476396032
	.word	1476526080
	.cfi_endproc
.LFE336:
	.size	HAL_GPIO_DeInit, .-HAL_GPIO_DeInit
	.section	.text.HAL_GPIO_ReadPin,"ax",%progbits
	.align	1
	.global	HAL_GPIO_ReadPin
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_GPIO_ReadPin, %function
HAL_GPIO_ReadPin:
.LFB337:
	.loc 1 390 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL61:
	.loc 1 391 3
	.loc 1 394 3
	.loc 1 396 3
	.loc 1 396 13 is_stmt 0
	ldr	r3, [r0, #16]
	.loc 1 396 6
	tst	r1, r3
	beq	.L57
	.loc 1 398 15
	movs	r0, #1
.LVL62:
	bx	lr
.LVL63:
.L57:
	.loc 1 402 15
	movs	r0, #0
.LVL64:
	.loc 1 404 3 is_stmt 1
	.loc 1 405 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_GPIO_ReadPin, .-HAL_GPIO_ReadPin
	.section	.text.HAL_GPIO_WritePin,"ax",%progbits
	.align	1
	.global	HAL_GPIO_WritePin
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_GPIO_WritePin, %function
HAL_GPIO_WritePin:
.LFB338:
	.loc 1 424 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL65:
	.loc 1 426 3
	.loc 1 427 3
	.loc 1 429 3
	.loc 1 429 6 is_stmt 0
	cbz	r2, .L59
	.loc 1 431 5 is_stmt 1
	.loc 1 431 17 is_stmt 0
	str	r1, [r0, #24]
	bx	lr
.L59:
	.loc 1 435 5 is_stmt 1
	.loc 1 435 38 is_stmt 0
	lsls	r1, r1, #16
.LVL66:
	.loc 1 435 17
	str	r1, [r0, #24]
	.loc 1 437 1
	bx	lr
	.cfi_endproc
.LFE338:
	.size	HAL_GPIO_WritePin, .-HAL_GPIO_WritePin
	.section	.text.HAL_GPIO_TogglePin,"ax",%progbits
	.align	1
	.global	HAL_GPIO_TogglePin
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_GPIO_TogglePin, %function
HAL_GPIO_TogglePin:
.LFB339:
	.loc 1 446 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL67:
	.loc 1 447 3
	.loc 1 450 3
	.loc 1 453 3
	.loc 1 453 7 is_stmt 0
	ldr	r3, [r0, #20]
.LVL68:
	.loc 1 456 3 is_stmt 1
	.loc 1 456 23 is_stmt 0
	and	r2, r1, r3
	.loc 1 456 53
	bic	r1, r1, r3
.LVL69:
	.loc 1 456 45
	orr	r1, r1, r2, lsl #16
	.loc 1 456 15
	str	r1, [r0, #24]
	.loc 1 457 1
	bx	lr
	.cfi_endproc
.LFE339:
	.size	HAL_GPIO_TogglePin, .-HAL_GPIO_TogglePin
	.section	.text.HAL_GPIO_LockPin,"ax",%progbits
	.align	1
	.global	HAL_GPIO_LockPin
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_GPIO_LockPin, %function
HAL_GPIO_LockPin:
.LFB340:
	.loc 1 471 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL70:
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	.loc 1 472 3
	.loc 1 472 21 is_stmt 0
	mov	r3, #65536
	str	r3, [sp, #4]
	.loc 1 475 3 is_stmt 1
	.loc 1 476 3
	.loc 1 479 3
	.loc 1 479 7 is_stmt 0
	ldr	r3, [sp, #4]
	orrs	r3, r3, r1
	str	r3, [sp, #4]
	.loc 1 481 3 is_stmt 1
	.loc 1 481 15 is_stmt 0
	ldr	r3, [sp, #4]
	str	r3, [r0, #28]
	.loc 1 483 3 is_stmt 1
	.loc 1 483 15 is_stmt 0
	str	r1, [r0, #28]
	.loc 1 485 3 is_stmt 1
	.loc 1 485 15 is_stmt 0
	ldr	r3, [sp, #4]
	str	r3, [r0, #28]
	.loc 1 487 3 is_stmt 1
	.loc 1 487 14 is_stmt 0
	ldr	r3, [r0, #28]
	.loc 1 487 7
	str	r3, [sp, #4]
	.loc 1 490 3 is_stmt 1
	.loc 1 490 13 is_stmt 0
	ldr	r3, [r0, #28]
	.loc 1 490 6
	tst	r3, #65536
	beq	.L64
	.loc 1 492 12
	movs	r0, #0
.LVL71:
.L63:
	.loc 1 498 1
	add	sp, sp, #8
	.cfi_remember_state
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.LVL72:
.L64:
	.cfi_restore_state
	.loc 1 496 12
	movs	r0, #1
.LVL73:
	b	.L63
	.cfi_endproc
.LFE340:
	.size	HAL_GPIO_LockPin, .-HAL_GPIO_LockPin
	.section	.text.HAL_GPIO_EXTI_Callback,"ax",%progbits
	.align	1
	.weak	HAL_GPIO_EXTI_Callback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_GPIO_EXTI_Callback, %function
HAL_GPIO_EXTI_Callback:
.LFB342:
	.loc 1 529 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL74:
	.loc 1 531 3
	.loc 1 536 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE342:
	.size	HAL_GPIO_EXTI_Callback, .-HAL_GPIO_EXTI_Callback
	.section	.text.HAL_GPIO_EXTI_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_GPIO_EXTI_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_GPIO_EXTI_IRQHandler, %function
HAL_GPIO_EXTI_IRQHandler:
.LFB341:
	.loc 1 506 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL75:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 515 3
	.loc 1 515 71 is_stmt 0
	mov	r3, #1476395008
	ldr	r3, [r3, #136]
	.loc 1 515 6
	tst	r3, r0
	bne	.L70
.LVL76:
.L67:
	.loc 1 521 1
	pop	{r3, pc}
.LVL77:
.L70:
	.loc 1 517 5 is_stmt 1
	.loc 1 517 75 is_stmt 0
	mov	r3, #1476395008
	str	r0, [r3, #136]
	.loc 1 518 5 is_stmt 1
	bl	HAL_GPIO_EXTI_Callback
.LVL78:
	.loc 1 521 1 is_stmt 0
	b	.L67
	.cfi_endproc
.LFE341:
	.size	HAL_GPIO_EXTI_IRQHandler, .-HAL_GPIO_EXTI_IRQHandler
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_gpio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xc4c
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x19
	.4byte	.LASF159
	.byte	0x1d
	.4byte	.LASF160
	.4byte	.LASF161
	.4byte	.LLRL11
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
	.uleb128 0x9
	.4byte	.LASF5
	.byte	0x2
	.byte	0x39
	.byte	0x1c
	.4byte	0x47
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x9
	.4byte	.LASF6
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x61
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x1a
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x3
	.byte	0x24
	.byte	0x14
	.4byte	0x3b
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x55
	.uleb128 0xf
	.4byte	0x90
	.uleb128 0x6
	.4byte	0x90
	.4byte	0xb1
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.4byte	0x90
	.4byte	0xc1
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.4byte	0x9c
	.4byte	0xd1
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x3
	.byte	0
	.uleb128 0xf
	.4byte	0xc1
	.uleb128 0x6
	.4byte	0x9c
	.4byte	0xe6
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.4byte	0xd6
	.uleb128 0x6
	.4byte	0x90
	.4byte	0xfb
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x9
	.byte	0
	.uleb128 0x6
	.4byte	0x90
	.4byte	0x10b
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x8
	.byte	0
	.uleb128 0x10
	.byte	0xac
	.2byte	0x351
	.4byte	0x2b4
	.uleb128 0x1
	.4byte	.LASF13
	.2byte	0x353
	.byte	0x13
	.4byte	0x9c
	.byte	0
	.uleb128 0x1
	.4byte	.LASF14
	.2byte	0x354
	.byte	0x13
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF15
	.2byte	0x355
	.byte	0x13
	.4byte	0x9c
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF16
	.2byte	0x356
	.byte	0x13
	.4byte	0x9c
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF17
	.2byte	0x357
	.byte	0x13
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF18
	.2byte	0x358
	.byte	0x13
	.4byte	0x9c
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF19
	.2byte	0x359
	.byte	0xa
	.4byte	0xa1
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF20
	.2byte	0x35a
	.byte	0x13
	.4byte	0x9c
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF21
	.2byte	0x35b
	.byte	0x13
	.4byte	0x9c
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF22
	.2byte	0x35c
	.byte	0x13
	.4byte	0x9c
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF23
	.2byte	0x35d
	.byte	0x13
	.4byte	0x9c
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF24
	.2byte	0x35e
	.byte	0x13
	.4byte	0x9c
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF25
	.2byte	0x35f
	.byte	0x13
	.4byte	0x9c
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF26
	.2byte	0x360
	.byte	0xa
	.4byte	0xa1
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF27
	.2byte	0x361
	.byte	0x13
	.4byte	0x9c
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF28
	.2byte	0x362
	.byte	0x13
	.4byte	0x9c
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF29
	.2byte	0x363
	.byte	0x13
	.4byte	0x9c
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF30
	.2byte	0x364
	.byte	0x13
	.4byte	0x9c
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x365
	.byte	0x13
	.4byte	0x9c
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF32
	.2byte	0x366
	.byte	0x13
	.4byte	0x9c
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF33
	.2byte	0x367
	.byte	0xa
	.4byte	0xeb
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF34
	.2byte	0x368
	.byte	0x13
	.4byte	0x9c
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF35
	.2byte	0x369
	.byte	0x13
	.4byte	0x9c
	.byte	0x84
	.uleb128 0x4
	.ascii	"PR1\000"
	.2byte	0x36a
	.byte	0x13
	.4byte	0x9c
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF36
	.2byte	0x36b
	.byte	0xa
	.4byte	0x90
	.byte	0x8c
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x36c
	.byte	0x13
	.4byte	0x9c
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF38
	.2byte	0x36d
	.byte	0x13
	.4byte	0x9c
	.byte	0x94
	.uleb128 0x4
	.ascii	"PR2\000"
	.2byte	0x36e
	.byte	0x13
	.4byte	0x9c
	.byte	0x98
	.uleb128 0x1
	.4byte	.LASF39
	.2byte	0x36f
	.byte	0xa
	.4byte	0x90
	.byte	0x9c
	.uleb128 0x1
	.4byte	.LASF40
	.2byte	0x370
	.byte	0x13
	.4byte	0x9c
	.byte	0xa0
	.uleb128 0x1
	.4byte	.LASF41
	.2byte	0x371
	.byte	0x13
	.4byte	0x9c
	.byte	0xa4
	.uleb128 0x4
	.ascii	"PR3\000"
	.2byte	0x372
	.byte	0x13
	.4byte	0x9c
	.byte	0xa8
	.byte	0
	.uleb128 0xb
	.4byte	.LASF42
	.2byte	0x373
	.byte	0x2
	.4byte	0x10b
	.uleb128 0x10
	.byte	0x2c
	.2byte	0x37e
	.4byte	0x358
	.uleb128 0x1
	.4byte	.LASF34
	.2byte	0x380
	.byte	0x13
	.4byte	0x9c
	.byte	0
	.uleb128 0x1
	.4byte	.LASF35
	.2byte	0x381
	.byte	0x13
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x4
	.ascii	"PR1\000"
	.2byte	0x382
	.byte	0x13
	.4byte	0x9c
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF19
	.2byte	0x383
	.byte	0xa
	.4byte	0x90
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x384
	.byte	0x13
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF38
	.2byte	0x385
	.byte	0x13
	.4byte	0x9c
	.byte	0x14
	.uleb128 0x4
	.ascii	"PR2\000"
	.2byte	0x386
	.byte	0x13
	.4byte	0x9c
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF26
	.2byte	0x387
	.byte	0xa
	.4byte	0x90
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF40
	.2byte	0x388
	.byte	0x13
	.4byte	0x9c
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF41
	.2byte	0x389
	.byte	0x13
	.4byte	0x9c
	.byte	0x24
	.uleb128 0x4
	.ascii	"PR3\000"
	.2byte	0x38a
	.byte	0x13
	.4byte	0x9c
	.byte	0x28
	.byte	0
	.uleb128 0xb
	.4byte	.LASF43
	.2byte	0x38b
	.byte	0x2
	.4byte	0x2c0
	.uleb128 0x10
	.byte	0x28
	.2byte	0x401
	.4byte	0x3e2
	.uleb128 0x1
	.4byte	.LASF44
	.2byte	0x403
	.byte	0x15
	.4byte	0x9c
	.byte	0
	.uleb128 0x1
	.4byte	.LASF45
	.2byte	0x404
	.byte	0x15
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF46
	.2byte	0x405
	.byte	0x15
	.4byte	0x9c
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF47
	.2byte	0x406
	.byte	0x15
	.4byte	0x9c
	.byte	0xc
	.uleb128 0x4
	.ascii	"IDR\000"
	.2byte	0x407
	.byte	0x15
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x4
	.ascii	"ODR\000"
	.2byte	0x408
	.byte	0x15
	.4byte	0x9c
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF48
	.2byte	0x409
	.byte	0x15
	.4byte	0x9c
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF49
	.2byte	0x40a
	.byte	0x15
	.4byte	0x9c
	.byte	0x1c
	.uleb128 0x4
	.ascii	"AFR\000"
	.2byte	0x40b
	.byte	0x15
	.4byte	0xe6
	.byte	0x20
	.byte	0
	.uleb128 0xb
	.4byte	.LASF50
	.2byte	0x40c
	.byte	0x3
	.4byte	0x364
	.uleb128 0x13
	.2byte	0x348
	.2byte	0x41d
	.4byte	0x588
	.uleb128 0x1
	.4byte	.LASF19
	.2byte	0x41f
	.byte	0xb
	.4byte	0x90
	.byte	0
	.uleb128 0x1
	.4byte	.LASF51
	.2byte	0x420
	.byte	0x14
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF52
	.2byte	0x421
	.byte	0x14
	.4byte	0xd1
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF53
	.2byte	0x422
	.byte	0x14
	.4byte	0x9c
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF26
	.2byte	0x423
	.byte	0xb
	.4byte	0x90
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF54
	.2byte	0x424
	.byte	0x14
	.4byte	0x9c
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF55
	.2byte	0x425
	.byte	0x14
	.4byte	0x9c
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF56
	.2byte	0x426
	.byte	0x14
	.4byte	0x9c
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF57
	.2byte	0x427
	.byte	0x14
	.4byte	0x9c
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF33
	.2byte	0x428
	.byte	0xc
	.4byte	0x588
	.byte	0x30
	.uleb128 0x2
	.4byte	.LASF58
	.2byte	0x429
	.byte	0x15
	.4byte	0x9c
	.2byte	0x124
	.uleb128 0x2
	.4byte	.LASF36
	.2byte	0x42a
	.byte	0xc
	.4byte	0x598
	.2byte	0x128
	.uleb128 0x5
	.ascii	"UR0\000"
	.2byte	0x42b
	.4byte	0x9c
	.2byte	0x300
	.uleb128 0x5
	.ascii	"UR1\000"
	.2byte	0x42c
	.4byte	0x9c
	.2byte	0x304
	.uleb128 0x5
	.ascii	"UR2\000"
	.2byte	0x42d
	.4byte	0x9c
	.2byte	0x308
	.uleb128 0x5
	.ascii	"UR3\000"
	.2byte	0x42e
	.4byte	0x9c
	.2byte	0x30c
	.uleb128 0x5
	.ascii	"UR4\000"
	.2byte	0x42f
	.4byte	0x9c
	.2byte	0x310
	.uleb128 0x5
	.ascii	"UR5\000"
	.2byte	0x430
	.4byte	0x9c
	.2byte	0x314
	.uleb128 0x5
	.ascii	"UR6\000"
	.2byte	0x431
	.4byte	0x9c
	.2byte	0x318
	.uleb128 0x5
	.ascii	"UR7\000"
	.2byte	0x432
	.4byte	0x9c
	.2byte	0x31c
	.uleb128 0x5
	.ascii	"UR8\000"
	.2byte	0x433
	.4byte	0x9c
	.2byte	0x320
	.uleb128 0x5
	.ascii	"UR9\000"
	.2byte	0x434
	.4byte	0x9c
	.2byte	0x324
	.uleb128 0x2
	.4byte	.LASF59
	.2byte	0x435
	.byte	0x14
	.4byte	0x9c
	.2byte	0x328
	.uleb128 0x2
	.4byte	.LASF60
	.2byte	0x436
	.byte	0x14
	.4byte	0x9c
	.2byte	0x32c
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x437
	.byte	0x14
	.4byte	0x9c
	.2byte	0x330
	.uleb128 0x2
	.4byte	.LASF62
	.2byte	0x438
	.byte	0x14
	.4byte	0x9c
	.2byte	0x334
	.uleb128 0x2
	.4byte	.LASF63
	.2byte	0x439
	.byte	0x14
	.4byte	0x9c
	.2byte	0x338
	.uleb128 0x2
	.4byte	.LASF64
	.2byte	0x43a
	.byte	0x14
	.4byte	0x9c
	.2byte	0x33c
	.uleb128 0x2
	.4byte	.LASF65
	.2byte	0x43b
	.byte	0x14
	.4byte	0x9c
	.2byte	0x340
	.uleb128 0x2
	.4byte	.LASF66
	.2byte	0x43c
	.byte	0x14
	.4byte	0x9c
	.2byte	0x344
	.byte	0
	.uleb128 0x6
	.4byte	0x90
	.4byte	0x598
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x3c
	.byte	0
	.uleb128 0x6
	.4byte	0x90
	.4byte	0x5a8
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x75
	.byte	0
	.uleb128 0xb
	.4byte	.LASF67
	.2byte	0x43e
	.byte	0x3
	.4byte	0x3ee
	.uleb128 0x13
	.2byte	0x130
	.2byte	0x4cd
	.4byte	0x913
	.uleb128 0x4
	.ascii	"CR\000"
	.2byte	0x4cf
	.byte	0x14
	.4byte	0x9c
	.byte	0
	.uleb128 0x1
	.4byte	.LASF68
	.2byte	0x4d0
	.byte	0x14
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF69
	.2byte	0x4d1
	.byte	0x14
	.4byte	0x9c
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF70
	.2byte	0x4d2
	.byte	0x14
	.4byte	0x9c
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF53
	.2byte	0x4d3
	.byte	0x14
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF19
	.2byte	0x4d4
	.byte	0xb
	.4byte	0x90
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF71
	.2byte	0x4d5
	.byte	0x14
	.4byte	0x9c
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF72
	.2byte	0x4d6
	.byte	0x14
	.4byte	0x9c
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF73
	.2byte	0x4d7
	.byte	0x14
	.4byte	0x9c
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF26
	.2byte	0x4d8
	.byte	0xb
	.4byte	0x90
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF74
	.2byte	0x4d9
	.byte	0x14
	.4byte	0x9c
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF75
	.2byte	0x4da
	.byte	0x14
	.4byte	0x9c
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF76
	.2byte	0x4db
	.byte	0x14
	.4byte	0x9c
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0x4dc
	.byte	0x14
	.4byte	0x9c
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x4dd
	.byte	0x14
	.4byte	0x9c
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF79
	.2byte	0x4de
	.byte	0x14
	.4byte	0x9c
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF80
	.2byte	0x4df
	.byte	0x14
	.4byte	0x9c
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF81
	.2byte	0x4e0
	.byte	0x14
	.4byte	0x9c
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF33
	.2byte	0x4e1
	.byte	0xb
	.4byte	0x90
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF82
	.2byte	0x4e2
	.byte	0x14
	.4byte	0x9c
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF83
	.2byte	0x4e3
	.byte	0x14
	.4byte	0x9c
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF84
	.2byte	0x4e4
	.byte	0x14
	.4byte	0x9c
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF85
	.2byte	0x4e5
	.byte	0x14
	.4byte	0x9c
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF36
	.2byte	0x4e6
	.byte	0xb
	.4byte	0x90
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF86
	.2byte	0x4e7
	.byte	0x14
	.4byte	0x9c
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF87
	.2byte	0x4e8
	.byte	0x14
	.4byte	0x9c
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF88
	.2byte	0x4e9
	.byte	0x14
	.4byte	0x9c
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF39
	.2byte	0x4ea
	.byte	0xb
	.4byte	0x90
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF89
	.2byte	0x4eb
	.byte	0x14
	.4byte	0x9c
	.byte	0x70
	.uleb128 0x4
	.ascii	"CSR\000"
	.2byte	0x4ec
	.byte	0x14
	.4byte	0x9c
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF90
	.2byte	0x4ed
	.byte	0xb
	.4byte	0x90
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF91
	.2byte	0x4ee
	.byte	0x14
	.4byte	0x9c
	.byte	0x7c
	.uleb128 0x1
	.4byte	.LASF92
	.2byte	0x4ef
	.byte	0x14
	.4byte	0x9c
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF93
	.2byte	0x4f0
	.byte	0x14
	.4byte	0x9c
	.byte	0x84
	.uleb128 0x1
	.4byte	.LASF94
	.2byte	0x4f1
	.byte	0x14
	.4byte	0x9c
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF95
	.2byte	0x4f2
	.byte	0x14
	.4byte	0x9c
	.byte	0x8c
	.uleb128 0x1
	.4byte	.LASF96
	.2byte	0x4f3
	.byte	0x14
	.4byte	0x9c
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF97
	.2byte	0x4f4
	.byte	0x14
	.4byte	0x9c
	.byte	0x94
	.uleb128 0x1
	.4byte	.LASF98
	.2byte	0x4f5
	.byte	0x14
	.4byte	0x9c
	.byte	0x98
	.uleb128 0x1
	.4byte	.LASF99
	.2byte	0x4f6
	.byte	0x14
	.4byte	0x9c
	.byte	0x9c
	.uleb128 0x4
	.ascii	"GCR\000"
	.2byte	0x4f7
	.byte	0x14
	.4byte	0x9c
	.byte	0xa0
	.uleb128 0x1
	.4byte	.LASF100
	.2byte	0x4f8
	.byte	0xb
	.4byte	0x90
	.byte	0xa4
	.uleb128 0x1
	.4byte	.LASF101
	.2byte	0x4f9
	.byte	0x14
	.4byte	0x9c
	.byte	0xa8
	.uleb128 0x1
	.4byte	.LASF102
	.2byte	0x4fa
	.byte	0xb
	.4byte	0xfb
	.byte	0xac
	.uleb128 0x4
	.ascii	"RSR\000"
	.2byte	0x4fb
	.byte	0x14
	.4byte	0x9c
	.byte	0xd0
	.uleb128 0x1
	.4byte	.LASF103
	.2byte	0x4fc
	.byte	0x14
	.4byte	0x9c
	.byte	0xd4
	.uleb128 0x1
	.4byte	.LASF104
	.2byte	0x4fd
	.byte	0x14
	.4byte	0x9c
	.byte	0xd8
	.uleb128 0x1
	.4byte	.LASF105
	.2byte	0x4fe
	.byte	0x14
	.4byte	0x9c
	.byte	0xdc
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x4ff
	.byte	0x14
	.4byte	0x9c
	.byte	0xe0
	.uleb128 0x1
	.4byte	.LASF107
	.2byte	0x500
	.byte	0x14
	.4byte	0x9c
	.byte	0xe4
	.uleb128 0x1
	.4byte	.LASF108
	.2byte	0x501
	.byte	0x14
	.4byte	0x9c
	.byte	0xe8
	.uleb128 0x1
	.4byte	.LASF109
	.2byte	0x502
	.byte	0x14
	.4byte	0x9c
	.byte	0xec
	.uleb128 0x1
	.4byte	.LASF110
	.2byte	0x503
	.byte	0x14
	.4byte	0x9c
	.byte	0xf0
	.uleb128 0x1
	.4byte	.LASF111
	.2byte	0x504
	.byte	0x14
	.4byte	0x9c
	.byte	0xf4
	.uleb128 0x1
	.4byte	.LASF112
	.2byte	0x505
	.byte	0xb
	.4byte	0x90
	.byte	0xf8
	.uleb128 0x1
	.4byte	.LASF113
	.2byte	0x506
	.byte	0x14
	.4byte	0x9c
	.byte	0xfc
	.uleb128 0x2
	.4byte	.LASF114
	.2byte	0x507
	.byte	0x14
	.4byte	0x9c
	.2byte	0x100
	.uleb128 0x2
	.4byte	.LASF115
	.2byte	0x508
	.byte	0x14
	.4byte	0x9c
	.2byte	0x104
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x509
	.byte	0x14
	.4byte	0x9c
	.2byte	0x108
	.uleb128 0x2
	.4byte	.LASF117
	.2byte	0x50a
	.byte	0x14
	.4byte	0x9c
	.2byte	0x10c
	.uleb128 0x2
	.4byte	.LASF118
	.2byte	0x50b
	.byte	0x14
	.4byte	0x9c
	.2byte	0x110
	.uleb128 0x2
	.4byte	.LASF119
	.2byte	0x50c
	.byte	0x14
	.4byte	0x9c
	.2byte	0x114
	.uleb128 0x2
	.4byte	.LASF120
	.2byte	0x50d
	.byte	0x14
	.4byte	0x9c
	.2byte	0x118
	.uleb128 0x2
	.4byte	.LASF121
	.2byte	0x50e
	.byte	0x14
	.4byte	0x9c
	.2byte	0x11c
	.uleb128 0x2
	.4byte	.LASF122
	.2byte	0x50f
	.byte	0xb
	.4byte	0xb1
	.2byte	0x120
	.byte	0
	.uleb128 0xb
	.4byte	.LASF123
	.2byte	0x511
	.byte	0x3
	.4byte	0x5b4
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF124
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF125
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF126
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF127
	.uleb128 0x14
	.4byte	0x34
	.byte	0x5
	.byte	0x28
	.4byte	0x95f
	.uleb128 0xa
	.4byte	.LASF128
	.byte	0
	.uleb128 0xa
	.4byte	.LASF129
	.byte	0x1
	.uleb128 0xa
	.4byte	.LASF130
	.byte	0x2
	.uleb128 0xa
	.4byte	.LASF131
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.4byte	.LASF132
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0x93b
	.uleb128 0x1b
	.byte	0x14
	.byte	0x6
	.byte	0x2e
	.byte	0x9
	.4byte	0x9ae
	.uleb128 0x1c
	.ascii	"Pin\000"
	.byte	0x6
	.byte	0x30
	.byte	0xc
	.4byte	0x90
	.byte	0
	.uleb128 0xe
	.4byte	.LASF133
	.byte	0x33
	.4byte	0x90
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF134
	.byte	0x36
	.4byte	0x90
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF135
	.byte	0x39
	.4byte	0x90
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF136
	.byte	0x3c
	.4byte	0x90
	.byte	0x10
	.byte	0
	.uleb128 0x9
	.4byte	.LASF137
	.byte	0x6
	.byte	0x3e
	.byte	0x3
	.4byte	0x96b
	.uleb128 0x14
	.4byte	0x34
	.byte	0x6
	.byte	0x44
	.4byte	0x9d2
	.uleb128 0xa
	.4byte	.LASF138
	.byte	0
	.uleb128 0xa
	.4byte	.LASF139
	.byte	0x1
	.byte	0
	.uleb128 0x9
	.4byte	.LASF140
	.byte	0x6
	.byte	0x47
	.byte	0x3
	.4byte	0x9ba
	.uleb128 0xc
	.4byte	.LASF141
	.2byte	0x210
	.byte	0x1c
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa03
	.uleb128 0x8
	.4byte	.LASF143
	.2byte	0x210
	.byte	0x3c
	.4byte	0x84
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF142
	.2byte	0x1f9
	.byte	0x6
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa33
	.uleb128 0xd
	.4byte	.LASF143
	.2byte	0x1f9
	.byte	0x28
	.4byte	0x84
	.4byte	.LLST10
	.uleb128 0x1d
	.4byte	.LVL78
	.4byte	0x9de
	.byte	0
	.uleb128 0x15
	.4byte	.LASF148
	.2byte	0x1d6
	.byte	0x13
	.4byte	0x95f
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa7b
	.uleb128 0xd
	.4byte	.LASF144
	.2byte	0x1d6
	.byte	0x32
	.4byte	0xa7b
	.4byte	.LLST9
	.uleb128 0x8
	.4byte	.LASF143
	.2byte	0x1d6
	.byte	0x42
	.4byte	0x84
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x16
	.ascii	"tmp\000"
	.2byte	0x1d8
	.byte	0x15
	.4byte	0x9c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x11
	.4byte	0x3e2
	.uleb128 0xc
	.4byte	.LASF145
	.2byte	0x1bd
	.byte	0x6
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xac3
	.uleb128 0x8
	.4byte	.LASF144
	.2byte	0x1bd
	.byte	0x27
	.4byte	0xa7b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xd
	.4byte	.LASF143
	.2byte	0x1bd
	.byte	0x37
	.4byte	0x84
	.4byte	.LLST8
	.uleb128 0x16
	.ascii	"odr\000"
	.2byte	0x1bf
	.byte	0xc
	.4byte	0x90
	.uleb128 0x1
	.byte	0x53
	.byte	0
	.uleb128 0xc
	.4byte	.LASF146
	.2byte	0x1a7
	.byte	0x6
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb06
	.uleb128 0x8
	.4byte	.LASF144
	.2byte	0x1a7
	.byte	0x26
	.4byte	0xa7b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xd
	.4byte	.LASF143
	.2byte	0x1a7
	.byte	0x36
	.4byte	0x84
	.4byte	.LLST7
	.uleb128 0x8
	.4byte	.LASF147
	.2byte	0x1a7
	.byte	0x4e
	.4byte	0x9d2
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x15
	.4byte	.LASF149
	.2byte	0x185
	.byte	0xf
	.4byte	0x9d2
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb4e
	.uleb128 0xd
	.4byte	.LASF144
	.2byte	0x185
	.byte	0x2e
	.4byte	0xa7b
	.4byte	.LLST6
	.uleb128 0x8
	.4byte	.LASF143
	.2byte	0x185
	.byte	0x3e
	.4byte	0x84
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1e
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x187
	.byte	0x11
	.4byte	0x9d2
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF151
	.2byte	0x12e
	.byte	0x6
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbc1
	.uleb128 0x8
	.4byte	.LASF144
	.2byte	0x12e
	.byte	0x24
	.4byte	0xa7b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x8
	.4byte	.LASF143
	.2byte	0x12e
	.byte	0x34
	.4byte	0x90
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x17
	.4byte	.LASF152
	.2byte	0x130
	.4byte	0x90
	.4byte	.LLST3
	.uleb128 0x17
	.4byte	.LASF153
	.2byte	0x131
	.4byte	0x90
	.4byte	.LLST4
	.uleb128 0x1f
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x132
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST5
	.uleb128 0x20
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x133
	.byte	0x16
	.4byte	0xbc1
	.4byte	0x58000080
	.byte	0
	.uleb128 0x11
	.4byte	0x358
	.uleb128 0x21
	.4byte	.LASF155
	.byte	0x1
	.byte	0xa5
	.byte	0x6
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc4a
	.uleb128 0x18
	.4byte	.LASF144
	.byte	0xa5
	.byte	0x22
	.4byte	0xa7b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF156
	.byte	0xa5
	.byte	0x3b
	.4byte	0xc4a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x12
	.4byte	.LASF152
	.byte	0xa7
	.4byte	0x90
	.4byte	.LLST0
	.uleb128 0x12
	.4byte	.LASF153
	.byte	0xa8
	.4byte	0x90
	.4byte	.LLST1
	.uleb128 0x12
	.4byte	.LASF157
	.byte	0xa9
	.4byte	0x90
	.4byte	.LLST2
	.uleb128 0x22
	.4byte	.LASF154
	.byte	0x1
	.byte	0xaa
	.byte	0x16
	.4byte	0xbc1
	.4byte	0x58000080
	.uleb128 0x23
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x24
	.4byte	.LASF158
	.byte	0x1
	.byte	0xf8
	.byte	0x20
	.4byte	0x9c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	0x9ae
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
	.uleb128 0x5
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
	.sleb128 20
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x21
	.sleb128 12
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
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x1d
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x18
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
.LLST10:
	.byte	0x6
	.4byte	.LVL75
	.byte	0x4
	.uleb128 .LVL75-.LVL75
	.uleb128 .LVL76-.LVL75
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL76-.LVL75
	.uleb128 .LVL77-.LVL75
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL77-.LVL75
	.uleb128 .LVL78-1-.LVL75
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL78-1-.LVL75
	.uleb128 .LFE341-.LVL75
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL70
	.byte	0x4
	.uleb128 .LVL70-.LVL70
	.uleb128 .LVL71-.LVL70
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL71-.LVL70
	.uleb128 .LVL72-.LVL70
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL72-.LVL70
	.uleb128 .LVL73-.LVL70
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL73-.LVL70
	.uleb128 .LFE340-.LVL70
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL67
	.byte	0x4
	.uleb128 .LVL67-.LVL67
	.uleb128 .LVL69-.LVL67
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL69-.LVL67
	.uleb128 .LFE339-.LVL67
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL65
	.byte	0x4
	.uleb128 .LVL65-.LVL65
	.uleb128 .LVL66-.LVL65
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL66-.LVL65
	.uleb128 .LFE338-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL61
	.byte	0x4
	.uleb128 .LVL61-.LVL61
	.uleb128 .LVL62-.LVL61
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL62-.LVL61
	.uleb128 .LVL63-.LVL61
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL63-.LVL61
	.uleb128 .LVL64-.LVL61
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL64-.LVL61
	.uleb128 .LFE337-.LVL61
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL45
	.byte	0x4
	.uleb128 .LVL45-.LVL45
	.uleb128 .LVL46-.LVL45
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL46-.LVL45
	.uleb128 .LFE336-.LVL45
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL47
	.byte	0x4
	.uleb128 .LVL47-.LVL47
	.uleb128 .LVL49-.LVL47
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL49-.LVL47
	.uleb128 .LVL50-.LVL47
	.uleb128 0x6
	.byte	0x72
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL50-.LVL47
	.uleb128 .LVL51-.LVL47
	.uleb128 0x8
	.byte	0x31
	.byte	0x73
	.sleb128 0
	.byte	0x24
	.byte	0x71
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL51-.LVL47
	.uleb128 .LVL52-.LVL47
	.uleb128 0x8
	.byte	0x31
	.byte	0x73
	.sleb128 -1
	.byte	0x24
	.byte	0x71
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL53-.LVL47
	.uleb128 .LVL54-.LVL47
	.uleb128 0x6
	.byte	0x72
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL54-.LVL47
	.uleb128 .LVL59-.LVL47
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL59-.LVL47
	.uleb128 .LVL60-.LVL47
	.uleb128 0x8
	.byte	0x31
	.byte	0x73
	.sleb128 -1
	.byte	0x24
	.byte	0x71
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL47
	.byte	0x4
	.uleb128 .LVL47-.LVL47
	.uleb128 .LVL48-.LVL47
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL55-.LVL47
	.uleb128 .LVL57-.LVL47
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL58-.LVL47
	.uleb128 .LVL59-.LVL47
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LLST0:
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
	.uleb128 .LFE335-.LVL1
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL2
	.byte	0x4
	.uleb128 .LVL2-.LVL2
	.uleb128 .LVL28-.LVL2
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL31-.LVL2
	.uleb128 .LVL32-.LVL2
	.uleb128 0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL32-.LVL2
	.uleb128 .LVL44-.LVL2
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL3
	.byte	0x4
	.uleb128 .LVL3-.LVL3
	.uleb128 .LVL5-.LVL3
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL5-.LVL3
	.uleb128 .LVL6-.LVL3
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL6-.LVL3
	.uleb128 .LVL8-.LVL3
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL8-.LVL3
	.uleb128 .LVL9-.LVL3
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL10-.LVL3
	.uleb128 .LVL11-.LVL3
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL11-.LVL3
	.uleb128 .LVL12-.LVL3
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL12-.LVL3
	.uleb128 .LVL13-.LVL3
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL13-.LVL3
	.uleb128 .LVL14-.LVL3
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL14-.LVL3
	.uleb128 .LVL15-.LVL3
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL15-.LVL3
	.uleb128 .LVL16-.LVL3
	.uleb128 0x7
	.byte	0x7c
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x4
	.uleb128 .LVL16-.LVL3
	.uleb128 .LVL17-.LVL3
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL17-.LVL3
	.uleb128 .LVL19-.LVL3
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL19-.LVL3
	.uleb128 .LVL20-.LVL3
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL20-.LVL3
	.uleb128 .LVL22-.LVL3
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL22-.LVL3
	.uleb128 .LVL23-.LVL3
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL23-.LVL3
	.uleb128 .LVL25-.LVL3
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL25-.LVL3
	.uleb128 .LVL26-.LVL3
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL26-.LVL3
	.uleb128 .LVL29-.LVL3
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL33-.LVL3
	.uleb128 .LVL34-.LVL3
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL34-.LVL3
	.uleb128 .LVL35-.LVL3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL35-.LVL3
	.uleb128 .LVL36-.LVL3
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL37-.LVL3
	.uleb128 .LVL38-.LVL3
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL38-.LVL3
	.uleb128 .LVL39-.LVL3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL39-.LVL3
	.uleb128 .LVL40-.LVL3
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL40-.LVL3
	.uleb128 .LVL41-.LVL3
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL42-.LVL3
	.uleb128 .LVL44-.LVL3
	.uleb128 0x1
	.byte	0x55
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x54
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
.LLRL11:
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
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF30:
	.ascii	"D3PMR3\000"
.LASF31:
	.ascii	"D3PCR3L\000"
.LASF47:
	.ascii	"PUPDR\000"
.LASF76:
	.ascii	"PLL1DIVR\000"
.LASF49:
	.ascii	"LCKR\000"
.LASF94:
	.ascii	"AHB4RSTR\000"
.LASF35:
	.ascii	"EMR1\000"
.LASF38:
	.ascii	"EMR2\000"
.LASF41:
	.ascii	"EMR3\000"
.LASF45:
	.ascii	"OTYPER\000"
.LASF130:
	.ascii	"HAL_BUSY\000"
.LASF14:
	.ascii	"FTSR1\000"
.LASF119:
	.ascii	"APB1HLPENR\000"
.LASF148:
	.ascii	"HAL_GPIO_LockPin\000"
.LASF44:
	.ascii	"MODER\000"
.LASF115:
	.ascii	"AHB2LPENR\000"
.LASF138:
	.ascii	"GPIO_PIN_RESET\000"
.LASF101:
	.ascii	"D3AMR\000"
.LASF16:
	.ascii	"D3PMR1\000"
.LASF156:
	.ascii	"GPIO_Init\000"
.LASF140:
	.ascii	"GPIO_PinState\000"
.LASF15:
	.ascii	"SWIER1\000"
.LASF22:
	.ascii	"SWIER2\000"
.LASF29:
	.ascii	"SWIER3\000"
.LASF77:
	.ascii	"PLL1FRACR\000"
.LASF114:
	.ascii	"AHB1LPENR\000"
.LASF146:
	.ascii	"HAL_GPIO_WritePin\000"
.LASF86:
	.ascii	"CIER\000"
.LASF136:
	.ascii	"Alternate\000"
.LASF8:
	.ascii	"long long int\000"
.LASF142:
	.ascii	"HAL_GPIO_EXTI_IRQHandler\000"
.LASF48:
	.ascii	"BSRR\000"
.LASF92:
	.ascii	"AHB1RSTR\000"
.LASF99:
	.ascii	"APB4RSTR\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF102:
	.ascii	"RESERVED11\000"
.LASF112:
	.ascii	"RESERVED12\000"
.LASF122:
	.ascii	"RESERVED13\000"
.LASF158:
	.ascii	"tmpreg\000"
.LASF4:
	.ascii	"long int\000"
.LASF98:
	.ascii	"APB2RSTR\000"
.LASF11:
	.ascii	"uint16_t\000"
.LASF127:
	.ascii	"double\000"
.LASF154:
	.ascii	"EXTI_CurrentCPU\000"
.LASF73:
	.ascii	"D3CFGR\000"
.LASF75:
	.ascii	"PLLCFGR\000"
.LASF69:
	.ascii	"CRRCR\000"
.LASF87:
	.ascii	"CIFR\000"
.LASF80:
	.ascii	"PLL3DIVR\000"
.LASF46:
	.ascii	"OSPEEDR\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF21:
	.ascii	"FTSR2\000"
.LASF83:
	.ascii	"D2CCIP1R\000"
.LASF28:
	.ascii	"FTSR3\000"
.LASF85:
	.ascii	"D3CCIPR\000"
.LASF57:
	.ascii	"PWRCR\000"
.LASF150:
	.ascii	"bitstatus\000"
.LASF143:
	.ascii	"GPIO_Pin\000"
.LASF157:
	.ascii	"temp\000"
.LASF131:
	.ascii	"HAL_TIMEOUT\000"
.LASF79:
	.ascii	"PLL2FRACR\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF152:
	.ascii	"position\000"
.LASF120:
	.ascii	"APB2LPENR\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF50:
	.ascii	"GPIO_TypeDef\000"
.LASF123:
	.ascii	"RCC_TypeDef\000"
.LASF128:
	.ascii	"HAL_OK\000"
.LASF17:
	.ascii	"D3PCR1L\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF74:
	.ascii	"PLLCKSELR\000"
.LASF34:
	.ascii	"IMR1\000"
.LASF37:
	.ascii	"IMR2\000"
.LASF40:
	.ascii	"IMR3\000"
.LASF68:
	.ascii	"HSICFGR\000"
.LASF91:
	.ascii	"AHB3RSTR\000"
.LASF109:
	.ascii	"APB1HENR\000"
.LASF84:
	.ascii	"D2CCIP2R\000"
.LASF13:
	.ascii	"RTSR1\000"
.LASF20:
	.ascii	"RTSR2\000"
.LASF132:
	.ascii	"HAL_StatusTypeDef\000"
.LASF27:
	.ascii	"RTSR3\000"
.LASF81:
	.ascii	"PLL3FRACR\000"
.LASF55:
	.ascii	"CCVR\000"
.LASF70:
	.ascii	"CSICFGR\000"
.LASF141:
	.ascii	"HAL_GPIO_EXTI_Callback\000"
.LASF118:
	.ascii	"APB1LLPENR\000"
.LASF111:
	.ascii	"APB4ENR\000"
.LASF135:
	.ascii	"Speed\000"
.LASF159:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF97:
	.ascii	"APB1HRSTR\000"
.LASF155:
	.ascii	"HAL_GPIO_Init\000"
.LASF117:
	.ascii	"APB3LPENR\000"
.LASF139:
	.ascii	"GPIO_PIN_SET\000"
.LASF126:
	.ascii	"float\000"
.LASF107:
	.ascii	"APB3ENR\000"
.LASF43:
	.ascii	"EXTI_Core_TypeDef\000"
.LASF67:
	.ascii	"SYSCFG_TypeDef\000"
.LASF106:
	.ascii	"AHB4ENR\000"
.LASF58:
	.ascii	"PKGR\000"
.LASF19:
	.ascii	"RESERVED1\000"
.LASF26:
	.ascii	"RESERVED2\000"
.LASF33:
	.ascii	"RESERVED3\000"
.LASF72:
	.ascii	"D2CFGR\000"
.LASF39:
	.ascii	"RESERVED5\000"
.LASF90:
	.ascii	"RESERVED6\000"
.LASF100:
	.ascii	"RESERVED8\000"
.LASF78:
	.ascii	"PLL2DIVR\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"short int\000"
.LASF113:
	.ascii	"AHB3LPENR\000"
.LASF121:
	.ascii	"APB4LPENR\000"
.LASF144:
	.ascii	"GPIOx\000"
.LASF110:
	.ascii	"APB2ENR\000"
.LASF103:
	.ascii	"AHB3ENR\000"
.LASF160:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_gpio.c\000"
.LASF51:
	.ascii	"PMCR\000"
.LASF54:
	.ascii	"CCCSR\000"
.LASF36:
	.ascii	"RESERVED4\000"
.LASF95:
	.ascii	"APB3RSTR\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF137:
	.ascii	"GPIO_InitTypeDef\000"
.LASF18:
	.ascii	"D3PCR1H\000"
.LASF129:
	.ascii	"HAL_ERROR\000"
.LASF82:
	.ascii	"D1CCIPR\000"
.LASF124:
	.ascii	"long double\000"
.LASF147:
	.ascii	"PinState\000"
.LASF125:
	.ascii	"char\000"
.LASF133:
	.ascii	"Mode\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF93:
	.ascii	"AHB2RSTR\000"
.LASF116:
	.ascii	"AHB4LPENR\000"
.LASF96:
	.ascii	"APB1LRSTR\000"
.LASF105:
	.ascii	"AHB2ENR\000"
.LASF59:
	.ascii	"UR10\000"
.LASF60:
	.ascii	"UR11\000"
.LASF61:
	.ascii	"UR12\000"
.LASF62:
	.ascii	"UR13\000"
.LASF63:
	.ascii	"UR14\000"
.LASF64:
	.ascii	"UR15\000"
.LASF65:
	.ascii	"UR16\000"
.LASF66:
	.ascii	"UR17\000"
.LASF1:
	.ascii	"signed char\000"
.LASF25:
	.ascii	"D3PCR2H\000"
.LASF88:
	.ascii	"CICR\000"
.LASF24:
	.ascii	"D3PCR2L\000"
.LASF89:
	.ascii	"BDCR\000"
.LASF32:
	.ascii	"D3PCR3H\000"
.LASF161:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF104:
	.ascii	"AHB1ENR\000"
.LASF23:
	.ascii	"D3PMR2\000"
.LASF134:
	.ascii	"Pull\000"
.LASF53:
	.ascii	"CFGR\000"
.LASF145:
	.ascii	"HAL_GPIO_TogglePin\000"
.LASF56:
	.ascii	"CCCR\000"
.LASF42:
	.ascii	"EXTI_TypeDef\000"
.LASF149:
	.ascii	"HAL_GPIO_ReadPin\000"
.LASF108:
	.ascii	"APB1LENR\000"
.LASF71:
	.ascii	"D1CFGR\000"
.LASF153:
	.ascii	"iocurrent\000"
.LASF52:
	.ascii	"EXTICR\000"
.LASF151:
	.ascii	"HAL_GPIO_DeInit\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
