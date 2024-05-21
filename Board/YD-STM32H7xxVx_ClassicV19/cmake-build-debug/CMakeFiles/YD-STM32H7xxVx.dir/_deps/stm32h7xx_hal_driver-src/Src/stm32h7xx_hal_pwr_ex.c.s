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
	.file	"stm32h7xx_hal_pwr_ex.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_pwr_ex.c"
	.section	.text.HAL_PWREx_ConfigSupply,"ax",%progbits
	.align	1
	.global	HAL_PWREx_ConfigSupply
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_ConfigSupply, %function
HAL_PWREx_ConfigSupply:
.LFB335:
	.loc 1 314 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	.loc 1 315 3
	.loc 1 318 3
	.loc 1 322 3
	.loc 1 322 651 is_stmt 0
	ldr	r3, .L12
	ldr	r3, [r3, #12]
	.loc 1 322 6
	tst	r3, #4
	bne	.L2
	.loc 1 328 5 is_stmt 1
	.loc 1 328 72 is_stmt 0
	ldr	r3, .L12
	ldr	r3, [r3, #12]
	.loc 1 328 78
	and	r3, r3, #7
	.loc 1 328 8
	cmp	r3, r0
	beq	.L6
	.loc 1 331 14
	movs	r0, #1
.LVL1:
	bx	lr
.LVL2:
.L2:
	.loc 1 314 1
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 343 3 is_stmt 1
	.loc 1 343 146 is_stmt 0
	ldr	r2, .L12
	ldr	r3, [r2, #12]
	.loc 1 343 155
	bic	r3, r3, #7
	.loc 1 343 217
	orrs	r3, r3, r0
	.loc 1 343 76
	str	r3, [r2, #12]
	.loc 1 346 3 is_stmt 1
	.loc 1 346 15 is_stmt 0
	bl	HAL_GetTick
.LVL3:
	mov	r4, r0
.LVL4:
	.loc 1 349 3 is_stmt 1
.L4:
	.loc 1 349 2055
	.loc 1 349 376 is_stmt 0
	ldr	r3, .L12
	ldr	r3, [r3, #4]
	.loc 1 349 2055
	tst	r3, #8192
	bne	.L11
	.loc 1 351 5 is_stmt 1
	.loc 1 351 10 is_stmt 0
	bl	HAL_GetTick
.LVL5:
	.loc 1 351 25
	subs	r0, r0, r4
	.loc 1 351 8
	cmp	r0, #1000
	bls	.L4
	.loc 1 353 14
	movs	r0, #1
	b	.L3
.L11:
	.loc 1 378 10
	movs	r0, #0
.L3:
	.loc 1 379 1
	pop	{r4, pc}
.LVL6:
.L6:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 338 14
	movs	r0, #0
.LVL7:
	.loc 1 379 1
	bx	lr
.L13:
	.align	2
.L12:
	.word	1476544512
	.cfi_endproc
.LFE335:
	.size	HAL_PWREx_ConfigSupply, .-HAL_PWREx_ConfigSupply
	.section	.text.HAL_PWREx_GetSupplyConfig,"ax",%progbits
	.align	1
	.global	HAL_PWREx_GetSupplyConfig
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_GetSupplyConfig, %function
HAL_PWREx_GetSupplyConfig:
.LFB336:
	.loc 1 386 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 387 3
	.loc 1 387 73 is_stmt 0
	ldr	r3, .L15
	ldr	r0, [r3, #12]
	.loc 1 388 1
	and	r0, r0, #7
	bx	lr
.L16:
	.align	2
.L15:
	.word	1476544512
	.cfi_endproc
.LFE336:
	.size	HAL_PWREx_GetSupplyConfig, .-HAL_PWREx_GetSupplyConfig
	.section	.text.HAL_PWREx_ControlVoltageScaling,"ax",%progbits
	.align	1
	.global	HAL_PWREx_ControlVoltageScaling
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_ControlVoltageScaling, %function
HAL_PWREx_ControlVoltageScaling:
.LFB337:
	.loc 1 414 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL8:
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	.loc 1 415 3
	.loc 1 418 3
	.loc 1 421 3
	.loc 1 421 70 is_stmt 0
	ldr	r3, .L38
	ldr	r3, [r3, #4]
	.loc 1 421 77
	and	r3, r3, #49152
	.loc 1 421 6
	cmp	r3, r0
	beq	.L28
	mov	r4, r0
	.loc 1 432 3 is_stmt 1
	.loc 1 432 6 is_stmt 0
	cbnz	r0, .L19
	.loc 1 434 5 is_stmt 1
	.loc 1 434 72 is_stmt 0
	ldr	r3, .L38
	ldr	r3, [r3, #12]
	.loc 1 434 8
	tst	r3, #2
	bne	.L34
	.loc 1 457 14
	movs	r0, #1
.LVL9:
	b	.L18
.LVL10:
.L34:
	.loc 1 437 7 is_stmt 1
	.loc 1 437 151 is_stmt 0
	ldr	r2, .L38
	ldr	r3, [r2, #24]
	.loc 1 437 186
	orr	r3, r3, #49152
	.loc 1 437 81
	str	r3, [r2, #24]
	.loc 1 440 7 is_stmt 1
	.loc 1 440 19 is_stmt 0
	bl	HAL_GetTick
.LVL11:
	mov	r4, r0
.LVL12:
	.loc 1 443 7 is_stmt 1
.L20:
	.loc 1 443 2059
	.loc 1 443 380 is_stmt 0
	ldr	r3, .L38
	ldr	r3, [r3, #4]
	.loc 1 443 2059
	tst	r3, #8192
	bne	.L35
	.loc 1 445 9 is_stmt 1
	.loc 1 445 14 is_stmt 0
	bl	HAL_GetTick
.LVL13:
	.loc 1 445 29
	subs	r0, r0, r4
	.loc 1 445 12
	cmp	r0, #1000
	bls	.L20
	.loc 1 447 18
	movs	r0, #1
	b	.L18
.L35:
	.loc 1 452 7 is_stmt 1
	.loc 1 452 74 is_stmt 0
	ldr	r2, .L38+4
	ldr	r3, [r2, #44]
	.loc 1 452 83
	orr	r3, r3, #1
	str	r3, [r2, #44]
	b	.L22
.LVL14:
.L19:
	.loc 1 462 5 is_stmt 1
	.loc 1 462 72 is_stmt 0
	ldr	r3, .L38
	ldr	r3, [r3, #4]
	.loc 1 462 79
	and	r3, r3, #49152
	.loc 1 462 8
	cmp	r3, #49152
	beq	.L36
.LVL15:
.L23:
	.loc 1 484 5 is_stmt 1
	.loc 1 484 149 is_stmt 0
	ldr	r2, .L38
	ldr	r3, [r2, #24]
	.loc 1 484 159
	bic	r3, r3, #49152
	.loc 1 484 184
	orrs	r3, r3, r4
	.loc 1 484 79
	str	r3, [r2, #24]
.LVL16:
.L22:
	.loc 1 493 3 is_stmt 1
	.loc 1 493 15 is_stmt 0
	bl	HAL_GetTick
.LVL17:
	mov	r4, r0
.LVL18:
	.loc 1 496 3 is_stmt 1
.L26:
	.loc 1 496 2055
	.loc 1 496 376 is_stmt 0
	ldr	r3, .L38
	ldr	r3, [r3, #4]
	.loc 1 496 2055
	tst	r3, #8192
	bne	.L37
	.loc 1 498 5 is_stmt 1
	.loc 1 498 10 is_stmt 0
	bl	HAL_GetTick
.LVL19:
	.loc 1 498 24
	subs	r0, r0, r4
	.loc 1 498 8
	cmp	r0, #1000
	bls	.L26
	.loc 1 500 14
	movs	r0, #1
	b	.L18
.LVL20:
.L36:
	.loc 1 464 7 is_stmt 1
	.loc 1 464 77 is_stmt 0
	ldr	r3, .L38+4
	ldr	r3, [r3, #44]
	.loc 1 464 10
	tst	r3, #1
	beq	.L23
	.loc 1 467 9 is_stmt 1
	.loc 1 467 76 is_stmt 0
	ldr	r2, .L38+4
	ldr	r3, [r2, #44]
	.loc 1 467 85
	bic	r3, r3, #1
	str	r3, [r2, #44]
	.loc 1 470 9 is_stmt 1
	.loc 1 470 21 is_stmt 0
	bl	HAL_GetTick
.LVL21:
	mov	r5, r0
.LVL22:
	.loc 1 473 9 is_stmt 1
.L24:
	.loc 1 473 2061
	.loc 1 473 382 is_stmt 0
	ldr	r3, .L38
	ldr	r3, [r3, #4]
	.loc 1 473 2061
	tst	r3, #8192
	bne	.L23
	.loc 1 475 11 is_stmt 1
	.loc 1 475 16 is_stmt 0
	bl	HAL_GetTick
.LVL23:
	.loc 1 475 31
	subs	r0, r0, r5
	.loc 1 475 14
	cmp	r0, #1000
	bls	.L24
	.loc 1 477 20
	movs	r0, #1
	b	.L18
.LVL24:
.L37:
	.loc 1 504 10
	movs	r0, #0
.LVL25:
.L18:
	.loc 1 505 1
	pop	{r3, r4, r5, pc}
.LVL26:
.L28:
	.loc 1 424 12
	movs	r0, #0
.LVL27:
	b	.L18
.L39:
	.align	2
.L38:
	.word	1476544512
	.word	1476396032
	.cfi_endproc
.LFE337:
	.size	HAL_PWREx_ControlVoltageScaling, .-HAL_PWREx_ControlVoltageScaling
	.section	.text.HAL_PWREx_GetVoltageRange,"ax",%progbits
	.align	1
	.global	HAL_PWREx_GetVoltageRange
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_GetVoltageRange, %function
HAL_PWREx_GetVoltageRange:
.LFB338:
	.loc 1 513 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 515 3
	.loc 1 515 73 is_stmt 0
	ldr	r3, .L41
	ldr	r0, [r3, #4]
	.loc 1 516 1
	and	r0, r0, #49152
	bx	lr
.L42:
	.align	2
.L41:
	.word	1476544512
	.cfi_endproc
.LFE338:
	.size	HAL_PWREx_GetVoltageRange, .-HAL_PWREx_GetVoltageRange
	.section	.text.HAL_PWREx_ControlStopModeVoltageScaling,"ax",%progbits
	.align	1
	.global	HAL_PWREx_ControlStopModeVoltageScaling
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_ControlStopModeVoltageScaling, %function
HAL_PWREx_ControlStopModeVoltageScaling:
.LFB339:
	.loc 1 539 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL28:
	.loc 1 541 3
	.loc 1 544 3
	.loc 1 544 146 is_stmt 0
	ldr	r2, .L44
	ldr	r3, [r2]
	.loc 1 544 155
	bic	r3, r3, #49152
	.loc 1 544 180
	orrs	r3, r3, r0
	.loc 1 544 76
	str	r3, [r2]
	.loc 1 546 3 is_stmt 1
	.loc 1 547 1 is_stmt 0
	movs	r0, #0
.LVL29:
	bx	lr
.L45:
	.align	2
.L44:
	.word	1476544512
	.cfi_endproc
.LFE339:
	.size	HAL_PWREx_ControlStopModeVoltageScaling, .-HAL_PWREx_ControlStopModeVoltageScaling
	.section	.text.HAL_PWREx_GetStopModeVoltageRange,"ax",%progbits
	.align	1
	.global	HAL_PWREx_GetStopModeVoltageRange
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_GetStopModeVoltageRange, %function
HAL_PWREx_GetStopModeVoltageRange:
.LFB340:
	.loc 1 554 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 556 3
	.loc 1 556 73 is_stmt 0
	ldr	r3, .L47
	ldr	r0, [r3]
	.loc 1 557 1
	and	r0, r0, #49152
	bx	lr
.L48:
	.align	2
.L47:
	.word	1476544512
	.cfi_endproc
.LFE340:
	.size	HAL_PWREx_GetStopModeVoltageRange, .-HAL_PWREx_GetStopModeVoltageRange
	.section	.text.HAL_PWREx_EnterSTOPMode,"ax",%progbits
	.align	1
	.global	HAL_PWREx_EnterSTOPMode
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_EnterSTOPMode, %function
HAL_PWREx_EnterSTOPMode:
.LFB341:
	.loc 1 817 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL30:
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 819 3
	.loc 1 820 3
	.loc 1 821 3
	.loc 1 824 3
	.loc 1 824 146 is_stmt 0
	ldr	r4, .L58
	ldr	r3, [r4]
	.loc 1 824 155
	bic	r3, r3, #1
	.loc 1 824 179
	orrs	r3, r3, r0
	.loc 1 824 76
	str	r3, [r4]
	.loc 1 827 3 is_stmt 1
	.loc 1 827 6 is_stmt 0
	cbnz	r2, .L50
	.loc 1 842 5 is_stmt 1
	.loc 1 842 69 is_stmt 0
	ldr	r3, [r4, #16]
	.loc 1 842 78
	bic	r3, r3, #1
	str	r3, [r4, #16]
	.loc 1 845 5 is_stmt 1
	.loc 1 845 50 is_stmt 0
	ldr	r2, .L58+4
.LVL31:
	ldr	r3, [r2, #16]
	.loc 1 845 57
	orr	r3, r3, #4
	str	r3, [r2, #16]
	.loc 1 848 5 is_stmt 1
.LBB22:
.LBB23:
	.file 2 "d:\\rtos\\board\\yd-stm32h7xxvx_classicv19\\cmake-build-debug\\_deps\\stm32h7xx_cmsis_include\\drivers\\cmsis\\include\\cmsis_gcc.h"
	.loc 2 946 3
	.syntax unified
@ 946 "d:\rtos\board\yd-stm32h7xxvx_classicv19\cmake-build-debug\_deps\stm32h7xx_cmsis_include\drivers\cmsis\include\cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE23:
.LBE22:
	.loc 1 849 5
.LBB24:
.LBB25:
	.loc 2 935 3
	.syntax unified
@ 935 "d:\rtos\board\yd-stm32h7xxvx_classicv19\cmake-build-debug\_deps\stm32h7xx_cmsis_include\drivers\cmsis\include\cmsis_gcc.h" 1
	isb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE25:
.LBE24:
	.loc 1 852 5
	.loc 1 852 8 is_stmt 0
	cmp	r1, #1
	beq	.L56
	.loc 1 860 7 is_stmt 1
	.syntax unified
@ 860 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_pwr_ex.c" 1
	wfe
@ 0 "" 2
	.thumb
	.syntax unified
.L52:
	.loc 1 864 5
	.loc 1 864 50 is_stmt 0
	ldr	r2, .L58+4
	ldr	r3, [r2, #16]
	.loc 1 864 57
	bic	r3, r3, #4
	str	r3, [r2, #16]
.L49:
	.loc 1 929 1
	ldr	r4, [sp], #4
	.cfi_remember_state
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L56:
	.cfi_restore_state
	.loc 1 855 7 is_stmt 1
	.syntax unified
@ 855 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_pwr_ex.c" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L52
.LVL32:
.L50:
	.loc 1 867 8
	.loc 1 867 11 is_stmt 0
	cmp	r2, #1
	beq	.L57
	.loc 1 926 5 is_stmt 1
	.loc 1 926 69 is_stmt 0
	ldr	r2, .L58
.LVL33:
	ldr	r3, [r2, #16]
	.loc 1 926 78
	bic	r3, r3, #4
	str	r3, [r2, #16]
	.loc 1 929 1
	b	.L49
.LVL34:
.L57:
	.loc 1 906 5 is_stmt 1
	.loc 1 906 69 is_stmt 0
	ldr	r2, .L58
.LVL35:
	ldr	r3, [r2, #16]
	.loc 1 906 78
	bic	r3, r3, #2
	str	r3, [r2, #16]
	b	.L49
.L59:
	.align	2
.L58:
	.word	1476544512
	.word	-536810240
	.cfi_endproc
.LFE341:
	.size	HAL_PWREx_EnterSTOPMode, .-HAL_PWREx_EnterSTOPMode
	.section	.text.HAL_PWREx_ClearPendingEvent,"ax",%progbits
	.align	1
	.global	HAL_PWREx_ClearPendingEvent
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_ClearPendingEvent, %function
HAL_PWREx_ClearPendingEvent:
.LFB342:
	.loc 1 940 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 953 3
	.syntax unified
@ 953 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_pwr_ex.c" 1
	wfe
@ 0 "" 2
	.loc 1 955 1 is_stmt 0
	.thumb
	.syntax unified
	bx	lr
	.cfi_endproc
.LFE342:
	.size	HAL_PWREx_ClearPendingEvent, .-HAL_PWREx_ClearPendingEvent
	.section	.text.HAL_PWREx_EnterSTANDBYMode,"ax",%progbits
	.align	1
	.global	HAL_PWREx_EnterSTANDBYMode
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_EnterSTANDBYMode, %function
HAL_PWREx_EnterSTANDBYMode:
.LFB343:
	.loc 1 987 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL36:
	.loc 1 989 3
	.loc 1 992 3
	.loc 1 992 6 is_stmt 0
	cbnz	r0, .L62
	.loc 1 1007 5 is_stmt 1
	.loc 1 1007 69 is_stmt 0
	ldr	r2, .L66
	ldr	r3, [r2, #16]
	.loc 1 1007 79
	orr	r3, r3, #1
	str	r3, [r2, #16]
	.loc 1 1015 5 is_stmt 1
	.loc 1 1015 50 is_stmt 0
	ldr	r2, .L66+4
	ldr	r3, [r2, #16]
	.loc 1 1015 57
	orr	r3, r3, #4
	str	r3, [r2, #16]
	.loc 1 1023 5 is_stmt 1
	.syntax unified
@ 1023 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_pwr_ex.c" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
.L62:
	.loc 1 1026 8
	.loc 1 1026 11 is_stmt 0
	cmp	r0, #1
	beq	.L65
	.loc 1 1061 5 is_stmt 1
	.loc 1 1061 69 is_stmt 0
	ldr	r2, .L66
	ldr	r3, [r2, #16]
	.loc 1 1061 78
	orr	r3, r3, #4
	str	r3, [r2, #16]
	.loc 1 1068 1
	bx	lr
.L65:
	.loc 1 1029 5 is_stmt 1
	.loc 1 1029 69 is_stmt 0
	ldr	r2, .L66
	ldr	r3, [r2, #16]
	.loc 1 1029 79
	orr	r3, r3, #2
	str	r3, [r2, #16]
	bx	lr
.L67:
	.align	2
.L66:
	.word	1476544512
	.word	-536810240
	.cfi_endproc
.LFE343:
	.size	HAL_PWREx_EnterSTANDBYMode, .-HAL_PWREx_EnterSTANDBYMode
	.section	.text.HAL_PWREx_ConfigD3Domain,"ax",%progbits
	.align	1
	.global	HAL_PWREx_ConfigD3Domain
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_ConfigD3Domain, %function
HAL_PWREx_ConfigD3Domain:
.LFB344:
	.loc 1 1082 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL37:
	.loc 1 1084 3
	.loc 1 1087 3
	.loc 1 1087 148 is_stmt 0
	ldr	r2, .L69
	ldr	r3, [r2, #16]
	.loc 1 1087 159
	bic	r3, r3, #2048
	.loc 1 1087 184
	orrs	r3, r3, r0
	.loc 1 1087 78
	str	r3, [r2, #16]
	.loc 1 1088 1
	bx	lr
.L70:
	.align	2
.L69:
	.word	1476544512
	.cfi_endproc
.LFE344:
	.size	HAL_PWREx_ConfigD3Domain, .-HAL_PWREx_ConfigD3Domain
	.section	.text.HAL_PWREx_EnableFlashPowerDown,"ax",%progbits
	.align	1
	.global	HAL_PWREx_EnableFlashPowerDown
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_EnableFlashPowerDown, %function
HAL_PWREx_EnableFlashPowerDown:
.LFB345:
	.loc 1 1213 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1215 3
	.loc 1 1215 67 is_stmt 0
	ldr	r2, .L72
	ldr	r3, [r2]
	.loc 1 1215 74
	orr	r3, r3, #512
	str	r3, [r2]
	.loc 1 1216 1
	bx	lr
.L73:
	.align	2
.L72:
	.word	1476544512
	.cfi_endproc
.LFE345:
	.size	HAL_PWREx_EnableFlashPowerDown, .-HAL_PWREx_EnableFlashPowerDown
	.section	.text.HAL_PWREx_DisableFlashPowerDown,"ax",%progbits
	.align	1
	.global	HAL_PWREx_DisableFlashPowerDown
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_DisableFlashPowerDown, %function
HAL_PWREx_DisableFlashPowerDown:
.LFB346:
	.loc 1 1227 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1229 3
	.loc 1 1229 67 is_stmt 0
	ldr	r2, .L75
	ldr	r3, [r2]
	.loc 1 1229 74
	bic	r3, r3, #512
	str	r3, [r2]
	.loc 1 1230 1
	bx	lr
.L76:
	.align	2
.L75:
	.word	1476544512
	.cfi_endproc
.LFE346:
	.size	HAL_PWREx_DisableFlashPowerDown, .-HAL_PWREx_DisableFlashPowerDown
	.section	.text.HAL_PWREx_EnableWakeUpPin,"ax",%progbits
	.align	1
	.global	HAL_PWREx_EnableWakeUpPin
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_EnableWakeUpPin, %function
HAL_PWREx_EnableWakeUpPin:
.LFB347:
	.loc 1 1303 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL38:
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 1304 3
	.loc 1 1305 3
	.loc 1 1306 3
.LVL39:
	.loc 1 1309 3
	.loc 1 1310 3
	.loc 1 1311 3
	.loc 1 1313 3
	.loc 1 1313 25 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1314 26
	ldr	r1, [r0, #4]
.LVL40:
.LBB26:
.LBB27:
	.loc 2 1050 3 is_stmt 1
	.loc 2 1055 4
	.syntax unified
@ 1055 "d:\rtos\board\yd-stm32h7xxvx_classicv19\cmake-build-debug\_deps\stm32h7xx_cmsis_include\drivers\cmsis\include\cmsis_gcc.h" 1
	rbit r2, r3
@ 0 "" 2
.LVL41:
	.loc 2 1068 3
	.thumb
	.syntax unified
.LBE27:
.LBE26:
.LBB28:
.LBB29:
	.loc 2 1089 3
	.loc 2 1089 6 is_stmt 0
	cmp	r2, #0
	beq	.L82
	.loc 2 1093 3 is_stmt 1
	.loc 2 1093 10 is_stmt 0
	clz	r2, r2
.LVL42:
.L78:
.LBE29:
.LBE28:
	.loc 1 1314 84
	adds	r2, r2, #8
	.loc 1 1314 92
	and	r2, r2, #31
	.loc 1 1314 40
	lsl	r2, r1, r2
	.loc 1 1313 37
	orr	r1, r3, r2
	.loc 1 1315 26
	ldr	r4, [r0, #8]
.LVL43:
.LBB31:
.LBB32:
	.loc 2 1050 3 is_stmt 1
	.loc 2 1055 4
	.syntax unified
@ 1055 "d:\rtos\board\yd-stm32h7xxvx_classicv19\cmake-build-debug\_deps\stm32h7xx_cmsis_include\drivers\cmsis\include\cmsis_gcc.h" 1
	rbit r2, r3
@ 0 "" 2
.LVL44:
	.loc 2 1068 3
	.thumb
	.syntax unified
.LBE32:
.LBE31:
.LBB33:
.LBB34:
	.loc 2 1089 3
	.loc 2 1089 6 is_stmt 0
	cbz	r2, .L83
	.loc 2 1093 3 is_stmt 1
	.loc 2 1093 10 is_stmt 0
	clz	r2, r2
.LVL45:
.L79:
.LBE34:
.LBE33:
	.loc 1 1315 89
	adds	r2, r2, #8
	lsls	r2, r2, #1
	.loc 1 1315 98
	and	r2, r2, #30
	.loc 1 1315 36
	lsl	r2, r4, r2
	.loc 1 1313 13
	orrs	r2, r2, r1
.LVL46:
	.loc 1 1317 3 is_stmt 1
.LBB36:
.LBB37:
	.loc 2 1050 3
	.loc 2 1055 4
	.syntax unified
@ 1055 "d:\rtos\board\yd-stm32h7xxvx_classicv19\cmake-build-debug\_deps\stm32h7xx_cmsis_include\drivers\cmsis\include\cmsis_gcc.h" 1
	rbit r1, r3
@ 0 "" 2
.LVL47:
	.loc 2 1068 3
	.thumb
	.syntax unified
.LBE37:
.LBE36:
.LBB38:
.LBB39:
	.loc 2 1089 3
	.loc 2 1089 6 is_stmt 0
	cbz	r1, .L84
	.loc 2 1093 3 is_stmt 1
	.loc 2 1093 10 is_stmt 0
	clz	r1, r1
.LVL48:
.L80:
.LBE39:
.LBE38:
	.loc 1 1318 75
	and	ip, r1, #31
	.loc 1 1318 32
	mov	r1, #256
	lsl	r1, r1, ip
	.loc 1 1317 35
	orrs	r1, r1, r3
.LVL49:
.LBB41:
.LBB42:
	.loc 2 1050 3 is_stmt 1
	.loc 2 1055 4
	.syntax unified
@ 1055 "d:\rtos\board\yd-stm32h7xxvx_classicv19\cmake-build-debug\_deps\stm32h7xx_cmsis_include\drivers\cmsis\include\cmsis_gcc.h" 1
	rbit r3, r3
@ 0 "" 2
.LVL50:
	.loc 2 1068 3
	.thumb
	.syntax unified
.LBE42:
.LBE41:
.LBB43:
.LBB44:
	.loc 2 1089 3
	.loc 2 1089 6 is_stmt 0
	cbz	r3, .L85
	.loc 2 1093 3 is_stmt 1
	.loc 2 1093 10 is_stmt 0
	clz	r3, r3
.LVL51:
.L81:
.LBE44:
.LBE43:
	.loc 1 1319 69
	lsls	r3, r3, #1
	.loc 1 1319 77
	and	r3, r3, #30
	.loc 1 1319 25
	mov	ip, #196608
	lsl	r3, ip, r3
	.loc 1 1317 11
	orrs	r3, r3, r1
.LVL52:
	.loc 1 1323 3 is_stmt 1
	.loc 1 1323 150 is_stmt 0
	ldr	r4, .L87
	ldr	r1, [r4, #40]
	.loc 1 1323 163
	bic	r3, r1, r3
.LVL53:
	.loc 1 1323 179
	orrs	r3, r3, r2
	.loc 1 1323 80
	str	r3, [r4, #40]
	.loc 1 1326 3 is_stmt 1
	.loc 1 1326 149 is_stmt 0
	mov	r2, #1476395008
.LVL54:
	ldr	r3, [r2, #144]
	.loc 1 1326 159
	bic	r3, r3, #528482304
	.loc 1 1326 295
	ldr	r1, [r0]
	.loc 1 1326 281
	orr	r3, r3, r1, lsl #23
	.loc 1 1326 78
	str	r3, [r2, #144]
	.loc 1 1328 1
	ldr	r4, [sp], #4
	.cfi_remember_state
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL55:
.L82:
	.cfi_restore_state
.LBB46:
.LBB30:
	.loc 2 1091 12
	movs	r2, #32
.LVL56:
	b	.L78
.LVL57:
.L83:
.LBE30:
.LBE46:
.LBB47:
.LBB35:
	movs	r2, #32
.LVL58:
	b	.L79
.LVL59:
.L84:
.LBE35:
.LBE47:
.LBB48:
.LBB40:
	movs	r1, #32
.LVL60:
	b	.L80
.LVL61:
.L85:
.LBE40:
.LBE48:
.LBB49:
.LBB45:
	movs	r3, #32
.LVL62:
	b	.L81
.L88:
	.align	2
.L87:
	.word	1476544512
.LBE45:
.LBE49:
	.cfi_endproc
.LFE347:
	.size	HAL_PWREx_EnableWakeUpPin, .-HAL_PWREx_EnableWakeUpPin
	.section	.text.HAL_PWREx_DisableWakeUpPin,"ax",%progbits
	.align	1
	.global	HAL_PWREx_DisableWakeUpPin
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_DisableWakeUpPin, %function
HAL_PWREx_DisableWakeUpPin:
.LFB348:
	.loc 1 1345 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL63:
	.loc 1 1347 3
	.loc 1 1350 3
	.loc 1 1350 67 is_stmt 0
	ldr	r2, .L90
	ldr	r3, [r2, #40]
	.loc 1 1350 78
	bic	r3, r3, r0
	str	r3, [r2, #40]
	.loc 1 1351 1
	bx	lr
.L91:
	.align	2
.L90:
	.word	1476544512
	.cfi_endproc
.LFE348:
	.size	HAL_PWREx_DisableWakeUpPin, .-HAL_PWREx_DisableWakeUpPin
	.section	.text.HAL_PWREx_GetWakeupFlag,"ax",%progbits
	.align	1
	.global	HAL_PWREx_GetWakeupFlag
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_GetWakeupFlag, %function
HAL_PWREx_GetWakeupFlag:
.LFB349:
	.loc 1 1370 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL64:
	.loc 1 1372 3
	.loc 1 1375 3
	.loc 1 1375 73 is_stmt 0
	ldr	r3, .L93
	ldr	r3, [r3, #36]
	.loc 1 1376 1
	ands	r0, r0, r3
.LVL65:
	bx	lr
.L94:
	.align	2
.L93:
	.word	1476544512
	.cfi_endproc
.LFE349:
	.size	HAL_PWREx_GetWakeupFlag, .-HAL_PWREx_GetWakeupFlag
	.section	.text.HAL_PWREx_ClearWakeupFlag,"ax",%progbits
	.align	1
	.global	HAL_PWREx_ClearWakeupFlag
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_ClearWakeupFlag, %function
HAL_PWREx_ClearWakeupFlag:
.LFB350:
	.loc 1 1395 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL66:
	.loc 1 1397 3
	.loc 1 1400 3
	.loc 1 1400 67 is_stmt 0
	ldr	r3, .L98
	ldr	r2, [r3, #32]
	.loc 1 1400 77
	orrs	r2, r2, r0
	str	r2, [r3, #32]
	.loc 1 1403 3 is_stmt 1
	.loc 1 1403 70 is_stmt 0
	ldr	r3, [r3, #36]
	.loc 1 1403 6
	tst	r3, r0
	bne	.L97
	.loc 1 1408 10
	movs	r0, #0
.LVL67:
	bx	lr
.LVL68:
.L97:
	.loc 1 1405 12
	movs	r0, #1
.LVL69:
	.loc 1 1409 1
	bx	lr
.L99:
	.align	2
.L98:
	.word	1476544512
	.cfi_endproc
.LFE350:
	.size	HAL_PWREx_ClearWakeupFlag, .-HAL_PWREx_ClearWakeupFlag
	.section	.text.HAL_PWREx_WKUP1_Callback,"ax",%progbits
	.align	1
	.weak	HAL_PWREx_WKUP1_Callback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_WKUP1_Callback, %function
HAL_PWREx_WKUP1_Callback:
.LFB352:
	.loc 1 1478 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1482 1
	bx	lr
	.cfi_endproc
.LFE352:
	.size	HAL_PWREx_WKUP1_Callback, .-HAL_PWREx_WKUP1_Callback
	.section	.text.HAL_PWREx_WKUP2_Callback,"ax",%progbits
	.align	1
	.weak	HAL_PWREx_WKUP2_Callback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_WKUP2_Callback, %function
HAL_PWREx_WKUP2_Callback:
.LFB353:
	.loc 1 1489 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1493 1
	bx	lr
	.cfi_endproc
.LFE353:
	.size	HAL_PWREx_WKUP2_Callback, .-HAL_PWREx_WKUP2_Callback
	.section	.text.HAL_PWREx_WKUP3_Callback,"ax",%progbits
	.align	1
	.weak	HAL_PWREx_WKUP3_Callback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_WKUP3_Callback, %function
HAL_PWREx_WKUP3_Callback:
.LFB354:
	.loc 1 1501 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1505 1
	bx	lr
	.cfi_endproc
.LFE354:
	.size	HAL_PWREx_WKUP3_Callback, .-HAL_PWREx_WKUP3_Callback
	.section	.text.HAL_PWREx_WKUP4_Callback,"ax",%progbits
	.align	1
	.weak	HAL_PWREx_WKUP4_Callback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_WKUP4_Callback, %function
HAL_PWREx_WKUP4_Callback:
.LFB355:
	.loc 1 1513 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1517 1
	bx	lr
	.cfi_endproc
.LFE355:
	.size	HAL_PWREx_WKUP4_Callback, .-HAL_PWREx_WKUP4_Callback
	.section	.text.HAL_PWREx_WKUP5_Callback,"ax",%progbits
	.align	1
	.weak	HAL_PWREx_WKUP5_Callback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_WKUP5_Callback, %function
HAL_PWREx_WKUP5_Callback:
.LFB356:
	.loc 1 1525 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1529 1
	bx	lr
	.cfi_endproc
.LFE356:
	.size	HAL_PWREx_WKUP5_Callback, .-HAL_PWREx_WKUP5_Callback
	.section	.text.HAL_PWREx_WKUP6_Callback,"ax",%progbits
	.align	1
	.weak	HAL_PWREx_WKUP6_Callback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_WKUP6_Callback, %function
HAL_PWREx_WKUP6_Callback:
.LFB357:
	.loc 1 1537 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1541 1
	bx	lr
	.cfi_endproc
.LFE357:
	.size	HAL_PWREx_WKUP6_Callback, .-HAL_PWREx_WKUP6_Callback
	.section	.text.HAL_PWREx_WAKEUP_PIN_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_PWREx_WAKEUP_PIN_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_WAKEUP_PIN_IRQHandler, %function
HAL_PWREx_WAKEUP_PIN_IRQHandler:
.LFB351:
	.loc 1 1417 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 1419 3
	.loc 1 1419 71 is_stmt 0
	ldr	r3, .L118
	ldr	r3, [r3, #36]
	.loc 1 1419 6
	tst	r3, #1
	bne	.L114
	.loc 1 1427 8 is_stmt 1
	.loc 1 1427 76 is_stmt 0
	ldr	r3, .L118
	ldr	r3, [r3, #36]
	.loc 1 1427 11
	tst	r3, #2
	bne	.L115
	.loc 1 1436 8 is_stmt 1
	.loc 1 1436 76 is_stmt 0
	ldr	r3, .L118
	ldr	r3, [r3, #36]
	.loc 1 1436 11
	tst	r3, #4
	bne	.L116
	.loc 1 1445 8 is_stmt 1
	.loc 1 1445 76 is_stmt 0
	ldr	r3, .L118
	ldr	r3, [r3, #36]
	.loc 1 1445 11
	tst	r3, #8
	bne	.L117
	.loc 1 1454 8 is_stmt 1
	.loc 1 1454 76 is_stmt 0
	ldr	r3, .L118
	ldr	r3, [r3, #36]
	.loc 1 1454 11
	tst	r3, #16
	beq	.L112
	.loc 1 1457 5 is_stmt 1
	.loc 1 1457 69 is_stmt 0
	ldr	r2, .L118
	ldr	r3, [r2, #32]
	.loc 1 1457 79
	orr	r3, r3, #16
	str	r3, [r2, #32]
	.loc 1 1460 5 is_stmt 1
	bl	HAL_PWREx_WKUP5_Callback
.LVL70:
	b	.L106
.L114:
	.loc 1 1422 5
	.loc 1 1422 69 is_stmt 0
	ldr	r2, .L118
	ldr	r3, [r2, #32]
	.loc 1 1422 79
	orr	r3, r3, #1
	str	r3, [r2, #32]
	.loc 1 1425 5 is_stmt 1
	bl	HAL_PWREx_WKUP1_Callback
.LVL71:
.L106:
	.loc 1 1471 1 is_stmt 0
	pop	{r3, pc}
.L115:
	.loc 1 1430 5 is_stmt 1
	.loc 1 1430 69 is_stmt 0
	ldr	r2, .L118
	ldr	r3, [r2, #32]
	.loc 1 1430 79
	orr	r3, r3, #2
	str	r3, [r2, #32]
	.loc 1 1433 5 is_stmt 1
	bl	HAL_PWREx_WKUP2_Callback
.LVL72:
	b	.L106
.L116:
	.loc 1 1439 5
	.loc 1 1439 69 is_stmt 0
	ldr	r2, .L118
	ldr	r3, [r2, #32]
	.loc 1 1439 79
	orr	r3, r3, #4
	str	r3, [r2, #32]
	.loc 1 1442 5 is_stmt 1
	bl	HAL_PWREx_WKUP3_Callback
.LVL73:
	b	.L106
.L117:
	.loc 1 1448 5
	.loc 1 1448 69 is_stmt 0
	ldr	r2, .L118
	ldr	r3, [r2, #32]
	.loc 1 1448 79
	orr	r3, r3, #8
	str	r3, [r2, #32]
	.loc 1 1451 5 is_stmt 1
	bl	HAL_PWREx_WKUP4_Callback
.LVL74:
	b	.L106
.L112:
	.loc 1 1466 5
	.loc 1 1466 69 is_stmt 0
	ldr	r2, .L118
	ldr	r3, [r2, #32]
	.loc 1 1466 79
	orr	r3, r3, #32
	str	r3, [r2, #32]
	.loc 1 1469 5 is_stmt 1
	bl	HAL_PWREx_WKUP6_Callback
.LVL75:
	.loc 1 1471 1 is_stmt 0
	b	.L106
.L119:
	.align	2
.L118:
	.word	1476544512
	.cfi_endproc
.LFE351:
	.size	HAL_PWREx_WAKEUP_PIN_IRQHandler, .-HAL_PWREx_WAKEUP_PIN_IRQHandler
	.section	.text.HAL_PWREx_EnableBkUpReg,"ax",%progbits
	.align	1
	.global	HAL_PWREx_EnableBkUpReg
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_EnableBkUpReg, %function
HAL_PWREx_EnableBkUpReg:
.LFB358:
	.loc 1 1626 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 1627 3
	.loc 1 1630 3
	.loc 1 1630 67 is_stmt 0
	ldr	r2, .L127
	ldr	r3, [r2, #8]
	.loc 1 1630 74
	orr	r3, r3, #1
	str	r3, [r2, #8]
	.loc 1 1633 3 is_stmt 1
	.loc 1 1633 15 is_stmt 0
	bl	HAL_GetTick
.LVL76:
	mov	r4, r0
.LVL77:
	.loc 1 1636 3 is_stmt 1
.L121:
	.loc 1 1636 2055
	.loc 1 1636 790 is_stmt 0
	ldr	r3, .L127
	ldr	r3, [r3, #8]
	.loc 1 1636 2055
	tst	r3, #65536
	bne	.L126
	.loc 1 1638 5 is_stmt 1
	.loc 1 1638 10 is_stmt 0
	bl	HAL_GetTick
.LVL78:
	.loc 1 1638 24
	subs	r0, r0, r4
	.loc 1 1638 8
	cmp	r0, #1000
	bls	.L121
	.loc 1 1640 14
	movs	r0, #1
	b	.L122
.L126:
	.loc 1 1644 10
	movs	r0, #0
.L122:
	.loc 1 1645 1
	pop	{r4, pc}
.LVL79:
.L128:
	.align	2
.L127:
	.word	1476544512
	.cfi_endproc
.LFE358:
	.size	HAL_PWREx_EnableBkUpReg, .-HAL_PWREx_EnableBkUpReg
	.section	.text.HAL_PWREx_DisableBkUpReg,"ax",%progbits
	.align	1
	.global	HAL_PWREx_DisableBkUpReg
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_DisableBkUpReg, %function
HAL_PWREx_DisableBkUpReg:
.LFB359:
	.loc 1 1652 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 1653 3
	.loc 1 1656 3
	.loc 1 1656 67 is_stmt 0
	ldr	r2, .L136
	ldr	r3, [r2, #8]
	.loc 1 1656 74
	bic	r3, r3, #1
	str	r3, [r2, #8]
	.loc 1 1659 3 is_stmt 1
	.loc 1 1659 15 is_stmt 0
	bl	HAL_GetTick
.LVL80:
	mov	r4, r0
.LVL81:
	.loc 1 1662 3 is_stmt 1
.L130:
	.loc 1 1662 2055
	.loc 1 1662 790 is_stmt 0
	ldr	r3, .L136
	ldr	r3, [r3, #8]
	.loc 1 1662 2055
	tst	r3, #65536
	beq	.L135
	.loc 1 1664 5 is_stmt 1
	.loc 1 1664 10 is_stmt 0
	bl	HAL_GetTick
.LVL82:
	.loc 1 1664 24
	subs	r0, r0, r4
	.loc 1 1664 8
	cmp	r0, #1000
	bls	.L130
	.loc 1 1666 14
	movs	r0, #1
	b	.L131
.L135:
	.loc 1 1670 10
	movs	r0, #0
.L131:
	.loc 1 1671 1
	pop	{r4, pc}
.LVL83:
.L137:
	.align	2
.L136:
	.word	1476544512
	.cfi_endproc
.LFE359:
	.size	HAL_PWREx_DisableBkUpReg, .-HAL_PWREx_DisableBkUpReg
	.section	.text.HAL_PWREx_EnableUSBReg,"ax",%progbits
	.align	1
	.global	HAL_PWREx_EnableUSBReg
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_EnableUSBReg, %function
HAL_PWREx_EnableUSBReg:
.LFB360:
	.loc 1 1678 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 1679 3
	.loc 1 1682 3
	.loc 1 1682 67 is_stmt 0
	ldr	r2, .L145
	ldr	r3, [r2, #12]
	.loc 1 1682 74
	orr	r3, r3, #33554432
	str	r3, [r2, #12]
	.loc 1 1685 3 is_stmt 1
	.loc 1 1685 15 is_stmt 0
	bl	HAL_GetTick
.LVL84:
	mov	r4, r0
.LVL85:
	.loc 1 1688 3 is_stmt 1
.L139:
	.loc 1 1688 2055
	.loc 1 1688 1480 is_stmt 0
	ldr	r3, .L145
	ldr	r3, [r3, #12]
	.loc 1 1688 2055
	tst	r3, #67108864
	bne	.L144
	.loc 1 1690 5 is_stmt 1
	.loc 1 1690 10 is_stmt 0
	bl	HAL_GetTick
.LVL86:
	.loc 1 1690 24
	subs	r0, r0, r4
	.loc 1 1690 8
	cmp	r0, #1000
	bls	.L139
	.loc 1 1692 14
	movs	r0, #1
	b	.L140
.L144:
	.loc 1 1696 10
	movs	r0, #0
.L140:
	.loc 1 1697 1
	pop	{r4, pc}
.LVL87:
.L146:
	.align	2
.L145:
	.word	1476544512
	.cfi_endproc
.LFE360:
	.size	HAL_PWREx_EnableUSBReg, .-HAL_PWREx_EnableUSBReg
	.section	.text.HAL_PWREx_DisableUSBReg,"ax",%progbits
	.align	1
	.global	HAL_PWREx_DisableUSBReg
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_DisableUSBReg, %function
HAL_PWREx_DisableUSBReg:
.LFB361:
	.loc 1 1704 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 1705 3
	.loc 1 1708 3
	.loc 1 1708 67 is_stmt 0
	ldr	r2, .L154
	ldr	r3, [r2, #12]
	.loc 1 1708 74
	bic	r3, r3, #33554432
	str	r3, [r2, #12]
	.loc 1 1711 3 is_stmt 1
	.loc 1 1711 15 is_stmt 0
	bl	HAL_GetTick
.LVL88:
	mov	r4, r0
.LVL89:
	.loc 1 1714 3 is_stmt 1
.L148:
	.loc 1 1714 2054
	.loc 1 1714 1479 is_stmt 0
	ldr	r3, .L154
	ldr	r3, [r3, #12]
	.loc 1 1714 2054
	tst	r3, #67108864
	beq	.L153
	.loc 1 1716 5 is_stmt 1
	.loc 1 1716 10 is_stmt 0
	bl	HAL_GetTick
.LVL90:
	.loc 1 1716 24
	subs	r0, r0, r4
	.loc 1 1716 8
	cmp	r0, #1000
	bls	.L148
	.loc 1 1718 14
	movs	r0, #1
	b	.L149
.L153:
	.loc 1 1722 10
	movs	r0, #0
.L149:
	.loc 1 1723 1
	pop	{r4, pc}
.LVL91:
.L155:
	.align	2
.L154:
	.word	1476544512
	.cfi_endproc
.LFE361:
	.size	HAL_PWREx_DisableUSBReg, .-HAL_PWREx_DisableUSBReg
	.section	.text.HAL_PWREx_EnableUSBVoltageDetector,"ax",%progbits
	.align	1
	.global	HAL_PWREx_EnableUSBVoltageDetector
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_EnableUSBVoltageDetector, %function
HAL_PWREx_EnableUSBVoltageDetector:
.LFB362:
	.loc 1 1730 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1732 3
	.loc 1 1732 67 is_stmt 0
	ldr	r2, .L157
	ldr	r3, [r2, #12]
	.loc 1 1732 74
	orr	r3, r3, #16777216
	str	r3, [r2, #12]
	.loc 1 1733 1
	bx	lr
.L158:
	.align	2
.L157:
	.word	1476544512
	.cfi_endproc
.LFE362:
	.size	HAL_PWREx_EnableUSBVoltageDetector, .-HAL_PWREx_EnableUSBVoltageDetector
	.section	.text.HAL_PWREx_DisableUSBVoltageDetector,"ax",%progbits
	.align	1
	.global	HAL_PWREx_DisableUSBVoltageDetector
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_DisableUSBVoltageDetector, %function
HAL_PWREx_DisableUSBVoltageDetector:
.LFB363:
	.loc 1 1740 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1742 3
	.loc 1 1742 67 is_stmt 0
	ldr	r2, .L160
	ldr	r3, [r2, #12]
	.loc 1 1742 74
	bic	r3, r3, #16777216
	str	r3, [r2, #12]
	.loc 1 1743 1
	bx	lr
.L161:
	.align	2
.L160:
	.word	1476544512
	.cfi_endproc
.LFE363:
	.size	HAL_PWREx_DisableUSBVoltageDetector, .-HAL_PWREx_DisableUSBVoltageDetector
	.section	.text.HAL_PWREx_EnableBatteryCharging,"ax",%progbits
	.align	1
	.global	HAL_PWREx_EnableBatteryCharging
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_EnableBatteryCharging, %function
HAL_PWREx_EnableBatteryCharging:
.LFB364:
	.loc 1 1756 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL92:
	.loc 1 1758 3
	.loc 1 1761 3
	.loc 1 1761 146 is_stmt 0
	ldr	r2, .L163
	ldr	r3, [r2, #12]
	.loc 1 1761 155
	bic	r3, r3, #512
	.loc 1 1761 179
	orrs	r3, r3, r0
	.loc 1 1761 76
	str	r3, [r2, #12]
	.loc 1 1764 3 is_stmt 1
	.loc 1 1764 67 is_stmt 0
	ldr	r3, [r2, #12]
	.loc 1 1764 74
	orr	r3, r3, #256
	str	r3, [r2, #12]
	.loc 1 1765 1
	bx	lr
.L164:
	.align	2
.L163:
	.word	1476544512
	.cfi_endproc
.LFE364:
	.size	HAL_PWREx_EnableBatteryCharging, .-HAL_PWREx_EnableBatteryCharging
	.section	.text.HAL_PWREx_DisableBatteryCharging,"ax",%progbits
	.align	1
	.global	HAL_PWREx_DisableBatteryCharging
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_DisableBatteryCharging, %function
HAL_PWREx_DisableBatteryCharging:
.LFB365:
	.loc 1 1772 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1774 3
	.loc 1 1774 67 is_stmt 0
	ldr	r2, .L166
	ldr	r3, [r2, #12]
	.loc 1 1774 74
	bic	r3, r3, #256
	str	r3, [r2, #12]
	.loc 1 1775 1
	bx	lr
.L167:
	.align	2
.L166:
	.word	1476544512
	.cfi_endproc
.LFE365:
	.size	HAL_PWREx_DisableBatteryCharging, .-HAL_PWREx_DisableBatteryCharging
	.section	.text.HAL_PWREx_EnableMonitoring,"ax",%progbits
	.align	1
	.global	HAL_PWREx_EnableMonitoring
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_EnableMonitoring, %function
HAL_PWREx_EnableMonitoring:
.LFB366:
	.loc 1 1862 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1864 3
	.loc 1 1864 67 is_stmt 0
	ldr	r2, .L169
	ldr	r3, [r2, #8]
	.loc 1 1864 74
	orr	r3, r3, #16
	str	r3, [r2, #8]
	.loc 1 1865 1
	bx	lr
.L170:
	.align	2
.L169:
	.word	1476544512
	.cfi_endproc
.LFE366:
	.size	HAL_PWREx_EnableMonitoring, .-HAL_PWREx_EnableMonitoring
	.section	.text.HAL_PWREx_DisableMonitoring,"ax",%progbits
	.align	1
	.global	HAL_PWREx_DisableMonitoring
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_DisableMonitoring, %function
HAL_PWREx_DisableMonitoring:
.LFB367:
	.loc 1 1872 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1874 3
	.loc 1 1874 67 is_stmt 0
	ldr	r2, .L172
	ldr	r3, [r2, #8]
	.loc 1 1874 74
	bic	r3, r3, #16
	str	r3, [r2, #8]
	.loc 1 1875 1
	bx	lr
.L173:
	.align	2
.L172:
	.word	1476544512
	.cfi_endproc
.LFE367:
	.size	HAL_PWREx_DisableMonitoring, .-HAL_PWREx_DisableMonitoring
	.section	.text.HAL_PWREx_GetTemperatureLevel,"ax",%progbits
	.align	1
	.global	HAL_PWREx_GetTemperatureLevel
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_GetTemperatureLevel, %function
HAL_PWREx_GetTemperatureLevel:
.LFB368:
	.loc 1 1883 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1884 3
	.loc 1 1887 3
	.loc 1 1887 78 is_stmt 0
	ldr	r3, .L177
	ldr	r0, [r3, #8]
	.loc 1 1887 12
	and	r0, r0, #12582912
.LVL93:
	.loc 1 1890 3 is_stmt 1
	.loc 1 1890 6 is_stmt 0
	cmp	r0, #4194304
	beq	.L174
	.loc 1 1895 8 is_stmt 1
	.loc 1 1895 11 is_stmt 0
	cmp	r0, #8388608
	beq	.L174
	.loc 1 1902 15
	movs	r0, #0
.LVL94:
	.loc 1 1905 3 is_stmt 1
.L174:
	.loc 1 1906 1 is_stmt 0
	bx	lr
.L178:
	.align	2
.L177:
	.word	1476544512
	.cfi_endproc
.LFE368:
	.size	HAL_PWREx_GetTemperatureLevel, .-HAL_PWREx_GetTemperatureLevel
	.section	.text.HAL_PWREx_GetVBATLevel,"ax",%progbits
	.align	1
	.global	HAL_PWREx_GetVBATLevel
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_GetVBATLevel, %function
HAL_PWREx_GetVBATLevel:
.LFB369:
	.loc 1 1914 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1915 3
	.loc 1 1918 3
	.loc 1 1918 78 is_stmt 0
	ldr	r3, .L182
	ldr	r0, [r3, #8]
	.loc 1 1918 12
	and	r0, r0, #3145728
.LVL95:
	.loc 1 1921 3 is_stmt 1
	.loc 1 1921 6 is_stmt 0
	cmp	r0, #1048576
	beq	.L179
	.loc 1 1926 8 is_stmt 1
	.loc 1 1926 11 is_stmt 0
	cmp	r0, #2097152
	beq	.L179
	.loc 1 1933 15
	movs	r0, #0
.LVL96:
	.loc 1 1936 3 is_stmt 1
.L179:
	.loc 1 1937 1 is_stmt 0
	bx	lr
.L183:
	.align	2
.L182:
	.word	1476544512
	.cfi_endproc
.LFE369:
	.size	HAL_PWREx_GetVBATLevel, .-HAL_PWREx_GetVBATLevel
	.section	.text.HAL_PWREx_ConfigAVD,"ax",%progbits
	.align	1
	.global	HAL_PWREx_ConfigAVD
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_ConfigAVD, %function
HAL_PWREx_ConfigAVD:
.LFB370:
	.loc 1 1977 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL97:
	.loc 1 1979 3
	.loc 1 1980 3
	.loc 1 1983 3
	.loc 1 1983 146 is_stmt 0
	ldr	r2, .L189
	ldr	r3, [r2]
	.loc 1 1983 155
	bic	r3, r3, #393216
	.loc 1 1983 193
	ldr	r1, [r0]
	.loc 1 1983 180
	orrs	r3, r3, r1
	.loc 1 1983 76
	str	r3, [r2]
	.loc 1 1987 3 is_stmt 1
	.loc 1 1987 68 is_stmt 0
	mov	r3, #1476395008
	ldr	r2, [r3, #132]
	.loc 1 1987 76
	bic	r2, r2, #65536
	str	r2, [r3, #132]
	.loc 1 1988 3 is_stmt 1
	.loc 1 1988 68 is_stmt 0
	ldr	r2, [r3, #128]
	.loc 1 1988 76
	bic	r2, r2, #65536
	str	r2, [r3, #128]
	.loc 1 1991 3 is_stmt 1
	.loc 1 1991 68 is_stmt 0
	ldr	r2, [r3]
	.loc 1 1991 77
	bic	r2, r2, #65536
	str	r2, [r3]
	.loc 1 1992 3 is_stmt 1
	.loc 1 1992 68 is_stmt 0
	ldr	r2, [r3, #4]
	.loc 1 1992 77
	bic	r2, r2, #65536
	str	r2, [r3, #4]
	.loc 1 1996 3 is_stmt 1
	.loc 1 1996 18 is_stmt 0
	ldr	r3, [r0, #4]
	.loc 1 1996 6
	tst	r3, #65536
	beq	.L185
	.loc 1 1998 5 is_stmt 1
	.loc 1 1998 70 is_stmt 0
	mov	r2, #1476395008
	ldr	r3, [r2, #128]
	.loc 1 1998 78
	orr	r3, r3, #65536
	str	r3, [r2, #128]
.L185:
	.loc 1 2002 3 is_stmt 1
	.loc 1 2002 18 is_stmt 0
	ldr	r3, [r0, #4]
	.loc 1 2002 6
	tst	r3, #131072
	beq	.L186
	.loc 1 2004 5 is_stmt 1
	.loc 1 2004 70 is_stmt 0
	mov	r2, #1476395008
	ldr	r3, [r2, #132]
	.loc 1 2004 78
	orr	r3, r3, #65536
	str	r3, [r2, #132]
.L186:
	.loc 1 2009 3 is_stmt 1
	.loc 1 2009 18 is_stmt 0
	ldr	r3, [r0, #4]
	.loc 1 2009 6
	tst	r3, #1
	beq	.L187
	.loc 1 2011 5 is_stmt 1
	.loc 1 2011 70 is_stmt 0
	mov	r2, #1476395008
	ldr	r3, [r2]
	.loc 1 2011 79
	orr	r3, r3, #65536
	str	r3, [r2]
.L187:
	.loc 1 2015 3 is_stmt 1
	.loc 1 2015 18 is_stmt 0
	ldr	r3, [r0, #4]
	.loc 1 2015 6
	tst	r3, #2
	beq	.L184
	.loc 1 2017 5 is_stmt 1
	.loc 1 2017 70 is_stmt 0
	mov	r2, #1476395008
	ldr	r3, [r2, #4]
	.loc 1 2017 79
	orr	r3, r3, #65536
	str	r3, [r2, #4]
.L184:
	.loc 1 2019 1
	bx	lr
.L190:
	.align	2
.L189:
	.word	1476544512
	.cfi_endproc
.LFE370:
	.size	HAL_PWREx_ConfigAVD, .-HAL_PWREx_ConfigAVD
	.section	.text.HAL_PWREx_EnableAVD,"ax",%progbits
	.align	1
	.global	HAL_PWREx_EnableAVD
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_EnableAVD, %function
HAL_PWREx_EnableAVD:
.LFB371:
	.loc 1 2026 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 2028 3
	.loc 1 2028 67 is_stmt 0
	ldr	r2, .L192
	ldr	r3, [r2]
	.loc 1 2028 74
	orr	r3, r3, #65536
	str	r3, [r2]
	.loc 1 2029 1
	bx	lr
.L193:
	.align	2
.L192:
	.word	1476544512
	.cfi_endproc
.LFE371:
	.size	HAL_PWREx_EnableAVD, .-HAL_PWREx_EnableAVD
	.section	.text.HAL_PWREx_DisableAVD,"ax",%progbits
	.align	1
	.global	HAL_PWREx_DisableAVD
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_DisableAVD, %function
HAL_PWREx_DisableAVD:
.LFB372:
	.loc 1 2036 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 2038 3
	.loc 1 2038 67 is_stmt 0
	ldr	r2, .L195
	ldr	r3, [r2]
	.loc 1 2038 74
	bic	r3, r3, #65536
	str	r3, [r2]
	.loc 1 2039 1
	bx	lr
.L196:
	.align	2
.L195:
	.word	1476544512
	.cfi_endproc
.LFE372:
	.size	HAL_PWREx_DisableAVD, .-HAL_PWREx_DisableAVD
	.section	.text.HAL_PWREx_AVDCallback,"ax",%progbits
	.align	1
	.weak	HAL_PWREx_AVDCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_AVDCallback, %function
HAL_PWREx_AVDCallback:
.LFB374:
	.loc 1 2132 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 2136 1
	bx	lr
	.cfi_endproc
.LFE374:
	.size	HAL_PWREx_AVDCallback, .-HAL_PWREx_AVDCallback
	.section	.text.HAL_PWREx_PVD_AVD_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_PWREx_PVD_AVD_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWREx_PVD_AVD_IRQHandler, %function
HAL_PWREx_PVD_AVD_IRQHandler:
.LFB373:
	.loc 1 2047 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 2049 3
	.loc 1 2049 71 is_stmt 0
	ldr	r3, .L204
	ldr	r3, [r3]
	.loc 1 2049 6
	tst	r3, #16
	beq	.L199
	.loc 1 2056 7 is_stmt 1
	.loc 1 2056 78 is_stmt 0
	mov	r3, #1476395008
	ldr	r3, [r3, #136]
	.loc 1 2056 10
	tst	r3, #65536
	bne	.L202
.L199:
	.loc 1 2088 3 is_stmt 1
	.loc 1 2088 71 is_stmt 0
	ldr	r3, .L204
	ldr	r3, [r3]
	.loc 1 2088 6
	tst	r3, #65536
	beq	.L198
	.loc 1 2095 7 is_stmt 1
	.loc 1 2095 78 is_stmt 0
	mov	r3, #1476395008
	ldr	r3, [r3, #136]
	.loc 1 2095 10
	tst	r3, #65536
	bne	.L203
.L198:
	.loc 1 2125 1
	pop	{r3, pc}
.L202:
	.loc 1 2059 9 is_stmt 1
	bl	HAL_PWR_PVDCallback
.LVL98:
	.loc 1 2061 9
	.loc 1 2061 239 is_stmt 0
	ldr	r3, .L204
	ldr	r3, [r3, #4]
	.loc 1 2061 11
	tst	r3, #65536
	bne	.L199
	.loc 1 2064 11 is_stmt 1
	.loc 1 2064 76 is_stmt 0
	mov	r2, #1476395008
	ldr	r3, [r2, #136]
	.loc 1 2064 83
	orr	r3, r3, #65536
	str	r3, [r2, #136]
	b	.L199
.L203:
	.loc 1 2098 9 is_stmt 1
	bl	HAL_PWREx_AVDCallback
.LVL99:
	.loc 1 2100 9
	.loc 1 2100 102 is_stmt 0
	ldr	r3, .L204
	ldr	r3, [r3, #4]
	.loc 1 2100 11
	tst	r3, #16
	bne	.L198
	.loc 1 2103 11 is_stmt 1
	.loc 1 2103 76 is_stmt 0
	mov	r2, #1476395008
	ldr	r3, [r2, #136]
	.loc 1 2103 83
	orr	r3, r3, #65536
	str	r3, [r2, #136]
	.loc 1 2125 1
	b	.L198
.L205:
	.align	2
.L204:
	.word	1476544512
	.cfi_endproc
.LFE373:
	.size	HAL_PWREx_PVD_AVD_IRQHandler, .-HAL_PWREx_PVD_AVD_IRQHandler
	.text
.Letext0:
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 4 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 5 "d:\\rtos\\board\\yd-stm32h7xxvx_classicv19\\cmake-build-debug\\_deps\\stm32h7xx_cmsis_include\\drivers\\cmsis\\include\\core_cm7.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 8 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_pwr_ex.h"
	.file 9 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_pwr.h"
	.file 10 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x10e4
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x23
	.4byte	.LASF191
	.byte	0x1d
	.4byte	.LASF192
	.4byte	.LASF193
	.4byte	.LLRL28
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
	.uleb128 0xf
	.4byte	.LASF5
	.byte	0x3
	.byte	0x2b
	.byte	0x17
	.4byte	0x40
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
	.uleb128 0xf
	.4byte	.LASF6
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x61
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x24
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0xf
	.4byte	.LASF11
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x34
	.uleb128 0x10
	.4byte	0x84
	.uleb128 0xf
	.4byte	.LASF12
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x55
	.uleb128 0x10
	.4byte	0x95
	.uleb128 0x12
	.4byte	0xa1
	.uleb128 0x12
	.4byte	0x95
	.uleb128 0x1b
	.2byte	0x2ac
	.byte	0x5
	.2byte	0x1c7
	.4byte	0x38f
	.uleb128 0x1
	.4byte	.LASF13
	.byte	0x5
	.2byte	0x1c9
	.byte	0x1b
	.4byte	0xa6
	.byte	0
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0x5
	.2byte	0x1ca
	.byte	0x15
	.4byte	0xa1
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF15
	.byte	0x5
	.2byte	0x1cb
	.byte	0x15
	.4byte	0xa1
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0x5
	.2byte	0x1cc
	.byte	0x15
	.4byte	0xa1
	.byte	0xc
	.uleb128 0xb
	.ascii	"SCR\000"
	.byte	0x5
	.2byte	0x1cd
	.byte	0x15
	.4byte	0xa1
	.byte	0x10
	.uleb128 0xb
	.ascii	"CCR\000"
	.byte	0x5
	.2byte	0x1ce
	.byte	0x15
	.4byte	0xa1
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0x5
	.2byte	0x1cf
	.byte	0x14
	.4byte	0x39f
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0x5
	.2byte	0x1d0
	.byte	0x15
	.4byte	0xa1
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0x5
	.2byte	0x1d1
	.byte	0x15
	.4byte	0xa1
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x5
	.2byte	0x1d2
	.byte	0x15
	.4byte	0xa1
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x5
	.2byte	0x1d3
	.byte	0x15
	.4byte	0xa1
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0x5
	.2byte	0x1d4
	.byte	0x15
	.4byte	0xa1
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x1d5
	.byte	0x15
	.4byte	0xa1
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x5
	.2byte	0x1d6
	.byte	0x15
	.4byte	0xa1
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x1d7
	.byte	0x1b
	.4byte	0x3b9
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x1d8
	.byte	0x1b
	.4byte	0xa6
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x1d9
	.byte	0x1b
	.4byte	0xa6
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x1da
	.byte	0x1b
	.4byte	0x3d3
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x5
	.2byte	0x1db
	.byte	0x1b
	.4byte	0x3ed
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x5
	.2byte	0x1dc
	.byte	0x12
	.4byte	0x3f2
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x5
	.2byte	0x1dd
	.byte	0x1b
	.4byte	0xa6
	.byte	0x78
	.uleb128 0xb
	.ascii	"CTR\000"
	.byte	0x5
	.2byte	0x1de
	.byte	0x1b
	.4byte	0xa6
	.byte	0x7c
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x5
	.2byte	0x1df
	.byte	0x1b
	.4byte	0xa6
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x5
	.2byte	0x1e0
	.byte	0x15
	.4byte	0xa1
	.byte	0x84
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x5
	.2byte	0x1e1
	.byte	0x15
	.4byte	0xa1
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x5
	.2byte	0x1e2
	.byte	0x12
	.4byte	0x402
	.byte	0x8c
	.uleb128 0x2
	.4byte	.LASF36
	.byte	0x5
	.2byte	0x1e3
	.byte	0x15
	.4byte	0xa1
	.2byte	0x200
	.uleb128 0x2
	.4byte	.LASF37
	.byte	0x5
	.2byte	0x1e4
	.byte	0x12
	.4byte	0x412
	.2byte	0x204
	.uleb128 0x2
	.4byte	.LASF38
	.byte	0x5
	.2byte	0x1e5
	.byte	0x1b
	.4byte	0xa6
	.2byte	0x240
	.uleb128 0x2
	.4byte	.LASF39
	.byte	0x5
	.2byte	0x1e6
	.byte	0x1b
	.4byte	0xa6
	.2byte	0x244
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0x5
	.2byte	0x1e7
	.byte	0x1b
	.4byte	0xa6
	.2byte	0x248
	.uleb128 0x2
	.4byte	.LASF41
	.byte	0x5
	.2byte	0x1e8
	.byte	0x12
	.4byte	0x3f2
	.2byte	0x24c
	.uleb128 0x2
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x1e9
	.byte	0x15
	.4byte	0xa1
	.2byte	0x250
	.uleb128 0x2
	.4byte	.LASF43
	.byte	0x5
	.2byte	0x1ea
	.byte	0x12
	.4byte	0x3f2
	.2byte	0x254
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x5
	.2byte	0x1eb
	.byte	0x15
	.4byte	0xa1
	.2byte	0x258
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0x5
	.2byte	0x1ec
	.byte	0x15
	.4byte	0xa1
	.2byte	0x25c
	.uleb128 0x2
	.4byte	.LASF46
	.byte	0x5
	.2byte	0x1ed
	.byte	0x15
	.4byte	0xa1
	.2byte	0x260
	.uleb128 0x2
	.4byte	.LASF47
	.byte	0x5
	.2byte	0x1ee
	.byte	0x15
	.4byte	0xa1
	.2byte	0x264
	.uleb128 0x2
	.4byte	.LASF48
	.byte	0x5
	.2byte	0x1ef
	.byte	0x15
	.4byte	0xa1
	.2byte	0x268
	.uleb128 0x2
	.4byte	.LASF49
	.byte	0x5
	.2byte	0x1f0
	.byte	0x15
	.4byte	0xa1
	.2byte	0x26c
	.uleb128 0x2
	.4byte	.LASF50
	.byte	0x5
	.2byte	0x1f1
	.byte	0x15
	.4byte	0xa1
	.2byte	0x270
	.uleb128 0x2
	.4byte	.LASF51
	.byte	0x5
	.2byte	0x1f2
	.byte	0x15
	.4byte	0xa1
	.2byte	0x274
	.uleb128 0x2
	.4byte	.LASF52
	.byte	0x5
	.2byte	0x1f3
	.byte	0x12
	.4byte	0x422
	.2byte	0x278
	.uleb128 0x2
	.4byte	.LASF53
	.byte	0x5
	.2byte	0x1f4
	.byte	0x15
	.4byte	0xa1
	.2byte	0x290
	.uleb128 0x2
	.4byte	.LASF54
	.byte	0x5
	.2byte	0x1f5
	.byte	0x15
	.4byte	0xa1
	.2byte	0x294
	.uleb128 0x2
	.4byte	.LASF55
	.byte	0x5
	.2byte	0x1f6
	.byte	0x15
	.4byte	0xa1
	.2byte	0x298
	.uleb128 0x2
	.4byte	.LASF56
	.byte	0x5
	.2byte	0x1f7
	.byte	0x15
	.4byte	0xa1
	.2byte	0x29c
	.uleb128 0x2
	.4byte	.LASF57
	.byte	0x5
	.2byte	0x1f8
	.byte	0x15
	.4byte	0xa1
	.2byte	0x2a0
	.uleb128 0x2
	.4byte	.LASF58
	.byte	0x5
	.2byte	0x1f9
	.byte	0x12
	.4byte	0x3f2
	.2byte	0x2a4
	.uleb128 0x2
	.4byte	.LASF59
	.byte	0x5
	.2byte	0x1fa
	.byte	0x15
	.4byte	0xa1
	.2byte	0x2a8
	.byte	0
	.uleb128 0x6
	.4byte	0x90
	.4byte	0x39f
	.uleb128 0x7
	.4byte	0x7d
	.byte	0xb
	.byte	0
	.uleb128 0x10
	.4byte	0x38f
	.uleb128 0x6
	.4byte	0xa6
	.4byte	0x3b4
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x1
	.byte	0
	.uleb128 0x12
	.4byte	0x3a4
	.uleb128 0x10
	.4byte	0x3b4
	.uleb128 0x6
	.4byte	0xa6
	.4byte	0x3ce
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x3
	.byte	0
	.uleb128 0x12
	.4byte	0x3be
	.uleb128 0x10
	.4byte	0x3ce
	.uleb128 0x6
	.4byte	0xa6
	.4byte	0x3e8
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x4
	.byte	0
	.uleb128 0x12
	.4byte	0x3d8
	.uleb128 0x10
	.4byte	0x3e8
	.uleb128 0x6
	.4byte	0x95
	.4byte	0x402
	.uleb128 0x7
	.4byte	0x7d
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	0x95
	.4byte	0x412
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x5c
	.byte	0
	.uleb128 0x6
	.4byte	0x95
	.4byte	0x422
	.uleb128 0x7
	.4byte	0x7d
	.byte	0xe
	.byte	0
	.uleb128 0x6
	.4byte	0x95
	.4byte	0x432
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x5
	.byte	0
	.uleb128 0x14
	.4byte	.LASF60
	.byte	0x5
	.2byte	0x1fb
	.byte	0x3
	.4byte	0xb0
	.uleb128 0x6
	.4byte	0x95
	.4byte	0x44f
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.4byte	0xa1
	.4byte	0x45f
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x3
	.byte	0
	.uleb128 0x10
	.4byte	0x44f
	.uleb128 0x6
	.4byte	0x95
	.4byte	0x474
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x9
	.byte	0
	.uleb128 0x1c
	.byte	0xac
	.2byte	0x351
	.4byte	0x63d
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x6
	.2byte	0x353
	.byte	0x13
	.4byte	0xa1
	.byte	0
	.uleb128 0x1
	.4byte	.LASF62
	.byte	0x6
	.2byte	0x354
	.byte	0x13
	.4byte	0xa1
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0x6
	.2byte	0x355
	.byte	0x13
	.4byte	0xa1
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x6
	.2byte	0x356
	.byte	0x13
	.4byte	0xa1
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0x6
	.2byte	0x357
	.byte	0x13
	.4byte	0xa1
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x6
	.2byte	0x358
	.byte	0x13
	.4byte	0xa1
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x6
	.2byte	0x359
	.byte	0xa
	.4byte	0x43f
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x6
	.2byte	0x35a
	.byte	0x13
	.4byte	0xa1
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x6
	.2byte	0x35b
	.byte	0x13
	.4byte	0xa1
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF70
	.byte	0x6
	.2byte	0x35c
	.byte	0x13
	.4byte	0xa1
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF71
	.byte	0x6
	.2byte	0x35d
	.byte	0x13
	.4byte	0xa1
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0x6
	.2byte	0x35e
	.byte	0x13
	.4byte	0xa1
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x6
	.2byte	0x35f
	.byte	0x13
	.4byte	0xa1
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x6
	.2byte	0x360
	.byte	0xa
	.4byte	0x43f
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF75
	.byte	0x6
	.2byte	0x361
	.byte	0x13
	.4byte	0xa1
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0x6
	.2byte	0x362
	.byte	0x13
	.4byte	0xa1
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF77
	.byte	0x6
	.2byte	0x363
	.byte	0x13
	.4byte	0xa1
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0x6
	.2byte	0x364
	.byte	0x13
	.4byte	0xa1
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x6
	.2byte	0x365
	.byte	0x13
	.4byte	0xa1
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF80
	.byte	0x6
	.2byte	0x366
	.byte	0x13
	.4byte	0xa1
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x6
	.2byte	0x367
	.byte	0xa
	.4byte	0x464
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF81
	.byte	0x6
	.2byte	0x368
	.byte	0x13
	.4byte	0xa1
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF82
	.byte	0x6
	.2byte	0x369
	.byte	0x13
	.4byte	0xa1
	.byte	0x84
	.uleb128 0xb
	.ascii	"PR1\000"
	.byte	0x6
	.2byte	0x36a
	.byte	0x13
	.4byte	0xa1
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0x6
	.2byte	0x36b
	.byte	0xa
	.4byte	0x95
	.byte	0x8c
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0x6
	.2byte	0x36c
	.byte	0x13
	.4byte	0xa1
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF84
	.byte	0x6
	.2byte	0x36d
	.byte	0x13
	.4byte	0xa1
	.byte	0x94
	.uleb128 0xb
	.ascii	"PR2\000"
	.byte	0x6
	.2byte	0x36e
	.byte	0x13
	.4byte	0xa1
	.byte	0x98
	.uleb128 0x1
	.4byte	.LASF41
	.byte	0x6
	.2byte	0x36f
	.byte	0xa
	.4byte	0x95
	.byte	0x9c
	.uleb128 0x1
	.4byte	.LASF85
	.byte	0x6
	.2byte	0x370
	.byte	0x13
	.4byte	0xa1
	.byte	0xa0
	.uleb128 0x1
	.4byte	.LASF86
	.byte	0x6
	.2byte	0x371
	.byte	0x13
	.4byte	0xa1
	.byte	0xa4
	.uleb128 0xb
	.ascii	"PR3\000"
	.byte	0x6
	.2byte	0x372
	.byte	0x13
	.4byte	0xa1
	.byte	0xa8
	.byte	0
	.uleb128 0x14
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x373
	.byte	0x2
	.4byte	0x474
	.uleb128 0x1b
	.2byte	0x348
	.byte	0x6
	.2byte	0x41d
	.4byte	0x7f9
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x6
	.2byte	0x41f
	.byte	0xb
	.4byte	0x95
	.byte	0
	.uleb128 0x1
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x420
	.byte	0x14
	.4byte	0xa1
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF89
	.byte	0x6
	.2byte	0x421
	.byte	0x14
	.4byte	0x45f
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF90
	.byte	0x6
	.2byte	0x422
	.byte	0x14
	.4byte	0xa1
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x6
	.2byte	0x423
	.byte	0xb
	.4byte	0x95
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x424
	.byte	0x14
	.4byte	0xa1
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x425
	.byte	0x14
	.4byte	0xa1
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x426
	.byte	0x14
	.4byte	0xa1
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF94
	.byte	0x6
	.2byte	0x427
	.byte	0x14
	.4byte	0xa1
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x6
	.2byte	0x428
	.byte	0xc
	.4byte	0x7f9
	.byte	0x30
	.uleb128 0x2
	.4byte	.LASF95
	.byte	0x6
	.2byte	0x429
	.byte	0x15
	.4byte	0xa1
	.2byte	0x124
	.uleb128 0x2
	.4byte	.LASF37
	.byte	0x6
	.2byte	0x42a
	.byte	0xc
	.4byte	0x809
	.2byte	0x128
	.uleb128 0x9
	.ascii	"UR0\000"
	.2byte	0x42b
	.4byte	0xa1
	.2byte	0x300
	.uleb128 0x9
	.ascii	"UR1\000"
	.2byte	0x42c
	.4byte	0xa1
	.2byte	0x304
	.uleb128 0x9
	.ascii	"UR2\000"
	.2byte	0x42d
	.4byte	0xa1
	.2byte	0x308
	.uleb128 0x9
	.ascii	"UR3\000"
	.2byte	0x42e
	.4byte	0xa1
	.2byte	0x30c
	.uleb128 0x9
	.ascii	"UR4\000"
	.2byte	0x42f
	.4byte	0xa1
	.2byte	0x310
	.uleb128 0x9
	.ascii	"UR5\000"
	.2byte	0x430
	.4byte	0xa1
	.2byte	0x314
	.uleb128 0x9
	.ascii	"UR6\000"
	.2byte	0x431
	.4byte	0xa1
	.2byte	0x318
	.uleb128 0x9
	.ascii	"UR7\000"
	.2byte	0x432
	.4byte	0xa1
	.2byte	0x31c
	.uleb128 0x9
	.ascii	"UR8\000"
	.2byte	0x433
	.4byte	0xa1
	.2byte	0x320
	.uleb128 0x9
	.ascii	"UR9\000"
	.2byte	0x434
	.4byte	0xa1
	.2byte	0x324
	.uleb128 0x2
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x435
	.byte	0x14
	.4byte	0xa1
	.2byte	0x328
	.uleb128 0x2
	.4byte	.LASF97
	.byte	0x6
	.2byte	0x436
	.byte	0x14
	.4byte	0xa1
	.2byte	0x32c
	.uleb128 0x2
	.4byte	.LASF98
	.byte	0x6
	.2byte	0x437
	.byte	0x14
	.4byte	0xa1
	.2byte	0x330
	.uleb128 0x2
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x438
	.byte	0x14
	.4byte	0xa1
	.2byte	0x334
	.uleb128 0x2
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x439
	.byte	0x14
	.4byte	0xa1
	.2byte	0x338
	.uleb128 0x2
	.4byte	.LASF101
	.byte	0x6
	.2byte	0x43a
	.byte	0x14
	.4byte	0xa1
	.2byte	0x33c
	.uleb128 0x2
	.4byte	.LASF102
	.byte	0x6
	.2byte	0x43b
	.byte	0x14
	.4byte	0xa1
	.2byte	0x340
	.uleb128 0x2
	.4byte	.LASF103
	.byte	0x6
	.2byte	0x43c
	.byte	0x14
	.4byte	0xa1
	.2byte	0x344
	.byte	0
	.uleb128 0x6
	.4byte	0x95
	.4byte	0x809
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x3c
	.byte	0
	.uleb128 0x6
	.4byte	0x95
	.4byte	0x819
	.uleb128 0x7
	.4byte	0x7d
	.byte	0x75
	.byte	0
	.uleb128 0x14
	.4byte	.LASF104
	.byte	0x6
	.2byte	0x43e
	.byte	0x3
	.4byte	0x64a
	.uleb128 0x1c
	.byte	0x2c
	.2byte	0x4ba
	.4byte	0x8c9
	.uleb128 0xb
	.ascii	"CR1\000"
	.byte	0x6
	.2byte	0x4bc
	.byte	0x15
	.4byte	0xa1
	.byte	0
	.uleb128 0x1
	.4byte	.LASF105
	.byte	0x6
	.2byte	0x4bd
	.byte	0x15
	.4byte	0xa1
	.byte	0x4
	.uleb128 0xb
	.ascii	"CR2\000"
	.byte	0x6
	.2byte	0x4be
	.byte	0x15
	.4byte	0xa1
	.byte	0x8
	.uleb128 0xb
	.ascii	"CR3\000"
	.byte	0x6
	.2byte	0x4bf
	.byte	0x15
	.4byte	0xa1
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF106
	.byte	0x6
	.2byte	0x4c0
	.byte	0x15
	.4byte	0xa1
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x6
	.2byte	0x4c1
	.byte	0x11
	.4byte	0x95
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF107
	.byte	0x6
	.2byte	0x4c2
	.byte	0x15
	.4byte	0xa1
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x6
	.2byte	0x4c3
	.byte	0x11
	.4byte	0x95
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF108
	.byte	0x6
	.2byte	0x4c4
	.byte	0x15
	.4byte	0xa1
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF109
	.byte	0x6
	.2byte	0x4c5
	.byte	0x15
	.4byte	0xa1
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF110
	.byte	0x6
	.2byte	0x4c6
	.byte	0x15
	.4byte	0xa1
	.byte	0x28
	.byte	0
	.uleb128 0x14
	.4byte	.LASF111
	.byte	0x6
	.2byte	0x4c7
	.byte	0x3
	.4byte	0x826
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.4byte	.LASF112
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF113
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.4byte	.LASF114
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.4byte	.LASF115
	.uleb128 0x25
	.byte	0x1
	.4byte	0x40
	.byte	0x7
	.byte	0x28
	.byte	0x1
	.4byte	0x918
	.uleb128 0x15
	.4byte	.LASF116
	.byte	0
	.uleb128 0x15
	.4byte	.LASF117
	.byte	0x1
	.uleb128 0x15
	.4byte	.LASF118
	.byte	0x2
	.uleb128 0x15
	.4byte	.LASF119
	.byte	0x3
	.byte	0
	.uleb128 0xf
	.4byte	.LASF120
	.byte	0x7
	.byte	0x2d
	.byte	0x3
	.4byte	0x8f2
	.uleb128 0x1d
	.byte	0x8
	.byte	0x2d
	.4byte	0x942
	.uleb128 0x13
	.4byte	.LASF121
	.byte	0x2f
	.4byte	0x95
	.byte	0
	.uleb128 0x13
	.4byte	.LASF122
	.byte	0x34
	.4byte	0x95
	.byte	0x4
	.byte	0
	.uleb128 0xf
	.4byte	.LASF123
	.byte	0x8
	.byte	0x38
	.byte	0x2
	.4byte	0x924
	.uleb128 0x1d
	.byte	0xc
	.byte	0x3d
	.4byte	0x977
	.uleb128 0x13
	.4byte	.LASF124
	.byte	0x3f
	.4byte	0x95
	.byte	0
	.uleb128 0x13
	.4byte	.LASF125
	.byte	0x44
	.4byte	0x95
	.byte	0x4
	.uleb128 0x13
	.4byte	.LASF126
	.byte	0x49
	.4byte	0x95
	.byte	0x8
	.byte	0
	.uleb128 0xf
	.4byte	.LASF127
	.byte	0x8
	.byte	0x4d
	.byte	0x2
	.4byte	0x94e
	.uleb128 0x26
	.4byte	.LASF194
	.byte	0x9
	.2byte	0x2c6
	.byte	0x6
	.uleb128 0x27
	.4byte	.LASF195
	.byte	0xa
	.2byte	0x433
	.byte	0xa
	.4byte	0x95
	.uleb128 0x4
	.4byte	.LASF128
	.2byte	0x853
	.byte	0x1c
	.4byte	.LFB374
	.4byte	.LFE374-.LFB374
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF131
	.2byte	0x7fe
	.4byte	.LFB373
	.4byte	.LFE373-.LFB373
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9d3
	.uleb128 0x3
	.4byte	.LVL98
	.4byte	0x983
	.uleb128 0x3
	.4byte	.LVL99
	.4byte	0x999
	.byte	0
	.uleb128 0x4
	.4byte	.LASF129
	.2byte	0x7f3
	.byte	0x6
	.4byte	.LFB372
	.4byte	.LFE372-.LFB372
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF130
	.2byte	0x7e9
	.byte	0x6
	.4byte	.LFB371
	.4byte	.LFE371-.LFB371
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF132
	.2byte	0x7b8
	.4byte	.LFB370
	.4byte	.LFE370-.LFB370
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa1b
	.uleb128 0xd
	.4byte	.LASF142
	.2byte	0x7b8
	.byte	0x2d
	.4byte	0xa1b
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x1e
	.4byte	0x942
	.uleb128 0x8
	.4byte	.LASF133
	.2byte	0x779
	.byte	0xa
	.4byte	0x95
	.4byte	.LFB369
	.4byte	.LFE369-.LFB369
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa57
	.uleb128 0x18
	.4byte	.LASF135
	.byte	0x1
	.2byte	0x77b
	.4byte	0x95
	.uleb128 0xa
	.4byte	.LASF137
	.2byte	0x77b
	.byte	0x17
	.4byte	0x95
	.4byte	.LLST27
	.byte	0
	.uleb128 0x8
	.4byte	.LASF134
	.2byte	0x75a
	.byte	0xa
	.4byte	0x95
	.4byte	.LFB368
	.4byte	.LFE368-.LFB368
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa8e
	.uleb128 0x18
	.4byte	.LASF136
	.byte	0x1
	.2byte	0x75c
	.4byte	0x95
	.uleb128 0xa
	.4byte	.LASF137
	.2byte	0x75c
	.byte	0x17
	.4byte	0x95
	.4byte	.LLST26
	.byte	0
	.uleb128 0x4
	.4byte	.LASF138
	.2byte	0x74f
	.byte	0x6
	.4byte	.LFB367
	.4byte	.LFE367-.LFB367
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF139
	.2byte	0x745
	.byte	0x6
	.4byte	.LFB366
	.4byte	.LFE366-.LFB366
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF140
	.2byte	0x6eb
	.byte	0x6
	.4byte	.LFB365
	.4byte	.LFE365-.LFB365
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF141
	.2byte	0x6db
	.4byte	.LFB364
	.4byte	.LFE364-.LFB364
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xae8
	.uleb128 0xd
	.4byte	.LASF143
	.2byte	0x6db
	.byte	0x30
	.4byte	0x95
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x4
	.4byte	.LASF144
	.2byte	0x6cb
	.byte	0x6
	.4byte	.LFB363
	.4byte	.LFE363-.LFB363
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF145
	.2byte	0x6c1
	.byte	0x6
	.4byte	.LFB362
	.4byte	.LFE362-.LFB362
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF146
	.2byte	0x6a7
	.byte	0x13
	.4byte	0x918
	.4byte	.LFB361
	.4byte	.LFE361-.LFB361
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb49
	.uleb128 0xa
	.4byte	.LASF147
	.2byte	0x6a9
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST25
	.uleb128 0x3
	.4byte	.LVL88
	.4byte	0x98c
	.uleb128 0x3
	.4byte	.LVL90
	.4byte	0x98c
	.byte	0
	.uleb128 0x8
	.4byte	.LASF148
	.2byte	0x68d
	.byte	0x13
	.4byte	0x918
	.4byte	.LFB360
	.4byte	.LFE360-.LFB360
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb86
	.uleb128 0xa
	.4byte	.LASF147
	.2byte	0x68f
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST24
	.uleb128 0x3
	.4byte	.LVL84
	.4byte	0x98c
	.uleb128 0x3
	.4byte	.LVL86
	.4byte	0x98c
	.byte	0
	.uleb128 0x8
	.4byte	.LASF149
	.2byte	0x673
	.byte	0x13
	.4byte	0x918
	.4byte	.LFB359
	.4byte	.LFE359-.LFB359
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbc3
	.uleb128 0xa
	.4byte	.LASF147
	.2byte	0x675
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST23
	.uleb128 0x3
	.4byte	.LVL80
	.4byte	0x98c
	.uleb128 0x3
	.4byte	.LVL82
	.4byte	0x98c
	.byte	0
	.uleb128 0x8
	.4byte	.LASF150
	.2byte	0x659
	.byte	0x13
	.4byte	0x918
	.4byte	.LFB358
	.4byte	.LFE358-.LFB358
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc00
	.uleb128 0xa
	.4byte	.LASF147
	.2byte	0x65b
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST22
	.uleb128 0x3
	.4byte	.LVL76
	.4byte	0x98c
	.uleb128 0x3
	.4byte	.LVL78
	.4byte	0x98c
	.byte	0
	.uleb128 0x4
	.4byte	.LASF151
	.2byte	0x600
	.byte	0x1c
	.4byte	.LFB357
	.4byte	.LFE357-.LFB357
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF152
	.2byte	0x5f4
	.byte	0x1c
	.4byte	.LFB356
	.4byte	.LFE356-.LFB356
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF153
	.2byte	0x5e8
	.byte	0x1c
	.4byte	.LFB355
	.4byte	.LFE355-.LFB355
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF154
	.2byte	0x5dc
	.byte	0x1c
	.4byte	.LFB354
	.4byte	.LFE354-.LFB354
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF155
	.2byte	0x5d0
	.byte	0x1c
	.4byte	.LFB353
	.4byte	.LFE353-.LFB353
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF156
	.2byte	0x5c5
	.byte	0x1c
	.4byte	.LFB352
	.4byte	.LFE352-.LFB352
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF157
	.2byte	0x588
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcb8
	.uleb128 0x3
	.4byte	.LVL70
	.4byte	0xc12
	.uleb128 0x3
	.4byte	.LVL71
	.4byte	0xc5a
	.uleb128 0x3
	.4byte	.LVL72
	.4byte	0xc48
	.uleb128 0x3
	.4byte	.LVL73
	.4byte	0xc36
	.uleb128 0x3
	.4byte	.LVL74
	.4byte	0xc24
	.uleb128 0x3
	.4byte	.LVL75
	.4byte	0xc00
	.byte	0
	.uleb128 0x8
	.4byte	.LASF158
	.2byte	0x572
	.byte	0x13
	.4byte	0x918
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xce3
	.uleb128 0x11
	.4byte	.LASF159
	.2byte	0x572
	.byte	0x37
	.4byte	0x95
	.4byte	.LLST21
	.byte	0
	.uleb128 0x8
	.4byte	.LASF160
	.2byte	0x559
	.byte	0xa
	.4byte	0x95
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd0e
	.uleb128 0x11
	.4byte	.LASF159
	.2byte	0x559
	.byte	0x2c
	.4byte	0x95
	.4byte	.LLST20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF161
	.2byte	0x540
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd32
	.uleb128 0xd
	.4byte	.LASF124
	.2byte	0x540
	.byte	0x2b
	.4byte	0x95
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF162
	.2byte	0x516
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe88
	.uleb128 0xd
	.4byte	.LASF163
	.2byte	0x516
	.byte	0x39
	.4byte	0xe88
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xa
	.4byte	.LASF164
	.2byte	0x518
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST6
	.uleb128 0xa
	.4byte	.LASF165
	.2byte	0x519
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST7
	.uleb128 0x28
	.4byte	.LASF166
	.byte	0x1
	.2byte	0x51a
	.byte	0x12
	.4byte	0xab
	.4byte	0x30000
	.uleb128 0x16
	.4byte	0x10b0
	.4byte	.LBB26
	.4byte	.LBE26-.LBB26
	.2byte	0x522
	.byte	0x2e
	.4byte	0xda9
	.uleb128 0xe
	.4byte	0x10c0
	.4byte	.LLST8
	.uleb128 0x17
	.4byte	0x10cc
	.byte	0
	.uleb128 0x19
	.4byte	0x1093
	.4byte	.LBB28
	.4byte	.LLRL9
	.2byte	0x522
	.byte	0x2e
	.4byte	0xdc7
	.uleb128 0xe
	.4byte	0x10a3
	.4byte	.LLST10
	.byte	0
	.uleb128 0x16
	.4byte	0x10b0
	.4byte	.LBB31
	.4byte	.LBE31-.LBB31
	.2byte	0x523
	.byte	0x2b
	.4byte	0xdea
	.uleb128 0xe
	.4byte	0x10c0
	.4byte	.LLST11
	.uleb128 0x17
	.4byte	0x10cc
	.byte	0
	.uleb128 0x19
	.4byte	0x1093
	.4byte	.LBB33
	.4byte	.LLRL12
	.2byte	0x523
	.byte	0x2b
	.4byte	0xe08
	.uleb128 0xe
	.4byte	0x10a3
	.4byte	.LLST13
	.byte	0
	.uleb128 0x16
	.4byte	0x10b0
	.4byte	.LBB36
	.4byte	.LBE36-.LBB36
	.2byte	0x526
	.byte	0x25
	.4byte	0xe2b
	.uleb128 0xe
	.4byte	0x10c0
	.4byte	.LLST14
	.uleb128 0x17
	.4byte	0x10cc
	.byte	0
	.uleb128 0x19
	.4byte	0x1093
	.4byte	.LBB38
	.4byte	.LLRL15
	.2byte	0x526
	.byte	0x25
	.4byte	0xe49
	.uleb128 0xe
	.4byte	0x10a3
	.4byte	.LLST16
	.byte	0
	.uleb128 0x16
	.4byte	0x10b0
	.4byte	.LBB41
	.4byte	.LBE41-.LBB41
	.2byte	0x527
	.byte	0x1f
	.4byte	0xe6c
	.uleb128 0xe
	.4byte	0x10c0
	.4byte	.LLST17
	.uleb128 0x17
	.4byte	0x10cc
	.byte	0
	.uleb128 0x29
	.4byte	0x1093
	.4byte	.LBB43
	.4byte	.LLRL18
	.byte	0x1
	.2byte	0x527
	.byte	0x1f
	.uleb128 0xe
	.4byte	0x10a3
	.4byte	.LLST19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x977
	.uleb128 0x4
	.4byte	.LASF167
	.2byte	0x4ca
	.byte	0x6
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF168
	.2byte	0x4bc
	.byte	0x6
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF169
	.2byte	0x439
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xed5
	.uleb128 0xd
	.4byte	.LASF170
	.2byte	0x439
	.byte	0x29
	.4byte	0x95
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xc
	.4byte	.LASF171
	.2byte	0x3da
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xef9
	.uleb128 0xd
	.4byte	.LASF172
	.2byte	0x3da
	.byte	0x2b
	.4byte	0x95
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x4
	.4byte	.LASF173
	.2byte	0x3ab
	.byte	0x6
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF174
	.2byte	0x330
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf6b
	.uleb128 0xd
	.4byte	.LASF175
	.2byte	0x330
	.byte	0x28
	.4byte	0x95
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xd
	.4byte	.LASF176
	.2byte	0x330
	.byte	0x3b
	.4byte	0x84
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x11
	.4byte	.LASF172
	.2byte	0x330
	.byte	0x4f
	.4byte	0x95
	.4byte	.LLST5
	.uleb128 0x1f
	.4byte	0x10d9
	.4byte	.LBB22
	.4byte	.LBE22-.LBB22
	.2byte	0x350
	.uleb128 0x1f
	.4byte	0x10e0
	.4byte	.LBB24
	.4byte	.LBE24-.LBB24
	.2byte	0x351
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF179
	.2byte	0x229
	.4byte	0x95
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF177
	.2byte	0x21a
	.byte	0x13
	.4byte	0x918
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfab
	.uleb128 0x11
	.4byte	.LASF178
	.2byte	0x21a
	.byte	0x45
	.4byte	0x95
	.4byte	.LLST4
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF180
	.2byte	0x200
	.4byte	0x95
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF181
	.2byte	0x19d
	.byte	0x13
	.4byte	0x918
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1031
	.uleb128 0x11
	.4byte	.LASF178
	.2byte	0x19d
	.byte	0x3d
	.4byte	0x95
	.4byte	.LLST2
	.uleb128 0xa
	.4byte	.LASF147
	.2byte	0x19f
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST3
	.uleb128 0x3
	.4byte	.LVL11
	.4byte	0x98c
	.uleb128 0x3
	.4byte	.LVL13
	.4byte	0x98c
	.uleb128 0x3
	.4byte	.LVL17
	.4byte	0x98c
	.uleb128 0x3
	.4byte	.LVL19
	.4byte	0x98c
	.uleb128 0x3
	.4byte	.LVL21
	.4byte	0x98c
	.uleb128 0x3
	.4byte	.LVL23
	.4byte	0x98c
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF182
	.2byte	0x181
	.4byte	0x95
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF183
	.2byte	0x139
	.byte	0x13
	.4byte	0x918
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1093
	.uleb128 0x11
	.4byte	.LASF184
	.2byte	0x139
	.byte	0x34
	.4byte	0x95
	.4byte	.LLST0
	.uleb128 0xa
	.4byte	.LASF147
	.2byte	0x13b
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST1
	.uleb128 0x3
	.4byte	.LVL3
	.4byte	0x98c
	.uleb128 0x3
	.4byte	.LVL5
	.4byte	0x98c
	.byte	0
	.uleb128 0x20
	.4byte	.LASF185
	.2byte	0x436
	.byte	0x36
	.4byte	0x84
	.4byte	0x10b0
	.uleb128 0x21
	.4byte	.LASF187
	.2byte	0x436
	.byte	0x45
	.4byte	0x95
	.byte	0
	.uleb128 0x20
	.4byte	.LASF186
	.2byte	0x418
	.byte	0x37
	.4byte	0x95
	.4byte	0x10d9
	.uleb128 0x21
	.4byte	.LASF187
	.2byte	0x418
	.byte	0x47
	.4byte	0x95
	.uleb128 0x18
	.4byte	.LASF188
	.byte	0x2
	.2byte	0x41a
	.4byte	0x95
	.byte	0
	.uleb128 0x22
	.4byte	.LASF189
	.2byte	0x3b0
	.uleb128 0x22
	.4byte	.LASF190
	.2byte	0x3a5
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
	.uleb128 0xb
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
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
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
	.uleb128 0xd
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
	.uleb128 0x21
	.sleb128 6
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0
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
	.sleb128 10
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 5
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 51
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x26
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
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
.LLST27:
	.byte	0x8
	.4byte	.LVL95
	.uleb128 .LVL96-.LVL95
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST26:
	.byte	0x8
	.4byte	.LVL93
	.uleb128 .LVL94-.LVL93
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST25:
	.byte	0x8
	.4byte	.LVL89
	.uleb128 .LVL91-.LVL89
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST24:
	.byte	0x8
	.4byte	.LVL85
	.uleb128 .LVL87-.LVL85
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST23:
	.byte	0x8
	.4byte	.LVL81
	.uleb128 .LVL83-.LVL81
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST22:
	.byte	0x8
	.4byte	.LVL77
	.uleb128 .LVL79-.LVL77
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST21:
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
	.uleb128 .LFE350-.LVL66
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
	.uleb128 .LVL65-.LVL64
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL65-.LVL64
	.uleb128 .LFE349-.LVL64
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL54-.LVL46
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL59-.LVL46
	.uleb128 .LFE347-.LVL46
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST7:
	.byte	0x8
	.4byte	.LVL52
	.uleb128 .LVL53-.LVL52
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST8:
	.byte	0x8
	.4byte	.LVL40
	.uleb128 .LVL41-.LVL40
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL41
	.byte	0x4
	.uleb128 .LVL41-.LVL41
	.uleb128 .LVL42-.LVL41
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL55-.LVL41
	.uleb128 .LVL56-.LVL41
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST11:
	.byte	0x8
	.4byte	.LVL43
	.uleb128 .LVL44-.LVL43
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL45-.LVL44
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL57-.LVL44
	.uleb128 .LVL58-.LVL44
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST14:
	.byte	0x8
	.4byte	.LVL46
	.uleb128 .LVL47-.LVL46
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST16:
	.byte	0x6
	.4byte	.LVL47
	.byte	0x4
	.uleb128 .LVL47-.LVL47
	.uleb128 .LVL48-.LVL47
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL59-.LVL47
	.uleb128 .LVL60-.LVL47
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST17:
	.byte	0x8
	.4byte	.LVL49
	.uleb128 .LVL50-.LVL49
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL50
	.byte	0x4
	.uleb128 .LVL50-.LVL50
	.uleb128 .LVL51-.LVL50
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL61-.LVL50
	.uleb128 .LVL62-.LVL50
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL30
	.byte	0x4
	.uleb128 .LVL30-.LVL30
	.uleb128 .LVL31-.LVL30
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL31-.LVL30
	.uleb128 .LVL32-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL32-.LVL30
	.uleb128 .LVL33-.LVL30
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL33-.LVL30
	.uleb128 .LVL34-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL34-.LVL30
	.uleb128 .LVL35-.LVL30
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL35-.LVL30
	.uleb128 .LFE341-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL28
	.byte	0x4
	.uleb128 .LVL28-.LVL28
	.uleb128 .LVL29-.LVL28
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL29-.LVL28
	.uleb128 .LFE339-.LVL28
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL8
	.byte	0x4
	.uleb128 .LVL8-.LVL8
	.uleb128 .LVL9-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL9-.LVL8
	.uleb128 .LVL10-.LVL8
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL10-.LVL8
	.uleb128 .LVL11-1-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL11-1-.LVL8
	.uleb128 .LVL12-.LVL8
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL12-.LVL8
	.uleb128 .LVL14-.LVL8
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL8
	.uleb128 .LVL15-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL15-.LVL8
	.uleb128 .LVL16-.LVL8
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL16-.LVL8
	.uleb128 .LVL20-.LVL8
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL20-.LVL8
	.uleb128 .LVL21-1-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL21-1-.LVL8
	.uleb128 .LVL24-.LVL8
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL24-.LVL8
	.uleb128 .LVL26-.LVL8
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL26-.LVL8
	.uleb128 .LVL27-.LVL8
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL27-.LVL8
	.uleb128 .LFE337-.LVL8
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL12
	.byte	0x4
	.uleb128 .LVL12-.LVL12
	.uleb128 .LVL14-.LVL12
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL18-.LVL12
	.uleb128 .LVL20-.LVL12
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL22-.LVL12
	.uleb128 .LVL24-.LVL12
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL24-.LVL12
	.uleb128 .LVL25-.LVL12
	.uleb128 0x1
	.byte	0x54
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
	.uleb128 .LVL2-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-1-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-1-.LVL0
	.uleb128 .LVL6-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL0
	.uleb128 .LVL7-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x8
	.4byte	.LVL4
	.uleb128 .LVL6-.LVL4
	.uleb128 0x1
	.byte	0x54
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x154
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
	.4byte	.LFB352
	.4byte	.LFE352-.LFB352
	.4byte	.LFB353
	.4byte	.LFE353-.LFB353
	.4byte	.LFB354
	.4byte	.LFE354-.LFB354
	.4byte	.LFB355
	.4byte	.LFE355-.LFB355
	.4byte	.LFB356
	.4byte	.LFE356-.LFB356
	.4byte	.LFB357
	.4byte	.LFE357-.LFB357
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
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
	.4byte	.LFB366
	.4byte	.LFE366-.LFB366
	.4byte	.LFB367
	.4byte	.LFE367-.LFB367
	.4byte	.LFB368
	.4byte	.LFE368-.LFB368
	.4byte	.LFB369
	.4byte	.LFE369-.LFB369
	.4byte	.LFB370
	.4byte	.LFE370-.LFB370
	.4byte	.LFB371
	.4byte	.LFE371-.LFB371
	.4byte	.LFB372
	.4byte	.LFE372-.LFB372
	.4byte	.LFB374
	.4byte	.LFE374-.LFB374
	.4byte	.LFB373
	.4byte	.LFE373-.LFB373
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
.LLRL9:
	.byte	0x5
	.4byte	.LBB28
	.byte	0x4
	.uleb128 .LBB28-.LBB28
	.uleb128 .LBE28-.LBB28
	.byte	0x4
	.uleb128 .LBB46-.LBB28
	.uleb128 .LBE46-.LBB28
	.byte	0
.LLRL12:
	.byte	0x5
	.4byte	.LBB33
	.byte	0x4
	.uleb128 .LBB33-.LBB33
	.uleb128 .LBE33-.LBB33
	.byte	0x4
	.uleb128 .LBB47-.LBB33
	.uleb128 .LBE47-.LBB33
	.byte	0
.LLRL15:
	.byte	0x5
	.4byte	.LBB38
	.byte	0x4
	.uleb128 .LBB38-.LBB38
	.uleb128 .LBE38-.LBB38
	.byte	0x4
	.uleb128 .LBB48-.LBB38
	.uleb128 .LBE48-.LBB38
	.byte	0
.LLRL18:
	.byte	0x5
	.4byte	.LBB43
	.byte	0x4
	.uleb128 .LBB43-.LBB43
	.uleb128 .LBE43-.LBB43
	.byte	0x4
	.uleb128 .LBB49-.LBB43
	.uleb128 .LBE49-.LBB43
	.byte	0
.LLRL28:
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
	.4byte	.LFB352
	.uleb128 .LFE352-.LFB352
	.byte	0x7
	.4byte	.LFB353
	.uleb128 .LFE353-.LFB353
	.byte	0x7
	.4byte	.LFB354
	.uleb128 .LFE354-.LFB354
	.byte	0x7
	.4byte	.LFB355
	.uleb128 .LFE355-.LFB355
	.byte	0x7
	.4byte	.LFB356
	.uleb128 .LFE356-.LFB356
	.byte	0x7
	.4byte	.LFB357
	.uleb128 .LFE357-.LFB357
	.byte	0x7
	.4byte	.LFB351
	.uleb128 .LFE351-.LFB351
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
	.byte	0x7
	.4byte	.LFB366
	.uleb128 .LFE366-.LFB366
	.byte	0x7
	.4byte	.LFB367
	.uleb128 .LFE367-.LFB367
	.byte	0x7
	.4byte	.LFB368
	.uleb128 .LFE368-.LFB368
	.byte	0x7
	.4byte	.LFB369
	.uleb128 .LFE369-.LFB369
	.byte	0x7
	.4byte	.LFB370
	.uleb128 .LFE370-.LFB370
	.byte	0x7
	.4byte	.LFB371
	.uleb128 .LFE371-.LFB371
	.byte	0x7
	.4byte	.LFB372
	.uleb128 .LFE372-.LFB372
	.byte	0x7
	.4byte	.LFB374
	.uleb128 .LFE374-.LFB374
	.byte	0x7
	.4byte	.LFB373
	.uleb128 .LFE373-.LFB373
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF184:
	.ascii	"SupplySource\000"
.LASF80:
	.ascii	"D3PCR3H\000"
.LASF79:
	.ascii	"D3PCR3L\000"
.LASF57:
	.ascii	"AHBSCR\000"
.LASF156:
	.ascii	"HAL_PWREx_WKUP1_Callback\000"
.LASF130:
	.ascii	"HAL_PWREx_EnableAVD\000"
.LASF155:
	.ascii	"HAL_PWREx_WKUP2_Callback\000"
.LASF154:
	.ascii	"HAL_PWREx_WKUP3_Callback\000"
.LASF153:
	.ascii	"HAL_PWREx_WKUP4_Callback\000"
.LASF152:
	.ascii	"HAL_PWREx_WKUP5_Callback\000"
.LASF133:
	.ascii	"HAL_PWREx_GetVBATLevel\000"
.LASF82:
	.ascii	"EMR1\000"
.LASF84:
	.ascii	"EMR2\000"
.LASF86:
	.ascii	"EMR3\000"
.LASF5:
	.ascii	"__uint8_t\000"
.LASF118:
	.ascii	"HAL_BUSY\000"
.LASF36:
	.ascii	"STIR\000"
.LASF135:
	.ascii	"VBATLevel\000"
.LASF62:
	.ascii	"FTSR1\000"
.LASF45:
	.ascii	"DCIMVAC\000"
.LASF76:
	.ascii	"FTSR3\000"
.LASF138:
	.ascii	"HAL_PWREx_DisableMonitoring\000"
.LASF161:
	.ascii	"HAL_PWREx_DisableWakeUpPin\000"
.LASF31:
	.ascii	"CLIDR\000"
.LASF166:
	.ascii	"pullMask\000"
.LASF174:
	.ascii	"HAL_PWREx_EnterSTOPMode\000"
.LASF13:
	.ascii	"CPUID\000"
.LASF63:
	.ascii	"SWIER1\000"
.LASF70:
	.ascii	"SWIER2\000"
.LASF77:
	.ascii	"SWIER3\000"
.LASF25:
	.ascii	"ID_PFR\000"
.LASF51:
	.ascii	"DCCISW\000"
.LASF8:
	.ascii	"long long int\000"
.LASF1:
	.ascii	"signed char\000"
.LASF108:
	.ascii	"WKUPCR\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF144:
	.ascii	"HAL_PWREx_DisableUSBVoltageDetector\000"
.LASF111:
	.ascii	"PWR_TypeDef\000"
.LASF167:
	.ascii	"HAL_PWREx_DisableFlashPowerDown\000"
.LASF4:
	.ascii	"long int\000"
.LASF129:
	.ascii	"HAL_PWREx_DisableAVD\000"
.LASF54:
	.ascii	"DTCMCR\000"
.LASF127:
	.ascii	"PWREx_WakeupPinTypeDef\000"
.LASF168:
	.ascii	"HAL_PWREx_EnableFlashPowerDown\000"
.LASF64:
	.ascii	"D3PMR1\000"
.LASF121:
	.ascii	"AVDLevel\000"
.LASF115:
	.ascii	"double\000"
.LASF61:
	.ascii	"RTSR1\000"
.LASF42:
	.ascii	"ICIALLU\000"
.LASF186:
	.ascii	"__RBIT\000"
.LASF23:
	.ascii	"BFAR\000"
.LASF55:
	.ascii	"AHBPCR\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF69:
	.ascii	"FTSR2\000"
.LASF131:
	.ascii	"HAL_PWREx_PVD_AVD_IRQHandler\000"
.LASF137:
	.ascii	"regValue\000"
.LASF158:
	.ascii	"HAL_PWREx_ClearWakeupFlag\000"
.LASF60:
	.ascii	"SCB_Type\000"
.LASF134:
	.ascii	"HAL_PWREx_GetTemperatureLevel\000"
.LASF26:
	.ascii	"ID_DFR\000"
.LASF149:
	.ascii	"HAL_PWREx_DisableBkUpReg\000"
.LASF48:
	.ascii	"DCCMVAC\000"
.LASF164:
	.ascii	"pinConfig\000"
.LASF187:
	.ascii	"value\000"
.LASF56:
	.ascii	"CACR\000"
.LASF33:
	.ascii	"CSSELR\000"
.LASF171:
	.ascii	"HAL_PWREx_EnterSTANDBYMode\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF110:
	.ascii	"WKUPEPR\000"
.LASF119:
	.ascii	"HAL_TIMEOUT\000"
.LASF47:
	.ascii	"DCCMVAU\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF106:
	.ascii	"CPUCR\000"
.LASF141:
	.ascii	"HAL_PWREx_EnableBatteryCharging\000"
.LASF143:
	.ascii	"ResistorValue\000"
.LASF116:
	.ascii	"HAL_OK\000"
.LASF15:
	.ascii	"VTOR\000"
.LASF50:
	.ascii	"DCCIMVAC\000"
.LASF132:
	.ascii	"HAL_PWREx_ConfigAVD\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF183:
	.ascii	"HAL_PWREx_ConfigSupply\000"
.LASF81:
	.ascii	"IMR1\000"
.LASF83:
	.ascii	"IMR2\000"
.LASF85:
	.ascii	"IMR3\000"
.LASF191:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF16:
	.ascii	"AIRCR\000"
.LASF21:
	.ascii	"DFSR\000"
.LASF53:
	.ascii	"ITCMCR\000"
.LASF22:
	.ascii	"MMFAR\000"
.LASF182:
	.ascii	"HAL_PWREx_GetSupplyConfig\000"
.LASF151:
	.ascii	"HAL_PWREx_WKUP6_Callback\000"
.LASF68:
	.ascii	"RTSR2\000"
.LASF120:
	.ascii	"HAL_StatusTypeDef\000"
.LASF75:
	.ascii	"RTSR3\000"
.LASF142:
	.ascii	"sConfigAVD\000"
.LASF59:
	.ascii	"ABFSR\000"
.LASF92:
	.ascii	"CCVR\000"
.LASF189:
	.ascii	"__DSB\000"
.LASF194:
	.ascii	"HAL_PWR_PVDCallback\000"
.LASF32:
	.ascii	"CCSIDR\000"
.LASF172:
	.ascii	"Domain\000"
.LASF139:
	.ascii	"HAL_PWREx_EnableMonitoring\000"
.LASF163:
	.ascii	"sPinParams\000"
.LASF192:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_pwr_ex.c\000"
.LASF94:
	.ascii	"PWRCR\000"
.LASF19:
	.ascii	"CFSR\000"
.LASF123:
	.ascii	"PWREx_AVDTypeDef\000"
.LASF27:
	.ascii	"ID_AFR\000"
.LASF195:
	.ascii	"HAL_GetTick\000"
.LASF109:
	.ascii	"WKUPFR\000"
.LASF190:
	.ascii	"__ISB\000"
.LASF136:
	.ascii	"tempLevel\000"
.LASF114:
	.ascii	"float\000"
.LASF38:
	.ascii	"MVFR0\000"
.LASF39:
	.ascii	"MVFR1\000"
.LASF40:
	.ascii	"MVFR2\000"
.LASF95:
	.ascii	"PKGR\000"
.LASF178:
	.ascii	"VoltageScaling\000"
.LASF67:
	.ascii	"RESERVED1\000"
.LASF74:
	.ascii	"RESERVED2\000"
.LASF35:
	.ascii	"RESERVED3\000"
.LASF37:
	.ascii	"RESERVED4\000"
.LASF41:
	.ascii	"RESERVED5\000"
.LASF43:
	.ascii	"RESERVED6\000"
.LASF52:
	.ascii	"RESERVED7\000"
.LASF58:
	.ascii	"RESERVED8\000"
.LASF150:
	.ascii	"HAL_PWREx_EnableBkUpReg\000"
.LASF104:
	.ascii	"SYSCFG_TypeDef\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF18:
	.ascii	"SHCSR\000"
.LASF165:
	.ascii	"regMask\000"
.LASF0:
	.ascii	"short int\000"
.LASF28:
	.ascii	"ID_MFR\000"
.LASF147:
	.ascii	"tickstart\000"
.LASF148:
	.ascii	"HAL_PWREx_EnableUSBReg\000"
.LASF146:
	.ascii	"HAL_PWREx_DisableUSBReg\000"
.LASF46:
	.ascii	"DCISW\000"
.LASF124:
	.ascii	"WakeUpPin\000"
.LASF30:
	.ascii	"RESERVED0\000"
.LASF169:
	.ascii	"HAL_PWREx_ConfigD3Domain\000"
.LASF88:
	.ascii	"PMCR\000"
.LASF173:
	.ascii	"HAL_PWREx_ClearPendingEvent\000"
.LASF91:
	.ascii	"CCCSR\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF107:
	.ascii	"D3CR\000"
.LASF24:
	.ascii	"AFSR\000"
.LASF117:
	.ascii	"HAL_ERROR\000"
.LASF65:
	.ascii	"D3PCR1L\000"
.LASF181:
	.ascii	"HAL_PWREx_ControlVoltageScaling\000"
.LASF112:
	.ascii	"long double\000"
.LASF113:
	.ascii	"char\000"
.LASF185:
	.ascii	"__CLZ\000"
.LASF128:
	.ascii	"HAL_PWREx_AVDCallback\000"
.LASF122:
	.ascii	"Mode\000"
.LASF44:
	.ascii	"ICIMVAU\000"
.LASF49:
	.ascii	"DCCSW\000"
.LASF177:
	.ascii	"HAL_PWREx_ControlStopModeVoltageScaling\000"
.LASF125:
	.ascii	"PinPolarity\000"
.LASF17:
	.ascii	"SHPR\000"
.LASF96:
	.ascii	"UR10\000"
.LASF97:
	.ascii	"UR11\000"
.LASF98:
	.ascii	"UR12\000"
.LASF99:
	.ascii	"UR13\000"
.LASF100:
	.ascii	"UR14\000"
.LASF101:
	.ascii	"UR15\000"
.LASF102:
	.ascii	"UR16\000"
.LASF103:
	.ascii	"UR17\000"
.LASF145:
	.ascii	"HAL_PWREx_EnableUSBVoltageDetector\000"
.LASF175:
	.ascii	"Regulator\000"
.LASF157:
	.ascii	"HAL_PWREx_WAKEUP_PIN_IRQHandler\000"
.LASF73:
	.ascii	"D3PCR2H\000"
.LASF72:
	.ascii	"D3PCR2L\000"
.LASF126:
	.ascii	"PinPull\000"
.LASF14:
	.ascii	"ICSR\000"
.LASF159:
	.ascii	"WakeUpFlag\000"
.LASF162:
	.ascii	"HAL_PWREx_EnableWakeUpPin\000"
.LASF11:
	.ascii	"uint8_t\000"
.LASF176:
	.ascii	"STOPEntry\000"
.LASF140:
	.ascii	"HAL_PWREx_DisableBatteryCharging\000"
.LASF29:
	.ascii	"ID_ISAR\000"
.LASF193:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF180:
	.ascii	"HAL_PWREx_GetVoltageRange\000"
.LASF160:
	.ascii	"HAL_PWREx_GetWakeupFlag\000"
.LASF179:
	.ascii	"HAL_PWREx_GetStopModeVoltageRange\000"
.LASF71:
	.ascii	"D3PMR2\000"
.LASF78:
	.ascii	"D3PMR3\000"
.LASF90:
	.ascii	"CFGR\000"
.LASF93:
	.ascii	"CCCR\000"
.LASF87:
	.ascii	"EXTI_TypeDef\000"
.LASF34:
	.ascii	"CPACR\000"
.LASF20:
	.ascii	"HFSR\000"
.LASF105:
	.ascii	"CSR1\000"
.LASF170:
	.ascii	"D3State\000"
.LASF188:
	.ascii	"result\000"
.LASF89:
	.ascii	"EXTICR\000"
.LASF66:
	.ascii	"D3PCR1H\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
