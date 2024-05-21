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
	.file	"stm32h7xx_hal_pwr.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_pwr.c"
	.section	.text.HAL_PWR_DeInit,"ax",%progbits
	.align	1
	.global	HAL_PWR_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_DeInit, %function
HAL_PWR_DeInit:
.LFB335:
	.loc 1 226 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 227 1
	bx	lr
	.cfi_endproc
.LFE335:
	.size	HAL_PWR_DeInit, .-HAL_PWR_DeInit
	.section	.text.HAL_PWR_EnableBkUpAccess,"ax",%progbits
	.align	1
	.global	HAL_PWR_EnableBkUpAccess
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_EnableBkUpAccess, %function
HAL_PWR_EnableBkUpAccess:
.LFB336:
	.loc 1 237 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 239 3
	.loc 1 239 67 is_stmt 0
	ldr	r2, .L3
	ldr	r3, [r2]
	.loc 1 239 74
	orr	r3, r3, #256
	str	r3, [r2]
	.loc 1 240 1
	bx	lr
.L4:
	.align	2
.L3:
	.word	1476544512
	.cfi_endproc
.LFE336:
	.size	HAL_PWR_EnableBkUpAccess, .-HAL_PWR_EnableBkUpAccess
	.section	.text.HAL_PWR_DisableBkUpAccess,"ax",%progbits
	.align	1
	.global	HAL_PWR_DisableBkUpAccess
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_DisableBkUpAccess, %function
HAL_PWR_DisableBkUpAccess:
.LFB337:
	.loc 1 250 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 252 3
	.loc 1 252 67 is_stmt 0
	ldr	r2, .L6
	ldr	r3, [r2]
	.loc 1 252 74
	bic	r3, r3, #256
	str	r3, [r2]
	.loc 1 253 1
	bx	lr
.L7:
	.align	2
.L6:
	.word	1476544512
	.cfi_endproc
.LFE337:
	.size	HAL_PWR_DisableBkUpAccess, .-HAL_PWR_DisableBkUpAccess
	.section	.text.HAL_PWR_ConfigPVD,"ax",%progbits
	.align	1
	.global	HAL_PWR_ConfigPVD
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_ConfigPVD, %function
HAL_PWR_ConfigPVD:
.LFB338:
	.loc 1 416 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 418 3
	.loc 1 418 6 is_stmt 0
	mov	r2, r0
	cmp	r0, #0
	beq	.L8
	.loc 1 424 3 is_stmt 1
	.loc 1 425 3
	.loc 1 428 3
	.loc 1 428 146 is_stmt 0
	ldr	r1, .L13
	ldr	r3, [r1]
	.loc 1 428 155
	bic	r3, r3, #224
	.loc 1 428 192
	ldr	r0, [r0]
