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
	.file	"stm32h7xx_hal_rtc.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_rtc.c"
	.section	.text.HAL_RTC_MspInit,"ax",%progbits
	.align	1
	.weak	HAL_RTC_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_MspInit, %function
HAL_RTC_MspInit:
.LFB337:
	.loc 1 762 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 764 3
	.loc 1 769 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_RTC_MspInit, .-HAL_RTC_MspInit
	.section	.text.HAL_RTC_MspDeInit,"ax",%progbits
	.align	1
	.weak	HAL_RTC_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_MspDeInit, %function
HAL_RTC_MspDeInit:
.LFB338:
	.loc 1 777 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL1:
	.loc 1 779 3
	.loc 1 784 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE338:
	.size	HAL_RTC_MspDeInit, .-HAL_RTC_MspDeInit
	.section	.text.HAL_RTC_DeactivateAlarm,"ax",%progbits
	.align	1
	.global	HAL_RTC_DeactivateAlarm
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_DeactivateAlarm, %function
HAL_RTC_DeactivateAlarm:
.LFB345:
	.loc 1 1506 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL2:
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	.loc 1 1507 3
	.loc 1 1510 3
	.loc 1 1513 3
	.loc 1 1513 7
	.loc 1 1513 16 is_stmt 0
	ldrb	r3, [r0, #32]	@ zero_extendqisi2
	.loc 1 1513 9
	cmp	r3, #1
	beq	.L11
	mov	r4, r0
	.loc 1 1513 66 is_stmt 1 discriminator 2
	.loc 1 1513 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #32]
	.loc 1 1513 5 is_stmt 1 discriminator 2
	.loc 1 1515 3 discriminator 2
	.loc 1 1515 15 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #33]
	.loc 1 1518 3 is_stmt 1 discriminator 2
	.loc 1 1518 7 discriminator 2
	.loc 1 1518 13 is_stmt 0 discriminator 2
	ldr	r3, [r0]
	.loc 1 1518 29 discriminator 2
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1518 38 is_stmt 1 discriminator 2
	.loc 1 1518 44 is_stmt 0 discriminator 2
	ldr	r3, [r0]
	.loc 1 1518 60 discriminator 2
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1518 5 is_stmt 1 discriminator 2
	.loc 1 1520 3 discriminator 2
	.loc 1 1520 5 is_stmt 0 discriminator 2
	cmp	r1, #256
	beq	.L13
	.loc 1 1554 5 is_stmt 1
	.loc 1 1554 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1554 22
	ldr	r3, [r2, #8]
	.loc 1 1554 27
	bic	r3, r3, #512
	str	r3, [r2, #8]
	.loc 1 1557 5 is_stmt 1
	.loc 1 1557 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1557 22
	ldr	r3, [r2, #8]
	.loc 1 1557 27
	bic	r3, r3, #8192
	str	r3, [r2, #8]
	.loc 1 1559 5 is_stmt 1
	.loc 1 1559 17 is_stmt 0
	bl	HAL_GetTick
.LVL3:
	mov	r5, r0
.LVL4:
	.loc 1 1565 5 is_stmt 1
.L9:
	.loc 1 1565 78
	.loc 1 1565 22 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1565 32
	ldr	r3, [r3, #12]
	.loc 1 1565 78
	tst	r3, #2
	bne	.L8
	.loc 1 1568 7 is_stmt 1
	.loc 1 1568 11 is_stmt 0
	bl	HAL_GetTick
.LVL5:
	.loc 1 1568 25
	subs	r3, r0, r5
	.loc 1 1568 9
	cmp	r3, #1000
	bls	.L9
	.loc 1 1571 9 is_stmt 1
	.loc 1 1571 13
	.loc 1 1571 19 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1571 35
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1571 11 is_stmt 1
	.loc 1 1573 9
	.loc 1 1573 21 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #33]
	.loc 1 1576 9 is_stmt 1
	.loc 1 1576 13
	.loc 1 1576 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #32]
	.loc 1 1576 11 is_stmt 1
	.loc 1 1578 9
	.loc 1 1578 16 is_stmt 0
	b	.L4
.LVL6:
.L13:
	.loc 1 1523 5 is_stmt 1
	.loc 1 1523 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1523 22
	ldr	r3, [r2, #8]
	.loc 1 1523 27
	bic	r3, r3, #256
	str	r3, [r2, #8]
	.loc 1 1526 5 is_stmt 1
	.loc 1 1526 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1526 22
	ldr	r3, [r2, #8]
	.loc 1 1526 27
	bic	r3, r3, #4096
	str	r3, [r2, #8]
	.loc 1 1528 5 is_stmt 1
	.loc 1 1528 17 is_stmt 0
	bl	HAL_GetTick
.LVL7:
	mov	r5, r0
.LVL8:
	.loc 1 1534 5 is_stmt 1
.L6:
	.loc 1 1534 78
	.loc 1 1534 22 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1534 32
	ldr	r3, [r3, #12]
	.loc 1 1534 78
	tst	r3, #1
	bne	.L8
	.loc 1 1537 7 is_stmt 1
	.loc 1 1537 11 is_stmt 0
	bl	HAL_GetTick
.LVL9:
	.loc 1 1537 25
	subs	r0, r0, r5
	.loc 1 1537 9
	cmp	r0, #1000
	bls	.L6
	.loc 1 1540 9 is_stmt 1
	.loc 1 1540 13
	.loc 1 1540 19 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1540 35
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1540 11 is_stmt 1
	.loc 1 1542 9
	.loc 1 1542 21 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #33]
	.loc 1 1545 9 is_stmt 1
	.loc 1 1545 13
	.loc 1 1545 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #32]
	.loc 1 1545 11 is_stmt 1
	.loc 1 1547 9
	.loc 1 1547 16 is_stmt 0
	b	.L4
.L8:
	.loc 1 1583 3 is_stmt 1
	.loc 1 1583 7
	.loc 1 1583 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1583 29
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1583 5 is_stmt 1
	.loc 1 1585 3
	.loc 1 1585 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #33]
	.loc 1 1588 3 is_stmt 1
	.loc 1 1588 7
	.loc 1 1588 20 is_stmt 0
	movs	r0, #0
	strb	r0, [r4, #32]
	.loc 1 1588 5 is_stmt 1
	.loc 1 1590 3
.LVL10:
.L4:
	.loc 1 1591 1 is_stmt 0
	pop	{r3, r4, r5, pc}
.LVL11:
.L11:
	.loc 1 1513 47
	movs	r0, #2
.LVL12:
	b	.L4
	.cfi_endproc
.LFE345:
	.size	HAL_RTC_DeactivateAlarm, .-HAL_RTC_DeactivateAlarm
	.section	.text.HAL_RTC_AlarmAEventCallback,"ax",%progbits
	.align	1
	.weak	HAL_RTC_AlarmAEventCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_AlarmAEventCallback, %function
HAL_RTC_AlarmAEventCallback:
.LFB348:
	.loc 1 1760 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL13:
	.loc 1 1762 3
	.loc 1 1767 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE348:
	.size	HAL_RTC_AlarmAEventCallback, .-HAL_RTC_AlarmAEventCallback
	.section	.text.HAL_RTC_AlarmIRQHandler,"ax",%progbits
	.align	1
	.global	HAL_RTC_AlarmIRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_AlarmIRQHandler, %function
HAL_RTC_AlarmIRQHandler:
.LFB347:
	.loc 1 1669 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL14:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 1681 3
	.loc 1 1681 91 is_stmt 0
	mov	r3, #1476395008
	mov	r2, #131072
	str	r2, [r3, #136]
	.loc 1 1715 3 is_stmt 1
	.loc 1 1715 16 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1715 26
	ldr	r2, [r3, #8]
	.loc 1 1715 5
	tst	r2, #4096
	beq	.L16
	.loc 1 1718 5 is_stmt 1
	.loc 1 1718 28 is_stmt 0
	ldr	r2, [r3, #12]
	.loc 1 1718 7
	tst	r2, #256
	bne	.L19
.LVL15:
.L16:
	.loc 1 1732 3 is_stmt 1
	.loc 1 1732 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1732 26
	ldr	r2, [r3, #8]
	.loc 1 1732 5
	tst	r2, #8192
	beq	.L17
	.loc 1 1735 5 is_stmt 1
	.loc 1 1735 28 is_stmt 0
	ldr	r2, [r3, #12]
	.loc 1 1735 7
	tst	r2, #512
	bne	.L20
.L17:
	.loc 1 1751 3 is_stmt 1
	.loc 1 1751 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #33]
	.loc 1 1752 1
	pop	{r4, pc}
.LVL16:
.L19:
	.loc 1 1721 7 is_stmt 1
	.loc 1 1721 89 is_stmt 0
	ldr	r2, [r3, #12]
	.loc 1 1721 71
	uxtb	r2, r2
	orn	r2, r2, #384
	.loc 1 1721 30
	str	r2, [r3, #12]
	.loc 1 1726 7 is_stmt 1
	bl	HAL_RTC_AlarmAEventCallback
.LVL17:
	b	.L16
.L20:
	.loc 1 1738 7
	.loc 1 1738 89 is_stmt 0
	ldr	r2, [r3, #12]
	.loc 1 1738 71
	uxtb	r2, r2
	orn	r2, r2, #640
	.loc 1 1738 30
	str	r2, [r3, #12]
	.loc 1 1744 7 is_stmt 1
	mov	r0, r4
	bl	HAL_RTCEx_AlarmBEventCallback
.LVL18:
	b	.L17
	.cfi_endproc
.LFE347:
	.size	HAL_RTC_AlarmIRQHandler, .-HAL_RTC_AlarmIRQHandler
	.section	.text.HAL_RTC_PollForAlarmAEvent,"ax",%progbits
	.align	1
	.global	HAL_RTC_PollForAlarmAEvent
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_PollForAlarmAEvent, %function
HAL_RTC_PollForAlarmAEvent:
.LFB349:
	.loc 1 1776 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL19:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	mov	r5, r1
	.loc 1 1778 3
	.loc 1 1778 24 is_stmt 0
	bl	HAL_GetTick
.LVL20:
	mov	r6, r0
.LVL21:
	.loc 1 1780 3 is_stmt 1
.L23:
	.loc 1 1780 76
	.loc 1 1780 20 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1780 30
	ldr	r2, [r3, #12]
	.loc 1 1780 76
	tst	r2, #256
	bne	.L28
	.loc 1 1782 5 is_stmt 1
	.loc 1 1782 7 is_stmt 0
	cmp	r5, #-1
	beq	.L23
	.loc 1 1784 7 is_stmt 1
	.loc 1 1784 12 is_stmt 0
	bl	HAL_GetTick
.LVL22:
	.loc 1 1784 26
	subs	r0, r0, r6
	.loc 1 1784 9
	cmp	r0, r5
	bhi	.L24
	.loc 1 1784 50 discriminator 1
	cmp	r5, #0
	bne	.L23
.L24:
	.loc 1 1786 9 is_stmt 1
	.loc 1 1786 21 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #33]
	.loc 1 1787 9 is_stmt 1
	.loc 1 1787 16 is_stmt 0
	b	.L25
.L28:
	.loc 1 1793 3 is_stmt 1
	.loc 1 1793 85 is_stmt 0
	ldr	r2, [r3, #12]
	.loc 1 1793 67
	uxtb	r2, r2
	orn	r2, r2, #384
	.loc 1 1793 26
	str	r2, [r3, #12]
	.loc 1 1796 3 is_stmt 1
	.loc 1 1796 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #33]
	.loc 1 1798 3 is_stmt 1
	.loc 1 1798 10 is_stmt 0
	movs	r0, #0
.L25:
	.loc 1 1799 1
	pop	{r4, r5, r6, pc}
	.cfi_endproc
.LFE349:
	.size	HAL_RTC_PollForAlarmAEvent, .-HAL_RTC_PollForAlarmAEvent
	.section	.text.HAL_RTC_WaitForSynchro,"ax",%progbits
	.align	1
	.global	HAL_RTC_WaitForSynchro
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_WaitForSynchro, %function
HAL_RTC_WaitForSynchro:
.LFB350:
	.loc 1 1835 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL23:
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 1836 3
	.loc 1 1842 3
	.loc 1 1842 7 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1842 23
	ldr	r2, .L36
	str	r2, [r3, #12]
	.loc 1 1845 3 is_stmt 1
	.loc 1 1845 15 is_stmt 0
	bl	HAL_GetTick
.LVL24:
	mov	r5, r0
.LVL25:
	.loc 1 1851 5 is_stmt 1
.L30:
	.loc 1 1851 52
	.loc 1 1851 17 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1851 27
	ldr	r3, [r3, #12]
	.loc 1 1851 52
	tst	r3, #32
	bne	.L35
	.loc 1 1854 7 is_stmt 1
	.loc 1 1854 11 is_stmt 0
	bl	HAL_GetTick
.LVL26:
	.loc 1 1854 25
	subs	r0, r0, r5
	.loc 1 1854 9
	cmp	r0, #1000
	bls	.L30
	.loc 1 1856 16
	movs	r0, #3
	b	.L31
.L35:
	.loc 1 1860 10
	movs	r0, #0
.L31:
	.loc 1 1861 1
	pop	{r3, r4, r5, pc}
.LVL27:
.L37:
	.align	2
.L36:
	.word	261983
	.cfi_endproc
.LFE350:
	.size	HAL_RTC_WaitForSynchro, .-HAL_RTC_WaitForSynchro
	.section	.text.HAL_RTC_GetState,"ax",%progbits
	.align	1
	.global	HAL_RTC_GetState
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_GetState, %function
HAL_RTC_GetState:
.LFB351:
	.loc 1 1887 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL28:
	.loc 1 1889 3
	.loc 1 1889 14 is_stmt 0
	ldrb	r0, [r0, #33]	@ zero_extendqisi2
.LVL29:
	.loc 1 1890 1
	bx	lr
	.cfi_endproc
.LFE351:
	.size	HAL_RTC_GetState, .-HAL_RTC_GetState
	.section	.text.RTC_EnterInitMode,"ax",%progbits
	.align	1
	.global	RTC_EnterInitMode
	.syntax unified
	.thumb
	.thumb_func
	.type	RTC_EnterInitMode, %function
RTC_EnterInitMode:
.LFB352:
	.loc 1 1911 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL30:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 1912 3
	.loc 1 1913 3
.LVL31:
	.loc 1 1926 3
	.loc 1 1926 12 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1926 22
	ldr	r2, [r3, #12]
	.loc 1 1926 6
	tst	r2, #64
	beq	.L46
	.loc 1 1913 21
	movs	r5, #0
.LVL32:
.L40:
	.loc 1 1945 3 is_stmt 1
	.loc 1 1946 1 is_stmt 0
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.LVL33:
.L46:
	mov	r4, r0
	.loc 1 1929 5 is_stmt 1
	.loc 1 1929 25 is_stmt 0
	mov	r2, #-1
	str	r2, [r3, #12]
	.loc 1 1931 5 is_stmt 1
	.loc 1 1931 17 is_stmt 0
	bl	HAL_GetTick
.LVL34:
	mov	r6, r0
.LVL35:
	.loc 1 1934 5 is_stmt 1
	.loc 1 1913 21 is_stmt 0
	movs	r5, #0
.LVL36:
.L42:
	.loc 1 1934 60 is_stmt 1
	.loc 1 1934 18 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1934 28
	ldr	r3, [r3, #12]
	.loc 1 1934 60
	tst	r3, #64
	bne	.L40
	.loc 1 1934 60 discriminator 1
	cmp	r5, #3
	beq	.L40
	.loc 1 1937 7 is_stmt 1
	.loc 1 1937 11 is_stmt 0
	bl	HAL_GetTick
.LVL37:
	.loc 1 1937 25
	subs	r3, r0, r6
	.loc 1 1937 9
	cmp	r3, #1000
	bls	.L42
	.loc 1 1939 9 is_stmt 1
.LVL38:
	.loc 1 1940 9
	.loc 1 1940 21 is_stmt 0
	movs	r5, #3
	strb	r5, [r4, #33]
	b	.L42
	.cfi_endproc
.LFE352:
	.size	RTC_EnterInitMode, .-RTC_EnterInitMode
	.section	.text.RTC_ExitInitMode,"ax",%progbits
	.align	1
	.global	RTC_ExitInitMode
	.syntax unified
	.thumb
	.thumb_func
	.type	RTC_ExitInitMode, %function
RTC_ExitInitMode:
.LFB353:
	.loc 1 1954 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL39:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 1955 3
.LVL40:
	.loc 1 1963 3
	.loc 1 1963 67 is_stmt 0
	ldr	r3, .L52
	ldr	r2, [r3, #12]
	.loc 1 1963 74
	bic	r2, r2, #128
	str	r2, [r3, #12]
	.loc 1 1967 3 is_stmt 1
	.loc 1 1967 71 is_stmt 0
	ldr	r3, [r3, #8]
	.loc 1 1967 6
	tst	r3, #32
	bne	.L48
	.loc 1 1969 5 is_stmt 1
	.loc 1 1969 9 is_stmt 0
	bl	HAL_RTC_WaitForSynchro
.LVL41:
	.loc 1 1969 8
	cbz	r0, .L49
	.loc 1 1971 7 is_stmt 1
	.loc 1 1971 19 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #33]
	.loc 1 1972 7 is_stmt 1
.LVL42:
	b	.L49
.LVL43:
.L48:
	.loc 1 1978 5
	.loc 1 1978 69 is_stmt 0
	ldr	r2, .L52
	ldr	r3, [r2, #8]
	.loc 1 1978 75
	bic	r3, r3, #32
	str	r3, [r2, #8]
	.loc 1 1979 5 is_stmt 1
	.loc 1 1979 9 is_stmt 0
	bl	HAL_RTC_WaitForSynchro
.LVL44:
	.loc 1 1979 8
	cbz	r0, .L50
	.loc 1 1981 7 is_stmt 1
	.loc 1 1981 19 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #33]
	.loc 1 1982 7 is_stmt 1
.LVL45:
.L50:
	.loc 1 1985 5
	.loc 1 1985 69 is_stmt 0
	ldr	r2, .L52
	ldr	r3, [r2, #8]
	.loc 1 1985 75
	orr	r3, r3, #32
	str	r3, [r2, #8]
.LVL46:
.L49:
	.loc 1 1988 3 is_stmt 1
	.loc 1 1989 1 is_stmt 0
	pop	{r4, pc}
.LVL47:
.L53:
	.align	2
.L52:
	.word	1476411392
	.cfi_endproc
.LFE353:
	.size	RTC_ExitInitMode, .-RTC_ExitInitMode
	.section	.text.HAL_RTC_Init,"ax",%progbits
	.align	1
	.global	HAL_RTC_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_Init, %function
HAL_RTC_Init:
.LFB335:
	.loc 1 227 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL48:
	.loc 1 228 3
	.loc 1 231 3
	.loc 1 231 5 is_stmt 0
	cmp	r0, #0
	beq	.L59
	.loc 1 227 1
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 234 5 is_stmt 1
	.loc 1 235 5
	.loc 1 236 5
	.loc 1 237 5
	.loc 1 238 5
	.loc 1 239 5
	.loc 1 240 5
	.loc 1 241 5
	.loc 1 284 5
	.loc 1 284 12 is_stmt 0
	ldrb	r3, [r0, #33]	@ zero_extendqisi2
	.loc 1 284 7
	cbz	r3, .L65
.LVL49:
.L56:
	.loc 1 295 5 is_stmt 1
	.loc 1 295 17 is_stmt 0
	movs	r3, #2
	strb	r3, [r4, #33]
	.loc 1 298 5 is_stmt 1
	.loc 1 298 19 is_stmt 0
	ldr	r3, [r4]
	.loc 1 298 29
	ldr	r2, [r3, #12]
	.loc 1 298 8
	tst	r2, #16
	beq	.L66
	.loc 1 341 14
	movs	r0, #0
.LVL50:
.L57:
	.loc 1 347 7 is_stmt 1
	.loc 1 347 19 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #33]
.L55:
.LVL51:
	.loc 1 352 3 is_stmt 1
	.loc 1 353 1 is_stmt 0
	pop	{r3, r4, r5, pc}
.LVL52:
.L65:
	.loc 1 287 7 is_stmt 1
	.loc 1 287 18 is_stmt 0
	strb	r3, [r0, #32]
	.loc 1 290 7 is_stmt 1
	bl	HAL_RTC_MspInit
.LVL53:
	b	.L56
.L66:
	.loc 1 301 7
	.loc 1 301 11
	.loc 1 301 33 is_stmt 0
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 301 42 is_stmt 1
	.loc 1 301 48 is_stmt 0
	ldr	r3, [r4]
	.loc 1 301 64
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 301 9 is_stmt 1
	.loc 1 304 7
	.loc 1 304 16 is_stmt 0
	mov	r0, r4
	bl	RTC_EnterInitMode
.LVL54:
	.loc 1 305 7 is_stmt 1
	.loc 1 305 10 is_stmt 0
	cbz	r0, .L67
.L58:
.LVL55:
	.loc 1 336 5 is_stmt 1
	.loc 1 336 9
	.loc 1 336 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 336 31
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 336 7 is_stmt 1
.LVL56:
	.loc 1 344 5
	.loc 1 344 8 is_stmt 0
	cmp	r0, #0
	bne	.L55
	b	.L57
.L67:
	.loc 1 312 9 is_stmt 1
	.loc 1 312 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 312 23
	ldr	r1, [r2, #8]
	.loc 1 312 28
	ldr	r3, .L68
	ands	r3, r3, r1
	str	r3, [r2, #8]
	.loc 1 316 9 is_stmt 1
	.loc 1 316 13 is_stmt 0
	ldr	r1, [r4]
	.loc 1 316 23
	ldr	r2, [r1, #8]
	.loc 1 316 42
	ldr	r3, [r4, #4]
	.loc 1 316 66
	ldr	r0, [r4, #16]
.LVL57:
	.loc 1 316 54
	orrs	r3, r3, r0
	.loc 1 316 86
	ldr	r0, [r4, #24]
	.loc 1 316 74
	orrs	r3, r3, r0
	.loc 1 316 28
	orrs	r3, r3, r2
	str	r3, [r1, #8]
	.loc 1 319 9 is_stmt 1
	.loc 1 319 43 is_stmt 0
	ldr	r1, [r4, #8]
	.loc 1 319 93
	ldr	r3, [r4, #12]
	.loc 1 319 13
	ldr	r2, [r4]
	.loc 1 319 67
	orr	r3, r3, r1, lsl #16
	.loc 1 319 30
	str	r3, [r2, #16]
	.loc 1 322 9 is_stmt 1
	.loc 1 322 18 is_stmt 0
	mov	r0, r4
	bl	RTC_ExitInitMode
.LVL58:
	.loc 1 324 7 is_stmt 1
	.loc 1 324 9 is_stmt 0
	cmp	r0, #0
	bne	.L58
	.loc 1 330 9 is_stmt 1
	.loc 1 330 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 330 23
	ldr	r3, [r2, #76]
	.loc 1 330 28
	bic	r3, r3, #3
	str	r3, [r2, #76]
	.loc 1 331 9 is_stmt 1
	.loc 1 331 13 is_stmt 0
	ldr	r1, [r4]
	.loc 1 331 23
	ldr	r3, [r1, #76]
	.loc 1 331 42
	ldr	r2, [r4, #28]
	.loc 1 331 54
	ldr	r5, [r4, #20]
	orrs	r2, r2, r5
	.loc 1 331 28
	orrs	r3, r3, r2
	str	r3, [r1, #76]
	b	.L58
.LVL59:
.L59:
	.cfi_def_cfa_offset 0
	.cfi_restore 3
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 14
	.loc 1 228 21
	movs	r0, #1
.LVL60:
	.loc 1 352 3 is_stmt 1
	.loc 1 353 1 is_stmt 0
	bx	lr
.L69:
	.align	2
.L68:
	.word	-7340097
	.cfi_endproc
.LFE335:
	.size	HAL_RTC_Init, .-HAL_RTC_Init
	.section	.text.HAL_RTC_DeInit,"ax",%progbits
	.align	1
	.global	HAL_RTC_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_DeInit, %function
HAL_RTC_DeInit:
.LFB336:
	.loc 1 362 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL61:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 363 3
.LVL62:
	.loc 1 364 3
	.loc 1 367 3
	.loc 1 367 5 is_stmt 0
	cmp	r0, #0
	beq	.L77
	mov	r4, r0
	.loc 1 370 5 is_stmt 1
	.loc 1 373 5
	.loc 1 373 17 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #33]
	.loc 1 376 5 is_stmt 1
	.loc 1 376 9
	.loc 1 376 15 is_stmt 0
	ldr	r3, [r0]
	.loc 1 376 31
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 376 40 is_stmt 1
	.loc 1 376 46 is_stmt 0
	ldr	r3, [r0]
	.loc 1 376 62
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 376 7 is_stmt 1
	.loc 1 379 5
	.loc 1 379 14 is_stmt 0
	bl	RTC_EnterInitMode
.LVL63:
	.loc 1 381 5 is_stmt 1
	.loc 1 381 8 is_stmt 0
	mov	r5, r0
	cbz	r0, .L79
.LVL64:
.L72:
	.loc 1 433 5 is_stmt 1
	.loc 1 433 7 is_stmt 0
	cmp	r5, #0
	bne	.L71
	.loc 1 441 7 is_stmt 1
	.loc 1 441 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 441 30
	movs	r6, #0
	str	r6, [r3, #64]
	.loc 1 444 7 is_stmt 1
	.loc 1 444 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 444 26
	str	r6, [r3, #76]
	.loc 1 448 7 is_stmt 1
	.loc 1 448 11
	.loc 1 448 17 is_stmt 0
	ldr	r3, [r4]
	.loc 1 448 33
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 448 9 is_stmt 1
	.loc 1 460 7
	mov	r0, r4
	bl	HAL_RTC_MspDeInit
.LVL65:
	.loc 1 463 7
	.loc 1 463 19 is_stmt 0
	strb	r6, [r4, #33]
	.loc 1 466 7 is_stmt 1
	.loc 1 466 11
	.loc 1 466 24 is_stmt 0
	strb	r6, [r4, #32]
	b	.L71
.LVL66:
.L79:
	.loc 1 384 7 is_stmt 1
	.loc 1 384 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 384 26
	movs	r3, #0
	str	r3, [r2]
	.loc 1 385 7 is_stmt 1
	.loc 1 385 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 385 26
	movw	r1, #8449
	str	r1, [r2, #4]
	.loc 1 389 7 is_stmt 1
	.loc 1 389 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 389 26
	str	r3, [r2, #8]
	.loc 1 393 7 is_stmt 1
	.loc 1 393 19 is_stmt 0
	bl	HAL_GetTick
.LVL67:
	mov	r6, r0
.LVL68:
	.loc 1 398 7 is_stmt 1
.L74:
	.loc 1 398 64
	.loc 1 398 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 398 31
	ldr	r2, [r3, #12]
	.loc 1 398 64
	tst	r2, #4
	bne	.L75
	.loc 1 398 64 discriminator 1
	cmp	r5, #3
	beq	.L75
	.loc 1 401 9 is_stmt 1
	.loc 1 401 13 is_stmt 0
	bl	HAL_GetTick
.LVL69:
	.loc 1 401 27
	subs	r0, r0, r6
	.loc 1 401 11
	cmp	r0, #1000
	bls	.L74
	.loc 1 404 11 is_stmt 1
	.loc 1 404 15
	.loc 1 404 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 404 37
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 404 13 is_stmt 1
	.loc 1 407 11
	.loc 1 407 23 is_stmt 0
	movs	r5, #3
.LVL70:
	strb	r5, [r4, #33]
	.loc 1 408 11 is_stmt 1
.LVL71:
	b	.L74
.LVL72:
.L75:
	.loc 1 414 5
	.loc 1 414 8 is_stmt 0
	cbnz	r5, .L71
	.loc 1 417 7 is_stmt 1
	.loc 1 417 26 is_stmt 0
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 420 7 is_stmt 1
	.loc 1 420 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 420 28
	movw	r1, #65535
	str	r1, [r3, #20]
	.loc 1 421 7 is_stmt 1
	.loc 1 421 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 421 28
	ldr	r1, .L80
	str	r1, [r3, #16]
	.loc 1 422 7 is_stmt 1
	.loc 1 422 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 422 30
	str	r2, [r3, #28]
	.loc 1 423 7 is_stmt 1
	.loc 1 423 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 423 30
	str	r2, [r3, #32]
	.loc 1 424 7 is_stmt 1
	.loc 1 424 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 424 30
	str	r2, [r3, #44]
	.loc 1 425 7 is_stmt 1
	.loc 1 425 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 425 28
	str	r2, [r3, #60]
	.loc 1 426 7 is_stmt 1
	.loc 1 426 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 426 32
	str	r2, [r3, #68]
	.loc 1 427 7 is_stmt 1
	.loc 1 427 11 is_stmt 0
	ldr	r3, [r4]
	.loc 1 427 32
	str	r2, [r3, #72]
	.loc 1 430 7 is_stmt 1
	.loc 1 430 16 is_stmt 0
	mov	r0, r4
	bl	RTC_ExitInitMode
.LVL73:
	mov	r5, r0
.LVL74:
	b	.L72
.LVL75:
.L77:
	.loc 1 363 21
	movs	r5, #1
.LVL76:
.L71:
	.loc 1 466 9 is_stmt 1 discriminator 1
	.loc 1 471 3 discriminator 1
	.loc 1 472 1 is_stmt 0 discriminator 1
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.LVL77:
.L81:
	.align	2
.L80:
	.word	8323327
	.cfi_endproc
.LFE336:
	.size	HAL_RTC_DeInit, .-HAL_RTC_DeInit
	.section	.text.RTC_ByteToBcd2,"ax",%progbits
	.align	1
	.global	RTC_ByteToBcd2
	.syntax unified
	.thumb
	.thumb_func
	.type	RTC_ByteToBcd2, %function
RTC_ByteToBcd2:
.LFB354:
	.loc 1 1997 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL78:
	.loc 1 1998 3
	.loc 1 1999 3
	.loc 1 2001 3
	.loc 1 1998 12 is_stmt 0
	movs	r3, #0
	.loc 1 2001 9
	b	.L83
.LVL79:
.L84:
	.loc 1 2003 5 is_stmt 1
	.loc 1 2003 12 is_stmt 0
	adds	r3, r3, #1
.LVL80:
	.loc 1 2004 5 is_stmt 1
	.loc 1 2004 12 is_stmt 0
	subs	r0, r0, #10
.LVL81:
	uxtb	r0, r0
.LVL82:
.L83:
	.loc 1 2001 17 is_stmt 1
	cmp	r0, #9
	bhi	.L84
	.loc 1 2007 3
	.loc 1 2007 11 is_stmt 0
	lsls	r3, r3, #4
.LVL83:
	uxtb	r3, r3
	.loc 1 2008 1
	orrs	r0, r0, r3
.LVL84:
	bx	lr
	.cfi_endproc
.LFE354:
	.size	RTC_ByteToBcd2, .-RTC_ByteToBcd2
	.section	.text.HAL_RTC_SetTime,"ax",%progbits
	.align	1
	.global	HAL_RTC_SetTime
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_SetTime, %function
HAL_RTC_SetTime:
.LFB339:
	.loc 1 815 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL85:
	.loc 1 816 3
	.loc 1 817 1
	.loc 1 820 3
	.loc 1 821 3
	.loc 1 822 3
	.loc 1 825 3
	.loc 1 825 7
	.loc 1 825 16 is_stmt 0
	ldrb	r3, [r0, #32]	@ zero_extendqisi2
	.loc 1 825 9
	cmp	r3, #1
	beq	.L93
	.loc 1 815 1 discriminator 2
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	.loc 1 825 66 is_stmt 1 discriminator 2
	.loc 1 825 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #32]
	.loc 1 825 5 is_stmt 1 discriminator 2
	.loc 1 827 3 discriminator 2
	.loc 1 827 15 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #33]
	.loc 1 830 3 is_stmt 1 discriminator 2
	.loc 1 830 7 discriminator 2
	.loc 1 830 13 is_stmt 0 discriminator 2
	ldr	r3, [r0]
	.loc 1 830 29 discriminator 2
	movs	r2, #202
.LVL86:
	str	r2, [r3, #36]
	.loc 1 830 38 is_stmt 1 discriminator 2
	.loc 1 830 44 is_stmt 0 discriminator 2
	ldr	r3, [r0]
	.loc 1 830 60 discriminator 2
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 830 5 is_stmt 1 discriminator 2
	.loc 1 832 3 discriminator 2
	.loc 1 832 12 is_stmt 0 discriminator 2
	bl	RTC_EnterInitMode
.LVL87:
	.loc 1 833 3 is_stmt 1 discriminator 2
	.loc 1 833 6 is_stmt 0 discriminator 2
	cbnz	r0, .L87
	.loc 1 835 5 is_stmt 1
	.loc 1 835 7 is_stmt 0
	cmp	r6, #0
	bne	.L88
	.loc 1 837 7 is_stmt 1
	.loc 1 837 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 837 25
	ldr	r3, [r3, #8]
	.loc 1 837 9
	tst	r3, #64
	bne	.L89
	.loc 1 844 9 is_stmt 1
	.loc 1 844 27 is_stmt 0
	movs	r3, #0
	strb	r3, [r5, #3]
.L89:
	.loc 1 845 9 is_stmt 1
	.loc 1 847 7
	.loc 1 848 7
	.loc 1 850 7
	.loc 1 850 38 is_stmt 0
	ldrb	r0, [r5]	@ zero_extendqisi2
.LVL88:
	bl	RTC_ByteToBcd2
.LVL89:
	.loc 1 850 67
	lsls	r6, r0, #16
.LVL90:
	.loc 1 851 38
	ldrb	r0, [r5, #1]	@ zero_extendqisi2
	bl	RTC_ByteToBcd2
.LVL91:
	.loc 1 850 77
	orr	r6, r6, r0, lsl #8
	.loc 1 852 38
	ldrb	r0, [r5, #2]	@ zero_extendqisi2
	bl	RTC_ByteToBcd2
.LVL92:
	.loc 1 851 78
	orrs	r0, r0, r6
	.loc 1 853 44
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	.loc 1 850 14
	orr	r0, r0, r3, lsl #22
.LVL93:
.L90:
	.loc 1 876 5 is_stmt 1
	.loc 1 876 9 is_stmt 0
	ldr	r2, [r4]
	.loc 1 876 26
	ldr	r3, .L98
	ands	r3, r3, r0
	.loc 1 876 24
	str	r3, [r2]
	.loc 1 879 5 is_stmt 1
	.loc 1 879 9 is_stmt 0
	ldr	r2, [r4]
	.loc 1 879 19
	ldr	r3, [r2, #8]
	.loc 1 879 24
	bic	r3, r3, #262144
	str	r3, [r2, #8]
	.loc 1 882 5 is_stmt 1
	.loc 1 882 9 is_stmt 0
	ldr	r1, [r4]
	.loc 1 882 19
	ldr	r3, [r1, #8]
	.loc 1 882 43
	ldr	r2, [r5, #12]
	.loc 1 882 67
	ldr	r0, [r5, #16]
.LVL94:
	.loc 1 882 60
	orrs	r2, r2, r0
	.loc 1 882 24
	orrs	r3, r3, r2
	str	r3, [r1, #8]
	.loc 1 885 5 is_stmt 1
	.loc 1 885 14 is_stmt 0
	mov	r0, r4
	bl	RTC_ExitInitMode
.LVL95:
.L87:
	.loc 1 889 3 is_stmt 1
	.loc 1 889 7
	.loc 1 889 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 889 29
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 889 5 is_stmt 1
	.loc 1 891 3
	.loc 1 891 6 is_stmt 0
	cbnz	r0, .L92
	.loc 1 893 5 is_stmt 1
	.loc 1 893 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #33]
.L92:
	.loc 1 897 3 is_stmt 1
	.loc 1 897 7
	.loc 1 897 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #32]
	.loc 1 897 5 is_stmt 1
	.loc 1 899 3
	.loc 1 900 1 is_stmt 0
	pop	{r4, r5, r6, pc}
.LVL96:
.L88:
	.loc 1 857 7 is_stmt 1
	.loc 1 857 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 857 25
	ldr	r3, [r3, #8]
	.loc 1 857 9
	tst	r3, #64
	bne	.L91
	.loc 1 864 9 is_stmt 1
	.loc 1 864 27 is_stmt 0
	movs	r3, #0
	strb	r3, [r5, #3]
.L91:
	.loc 1 865 9 is_stmt 1
	.loc 1 867 7
	.loc 1 868 7
	.loc 1 869 7
	.loc 1 869 34 is_stmt 0
	ldrb	r3, [r5]	@ zero_extendqisi2
	.loc 1 870 34
	ldrb	r0, [r5, #1]	@ zero_extendqisi2
.LVL97:
	.loc 1 870 45
	lsls	r0, r0, #8
	.loc 1 869 53
	orr	r0, r0, r3, lsl #16
	.loc 1 871 34
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	.loc 1 870 54
	orrs	r0, r0, r3
	.loc 1 872 34
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	.loc 1 869 14
	orr	r0, r0, r3, lsl #22
.LVL98:
	b	.L90
.LVL99:
.L93:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 14
	.loc 1 825 47
	movs	r0, #2
.LVL100:
	.loc 1 900 1
	bx	lr
.L99:
	.align	2
.L98:
	.word	8355711
	.cfi_endproc
.LFE339:
	.size	HAL_RTC_SetTime, .-HAL_RTC_SetTime
	.section	.text.HAL_RTC_SetDate,"ax",%progbits
	.align	1
	.global	HAL_RTC_SetDate
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_SetDate, %function
HAL_RTC_SetDate:
.LFB341:
	.loc 1 968 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL101:
	.loc 1 969 3
	.loc 1 970 3
	.loc 1 973 3
	.loc 1 976 3
	.loc 1 976 7
	.loc 1 976 16 is_stmt 0
	ldrb	r3, [r0, #32]	@ zero_extendqisi2
	.loc 1 976 9
	cmp	r3, #1
	beq	.L107
	.loc 1 968 1 discriminator 2
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	mov	r6, r1
	.loc 1 976 66 is_stmt 1 discriminator 2
	.loc 1 976 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #32]
	.loc 1 976 5 is_stmt 1 discriminator 2
	.loc 1 978 3 discriminator 2
	.loc 1 978 15 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #33]
	.loc 1 980 3 is_stmt 1 discriminator 2
	.loc 1 980 5 is_stmt 0 discriminator 2
	cbz	r2, .L102
	.loc 1 985 3 is_stmt 1
	.loc 1 987 3
	.loc 1 1000 5
	.loc 1 1001 5
	.loc 1 1002 5
	.loc 1 1004 5
	.loc 1 1004 36 is_stmt 0
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	.loc 1 1005 36
	ldrb	r5, [r1, #1]	@ zero_extendqisi2
	.loc 1 1005 45
	lsls	r5, r5, #8
	.loc 1 1004 54
	orr	r5, r5, r3, lsl #16
	.loc 1 1006 36
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	.loc 1 1005 54
	orrs	r5, r5, r3
	.loc 1 1007 36
	ldrb	r3, [r1]	@ zero_extendqisi2
	.loc 1 1004 16
	orr	r5, r5, r3, lsl #13
.LVL102:
.L103:
	.loc 1 1011 3 is_stmt 1
	.loc 1 1011 7
	.loc 1 1011 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1011 29
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1011 38 is_stmt 1
	.loc 1 1011 44 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1011 60
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1011 5 is_stmt 1
	.loc 1 1015 3
	.loc 1 1015 12 is_stmt 0
	mov	r0, r4
	bl	RTC_EnterInitMode
.LVL103:
	.loc 1 1016 3 is_stmt 1
	.loc 1 1016 6 is_stmt 0
	cbz	r0, .L112
.L105:
	.loc 1 1027 3 is_stmt 1
	.loc 1 1027 7
	.loc 1 1027 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1027 29
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1027 5 is_stmt 1
	.loc 1 1029 3
	.loc 1 1029 6 is_stmt 0
	cbnz	r0, .L106
	.loc 1 1031 5 is_stmt 1
	.loc 1 1031 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #33]
.L106:
	.loc 1 1035 3 is_stmt 1
	.loc 1 1035 7
	.loc 1 1035 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #32]
	.loc 1 1035 5 is_stmt 1
	.loc 1 1037 3
	.loc 1 1040 1 is_stmt 0
	pop	{r4, r5, r6, pc}
.LVL104:
.L102:
	.loc 1 980 40 discriminator 1
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	.loc 1 980 30 discriminator 1
	tst	r3, #16
	beq	.L104
	.loc 1 982 5 is_stmt 1
	.loc 1 982 44 is_stmt 0
	and	r3, r3, #239
	.loc 1 982 20
	adds	r3, r3, #10
	.loc 1 982 18
	strb	r3, [r1, #1]
.L104:
	.loc 1 985 3 is_stmt 1
	.loc 1 987 3
	.loc 1 989 5
	.loc 1 990 5
	.loc 1 991 5
	.loc 1 993 5
	.loc 1 993 30 is_stmt 0
	ldrb	r0, [r6, #3]	@ zero_extendqisi2
.LVL105:
	bl	RTC_ByteToBcd2
.LVL106:
	.loc 1 993 58
	lsls	r5, r0, #16
	.loc 1 994 30
	ldrb	r0, [r6, #1]	@ zero_extendqisi2
	bl	RTC_ByteToBcd2
.LVL107:
	.loc 1 993 68
	orr	r5, r5, r0, lsl #8
	.loc 1 995 30
	ldrb	r0, [r6, #2]	@ zero_extendqisi2
	bl	RTC_ByteToBcd2
.LVL108:
	.loc 1 994 68
	orrs	r5, r5, r0
	.loc 1 996 35
	ldrb	r3, [r6]	@ zero_extendqisi2
	.loc 1 993 16
	orr	r5, r5, r3, lsl #13
.LVL109:
	b	.L103
.LVL110:
.L112:
	.loc 1 1019 5 is_stmt 1
	.loc 1 1019 9 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1019 26
	ldr	r3, .L113
	ands	r3, r3, r5
	.loc 1 1019 24
	str	r3, [r2, #4]
	.loc 1 1023 5 is_stmt 1
	.loc 1 1023 14 is_stmt 0
	mov	r0, r4
.LVL111:
	bl	RTC_ExitInitMode
.LVL112:
	b	.L105
.LVL113:
.L107:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 14
	.loc 1 976 47
	movs	r0, #2
.LVL114:
	.loc 1 1040 1
	bx	lr
.L114:
	.align	2
.L113:
	.word	16777023
	.cfi_endproc
.LFE341:
	.size	HAL_RTC_SetDate, .-HAL_RTC_SetDate
	.section	.text.HAL_RTC_SetAlarm,"ax",%progbits
	.align	1
	.global	HAL_RTC_SetAlarm
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_SetAlarm, %function
HAL_RTC_SetAlarm:
.LFB343:
	.loc 1 1110 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL115:
	push	{r3, r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	.loc 1 1111 3
	.loc 1 1112 3
	.loc 1 1113 3
	.loc 1 1116 3
	.loc 1 1117 3
	.loc 1 1118 3
	.loc 1 1119 3
	.loc 1 1120 3
	.loc 1 1121 3
	.loc 1 1124 3
	.loc 1 1124 7
	.loc 1 1124 16 is_stmt 0
	ldrb	r3, [r0, #32]	@ zero_extendqisi2
	.loc 1 1124 9
	cmp	r3, #1
	beq	.L127
	mov	r4, r0
	mov	r5, r1
	.loc 1 1124 66 is_stmt 1 discriminator 2
	.loc 1 1124 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #32]
	.loc 1 1124 5 is_stmt 1 discriminator 2
	.loc 1 1126 3 discriminator 2
	.loc 1 1126 15 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #33]
	.loc 1 1128 3 is_stmt 1 discriminator 2
	.loc 1 1128 5 is_stmt 0 discriminator 2
	cmp	r2, #0
	bne	.L117
	.loc 1 1130 5 is_stmt 1
	.loc 1 1130 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1130 23
	ldr	r3, [r3, #8]
	.loc 1 1130 7
	tst	r3, #64
	bne	.L118
	.loc 1 1137 7 is_stmt 1
	.loc 1 1137 36 is_stmt 0
	movs	r3, #0
	strb	r3, [r1, #3]
.L118:
	.loc 1 1138 7 is_stmt 1
	.loc 1 1140 5
	.loc 1 1141 5
	.loc 1 1143 5
	.loc 1 1143 14 is_stmt 0
	ldr	r6, [r5, #28]
	.loc 1 1149 7 is_stmt 1
	.loc 1 1152 5
	.loc 1 1152 26 is_stmt 0
	ldrb	r0, [r5]	@ zero_extendqisi2
.LVL116:
	bl	RTC_ByteToBcd2
.LVL117:
	.loc 1 1152 66
	lsls	r7, r0, #16
	.loc 1 1153 26
	ldrb	r0, [r5, #1]	@ zero_extendqisi2
	bl	RTC_ByteToBcd2
.LVL118:
	.loc 1 1152 76
	orr	r7, r7, r0, lsl #8
	.loc 1 1154 26
	ldrb	r0, [r5, #2]	@ zero_extendqisi2
	bl	RTC_ByteToBcd2
.LVL119:
	.loc 1 1153 77
	orrs	r7, r7, r0
	.loc 1 1155 43
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	.loc 1 1154 77
	orr	r7, r7, r3, lsl #22
	.loc 1 1156 26
	ldrb	r0, [r5, #32]	@ zero_extendqisi2
	bl	RTC_ByteToBcd2
.LVL120:
	.loc 1 1155 65
	orr	r7, r7, r0, lsl #24
	.loc 1 1156 77
	orrs	r6, r6, r7
	.loc 1 1158 32
	ldr	r3, [r5, #20]
	.loc 1 1152 12
	orrs	r6, r6, r3
.LVL121:
.L119:
	.loc 1 1195 3 is_stmt 1
	.loc 1 1195 60 is_stmt 0
	ldr	r7, [r5, #4]
	.loc 1 1195 92
	ldr	r3, [r5, #24]
	.loc 1 1195 19
	orrs	r7, r7, r3
.LVL122:
	.loc 1 1198 3 is_stmt 1
	.loc 1 1198 7
	.loc 1 1198 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1198 29
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1198 38 is_stmt 1
	.loc 1 1198 44 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1198 60
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1198 5 is_stmt 1
	.loc 1 1201 3
	.loc 1 1201 12 is_stmt 0
	ldr	r3, [r5, #36]
	.loc 1 1201 5
	cmp	r3, #256
	beq	.L129
	.loc 1 1241 5 is_stmt 1
	.loc 1 1241 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1241 22
	ldr	r3, [r2, #8]
	.loc 1 1241 27
	bic	r3, r3, #512
	str	r3, [r2, #8]
	.loc 1 1243 5 is_stmt 1
	.loc 1 1243 77 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1243 87
	ldr	r3, [r2, #12]
	.loc 1 1243 69
	uxtb	r3, r3
	orn	r3, r3, #640
	.loc 1 1243 28
	str	r3, [r2, #12]
	.loc 1 1245 5 is_stmt 1
	.loc 1 1245 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1245 22
	ldr	r3, [r2, #8]
	.loc 1 1245 27
	bic	r3, r3, #8192
	str	r3, [r2, #8]
	.loc 1 1247 5 is_stmt 1
	.loc 1 1247 17 is_stmt 0
	bl	HAL_GetTick
.LVL123:
	mov	r5, r0
.LVL124:
	.loc 1 1252 5 is_stmt 1
.L125:
	.loc 1 1252 78
	.loc 1 1252 22 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1252 32
	ldr	r2, [r3, #12]
	.loc 1 1252 78
	tst	r2, #2
	bne	.L130
	.loc 1 1255 7 is_stmt 1
	.loc 1 1255 11 is_stmt 0
	bl	HAL_GetTick
.LVL125:
	.loc 1 1255 25
	subs	r0, r0, r5
	.loc 1 1255 9
	cmp	r0, #1000
	bls	.L125
	.loc 1 1258 9 is_stmt 1
	.loc 1 1258 13
	.loc 1 1258 19 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1258 35
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1258 11 is_stmt 1
	.loc 1 1260 9
	.loc 1 1260 21 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #33]
	.loc 1 1263 9 is_stmt 1
	.loc 1 1263 13
	.loc 1 1263 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #32]
	.loc 1 1263 11 is_stmt 1
	.loc 1 1265 9
	.loc 1 1265 16 is_stmt 0
	b	.L116
.LVL126:
.L117:
	.loc 1 1162 5 is_stmt 1
	.loc 1 1162 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1162 23
	ldr	r3, [r3, #8]
	.loc 1 1162 7
	tst	r3, #64
	bne	.L120
	.loc 1 1169 7 is_stmt 1
	.loc 1 1169 36 is_stmt 0
	movs	r3, #0
	strb	r3, [r1, #3]
.L120:
	.loc 1 1170 7 is_stmt 1
	.loc 1 1173 5
	.loc 1 1174 5
	.loc 1 1176 5
	.loc 1 1176 14 is_stmt 0
	ldr	r6, [r5, #28]
	.loc 1 1182 7 is_stmt 1
	.loc 1 1185 5
	.loc 1 1185 43 is_stmt 0
	ldrb	r2, [r5]	@ zero_extendqisi2
.LVL127:
	.loc 1 1186 43
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	.loc 1 1186 52
	lsls	r3, r3, #8
	.loc 1 1185 60
	orr	r3, r3, r2, lsl #16
	.loc 1 1187 43
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	.loc 1 1186 61
	orrs	r3, r3, r2
	.loc 1 1188 43
	ldrb	r2, [r5, #3]	@ zero_extendqisi2
	.loc 1 1187 61
	orr	r3, r3, r2, lsl #22
	.loc 1 1189 32
	ldrb	r2, [r5, #32]	@ zero_extendqisi2
	.loc 1 1188 65
	orr	r3, r3, r2, lsl #24
	.loc 1 1189 61
	orrs	r6, r6, r3
	.loc 1 1191 32
	ldr	r3, [r5, #20]
	.loc 1 1185 12
	orrs	r6, r6, r3
.LVL128:
	b	.L119
.LVL129:
.L129:
	.loc 1 1204 5 is_stmt 1
	.loc 1 1204 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1204 22
	ldr	r3, [r2, #8]
	.loc 1 1204 27
	bic	r3, r3, #256
	str	r3, [r2, #8]
	.loc 1 1206 5 is_stmt 1
	.loc 1 1206 77 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1206 87
	ldr	r3, [r2, #12]
	.loc 1 1206 69
	uxtb	r3, r3
	orn	r3, r3, #384
	.loc 1 1206 28
	str	r3, [r2, #12]
	.loc 1 1208 5 is_stmt 1
	.loc 1 1208 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1208 22
	ldr	r3, [r2, #8]
	.loc 1 1208 27
	bic	r3, r3, #4096
	str	r3, [r2, #8]
	.loc 1 1210 5 is_stmt 1
	.loc 1 1210 17 is_stmt 0
	bl	HAL_GetTick
.LVL130:
	mov	r5, r0
.LVL131:
	.loc 1 1215 5 is_stmt 1
.L122:
	.loc 1 1215 78
	.loc 1 1215 22 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1215 32
	ldr	r2, [r3, #12]
	.loc 1 1215 78
	tst	r2, #1
	bne	.L131
	.loc 1 1218 7 is_stmt 1
	.loc 1 1218 11 is_stmt 0
	bl	HAL_GetTick
.LVL132:
	.loc 1 1218 25
	subs	r0, r0, r5
	.loc 1 1218 9
	cmp	r0, #1000
	bls	.L122
	.loc 1 1221 9 is_stmt 1
	.loc 1 1221 13
	.loc 1 1221 19 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1221 35
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1221 11 is_stmt 1
	.loc 1 1223 9
	.loc 1 1223 21 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #33]
	.loc 1 1226 9 is_stmt 1
	.loc 1 1226 13
	.loc 1 1226 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #32]
	.loc 1 1226 11 is_stmt 1
	.loc 1 1228 9
	.loc 1 1228 16 is_stmt 0
	b	.L116
.L131:
	.loc 1 1232 5 is_stmt 1
	.loc 1 1232 28 is_stmt 0
	str	r6, [r3, #28]
	.loc 1 1234 5 is_stmt 1
	.loc 1 1234 9 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1234 30
	str	r7, [r3, #68]
	.loc 1 1236 5 is_stmt 1
	.loc 1 1236 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1236 22
	ldr	r3, [r2, #8]
	.loc 1 1236 27
	orr	r3, r3, #256
	str	r3, [r2, #8]
	b	.L124
.L130:
	.loc 1 1269 5 is_stmt 1
	.loc 1 1269 28 is_stmt 0
	str	r6, [r3, #32]
	.loc 1 1271 5 is_stmt 1
	.loc 1 1271 9 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1271 30
	str	r7, [r3, #72]
	.loc 1 1273 5 is_stmt 1
	.loc 1 1273 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1273 22
	ldr	r3, [r2, #8]
	.loc 1 1273 27
	orr	r3, r3, #512
	str	r3, [r2, #8]
.L124:
	.loc 1 1277 3 is_stmt 1
	.loc 1 1277 7
	.loc 1 1277 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1277 29
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1277 5 is_stmt 1
	.loc 1 1280 3
	.loc 1 1280 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #33]
	.loc 1 1283 3 is_stmt 1
	.loc 1 1283 7
	.loc 1 1283 20 is_stmt 0
	movs	r0, #0
	strb	r0, [r4, #32]
	.loc 1 1283 5 is_stmt 1
	.loc 1 1285 3
.LVL133:
.L116:
	.loc 1 1286 1 is_stmt 0
	pop	{r3, r4, r5, r6, r7, pc}
.LVL134:
.L127:
	.loc 1 1124 47
	movs	r0, #2
.LVL135:
	b	.L116
	.cfi_endproc
.LFE343:
	.size	HAL_RTC_SetAlarm, .-HAL_RTC_SetAlarm
	.section	.text.HAL_RTC_SetAlarm_IT,"ax",%progbits
	.align	1
	.global	HAL_RTC_SetAlarm_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_SetAlarm_IT, %function
HAL_RTC_SetAlarm_IT:
.LFB344:
	.loc 1 1302 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL136:
	push	{r3, r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	.loc 1 1303 3
	.loc 1 1304 3
	.loc 1 1305 3
	.loc 1 1308 3
	.loc 1 1309 3
	.loc 1 1310 3
	.loc 1 1311 3
	.loc 1 1312 3
	.loc 1 1313 3
	.loc 1 1316 3
	.loc 1 1316 7
	.loc 1 1316 16 is_stmt 0
	ldrb	r3, [r0, #32]	@ zero_extendqisi2
	.loc 1 1316 9
	cmp	r3, #1
	beq	.L144
	mov	r4, r0
	mov	r5, r1
	.loc 1 1316 66 is_stmt 1 discriminator 2
	.loc 1 1316 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #32]
	.loc 1 1316 5 is_stmt 1 discriminator 2
	.loc 1 1318 3 discriminator 2
	.loc 1 1318 15 is_stmt 0 discriminator 2
	movs	r3, #2
	strb	r3, [r0, #33]
	.loc 1 1320 3 is_stmt 1 discriminator 2
	.loc 1 1320 5 is_stmt 0 discriminator 2
	cmp	r2, #0
	bne	.L134
	.loc 1 1322 5 is_stmt 1
	.loc 1 1322 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1322 23
	ldr	r3, [r3, #8]
	.loc 1 1322 7
	tst	r3, #64
	bne	.L135
	.loc 1 1329 7 is_stmt 1
	.loc 1 1329 36 is_stmt 0
	movs	r3, #0
	strb	r3, [r1, #3]
.L135:
	.loc 1 1330 7 is_stmt 1
	.loc 1 1332 5
	.loc 1 1333 5
	.loc 1 1335 5
	.loc 1 1335 14 is_stmt 0
	ldr	r6, [r5, #28]
	.loc 1 1341 7 is_stmt 1
	.loc 1 1344 5
	.loc 1 1344 26 is_stmt 0
	ldrb	r0, [r5]	@ zero_extendqisi2
.LVL137:
	bl	RTC_ByteToBcd2
.LVL138:
	.loc 1 1344 66
	lsls	r7, r0, #16
	.loc 1 1345 26
	ldrb	r0, [r5, #1]	@ zero_extendqisi2
	bl	RTC_ByteToBcd2
.LVL139:
	.loc 1 1344 76
	orr	r7, r7, r0, lsl #8
	.loc 1 1346 26
	ldrb	r0, [r5, #2]	@ zero_extendqisi2
	bl	RTC_ByteToBcd2
.LVL140:
	.loc 1 1345 77
	orrs	r7, r7, r0
	.loc 1 1347 43
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	.loc 1 1346 77
	orr	r7, r7, r3, lsl #22
	.loc 1 1348 26
	ldrb	r0, [r5, #32]	@ zero_extendqisi2
	bl	RTC_ByteToBcd2
.LVL141:
	.loc 1 1347 65
	orr	r7, r7, r0, lsl #24
	.loc 1 1348 77
	orrs	r6, r6, r7
	.loc 1 1350 32
	ldr	r3, [r5, #20]
	.loc 1 1344 12
	orrs	r6, r6, r3
.LVL142:
.L136:
	.loc 1 1386 3 is_stmt 1
	.loc 1 1386 60 is_stmt 0
	ldr	r7, [r5, #4]
	.loc 1 1386 92
	ldr	r3, [r5, #24]
	.loc 1 1386 19
	orrs	r7, r7, r3
.LVL143:
	.loc 1 1389 3 is_stmt 1
	.loc 1 1389 7
	.loc 1 1389 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1389 29
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1389 38 is_stmt 1
	.loc 1 1389 44 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1389 60
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1389 5 is_stmt 1
	.loc 1 1392 3
	.loc 1 1392 12 is_stmt 0
	ldr	r3, [r5, #36]
	.loc 1 1392 5
	cmp	r3, #256
	beq	.L146
	.loc 1 1433 5 is_stmt 1
	.loc 1 1433 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1433 22
	ldr	r3, [r2, #8]
	.loc 1 1433 27
	bic	r3, r3, #512
	str	r3, [r2, #8]
	.loc 1 1436 5 is_stmt 1
	.loc 1 1436 77 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1436 87
	ldr	r3, [r2, #12]
	.loc 1 1436 69
	uxtb	r3, r3
	orn	r3, r3, #640
	.loc 1 1436 28
	str	r3, [r2, #12]
	.loc 1 1438 5 is_stmt 1
	.loc 1 1438 17 is_stmt 0
	bl	HAL_GetTick
.LVL144:
	mov	r5, r0
.LVL145:
	.loc 1 1443 5 is_stmt 1
.L142:
	.loc 1 1443 78
	.loc 1 1443 22 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1443 32
	ldr	r2, [r3, #12]
	.loc 1 1443 78
	tst	r2, #2
	bne	.L147
	.loc 1 1446 7 is_stmt 1
	.loc 1 1446 11 is_stmt 0
	bl	HAL_GetTick
.LVL146:
	.loc 1 1446 25
	subs	r0, r0, r5
	.loc 1 1446 9
	cmp	r0, #1000
	bls	.L142
	.loc 1 1449 9 is_stmt 1
	.loc 1 1449 13
	.loc 1 1449 19 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1449 35
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1449 11 is_stmt 1
	.loc 1 1451 9
	.loc 1 1451 21 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #33]
	.loc 1 1454 9 is_stmt 1
	.loc 1 1454 13
	.loc 1 1454 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #32]
	.loc 1 1454 11 is_stmt 1
	.loc 1 1456 9
	.loc 1 1456 16 is_stmt 0
	b	.L133
.LVL147:
.L134:
	.loc 1 1354 5 is_stmt 1
	.loc 1 1354 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1354 23
	ldr	r3, [r3, #8]
	.loc 1 1354 7
	tst	r3, #64
	bne	.L137
	.loc 1 1361 7 is_stmt 1
	.loc 1 1361 36 is_stmt 0
	movs	r3, #0
	strb	r3, [r1, #3]
.L137:
	.loc 1 1362 7 is_stmt 1
	.loc 1 1365 5
	.loc 1 1366 5
	.loc 1 1368 5
	.loc 1 1368 14 is_stmt 0
	ldr	r6, [r5, #28]
	.loc 1 1374 7 is_stmt 1
	.loc 1 1377 5
	.loc 1 1377 43 is_stmt 0
	ldrb	r2, [r5]	@ zero_extendqisi2
.LVL148:
	.loc 1 1378 43
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	.loc 1 1378 52
	lsls	r3, r3, #8
	.loc 1 1377 60
	orr	r3, r3, r2, lsl #16
	.loc 1 1379 43
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	.loc 1 1378 61
	orrs	r3, r3, r2
	.loc 1 1380 43
	ldrb	r2, [r5, #3]	@ zero_extendqisi2
	.loc 1 1379 61
	orr	r3, r3, r2, lsl #22
	.loc 1 1381 32
	ldrb	r2, [r5, #32]	@ zero_extendqisi2
	.loc 1 1380 65
	orr	r3, r3, r2, lsl #24
	.loc 1 1381 61
	orrs	r6, r6, r3
	.loc 1 1383 32
	ldr	r3, [r5, #20]
	.loc 1 1377 12
	orrs	r6, r6, r3
.LVL149:
	b	.L136
.LVL150:
.L146:
	.loc 1 1395 5 is_stmt 1
	.loc 1 1395 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1395 22
	ldr	r3, [r2, #8]
	.loc 1 1395 27
	bic	r3, r3, #256
	str	r3, [r2, #8]
	.loc 1 1398 5 is_stmt 1
	.loc 1 1398 77 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1398 87
	ldr	r3, [r2, #12]
	.loc 1 1398 69
	uxtb	r3, r3
	orn	r3, r3, #384
	.loc 1 1398 28
	str	r3, [r2, #12]
	.loc 1 1400 5 is_stmt 1
	.loc 1 1400 17 is_stmt 0
	bl	HAL_GetTick
.LVL151:
	mov	r5, r0
.LVL152:
	.loc 1 1405 5 is_stmt 1
.L139:
	.loc 1 1405 78
	.loc 1 1405 22 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1405 32
	ldr	r2, [r3, #12]
	.loc 1 1405 78
	tst	r2, #1
	bne	.L148
	.loc 1 1408 7 is_stmt 1
	.loc 1 1408 11 is_stmt 0
	bl	HAL_GetTick
.LVL153:
	.loc 1 1408 25
	subs	r0, r0, r5
	.loc 1 1408 9
	cmp	r0, #1000
	bls	.L139
	.loc 1 1411 9 is_stmt 1
	.loc 1 1411 13
	.loc 1 1411 19 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1411 35
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1411 11 is_stmt 1
	.loc 1 1413 9
	.loc 1 1413 21 is_stmt 0
	movs	r0, #3
	strb	r0, [r4, #33]
	.loc 1 1416 9 is_stmt 1
	.loc 1 1416 13
	.loc 1 1416 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #32]
	.loc 1 1416 11 is_stmt 1
	.loc 1 1418 9
	.loc 1 1418 16 is_stmt 0
	b	.L133
.L148:
	.loc 1 1422 5 is_stmt 1
	.loc 1 1422 28 is_stmt 0
	str	r6, [r3, #28]
	.loc 1 1424 5 is_stmt 1
	.loc 1 1424 9 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1424 30
	str	r7, [r3, #68]
	.loc 1 1426 5 is_stmt 1
	.loc 1 1426 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1426 22
	ldr	r3, [r2, #8]
	.loc 1 1426 27
	orr	r3, r3, #256
	str	r3, [r2, #8]
	.loc 1 1428 5 is_stmt 1
	.loc 1 1428 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1428 22
	ldr	r3, [r2, #8]
	.loc 1 1428 27
	orr	r3, r3, #4096
	str	r3, [r2, #8]
	b	.L141
.L147:
	.loc 1 1460 5 is_stmt 1
	.loc 1 1460 28 is_stmt 0
	str	r6, [r3, #32]
	.loc 1 1462 5 is_stmt 1
	.loc 1 1462 9 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1462 30
	str	r7, [r3, #72]
	.loc 1 1464 5 is_stmt 1
	.loc 1 1464 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1464 22
	ldr	r3, [r2, #8]
	.loc 1 1464 27
	orr	r3, r3, #512
	str	r3, [r2, #8]
	.loc 1 1466 5 is_stmt 1
	.loc 1 1466 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1466 22
	ldr	r3, [r2, #8]
	.loc 1 1466 27
	orr	r3, r3, #8192
	str	r3, [r2, #8]
.L141:
	.loc 1 1480 3 is_stmt 1
	.loc 1 1480 85 is_stmt 0
	mov	r3, #1476395008
	ldr	r2, [r3, #128]
	.loc 1 1480 92
	orr	r2, r2, #131072
	str	r2, [r3, #128]
	.loc 1 1483 3 is_stmt 1
	.loc 1 1483 67 is_stmt 0
	ldr	r2, [r3]
	.loc 1 1483 75
	orr	r2, r2, #131072
	str	r2, [r3]
	.loc 1 1486 3 is_stmt 1
	.loc 1 1486 7
	.loc 1 1486 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1486 29
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1486 5 is_stmt 1
	.loc 1 1488 3
	.loc 1 1488 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #33]
	.loc 1 1491 3 is_stmt 1
	.loc 1 1491 7
	.loc 1 1491 20 is_stmt 0
	movs	r0, #0
	strb	r0, [r4, #32]
	.loc 1 1491 5 is_stmt 1
	.loc 1 1493 3
.LVL154:
.L133:
	.loc 1 1494 1 is_stmt 0
	pop	{r3, r4, r5, r6, r7, pc}
.LVL155:
.L144:
	.loc 1 1316 47
	movs	r0, #2
.LVL156:
	b	.L133
	.cfi_endproc
.LFE344:
	.size	HAL_RTC_SetAlarm_IT, .-HAL_RTC_SetAlarm_IT
	.section	.text.RTC_Bcd2ToByte,"ax",%progbits
	.align	1
	.global	RTC_Bcd2ToByte
	.syntax unified
	.thumb
	.thumb_func
	.type	RTC_Bcd2ToByte, %function
RTC_Bcd2ToByte:
.LFB355:
	.loc 1 2016 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL157:
	.loc 1 2017 3
	.loc 1 2018 3
	.loc 1 2018 26 is_stmt 0
	lsrs	r3, r0, #4
	.loc 1 2018 7
	add	r3, r3, r3, lsl #2
.LVL158:
	.loc 1 2019 3 is_stmt 1
	.loc 1 2019 24 is_stmt 0
	and	r0, r0, #15
.LVL159:
	.loc 1 2019 15
	add	r0, r0, r3, lsl #1
	.loc 1 2020 1
	uxtb	r0, r0
	bx	lr
	.cfi_endproc
.LFE355:
	.size	RTC_Bcd2ToByte, .-RTC_Bcd2ToByte
	.section	.text.HAL_RTC_GetTime,"ax",%progbits
	.align	1
	.global	HAL_RTC_GetTime
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_GetTime, %function
HAL_RTC_GetTime:
.LFB340:
	.loc 1 924 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL160:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 925 3
	.loc 1 928 3
	.loc 1 931 3
	.loc 1 931 38 is_stmt 0
	ldr	r3, [r0]
	.loc 1 931 48
	ldr	r3, [r3, #40]
	.loc 1 931 21
	str	r3, [r1, #4]
	.loc 1 934 3 is_stmt 1
	.loc 1 934 42 is_stmt 0
	ldr	r3, [r0]
	.loc 1 934 52
	ldr	r3, [r3, #16]
	.loc 1 934 27
	ubfx	r3, r3, #0, #15
	.loc 1 934 25
	str	r3, [r1, #8]
	.loc 1 937 3 is_stmt 1
	.loc 1 937 27 is_stmt 0
	ldr	r3, [r0]
	.loc 1 937 37
	ldr	r3, [r3]
.LVL161:
	.loc 1 940 3 is_stmt 1
	.loc 1 940 18 is_stmt 0
	ubfx	r0, r3, #16, #6
.LVL162:
	.loc 1 940 16
	strb	r0, [r1]
	.loc 1 941 3 is_stmt 1
	.loc 1 941 20 is_stmt 0
	ubfx	r6, r3, #8, #7
	.loc 1 941 18
	strb	r6, [r1, #1]
	.loc 1 942 3 is_stmt 1
	.loc 1 942 20 is_stmt 0
	and	r5, r3, #127
	.loc 1 942 18
	strb	r5, [r1, #2]
	.loc 1 943 3 is_stmt 1
	.loc 1 943 23 is_stmt 0
	ubfx	r3, r3, #22, #1
.LVL163:
	.loc 1 943 21
	strb	r3, [r1, #3]
	.loc 1 946 3 is_stmt 1
	.loc 1 946 5 is_stmt 0
	cbnz	r2, .L151
	mov	r4, r1
	.loc 1 949 5 is_stmt 1
	.loc 1 949 29 is_stmt 0
	bl	RTC_Bcd2ToByte
.LVL164:
	.loc 1 949 18
	strb	r0, [r4]
	.loc 1 950 5 is_stmt 1
	.loc 1 950 31 is_stmt 0
	mov	r0, r6
	bl	RTC_Bcd2ToByte
.LVL165:
	.loc 1 950 20
	strb	r0, [r4, #1]
	.loc 1 951 5 is_stmt 1
	.loc 1 951 31 is_stmt 0
	mov	r0, r5
	bl	RTC_Bcd2ToByte
.LVL166:
	.loc 1 951 20
	strb	r0, [r4, #2]
.LVL167:
.L151:
	.loc 1 954 3 is_stmt 1
	.loc 1 955 1 is_stmt 0
	movs	r0, #0
	pop	{r4, r5, r6, pc}
	.cfi_endproc
.LFE340:
	.size	HAL_RTC_GetTime, .-HAL_RTC_GetTime
	.section	.text.HAL_RTC_GetDate,"ax",%progbits
	.align	1
	.global	HAL_RTC_GetDate
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_GetDate, %function
HAL_RTC_GetDate:
.LFB342:
	.loc 1 1056 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL168:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 1057 3
	.loc 1 1060 3
	.loc 1 1063 3
	.loc 1 1063 31 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1063 41
	ldr	r3, [r3, #4]
.LVL169:
	.loc 1 1066 3 is_stmt 1
	.loc 1 1066 17 is_stmt 0
	ubfx	r0, r3, #16, #8
.LVL170:
	.loc 1 1066 15
	strb	r0, [r1, #3]
	.loc 1 1067 3 is_stmt 1
	.loc 1 1067 18 is_stmt 0
	ubfx	r6, r3, #8, #5
	.loc 1 1067 16
	strb	r6, [r1, #1]
	.loc 1 1068 3 is_stmt 1
	.loc 1 1068 17 is_stmt 0
	and	r5, r3, #63
	.loc 1 1068 15
	strb	r5, [r1, #2]
	.loc 1 1069 3 is_stmt 1
	.loc 1 1069 20 is_stmt 0
	ubfx	r3, r3, #13, #3
.LVL171:
	.loc 1 1069 18
	strb	r3, [r1]
	.loc 1 1072 3 is_stmt 1
	.loc 1 1072 5 is_stmt 0
	cbnz	r2, .L154
	mov	r4, r1
	.loc 1 1075 5 is_stmt 1
	.loc 1 1075 28 is_stmt 0
	bl	RTC_Bcd2ToByte
.LVL172:
	.loc 1 1075 17
	strb	r0, [r4, #3]
	.loc 1 1076 5 is_stmt 1
	.loc 1 1076 29 is_stmt 0
	mov	r0, r6
	bl	RTC_Bcd2ToByte
.LVL173:
	.loc 1 1076 18
	strb	r0, [r4, #1]
	.loc 1 1077 5 is_stmt 1
	.loc 1 1077 28 is_stmt 0
	mov	r0, r5
	bl	RTC_Bcd2ToByte
.LVL174:
	.loc 1 1077 17
	strb	r0, [r4, #2]
.LVL175:
.L154:
	.loc 1 1079 3 is_stmt 1
	.loc 1 1080 1 is_stmt 0
	movs	r0, #0
	pop	{r4, r5, r6, pc}
	.cfi_endproc
.LFE342:
	.size	HAL_RTC_GetDate, .-HAL_RTC_GetDate
	.section	.text.HAL_RTC_GetAlarm,"ax",%progbits
	.align	1
	.global	HAL_RTC_GetAlarm
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_RTC_GetAlarm, %function
HAL_RTC_GetAlarm:
.LFB346:
	.loc 1 1608 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL176:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r1
	.loc 1 1609 3
	.loc 1 1610 3
	.loc 1 1613 3
	.loc 1 1614 3
	.loc 1 1616 3
	.loc 1 1616 5 is_stmt 0
	cmp	r2, #256
	beq	.L161
	.loc 1 1636 5 is_stmt 1
	.loc 1 1636 19 is_stmt 0
	mov	r2, #512
.LVL177:
	str	r2, [r1, #36]
	.loc 1 1638 5 is_stmt 1
	.loc 1 1638 29 is_stmt 0
	ldr	r1, [r0]
.LVL178:
	.loc 1 1638 12
	ldr	r2, [r1, #32]
.LVL179:
	.loc 1 1639 5 is_stmt 1
	.loc 1 1639 49 is_stmt 0
	ldr	r1, [r1, #72]
	.loc 1 1639 21
	ubfx	r1, r1, #0, #15
.LVL180:
	.loc 1 1642 5 is_stmt 1
	.loc 1 1642 31 is_stmt 0
	ubfx	r0, r2, #16, #6
.LVL181:
	.loc 1 1642 29
	strb	r0, [r4]
	.loc 1 1643 5 is_stmt 1
	.loc 1 1643 33 is_stmt 0
	ubfx	r0, r2, #8, #7
	.loc 1 1643 31
	strb	r0, [r4, #1]
	.loc 1 1644 5 is_stmt 1
	.loc 1 1644 33 is_stmt 0
	and	r0, r2, #127
	.loc 1 1644 31
	strb	r0, [r4, #2]
	.loc 1 1645 5 is_stmt 1
	.loc 1 1645 36 is_stmt 0
	ubfx	r0, r2, #22, #1
	.loc 1 1645 34
	strb	r0, [r4, #3]
	.loc 1 1646 5 is_stmt 1
	.loc 1 1646 34 is_stmt 0
	str	r1, [r4, #4]
	.loc 1 1647 5 is_stmt 1
	.loc 1 1647 32 is_stmt 0
	ubfx	r1, r2, #24, #6
.LVL182:
	.loc 1 1647 30
	strb	r1, [r4, #32]
	.loc 1 1648 5 is_stmt 1
	.loc 1 1648 35 is_stmt 0
	and	r1, r2, #1073741824
	.loc 1 1648 33
	str	r1, [r4, #28]
	.loc 1 1649 5 is_stmt 1
	.loc 1 1649 25 is_stmt 0
	and	r2, r2, #-2139062144
.LVL183:
	.loc 1 1649 23
	str	r2, [r4, #20]
.LVL184:
.L158:
	.loc 1 1652 3 is_stmt 1
	.loc 1 1652 5 is_stmt 0
	cbnz	r3, .L159
	.loc 1 1654 5 is_stmt 1
	.loc 1 1654 31 is_stmt 0
	ldrb	r0, [r4]	@ zero_extendqisi2
	bl	RTC_Bcd2ToByte
.LVL185:
	.loc 1 1654 29
	strb	r0, [r4]
	.loc 1 1655 5 is_stmt 1
	.loc 1 1655 33 is_stmt 0
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	bl	RTC_Bcd2ToByte
.LVL186:
	.loc 1 1655 31
	strb	r0, [r4, #1]
	.loc 1 1656 5 is_stmt 1
	.loc 1 1656 33 is_stmt 0
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	bl	RTC_Bcd2ToByte
.LVL187:
	.loc 1 1656 31
	strb	r0, [r4, #2]
	.loc 1 1657 5 is_stmt 1
	.loc 1 1657 32 is_stmt 0
	ldrb	r0, [r4, #32]	@ zero_extendqisi2
	bl	RTC_Bcd2ToByte
.LVL188:
	.loc 1 1657 30
	strb	r0, [r4, #32]
.L159:
	.loc 1 1660 3 is_stmt 1
	.loc 1 1661 1 is_stmt 0
	movs	r0, #0
	pop	{r4, pc}
.LVL189:
.L161:
	.loc 1 1619 5 is_stmt 1
	.loc 1 1619 19 is_stmt 0
	str	r2, [r1, #36]
	.loc 1 1621 5 is_stmt 1
	.loc 1 1621 29 is_stmt 0
	ldr	r1, [r0]
.LVL190:
	.loc 1 1621 12
	ldr	r2, [r1, #28]
.LVL191:
	.loc 1 1622 5 is_stmt 1
	.loc 1 1622 49 is_stmt 0
	ldr	r1, [r1, #68]
	.loc 1 1622 21
	ubfx	r1, r1, #0, #15
.LVL192:
	.loc 1 1625 5 is_stmt 1
	.loc 1 1625 31 is_stmt 0
	ubfx	r0, r2, #16, #6
.LVL193:
	.loc 1 1625 29
	strb	r0, [r4]
	.loc 1 1626 5 is_stmt 1
	.loc 1 1626 33 is_stmt 0
	ubfx	r0, r2, #8, #7
	.loc 1 1626 31
	strb	r0, [r4, #1]
	.loc 1 1627 5 is_stmt 1
	.loc 1 1627 33 is_stmt 0
	and	r0, r2, #127
	.loc 1 1627 31
	strb	r0, [r4, #2]
	.loc 1 1628 5 is_stmt 1
	.loc 1 1628 36 is_stmt 0
	ubfx	r0, r2, #22, #1
	.loc 1 1628 34
	strb	r0, [r4, #3]
	.loc 1 1629 5 is_stmt 1
	.loc 1 1629 34 is_stmt 0
	str	r1, [r4, #4]
	.loc 1 1630 5 is_stmt 1
	.loc 1 1630 32 is_stmt 0
	ubfx	r1, r2, #24, #6
.LVL194:
	.loc 1 1630 30
	strb	r1, [r4, #32]
	.loc 1 1631 5 is_stmt 1
	.loc 1 1631 35 is_stmt 0
	and	r1, r2, #1073741824
	.loc 1 1631 33
	str	r1, [r4, #28]
	.loc 1 1632 5 is_stmt 1
	.loc 1 1632 25 is_stmt 0
	and	r2, r2, #-2139062144
.LVL195:
	.loc 1 1632 23
	str	r2, [r4, #20]
	b	.L158
	.cfi_endproc
.LFE346:
	.size	HAL_RTC_GetAlarm, .-HAL_RTC_GetAlarm
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_rtc.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_rtc_ex.h"
	.file 8 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x112d
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x18
	.4byte	.LASF177
	.byte	0x1d
	.4byte	.LASF178
	.4byte	.LASF179
	.4byte	.LLRL59
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x8
	.byte	0x2
	.byte	0x5
	.4byte	.LASF0
	.uleb128 0x8
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0xa
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x40
	.uleb128 0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x8
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0xa
	.4byte	.LASF6
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x61
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x8
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x19
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0xa
	.4byte	.LASF11
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x34
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x55
	.uleb128 0x15
	.4byte	0x90
	.uleb128 0x16
	.4byte	0x90
	.4byte	0xb1
	.uleb128 0x17
	.4byte	0x7d
	.byte	0x1
	.byte	0
	.uleb128 0x16
	.4byte	0x90
	.4byte	0xc1
	.uleb128 0x17
	.4byte	0x7d
	.byte	0x9
	.byte	0
	.uleb128 0x11
	.byte	0xac
	.2byte	0x351
	.4byte	0x26a
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
	.4byte	0xb1
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
	.uleb128 0x9
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
	.uleb128 0x9
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
	.uleb128 0x9
	.ascii	"PR3\000"
	.2byte	0x372
	.byte	0x13
	.4byte	0x9c
	.byte	0xa8
	.byte	0
	.uleb128 0x12
	.4byte	.LASF42
	.2byte	0x373
	.byte	0x2
	.4byte	0xc1
	.uleb128 0x11
	.byte	0x2c
	.2byte	0x37e
	.4byte	0x30e
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
	.uleb128 0x9
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
	.uleb128 0x9
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
	.uleb128 0x9
	.ascii	"PR3\000"
	.2byte	0x38a
	.byte	0x13
	.4byte	0x9c
	.byte	0x28
	.byte	0
	.uleb128 0x12
	.4byte	.LASF43
	.2byte	0x38b
	.byte	0x2
	.4byte	0x276
	.uleb128 0x11
	.byte	0xd0
	.2byte	0x517
	.4byte	0x5c3
	.uleb128 0x9
	.ascii	"TR\000"
	.2byte	0x519
	.byte	0x15
	.4byte	0x9c
	.byte	0
	.uleb128 0x9
	.ascii	"DR\000"
	.2byte	0x51a
	.byte	0x15
	.4byte	0x9c
	.byte	0x4
	.uleb128 0x9
	.ascii	"CR\000"
	.2byte	0x51b
	.byte	0x15
	.4byte	0x9c
	.byte	0x8
	.uleb128 0x9
	.ascii	"ISR\000"
	.2byte	0x51c
	.byte	0x15
	.4byte	0x9c
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF44
	.2byte	0x51d
	.byte	0x15
	.4byte	0x9c
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF45
	.2byte	0x51e
	.byte	0x15
	.4byte	0x9c
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF46
	.2byte	0x51f
	.byte	0x11
	.4byte	0x90
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF47
	.2byte	0x520
	.byte	0x15
	.4byte	0x9c
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF48
	.2byte	0x521
	.byte	0x15
	.4byte	0x9c
	.byte	0x20
	.uleb128 0x9
	.ascii	"WPR\000"
	.2byte	0x522
	.byte	0x15
	.4byte	0x9c
	.byte	0x24
	.uleb128 0x9
	.ascii	"SSR\000"
	.2byte	0x523
	.byte	0x15
	.4byte	0x9c
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF49
	.2byte	0x524
	.byte	0x15
	.4byte	0x9c
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF50
	.2byte	0x525
	.byte	0x15
	.4byte	0x9c
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF51
	.2byte	0x526
	.byte	0x15
	.4byte	0x9c
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF52
	.2byte	0x527
	.byte	0x15
	.4byte	0x9c
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF53
	.2byte	0x528
	.byte	0x15
	.4byte	0x9c
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF54
	.2byte	0x529
	.byte	0x15
	.4byte	0x9c
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF55
	.2byte	0x52a
	.byte	0x15
	.4byte	0x9c
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF56
	.2byte	0x52b
	.byte	0x15
	.4byte	0x9c
	.byte	0x48
	.uleb128 0x9
	.ascii	"OR\000"
	.2byte	0x52c
	.byte	0x15
	.4byte	0x9c
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF57
	.2byte	0x52d
	.byte	0x15
	.4byte	0x9c
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF58
	.2byte	0x52e
	.byte	0x15
	.4byte	0x9c
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF59
	.2byte	0x52f
	.byte	0x15
	.4byte	0x9c
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF60
	.2byte	0x530
	.byte	0x15
	.4byte	0x9c
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF61
	.2byte	0x531
	.byte	0x15
	.4byte	0x9c
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF62
	.2byte	0x532
	.byte	0x15
	.4byte	0x9c
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF63
	.2byte	0x533
	.byte	0x15
	.4byte	0x9c
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF64
	.2byte	0x534
	.byte	0x15
	.4byte	0x9c
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF65
	.2byte	0x535
	.byte	0x15
	.4byte	0x9c
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF66
	.2byte	0x536
	.byte	0x15
	.4byte	0x9c
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF67
	.2byte	0x537
	.byte	0x15
	.4byte	0x9c
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF68
	.2byte	0x538
	.byte	0x15
	.4byte	0x9c
	.byte	0x7c
	.uleb128 0x1
	.4byte	.LASF69
	.2byte	0x539
	.byte	0x15
	.4byte	0x9c
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF70
	.2byte	0x53a
	.byte	0x15
	.4byte	0x9c
	.byte	0x84
	.uleb128 0x1
	.4byte	.LASF71
	.2byte	0x53b
	.byte	0x15
	.4byte	0x9c
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF72
	.2byte	0x53c
	.byte	0x15
	.4byte	0x9c
	.byte	0x8c
	.uleb128 0x1
	.4byte	.LASF73
	.2byte	0x53d
	.byte	0x15
	.4byte	0x9c
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF74
	.2byte	0x53e
	.byte	0x15
	.4byte	0x9c
	.byte	0x94
	.uleb128 0x1
	.4byte	.LASF75
	.2byte	0x53f
	.byte	0x15
	.4byte	0x9c
	.byte	0x98
	.uleb128 0x1
	.4byte	.LASF76
	.2byte	0x540
	.byte	0x15
	.4byte	0x9c
	.byte	0x9c
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0x541
	.byte	0x15
	.4byte	0x9c
	.byte	0xa0
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x542
	.byte	0x15
	.4byte	0x9c
	.byte	0xa4
	.uleb128 0x1
	.4byte	.LASF79
	.2byte	0x543
	.byte	0x15
	.4byte	0x9c
	.byte	0xa8
	.uleb128 0x1
	.4byte	.LASF80
	.2byte	0x544
	.byte	0x15
	.4byte	0x9c
	.byte	0xac
	.uleb128 0x1
	.4byte	.LASF81
	.2byte	0x545
	.byte	0x15
	.4byte	0x9c
	.byte	0xb0
	.uleb128 0x1
	.4byte	.LASF82
	.2byte	0x546
	.byte	0x15
	.4byte	0x9c
	.byte	0xb4
	.uleb128 0x1
	.4byte	.LASF83
	.2byte	0x547
	.byte	0x15
	.4byte	0x9c
	.byte	0xb8
	.uleb128 0x1
	.4byte	.LASF84
	.2byte	0x548
	.byte	0x15
	.4byte	0x9c
	.byte	0xbc
	.uleb128 0x1
	.4byte	.LASF85
	.2byte	0x549
	.byte	0x15
	.4byte	0x9c
	.byte	0xc0
	.uleb128 0x1
	.4byte	.LASF86
	.2byte	0x54a
	.byte	0x15
	.4byte	0x9c
	.byte	0xc4
	.uleb128 0x1
	.4byte	.LASF87
	.2byte	0x54b
	.byte	0x15
	.4byte	0x9c
	.byte	0xc8
	.uleb128 0x1
	.4byte	.LASF88
	.2byte	0x54c
	.byte	0x15
	.4byte	0x9c
	.byte	0xcc
	.byte	0
	.uleb128 0x12
	.4byte	.LASF89
	.2byte	0x54d
	.byte	0x3
	.4byte	0x31a
	.uleb128 0x8
	.byte	0x8
	.byte	0x4
	.4byte	.LASF90
	.uleb128 0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF91
	.uleb128 0x8
	.byte	0x4
	.byte	0x4
	.4byte	.LASF92
	.uleb128 0x8
	.byte	0x8
	.byte	0x4
	.4byte	.LASF93
	.uleb128 0x13
	.4byte	0x40
	.byte	0x5
	.byte	0x28
	.4byte	0x60f
	.uleb128 0xb
	.4byte	.LASF94
	.byte	0
	.uleb128 0xb
	.4byte	.LASF95
	.byte	0x1
	.uleb128 0xb
	.4byte	.LASF96
	.byte	0x2
	.uleb128 0xb
	.4byte	.LASF97
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.4byte	.LASF98
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0x5eb
	.uleb128 0x13
	.4byte	0x40
	.byte	0x5
	.byte	0x33
	.4byte	0x633
	.uleb128 0xb
	.4byte	.LASF99
	.byte	0
	.uleb128 0xb
	.4byte	.LASF100
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.4byte	.LASF101
	.byte	0x5
	.byte	0x36
	.byte	0x3
	.4byte	0x61b
	.uleb128 0x13
	.4byte	0x40
	.byte	0x6
	.byte	0x2f
	.4byte	0x669
	.uleb128 0xb
	.4byte	.LASF102
	.byte	0
	.uleb128 0xb
	.4byte	.LASF103
	.byte	0x1
	.uleb128 0xb
	.4byte	.LASF104
	.byte	0x2
	.uleb128 0xb
	.4byte	.LASF105
	.byte	0x3
	.uleb128 0xb
	.4byte	.LASF106
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.4byte	.LASF107
	.byte	0x6
	.byte	0x36
	.byte	0x3
	.4byte	0x63f
	.uleb128 0x15
	.4byte	0x669
	.uleb128 0xe
	.byte	0x1c
	.byte	0x3b
	.4byte	0x6d6
	.uleb128 0x4
	.4byte	.LASF108
	.byte	0x3d
	.byte	0xc
	.4byte	0x90
	.byte	0
	.uleb128 0x4
	.4byte	.LASF109
	.byte	0x40
	.byte	0xc
	.4byte	0x90
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF110
	.byte	0x43
	.byte	0xc
	.4byte	0x90
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF111
	.byte	0x46
	.byte	0xc
	.4byte	0x90
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF112
	.byte	0x49
	.byte	0xc
	.4byte	0x90
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF113
	.byte	0x4c
	.byte	0xc
	.4byte	0x90
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF114
	.byte	0x4f
	.byte	0xc
	.4byte	0x90
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.4byte	.LASF115
	.byte	0x6
	.byte	0x55
	.byte	0x3
	.4byte	0x67a
	.uleb128 0xe
	.byte	0x14
	.byte	0x5a
	.4byte	0x74a
	.uleb128 0x4
	.4byte	.LASF116
	.byte	0x5c
	.byte	0xb
	.4byte	0x84
	.byte	0
	.uleb128 0x4
	.4byte	.LASF117
	.byte	0x60
	.byte	0xb
	.4byte	0x84
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF118
	.byte	0x63
	.byte	0xb
	.4byte	0x84
	.byte	0x2
	.uleb128 0x4
	.4byte	.LASF119
	.byte	0x66
	.byte	0xb
	.4byte	0x84
	.byte	0x3
	.uleb128 0x4
	.4byte	.LASF120
	.byte	0x69
	.byte	0xc
	.4byte	0x90
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF121
	.byte	0x6d
	.byte	0xc
	.4byte	0x90
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF122
	.byte	0x73
	.byte	0xc
	.4byte	0x90
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF123
	.byte	0x76
	.byte	0xc
	.4byte	0x90
	.byte	0x10
	.byte	0
	.uleb128 0xa
	.4byte	.LASF124
	.byte	0x6
	.byte	0x79
	.byte	0x3
	.4byte	0x6e2
	.uleb128 0xe
	.byte	0x4
	.byte	0x7e
	.4byte	0x78e
	.uleb128 0x4
	.4byte	.LASF125
	.byte	0x80
	.byte	0xb
	.4byte	0x84
	.byte	0
	.uleb128 0x4
	.4byte	.LASF126
	.byte	0x83
	.byte	0xb
	.4byte	0x84
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF127
	.byte	0x86
	.byte	0xb
	.4byte	0x84
	.byte	0x2
	.uleb128 0x4
	.4byte	.LASF128
	.byte	0x89
	.byte	0xb
	.4byte	0x84
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.4byte	.LASF129
	.byte	0x6
	.byte	0x8c
	.byte	0x3
	.4byte	0x756
	.uleb128 0xe
	.byte	0x28
	.byte	0x91
	.4byte	0x7ea
	.uleb128 0x4
	.4byte	.LASF130
	.byte	0x93
	.byte	0x13
	.4byte	0x74a
	.byte	0
	.uleb128 0x4
	.4byte	.LASF131
	.byte	0x95
	.byte	0xc
	.4byte	0x90
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF132
	.byte	0x98
	.byte	0xc
	.4byte	0x90
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF133
	.byte	0x9b
	.byte	0xc
	.4byte	0x90
	.byte	0x1c
	.uleb128 0x4
	.4byte	.LASF134
	.byte	0x9e
	.byte	0xb
	.4byte	0x84
	.byte	0x20
	.uleb128 0x4
	.4byte	.LASF135
	.byte	0xa2
	.byte	0xc
	.4byte	0x90
	.byte	0x24
	.byte	0
	.uleb128 0xa
	.4byte	.LASF136
	.byte	0x6
	.byte	0xa4
	.byte	0x3
	.4byte	0x79a
	.uleb128 0xe
	.byte	0x24
	.byte	0xac
	.4byte	0x82e
	.uleb128 0x4
	.4byte	.LASF137
	.byte	0xaf
	.byte	0x10
	.4byte	0x82e
	.byte	0
	.uleb128 0x4
	.4byte	.LASF138
	.byte	0xb1
	.byte	0x13
	.4byte	0x6d6
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF139
	.byte	0xb3
	.byte	0x13
	.4byte	0x633
	.byte	0x20
	.uleb128 0x4
	.4byte	.LASF140
	.byte	0xb5
	.byte	0x20
	.4byte	0x675
	.byte	0x21
	.byte	0
	.uleb128 0xf
	.4byte	0x5c3
	.uleb128 0xa
	.4byte	.LASF141
	.byte	0x6
	.byte	0xdc
	.byte	0x3
	.4byte	0x7f6
	.uleb128 0x1a
	.4byte	.LASF180
	.byte	0x7
	.2byte	0x6dd
	.byte	0x6
	.4byte	0x852
	.uleb128 0x1b
	.4byte	0x852
	.byte	0
	.uleb128 0xf
	.4byte	0x833
	.uleb128 0x1c
	.4byte	.LASF181
	.byte	0x8
	.2byte	0x433
	.byte	0xa
	.4byte	0x90
	.uleb128 0x6
	.4byte	.LASF142
	.2byte	0x7df
	.byte	0x9
	.4byte	0x84
	.4byte	.LFB355
	.4byte	.LFE355-.LFB355
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8a2
	.uleb128 0x3
	.4byte	.LASF144
	.2byte	0x7df
	.byte	0x20
	.4byte	0x84
	.4byte	.LLST44
	.uleb128 0x1d
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x7e1
	.byte	0xb
	.4byte	0x84
	.uleb128 0x5
	.byte	0x73
	.sleb128 0
	.byte	0x31
	.byte	0x24
	.byte	0x9f
	.byte	0
	.uleb128 0x6
	.4byte	.LASF143
	.2byte	0x7cc
	.byte	0x9
	.4byte	0x84
	.4byte	.LFB354
	.4byte	.LFE354-.LFB354
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8ed
	.uleb128 0x3
	.4byte	.LASF144
	.2byte	0x7cc
	.byte	0x20
	.4byte	0x84
	.4byte	.LLST19
	.uleb128 0x5
	.4byte	.LASF145
	.2byte	0x7ce
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST20
	.uleb128 0x5
	.4byte	.LASF146
	.2byte	0x7cf
	.byte	0xb
	.4byte	0x84
	.4byte	.LLST21
	.byte	0
	.uleb128 0x6
	.4byte	.LASF147
	.2byte	0x7a1
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB353
	.4byte	.LFE353-.LFB353
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x945
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x7a1
	.byte	0x37
	.4byte	0x852
	.4byte	.LLST12
	.uleb128 0x5
	.4byte	.LASF149
	.2byte	0x7a3
	.byte	0x15
	.4byte	0x60f
	.4byte	.LLST13
	.uleb128 0xc
	.4byte	.LVL41
	.4byte	0x9cd
	.4byte	0x93b
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL44
	.4byte	0x9cd
	.byte	0
	.uleb128 0x6
	.4byte	.LASF150
	.2byte	0x776
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB352
	.4byte	.LFE352-.LFB352
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9a2
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x776
	.byte	0x38
	.4byte	0x852
	.4byte	.LLST9
	.uleb128 0x5
	.4byte	.LASF151
	.2byte	0x778
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST10
	.uleb128 0x5
	.4byte	.LASF149
	.2byte	0x779
	.byte	0x15
	.4byte	0x60f
	.4byte	.LLST11
	.uleb128 0x2
	.4byte	.LVL34
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL37
	.4byte	0x857
	.byte	0
	.uleb128 0x6
	.4byte	.LASF152
	.2byte	0x75e
	.byte	0x15
	.4byte	0x669
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9cd
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x75e
	.byte	0x39
	.4byte	0x852
	.4byte	.LLST8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF153
	.2byte	0x72a
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa1a
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x72a
	.byte	0x3d
	.4byte	0x852
	.4byte	.LLST6
	.uleb128 0x5
	.4byte	.LASF151
	.2byte	0x72c
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST7
	.uleb128 0x2
	.4byte	.LVL24
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL26
	.4byte	0x857
	.byte	0
	.uleb128 0x6
	.4byte	.LASF154
	.2byte	0x6ef
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa76
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x6ef
	.byte	0x41
	.4byte	0x852
	.4byte	.LLST4
	.uleb128 0x3
	.4byte	.LASF155
	.2byte	0x6ef
	.byte	0x50
	.4byte	0x90
	.4byte	.LLST5
	.uleb128 0x1e
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x6f2
	.byte	0xc
	.4byte	0x90
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x2
	.4byte	.LVL20
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL22
	.4byte	0x857
	.byte	0
	.uleb128 0x10
	.4byte	.LASF156
	.2byte	0x6df
	.byte	0x1c
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa9b
	.uleb128 0x14
	.4byte	.LASF148
	.2byte	0x6df
	.byte	0x4b
	.4byte	0x852
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x10
	.4byte	.LASF157
	.2byte	0x684
	.byte	0x6
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xadb
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x684
	.byte	0x31
	.4byte	0x852
	.4byte	.LLST3
	.uleb128 0x2
	.4byte	.LVL17
	.4byte	0xa76
	.uleb128 0xd
	.4byte	.LVL18
	.4byte	0x83f
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF158
	.2byte	0x647
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb7a
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x647
	.byte	0x37
	.4byte	0x852
	.4byte	.LLST53
	.uleb128 0x3
	.4byte	.LASF159
	.2byte	0x647
	.byte	0x4f
	.4byte	0xb7a
	.4byte	.LLST54
	.uleb128 0x3
	.4byte	.LASF135
	.2byte	0x647
	.byte	0x60
	.4byte	0x90
	.4byte	.LLST55
	.uleb128 0x3
	.4byte	.LASF160
	.2byte	0x647
	.byte	0x70
	.4byte	0x90
	.4byte	.LLST56
	.uleb128 0x5
	.4byte	.LASF161
	.2byte	0x649
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST57
	.uleb128 0x5
	.4byte	.LASF162
	.2byte	0x64a
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST58
	.uleb128 0x2
	.4byte	.LVL185
	.4byte	0x864
	.uleb128 0x2
	.4byte	.LVL186
	.4byte	0x864
	.uleb128 0x2
	.4byte	.LVL187
	.4byte	0x864
	.uleb128 0x2
	.4byte	.LVL188
	.4byte	0x864
	.byte	0
	.uleb128 0xf
	.4byte	0x7ea
	.uleb128 0x6
	.4byte	.LASF163
	.2byte	0x5e1
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbee
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x5e1
	.byte	0x3e
	.4byte	0x852
	.4byte	.LLST0
	.uleb128 0x3
	.4byte	.LASF135
	.2byte	0x5e1
	.byte	0x4d
	.4byte	0x90
	.4byte	.LLST1
	.uleb128 0x5
	.4byte	.LASF151
	.2byte	0x5e3
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST2
	.uleb128 0x2
	.4byte	.LVL3
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL5
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL7
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL9
	.4byte	0x857
	.byte	0
	.uleb128 0x6
	.4byte	.LASF164
	.2byte	0x515
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcb1
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x515
	.byte	0x3a
	.4byte	0x852
	.4byte	.LLST38
	.uleb128 0x3
	.4byte	.LASF159
	.2byte	0x515
	.byte	0x52
	.4byte	0xb7a
	.4byte	.LLST39
	.uleb128 0x3
	.4byte	.LASF160
	.2byte	0x515
	.byte	0x63
	.4byte	0x90
	.4byte	.LLST40
	.uleb128 0x5
	.4byte	.LASF151
	.2byte	0x517
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST41
	.uleb128 0x5
	.4byte	.LASF161
	.2byte	0x518
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST42
	.uleb128 0x5
	.4byte	.LASF162
	.2byte	0x519
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST43
	.uleb128 0x2
	.4byte	.LVL138
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL139
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL140
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL141
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL144
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL146
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL151
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL153
	.4byte	0x857
	.byte	0
	.uleb128 0x6
	.4byte	.LASF165
	.2byte	0x455
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd74
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x455
	.byte	0x37
	.4byte	0x852
	.4byte	.LLST32
	.uleb128 0x3
	.4byte	.LASF159
	.2byte	0x455
	.byte	0x4f
	.4byte	0xb7a
	.4byte	.LLST33
	.uleb128 0x3
	.4byte	.LASF160
	.2byte	0x455
	.byte	0x60
	.4byte	0x90
	.4byte	.LLST34
	.uleb128 0x5
	.4byte	.LASF151
	.2byte	0x457
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST35
	.uleb128 0x5
	.4byte	.LASF161
	.2byte	0x458
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST36
	.uleb128 0x5
	.4byte	.LASF162
	.2byte	0x459
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST37
	.uleb128 0x2
	.4byte	.LVL117
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL118
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL119
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL120
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL123
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL125
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL130
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL132
	.4byte	0x857
	.byte	0
	.uleb128 0x6
	.4byte	.LASF166
	.2byte	0x41f
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdfc
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x41f
	.byte	0x36
	.4byte	0x852
	.4byte	.LLST49
	.uleb128 0x3
	.4byte	.LASF167
	.2byte	0x41f
	.byte	0x4d
	.4byte	0xdfc
	.4byte	.LLST50
	.uleb128 0x3
	.4byte	.LASF160
	.2byte	0x41f
	.byte	0x5d
	.4byte	0x90
	.4byte	.LLST51
	.uleb128 0x5
	.4byte	.LASF168
	.2byte	0x421
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST52
	.uleb128 0x2
	.4byte	.LVL172
	.4byte	0x864
	.uleb128 0xc
	.4byte	.LVL173
	.4byte	0x864
	.4byte	0xdeb
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL174
	.4byte	0x864
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	0x78e
	.uleb128 0x6
	.4byte	.LASF169
	.2byte	0x3c7
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xeab
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x3c7
	.byte	0x36
	.4byte	0x852
	.4byte	.LLST27
	.uleb128 0x3
	.4byte	.LASF167
	.2byte	0x3c7
	.byte	0x4d
	.4byte	0xdfc
	.4byte	.LLST28
	.uleb128 0x3
	.4byte	.LASF160
	.2byte	0x3c7
	.byte	0x5d
	.4byte	0x90
	.4byte	.LLST29
	.uleb128 0x5
	.4byte	.LASF168
	.2byte	0x3c9
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST30
	.uleb128 0x5
	.4byte	.LASF149
	.2byte	0x3ca
	.byte	0x15
	.4byte	0x60f
	.4byte	.LLST31
	.uleb128 0xc
	.4byte	.LVL103
	.4byte	0x945
	.4byte	0xe7f
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL106
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL107
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL108
	.4byte	0x8a2
	.uleb128 0xd
	.4byte	.LVL112
	.4byte	0x8ed
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF170
	.2byte	0x39b
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf33
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x39b
	.byte	0x36
	.4byte	0x852
	.4byte	.LLST45
	.uleb128 0x3
	.4byte	.LASF171
	.2byte	0x39b
	.byte	0x4d
	.4byte	0xf33
	.4byte	.LLST46
	.uleb128 0x3
	.4byte	.LASF160
	.2byte	0x39b
	.byte	0x5d
	.4byte	0x90
	.4byte	.LLST47
	.uleb128 0x5
	.4byte	.LASF161
	.2byte	0x39d
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST48
	.uleb128 0x2
	.4byte	.LVL164
	.4byte	0x864
	.uleb128 0xc
	.4byte	.LVL165
	.4byte	0x864
	.4byte	0xf22
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL166
	.4byte	0x864
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	0x74a
	.uleb128 0x6
	.4byte	.LASF172
	.2byte	0x32e
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfe2
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x32e
	.byte	0x36
	.4byte	0x852
	.4byte	.LLST22
	.uleb128 0x3
	.4byte	.LASF171
	.2byte	0x32e
	.byte	0x4d
	.4byte	0xf33
	.4byte	.LLST23
	.uleb128 0x3
	.4byte	.LASF160
	.2byte	0x32e
	.byte	0x5d
	.4byte	0x90
	.4byte	.LLST24
	.uleb128 0x5
	.4byte	.LASF161
	.2byte	0x330
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST25
	.uleb128 0x5
	.4byte	.LASF149
	.2byte	0x331
	.byte	0x13
	.4byte	0x60f
	.4byte	.LLST26
	.uleb128 0xc
	.4byte	.LVL87
	.4byte	0x945
	.4byte	0xfb6
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL89
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL91
	.4byte	0x8a2
	.uleb128 0x2
	.4byte	.LVL92
	.4byte	0x8a2
	.uleb128 0xd
	.4byte	.LVL95
	.4byte	0x8ed
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF173
	.2byte	0x308
	.byte	0x1c
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1007
	.uleb128 0x14
	.4byte	.LASF148
	.2byte	0x308
	.byte	0x41
	.4byte	0x852
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x10
	.4byte	.LASF174
	.2byte	0x2f9
	.byte	0x1c
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x102c
	.uleb128 0x14
	.4byte	.LASF148
	.2byte	0x2f9
	.byte	0x3f
	.4byte	0x852
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.4byte	.LASF175
	.2byte	0x169
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10c1
	.uleb128 0x3
	.4byte	.LASF148
	.2byte	0x169
	.byte	0x35
	.4byte	0x852
	.4byte	.LLST16
	.uleb128 0x5
	.4byte	.LASF149
	.2byte	0x16b
	.byte	0x15
	.4byte	0x60f
	.4byte	.LLST17
	.uleb128 0x5
	.4byte	.LASF151
	.2byte	0x16c
	.byte	0xc
	.4byte	0x90
	.4byte	.LLST18
	.uleb128 0xc
	.4byte	.LVL63
	.4byte	0x945
	.4byte	0x108a
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xc
	.4byte	.LVL65
	.4byte	0xfe2
	.4byte	0x109e
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL67
	.4byte	0x857
	.uleb128 0x2
	.4byte	.LVL69
	.4byte	0x857
	.uleb128 0xd
	.4byte	.LVL73
	.4byte	0x8ed
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF176
	.byte	0x1
	.byte	0xe2
	.byte	0x13
	.4byte	0x60f
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.4byte	.LASF148
	.byte	0x1
	.byte	0xe2
	.byte	0x33
	.4byte	0x852
	.4byte	.LLST14
	.uleb128 0x21
	.4byte	.LASF149
	.byte	0x1
	.byte	0xe4
	.byte	0x15
	.4byte	0x60f
	.4byte	.LLST15
	.uleb128 0xc
	.4byte	.LVL53
	.4byte	0x1007
	.4byte	0x110b
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xc
	.4byte	.LVL54
	.4byte	0x945
	.4byte	0x111f
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL58
	.4byte	0x8ed
	.uleb128 0x7
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
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
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
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x18
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
	.uleb128 0x20
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
	.uleb128 0x21
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
.LLST44:
	.byte	0x6
	.4byte	.LVL157
	.byte	0x4
	.uleb128 .LVL157-.LVL157
	.uleb128 .LVL159-.LVL157
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL159-.LVL157
	.uleb128 .LFE355-.LVL157
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL78
	.byte	0x4
	.uleb128 .LVL78-.LVL78
	.uleb128 .LVL79-.LVL78
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL79-.LVL78
	.uleb128 .LFE354-.LVL78
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST20:
	.byte	0x6
	.4byte	.LVL78
	.byte	0x4
	.uleb128 .LVL78-.LVL78
	.uleb128 .LVL79-.LVL78
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL79-.LVL78
	.uleb128 .LVL83-.LVL78
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST21:
	.byte	0x6
	.4byte	.LVL78
	.byte	0x4
	.uleb128 .LVL78-.LVL78
	.uleb128 .LVL81-.LVL78
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL82-.LVL78
	.uleb128 .LVL84-.LVL78
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST12:
	.byte	0x6
	.4byte	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL41-1-.LVL39
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL41-1-.LVL39
	.uleb128 .LVL43-.LVL39
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL43-.LVL39
	.uleb128 .LVL44-1-.LVL39
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL44-1-.LVL39
	.uleb128 .LVL47-.LVL39
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL47-.LVL39
	.uleb128 .LFE353-.LVL39
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL40
	.byte	0x4
	.uleb128 .LVL40-.LVL40
	.uleb128 .LVL42-.LVL40
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL42-.LVL40
	.uleb128 .LVL43-.LVL40
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL40
	.uleb128 .LVL45-.LVL40
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL45-.LVL40
	.uleb128 .LFE353-.LVL40
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL30
	.byte	0x4
	.uleb128 .LVL30-.LVL30
	.uleb128 .LVL32-.LVL30
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL32-.LVL30
	.uleb128 .LVL33-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL33-.LVL30
	.uleb128 .LVL34-1-.LVL30
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL34-1-.LVL30
	.uleb128 .LFE352-.LVL30
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL35
	.byte	0x4
	.uleb128 .LVL35-.LVL35
	.uleb128 .LVL36-.LVL35
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL36-.LVL35
	.uleb128 .LFE352-.LVL35
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL31
	.byte	0x4
	.uleb128 .LVL31-.LVL31
	.uleb128 .LVL32-.LVL31
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL32-.LVL31
	.uleb128 .LVL33-.LVL31
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL33-.LVL31
	.uleb128 .LVL36-.LVL31
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL31
	.uleb128 .LVL38-.LVL31
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL38-.LVL31
	.uleb128 .LFE352-.LVL31
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL28
	.byte	0x4
	.uleb128 .LVL28-.LVL28
	.uleb128 .LVL29-.LVL28
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL29-.LVL28
	.uleb128 .LFE351-.LVL28
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL23
	.byte	0x4
	.uleb128 .LVL23-.LVL23
	.uleb128 .LVL24-1-.LVL23
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL24-1-.LVL23
	.uleb128 .LVL27-.LVL23
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL27-.LVL23
	.uleb128 .LFE350-.LVL23
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x8
	.4byte	.LVL25
	.uleb128 .LVL27-.LVL25
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL20-1-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL20-1-.LVL19
	.uleb128 .LFE349-.LVL19
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL20-1-.LVL19
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL20-1-.LVL19
	.uleb128 .LFE349-.LVL19
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL14
	.byte	0x4
	.uleb128 .LVL14-.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL15-.LVL14
	.uleb128 .LVL16-.LVL14
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL16-.LVL14
	.uleb128 .LVL17-1-.LVL14
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL17-1-.LVL14
	.uleb128 .LFE347-.LVL14
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST53:
	.byte	0x6
	.4byte	.LVL176
	.byte	0x4
	.uleb128 .LVL176-.LVL176
	.uleb128 .LVL181-.LVL176
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL181-.LVL176
	.uleb128 .LVL189-.LVL176
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL189-.LVL176
	.uleb128 .LVL193-.LVL176
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL193-.LVL176
	.uleb128 .LFE346-.LVL176
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST54:
	.byte	0x6
	.4byte	.LVL176
	.byte	0x4
	.uleb128 .LVL176-.LVL176
	.uleb128 .LVL178-.LVL176
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL178-.LVL176
	.uleb128 .LVL189-.LVL176
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL189-.LVL176
	.uleb128 .LVL190-.LVL176
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL190-.LVL176
	.uleb128 .LFE346-.LVL176
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST55:
	.byte	0x6
	.4byte	.LVL176
	.byte	0x4
	.uleb128 .LVL176-.LVL176
	.uleb128 .LVL177-.LVL176
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL177-.LVL176
	.uleb128 .LVL189-.LVL176
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL189-.LVL176
	.uleb128 .LVL191-.LVL176
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL191-.LVL176
	.uleb128 .LFE346-.LVL176
	.uleb128 0x2
	.byte	0x74
	.sleb128 36
	.byte	0
.LLST56:
	.byte	0x6
	.4byte	.LVL176
	.byte	0x4
	.uleb128 .LVL176-.LVL176
	.uleb128 .LVL185-1-.LVL176
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL185-1-.LVL176
	.uleb128 .LVL189-.LVL176
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL189-.LVL176
	.uleb128 .LFE346-.LVL176
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST57:
	.byte	0x6
	.4byte	.LVL179
	.byte	0x4
	.uleb128 .LVL179-.LVL179
	.uleb128 .LVL183-.LVL179
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL191-.LVL179
	.uleb128 .LVL195-.LVL179
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST58:
	.byte	0x6
	.4byte	.LVL180
	.byte	0x4
	.uleb128 .LVL180-.LVL180
	.uleb128 .LVL182-.LVL180
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL182-.LVL180
	.uleb128 .LVL184-.LVL180
	.uleb128 0x2
	.byte	0x74
	.sleb128 4
	.byte	0x4
	.uleb128 .LVL192-.LVL180
	.uleb128 .LVL194-.LVL180
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL194-.LVL180
	.uleb128 .LFE346-.LVL180
	.uleb128 0x2
	.byte	0x74
	.sleb128 4
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL2
	.byte	0x4
	.uleb128 .LVL2-.LVL2
	.uleb128 .LVL3-1-.LVL2
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-1-.LVL2
	.uleb128 .LVL6-.LVL2
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL6-.LVL2
	.uleb128 .LVL7-1-.LVL2
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL7-1-.LVL2
	.uleb128 .LVL10-.LVL2
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL10-.LVL2
	.uleb128 .LVL11-.LVL2
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL11-.LVL2
	.uleb128 .LVL12-.LVL2
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL12-.LVL2
	.uleb128 .LFE345-.LVL2
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL2
	.byte	0x4
	.uleb128 .LVL2-.LVL2
	.uleb128 .LVL3-1-.LVL2
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL3-1-.LVL2
	.uleb128 .LVL6-.LVL2
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL2
	.uleb128 .LVL7-1-.LVL2
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL7-1-.LVL2
	.uleb128 .LVL11-.LVL2
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL11-.LVL2
	.uleb128 .LFE345-.LVL2
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL6-.LVL4
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL8-.LVL4
	.uleb128 .LVL10-.LVL4
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST38:
	.byte	0x6
	.4byte	.LVL136
	.byte	0x4
	.uleb128 .LVL136-.LVL136
	.uleb128 .LVL137-.LVL136
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL137-.LVL136
	.uleb128 .LVL147-.LVL136
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL147-.LVL136
	.uleb128 .LVL150-.LVL136
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL150-.LVL136
	.uleb128 .LVL154-.LVL136
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL154-.LVL136
	.uleb128 .LVL155-.LVL136
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL155-.LVL136
	.uleb128 .LVL156-.LVL136
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL156-.LVL136
	.uleb128 .LFE344-.LVL136
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST39:
	.byte	0x6
	.4byte	.LVL136
	.byte	0x4
	.uleb128 .LVL136-.LVL136
	.uleb128 .LVL138-1-.LVL136
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL138-1-.LVL136
	.uleb128 .LVL145-.LVL136
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL145-.LVL136
	.uleb128 .LVL147-.LVL136
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL147-.LVL136
	.uleb128 .LVL150-.LVL136
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL150-.LVL136
	.uleb128 .LVL152-.LVL136
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL152-.LVL136
	.uleb128 .LVL155-.LVL136
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL155-.LVL136
	.uleb128 .LFE344-.LVL136
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST40:
	.byte	0x6
	.4byte	.LVL136
	.byte	0x4
	.uleb128 .LVL136-.LVL136
	.uleb128 .LVL138-1-.LVL136
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL138-1-.LVL136
	.uleb128 .LVL147-.LVL136
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL147-.LVL136
	.uleb128 .LVL148-.LVL136
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL148-.LVL136
	.uleb128 .LVL155-.LVL136
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL155-.LVL136
	.uleb128 .LFE344-.LVL136
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST41:
	.byte	0x6
	.4byte	.LVL145
	.byte	0x4
	.uleb128 .LVL145-.LVL145
	.uleb128 .LVL147-.LVL145
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL152-.LVL145
	.uleb128 .LVL154-.LVL145
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST42:
	.byte	0x6
	.4byte	.LVL142
	.byte	0x4
	.uleb128 .LVL142-.LVL142
	.uleb128 .LVL147-.LVL142
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL149-.LVL142
	.uleb128 .LVL154-.LVL142
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST43:
	.byte	0x6
	.4byte	.LVL143
	.byte	0x4
	.uleb128 .LVL143-.LVL143
	.uleb128 .LVL147-.LVL143
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL150-.LVL143
	.uleb128 .LVL154-.LVL143
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LLST32:
	.byte	0x6
	.4byte	.LVL115
	.byte	0x4
	.uleb128 .LVL115-.LVL115
	.uleb128 .LVL116-.LVL115
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL116-.LVL115
	.uleb128 .LVL126-.LVL115
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL126-.LVL115
	.uleb128 .LVL129-.LVL115
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL129-.LVL115
	.uleb128 .LVL133-.LVL115
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL133-.LVL115
	.uleb128 .LVL134-.LVL115
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL134-.LVL115
	.uleb128 .LVL135-.LVL115
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL135-.LVL115
	.uleb128 .LFE343-.LVL115
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST33:
	.byte	0x6
	.4byte	.LVL115
	.byte	0x4
	.uleb128 .LVL115-.LVL115
	.uleb128 .LVL117-1-.LVL115
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL117-1-.LVL115
	.uleb128 .LVL124-.LVL115
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL124-.LVL115
	.uleb128 .LVL126-.LVL115
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL126-.LVL115
	.uleb128 .LVL129-.LVL115
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL129-.LVL115
	.uleb128 .LVL131-.LVL115
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL131-.LVL115
	.uleb128 .LVL134-.LVL115
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL134-.LVL115
	.uleb128 .LFE343-.LVL115
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST34:
	.byte	0x6
	.4byte	.LVL115
	.byte	0x4
	.uleb128 .LVL115-.LVL115
	.uleb128 .LVL117-1-.LVL115
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL117-1-.LVL115
	.uleb128 .LVL126-.LVL115
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL126-.LVL115
	.uleb128 .LVL127-.LVL115
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL127-.LVL115
	.uleb128 .LVL134-.LVL115
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL134-.LVL115
	.uleb128 .LFE343-.LVL115
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST35:
	.byte	0x6
	.4byte	.LVL124
	.byte	0x4
	.uleb128 .LVL124-.LVL124
	.uleb128 .LVL126-.LVL124
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL131-.LVL124
	.uleb128 .LVL133-.LVL124
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST36:
	.byte	0x6
	.4byte	.LVL121
	.byte	0x4
	.uleb128 .LVL121-.LVL121
	.uleb128 .LVL126-.LVL121
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL128-.LVL121
	.uleb128 .LVL133-.LVL121
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST37:
	.byte	0x6
	.4byte	.LVL122
	.byte	0x4
	.uleb128 .LVL122-.LVL122
	.uleb128 .LVL126-.LVL122
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL129-.LVL122
	.uleb128 .LVL133-.LVL122
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LLST49:
	.byte	0x6
	.4byte	.LVL168
	.byte	0x4
	.uleb128 .LVL168-.LVL168
	.uleb128 .LVL170-.LVL168
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL170-.LVL168
	.uleb128 .LFE342-.LVL168
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST50:
	.byte	0x6
	.4byte	.LVL168
	.byte	0x4
	.uleb128 .LVL168-.LVL168
	.uleb128 .LVL172-1-.LVL168
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL172-1-.LVL168
	.uleb128 .LVL175-.LVL168
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL175-.LVL168
	.uleb128 .LFE342-.LVL168
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST51:
	.byte	0x6
	.4byte	.LVL168
	.byte	0x4
	.uleb128 .LVL168-.LVL168
	.uleb128 .LVL172-1-.LVL168
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL172-1-.LVL168
	.uleb128 .LFE342-.LVL168
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST52:
	.byte	0x8
	.4byte	.LVL169
	.uleb128 .LVL171-.LVL169
	.uleb128 0x9
	.byte	0x73
	.sleb128 0
	.byte	0xc
	.4byte	0xffff3f
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST27:
	.byte	0x6
	.4byte	.LVL101
	.byte	0x4
	.uleb128 .LVL101-.LVL101
	.uleb128 .LVL102-.LVL101
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL102-.LVL101
	.uleb128 .LVL104-.LVL101
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL104-.LVL101
	.uleb128 .LVL105-.LVL101
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL105-.LVL101
	.uleb128 .LVL113-.LVL101
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL113-.LVL101
	.uleb128 .LVL114-.LVL101
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL114-.LVL101
	.uleb128 .LFE341-.LVL101
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST28:
	.byte	0x6
	.4byte	.LVL101
	.byte	0x4
	.uleb128 .LVL101-.LVL101
	.uleb128 .LVL102-.LVL101
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL102-.LVL101
	.uleb128 .LVL104-.LVL101
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL104-.LVL101
	.uleb128 .LVL106-1-.LVL101
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL106-1-.LVL101
	.uleb128 .LVL113-.LVL101
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL113-.LVL101
	.uleb128 .LFE341-.LVL101
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST29:
	.byte	0x6
	.4byte	.LVL101
	.byte	0x4
	.uleb128 .LVL101-.LVL101
	.uleb128 .LVL102-.LVL101
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL102-.LVL101
	.uleb128 .LVL104-.LVL101
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL104-.LVL101
	.uleb128 .LVL106-1-.LVL101
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL106-1-.LVL101
	.uleb128 .LVL113-.LVL101
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL113-.LVL101
	.uleb128 .LFE341-.LVL101
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST30:
	.byte	0x6
	.4byte	.LVL102
	.byte	0x4
	.uleb128 .LVL102-.LVL102
	.uleb128 .LVL104-.LVL102
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL109-.LVL102
	.uleb128 .LVL113-.LVL102
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST31:
	.byte	0x6
	.4byte	.LVL103
	.byte	0x4
	.uleb128 .LVL103-.LVL103
	.uleb128 .LVL104-.LVL103
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL110-.LVL103
	.uleb128 .LVL111-.LVL103
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL112-.LVL103
	.uleb128 .LVL113-.LVL103
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST45:
	.byte	0x6
	.4byte	.LVL160
	.byte	0x4
	.uleb128 .LVL160-.LVL160
	.uleb128 .LVL162-.LVL160
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL162-.LVL160
	.uleb128 .LFE340-.LVL160
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST46:
	.byte	0x6
	.4byte	.LVL160
	.byte	0x4
	.uleb128 .LVL160-.LVL160
	.uleb128 .LVL164-1-.LVL160
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL164-1-.LVL160
	.uleb128 .LVL167-.LVL160
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL167-.LVL160
	.uleb128 .LFE340-.LVL160
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST47:
	.byte	0x6
	.4byte	.LVL160
	.byte	0x4
	.uleb128 .LVL160-.LVL160
	.uleb128 .LVL164-1-.LVL160
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL164-1-.LVL160
	.uleb128 .LFE340-.LVL160
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST48:
	.byte	0x8
	.4byte	.LVL161
	.uleb128 .LVL163-.LVL161
	.uleb128 0x9
	.byte	0x73
	.sleb128 0
	.byte	0xc
	.4byte	0x7f7f7f
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST22:
	.byte	0x6
	.4byte	.LVL85
	.byte	0x4
	.uleb128 .LVL85-.LVL85
	.uleb128 .LVL87-1-.LVL85
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL87-1-.LVL85
	.uleb128 .LVL99-.LVL85
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL99-.LVL85
	.uleb128 .LVL100-.LVL85
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL100-.LVL85
	.uleb128 .LFE339-.LVL85
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
	.uleb128 .LVL87-1-.LVL85
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL87-1-.LVL85
	.uleb128 .LVL99-.LVL85
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL99-.LVL85
	.uleb128 .LFE339-.LVL85
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST24:
	.byte	0x6
	.4byte	.LVL85
	.byte	0x4
	.uleb128 .LVL85-.LVL85
	.uleb128 .LVL86-.LVL85
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL86-.LVL85
	.uleb128 .LVL90-.LVL85
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL90-.LVL85
	.uleb128 .LVL96-.LVL85
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL96-.LVL85
	.uleb128 .LVL99-.LVL85
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL99-.LVL85
	.uleb128 .LFE339-.LVL85
	.uleb128 0x1
	.byte	0x52
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
	.uleb128 .LVL98-.LVL93
	.uleb128 .LVL99-.LVL93
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST26:
	.byte	0x6
	.4byte	.LVL87
	.byte	0x4
	.uleb128 .LVL87-.LVL87
	.uleb128 .LVL88-.LVL87
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL95-.LVL87
	.uleb128 .LVL97-.LVL87
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST16:
	.byte	0x6
	.4byte	.LVL61
	.byte	0x4
	.uleb128 .LVL61-.LVL61
	.uleb128 .LVL63-1-.LVL61
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL63-1-.LVL61
	.uleb128 .LVL75-.LVL61
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL75-.LVL61
	.uleb128 .LVL76-.LVL61
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL76-.LVL61
	.uleb128 .LFE336-.LVL61
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x6
	.4byte	.LVL62
	.byte	0x4
	.uleb128 .LVL62-.LVL62
	.uleb128 .LVL63-.LVL62
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL63-.LVL62
	.uleb128 .LVL64-.LVL62
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL64-.LVL62
	.uleb128 .LVL66-.LVL62
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL66-.LVL62
	.uleb128 .LVL67-1-.LVL62
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL68-.LVL62
	.uleb128 .LVL70-.LVL62
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL71-.LVL62
	.uleb128 .LVL72-.LVL62
	.uleb128 0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL72-.LVL62
	.uleb128 .LVL75-.LVL62
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL75-.LVL62
	.uleb128 .LVL76-.LVL62
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL76-.LVL62
	.uleb128 .LVL77-.LVL62
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST18:
	.byte	0x8
	.4byte	.LVL68
	.uleb128 .LVL75-.LVL68
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL48
	.byte	0x4
	.uleb128 .LVL48-.LVL48
	.uleb128 .LVL49-.LVL48
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL49-.LVL48
	.uleb128 .LVL52-.LVL48
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL52-.LVL48
	.uleb128 .LVL53-1-.LVL48
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL53-1-.LVL48
	.uleb128 .LVL59-.LVL48
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL59-.LVL48
	.uleb128 .LVL60-.LVL48
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL60-.LVL48
	.uleb128 .LFE335-.LVL48
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x6
	.4byte	.LVL48
	.byte	0x4
	.uleb128 .LVL48-.LVL48
	.uleb128 .LVL50-.LVL48
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL51-.LVL48
	.uleb128 .LVL52-.LVL48
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL52-.LVL48
	.uleb128 .LVL54-.LVL48
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL54-.LVL48
	.uleb128 .LVL55-.LVL48
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL56-.LVL48
	.uleb128 .LVL57-.LVL48
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL58-.LVL48
	.uleb128 .LVL59-.LVL48
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL59-.LVL48
	.uleb128 .LVL60-.LVL48
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL60-.LVL48
	.uleb128 .LFE335-.LVL48
	.uleb128 0x1
	.byte	0x50
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
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
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
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.4byte	.LFB354
	.4byte	.LFE354-.LFB354
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.4byte	.LFB355
	.4byte	.LFE355-.LFB355
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
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
.LLRL59:
	.byte	0x7
	.4byte	.LFB337
	.uleb128 .LFE337-.LFB337
	.byte	0x7
	.4byte	.LFB338
	.uleb128 .LFE338-.LFB338
	.byte	0x7
	.4byte	.LFB345
	.uleb128 .LFE345-.LFB345
	.byte	0x7
	.4byte	.LFB348
	.uleb128 .LFE348-.LFB348
	.byte	0x7
	.4byte	.LFB347
	.uleb128 .LFE347-.LFB347
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
	.byte	0x7
	.4byte	.LFB335
	.uleb128 .LFE335-.LFB335
	.byte	0x7
	.4byte	.LFB336
	.uleb128 .LFE336-.LFB336
	.byte	0x7
	.4byte	.LFB354
	.uleb128 .LFE354-.LFB354
	.byte	0x7
	.4byte	.LFB339
	.uleb128 .LFE339-.LFB339
	.byte	0x7
	.4byte	.LFB341
	.uleb128 .LFE341-.LFB341
	.byte	0x7
	.4byte	.LFB343
	.uleb128 .LFE343-.LFB343
	.byte	0x7
	.4byte	.LFB344
	.uleb128 .LFE344-.LFB344
	.byte	0x7
	.4byte	.LFB355
	.uleb128 .LFE355-.LFB355
	.byte	0x7
	.4byte	.LFB340
	.uleb128 .LFE340-.LFB340
	.byte	0x7
	.4byte	.LFB342
	.uleb128 .LFE342-.LFB342
	.byte	0x7
	.4byte	.LFB346
	.uleb128 .LFE346-.LFB346
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF32:
	.ascii	"D3PCR3H\000"
.LASF31:
	.ascii	"D3PCR3L\000"
.LASF110:
	.ascii	"SynchPrediv\000"
.LASF138:
	.ascii	"Init\000"
.LASF83:
	.ascii	"BKP26R\000"
.LASF157:
	.ascii	"HAL_RTC_AlarmIRQHandler\000"
.LASF164:
	.ascii	"HAL_RTC_SetAlarm_IT\000"
.LASF5:
	.ascii	"__uint8_t\000"
.LASF96:
	.ascii	"HAL_BUSY\000"
.LASF87:
	.ascii	"BKP30R\000"
.LASF14:
	.ascii	"FTSR1\000"
.LASF21:
	.ascii	"FTSR2\000"
.LASF54:
	.ascii	"TAMPCR\000"
.LASF44:
	.ascii	"PRER\000"
.LASF133:
	.ascii	"AlarmDateWeekDaySel\000"
.LASF72:
	.ascii	"BKP15R\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF180:
	.ascii	"HAL_RTCEx_AlarmBEventCallback\000"
.LASF152:
	.ascii	"HAL_RTC_GetState\000"
.LASF86:
	.ascii	"BKP29R\000"
.LASF174:
	.ascii	"HAL_RTC_MspInit\000"
.LASF136:
	.ascii	"RTC_AlarmTypeDef\000"
.LASF15:
	.ascii	"SWIER1\000"
.LASF141:
	.ascii	"RTC_HandleTypeDef\000"
.LASF29:
	.ascii	"SWIER3\000"
.LASF119:
	.ascii	"TimeFormat\000"
.LASF114:
	.ascii	"OutPutType\000"
.LASF8:
	.ascii	"long long int\000"
.LASF1:
	.ascii	"signed char\000"
.LASF150:
	.ascii	"RTC_EnterInitMode\000"
.LASF84:
	.ascii	"BKP27R\000"
.LASF52:
	.ascii	"TSSSR\000"
.LASF161:
	.ascii	"tmpreg\000"
.LASF101:
	.ascii	"HAL_LockTypeDef\000"
.LASF134:
	.ascii	"AlarmDateWeekDay\000"
.LASF4:
	.ascii	"long int\000"
.LASF88:
	.ascii	"BKP31R\000"
.LASF126:
	.ascii	"Month\000"
.LASF56:
	.ascii	"ALRMBSSR\000"
.LASF111:
	.ascii	"OutPut\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF131:
	.ascii	"AlarmMask\000"
.LASF73:
	.ascii	"BKP16R\000"
.LASF102:
	.ascii	"HAL_RTC_STATE_RESET\000"
.LASF165:
	.ascii	"HAL_RTC_SetAlarm\000"
.LASF59:
	.ascii	"BKP2R\000"
.LASF93:
	.ascii	"double\000"
.LASF13:
	.ascii	"RTSR1\000"
.LASF173:
	.ascii	"HAL_RTC_MspDeInit\000"
.LASF20:
	.ascii	"RTSR2\000"
.LASF105:
	.ascii	"HAL_RTC_STATE_TIMEOUT\000"
.LASF139:
	.ascii	"Lock\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF172:
	.ascii	"HAL_RTC_SetTime\000"
.LASF155:
	.ascii	"Timeout\000"
.LASF113:
	.ascii	"OutPutPolarity\000"
.LASF85:
	.ascii	"BKP28R\000"
.LASF97:
	.ascii	"HAL_TIMEOUT\000"
.LASF55:
	.ascii	"ALRMASSR\000"
.LASF175:
	.ascii	"HAL_RTC_DeInit\000"
.LASF51:
	.ascii	"TSDR\000"
.LASF169:
	.ascii	"HAL_RTC_SetDate\000"
.LASF60:
	.ascii	"BKP3R\000"
.LASF62:
	.ascii	"BKP5R\000"
.LASF106:
	.ascii	"HAL_RTC_STATE_ERROR\000"
.LASF171:
	.ascii	"sTime\000"
.LASF74:
	.ascii	"BKP17R\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF156:
	.ascii	"HAL_RTC_AlarmAEventCallback\000"
.LASF103:
	.ascii	"HAL_RTC_STATE_READY\000"
.LASF107:
	.ascii	"HAL_RTCStateTypeDef\000"
.LASF94:
	.ascii	"HAL_OK\000"
.LASF78:
	.ascii	"BKP21R\000"
.LASF123:
	.ascii	"StoreOperation\000"
.LASF145:
	.ascii	"bcdhigh\000"
.LASF34:
	.ascii	"IMR1\000"
.LASF37:
	.ascii	"IMR2\000"
.LASF128:
	.ascii	"Year\000"
.LASF177:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF158:
	.ascii	"HAL_RTC_GetAlarm\000"
.LASF67:
	.ascii	"BKP10R\000"
.LASF50:
	.ascii	"TSTR\000"
.LASF98:
	.ascii	"HAL_StatusTypeDef\000"
.LASF27:
	.ascii	"RTSR3\000"
.LASF147:
	.ascii	"RTC_ExitInitMode\000"
.LASF121:
	.ascii	"SecondFraction\000"
.LASF132:
	.ascii	"AlarmSubSecondMask\000"
.LASF167:
	.ascii	"sDate\000"
.LASF75:
	.ascii	"BKP18R\000"
.LASF40:
	.ascii	"IMR3\000"
.LASF28:
	.ascii	"FTSR3\000"
.LASF125:
	.ascii	"WeekDay\000"
.LASF53:
	.ascii	"CALR\000"
.LASF181:
	.ascii	"HAL_GetTick\000"
.LASF79:
	.ascii	"BKP22R\000"
.LASF100:
	.ascii	"HAL_LOCKED\000"
.LASF118:
	.ascii	"Seconds\000"
.LASF117:
	.ascii	"Minutes\000"
.LASF116:
	.ascii	"Hours\000"
.LASF68:
	.ascii	"BKP11R\000"
.LASF124:
	.ascii	"RTC_TimeTypeDef\000"
.LASF47:
	.ascii	"ALRMAR\000"
.LASF92:
	.ascii	"float\000"
.LASF129:
	.ascii	"RTC_DateTypeDef\000"
.LASF43:
	.ascii	"EXTI_Core_TypeDef\000"
.LASF64:
	.ascii	"BKP7R\000"
.LASF166:
	.ascii	"HAL_RTC_GetDate\000"
.LASF137:
	.ascii	"Instance\000"
.LASF76:
	.ascii	"BKP19R\000"
.LASF33:
	.ascii	"RESERVED3\000"
.LASF36:
	.ascii	"RESERVED4\000"
.LASF39:
	.ascii	"RESERVED5\000"
.LASF25:
	.ascii	"D3PCR2H\000"
.LASF159:
	.ascii	"sAlarm\000"
.LASF80:
	.ascii	"BKP23R\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF24:
	.ascii	"D3PCR2L\000"
.LASF162:
	.ascii	"subsecondtmpreg\000"
.LASF0:
	.ascii	"short int\000"
.LASF151:
	.ascii	"tickstart\000"
.LASF46:
	.ascii	"RESERVED\000"
.LASF104:
	.ascii	"HAL_RTC_STATE_BUSY\000"
.LASF154:
	.ascii	"HAL_RTC_PollForAlarmAEvent\000"
.LASF69:
	.ascii	"BKP12R\000"
.LASF57:
	.ascii	"BKP0R\000"
.LASF19:
	.ascii	"RESERVED1\000"
.LASF26:
	.ascii	"RESERVED2\000"
.LASF48:
	.ascii	"ALRMBR\000"
.LASF168:
	.ascii	"datetmpreg\000"
.LASF170:
	.ascii	"HAL_RTC_GetTime\000"
.LASF63:
	.ascii	"BKP6R\000"
.LASF77:
	.ascii	"BKP20R\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF18:
	.ascii	"D3PCR1H\000"
.LASF45:
	.ascii	"WUTR\000"
.LASF95:
	.ascii	"HAL_ERROR\000"
.LASF122:
	.ascii	"DayLightSaving\000"
.LASF17:
	.ascii	"D3PCR1L\000"
.LASF90:
	.ascii	"long double\000"
.LASF61:
	.ascii	"BKP4R\000"
.LASF91:
	.ascii	"char\000"
.LASF140:
	.ascii	"State\000"
.LASF81:
	.ascii	"BKP24R\000"
.LASF160:
	.ascii	"Format\000"
.LASF11:
	.ascii	"uint8_t\000"
.LASF58:
	.ascii	"BKP1R\000"
.LASF65:
	.ascii	"BKP8R\000"
.LASF70:
	.ascii	"BKP13R\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF108:
	.ascii	"HourFormat\000"
.LASF35:
	.ascii	"EMR1\000"
.LASF38:
	.ascii	"EMR2\000"
.LASF41:
	.ascii	"EMR3\000"
.LASF176:
	.ascii	"HAL_RTC_Init\000"
.LASF112:
	.ascii	"OutPutRemap\000"
.LASF120:
	.ascii	"SubSeconds\000"
.LASF130:
	.ascii	"AlarmTime\000"
.LASF66:
	.ascii	"BKP9R\000"
.LASF49:
	.ascii	"SHIFTR\000"
.LASF109:
	.ascii	"AsynchPrediv\000"
.LASF148:
	.ascii	"hrtc\000"
.LASF149:
	.ascii	"status\000"
.LASF143:
	.ascii	"RTC_ByteToBcd2\000"
.LASF144:
	.ascii	"Value\000"
.LASF135:
	.ascii	"Alarm\000"
.LASF163:
	.ascii	"HAL_RTC_DeactivateAlarm\000"
.LASF82:
	.ascii	"BKP25R\000"
.LASF142:
	.ascii	"RTC_Bcd2ToByte\000"
.LASF89:
	.ascii	"RTC_TypeDef\000"
.LASF127:
	.ascii	"Date\000"
.LASF178:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_rtc.c\000"
.LASF179:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF153:
	.ascii	"HAL_RTC_WaitForSynchro\000"
.LASF115:
	.ascii	"RTC_InitTypeDef\000"
.LASF16:
	.ascii	"D3PMR1\000"
.LASF23:
	.ascii	"D3PMR2\000"
.LASF30:
	.ascii	"D3PMR3\000"
.LASF146:
	.ascii	"bcdlow\000"
.LASF99:
	.ascii	"HAL_UNLOCKED\000"
.LASF71:
	.ascii	"BKP14R\000"
.LASF42:
	.ascii	"EXTI_TypeDef\000"
.LASF22:
	.ascii	"SWIER2\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