.LVL1:
	.loc 1 428 179
	orrs	r3, r3, r0
	.loc 1 428 76
	str	r3, [r1]
	.loc 1 432 3 is_stmt 1
	.loc 1 432 68 is_stmt 0
	mov	r3, #1476395008
	ldr	r1, [r3, #132]
	.loc 1 432 76
	bic	r1, r1, #65536
	str	r1, [r3, #132]
	.loc 1 433 3 is_stmt 1
	.loc 1 433 68 is_stmt 0
	ldr	r1, [r3, #128]
	.loc 1 433 76
	bic	r1, r1, #65536
	str	r1, [r3, #128]
	.loc 1 436 3 is_stmt 1
	.loc 1 436 68 is_stmt 0
	ldr	r1, [r3]
	.loc 1 436 77
	bic	r1, r1, #65536
	str	r1, [r3]
	.loc 1 437 3 is_stmt 1
	.loc 1 437 68 is_stmt 0
	ldr	r1, [r3, #4]
	.loc 1 437 77
	bic	r1, r1, #65536
	str	r1, [r3, #4]
	.loc 1 441 3 is_stmt 1
	.loc 1 441 18 is_stmt 0
	ldr	r3, [r2, #4]
	.loc 1 441 6
	tst	r3, #65536
	beq	.L10
	.loc 1 443 5 is_stmt 1
	.loc 1 443 70 is_stmt 0
	mov	r1, #1476395008
	ldr	r3, [r1, #128]
	.loc 1 443 78
	orr	r3, r3, #65536
	str	r3, [r1, #128]
.L10:
	.loc 1 447 3 is_stmt 1
	.loc 1 447 18 is_stmt 0
	ldr	r3, [r2, #4]
	.loc 1 447 6
	tst	r3, #131072
	beq	.L11
	.loc 1 449 5 is_stmt 1
	.loc 1 449 70 is_stmt 0
	mov	r1, #1476395008
	ldr	r3, [r1, #132]
	.loc 1 449 78
	orr	r3, r3, #65536
	str	r3, [r1, #132]
.L11:
	.loc 1 454 3 is_stmt 1
	.loc 1 454 18 is_stmt 0
	ldr	r3, [r2, #4]
	.loc 1 454 6
	tst	r3, #1
	beq	.L12
	.loc 1 456 5 is_stmt 1
	.loc 1 456 70 is_stmt 0
	mov	r1, #1476395008
	ldr	r3, [r1]
	.loc 1 456 79
	orr	r3, r3, #65536
	str	r3, [r1]
.L12:
	.loc 1 460 3 is_stmt 1
	.loc 1 460 18 is_stmt 0
	ldr	r3, [r2, #4]
	.loc 1 460 6
	tst	r3, #2
	beq	.L8
	.loc 1 462 5 is_stmt 1
	.loc 1 462 70 is_stmt 0
	mov	r2, #1476395008
.LVL2:
	ldr	r3, [r2, #4]
	.loc 1 462 79
	orr	r3, r3, #65536
	str	r3, [r2, #4]
.L8:
	.loc 1 464 1
	bx	lr
.L14:
	.align	2
.L13:
	.word	1476544512
	.cfi_endproc
.LFE338:
	.size	HAL_PWR_ConfigPVD, .-HAL_PWR_ConfigPVD
	.section	.text.HAL_PWR_EnablePVD,"ax",%progbits
	.align	1
	.global	HAL_PWR_EnablePVD
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_EnablePVD, %function
HAL_PWR_EnablePVD:
.LFB339:
	.loc 1 471 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 473 3
	.loc 1 473 67 is_stmt 0
	ldr	r2, .L16
	ldr	r3, [r2]
	.loc 1 473 74
	orr	r3, r3, #16
	str	r3, [r2]
	.loc 1 474 1
	bx	lr
.L17:
	.align	2
.L16:
	.word	1476544512
	.cfi_endproc
.LFE339:
	.size	HAL_PWR_EnablePVD, .-HAL_PWR_EnablePVD
	.section	.text.HAL_PWR_DisablePVD,"ax",%progbits
	.align	1
	.global	HAL_PWR_DisablePVD
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_DisablePVD, %function
HAL_PWR_DisablePVD:
.LFB340:
	.loc 1 481 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 483 3
	.loc 1 483 67 is_stmt 0
	ldr	r2, .L19
	ldr	r3, [r2]
	.loc 1 483 74
	bic	r3, r3, #16
	str	r3, [r2]
	.loc 1 484 1
	bx	lr
.L20:
	.align	2
.L19:
	.word	1476544512
	.cfi_endproc
.LFE340:
	.size	HAL_PWR_DisablePVD, .-HAL_PWR_DisablePVD
	.section	.text.HAL_PWR_EnableWakeUpPin,"ax",%progbits
	.align	1
	.global	HAL_PWR_EnableWakeUpPin
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_EnableWakeUpPin, %function
HAL_PWR_EnableWakeUpPin:
.LFB341:
	.loc 1 508 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL3:
	.loc 1 510 3
	.loc 1 516 3
	.loc 1 516 150 is_stmt 0
	ldr	r2, .L22
	ldr	r1, [r2, #40]
	.loc 1 516 163
	ldr	r3, .L22+4
	ands	r3, r3, r1
	.loc 1 516 185
	orrs	r3, r3, r0
	.loc 1 516 80
	str	r3, [r2, #40]
	.loc 1 517 1
	bx	lr
.L23:
	.align	2
.L22:
	.word	1476544512
	.word	-268386112
	.cfi_endproc
.LFE341:
	.size	HAL_PWR_EnableWakeUpPin, .-HAL_PWR_EnableWakeUpPin
	.section	.text.HAL_PWR_DisableWakeUpPin,"ax",%progbits
	.align	1
	.global	HAL_PWR_DisableWakeUpPin
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_DisableWakeUpPin, %function
HAL_PWR_DisableWakeUpPin:
.LFB342:
	.loc 1 537 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL4:
	.loc 1 539 3
	.loc 1 542 3
	.loc 1 542 67 is_stmt 0
	ldr	r2, .L25
	ldr	r3, [r2, #40]
	.loc 1 542 101
	and	r0, r0, #63
.LVL5:
	.loc 1 542 78
	bic	r3, r3, r0
	str	r3, [r2, #40]
	.loc 1 543 1
	bx	lr
.L26:
	.align	2
.L25:
	.word	1476544512
	.cfi_endproc
.LFE342:
	.size	HAL_PWR_DisableWakeUpPin, .-HAL_PWR_DisableWakeUpPin
	.section	.text.HAL_PWR_EnterSLEEPMode,"ax",%progbits
	.align	1
	.global	HAL_PWR_EnterSLEEPMode
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_EnterSLEEPMode, %function
HAL_PWR_EnterSLEEPMode:
.LFB343:
	.loc 1 565 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL6:
	.loc 1 567 3
	.loc 1 568 3
	.loc 1 571 3
	.loc 1 574 3
	.loc 1 574 48 is_stmt 0
	ldr	r2, .L31
	ldr	r3, [r2, #16]
	.loc 1 574 55
	bic	r3, r3, #4
	str	r3, [r2, #16]
	.loc 1 577 3 is_stmt 1
	.loc 1 577 6 is_stmt 0
	cmp	r1, #1
	beq	.L30
	.loc 1 585 5 is_stmt 1
	.syntax unified
@ 585 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_pwr.c" 1
	wfe
@ 0 "" 2
	.loc 1 587 1 is_stmt 0
	.thumb
	.syntax unified
	bx	lr
.L30:
	.loc 1 580 5 is_stmt 1
	.syntax unified
@ 580 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_pwr.c" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
.L32:
	.align	2
.L31:
	.word	-536810240
	.cfi_endproc
.LFE343:
	.size	HAL_PWR_EnterSLEEPMode, .-HAL_PWR_EnterSLEEPMode
	.section	.text.HAL_PWR_EnterSTOPMode,"ax",%progbits
	.align	1
	.global	HAL_PWR_EnterSTOPMode
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_EnterSTOPMode, %function
HAL_PWR_EnterSTOPMode:
.LFB344:
	.loc 1 619 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL7:
	.loc 1 621 3
	.loc 1 622 3
	.loc 1 625 3
	.loc 1 625 146 is_stmt 0
	ldr	r3, .L37
	ldr	r2, [r3]
	.loc 1 625 155
	bic	r2, r2, #1
	.loc 1 625 179
	orrs	r2, r2, r0
	.loc 1 625 76
	str	r2, [r3]
	.loc 1 642 3 is_stmt 1
	.loc 1 642 67 is_stmt 0
	ldr	r2, [r3, #16]
	.loc 1 642 76
	bic	r2, r2, #5
	str	r2, [r3, #16]
	.loc 1 646 3 is_stmt 1
	.loc 1 646 67 is_stmt 0
	ldr	r2, [r3, #16]
	.loc 1 646 76
	bic	r2, r2, #2
	str	r2, [r3, #16]
	.loc 1 651 3 is_stmt 1
	.loc 1 651 48 is_stmt 0
	ldr	r2, .L37+4
	ldr	r3, [r2, #16]
	.loc 1 651 55
	orr	r3, r3, #4
	str	r3, [r2, #16]
	.loc 1 654 3 is_stmt 1
.LBB10:
.LBB11:
	.file 2 "d:\\rtos\\board\\yd-stm32h7xxvx_classicv19\\cmake-build-debug\\_deps\\stm32h7xx_cmsis_include\\drivers\\cmsis\\include\\cmsis_gcc.h"
	.loc 2 946 3
	.syntax unified
@ 946 "d:\rtos\board\yd-stm32h7xxvx_classicv19\cmake-build-debug\_deps\stm32h7xx_cmsis_include\drivers\cmsis\include\cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE11:
.LBE10:
	.loc 1 655 3
.LBB12:
.LBB13:
	.loc 2 935 3
	.syntax unified
@ 935 "d:\rtos\board\yd-stm32h7xxvx_classicv19\cmake-build-debug\_deps\stm32h7xx_cmsis_include\drivers\cmsis\include\cmsis_gcc.h" 1
	isb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE13:
.LBE12:
	.loc 1 658 3
	.loc 1 658 6 is_stmt 0
	cmp	r1, #1
	beq	.L36
	.loc 1 666 5 is_stmt 1
	.syntax unified
@ 666 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_pwr.c" 1
	wfe
@ 0 "" 2
	.thumb
	.syntax unified
.L35:
	.loc 1 670 3
	.loc 1 670 48 is_stmt 0
	ldr	r2, .L37+4
	ldr	r3, [r2, #16]
	.loc 1 670 55
	bic	r3, r3, #4
	str	r3, [r2, #16]
	.loc 1 671 1
	bx	lr
.L36:
	.loc 1 661 5 is_stmt 1
	.syntax unified
@ 661 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_pwr.c" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L35
.L38:
	.align	2
.L37:
	.word	1476544512
	.word	-536810240
	.cfi_endproc
.LFE344:
	.size	HAL_PWR_EnterSTOPMode, .-HAL_PWR_EnterSTOPMode
	.section	.text.HAL_PWR_EnterSTANDBYMode,"ax",%progbits
	.align	1
	.global	HAL_PWR_EnterSTANDBYMode
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_EnterSTANDBYMode, %function
HAL_PWR_EnterSTANDBYMode:
.LFB345:
	.loc 1 690 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 708 3
	.loc 1 708 67 is_stmt 0
	ldr	r3, .L40
	ldr	r2, [r3, #16]
	.loc 1 708 76
	orr	r2, r2, #5
	str	r2, [r3, #16]
	.loc 1 712 3 is_stmt 1
	.loc 1 712 67 is_stmt 0
	ldr	r2, [r3, #16]
	.loc 1 712 76
	orr	r2, r2, #2
	str	r2, [r3, #16]
	.loc 1 717 3 is_stmt 1
	.loc 1 717 48 is_stmt 0
	ldr	r2, .L40+4
	ldr	r3, [r2, #16]
	.loc 1 717 55
	orr	r3, r3, #4
	str	r3, [r2, #16]
	.loc 1 720 3 is_stmt 1
.LBB14:
.LBB15:
	.loc 2 946 3
	.syntax unified
@ 946 "d:\rtos\board\yd-stm32h7xxvx_classicv19\cmake-build-debug\_deps\stm32h7xx_cmsis_include\drivers\cmsis\include\cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE15:
.LBE14:
	.loc 1 721 3
.LBB16:
.LBB17:
	.loc 2 935 3
	.syntax unified
@ 935 "d:\rtos\board\yd-stm32h7xxvx_classicv19\cmake-build-debug\_deps\stm32h7xx_cmsis_include\drivers\cmsis\include\cmsis_gcc.h" 1
	isb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE17:
.LBE16:
	.loc 1 729 3
	.syntax unified
@ 729 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_pwr.c" 1
	wfi
@ 0 "" 2
	.loc 1 730 1 is_stmt 0
	.thumb
	.syntax unified
	bx	lr
.L41:
	.align	2
.L40:
	.word	1476544512
	.word	-536810240
	.cfi_endproc
.LFE345:
	.size	HAL_PWR_EnterSTANDBYMode, .-HAL_PWR_EnterSTANDBYMode
	.section	.text.HAL_PWR_EnableSleepOnExit,"ax",%progbits
	.align	1
	.global	HAL_PWR_EnableSleepOnExit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_EnableSleepOnExit, %function
HAL_PWR_EnableSleepOnExit:
.LFB346:
	.loc 1 742 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 744 3
	.loc 1 744 48 is_stmt 0
	ldr	r2, .L43
	ldr	r3, [r2, #16]
	.loc 1 744 55
	orr	r3, r3, #2
	str	r3, [r2, #16]
	.loc 1 745 1
	bx	lr
.L44:
	.align	2
.L43:
	.word	-536810240
	.cfi_endproc
.LFE346:
	.size	HAL_PWR_EnableSleepOnExit, .-HAL_PWR_EnableSleepOnExit
	.section	.text.HAL_PWR_DisableSleepOnExit,"ax",%progbits
	.align	1
	.global	HAL_PWR_DisableSleepOnExit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_DisableSleepOnExit, %function
HAL_PWR_DisableSleepOnExit:
.LFB347:
	.loc 1 755 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 757 3
	.loc 1 757 48 is_stmt 0
	ldr	r2, .L46
	ldr	r3, [r2, #16]
	.loc 1 757 55
	bic	r3, r3, #2
	str	r3, [r2, #16]
	.loc 1 758 1
	bx	lr
.L47:
	.align	2
.L46:
	.word	-536810240
	.cfi_endproc
.LFE347:
	.size	HAL_PWR_DisableSleepOnExit, .-HAL_PWR_DisableSleepOnExit
	.section	.text.HAL_PWR_EnableSEVOnPend,"ax",%progbits
	.align	1
	.global	HAL_PWR_EnableSEVOnPend
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_EnableSEVOnPend, %function
HAL_PWR_EnableSEVOnPend:
.LFB348:
	.loc 1 768 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 770 3
	.loc 1 770 48 is_stmt 0
	ldr	r2, .L49
	ldr	r3, [r2, #16]
	.loc 1 770 55
	orr	r3, r3, #16
	str	r3, [r2, #16]
	.loc 1 771 1
	bx	lr
.L50:
	.align	2
.L49:
	.word	-536810240
	.cfi_endproc
.LFE348:
	.size	HAL_PWR_EnableSEVOnPend, .-HAL_PWR_EnableSEVOnPend
	.section	.text.HAL_PWR_DisableSEVOnPend,"ax",%progbits
	.align	1
	.global	HAL_PWR_DisableSEVOnPend
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_DisableSEVOnPend, %function
HAL_PWR_DisableSEVOnPend:
.LFB349:
	.loc 1 780 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 782 3
	.loc 1 782 48 is_stmt 0
	ldr	r2, .L52
	ldr	r3, [r2, #16]
	.loc 1 782 55
	bic	r3, r3, #16
	str	r3, [r2, #16]
	.loc 1 783 1
	bx	lr
.L53:
	.align	2
.L52:
	.word	-536810240
	.cfi_endproc
.LFE349:
	.size	HAL_PWR_DisableSEVOnPend, .-HAL_PWR_DisableSEVOnPend
	.section	.text.HAL_PWR_PVDCallback,"ax",%progbits
	.align	1
	.weak	HAL_PWR_PVDCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_PVDCallback, %function
HAL_PWR_PVDCallback:
.LFB351:
	.loc 1 854 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 858 1
	bx	lr
	.cfi_endproc
.LFE351:
	.size	HAL_PWR_PVDCallback, .-HAL_PWR_PVDCallback
	.section	.text.HAL_PWR_PVD_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_PWR_PVD_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_PWR_PVD_IRQHandler, %function
HAL_PWR_PVD_IRQHandler:
.LFB350:
	.loc 1 809 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 838 3
	.loc 1 838 74 is_stmt 0
	mov	r3, #1476395008
	ldr	r3, [r3, #136]
	.loc 1 838 6
	tst	r3, #65536
	bne	.L58
.L55:
	.loc 1 847 1
	pop	{r3, pc}
.L58:
	.loc 1 841 5 is_stmt 1
	.loc 1 841 70 is_stmt 0
	mov	r2, #1476395008
	ldr	r3, [r2, #136]
	.loc 1 841 77
	orr	r3, r3, #65536
	str	r3, [r2, #136]
	.loc 1 844 5 is_stmt 1
	bl	HAL_PWR_PVDCallback
.LVL8:
	.loc 1 847 1 is_stmt 0
	b	.L55
	.cfi_endproc
.LFE350:
	.size	HAL_PWR_PVD_IRQHandler, .-HAL_PWR_PVD_IRQHandler
	.text
.Letext0:
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 4 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 5 "d:\\rtos\\board\\yd-stm32h7xxvx_classicv19\\cmake-build-debug\\_deps\\stm32h7xx_cmsis_include\\drivers\\cmsis\\include\\core_cm7.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_pwr.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x913
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x14
	.4byte	.LASF127
	.byte	0x1d
	.4byte	.LASF128
	.4byte	.LASF129
	.4byte	.LLRL2
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
	.uleb128 0xa
	.4byte	.LASF5
	.byte	0x3
	.byte	0x2b
	.byte	0x17
	.4byte	0x40
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
	.uleb128 0xa
	.4byte	.LASF6
	.byte	0x3
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
	.uleb128 0x15
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0xa
	.4byte	.LASF11
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x34
	.uleb128 0x9
	.4byte	0x84
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x55
	.uleb128 0x9
	.4byte	0x95
	.uleb128 0xc
	.4byte	0xa1
	.uleb128 0x16
	.2byte	0x2ac
	.byte	0x5
	.2byte	0x1c7
	.byte	0x9
	.4byte	0x373
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
	.uleb128 0x6
	.ascii	"SCR\000"
	.byte	0x5
	.2byte	0x1cd
	.byte	0x15
	.4byte	0xa1
	.byte	0x10
	.uleb128 0x6
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
	.4byte	0x383
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
	.4byte	0x39d
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
	.4byte	0x3b7
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x5
	.2byte	0x1db
	.byte	0x1b
	.4byte	0x3d1
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x5
	.2byte	0x1dc
	.byte	0x12
	.4byte	0x3d6
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x5
	.2byte	0x1dd
	.byte	0x1b
	.4byte	0xa6
	.byte	0x78
	.uleb128 0x6
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
	.4byte	0x3e6
	.byte	0x8c
	.uleb128 0x2
	.4byte	.LASF36
	.2byte	0x1e3
	.byte	0x15
	.4byte	0xa1
	.2byte	0x200
	.uleb128 0x2
	.4byte	.LASF37
	.2byte	0x1e4
	.byte	0x12
	.4byte	0x3f6
	.2byte	0x204
	.uleb128 0x2
	.4byte	.LASF38
	.2byte	0x1e5
	.byte	0x1b
	.4byte	0xa6
	.2byte	0x240
	.uleb128 0x2
	.4byte	.LASF39
	.2byte	0x1e6
	.byte	0x1b
	.4byte	0xa6
	.2byte	0x244
	.uleb128 0x2
	.4byte	.LASF40
	.2byte	0x1e7
	.byte	0x1b
	.4byte	0xa6
	.2byte	0x248
	.uleb128 0x2
	.4byte	.LASF41
	.2byte	0x1e8
	.byte	0x12
	.4byte	0x3d6
	.2byte	0x24c
	.uleb128 0x2
	.4byte	.LASF42
	.2byte	0x1e9
	.byte	0x15
	.4byte	0xa1
	.2byte	0x250
	.uleb128 0x2
	.4byte	.LASF43
	.2byte	0x1ea
	.byte	0x12
	.4byte	0x3d6
	.2byte	0x254
	.uleb128 0x2
	.4byte	.LASF44
	.2byte	0x1eb
	.byte	0x15
	.4byte	0xa1
	.2byte	0x258
	.uleb128 0x2
	.4byte	.LASF45
	.2byte	0x1ec
	.byte	0x15
	.4byte	0xa1
	.2byte	0x25c
	.uleb128 0x2
	.4byte	.LASF46
	.2byte	0x1ed
	.byte	0x15
	.4byte	0xa1
	.2byte	0x260
	.uleb128 0x2
	.4byte	.LASF47
	.2byte	0x1ee
	.byte	0x15
	.4byte	0xa1
	.2byte	0x264
	.uleb128 0x2
	.4byte	.LASF48
	.2byte	0x1ef
	.byte	0x15
	.4byte	0xa1
	.2byte	0x268
	.uleb128 0x2
	.4byte	.LASF49
	.2byte	0x1f0
	.byte	0x15
	.4byte	0xa1
	.2byte	0x26c
	.uleb128 0x2
	.4byte	.LASF50
	.2byte	0x1f1
	.byte	0x15
	.4byte	0xa1
	.2byte	0x270
	.uleb128 0x2
	.4byte	.LASF51
	.2byte	0x1f2
	.byte	0x15
	.4byte	0xa1
	.2byte	0x274
	.uleb128 0x2
	.4byte	.LASF52
	.2byte	0x1f3
	.byte	0x12
	.4byte	0x406
	.2byte	0x278
	.uleb128 0x2
	.4byte	.LASF53
	.2byte	0x1f4
	.byte	0x15
	.4byte	0xa1
	.2byte	0x290
	.uleb128 0x2
	.4byte	.LASF54
	.2byte	0x1f5
	.byte	0x15
	.4byte	0xa1
	.2byte	0x294
	.uleb128 0x2
	.4byte	.LASF55
	.2byte	0x1f6
	.byte	0x15
	.4byte	0xa1
	.2byte	0x298
	.uleb128 0x2
	.4byte	.LASF56
	.2byte	0x1f7
	.byte	0x15
	.4byte	0xa1
	.2byte	0x29c
	.uleb128 0x2
	.4byte	.LASF57
	.2byte	0x1f8
	.byte	0x15
	.4byte	0xa1
	.2byte	0x2a0
	.uleb128 0x2
	.4byte	.LASF58
	.2byte	0x1f9
	.byte	0x12
	.4byte	0x3d6
	.2byte	0x2a4
	.uleb128 0x2
	.4byte	.LASF59
	.2byte	0x1fa
	.byte	0x15
	.4byte	0xa1
	.2byte	0x2a8
	.byte	0
	.uleb128 0x4
	.4byte	0x90
	.4byte	0x383
	.uleb128 0x5
	.4byte	0x7d
	.byte	0xb
	.byte	0
	.uleb128 0x9
	.4byte	0x373
	.uleb128 0x4
	.4byte	0xa6
	.4byte	0x398
	.uleb128 0x5
	.4byte	0x7d
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.4byte	0x388
	.uleb128 0x9
	.4byte	0x398
	.uleb128 0x4
	.4byte	0xa6
	.4byte	0x3b2
	.uleb128 0x5
	.4byte	0x7d
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.4byte	0x3a2
	.uleb128 0x9
	.4byte	0x3b2
	.uleb128 0x4
	.4byte	0xa6
	.4byte	0x3cc
	.uleb128 0x5
	.4byte	0x7d
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	0x3bc
	.uleb128 0x9
	.4byte	0x3cc
	.uleb128 0x4
	.4byte	0x95
	.4byte	0x3e6
	.uleb128 0x5
	.4byte	0x7d
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	0x95
	.4byte	0x3f6
	.uleb128 0x5
	.4byte	0x7d
	.byte	0x5c
	.byte	0
	.uleb128 0x4
	.4byte	0x95
	.4byte	0x406
	.uleb128 0x5
	.4byte	0x7d
	.byte	0xe
	.byte	0
	.uleb128 0x4
	.4byte	0x95
	.4byte	0x416
	.uleb128 0x5
	.4byte	0x7d
	.byte	0x5
	.byte	0
	.uleb128 0xe
	.4byte	.LASF60
	.byte	0x5
	.2byte	0x1fb
	.byte	0x3
	.4byte	0xab
	.uleb128 0x4
	.4byte	0x95
	.4byte	0x433
	.uleb128 0x5
	.4byte	0x7d
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	0x95
	.4byte	0x443
	.uleb128 0x5
	.4byte	0x7d
	.byte	0x9
	.byte	0
	.uleb128 0x10
	.byte	0xac
	.2byte	0x351
	.4byte	0x60c
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
	.4byte	0x423
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
	.4byte	0x423
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
	.4byte	0x433
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
	.uleb128 0x6
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
	.uleb128 0x6
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
	.uleb128 0x6
	.ascii	"PR3\000"
	.byte	0x6
	.2byte	0x372
	.byte	0x13
	.4byte	0xa1
	.byte	0xa8
	.byte	0
	.uleb128 0xe
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x373
	.byte	0x2
	.4byte	0x443
	.uleb128 0x10
	.byte	0x2c
	.2byte	0x4ba
	.4byte	0x6bc
	.uleb128 0x6
	.ascii	"CR1\000"
	.byte	0x6
	.2byte	0x4bc
	.byte	0x15
	.4byte	0xa1
	.byte	0
	.uleb128 0x1
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x4bd
	.byte	0x15
	.4byte	0xa1
	.byte	0x4
	.uleb128 0x6
	.ascii	"CR2\000"
	.byte	0x6
	.2byte	0x4be
	.byte	0x15
	.4byte	0xa1
	.byte	0x8
	.uleb128 0x6
	.ascii	"CR3\000"
	.byte	0x6
	.2byte	0x4bf
	.byte	0x15
	.4byte	0xa1
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF89
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
	.4byte	.LASF90
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
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x4c4
	.byte	0x15
	.4byte	0xa1
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x4c5
	.byte	0x15
	.4byte	0xa1
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x4c6
	.byte	0x15
	.4byte	0xa1
	.byte	0x28
	.byte	0
	.uleb128 0xe
	.4byte	.LASF94
	.byte	0x6
	.2byte	0x4c7
	.byte	0x3
	.4byte	0x619
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF95
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF96
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF97
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF98
	.uleb128 0x17
	.byte	0x8
	.byte	0x7
	.byte	0x2f
	.byte	0x9
	.4byte	0x705
	.uleb128 0x11
	.4byte	.LASF99
	.byte	0x31
	.4byte	0x95
	.byte	0
	.uleb128 0x11
	.4byte	.LASF100
	.byte	0x36
	.4byte	0x95
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.4byte	.LASF101
	.byte	0x7
	.byte	0x3a
	.byte	0x2
	.4byte	0x6e5
	.uleb128 0x7
	.4byte	.LASF102
	.2byte	0x355
	.byte	0x1c
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF107
	.2byte	0x328
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x742
	.uleb128 0x18
	.4byte	.LVL8
	.4byte	0x711
	.byte	0
	.uleb128 0x7
	.4byte	.LASF103
	.2byte	0x30b
	.byte	0x6
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF104
	.2byte	0x2ff
	.byte	0x6
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF105
	.2byte	0x2f2
	.byte	0x6
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF106
	.2byte	0x2e5
	.byte	0x6
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF108
	.2byte	0x2b1
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7be
	.uleb128 0xd
	.4byte	0x908
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.2byte	0x2d0
	.uleb128 0xd
	.4byte	0x90f
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.2byte	0x2d1
	.byte	0
	.uleb128 0x8
	.4byte	.LASF109
	.2byte	0x26a
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x80e
	.uleb128 0xb
	.4byte	.LASF110
	.2byte	0x26a
	.byte	0x26
	.4byte	0x95
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF111
	.2byte	0x26a
	.byte	0x39
	.4byte	0x84
	.uleb128 0x1
	.byte	0x51
	.uleb128 0xd
	.4byte	0x908
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.2byte	0x28e
	.uleb128 0xd
	.4byte	0x90f
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.2byte	0x28f
	.byte	0
	.uleb128 0x8
	.4byte	.LASF112
	.2byte	0x234
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x840
	.uleb128 0xb
	.4byte	.LASF110
	.2byte	0x234
	.byte	0x27
	.4byte	0x95
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF113
	.2byte	0x234
	.byte	0x3a
	.4byte	0x84
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x8
	.4byte	.LASF114
	.2byte	0x218
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x865
	.uleb128 0x12
	.4byte	.LASF115
	.2byte	0x218
	.4byte	0x95
	.4byte	.LLST1
	.byte	0
	.uleb128 0x8
	.4byte	.LASF116
	.2byte	0x1fb
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x889
	.uleb128 0xb
	.4byte	.LASF117
	.2byte	0x1fb
	.byte	0x28
	.4byte	0x95
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x7
	.4byte	.LASF118
	.2byte	0x1e0
	.byte	0x6
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF119
	.2byte	0x1d6
	.byte	0x6
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF120
	.2byte	0x19f
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8d2
	.uleb128 0x12
	.4byte	.LASF121
	.2byte	0x19f
	.4byte	0x8d2
	.4byte	.LLST0
	.byte	0
	.uleb128 0x19
	.byte	0x4
	.4byte	0x705
	.uleb128 0xf
	.4byte	.LASF122
	.byte	0xf9
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF123
	.byte	0xec
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF124
	.byte	0xe1
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF125
	.2byte	0x3b0
	.uleb128 0x13
	.4byte	.LASF126
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
	.uleb128 0x21
	.sleb128 5
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x9
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.sleb128 3
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0xb
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
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
	.uleb128 0x21
	.sleb128 7
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
	.uleb128 0x12
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
	.uleb128 0x21
	.sleb128 41
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
.LLST1:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL5-.LVL4
	.uleb128 .LFE342-.LVL4
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
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LFE338-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x9c
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
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
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
.LLRL2:
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
	.4byte	.LFB351
	.uleb128 .LFE351-.LFB351
	.byte	0x7
	.4byte	.LFB350
	.uleb128 .LFE350-.LFB350
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF80:
	.ascii	"D3PCR3H\000"
.LASF79:
	.ascii	"D3PCR3L\000"
.LASF57:
	.ascii	"AHBSCR\000"
.LASF5:
	.ascii	"__uint8_t\000"
.LASF36:
	.ascii	"STIR\000"
.LASF62:
	.ascii	"FTSR1\000"
.LASF45:
	.ascii	"DCIMVAC\000"
.LASF4:
	.ascii	"long int\000"
.LASF115:
	.ascii	"WakeUpPinx\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF31:
	.ascii	"CLIDR\000"
.LASF13:
	.ascii	"CPUID\000"
.LASF99:
	.ascii	"PVDLevel\000"
.LASF63:
	.ascii	"SWIER1\000"
.LASF103:
	.ascii	"HAL_PWR_DisableSEVOnPend\000"
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
.LASF91:
	.ascii	"WKUPCR\000"
.LASF94:
	.ascii	"PWR_TypeDef\000"
.LASF112:
	.ascii	"HAL_PWR_EnterSLEEPMode\000"
.LASF54:
	.ascii	"DTCMCR\000"
.LASF108:
	.ascii	"HAL_PWR_EnterSTANDBYMode\000"
.LASF98:
	.ascii	"double\000"
.LASF122:
	.ascii	"HAL_PWR_DisableBkUpAccess\000"
.LASF42:
	.ascii	"ICIALLU\000"
.LASF23:
	.ascii	"BFAR\000"
.LASF24:
	.ascii	"AFSR\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF69:
	.ascii	"FTSR2\000"
.LASF76:
	.ascii	"FTSR3\000"
.LASF114:
	.ascii	"HAL_PWR_DisableWakeUpPin\000"
.LASF60:
	.ascii	"SCB_Type\000"
.LASF26:
	.ascii	"ID_DFR\000"
.LASF48:
	.ascii	"DCCMVAC\000"
.LASF56:
	.ascii	"CACR\000"
.LASF33:
	.ascii	"CSSELR\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF93:
	.ascii	"WKUPEPR\000"
.LASF47:
	.ascii	"DCCMVAU\000"
.LASF118:
	.ascii	"HAL_PWR_DisablePVD\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF89:
	.ascii	"CPUCR\000"
.LASF120:
	.ascii	"HAL_PWR_ConfigPVD\000"
.LASF15:
	.ascii	"VTOR\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF81:
	.ascii	"IMR1\000"
.LASF83:
	.ascii	"IMR2\000"
.LASF85:
	.ascii	"IMR3\000"
.LASF127:
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
.LASF61:
	.ascii	"RTSR1\000"
.LASF68:
	.ascii	"RTSR2\000"
.LASF113:
	.ascii	"SLEEPEntry\000"
.LASF75:
	.ascii	"RTSR3\000"
.LASF59:
	.ascii	"ABFSR\000"
.LASF125:
	.ascii	"__DSB\000"
.LASF102:
	.ascii	"HAL_PWR_PVDCallback\000"
.LASF32:
	.ascii	"CCSIDR\000"
.LASF119:
	.ascii	"HAL_PWR_EnablePVD\000"
.LASF19:
	.ascii	"CFSR\000"
.LASF27:
	.ascii	"ID_AFR\000"
.LASF92:
	.ascii	"WKUPFR\000"
.LASF126:
	.ascii	"__ISB\000"
.LASF55:
	.ascii	"AHBPCR\000"
.LASF109:
	.ascii	"HAL_PWR_EnterSTOPMode\000"
.LASF117:
	.ascii	"WakeUpPinPolarity\000"
.LASF38:
	.ascii	"MVFR0\000"
.LASF39:
	.ascii	"MVFR1\000"
.LASF40:
	.ascii	"MVFR2\000"
.LASF30:
	.ascii	"RESERVED0\000"
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
.LASF2:
	.ascii	"unsigned char\000"
.LASF18:
	.ascii	"SHCSR\000"
.LASF50:
	.ascii	"DCCIMVAC\000"
.LASF0:
	.ascii	"short int\000"
.LASF28:
	.ascii	"ID_MFR\000"
.LASF44:
	.ascii	"ICIMVAU\000"
.LASF46:
	.ascii	"DCISW\000"
.LASF106:
	.ascii	"HAL_PWR_EnableSleepOnExit\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF90:
	.ascii	"D3CR\000"
.LASF121:
	.ascii	"sConfigPVD\000"
.LASF101:
	.ascii	"PWR_PVDTypeDef\000"
.LASF65:
	.ascii	"D3PCR1L\000"
.LASF95:
	.ascii	"long double\000"
.LASF96:
	.ascii	"char\000"
.LASF104:
	.ascii	"HAL_PWR_EnableSEVOnPend\000"
.LASF100:
	.ascii	"Mode\000"
.LASF123:
	.ascii	"HAL_PWR_EnableBkUpAccess\000"
.LASF49:
	.ascii	"DCCSW\000"
.LASF17:
	.ascii	"SHPR\000"
.LASF107:
	.ascii	"HAL_PWR_PVD_IRQHandler\000"
.LASF124:
	.ascii	"HAL_PWR_DeInit\000"
.LASF82:
	.ascii	"EMR1\000"
.LASF84:
	.ascii	"EMR2\000"
.LASF86:
	.ascii	"EMR3\000"
.LASF105:
	.ascii	"HAL_PWR_DisableSleepOnExit\000"
.LASF110:
	.ascii	"Regulator\000"
.LASF73:
	.ascii	"D3PCR2H\000"
.LASF72:
	.ascii	"D3PCR2L\000"
.LASF14:
	.ascii	"ICSR\000"
.LASF11:
	.ascii	"uint8_t\000"
.LASF111:
	.ascii	"STOPEntry\000"
.LASF29:
	.ascii	"ID_ISAR\000"
.LASF97:
	.ascii	"float\000"
.LASF129:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF116:
	.ascii	"HAL_PWR_EnableWakeUpPin\000"
.LASF64:
	.ascii	"D3PMR1\000"
.LASF71:
	.ascii	"D3PMR2\000"
.LASF78:
	.ascii	"D3PMR3\000"
.LASF87:
	.ascii	"EXTI_TypeDef\000"
.LASF34:
	.ascii	"CPACR\000"
.LASF20:
	.ascii	"HFSR\000"
.LASF88:
	.ascii	"CSR1\000"
.LASF70:
	.ascii	"SWIER2\000"
.LASF128:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_pwr.c\000"
.LASF66:
	.ascii	"D3PCR1H\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
