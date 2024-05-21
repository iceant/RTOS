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
	.file	"stm32h7xx_hal_spi.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_spi.c"
	.section	.text.SPI_RxISR_8BIT,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_RxISR_8BIT, %function
SPI_RxISR_8BIT:
.LFB375:
	.loc 1 3601 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 3603 3
	.loc 1 3603 63 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3603 20
	ldr	r3, [r0, #100]
	.loc 1 3603 37
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	.loc 1 3603 34
	strb	r2, [r3]
	.loc 1 3604 3 is_stmt 1
	.loc 1 3604 7 is_stmt 0
	ldr	r3, [r0, #100]
	.loc 1 3604 20
	adds	r3, r3, #1
	str	r3, [r0, #100]
	.loc 1 3605 3 is_stmt 1
	.loc 1 3605 7 is_stmt 0
	ldrh	r3, [r0, #106]
	uxth	r3, r3
	.loc 1 3605 20
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r0, #106]	@ movhi
	.loc 1 3608 3 is_stmt 1
	.loc 1 3608 11 is_stmt 0
	ldrh	r3, [r0, #106]
	uxth	r3, r3
	.loc 1 3608 6
	cbnz	r3, .L1
	.loc 1 3626 5 is_stmt 1
	.loc 1 3626 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3626 22
	ldr	r3, [r2, #16]
	.loc 1 3626 28
	bic	r3, r3, #1
	str	r3, [r2, #16]
.L1:
	.loc 1 3629 1
	bx	lr
	.cfi_endproc
.LFE375:
	.size	SPI_RxISR_8BIT, .-SPI_RxISR_8BIT
	.section	.text.SPI_RxISR_16BIT,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_RxISR_16BIT, %function
SPI_RxISR_16BIT:
.LFB376:
	.loc 1 3639 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL1:
	.loc 1 3642 3
	.loc 1 3642 65 is_stmt 0
	ldr	r2, [r0]
.LVL2:
	.loc 1 3644 3 is_stmt 1
	.loc 1 3644 21 is_stmt 0
	ldr	r3, [r0, #100]
	.loc 1 3644 37
	ldrh	r2, [r2, #48]
.LVL3:
	.loc 1 3644 35
	strh	r2, [r3]	@ movhi
.LVL4:
	.loc 1 3648 3 is_stmt 1
	.loc 1 3648 7 is_stmt 0
	ldr	r3, [r0, #100]
	.loc 1 3648 20
	adds	r3, r3, #2
	str	r3, [r0, #100]
	.loc 1 3649 3 is_stmt 1
	.loc 1 3649 7 is_stmt 0
	ldrh	r3, [r0, #106]
	uxth	r3, r3
	.loc 1 3649 20
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r0, #106]	@ movhi
	.loc 1 3652 3 is_stmt 1
	.loc 1 3652 11 is_stmt 0
	ldrh	r3, [r0, #106]
	uxth	r3, r3
	.loc 1 3652 6
	cbnz	r3, .L3
	.loc 1 3670 5 is_stmt 1
	.loc 1 3670 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3670 22
	ldr	r3, [r2, #16]
	.loc 1 3670 28
	bic	r3, r3, #1
	str	r3, [r2, #16]
.L3:
	.loc 1 3673 1
	bx	lr
	.cfi_endproc
.LFE376:
	.size	SPI_RxISR_16BIT, .-SPI_RxISR_16BIT
	.section	.text.SPI_RxISR_32BIT,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_RxISR_32BIT, %function
SPI_RxISR_32BIT:
.LFB377:
	.loc 1 3683 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL5:
	.loc 1 3685 3
	.loc 1 3685 65 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3685 21
	ldr	r3, [r0, #100]
	.loc 1 3685 38
	ldr	r2, [r2, #48]
	.loc 1 3685 35
	str	r2, [r3]
	.loc 1 3686 3 is_stmt 1
	.loc 1 3686 7 is_stmt 0
	ldr	r3, [r0, #100]
	.loc 1 3686 20
	adds	r3, r3, #4
	str	r3, [r0, #100]
	.loc 1 3687 3 is_stmt 1
	.loc 1 3687 7 is_stmt 0
	ldrh	r3, [r0, #106]
	uxth	r3, r3
	.loc 1 3687 20
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r0, #106]	@ movhi
	.loc 1 3690 3 is_stmt 1
	.loc 1 3690 11 is_stmt 0
	ldrh	r3, [r0, #106]
	uxth	r3, r3
	.loc 1 3690 6
	cbnz	r3, .L5
	.loc 1 3708 5 is_stmt 1
	.loc 1 3708 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3708 22
	ldr	r3, [r2, #16]
	.loc 1 3708 28
	bic	r3, r3, #1
	str	r3, [r2, #16]
.L5:
	.loc 1 3711 1
	bx	lr
	.cfi_endproc
.LFE377:
	.size	SPI_RxISR_32BIT, .-SPI_RxISR_32BIT
	.section	.text.SPI_TxISR_8BIT,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_TxISR_8BIT, %function
SPI_TxISR_8BIT:
.LFB378:
	.loc 1 3721 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL6:
	.loc 1 3723 3
	.loc 1 3723 71 is_stmt 0
	ldr	r2, [r0, #92]
	.loc 1 3723 29
	ldr	r3, [r0]
	.loc 1 3723 48
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 3723 46
	strb	r2, [r3, #32]
	.loc 1 3724 3 is_stmt 1
	.loc 1 3724 7 is_stmt 0
	ldr	r3, [r0, #92]
	.loc 1 3724 20
	adds	r3, r3, #1
	str	r3, [r0, #92]
	.loc 1 3725 3 is_stmt 1
	.loc 1 3725 7 is_stmt 0
	ldrh	r3, [r0, #98]
	uxth	r3, r3
	.loc 1 3725 20
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r0, #98]	@ movhi
	.loc 1 3728 3 is_stmt 1
	.loc 1 3728 11 is_stmt 0
	ldrh	r3, [r0, #98]
	uxth	r3, r3
	.loc 1 3728 6
	cbnz	r3, .L7
	.loc 1 3751 5 is_stmt 1
	.loc 1 3751 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3751 22
	ldr	r3, [r2, #16]
	.loc 1 3751 28
	bic	r3, r3, #2
	str	r3, [r2, #16]
.L7:
	.loc 1 3754 1
	bx	lr
	.cfi_endproc
.LFE378:
	.size	SPI_TxISR_8BIT, .-SPI_TxISR_8BIT
	.section	.text.SPI_TxISR_16BIT,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_TxISR_16BIT, %function
SPI_TxISR_16BIT:
.LFB379:
	.loc 1 3763 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL7:
	.loc 1 3766 3
	.loc 1 3766 65 is_stmt 0
	ldr	r3, [r0]
.LVL8:
	.loc 1 3768 3 is_stmt 1
	.loc 1 3768 43 is_stmt 0
	ldr	r2, [r0, #92]
	.loc 1 3768 19
	ldrh	r2, [r2]
	.loc 1 3768 17
	strh	r2, [r3, #32]	@ movhi
	.loc 1 3772 3 is_stmt 1
	.loc 1 3772 7 is_stmt 0
	ldr	r3, [r0, #92]
.LVL9:
	.loc 1 3772 20
	adds	r3, r3, #2
	str	r3, [r0, #92]
	.loc 1 3773 3 is_stmt 1
	.loc 1 3773 7 is_stmt 0
	ldrh	r3, [r0, #98]
	uxth	r3, r3
	.loc 1 3773 20
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r0, #98]	@ movhi
	.loc 1 3776 3 is_stmt 1
	.loc 1 3776 11 is_stmt 0
	ldrh	r3, [r0, #98]
	uxth	r3, r3
	.loc 1 3776 6
	cbnz	r3, .L9
	.loc 1 3799 5 is_stmt 1
	.loc 1 3799 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3799 22
	ldr	r3, [r2, #16]
	.loc 1 3799 28
	bic	r3, r3, #2
	str	r3, [r2, #16]
.L9:
	.loc 1 3802 1
	bx	lr
	.cfi_endproc
.LFE379:
	.size	SPI_TxISR_16BIT, .-SPI_TxISR_16BIT
	.section	.text.SPI_TxISR_32BIT,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_TxISR_32BIT, %function
SPI_TxISR_32BIT:
.LFB380:
	.loc 1 3811 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL10:
	.loc 1 3813 3
	.loc 1 3813 75 is_stmt 0
	ldr	r2, [r0, #92]
	.loc 1 3813 31
	ldr	r3, [r0]
	.loc 1 3813 51
	ldr	r2, [r2]
	.loc 1 3813 49
	str	r2, [r3, #32]
	.loc 1 3814 3 is_stmt 1
	.loc 1 3814 7 is_stmt 0
	ldr	r3, [r0, #92]
	.loc 1 3814 20
	adds	r3, r3, #4
	str	r3, [r0, #92]
	.loc 1 3815 3 is_stmt 1
	.loc 1 3815 7 is_stmt 0
	ldrh	r3, [r0, #98]
	uxth	r3, r3
	.loc 1 3815 20
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r0, #98]	@ movhi
	.loc 1 3818 3 is_stmt 1
	.loc 1 3818 11 is_stmt 0
	ldrh	r3, [r0, #98]
	uxth	r3, r3
	.loc 1 3818 6
	cbnz	r3, .L11
	.loc 1 3841 5 is_stmt 1
	.loc 1 3841 12 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3841 22
	ldr	r3, [r2, #16]
	.loc 1 3841 28
	bic	r3, r3, #2
	str	r3, [r2, #16]
.L11:
	.loc 1 3844 1
	bx	lr
	.cfi_endproc
.LFE380:
	.size	SPI_TxISR_32BIT, .-SPI_TxISR_32BIT
	.section	.text.SPI_AbortTransfer,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_AbortTransfer, %function
SPI_AbortTransfer:
.LFB381:
	.loc 1 3853 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL11:
	.loc 1 3855 3
	.loc 1 3855 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3855 21
	ldr	r3, [r2]
	.loc 1 3855 28
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 3858 3 is_stmt 1
	.loc 1 3858 10 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3858 20
	ldr	r1, [r2, #16]
	.loc 1 3858 26
	ldr	r3, .L14
	ands	r3, r3, r1
	str	r3, [r2, #16]
	.loc 1 3862 3 is_stmt 1
	.loc 1 3862 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3862 21
	ldr	r3, [r2, #24]
	.loc 1 3862 29
	orr	r3, r3, #8
	str	r3, [r2, #24]
	.loc 1 3863 3 is_stmt 1
	.loc 1 3863 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3863 21
	ldr	r3, [r2, #24]
	.loc 1 3863 29
	orr	r3, r3, #16
	str	r3, [r2, #24]
	.loc 1 3866 3 is_stmt 1
	.loc 1 3866 9 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3866 19
	ldr	r3, [r2, #8]
	.loc 1 3866 27
	bic	r3, r3, #49152
	str	r3, [r2, #8]
	.loc 1 3869 3 is_stmt 1
	.loc 1 3869 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3869 21
	ldr	r3, [r2, #24]
	.loc 1 3869 29
	orr	r3, r3, #64
	str	r3, [r2, #24]
	.loc 1 3870 3 is_stmt 1
	.loc 1 3870 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3870 21
	ldr	r3, [r2, #24]
	.loc 1 3870 29
	orr	r3, r3, #32
	str	r3, [r2, #24]
	.loc 1 3871 3 is_stmt 1
	.loc 1 3871 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3871 21
	ldr	r3, [r2, #24]
	.loc 1 3871 29
	orr	r3, r3, #256
	str	r3, [r2, #24]
	.loc 1 3872 3 is_stmt 1
	.loc 1 3872 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3872 21
	ldr	r3, [r2, #24]
	.loc 1 3872 29
	orr	r3, r3, #512
	str	r3, [r2, #24]
	.loc 1 3872 63 is_stmt 1
	.loc 1 3873 3
	.loc 1 3873 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3873 21
	ldr	r3, [r2, #24]
	.loc 1 3873 29
	orr	r3, r3, #2048
	str	r3, [r2, #24]
	.loc 1 3876 3 is_stmt 1
	.loc 1 3876 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3876 21
	ldr	r3, [r2, #24]
	.loc 1 3876 29
	orr	r3, r3, #128
	str	r3, [r2, #24]
	.loc 1 3879 3 is_stmt 1
	.loc 1 3879 21 is_stmt 0
	movs	r3, #0
	strh	r3, [r0, #98]	@ movhi
	.loc 1 3880 3 is_stmt 1
	.loc 1 3880 21 is_stmt 0
	strh	r3, [r0, #106]	@ movhi
	.loc 1 3881 1
	bx	lr
.L15:
	.align	2
.L14:
	.word	-880
	.cfi_endproc
.LFE381:
	.size	SPI_AbortTransfer, .-SPI_AbortTransfer
	.section	.text.SPI_CloseTransfer,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_CloseTransfer, %function
SPI_CloseTransfer:
.LFB382:
	.loc 1 3892 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL12:
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 3893 3
	.loc 1 3893 25 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3893 12
	ldr	r3, [r2, #20]
.LVL13:
	.loc 1 3895 3 is_stmt 1
	.loc 1 3895 21 is_stmt 0
	ldr	r1, [r2, #24]
	.loc 1 3895 29
	orr	r1, r1, #8
	str	r1, [r2, #24]
	.loc 1 3896 3 is_stmt 1
	.loc 1 3896 11 is_stmt 0
	ldr	r1, [r0]
	.loc 1 3896 21
	ldr	r2, [r1, #24]
	.loc 1 3896 29
	orr	r2, r2, #16
	str	r2, [r1, #24]
	.loc 1 3899 3 is_stmt 1
	.loc 1 3899 11 is_stmt 0
	ldr	r1, [r0]
	.loc 1 3899 21
	ldr	r2, [r1]
	.loc 1 3899 28
	bic	r2, r2, #1
	str	r2, [r1]
	.loc 1 3902 3 is_stmt 1
	.loc 1 3902 10 is_stmt 0
	ldr	r1, [r0]
	.loc 1 3902 20
	ldr	r4, [r1, #16]
	.loc 1 3902 26
	ldr	r2, .L24
	ands	r2, r2, r4
	str	r2, [r1, #16]
	.loc 1 3906 3 is_stmt 1
	.loc 1 3906 9 is_stmt 0
	ldr	r1, [r0]
	.loc 1 3906 19
	ldr	r2, [r1, #8]
	.loc 1 3906 27
	bic	r2, r2, #49152
	str	r2, [r1, #8]
	.loc 1 3909 3 is_stmt 1
	.loc 1 3909 11 is_stmt 0
	ldrb	r2, [r0, #129]	@ zero_extendqisi2
	uxtb	r2, r2
	.loc 1 3909 6
	cmp	r2, #4
	beq	.L17
	.loc 1 3911 5 is_stmt 1
	.loc 1 3911 8 is_stmt 0
	tst	r3, #32
	beq	.L17
	.loc 1 3913 7 is_stmt 1
	.loc 1 3913 13 is_stmt 0
	ldr	r2, [r0, #132]
	.loc 1 3913 26
	orr	r2, r2, #128
	str	r2, [r0, #132]
	.loc 1 3914 7 is_stmt 1
	.loc 1 3914 15 is_stmt 0
	ldr	r1, [r0]
	.loc 1 3914 25
	ldr	r2, [r1, #24]
	.loc 1 3914 33
	orr	r2, r2, #32
	str	r2, [r1, #24]
.L17:
	.loc 1 3919 3 is_stmt 1
	.loc 1 3919 11 is_stmt 0
	ldrb	r2, [r0, #129]	@ zero_extendqisi2
	uxtb	r2, r2
	.loc 1 3919 6
	cmp	r2, #3
	beq	.L18
	.loc 1 3921 5 is_stmt 1
	.loc 1 3921 8 is_stmt 0
	tst	r3, #64
	beq	.L19
	.loc 1 3923 7 is_stmt 1
	.loc 1 3923 13 is_stmt 0
	ldr	r2, [r0, #132]
	.loc 1 3923 26
	orr	r2, r2, #4
	str	r2, [r0, #132]
	.loc 1 3924 7 is_stmt 1
	.loc 1 3924 15 is_stmt 0
	ldr	r1, [r0]
	.loc 1 3924 25
	ldr	r2, [r1, #24]
	.loc 1 3924 33
	orr	r2, r2, #64
	str	r2, [r1, #24]
.L19:
	.loc 1 3929 5 is_stmt 1
	.loc 1 3929 19 is_stmt 0
	ldr	r2, [r0, #40]
	.loc 1 3929 8
	cmp	r2, #4194304
	beq	.L23
.L18:
	.loc 1 3941 3 is_stmt 1
	.loc 1 3941 6 is_stmt 0
	tst	r3, #512
	beq	.L20
	.loc 1 3943 5 is_stmt 1
	.loc 1 3943 11 is_stmt 0
	ldr	r2, [r0, #132]
	.loc 1 3943 24
	orr	r2, r2, #1
	str	r2, [r0, #132]
	.loc 1 3944 5 is_stmt 1
	.loc 1 3944 13 is_stmt 0
	ldr	r1, [r0]
	.loc 1 3944 23
	ldr	r2, [r1, #24]
	.loc 1 3944 31
	orr	r2, r2, #512
	str	r2, [r1, #24]
.L20:
	.loc 1 3944 65 is_stmt 1 discriminator 1
	.loc 1 3948 3 discriminator 1
	.loc 1 3948 6 is_stmt 0 discriminator 1
	tst	r3, #256
	beq	.L21
	.loc 1 3950 5 is_stmt 1
	.loc 1 3950 11 is_stmt 0
	ldr	r3, [r0, #132]
.LVL14:
	.loc 1 3950 24
	orr	r3, r3, #8
	str	r3, [r0, #132]
	.loc 1 3951 5 is_stmt 1
	.loc 1 3951 13 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3951 23
	ldr	r3, [r2, #24]
	.loc 1 3951 31
	orr	r3, r3, #256
	str	r3, [r2, #24]
.L21:
	.loc 1 3954 3 is_stmt 1
	.loc 1 3954 21 is_stmt 0
	movs	r3, #0
	strh	r3, [r0, #98]	@ movhi
	.loc 1 3955 3 is_stmt 1
	.loc 1 3955 21 is_stmt 0
	strh	r3, [r0, #106]	@ movhi
	.loc 1 3956 1
	ldr	r4, [sp], #4
	.cfi_remember_state
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL15:
.L23:
	.cfi_restore_state
	.loc 1 3931 7 is_stmt 1
	.loc 1 3931 10 is_stmt 0
	tst	r3, #128
	beq	.L18
	.loc 1 3933 9 is_stmt 1
	.loc 1 3933 15 is_stmt 0
	ldr	r2, [r0, #132]
	.loc 1 3933 28
	orr	r2, r2, #2
	str	r2, [r0, #132]
	.loc 1 3934 9 is_stmt 1
	.loc 1 3934 17 is_stmt 0
	ldr	r1, [r0]
	.loc 1 3934 27
	ldr	r2, [r1, #24]
	.loc 1 3934 35
	orr	r2, r2, #128
	str	r2, [r1, #24]
	b	.L18
.L25:
	.align	2
.L24:
	.word	-880
	.cfi_endproc
.LFE382:
	.size	SPI_CloseTransfer, .-SPI_CloseTransfer
	.section	.text.SPI_GetPacketSize,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_GetPacketSize, %function
SPI_GetPacketSize:
.LFB384:
	.loc 1 3990 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL16:
	.loc 1 3991 3
	.loc 1 3991 41 is_stmt 0
	ldr	r3, [r0, #60]
	.loc 1 3991 56
	lsrs	r3, r3, #5
.LVL17:
	.loc 1 3992 3 is_stmt 1
	.loc 1 3992 35 is_stmt 0
	ldr	r0, [r0, #12]
.LVL18:
	.loc 1 3995 3 is_stmt 1
	.loc 1 3995 26 is_stmt 0
	adds	r0, r0, #8
.LVL19:
	.loc 1 3995 13
	lsrs	r0, r0, #3
.LVL20:
	.loc 1 3997 3 is_stmt 1
	.loc 1 3998 1 is_stmt 0
	mla	r0, r3, r0, r0
.LVL21:
	bx	lr
	.cfi_endproc
.LFE384:
	.size	SPI_GetPacketSize, .-SPI_GetPacketSize
	.section	.text.SPI_WaitOnFlagUntilTimeout,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_WaitOnFlagUntilTimeout, %function
SPI_WaitOnFlagUntilTimeout:
.LFB383:
	.loc 1 3970 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL22:
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 4, -28
	.cfi_offset 5, -24
	.cfi_offset 6, -20
	.cfi_offset 7, -16
	.cfi_offset 8, -12
	.cfi_offset 9, -8
	.cfi_offset 14, -4
	mov	r8, r0
	mov	r7, r1
	mov	r6, r2
	mov	r5, r3
	ldr	r9, [sp, #32]
	.loc 1 3972 3
	.loc 1 3972 9 is_stmt 0
	b	.L28
.LVL23:
.L29:
	.loc 1 3975 80 discriminator 3
	cbz	r5, .L33
.L28:
	.loc 1 3972 72 is_stmt 1
	.loc 1 3972 20 is_stmt 0
	ldr	r3, [r8]
	.loc 1 3972 30
	ldr	r4, [r3, #20]
	.loc 1 3972 63
	bics	r4, r7, r4
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	.loc 1 3972 72
	cmp	r3, r6
	bne	.L35
	.loc 1 3975 5 is_stmt 1
	.loc 1 3975 12 is_stmt 0
	bl	HAL_GetTick
.LVL24:
	.loc 1 3975 26
	sub	r0, r0, r9
	.loc 1 3975 8
	cmp	r0, r5
	bcc	.L29
	.loc 1 3975 51 discriminator 1
	cmp	r5, #-1
	beq	.L29
	.loc 1 3977 14
	movs	r0, #3
	b	.L30
.L35:
	.loc 1 3980 10
	movs	r0, #0
.L30:
	.loc 1 3981 1
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.LVL25:
.L33:
	.loc 1 3977 14
	movs	r0, #3
	b	.L30
	.cfi_endproc
.LFE383:
	.size	SPI_WaitOnFlagUntilTimeout, .-SPI_WaitOnFlagUntilTimeout
	.section	.text.HAL_SPI_MspInit,"ax",%progbits
	.align	1
	.weak	HAL_SPI_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_MspInit, %function
HAL_SPI_MspInit:
.LFB337:
	.loc 1 534 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL26:
	.loc 1 536 3
	.loc 1 541 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE337:
	.size	HAL_SPI_MspInit, .-HAL_SPI_MspInit
	.section	.text.HAL_SPI_Init,"ax",%progbits
	.align	1
	.global	HAL_SPI_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_Init, %function
HAL_SPI_Init:
.LFB335:
	.loc 1 240 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL27:
	.loc 1 241 3
	.loc 1 242 3
	.loc 1 244 3
	.loc 1 248 3
	.loc 1 248 6 is_stmt 0
	cmp	r0, #0
	beq	.L65
	.loc 1 240 1
	push	{r3, r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 254 3 is_stmt 1
	.loc 1 255 3
	.loc 1 256 3
	.loc 1 257 3
	.loc 1 258 3
	.loc 1 259 3
	.loc 1 260 3
	.loc 1 261 3
	.loc 1 262 3
	.loc 1 263 3
	.loc 1 264 3
	.loc 1 266 5
	.loc 1 267 5
	.loc 1 270 3
	.loc 1 271 3
	.loc 1 271 17 is_stmt 0
	ldr	r7, [r0, #40]
	.loc 1 273 5 is_stmt 1
	.loc 1 274 5
	.loc 1 275 5
	.loc 1 276 5
	.loc 1 283 3
	.loc 1 283 16 is_stmt 0
	ldr	r5, [r0]
	.loc 1 283 95
	ldr	r2, .L82
	ldr	r6, .L82+4
	.loc 1 283 6
	cmp	r5, r2
	it	ne
	cmpne	r5, r6
	ite	ne
	movne	r6, #1
	moveq	r6, #0
	beq	.L39
	.loc 1 283 8 discriminator 1
	ldr	r3, .L82+8
	cmp	r5, r3
	beq	.L39
	.loc 1 283 253 discriminator 2
	ldr	r3, [r0, #12]
	.loc 1 283 239 discriminator 2
	cmp	r3, #15
	bhi	.L66
.L39:
	.loc 1 289 3 is_stmt 1
	.loc 1 289 19 is_stmt 0
	mov	r0, r4
.LVL28:
	bl	SPI_GetPacketSize
.LVL29:
	.loc 1 290 3 is_stmt 1
	.loc 1 290 6 is_stmt 0
	cbz	r6, .L40
	.loc 1 290 9 discriminator 1
	ldr	r3, .L82+8
	cmp	r5, r3
	beq	.L40
	.loc 1 290 240 discriminator 3
	cmp	r0, #8
	bhi	.L67
.L40:
	.loc 1 290 266 discriminator 5
	ldr	r2, .L82
	ldr	r3, .L82+4
	cmp	r5, r3
	it	ne
	cmpne	r5, r2
	beq	.L41
	.loc 1 291 166
	add	r3, r3, #1024
	cmp	r5, r3
	bne	.L42
.L41:
	.loc 1 291 239 discriminator 1
	cmp	r0, #16
	bhi	.L68
.L42:
	.loc 1 297 3 is_stmt 1
	.loc 1 297 6 is_stmt 0
	cmp	r7, #4194304
	beq	.L75
	.loc 1 326 5 is_stmt 1
	.loc 1 326 28 is_stmt 0
	ldr	r5, [r4, #12]
	.loc 1 326 16
	lsls	r5, r5, #16
.LVL30:
.L46:
	.loc 1 330 3 is_stmt 1
	.loc 1 330 11 is_stmt 0
	ldrb	r3, [r4, #129]	@ zero_extendqisi2
	.loc 1 330 6
	cbz	r3, .L76
.LVL31:
.L47:
	.loc 1 360 3 is_stmt 1
	.loc 1 360 15 is_stmt 0
	movs	r3, #2
	strb	r3, [r4, #129]
	.loc 1 363 3 is_stmt 1
	.loc 1 363 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 363 21
	ldr	r3, [r2]
	.loc 1 363 28
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 375 3 is_stmt 1
	.loc 1 375 18 is_stmt 0
	ldr	r3, [r4, #24]
	.loc 1 375 6
	cmp	r3, #67108864
	beq	.L77
.L48:
	.loc 1 384 3 is_stmt 1
	.loc 1 384 19 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 384 6
	tst	r3, #4194304
	beq	.L51
	.loc 1 384 80 discriminator 1
	ldr	r3, [r4, #12]
	.loc 1 384 66 discriminator 1
	cmp	r3, #6
	bls	.L51
	.loc 1 386 5 is_stmt 1
	.loc 1 386 42 is_stmt 0
	ldr	r2, [r4]
	.loc 1 386 52
	ldr	r3, [r2]
	.loc 1 386 61
	bic	r3, r3, #256
	.loc 1 386 98
	ldr	r1, [r4, #80]
	.loc 1 386 85
	orrs	r3, r3, r1
	.loc 1 386 30
	str	r3, [r2]
	b	.L52
.LVL32:
.L75:
	.loc 1 300 5 is_stmt 1
	.loc 1 300 8 is_stmt 0
	cbz	r6, .L44
	.loc 1 300 10 discriminator 1
	ldr	r3, .L82+8
	cmp	r5, r3
	beq	.L44
	.loc 1 300 255 discriminator 2
	ldr	r3, [r4, #48]
	.loc 1 300 241 discriminator 2
	cmp	r3, #983040
	bhi	.L69
.L44:
	.loc 1 306 5 is_stmt 1
	.loc 1 306 19 is_stmt 0
	ldr	r5, [r4, #48]
	.loc 1 306 8
	cbnz	r5, .L45
	.loc 1 308 7 is_stmt 1
	.loc 1 308 41 is_stmt 0
	ldr	r5, [r4, #12]
	.loc 1 308 18
	lsls	r5, r5, #16
.LVL33:
.L45:
	.loc 1 316 5 is_stmt 1
	.loc 1 319 5
	.loc 1 319 30 is_stmt 0
	ldr	r3, [r4, #12]
	.loc 1 319 8
	cmp	r3, r5, lsr #16
	bls	.L46
	.loc 1 321 14
	movs	r0, #1
.LVL34:
	b	.L38
.LVL35:
.L76:
	.loc 1 333 5 is_stmt 1
	.loc 1 333 16 is_stmt 0
	strb	r3, [r4, #128]
	.loc 1 356 5 is_stmt 1
	mov	r0, r4
.LVL36:
	bl	HAL_SPI_MspInit
.LVL37:
	b	.L47
.L77:
	.loc 1 375 60 is_stmt 0 discriminator 1
	ldr	r3, [r4, #4]
	.loc 1 375 44 discriminator 1
	cmp	r3, #4194304
	beq	.L78
.L49:
	.loc 1 376 89
	cmp	r3, #0
	bne	.L48
	.loc 1 378 56
	ldr	r3, [r4, #56]
	.loc 1 377 81
	cmp	r3, #268435456
	bne	.L48
	b	.L50
.L78:
	.loc 1 376 56 discriminator 2
	ldr	r2, [r4, #56]
	.loc 1 375 87 discriminator 2
	cmp	r2, #0
	bne	.L49
.L50:
	.loc 1 380 5 is_stmt 1
	.loc 1 380 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 380 21
	ldr	r3, [r2]
	.loc 1 380 28
	orr	r3, r3, #4096
	str	r3, [r2]
	b	.L48
.L51:
	.loc 1 390 5 is_stmt 1
	.loc 1 390 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 390 21
	ldr	r3, [r2]
	.loc 1 390 28
	bic	r3, r3, #256
	str	r3, [r2]
.L52:
	.loc 1 394 3 is_stmt 1
	.loc 1 394 41 is_stmt 0
	ldr	r3, [r4, #28]
	.loc 1 394 72
	ldr	r2, [r4, #40]
	.loc 1 394 60
	orrs	r3, r3, r2
	.loc 1 394 88
	orrs	r3, r3, r5
	.loc 1 394 113
	ldr	r2, [r4, #60]
	.loc 1 394 101
	orrs	r3, r3, r2
	.loc 1 394 140
	ldr	r1, [r4, #12]
	.loc 1 394 9
	ldr	r2, [r4]
	.loc 1 394 128
	orrs	r3, r3, r1
	.loc 1 394 27
	str	r3, [r2, #8]
	.loc 1 398 3 is_stmt 1
	.loc 1 398 41 is_stmt 0
	ldr	r3, [r4, #52]
	.loc 1 398 63
	ldr	r2, [r4, #36]
	.loc 1 398 51
	orrs	r3, r3, r2
	.loc 1 398 83
	ldr	r2, [r4, #56]
	.loc 1 398 71
	orrs	r3, r3, r2
	.loc 1 398 108
	ldr	r2, [r4, #24]
	.loc 1 398 96
	orrs	r3, r3, r2
	.loc 1 398 125
	ldr	r2, [r4, #16]
	.loc 1 398 113
	orrs	r3, r3, r2
	.loc 1 398 150
	ldr	r2, [r4, #20]
	.loc 1 398 138
	orrs	r3, r3, r2
	.loc 1 398 172
	ldr	r2, [r4, #32]
	.loc 1 398 160
	orrs	r3, r3, r2
	.loc 1 398 194
	ldr	r2, [r4, #4]
	.loc 1 398 182
	orrs	r3, r3, r2
	.loc 1 398 212
	ldr	r2, [r4, #76]
	.loc 1 398 200
	orrs	r3, r3, r2
	.loc 1 398 249
	ldr	r2, [r4, #8]
	.loc 1 398 237
	orrs	r3, r3, r2
	.loc 1 398 272
	ldr	r2, [r4, #72]
	.loc 1 398 260
	orrs	r3, r3, r2
	.loc 1 398 302
	ldr	r1, [r4, #88]
	.loc 1 398 9
	ldr	r2, [r4]
	.loc 1 398 290
	orrs	r3, r3, r1
	.loc 1 398 27
	str	r3, [r2, #12]
	.loc 1 408 3 is_stmt 1
	.loc 1 408 17 is_stmt 0
	ldr	r3, [r4, #40]
	.loc 1 408 6
	cmp	r3, #4194304
	beq	.L79
.LVL38:
.L53:
	.loc 1 453 3 is_stmt 1
	.loc 1 453 17 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 453 6
	cbnz	r3, .L62
	.loc 1 457 5 is_stmt 1
	.loc 1 457 19 is_stmt 0
	ldr	r3, [r4, #40]
	.loc 1 457 8
	cbnz	r3, .L63
	.loc 1 460 7 is_stmt 1
	.loc 1 460 45 is_stmt 0
	ldr	r2, [r4]
	.loc 1 460 55
	ldr	r3, [r2, #8]
	.loc 1 460 65
	bic	r3, r3, #6144
	.loc 1 460 90
	orr	r3, r3, #2048
	.loc 1 460 33
	str	r3, [r2, #8]
.L63:
	.loc 1 462 5 is_stmt 1
	.loc 1 462 43 is_stmt 0
	ldr	r2, [r4]
	.loc 1 462 53
	ldr	r3, [r2, #8]
	.loc 1 462 63
	bic	r3, r3, #1536
	.loc 1 462 87
	orr	r3, r3, #1024
	.loc 1 462 31
	str	r3, [r2, #8]
.L62:
	.loc 1 467 3 is_stmt 1
	.loc 1 467 9 is_stmt 0
	ldr	r2, [r4]
	.loc 1 467 19
	ldr	r3, [r2, #80]
	.loc 1 467 30
	bic	r3, r3, #1
	str	r3, [r2, #80]
	.loc 1 471 3 is_stmt 1
	.loc 1 471 18 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 471 6
	tst	r3, #4194304
	beq	.L64
	.loc 1 474 5 is_stmt 1
	.loc 1 474 43 is_stmt 0
	ldr	r2, [r4]
	.loc 1 474 53
	ldr	r3, [r2, #12]
	.loc 1 474 63
	bic	r3, r3, #-2147483648
	.loc 1 474 102
	ldr	r1, [r4, #84]
	.loc 1 474 88
	orrs	r3, r3, r1
	.loc 1 474 31
	str	r3, [r2, #12]
.L64:
	.loc 1 477 3 is_stmt 1
	.loc 1 477 19 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #132]
	.loc 1 478 3 is_stmt 1
	.loc 1 478 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 480 3 is_stmt 1
.LVL39:
.L38:
	.loc 1 481 1 is_stmt 0
	pop	{r3, r4, r5, r6, r7, pc}
.LVL40:
.L79:
	.loc 1 411 5 is_stmt 1
	.loc 1 411 19 is_stmt 0
	ldr	r3, [r4, #64]
	.loc 1 411 8
	cmp	r3, #1
	beq	.L80
	.loc 1 417 7 is_stmt 1
	.loc 1 417 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 417 23
	ldr	r3, [r2]
	.loc 1 417 30
	bic	r3, r3, #32768
	str	r3, [r2]
.L55:
	.loc 1 421 5 is_stmt 1
	.loc 1 421 19 is_stmt 0
	ldr	r3, [r4, #68]
	.loc 1 421 8
	cmp	r3, #1
	beq	.L81
	.loc 1 427 7 is_stmt 1
	.loc 1 427 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 427 23
	ldr	r3, [r2]
	.loc 1 427 30
	bic	r3, r3, #16384
	str	r3, [r2]
.L57:
	.loc 1 431 5 is_stmt 1
	.loc 1 431 19 is_stmt 0
	ldr	r3, [r4]
	.loc 1 431 8
	ldr	r1, .L82
	ldr	r2, .L82+4
	cmp	r3, r1
	it	ne
	cmpne	r3, r2
	beq	.L58
	.loc 1 431 11 discriminator 1
	add	r2, r2, #1024
	cmp	r3, r2
	beq	.L58
	.loc 1 431 242 discriminator 3
	cmp	r5, #983040
	beq	.L59
.L58:
	.loc 1 431 277 discriminator 5
	ldr	r1, .L82
	ldr	r2, .L82+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L60
	.loc 1 432 168
	add	r2, r2, #1024
	cmp	r3, r2
	bne	.L61
.L60:
	.loc 1 432 241 discriminator 1
	cmp	r5, #2031616
	beq	.L59
.L61:
	.loc 1 442 7 is_stmt 1
	.loc 1 442 23 is_stmt 0
	ldr	r2, [r3]
	.loc 1 442 30
	bic	r2, r2, #8192
	str	r2, [r3]
	.loc 1 446 7 is_stmt 1
	.loc 1 446 50 is_stmt 0
	lsrs	r5, r5, #16
.LVL41:
	.loc 1 446 60
	adds	r5, r5, #1
	.loc 1 446 25
	movs	r2, #1
	lsls	r2, r2, r5
.LVL42:
	.loc 1 447 7 is_stmt 1
	.loc 1 447 48 is_stmt 0
	ldr	r3, [r4, #44]
	.loc 1 447 13
	ldr	r1, [r4]
	.loc 1 447 64
	orrs	r3, r3, r2
	.loc 1 447 34
	str	r3, [r1, #64]
	b	.L53
.LVL43:
.L80:
	.loc 1 413 7 is_stmt 1
	.loc 1 413 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 413 23
	ldr	r3, [r2]
	.loc 1 413 30
	orr	r3, r3, #32768
	str	r3, [r2]
	b	.L55
.L81:
	.loc 1 423 7 is_stmt 1
	.loc 1 423 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 423 23
	ldr	r3, [r2]
	.loc 1 423 30
	orr	r3, r3, #16384
	str	r3, [r2]
	b	.L57
.L59:
	.loc 1 435 7 is_stmt 1
	.loc 1 435 23 is_stmt 0
	ldr	r2, [r3]
	.loc 1 435 30
	orr	r2, r2, #8192
	str	r2, [r3]
	.loc 1 437 7 is_stmt 1
	.loc 1 437 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 437 47
	ldr	r2, [r4, #44]
	.loc 1 437 34
	str	r2, [r3, #64]
	b	.L53
.LVL44:
.L65:
	.cfi_def_cfa_offset 0
	.cfi_restore 3
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 7
	.cfi_restore 14
	.loc 1 250 12
	movs	r0, #1
.LVL45:
	.loc 1 481 1
	bx	lr
.LVL46:
.L66:
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	.loc 1 285 12
	movs	r0, #1
.LVL47:
	b	.L38
.LVL48:
.L67:
	.loc 1 293 12
	movs	r0, #1
.LVL49:
	b	.L38
.LVL50:
.L68:
	movs	r0, #1
.LVL51:
	b	.L38
.LVL52:
.L69:
	.loc 1 302 14
	movs	r0, #1
.LVL53:
	b	.L38
.L83:
	.align	2
.L82:
	.word	1073819648
	.word	1073756160
	.word	1073757184
	.cfi_endproc
.LFE335:
	.size	HAL_SPI_Init, .-HAL_SPI_Init
	.section	.text.HAL_SPI_MspDeInit,"ax",%progbits
	.align	1
	.weak	HAL_SPI_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_MspDeInit, %function
HAL_SPI_MspDeInit:
.LFB338:
	.loc 1 550 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL54:
	.loc 1 552 3
	.loc 1 557 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE338:
	.size	HAL_SPI_MspDeInit, .-HAL_SPI_MspDeInit
	.section	.text.HAL_SPI_DeInit,"ax",%progbits
	.align	1
	.global	HAL_SPI_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_DeInit, %function
HAL_SPI_DeInit:
.LFB336:
	.loc 1 490 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL55:
	.loc 1 492 3
	.loc 1 492 6 is_stmt 0
	cbz	r0, .L87
	.loc 1 490 1
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 498 3 is_stmt 1
	.loc 1 500 3
	.loc 1 500 15 is_stmt 0
	movs	r3, #2
	strb	r3, [r0, #129]
	.loc 1 503 3 is_stmt 1
	.loc 1 503 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 503 21
	ldr	r3, [r2]
	.loc 1 503 28
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 515 3 is_stmt 1
	bl	HAL_SPI_MspDeInit
.LVL56:
	.loc 1 518 3
	.loc 1 518 19 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #132]
	.loc 1 519 3 is_stmt 1
	.loc 1 519 15 is_stmt 0
	strb	r0, [r4, #129]
	.loc 1 522 3 is_stmt 1
	.loc 1 522 7
	.loc 1 522 20 is_stmt 0
	strb	r0, [r4, #128]
	.loc 1 522 5 is_stmt 1
	.loc 1 524 3
	.loc 1 525 1 is_stmt 0
	pop	{r4, pc}
.LVL57:
.L87:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 494 12
	movs	r0, #1
.LVL58:
	.loc 1 525 1
	bx	lr
	.cfi_endproc
.LFE336:
	.size	HAL_SPI_DeInit, .-HAL_SPI_DeInit
	.section	.text.HAL_SPI_Transmit,"ax",%progbits
	.align	1
	.global	HAL_SPI_Transmit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_Transmit, %function
HAL_SPI_Transmit:
.LFB339:
	.loc 1 825 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL59:
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.cfi_def_cfa_offset 32
	.cfi_offset 4, -32
	.cfi_offset 5, -28
	.cfi_offset 6, -24
	.cfi_offset 7, -20
	.cfi_offset 8, -16
	.cfi_offset 9, -12
	.cfi_offset 10, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 40
	mov	r4, r0
	mov	r10, r1
	mov	r9, r2
	mov	r5, r3
	.loc 1 827 3
	.loc 1 827 65 is_stmt 0
	ldr	r8, [r0]
.LVL60:
	.loc 1 830 3 is_stmt 1
	.loc 1 833 3
	.loc 1 836 3
	.loc 1 836 15 is_stmt 0
	bl	HAL_GetTick
.LVL61:
	.loc 1 838 3 is_stmt 1
	.loc 1 838 11 is_stmt 0
	ldrb	r6, [r4, #129]	@ zero_extendqisi2
	uxtb	r6, r6
	.loc 1 838 6
	cmp	r6, #1
	bne	.L121
	mov	r7, r0
	.loc 1 843 3 is_stmt 1
	.loc 1 843 6 is_stmt 0
	cmp	r9, #0
	it	ne
	cmpne	r10, #0
	beq	.L93
	.loc 1 849 3 is_stmt 1
	.loc 1 849 7
	.loc 1 849 16 is_stmt 0
	ldrb	r3, [r4, #128]	@ zero_extendqisi2
	.loc 1 849 9
	cmp	r3, #1
	beq	.L122
	.loc 1 849 66 is_stmt 1 discriminator 2
	.loc 1 849 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r4, #128]
	.loc 1 849 5 is_stmt 1 discriminator 2
	.loc 1 852 3 discriminator 2
	.loc 1 852 15 is_stmt 0 discriminator 2
	movs	r3, #3
	strb	r3, [r4, #129]
	.loc 1 853 3 is_stmt 1 discriminator 2
	.loc 1 853 19 is_stmt 0 discriminator 2
	movs	r3, #0
	str	r3, [r4, #132]
	.loc 1 854 3 is_stmt 1 discriminator 2
	.loc 1 854 20 is_stmt 0 discriminator 2
	str	r10, [r4, #92]
	.loc 1 855 3 is_stmt 1 discriminator 2
	.loc 1 855 20 is_stmt 0 discriminator 2
	strh	r9, [r4, #96]	@ movhi
	.loc 1 856 3 is_stmt 1 discriminator 2
	.loc 1 856 21 is_stmt 0 discriminator 2
	strh	r9, [r4, #98]	@ movhi
	.loc 1 859 3 is_stmt 1 discriminator 2
	.loc 1 859 20 is_stmt 0 discriminator 2
	str	r3, [r4, #100]
	.loc 1 860 3 is_stmt 1 discriminator 2
	.loc 1 860 20 is_stmt 0 discriminator 2
	strh	r3, [r4, #104]	@ movhi
	.loc 1 861 3 is_stmt 1 discriminator 2
	.loc 1 861 21 is_stmt 0 discriminator 2
	strh	r3, [r4, #106]	@ movhi
	.loc 1 862 3 is_stmt 1 discriminator 2
	.loc 1 862 15 is_stmt 0 discriminator 2
	str	r3, [r4, #116]
	.loc 1 863 3 is_stmt 1 discriminator 2
	.loc 1 863 15 is_stmt 0 discriminator 2
	str	r3, [r4, #112]
	.loc 1 866 3 is_stmt 1 discriminator 2
	.loc 1 866 17 is_stmt 0 discriminator 2
	ldr	r3, [r4, #8]
	.loc 1 866 6 discriminator 2
	cmp	r3, #393216
	beq	.L126
	.loc 1 872 5 is_stmt 1
	.loc 1 872 47 is_stmt 0
	ldr	r2, [r4]
	.loc 1 872 57
	ldr	r3, [r2, #12]
	.loc 1 872 67
	bic	r3, r3, #393216
	.loc 1 872 92
	orr	r3, r3, #131072
	.loc 1 872 33
	str	r3, [r2, #12]
.L95:
	.loc 1 876 3 is_stmt 1
	.loc 1 876 40 is_stmt 0
	ldr	r2, [r4]
	.loc 1 876 50
	ldr	r1, [r2, #4]
	.loc 1 876 59
	ldr	r3, .L129
	ands	r3, r3, r1
	.loc 1 876 86
	orr	r3, r9, r3
	.loc 1 876 28
	str	r3, [r2, #4]
	.loc 1 879 3 is_stmt 1
	.loc 1 879 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 879 21
	ldr	r3, [r2]
	.loc 1 879 28
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 881 3 is_stmt 1
	.loc 1 881 17 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 881 6
	cmp	r3, #4194304
	beq	.L127
.L96:
	.loc 1 888 3 is_stmt 1
	.loc 1 888 17 is_stmt 0
	ldr	r3, [r4, #12]
	.loc 1 888 6
	cmp	r3, #15
	bhi	.L97
	.loc 1 920 8 is_stmt 1
	.loc 1 920 11 is_stmt 0
	cmp	r3, #7
	bhi	.L105
	b	.L106
.L126:
	.loc 1 868 5 is_stmt 1
	.loc 1 868 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 868 23
	ldr	r3, [r2]
	.loc 1 868 30
	orr	r3, r3, #2048
	str	r3, [r2]
	b	.L95
.L127:
	.loc 1 884 5 is_stmt 1
	.loc 1 884 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 884 21
	ldr	r3, [r2]
	.loc 1 884 28
	orr	r3, r3, #512
	str	r3, [r2]
	b	.L96
.LVL62:
.L128:
	.loc 1 896 9 is_stmt 1
	.loc 1 896 81 is_stmt 0
	ldr	r2, [r4, #92]
	.loc 1 896 57
	ldr	r2, [r2]
	.loc 1 896 55
	str	r2, [r3, #32]
	.loc 1 897 9 is_stmt 1
	.loc 1 897 13 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 897 26
	adds	r3, r3, #4
	str	r3, [r4, #92]
	.loc 1 898 9 is_stmt 1
	.loc 1 898 13 is_stmt 0
	ldrh	r2, [r4, #98]
	uxth	r2, r2
	.loc 1 898 26
	subs	r2, r2, #1
	uxth	r2, r2
	strh	r2, [r4, #98]	@ movhi
.L97:
	.loc 1 891 30 is_stmt 1
	.loc 1 891 16 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 891 30
	cmp	r3, #0
	beq	.L104
	.loc 1 894 7 is_stmt 1
	.loc 1 894 20 is_stmt 0
	ldr	r3, [r4]
	.loc 1 894 30
	ldr	r2, [r3, #20]
	.loc 1 894 10
	tst	r2, #2
	bne	.L128
	.loc 1 903 9 is_stmt 1
	.loc 1 903 16 is_stmt 0
	bl	HAL_GetTick
.LVL63:
	.loc 1 903 30
	subs	r0, r0, r7
	.loc 1 903 12
	cmp	r0, r5
	bcc	.L101
	.loc 1 903 55 discriminator 1
	cmp	r5, #-1
	bne	.L102
.L101:
	.loc 1 903 84 discriminator 3
	cmp	r5, #0
	bne	.L97
.L102:
	.loc 1 906 11 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL64:
	.loc 1 908 11
	.loc 1 908 17 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 908 30
	orr	r3, r3, #256
	str	r3, [r4, #132]
	.loc 1 909 11 is_stmt 1
	.loc 1 909 23 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 912 11 is_stmt 1
	.loc 1 912 15
	.loc 1 912 28 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 912 13 is_stmt 1
	.loc 1 914 11
	.loc 1 914 18 is_stmt 0
	movs	r6, #3
	b	.L93
.L108:
	.loc 1 937 11 is_stmt 1
	.loc 1 937 51 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 937 27
	ldrh	r3, [r3]
	.loc 1 937 25
	strh	r3, [r8, #32]	@ movhi
	.loc 1 941 11 is_stmt 1
	.loc 1 941 15 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 941 28
	adds	r3, r3, #2
	str	r3, [r4, #92]
	.loc 1 942 11 is_stmt 1
	.loc 1 942 15 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 942 28
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #98]	@ movhi
.L105:
	.loc 1 923 30 is_stmt 1
	.loc 1 923 16 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 923 30
	cmp	r3, #0
	beq	.L104
	.loc 1 926 7 is_stmt 1
	.loc 1 926 20 is_stmt 0
	ldr	r2, [r4]
	.loc 1 926 30
	ldr	r3, [r2, #20]
	.loc 1 926 10
	tst	r3, #2
	beq	.L107
	.loc 1 928 9 is_stmt 1
	.loc 1 928 18 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 928 12
	cmp	r3, #1
	bls	.L108
	.loc 1 928 53 discriminator 1
	ldr	r3, [r4, #60]
	.loc 1 928 39 discriminator 1
	cmp	r3, #0
	beq	.L108
	.loc 1 930 11 is_stmt 1
	.loc 1 930 83 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 930 59
	ldr	r3, [r3]
	.loc 1 930 57
	str	r3, [r2, #32]
	.loc 1 931 11 is_stmt 1
	.loc 1 931 15 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 931 28
	adds	r3, r3, #4
	str	r3, [r4, #92]
	.loc 1 932 11 is_stmt 1
	.loc 1 932 15 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 932 29
	subs	r3, r3, #2
	uxth	r3, r3
	strh	r3, [r4, #98]	@ movhi
	b	.L105
.L107:
	.loc 1 948 9 is_stmt 1
	.loc 1 948 16 is_stmt 0
	bl	HAL_GetTick
.LVL65:
	.loc 1 948 30
	subs	r0, r0, r7
	.loc 1 948 12
	cmp	r0, r5
	bcc	.L110
	.loc 1 948 55 discriminator 1
	cmp	r5, #-1
	bne	.L111
.L110:
	.loc 1 948 84 discriminator 3
	cmp	r5, #0
	bne	.L105
.L111:
	.loc 1 951 11 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL66:
	.loc 1 953 11
	.loc 1 953 17 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 953 30
	orr	r3, r3, #256
	str	r3, [r4, #132]
	.loc 1 954 11 is_stmt 1
	.loc 1 954 23 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 957 11 is_stmt 1
	.loc 1 957 15
	.loc 1 957 28 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 957 13 is_stmt 1
	.loc 1 959 11
	.loc 1 959 18 is_stmt 0
	movs	r6, #3
	b	.L93
.L114:
	.loc 1 978 14 is_stmt 1
	.loc 1 978 23 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 978 17
	cmp	r3, #1
	bls	.L116
	.loc 1 978 58 discriminator 1
	ldr	r3, [r4, #60]
	.loc 1 978 44 discriminator 1
	cbz	r3, .L116
	.loc 1 981 11 is_stmt 1
	.loc 1 981 51 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 981 27
	ldrh	r3, [r3]
	.loc 1 981 25
	strh	r3, [r8, #32]	@ movhi
	.loc 1 985 11 is_stmt 1
	.loc 1 985 15 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 985 28
	adds	r3, r3, #2
	str	r3, [r4, #92]
	.loc 1 986 11 is_stmt 1
	.loc 1 986 15 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 986 29
	subs	r3, r3, #2
	uxth	r3, r3
	strh	r3, [r4, #98]	@ movhi
	b	.L106
.L116:
	.loc 1 990 11 is_stmt 1
	.loc 1 990 81 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 990 58
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 990 56
	strb	r3, [r2, #32]
	.loc 1 991 11 is_stmt 1
	.loc 1 991 15 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 991 28
	adds	r3, r3, #1
	str	r3, [r4, #92]
	.loc 1 992 11 is_stmt 1
	.loc 1 992 15 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 992 28
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #98]	@ movhi
.L106:
	.loc 1 967 30 is_stmt 1
	.loc 1 967 16 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 967 30
	cmp	r3, #0
	beq	.L104
	.loc 1 970 7 is_stmt 1
	.loc 1 970 20 is_stmt 0
	ldr	r2, [r4]
	.loc 1 970 30
	ldr	r3, [r2, #20]
	.loc 1 970 10
	tst	r3, #2
	beq	.L113
	.loc 1 972 9 is_stmt 1
	.loc 1 972 18 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 972 12
	cmp	r3, #3
	bls	.L114
	.loc 1 972 53 discriminator 1
	ldr	r3, [r4, #60]
	.loc 1 972 39 discriminator 1
	cmp	r3, #64
	bls	.L114
	.loc 1 974 11 is_stmt 1
	.loc 1 974 83 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 974 59
	ldr	r3, [r3]
	.loc 1 974 57
	str	r3, [r2, #32]
	.loc 1 975 11 is_stmt 1
	.loc 1 975 15 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 975 28
	adds	r3, r3, #4
	str	r3, [r4, #92]
	.loc 1 976 11 is_stmt 1
	.loc 1 976 15 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 976 29
	subs	r3, r3, #4
	uxth	r3, r3
	strh	r3, [r4, #98]	@ movhi
	b	.L106
.L113:
	.loc 1 998 9 is_stmt 1
	.loc 1 998 16 is_stmt 0
	bl	HAL_GetTick
.LVL67:
	.loc 1 998 30
	subs	r0, r0, r7
	.loc 1 998 12
	cmp	r0, r5
	bcc	.L117
	.loc 1 998 55 discriminator 1
	cmp	r5, #-1
	bne	.L118
.L117:
	.loc 1 998 84 discriminator 3
	cmp	r5, #0
	bne	.L106
.L118:
	.loc 1 1001 11 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL68:
	.loc 1 1003 11
	.loc 1 1003 17 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1003 30
	orr	r3, r3, #256
	str	r3, [r4, #132]
	.loc 1 1004 11 is_stmt 1
	.loc 1 1004 23 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 1007 11 is_stmt 1
	.loc 1 1007 15
	.loc 1 1007 28 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 1007 13 is_stmt 1
	.loc 1 1009 11
	.loc 1 1009 18 is_stmt 0
	movs	r6, #3
	b	.L93
.L104:
	.loc 1 1016 3 is_stmt 1
	.loc 1 1016 7 is_stmt 0
	str	r7, [sp]
	mov	r3, r5
	movs	r2, #0
	movs	r1, #8
	mov	r0, r4
	bl	SPI_WaitOnFlagUntilTimeout
.LVL69:
	.loc 1 1016 6
	cbz	r0, .L120
	.loc 1 1018 5 is_stmt 1
	.loc 1 1018 11 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1018 24
	orr	r3, r3, #32
	str	r3, [r4, #132]
.L120:
	.loc 1 1022 3 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL70:
	.loc 1 1024 3
	.loc 1 1024 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 1027 3 is_stmt 1
	.loc 1 1027 7
	.loc 1 1027 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 1027 5 is_stmt 1
	.loc 1 1029 3
	.loc 1 1029 11 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1029 6
	cbnz	r3, .L93
	.loc 1 1035 12
	movs	r6, #0
	b	.L93
.LVL71:
.L121:
	.loc 1 840 12
	movs	r6, #2
.LVL72:
.L93:
	.loc 1 1037 1
	mov	r0, r6
	add	sp, sp, #8
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.LVL73:
.L122:
	.cfi_restore_state
	.loc 1 849 47
	movs	r6, #2
	b	.L93
.L130:
	.align	2
.L129:
	.word	-65536
	.cfi_endproc
.LFE339:
	.size	HAL_SPI_Transmit, .-HAL_SPI_Transmit
	.section	.text.HAL_SPI_Receive,"ax",%progbits
	.align	1
	.global	HAL_SPI_Receive
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_Receive, %function
HAL_SPI_Receive:
.LFB340:
	.loc 1 1049 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL74:
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
	sub	sp, sp, #12
	.cfi_def_cfa_offset 48
	mov	r4, r0
	mov	fp, r1
	mov	r10, r2
	mov	r6, r3
	.loc 1 1050 3
	.loc 1 1051 3
	.loc 1 1052 3
	.loc 1 1053 3
	.loc 1 1053 50 is_stmt 0
	ldr	r5, [r0, #60]
	.loc 1 1053 29
	ubfx	r5, r5, #5, #16
.LVL75:
	.loc 1 1055 3 is_stmt 1
	.loc 1 1055 65 is_stmt 0
	ldr	r9, [r0]
.LVL76:
	.loc 1 1059 3 is_stmt 1
	.loc 1 1062 3
	.loc 1 1062 15 is_stmt 0
	bl	HAL_GetTick
.LVL77:
	.loc 1 1064 3 is_stmt 1
	.loc 1 1064 11 is_stmt 0
	ldrb	r7, [r4, #129]	@ zero_extendqisi2
	uxtb	r7, r7
	.loc 1 1064 6
	cmp	r7, #1
	bne	.L162
	adds	r5, r5, #1
.LVL78:
	uxth	r5, r5
.LVL79:
	mov	r8, r0
	.loc 1 1069 3 is_stmt 1
	.loc 1 1069 6 is_stmt 0
	cmp	r10, #0
	it	ne
	cmpne	fp, #0
	beq	.L132
	.loc 1 1075 3 is_stmt 1
	.loc 1 1075 7
	.loc 1 1075 16 is_stmt 0
	ldrb	r3, [r4, #128]	@ zero_extendqisi2
	.loc 1 1075 9
	cmp	r3, #1
	beq	.L163
	.loc 1 1075 66 is_stmt 1 discriminator 2
	.loc 1 1075 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r4, #128]
	.loc 1 1075 5 is_stmt 1 discriminator 2
	.loc 1 1078 3 discriminator 2
	.loc 1 1078 15 is_stmt 0 discriminator 2
	movs	r3, #4
	strb	r3, [r4, #129]
	.loc 1 1079 3 is_stmt 1 discriminator 2
	.loc 1 1079 19 is_stmt 0 discriminator 2
	movs	r3, #0
	str	r3, [r4, #132]
	.loc 1 1080 3 is_stmt 1 discriminator 2
	.loc 1 1080 20 is_stmt 0 discriminator 2
	str	fp, [r4, #100]
	.loc 1 1081 3 is_stmt 1 discriminator 2
	.loc 1 1081 20 is_stmt 0 discriminator 2
	strh	r10, [r4, #104]	@ movhi
	.loc 1 1082 3 is_stmt 1 discriminator 2
	.loc 1 1082 21 is_stmt 0 discriminator 2
	strh	r10, [r4, #106]	@ movhi
	.loc 1 1085 3 is_stmt 1 discriminator 2
	.loc 1 1085 20 is_stmt 0 discriminator 2
	str	r3, [r4, #92]
	.loc 1 1086 3 is_stmt 1 discriminator 2
	.loc 1 1086 20 is_stmt 0 discriminator 2
	strh	r3, [r4, #96]	@ movhi
	.loc 1 1087 3 is_stmt 1 discriminator 2
	.loc 1 1087 21 is_stmt 0 discriminator 2
	strh	r3, [r4, #98]	@ movhi
	.loc 1 1088 3 is_stmt 1 discriminator 2
	.loc 1 1088 15 is_stmt 0 discriminator 2
	str	r3, [r4, #112]
	.loc 1 1089 3 is_stmt 1 discriminator 2
	.loc 1 1089 15 is_stmt 0 discriminator 2
	str	r3, [r4, #116]
	.loc 1 1092 3 is_stmt 1 discriminator 2
	.loc 1 1092 17 is_stmt 0 discriminator 2
	ldr	r3, [r4, #8]
	.loc 1 1092 6 discriminator 2
	cmp	r3, #393216
	beq	.L167
	.loc 1 1098 5 is_stmt 1
	.loc 1 1098 47 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1098 57
	ldr	r3, [r2, #12]
	.loc 1 1098 67
	bic	r3, r3, #393216
	.loc 1 1098 92
	orr	r3, r3, #262144
	.loc 1 1098 33
	str	r3, [r2, #12]
.L134:
	.loc 1 1102 3 is_stmt 1
	.loc 1 1102 40 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1102 50
	ldr	r1, [r2, #4]
	.loc 1 1102 59
	ldr	r3, .L170
	ands	r3, r3, r1
	.loc 1 1102 86
	orr	r3, r10, r3
	.loc 1 1102 28
	str	r3, [r2, #4]
	.loc 1 1105 3 is_stmt 1
	.loc 1 1105 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1105 21
	ldr	r3, [r2]
	.loc 1 1105 28
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 1107 3 is_stmt 1
	.loc 1 1107 17 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 1107 6
	cmp	r3, #4194304
	beq	.L168
.L135:
	.loc 1 1114 3 is_stmt 1
	.loc 1 1114 17 is_stmt 0
	ldr	r3, [r4, #12]
	.loc 1 1114 6
	cmp	r3, #15
	bhi	.L136
	.loc 1 1156 8 is_stmt 1
	.loc 1 1156 11 is_stmt 0
	cmp	r3, #7
	bhi	.L145
	b	.L146
.L167:
	.loc 1 1094 5 is_stmt 1
	.loc 1 1094 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1094 23
	ldr	r3, [r2]
	.loc 1 1094 30
	bic	r3, r3, #2048
	str	r3, [r2]
	b	.L134
.L168:
	.loc 1 1110 5 is_stmt 1
	.loc 1 1110 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1110 21
	ldr	r3, [r2]
	.loc 1 1110 28
	orr	r3, r3, #512
	str	r3, [r2]
	b	.L135
.LVL80:
.L138:
	.loc 1 1130 12 is_stmt 1
	.loc 1 1130 21 is_stmt 0
	ldrh	r2, [r4, #106]
	uxth	r2, r2
	.loc 1 1130 15
	cmp	r2, r5
	bcs	.L140
	.loc 1 1130 60 discriminator 1
	tst	r1, #32768
	beq	.L140
	.loc 1 1132 9 is_stmt 1
	.loc 1 1132 27 is_stmt 0
	ldr	r2, [r4, #100]
	.loc 1 1132 43
	ldr	r3, [r3, #48]
	.loc 1 1132 41
	str	r3, [r2]
	.loc 1 1133 9 is_stmt 1
	.loc 1 1133 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1133 26
	adds	r3, r3, #4
	str	r3, [r4, #100]
	.loc 1 1134 9 is_stmt 1
	.loc 1 1134 13 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1134 26
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	b	.L136
.L140:
	.loc 1 1139 9 is_stmt 1
	.loc 1 1139 16 is_stmt 0
	bl	HAL_GetTick
.LVL81:
	.loc 1 1139 30
	sub	r0, r0, r8
	.loc 1 1139 12
	cmp	r0, r6
	bcc	.L141
	.loc 1 1139 55 discriminator 1
	cmp	r6, #-1
	bne	.L142
.L141:
	.loc 1 1139 84 discriminator 3
	cbz	r6, .L142
.LVL82:
.L136:
	.loc 1 1117 30 is_stmt 1
	.loc 1 1117 16 is_stmt 0
	ldrh	r2, [r4, #106]
	uxth	r2, r2
	.loc 1 1117 30
	cmp	r2, #0
	beq	.L144
	.loc 1 1120 7 is_stmt 1
	.loc 1 1120 25 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1120 19
	ldr	r1, [r3, #20]
.LVL83:
	.loc 1 1123 7 is_stmt 1
	.loc 1 1123 30 is_stmt 0
	ldr	r2, [r3, #20]
	.loc 1 1123 10
	tst	r2, #1
	beq	.L138
	.loc 1 1125 9 is_stmt 1
	.loc 1 1125 27 is_stmt 0
	ldr	r2, [r4, #100]
	.loc 1 1125 43
	ldr	r3, [r3, #48]
	.loc 1 1125 41
	str	r3, [r2]
	.loc 1 1126 9 is_stmt 1
	.loc 1 1126 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1126 26
	adds	r3, r3, #4
	str	r3, [r4, #100]
	.loc 1 1127 9 is_stmt 1
	.loc 1 1127 13 is_stmt 0
	ldrh	r2, [r4, #106]
	uxth	r2, r2
	.loc 1 1127 26
	subs	r2, r2, #1
	uxth	r2, r2
	strh	r2, [r4, #106]	@ movhi
	b	.L136
.LVL84:
.L142:
	.loc 1 1142 11 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL85:
	.loc 1 1144 11
	.loc 1 1144 17 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1144 30
	orr	r3, r3, #256
	str	r3, [r4, #132]
	.loc 1 1145 11 is_stmt 1
	.loc 1 1145 23 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 1148 11 is_stmt 1
	.loc 1 1148 15
	.loc 1 1148 28 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 1148 13 is_stmt 1
	.loc 1 1150 11
	.loc 1 1150 18 is_stmt 0
	movs	r7, #3
	b	.L132
.LVL86:
.L147:
	.loc 1 1176 12 is_stmt 1
	.loc 1 1176 21 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1176 15
	cmp	r3, r5
	bcs	.L149
	.loc 1 1176 60 discriminator 1
	tst	r2, #32768
	beq	.L149
	.loc 1 1179 9 is_stmt 1
	.loc 1 1179 27 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1179 43
	ldrh	r2, [r9, #48]
.LVL87:
	.loc 1 1179 41
	strh	r2, [r3]	@ movhi
	.loc 1 1183 9 is_stmt 1
	.loc 1 1183 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1183 26
	adds	r2, r3, #2
	str	r2, [r4, #100]
	.loc 1 1185 9 is_stmt 1
	.loc 1 1185 43 is_stmt 0
	ldrh	r2, [r9, #48]
	.loc 1 1185 41
	strh	r2, [r3, #2]	@ movhi
	.loc 1 1189 9 is_stmt 1
	.loc 1 1189 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1189 26
	adds	r3, r3, #2
	str	r3, [r4, #100]
	.loc 1 1190 9 is_stmt 1
	.loc 1 1190 13 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1190 27
	subs	r3, r3, #2
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	b	.L145
.LVL88:
.L149:
	.loc 1 1193 12 is_stmt 1
	.loc 1 1193 21 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1193 15
	cmp	r3, #1
	bne	.L150
	.loc 1 1193 43 discriminator 1
	tst	r2, #8192
	beq	.L150
	.loc 1 1196 9 is_stmt 1
	.loc 1 1196 27 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1196 43
	ldrh	r2, [r9, #48]
.LVL89:
	.loc 1 1196 41
	strh	r2, [r3]	@ movhi
	.loc 1 1200 9 is_stmt 1
	.loc 1 1200 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1200 26
	adds	r3, r3, #2
	str	r3, [r4, #100]
	.loc 1 1201 9 is_stmt 1
	.loc 1 1201 13 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1201 26
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	b	.L145
.LVL90:
.L150:
	.loc 1 1206 9 is_stmt 1
	.loc 1 1206 16 is_stmt 0
	bl	HAL_GetTick
.LVL91:
	.loc 1 1206 30
	sub	r0, r0, r8
	.loc 1 1206 12
	cmp	r0, r6
	bcc	.L151
	.loc 1 1206 55 discriminator 1
	cmp	r6, #-1
	bne	.L152
.L151:
	.loc 1 1206 84 discriminator 3
	cbz	r6, .L152
.LVL92:
.L145:
	.loc 1 1159 30 is_stmt 1
	.loc 1 1159 16 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1159 30
	cmp	r3, #0
	beq	.L144
	.loc 1 1162 7 is_stmt 1
	.loc 1 1162 25 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1162 19
	ldr	r2, [r3, #20]
.LVL93:
	.loc 1 1165 7 is_stmt 1
	.loc 1 1165 30 is_stmt 0
	ldr	r3, [r3, #20]
	.loc 1 1165 10
	tst	r3, #1
	beq	.L147
	.loc 1 1168 9 is_stmt 1
	.loc 1 1168 27 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1168 43
	ldrh	r2, [r9, #48]
.LVL94:
	.loc 1 1168 41
	strh	r2, [r3]	@ movhi
	.loc 1 1172 9 is_stmt 1
	.loc 1 1172 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1172 26
	adds	r3, r3, #2
	str	r3, [r4, #100]
	.loc 1 1173 9 is_stmt 1
	.loc 1 1173 13 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1173 26
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	b	.L145
.L152:
	.loc 1 1209 11 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL95:
	.loc 1 1211 11
	.loc 1 1211 17 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1211 30
	orr	r3, r3, #256
	str	r3, [r4, #132]
	.loc 1 1212 11 is_stmt 1
	.loc 1 1212 23 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 1215 11 is_stmt 1
	.loc 1 1215 15
	.loc 1 1215 28 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 1215 13 is_stmt 1
	.loc 1 1217 11
	.loc 1 1217 18 is_stmt 0
	movs	r7, #3
	b	.L132
.LVL96:
.L154:
	.loc 1 1239 12 is_stmt 1
	.loc 1 1239 21 is_stmt 0
	ldrh	r2, [r4, #106]
	uxth	r2, r2
	.loc 1 1239 15
	cmp	r2, r5
	bcs	.L156
	.loc 1 1239 60 discriminator 1
	tst	r1, #32768
	beq	.L156
	.loc 1 1241 9 is_stmt 1
	.loc 1 1241 26 is_stmt 0
	ldr	r2, [r4, #100]
	.loc 1 1241 42
	ldrb	r3, [r3, #48]	@ zero_extendqisi2
	.loc 1 1241 40
	strb	r3, [r2]
	.loc 1 1242 9 is_stmt 1
	.loc 1 1242 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1242 26
	adds	r2, r3, #1
	str	r2, [r4, #100]
	.loc 1 1243 9 is_stmt 1
	.loc 1 1243 69 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1243 42
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	.loc 1 1243 40
	strb	r2, [r3, #1]
	.loc 1 1244 9 is_stmt 1
	.loc 1 1244 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1244 26
	adds	r2, r3, #1
	str	r2, [r4, #100]
	.loc 1 1245 9 is_stmt 1
	.loc 1 1245 69 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1245 42
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	.loc 1 1245 40
	strb	r2, [r3, #1]
	.loc 1 1246 9 is_stmt 1
	.loc 1 1246 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1246 26
	adds	r2, r3, #1
	str	r2, [r4, #100]
	.loc 1 1247 9 is_stmt 1
	.loc 1 1247 69 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1247 42
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	.loc 1 1247 40
	strb	r2, [r3, #1]
	.loc 1 1248 9 is_stmt 1
	.loc 1 1248 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1248 26
	adds	r3, r3, #1
	str	r3, [r4, #100]
	.loc 1 1249 9 is_stmt 1
	.loc 1 1249 13 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1249 27
	subs	r3, r3, #4
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	b	.L146
.L156:
	.loc 1 1252 12 is_stmt 1
	.loc 1 1252 21 is_stmt 0
	ldrh	r2, [r4, #106]
	uxth	r2, r2
	.loc 1 1252 15
	cmp	r2, #3
	bhi	.L157
	.loc 1 1252 42 discriminator 1
	tst	r1, #24576
	beq	.L157
	.loc 1 1254 9 is_stmt 1
	.loc 1 1254 26 is_stmt 0
	ldr	r2, [r4, #100]
	.loc 1 1254 42
	ldrb	r3, [r3, #48]	@ zero_extendqisi2
	.loc 1 1254 40
	strb	r3, [r2]
	.loc 1 1255 9 is_stmt 1
	.loc 1 1255 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1255 26
	adds	r3, r3, #1
	str	r3, [r4, #100]
	.loc 1 1256 9 is_stmt 1
	.loc 1 1256 13 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1256 26
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	b	.L146
.L157:
	.loc 1 1261 9 is_stmt 1
	.loc 1 1261 16 is_stmt 0
	bl	HAL_GetTick
.LVL97:
	.loc 1 1261 30
	sub	r0, r0, r8
	.loc 1 1261 12
	cmp	r0, r6
	bcc	.L158
	.loc 1 1261 55 discriminator 1
	cmp	r6, #-1
	bne	.L159
.L158:
	.loc 1 1261 84 discriminator 3
	cbz	r6, .L159
.LVL98:
.L146:
	.loc 1 1226 30 is_stmt 1
	.loc 1 1226 16 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1226 30
	cbz	r3, .L144
	.loc 1 1229 7 is_stmt 1
	.loc 1 1229 25 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1229 19
	ldr	r1, [r3, #20]
.LVL99:
	.loc 1 1232 7 is_stmt 1
	.loc 1 1232 30 is_stmt 0
	ldr	r2, [r3, #20]
	.loc 1 1232 10
	tst	r2, #1
	beq	.L154
	.loc 1 1234 9 is_stmt 1
	.loc 1 1234 26 is_stmt 0
	ldr	r2, [r4, #100]
	.loc 1 1234 42
	ldrb	r3, [r3, #48]	@ zero_extendqisi2
	.loc 1 1234 40
	strb	r3, [r2]
	.loc 1 1235 9 is_stmt 1
	.loc 1 1235 13 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1235 26
	adds	r3, r3, #1
	str	r3, [r4, #100]
	.loc 1 1236 9 is_stmt 1
	.loc 1 1236 13 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1236 26
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	b	.L146
.LVL100:
.L159:
	.loc 1 1264 11 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL101:
	.loc 1 1266 11
	.loc 1 1266 17 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1266 30
	orr	r3, r3, #256
	str	r3, [r4, #132]
	.loc 1 1267 11 is_stmt 1
	.loc 1 1267 23 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 1270 11 is_stmt 1
	.loc 1 1270 15
	.loc 1 1270 28 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 1270 13 is_stmt 1
	.loc 1 1272 11
	.loc 1 1272 18 is_stmt 0
	movs	r7, #3
	b	.L132
.L171:
	.align	2
.L170:
	.word	-65536
.LVL102:
.L144:
	.loc 1 1279 3 is_stmt 1
	.loc 1 1279 17 is_stmt 0
	ldr	r3, [r4, #40]
	.loc 1 1279 6
	cmp	r3, #4194304
	beq	.L169
.L161:
	.loc 1 1290 3 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL103:
	.loc 1 1292 3
	.loc 1 1292 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 1295 3 is_stmt 1
	.loc 1 1295 7
	.loc 1 1295 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 1295 5 is_stmt 1
	.loc 1 1298 3
	.loc 1 1298 11 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1298 6
	cbnz	r3, .L132
	.loc 1 1304 12
	movs	r7, #0
	b	.L132
.L169:
	.loc 1 1282 5 is_stmt 1
	.loc 1 1282 9 is_stmt 0
	str	r8, [sp]
	mov	r3, r6
	movs	r2, #0
	movs	r1, #8
	mov	r0, r4
	bl	SPI_WaitOnFlagUntilTimeout
.LVL104:
	.loc 1 1282 8
	cmp	r0, #0
	beq	.L161
	.loc 1 1284 7 is_stmt 1
	.loc 1 1284 13 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1284 26
	orr	r3, r3, #32
	str	r3, [r4, #132]
	b	.L161
.LVL105:
.L162:
	.loc 1 1066 12
	movs	r7, #2
.LVL106:
.L132:
	.loc 1 1306 1
	mov	r0, r7
	add	sp, sp, #12
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.LVL107:
.L163:
	.cfi_restore_state
	.loc 1 1075 47
	movs	r7, #2
	b	.L132
	.cfi_endproc
.LFE340:
	.size	HAL_SPI_Receive, .-HAL_SPI_Receive
	.section	.text.HAL_SPI_TransmitReceive,"ax",%progbits
	.align	1
	.global	HAL_SPI_TransmitReceive
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_TransmitReceive, %function
HAL_SPI_TransmitReceive:
.LFB341:
	.loc 1 1320 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL108:
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
	sub	sp, sp, #12
	.cfi_def_cfa_offset 48
	mov	r4, r0
	mov	r10, r1
	mov	r9, r2
	mov	r5, r3
	.loc 1 1322 3
	.loc 1 1322 65 is_stmt 0
	ldr	fp, [r0]
.LVL109:
	.loc 1 1323 3 is_stmt 1
	.loc 1 1326 3
	.loc 1 1327 3
	.loc 1 1328 3
	.loc 1 1329 3
	.loc 1 1330 3
	.loc 1 1331 3
	.loc 1 1332 3
	.loc 1 1332 50 is_stmt 0
	ldr	r6, [r0, #60]
	.loc 1 1332 29
	ubfx	r6, r6, #5, #16
.LVL110:
	.loc 1 1335 3 is_stmt 1
	.loc 1 1338 3
	.loc 1 1338 15 is_stmt 0
	bl	HAL_GetTick
.LVL111:
	.loc 1 1340 3 is_stmt 1
	.loc 1 1341 3
	.loc 1 1343 3
	.loc 1 1343 11 is_stmt 0
	ldrb	r7, [r4, #129]	@ zero_extendqisi2
	uxtb	r7, r7
	.loc 1 1343 6
	cmp	r7, #1
	bne	.L205
	adds	r6, r6, #1
.LVL112:
	uxth	r6, r6
.LVL113:
	mov	r8, r0
	.loc 1 1348 3 is_stmt 1
	.loc 1 1348 6 is_stmt 0
	cmp	r9, #0
	it	ne
	cmpne	r10, #0
	beq	.L173
	.loc 1 1348 45 discriminator 1
	cmp	r5, #0
	beq	.L173
	.loc 1 1354 3 is_stmt 1
	.loc 1 1354 7
	.loc 1 1354 16 is_stmt 0
	ldrb	r3, [r4, #128]	@ zero_extendqisi2
	.loc 1 1354 9
	cmp	r3, #1
	beq	.L206
	.loc 1 1354 66 is_stmt 1 discriminator 2
	.loc 1 1354 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r4, #128]
	.loc 1 1354 5 is_stmt 1 discriminator 2
	.loc 1 1357 3 discriminator 2
	.loc 1 1357 15 is_stmt 0 discriminator 2
	movs	r3, #5
	strb	r3, [r4, #129]
	.loc 1 1358 3 is_stmt 1 discriminator 2
	.loc 1 1358 19 is_stmt 0 discriminator 2
	movs	r3, #0
	str	r3, [r4, #132]
	.loc 1 1359 3 is_stmt 1 discriminator 2
	.loc 1 1359 20 is_stmt 0 discriminator 2
	str	r9, [r4, #100]
	.loc 1 1360 3 is_stmt 1 discriminator 2
	.loc 1 1360 21 is_stmt 0 discriminator 2
	strh	r5, [r4, #106]	@ movhi
	.loc 1 1361 3 is_stmt 1 discriminator 2
	.loc 1 1361 20 is_stmt 0 discriminator 2
	strh	r5, [r4, #104]	@ movhi
	.loc 1 1362 3 is_stmt 1 discriminator 2
	.loc 1 1362 20 is_stmt 0 discriminator 2
	str	r10, [r4, #92]
	.loc 1 1363 3 is_stmt 1 discriminator 2
	.loc 1 1363 21 is_stmt 0 discriminator 2
	strh	r5, [r4, #98]	@ movhi
	.loc 1 1364 3 is_stmt 1 discriminator 2
	.loc 1 1364 20 is_stmt 0 discriminator 2
	strh	r5, [r4, #96]	@ movhi
	.loc 1 1367 3 is_stmt 1 discriminator 2
	.loc 1 1367 15 is_stmt 0 discriminator 2
	str	r3, [r4, #112]
	.loc 1 1368 3 is_stmt 1 discriminator 2
	.loc 1 1368 15 is_stmt 0 discriminator 2
	str	r3, [r4, #116]
	.loc 1 1371 3 is_stmt 1 discriminator 2
	.loc 1 1371 45 is_stmt 0 discriminator 2
	ldr	r2, [r4]
	.loc 1 1371 55 discriminator 2
	ldr	r3, [r2, #12]
	.loc 1 1371 90 discriminator 2
	bic	r3, r3, #393216
	.loc 1 1371 31 discriminator 2
	str	r3, [r2, #12]
	.loc 1 1374 3 is_stmt 1 discriminator 2
	.loc 1 1374 14 is_stmt 0 discriminator 2
	ldr	r2, [r4]
	.loc 1 1374 6 discriminator 2
	ldr	r1, .L214
	ldr	r3, .L214+4
	cmp	r2, r3
	it	ne
	cmpne	r2, r1
	beq	.L207
	.loc 1 1374 164 discriminator 1
	add	r3, r3, #1024
	cmp	r2, r3
	beq	.L212
	.loc 1 1380 17
	mov	r9, #8
.LVL114:
	b	.L174
.LVL115:
.L212:
	.loc 1 1376 17
	mov	r9, #16
.LVL116:
	b	.L174
.LVL117:
.L207:
	mov	r9, #16
.LVL118:
.L174:
	.loc 1 1384 3 is_stmt 1
	.loc 1 1384 50 is_stmt 0
	ldr	r1, [r2, #4]
	.loc 1 1384 59
	ldr	r3, .L214+8
	ands	r3, r3, r1
	.loc 1 1384 86
	orrs	r3, r3, r5
	.loc 1 1384 28
	str	r3, [r2, #4]
	.loc 1 1386 3 is_stmt 1
	.loc 1 1386 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1386 21
	ldr	r3, [r2]
	.loc 1 1386 28
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 1388 3 is_stmt 1
	.loc 1 1388 17 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 1388 6
	cmp	r3, #4194304
	beq	.L213
.L175:
	.loc 1 1395 3 is_stmt 1
	.loc 1 1395 17 is_stmt 0
	ldr	r3, [r4, #12]
	.loc 1 1395 6
	cmp	r3, #15
	bls	.L176
	.loc 1 1398 5 is_stmt 1
	.loc 1 1398 17 is_stmt 0
	lsr	fp, r9, #2
.LVL119:
	.loc 1 1400 5 is_stmt 1
	.loc 1 1341 23 is_stmt 0
	mov	r9, r5
	.loc 1 1400 11
	b	.L177
.LVL120:
.L213:
	.loc 1 1391 5 is_stmt 1
	.loc 1 1391 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1391 21
	ldr	r3, [r2]
	.loc 1 1391 28
	orr	r3, r3, #512
	str	r3, [r2]
	b	.L175
.LVL121:
.L178:
	.loc 1 1413 7 is_stmt 1
	.loc 1 1413 25 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1413 19
	ldr	r2, [r3, #20]
.LVL122:
	.loc 1 1415 7 is_stmt 1
	.loc 1 1415 10 is_stmt 0
	cmp	r9, #0
	beq	.L177
	.loc 1 1418 9 is_stmt 1
	.loc 1 1418 32 is_stmt 0
	ldr	r1, [r3, #20]
	.loc 1 1418 12
	tst	r1, #1
	beq	.L180
	.loc 1 1420 11 is_stmt 1
	.loc 1 1420 29 is_stmt 0
	ldr	r2, [r4, #100]
.LVL123:
	.loc 1 1420 45
	ldr	r3, [r3, #48]
	.loc 1 1420 43
	str	r3, [r2]
	.loc 1 1421 11 is_stmt 1
	.loc 1 1421 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1421 28
	adds	r3, r3, #4
	str	r3, [r4, #100]
	.loc 1 1422 11 is_stmt 1
	.loc 1 1422 15 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1422 28
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	.loc 1 1423 11 is_stmt 1
	.loc 1 1423 31 is_stmt 0
	ldrh	r9, [r4, #106]
.LVL124:
	uxth	r9, r9
.LVL125:
.L177:
	.loc 1 1400 40 is_stmt 1
	orr	r3, r5, r9
	uxth	r3, r3
	cmp	r3, #0
	beq	.L185
	.loc 1 1403 7
	.loc 1 1403 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1403 31
	ldr	r2, [r3, #20]
	.loc 1 1403 10
	tst	r2, #2
	beq	.L178
	.loc 1 1403 81 discriminator 1
	cmp	r5, #0
	beq	.L178
	.loc 1 1404 55 discriminator 2
	add	r2, r5, fp
	.loc 1 1403 112 discriminator 2
	cmp	r9, r2
	bcs	.L178
	.loc 1 1406 9 is_stmt 1
	.loc 1 1406 81 is_stmt 0
	ldr	r2, [r4, #92]
	.loc 1 1406 57
	ldr	r2, [r2]
	.loc 1 1406 55
	str	r2, [r3, #32]
	.loc 1 1407 9 is_stmt 1
	.loc 1 1407 13 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1407 26
	adds	r3, r3, #4
	str	r3, [r4, #92]
	.loc 1 1408 9 is_stmt 1
	.loc 1 1408 13 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 1408 27
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #98]	@ movhi
	.loc 1 1409 9 is_stmt 1
	.loc 1 1409 29 is_stmt 0
	ldrh	r5, [r4, #98]
.LVL126:
	uxth	r5, r5
.LVL127:
	b	.L178
.LVL128:
.L180:
	.loc 1 1426 14 is_stmt 1
	.loc 1 1426 17 is_stmt 0
	cmp	r9, r6
	bcs	.L181
	.loc 1 1426 64 discriminator 1
	tst	r2, #32768
	beq	.L181
	.loc 1 1428 11 is_stmt 1
	.loc 1 1428 29 is_stmt 0
	ldr	r2, [r4, #100]
.LVL129:
	.loc 1 1428 45
	ldr	r3, [r3, #48]
	.loc 1 1428 43
	str	r3, [r2]
	.loc 1 1429 11 is_stmt 1
	.loc 1 1429 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1429 28
	adds	r3, r3, #4
	str	r3, [r4, #100]
	.loc 1 1430 11 is_stmt 1
	.loc 1 1430 15 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1430 28
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	.loc 1 1431 11 is_stmt 1
	.loc 1 1431 31 is_stmt 0
	ldrh	r9, [r4, #106]
.LVL130:
	uxth	r9, r9
.LVL131:
	b	.L177
.LVL132:
.L181:
	.loc 1 1436 11 is_stmt 1
	.loc 1 1436 18 is_stmt 0
	bl	HAL_GetTick
.LVL133:
	.loc 1 1436 32
	sub	r0, r0, r8
	.loc 1 1436 14
	ldr	r3, [sp, #48]
	cmp	r0, r3
	bcc	.L182
	.loc 1 1436 57 discriminator 1
	cmp	r3, #-1
	bne	.L183
.L182:
	.loc 1 1436 86 discriminator 3
	ldr	r3, [sp, #48]
	cmp	r3, #0
	bne	.L177
.L183:
	.loc 1 1439 13 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL134:
	.loc 1 1441 13
	.loc 1 1441 19 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1441 32
	orr	r3, r3, #256
	str	r3, [r4, #132]
	.loc 1 1442 13 is_stmt 1
	.loc 1 1442 25 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 1445 13 is_stmt 1
	.loc 1 1445 17
	.loc 1 1445 30 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 1445 15 is_stmt 1
	.loc 1 1447 13
	.loc 1 1447 20 is_stmt 0
	movs	r7, #3
	b	.L173
.LVL135:
.L176:
	.loc 1 1454 8 is_stmt 1
	.loc 1 1454 11 is_stmt 0
	cmp	r3, #7
	bls	.L209
	.loc 1 1457 5 is_stmt 1
	.loc 1 1457 17 is_stmt 0
	lsr	r3, r9, #1
	mov	r10, r3
.LVL136:
	.loc 1 1459 5 is_stmt 1
	.loc 1 1341 23 is_stmt 0
	mov	r9, r5
	.loc 1 1459 11
	b	.L187
.LVL137:
.L188:
	.loc 1 1476 7 is_stmt 1
	.loc 1 1476 25 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1476 19
	ldr	r2, [r3, #20]
.LVL138:
	.loc 1 1478 7 is_stmt 1
	.loc 1 1478 10 is_stmt 0
	cmp	r9, #0
	beq	.L187
	.loc 1 1481 9 is_stmt 1
	.loc 1 1481 32 is_stmt 0
	ldr	r3, [r3, #20]
	.loc 1 1481 12
	tst	r3, #1
	beq	.L190
	.loc 1 1484 11 is_stmt 1
	.loc 1 1484 29 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1484 45
	ldrh	r2, [fp, #48]
.LVL139:
	.loc 1 1484 43
	strh	r2, [r3]	@ movhi
	.loc 1 1488 11 is_stmt 1
	.loc 1 1488 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1488 28
	adds	r3, r3, #2
	str	r3, [r4, #100]
	.loc 1 1489 11 is_stmt 1
	.loc 1 1489 15 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1489 28
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	.loc 1 1490 11 is_stmt 1
	.loc 1 1490 31 is_stmt 0
	ldrh	r9, [r4, #106]
.LVL140:
	uxth	r9, r9
.LVL141:
.L187:
	.loc 1 1459 40 is_stmt 1
	orr	r3, r5, r9
	uxth	r3, r3
	cmp	r3, #0
	beq	.L185
	.loc 1 1462 7
	.loc 1 1462 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1462 31
	ldr	r3, [r3, #20]
	.loc 1 1462 10
	tst	r3, #2
	beq	.L188
	.loc 1 1462 81 discriminator 1
	cmp	r5, #0
	beq	.L188
	.loc 1 1463 55 discriminator 2
	mov	r3, r10
	adds	r3, r5, r3
	.loc 1 1462 112 discriminator 2
	cmp	r9, r3
	bcs	.L188
	.loc 1 1466 9 is_stmt 1
	.loc 1 1466 49 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1466 25
	ldrh	r3, [r3]
	.loc 1 1466 23
	strh	r3, [fp, #32]	@ movhi
	.loc 1 1470 9 is_stmt 1
	.loc 1 1470 13 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1470 26
	adds	r3, r3, #2
	str	r3, [r4, #92]
	.loc 1 1471 9 is_stmt 1
	.loc 1 1471 13 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 1471 26
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #98]	@ movhi
	.loc 1 1472 9 is_stmt 1
	.loc 1 1472 29 is_stmt 0
	ldrh	r5, [r4, #98]
.LVL142:
	uxth	r5, r5
.LVL143:
	b	.L188
.LVL144:
.L190:
	.loc 1 1493 14 is_stmt 1
	.loc 1 1493 17 is_stmt 0
	cmp	r9, r6
	bcs	.L191
	.loc 1 1493 64 discriminator 1
	tst	r2, #32768
	beq	.L191
	.loc 1 1496 11 is_stmt 1
	.loc 1 1496 29 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1496 45
	ldrh	r2, [fp, #48]
.LVL145:
	.loc 1 1496 43
	strh	r2, [r3]	@ movhi
	.loc 1 1500 11 is_stmt 1
	.loc 1 1500 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1500 28
	adds	r2, r3, #2
	str	r2, [r4, #100]
	.loc 1 1502 11 is_stmt 1
	.loc 1 1502 45 is_stmt 0
	ldrh	r2, [fp, #48]
	.loc 1 1502 43
	strh	r2, [r3, #2]	@ movhi
	.loc 1 1506 11 is_stmt 1
	.loc 1 1506 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1506 28
	adds	r3, r3, #2
	str	r3, [r4, #100]
	.loc 1 1507 11 is_stmt 1
	.loc 1 1507 15 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1507 29
	subs	r3, r3, #2
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	.loc 1 1508 11 is_stmt 1
	.loc 1 1508 31 is_stmt 0
	ldrh	r9, [r4, #106]
.LVL146:
	uxth	r9, r9
.LVL147:
	b	.L187
.LVL148:
.L191:
	.loc 1 1511 14 is_stmt 1
	.loc 1 1511 17 is_stmt 0
	cmp	r9, #1
	bne	.L192
	.loc 1 1511 47 discriminator 1
	tst	r2, #8192
	beq	.L192
	.loc 1 1514 11 is_stmt 1
	.loc 1 1514 29 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1514 45
	ldrh	r2, [fp, #48]
.LVL149:
	.loc 1 1514 43
	strh	r2, [r3]	@ movhi
	.loc 1 1518 11 is_stmt 1
	.loc 1 1518 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1518 28
	adds	r3, r3, #2
	str	r3, [r4, #100]
	.loc 1 1519 11 is_stmt 1
	.loc 1 1519 15 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1519 28
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	.loc 1 1520 11 is_stmt 1
	.loc 1 1520 31 is_stmt 0
	ldrh	r9, [r4, #106]
.LVL150:
	uxth	r9, r9
.LVL151:
	b	.L187
.LVL152:
.L192:
	.loc 1 1525 11 is_stmt 1
	.loc 1 1525 18 is_stmt 0
	bl	HAL_GetTick
.LVL153:
	.loc 1 1525 32
	sub	r0, r0, r8
	.loc 1 1525 14
	ldr	r3, [sp, #48]
	cmp	r0, r3
	bcc	.L193
	.loc 1 1525 57 discriminator 1
	cmp	r3, #-1
	bne	.L194
.L193:
	.loc 1 1525 86 discriminator 3
	ldr	r3, [sp, #48]
	cmp	r3, #0
	bne	.L187
.L194:
	.loc 1 1528 13 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL154:
	.loc 1 1530 13
	.loc 1 1530 19 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1530 32
	orr	r3, r3, #256
	str	r3, [r4, #132]
	.loc 1 1531 13 is_stmt 1
	.loc 1 1531 25 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 1534 13 is_stmt 1
	.loc 1 1534 17
	.loc 1 1534 30 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 1534 15 is_stmt 1
	.loc 1 1536 13
	.loc 1 1536 20 is_stmt 0
	movs	r7, #3
	b	.L173
.L215:
	.align	2
.L214:
	.word	1073819648
	.word	1073756160
	.word	-65536
.LVL155:
.L196:
	.loc 1 1558 7 is_stmt 1
	.loc 1 1558 25 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1558 19
	ldr	r2, [r3, #20]
.LVL156:
	.loc 1 1560 7 is_stmt 1
	.loc 1 1560 10 is_stmt 0
	cmp	fp, #0
	beq	.L186
	.loc 1 1563 9 is_stmt 1
	.loc 1 1563 32 is_stmt 0
	ldr	r1, [r3, #20]
	.loc 1 1563 12
	tst	r1, #1
	beq	.L198
	.loc 1 1565 11 is_stmt 1
	.loc 1 1565 28 is_stmt 0
	ldr	r2, [r4, #100]
.LVL157:
	.loc 1 1565 44
	ldrb	r3, [r3, #48]	@ zero_extendqisi2
	.loc 1 1565 42
	strb	r3, [r2]
	.loc 1 1566 11 is_stmt 1
	.loc 1 1566 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1566 28
	adds	r3, r3, #1
	str	r3, [r4, #100]
	.loc 1 1567 11 is_stmt 1
	.loc 1 1567 15 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1567 28
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	.loc 1 1568 11 is_stmt 1
	.loc 1 1568 31 is_stmt 0
	ldrh	fp, [r4, #106]
.LVL158:
	uxth	fp, fp
.LVL159:
.L186:
	.loc 1 1545 40 is_stmt 1
	orr	r3, r5, fp
	uxth	r3, r3
	cmp	r3, #0
	beq	.L185
	.loc 1 1548 7
	.loc 1 1548 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1548 31
	ldr	r2, [r3, #20]
	.loc 1 1548 10
	tst	r2, #2
	beq	.L196
	.loc 1 1548 81 discriminator 1
	cmp	r5, #0
	beq	.L196
	.loc 1 1549 55 discriminator 2
	add	r2, r5, r9
	.loc 1 1548 112 discriminator 2
	cmp	fp, r2
	bcs	.L196
	.loc 1 1551 9 is_stmt 1
	.loc 1 1551 79 is_stmt 0
	ldr	r2, [r4, #92]
	.loc 1 1551 56
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 1551 54
	strb	r2, [r3, #32]
	.loc 1 1552 9 is_stmt 1
	.loc 1 1552 13 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1552 26
	adds	r3, r3, #1
	str	r3, [r4, #92]
	.loc 1 1553 9 is_stmt 1
	.loc 1 1553 13 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 1553 26
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #98]	@ movhi
	.loc 1 1554 9 is_stmt 1
	.loc 1 1554 29 is_stmt 0
	ldrh	r5, [r4, #98]
.LVL160:
	uxth	r5, r5
.LVL161:
	b	.L196
.LVL162:
.L198:
	.loc 1 1571 14 is_stmt 1
	.loc 1 1571 17 is_stmt 0
	cmp	fp, r6
	bcs	.L199
	.loc 1 1571 64 discriminator 1
	tst	r2, #32768
	beq	.L199
	.loc 1 1573 11 is_stmt 1
	.loc 1 1573 28 is_stmt 0
	ldr	r2, [r4, #100]
.LVL163:
	.loc 1 1573 44
	ldrb	r3, [r3, #48]	@ zero_extendqisi2
	.loc 1 1573 42
	strb	r3, [r2]
	.loc 1 1574 11 is_stmt 1
	.loc 1 1574 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1574 28
	adds	r2, r3, #1
	str	r2, [r4, #100]
	.loc 1 1575 11 is_stmt 1
	.loc 1 1575 71 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1575 44
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	.loc 1 1575 42
	strb	r2, [r3, #1]
	.loc 1 1576 11 is_stmt 1
	.loc 1 1576 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1576 28
	adds	r2, r3, #1
	str	r2, [r4, #100]
	.loc 1 1577 11 is_stmt 1
	.loc 1 1577 71 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1577 44
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	.loc 1 1577 42
	strb	r2, [r3, #1]
	.loc 1 1578 11 is_stmt 1
	.loc 1 1578 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1578 28
	adds	r2, r3, #1
	str	r2, [r4, #100]
	.loc 1 1579 11 is_stmt 1
	.loc 1 1579 71 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1579 44
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	.loc 1 1579 42
	strb	r2, [r3, #1]
	.loc 1 1580 11 is_stmt 1
	.loc 1 1580 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1580 28
	adds	r3, r3, #1
	str	r3, [r4, #100]
	.loc 1 1581 11 is_stmt 1
	.loc 1 1581 15 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1581 29
	subs	r3, r3, #4
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	.loc 1 1582 11 is_stmt 1
	.loc 1 1582 31 is_stmt 0
	ldrh	fp, [r4, #106]
.LVL164:
	uxth	fp, fp
.LVL165:
	b	.L186
.LVL166:
.L199:
	.loc 1 1585 14 is_stmt 1
	.loc 1 1585 17 is_stmt 0
	cmp	fp, #3
	bhi	.L200
	.loc 1 1585 46 discriminator 1
	tst	r2, #24576
	beq	.L200
	.loc 1 1587 11 is_stmt 1
	.loc 1 1587 28 is_stmt 0
	ldr	r2, [r4, #100]
.LVL167:
	.loc 1 1587 44
	ldrb	r3, [r3, #48]	@ zero_extendqisi2
	.loc 1 1587 42
	strb	r3, [r2]
	.loc 1 1588 11 is_stmt 1
	.loc 1 1588 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1588 28
	adds	r3, r3, #1
	str	r3, [r4, #100]
	.loc 1 1589 11 is_stmt 1
	.loc 1 1589 15 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 1589 28
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
	.loc 1 1590 11 is_stmt 1
	.loc 1 1590 31 is_stmt 0
	ldrh	fp, [r4, #106]
.LVL168:
	uxth	fp, fp
.LVL169:
	b	.L186
.LVL170:
.L200:
	.loc 1 1595 11 is_stmt 1
	.loc 1 1595 18 is_stmt 0
	bl	HAL_GetTick
.LVL171:
	.loc 1 1595 32
	sub	r0, r0, r8
	.loc 1 1595 14
	ldr	r3, [sp, #48]
	cmp	r0, r3
	bcc	.L201
	.loc 1 1595 57 discriminator 1
	cmp	r3, #-1
	bne	.L202
.L201:
	.loc 1 1595 86 discriminator 3
	ldr	r3, [sp, #48]
	cmp	r3, #0
	bne	.L186
.L202:
	.loc 1 1598 13 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL172:
	.loc 1 1600 13
	.loc 1 1600 19 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1600 32
	orr	r3, r3, #256
	str	r3, [r4, #132]
	.loc 1 1601 13 is_stmt 1
	.loc 1 1601 25 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 1604 13 is_stmt 1
	.loc 1 1604 17
	.loc 1 1604 30 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 1604 15 is_stmt 1
	.loc 1 1606 13
	.loc 1 1606 20 is_stmt 0
	movs	r7, #3
	b	.L173
.LVL173:
.L209:
	.loc 1 1341 23
	mov	fp, r5
.LVL174:
	b	.L186
.LVL175:
.L185:
	.loc 1 1614 3 is_stmt 1
	.loc 1 1614 7 is_stmt 0
	str	r8, [sp]
	ldr	r3, [sp, #48]
	movs	r2, #0
	movs	r1, #8
	mov	r0, r4
	bl	SPI_WaitOnFlagUntilTimeout
.LVL176:
	.loc 1 1614 6
	cbz	r0, .L204
	.loc 1 1616 5 is_stmt 1
	.loc 1 1616 11 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1616 24
	orr	r3, r3, #32
	str	r3, [r4, #132]
.L204:
	.loc 1 1620 3 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL177:
	.loc 1 1622 3
	.loc 1 1622 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 1625 3 is_stmt 1
	.loc 1 1625 7
	.loc 1 1625 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 1625 5 is_stmt 1
	.loc 1 1627 3
	.loc 1 1627 11 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 1627 6
	cbnz	r3, .L173
	.loc 1 1633 12
	movs	r7, #0
	b	.L173
.LVL178:
.L205:
	.loc 1 1345 12
	movs	r7, #2
.LVL179:
.L173:
	.loc 1 1635 1
	mov	r0, r7
	add	sp, sp, #12
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.LVL180:
.L206:
	.cfi_restore_state
	.loc 1 1354 47
	movs	r7, #2
	b	.L173
	.cfi_endproc
.LFE341:
	.size	HAL_SPI_TransmitReceive, .-HAL_SPI_TransmitReceive
	.section	.text.HAL_SPI_Transmit_IT,"ax",%progbits
	.align	1
	.global	HAL_SPI_Transmit_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_Transmit_IT, %function
HAL_SPI_Transmit_IT:
.LFB342:
	.loc 1 1646 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL181:
	.loc 1 1648 3
	.loc 1 1650 3
	.loc 1 1650 6 is_stmt 0
	cmp	r2, #0
	it	ne
	cmpne	r1, #0
	beq	.L223
	.loc 1 1646 1
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	mov	r3, r2
	.loc 1 1655 3 is_stmt 1
	.loc 1 1655 11 is_stmt 0
	ldrb	r2, [r0, #129]	@ zero_extendqisi2
.LVL182:
	uxtb	r2, r2
	.loc 1 1655 6
	cmp	r2, #1
	bne	.L224
	.loc 1 1661 3 is_stmt 1
	.loc 1 1661 7
	.loc 1 1661 16 is_stmt 0
	ldrb	r2, [r0, #128]	@ zero_extendqisi2
	.loc 1 1661 9
	cmp	r2, #1
	beq	.L225
	.loc 1 1661 66 is_stmt 1 discriminator 2
	.loc 1 1661 79 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #128]
	.loc 1 1661 5 is_stmt 1 discriminator 2
	.loc 1 1664 3 discriminator 2
	.loc 1 1664 15 is_stmt 0 discriminator 2
	movs	r2, #3
	strb	r2, [r0, #129]
	.loc 1 1665 3 is_stmt 1 discriminator 2
	.loc 1 1665 19 is_stmt 0 discriminator 2
	movs	r2, #0
	str	r2, [r0, #132]
	.loc 1 1666 3 is_stmt 1 discriminator 2
	.loc 1 1666 20 is_stmt 0 discriminator 2
	str	r1, [r0, #92]
	.loc 1 1667 3 is_stmt 1 discriminator 2
	.loc 1 1667 20 is_stmt 0 discriminator 2
	strh	r3, [r0, #96]	@ movhi
	.loc 1 1668 3 is_stmt 1 discriminator 2
	.loc 1 1668 21 is_stmt 0 discriminator 2
	strh	r3, [r0, #98]	@ movhi
	.loc 1 1671 3 is_stmt 1 discriminator 2
	.loc 1 1671 20 is_stmt 0 discriminator 2
	str	r2, [r0, #100]
	.loc 1 1672 3 is_stmt 1 discriminator 2
	.loc 1 1672 20 is_stmt 0 discriminator 2
	strh	r2, [r0, #104]	@ movhi
	.loc 1 1673 3 is_stmt 1 discriminator 2
	.loc 1 1673 21 is_stmt 0 discriminator 2
	strh	r2, [r0, #106]	@ movhi
	.loc 1 1674 3 is_stmt 1 discriminator 2
	.loc 1 1674 15 is_stmt 0 discriminator 2
	str	r2, [r0, #112]
	.loc 1 1683 3 is_stmt 1 discriminator 2
	.loc 1 1683 17 is_stmt 0 discriminator 2
	ldr	r2, [r0, #12]
	.loc 1 1683 6 discriminator 2
	cmp	r2, #15
	bls	.L218
	.loc 1 1685 5 is_stmt 1
	.loc 1 1685 17 is_stmt 0
	ldr	r2, .L233
	str	r2, [r0, #116]
.L219:
	.loc 1 1697 3 is_stmt 1
	.loc 1 1697 17 is_stmt 0
	ldr	r2, [r0, #8]
	.loc 1 1697 6
	cmp	r2, #393216
	beq	.L231
	.loc 1 1703 5 is_stmt 1
	.loc 1 1703 47 is_stmt 0
	ldr	r1, [r0]
.LVL183:
	.loc 1 1703 57
	ldr	r2, [r1, #12]
	.loc 1 1703 67
	bic	r2, r2, #393216
	.loc 1 1703 92
	orr	r2, r2, #131072
	.loc 1 1703 33
	str	r2, [r1, #12]
.LVL184:
.L222:
	.loc 1 1707 3 is_stmt 1
	.loc 1 1707 40 is_stmt 0
	ldr	r1, [r0]
	.loc 1 1707 50
	ldr	r4, [r1, #4]
	.loc 1 1707 59
	ldr	r2, .L233+4
	ands	r2, r2, r4
	.loc 1 1707 86
	orrs	r3, r3, r2
	.loc 1 1707 28
	str	r3, [r1, #4]
	.loc 1 1710 3 is_stmt 1
	.loc 1 1710 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1710 21
	ldr	r3, [r2]
	.loc 1 1710 28
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 1713 3 is_stmt 1
	.loc 1 1713 7
	.loc 1 1713 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r0, #128]
	.loc 1 1713 5 is_stmt 1
	.loc 1 1716 3
	.loc 1 1716 10 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1716 20
	ldr	r1, [r2, #16]
	.loc 1 1716 26
	movw	r3, #1834
	orrs	r3, r3, r1
	str	r3, [r2, #16]
	.loc 1 1718 3 is_stmt 1
	.loc 1 1718 17 is_stmt 0
	ldr	r3, [r0, #4]
	.loc 1 1718 6
	cmp	r3, #4194304
	beq	.L232
	.loc 1 1724 10
	movs	r0, #0
.LVL185:
.L217:
	.loc 1 1725 1
	ldr	r4, [sp], #4
	.cfi_remember_state
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL186:
.L218:
	.cfi_restore_state
	.loc 1 1687 8 is_stmt 1
	.loc 1 1687 11 is_stmt 0
	cmp	r2, #7
	bls	.L220
	.loc 1 1689 5 is_stmt 1
	.loc 1 1689 17 is_stmt 0
	ldr	r2, .L233+8
	str	r2, [r0, #116]
	b	.L219
.L220:
	.loc 1 1693 5 is_stmt 1
	.loc 1 1693 17 is_stmt 0
	ldr	r2, .L233+12
	str	r2, [r0, #116]
	b	.L219
.L231:
	.loc 1 1699 5 is_stmt 1
	.loc 1 1699 13 is_stmt 0
	ldr	r1, [r0]
.LVL187:
	.loc 1 1699 23
	ldr	r2, [r1]
	.loc 1 1699 30
	orr	r2, r2, #2048
	str	r2, [r1]
.LVL188:
	b	.L222
.L232:
	.loc 1 1721 5 is_stmt 1
	.loc 1 1721 11 is_stmt 0
	ldr	r2, [r0]
	.loc 1 1721 21
	ldr	r3, [r2]
	.loc 1 1721 28
	orr	r3, r3, #512
	str	r3, [r2]
	.loc 1 1724 10
	movs	r0, #0
.LVL189:
	b	.L217
.LVL190:
.L223:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.loc 1 1652 12
	movs	r0, #1
.LVL191:
	.loc 1 1725 1
	bx	lr
.LVL192:
.L224:
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 1657 12
	movs	r0, #2
.LVL193:
	b	.L217
.LVL194:
.L225:
	.loc 1 1661 47
	movs	r0, #2
.LVL195:
	b	.L217
.L234:
	.align	2
.L233:
	.word	SPI_TxISR_32BIT
	.word	-65536
	.word	SPI_TxISR_16BIT
	.word	SPI_TxISR_8BIT
	.cfi_endproc
.LFE342:
	.size	HAL_SPI_Transmit_IT, .-HAL_SPI_Transmit_IT
	.section	.text.HAL_SPI_Receive_IT,"ax",%progbits
	.align	1
	.global	HAL_SPI_Receive_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_Receive_IT, %function
HAL_SPI_Receive_IT:
.LFB343:
	.loc 1 1736 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL196:
	mov	r3, r0
	.loc 1 1738 3
	.loc 1 1740 3
	.loc 1 1740 11 is_stmt 0
	ldrb	r0, [r0, #129]	@ zero_extendqisi2
.LVL197:
	uxtb	r0, r0
	.loc 1 1740 6
	cmp	r0, #1
	bne	.L242
	.loc 1 1745 3 is_stmt 1
	.loc 1 1745 6 is_stmt 0
	cmp	r2, #0
	it	ne
	cmpne	r1, #0
	beq	.L246
	.loc 1 1751 3 is_stmt 1
	.loc 1 1751 7
	.loc 1 1751 16 is_stmt 0
	ldrb	r0, [r3, #128]	@ zero_extendqisi2
	.loc 1 1751 9
	cmp	r0, #1
	beq	.L243
	.loc 1 1736 1 discriminator 2
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 1751 66 is_stmt 1 discriminator 2
	.loc 1 1751 79 is_stmt 0 discriminator 2
	movs	r0, #1
	strb	r0, [r3, #128]
	.loc 1 1751 5 is_stmt 1 discriminator 2
	.loc 1 1754 3 discriminator 2
	.loc 1 1754 15 is_stmt 0 discriminator 2
	movs	r0, #4
	strb	r0, [r3, #129]
	.loc 1 1755 3 is_stmt 1 discriminator 2
	.loc 1 1755 19 is_stmt 0 discriminator 2
	movs	r0, #0
	str	r0, [r3, #132]
	.loc 1 1756 3 is_stmt 1 discriminator 2
	.loc 1 1756 20 is_stmt 0 discriminator 2
	str	r1, [r3, #100]
	.loc 1 1757 3 is_stmt 1 discriminator 2
	.loc 1 1757 20 is_stmt 0 discriminator 2
	strh	r2, [r3, #104]	@ movhi
	.loc 1 1758 3 is_stmt 1 discriminator 2
	.loc 1 1758 21 is_stmt 0 discriminator 2
	strh	r2, [r3, #106]	@ movhi
	.loc 1 1761 3 is_stmt 1 discriminator 2
	.loc 1 1761 20 is_stmt 0 discriminator 2
	str	r0, [r3, #92]
	.loc 1 1762 3 is_stmt 1 discriminator 2
	.loc 1 1762 20 is_stmt 0 discriminator 2
	strh	r0, [r3, #96]	@ movhi
	.loc 1 1763 3 is_stmt 1 discriminator 2
	.loc 1 1763 21 is_stmt 0 discriminator 2
	strh	r0, [r3, #98]	@ movhi
	.loc 1 1764 3 is_stmt 1 discriminator 2
	.loc 1 1764 15 is_stmt 0 discriminator 2
	str	r0, [r3, #116]
	.loc 1 1773 3 is_stmt 1 discriminator 2
	.loc 1 1773 17 is_stmt 0 discriminator 2
	ldr	r1, [r3, #12]
.LVL198:
	.loc 1 1773 6 discriminator 2
	cmp	r1, #15
	bls	.L237
	.loc 1 1775 5 is_stmt 1
	.loc 1 1775 17 is_stmt 0
	ldr	r1, .L251
	str	r1, [r3, #112]
.L238:
	.loc 1 1787 3 is_stmt 1
	.loc 1 1787 17 is_stmt 0
	ldr	r1, [r3, #8]
	.loc 1 1787 6
	cmp	r1, #393216
	beq	.L249
	.loc 1 1793 5 is_stmt 1
	.loc 1 1793 47 is_stmt 0
	ldr	r0, [r3]
	.loc 1 1793 57
	ldr	r1, [r0, #12]
	.loc 1 1793 67
	bic	r1, r1, #393216
	.loc 1 1793 92
	orr	r1, r1, #262144
	.loc 1 1793 33
	str	r1, [r0, #12]
.LVL199:
.L241:
	.loc 1 1801 3 is_stmt 1
	.loc 1 1801 40 is_stmt 0
	ldr	r0, [r3]
	.loc 1 1801 50
	ldr	r4, [r0, #4]
	.loc 1 1801 59
	ldr	r1, .L251+4
	ands	r1, r1, r4
	.loc 1 1801 86
	orrs	r2, r2, r1
.LVL200:
	.loc 1 1801 28
	str	r2, [r0, #4]
	.loc 1 1804 3 is_stmt 1
	.loc 1 1804 11 is_stmt 0
	ldr	r1, [r3]
	.loc 1 1804 21
	ldr	r2, [r1]
	.loc 1 1804 28
	orr	r2, r2, #1
	str	r2, [r1]
	.loc 1 1807 3 is_stmt 1
	.loc 1 1807 7
	.loc 1 1807 20 is_stmt 0
	movs	r2, #0
	strb	r2, [r3, #128]
	.loc 1 1807 5 is_stmt 1
	.loc 1 1810 3
	.loc 1 1810 10 is_stmt 0
	ldr	r1, [r3]
	.loc 1 1810 20
	ldr	r0, [r1, #16]
	.loc 1 1810 26
	movw	r2, #1865
	orrs	r2, r2, r0
	str	r2, [r1, #16]
	.loc 1 1812 3 is_stmt 1
	.loc 1 1812 17 is_stmt 0
	ldr	r2, [r3, #4]
	.loc 1 1812 6
	cmp	r2, #4194304
	beq	.L250
	.loc 1 1818 10
	movs	r0, #0
.LVL201:
.L236:
	.loc 1 1819 1
	ldr	r4, [sp], #4
	.cfi_remember_state
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL202:
.L237:
	.cfi_restore_state
	.loc 1 1777 8 is_stmt 1
	.loc 1 1777 11 is_stmt 0
	cmp	r1, #7
	bls	.L239
	.loc 1 1779 5 is_stmt 1
	.loc 1 1779 17 is_stmt 0
	ldr	r1, .L251+8
	str	r1, [r3, #112]
	b	.L238
.L239:
	.loc 1 1783 5 is_stmt 1
	.loc 1 1783 17 is_stmt 0
	ldr	r1, .L251+12
	str	r1, [r3, #112]
	b	.L238
.L249:
	.loc 1 1789 5 is_stmt 1
	.loc 1 1789 13 is_stmt 0
	ldr	r0, [r3]
	.loc 1 1789 23
	ldr	r1, [r0]
	.loc 1 1789 30
	bic	r1, r1, #2048
	str	r1, [r0]
.LVL203:
	b	.L241
.LVL204:
.L250:
	.loc 1 1815 5 is_stmt 1
	.loc 1 1815 11 is_stmt 0
	ldr	r2, [r3]
	.loc 1 1815 21
	ldr	r3, [r2]
.LVL205:
	.loc 1 1815 28
	orr	r3, r3, #512
	str	r3, [r2]
	.loc 1 1818 10
	movs	r0, #0
	b	.L236
.LVL206:
.L242:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.loc 1 1742 12
	movs	r0, #2
	bx	lr
.L243:
	.loc 1 1751 47
	movs	r0, #2
	bx	lr
.L246:
	.loc 1 1819 1
	bx	lr
.L252:
	.align	2
.L251:
	.word	SPI_RxISR_32BIT
	.word	-65536
	.word	SPI_RxISR_16BIT
	.word	SPI_RxISR_8BIT
	.cfi_endproc
.LFE343:
	.size	HAL_SPI_Receive_IT, .-HAL_SPI_Receive_IT
	.section	.text.HAL_SPI_TransmitReceive_IT,"ax",%progbits
	.align	1
	.global	HAL_SPI_TransmitReceive_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_TransmitReceive_IT, %function
HAL_SPI_TransmitReceive_IT:
.LFB344:
	.loc 1 1832 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL207:
	push	{r4, r5}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
	mov	ip, r0
	.loc 1 1833 3
	.loc 1 1835 3
	.loc 1 1835 65 is_stmt 0
	ldr	r4, [r0]
.LVL208:
	.loc 1 1839 3 is_stmt 1
	.loc 1 1841 3
	.loc 1 1841 11 is_stmt 0
	ldrb	r0, [r0, #129]	@ zero_extendqisi2
.LVL209:
	uxtb	r0, r0
	.loc 1 1841 6
	cmp	r0, #1
	bne	.L264
	.loc 1 1846 3 is_stmt 1
	.loc 1 1846 6 is_stmt 0
	cmp	r2, #0
	it	ne
	cmpne	r1, #0
	beq	.L254
	.loc 1 1846 45 discriminator 1
	cmp	r3, #0
	beq	.L254
	.loc 1 1852 3 is_stmt 1
	.loc 1 1852 7
	.loc 1 1852 16 is_stmt 0
	ldrb	r0, [ip, #128]	@ zero_extendqisi2
	.loc 1 1852 9
	cmp	r0, #1
	beq	.L265
	.loc 1 1852 66 is_stmt 1 discriminator 2
	.loc 1 1852 79 is_stmt 0 discriminator 2
	movs	r0, #1
	strb	r0, [ip, #128]
	.loc 1 1852 5 is_stmt 1 discriminator 2
	.loc 1 1855 3 discriminator 2
	.loc 1 1855 15 is_stmt 0 discriminator 2
	movs	r0, #5
	strb	r0, [ip, #129]
	.loc 1 1856 3 is_stmt 1 discriminator 2
	.loc 1 1856 19 is_stmt 0 discriminator 2
	movs	r0, #0
	str	r0, [ip, #132]
	.loc 1 1857 3 is_stmt 1 discriminator 2
	.loc 1 1857 20 is_stmt 0 discriminator 2
	str	r1, [ip, #92]
	.loc 1 1858 3 is_stmt 1 discriminator 2
	.loc 1 1858 20 is_stmt 0 discriminator 2
	strh	r3, [ip, #96]	@ movhi
	.loc 1 1859 3 is_stmt 1 discriminator 2
	.loc 1 1859 21 is_stmt 0 discriminator 2
	strh	r3, [ip, #98]	@ movhi
	.loc 1 1860 3 is_stmt 1 discriminator 2
	.loc 1 1860 20 is_stmt 0 discriminator 2
	str	r2, [ip, #100]
	.loc 1 1861 3 is_stmt 1 discriminator 2
	.loc 1 1861 20 is_stmt 0 discriminator 2
	strh	r3, [ip, #104]	@ movhi
	.loc 1 1862 3 is_stmt 1 discriminator 2
	.loc 1 1862 21 is_stmt 0 discriminator 2
	strh	r3, [ip, #106]	@ movhi
	.loc 1 1863 3 is_stmt 1 discriminator 2
	.loc 1 1863 25 is_stmt 0 discriminator 2
	ldrh	r2, [ip, #98]
.LVL210:
	uxth	r2, r2
.LVL211:
	.loc 1 1874 3 is_stmt 1 discriminator 2
	.loc 1 1874 17 is_stmt 0 discriminator 2
	ldr	r1, [ip, #12]
.LVL212:
	.loc 1 1874 6 discriminator 2
	cmp	r1, #15
	bls	.L255
	.loc 1 1876 5 is_stmt 1
	.loc 1 1876 17 is_stmt 0
	ldr	r1, .L269
	str	r1, [ip, #116]
	.loc 1 1877 5 is_stmt 1
	.loc 1 1877 17 is_stmt 0
	ldr	r1, .L269+4
	str	r1, [ip, #112]
.L256:
	.loc 1 1891 3 is_stmt 1
	.loc 1 1891 55 is_stmt 0
	ldr	r1, [r4, #12]
	.loc 1 1891 90
	bic	r1, r1, #393216
	.loc 1 1891 31
	str	r1, [r4, #12]
.LVL213:
	.loc 1 1894 3 is_stmt 1
	.loc 1 1894 40 is_stmt 0
	ldr	r0, [ip]
	.loc 1 1894 50
	ldr	r5, [r0, #4]
	.loc 1 1894 59
	ldr	r1, .L269+8
	ands	r1, r1, r5
	.loc 1 1894 86
	orrs	r3, r3, r1
.LVL214:
	.loc 1 1894 28
	str	r3, [r0, #4]
	.loc 1 1897 3 is_stmt 1
	.loc 1 1897 11 is_stmt 0
	ldr	r1, [ip]
	.loc 1 1897 21
	ldr	r3, [r1]
	.loc 1 1897 28
	orr	r3, r3, #1
	str	r3, [r1]
	.loc 1 1900 3 is_stmt 1
	.loc 1 1900 9 is_stmt 0
	b	.L258
.LVL215:
.L255:
	.loc 1 1879 8 is_stmt 1
	.loc 1 1879 11 is_stmt 0
	cmp	r1, #7
	bls	.L257
	.loc 1 1881 5 is_stmt 1
	.loc 1 1881 17 is_stmt 0
	ldr	r1, .L269+12
	str	r1, [ip, #112]
	.loc 1 1882 5 is_stmt 1
	.loc 1 1882 17 is_stmt 0
	ldr	r1, .L269+16
	str	r1, [ip, #116]
	b	.L256
.L257:
	.loc 1 1886 5 is_stmt 1
	.loc 1 1886 17 is_stmt 0
	ldr	r1, .L269+20
	str	r1, [ip, #112]
	.loc 1 1887 5 is_stmt 1
	.loc 1 1887 17 is_stmt 0
	ldr	r1, .L269+24
	str	r1, [ip, #116]
	b	.L256
.LVL216:
.L259:
	.loc 1 1911 10 is_stmt 1
	.loc 1 1911 13 is_stmt 0
	cmp	r2, #7
	bls	.L261
	.loc 1 1914 7 is_stmt 1
	.loc 1 1914 47 is_stmt 0
	ldr	r3, [ip, #92]
	.loc 1 1914 23
	ldrh	r3, [r3]
	.loc 1 1914 21
	strh	r3, [r4, #32]	@ movhi
	.loc 1 1918 7 is_stmt 1
	.loc 1 1918 11 is_stmt 0
	ldr	r3, [ip, #92]
	.loc 1 1918 24
	adds	r3, r3, #2
	str	r3, [ip, #92]
	.loc 1 1919 7 is_stmt 1
	.loc 1 1919 11 is_stmt 0
	ldrh	r3, [ip, #98]
	uxth	r3, r3
	.loc 1 1919 24
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [ip, #98]	@ movhi
	.loc 1 1920 7 is_stmt 1
	.loc 1 1920 29 is_stmt 0
	ldrh	r2, [ip, #98]
	uxth	r2, r2
.LVL217:
.L258:
	.loc 1 1900 80 is_stmt 1
	.loc 1 1900 20 is_stmt 0
	ldr	r3, [ip]
	.loc 1 1900 30
	ldr	r1, [r3, #20]
	.loc 1 1900 80
	tst	r1, #2
	beq	.L262
	.loc 1 1900 80 discriminator 1
	cbz	r2, .L262
	.loc 1 1903 5 is_stmt 1
	.loc 1 1903 19 is_stmt 0
	ldr	r2, [ip, #12]
.LVL218:
	.loc 1 1903 8
	cmp	r2, #15
	bls	.L259
	.loc 1 1905 7 is_stmt 1
	.loc 1 1905 79 is_stmt 0
	ldr	r2, [ip, #92]
	.loc 1 1905 55
	ldr	r2, [r2]
	.loc 1 1905 53
	str	r2, [r3, #32]
	.loc 1 1906 7 is_stmt 1
	.loc 1 1906 11 is_stmt 0
	ldr	r3, [ip, #92]
	.loc 1 1906 24
	adds	r3, r3, #4
	str	r3, [ip, #92]
	.loc 1 1907 7 is_stmt 1
	.loc 1 1907 11 is_stmt 0
	ldrh	r3, [ip, #98]
	uxth	r3, r3
	.loc 1 1907 24
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [ip, #98]	@ movhi
	.loc 1 1908 7 is_stmt 1
	.loc 1 1908 29 is_stmt 0
	ldrh	r2, [ip, #98]
	uxth	r2, r2
.LVL219:
	b	.L258
.LVL220:
.L261:
	.loc 1 1925 7 is_stmt 1
	.loc 1 1925 77 is_stmt 0
	ldr	r2, [ip, #92]
	.loc 1 1925 54
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 1925 52
	strb	r2, [r3, #32]
	.loc 1 1926 7 is_stmt 1
	.loc 1 1926 11 is_stmt 0
	ldr	r3, [ip, #92]
	.loc 1 1926 24
	adds	r3, r3, #1
	str	r3, [ip, #92]
	.loc 1 1927 7 is_stmt 1
	.loc 1 1927 11 is_stmt 0
	ldrh	r3, [ip, #98]
	uxth	r3, r3
	.loc 1 1927 24
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [ip, #98]	@ movhi
	.loc 1 1928 7 is_stmt 1
	.loc 1 1928 29 is_stmt 0
	ldrh	r2, [ip, #98]
	uxth	r2, r2
.LVL221:
	b	.L258
.L262:
	.loc 1 1933 3 is_stmt 1
	.loc 1 1933 7
	.loc 1 1933 20 is_stmt 0
	movs	r2, #0
.LVL222:
	strb	r2, [ip, #128]
	.loc 1 1933 5 is_stmt 1
	.loc 1 1936 3
	.loc 1 1936 20 is_stmt 0
	ldr	r1, [r3, #16]
	.loc 1 1936 26
	movw	r2, #1900
	orrs	r2, r2, r1
	str	r2, [r3, #16]
	.loc 1 1939 3 is_stmt 1
	.loc 1 1939 17 is_stmt 0
	ldr	r3, [ip, #4]
	.loc 1 1939 6
	cmp	r3, #4194304
	beq	.L268
	.loc 1 1945 10
	movs	r0, #0
	b	.L254
.L268:
	.loc 1 1942 5 is_stmt 1
	.loc 1 1942 11 is_stmt 0
	ldr	r2, [ip]
	.loc 1 1942 21
	ldr	r3, [r2]
	.loc 1 1942 28
	orr	r3, r3, #512
	str	r3, [r2]
	.loc 1 1945 10
	movs	r0, #0
	b	.L254
.LVL223:
.L264:
	.loc 1 1843 12
	movs	r0, #2
.LVL224:
.L254:
	.loc 1 1946 1
	pop	{r4, r5}
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL225:
	bx	lr
.LVL226:
.L265:
	.cfi_restore_state
	.loc 1 1852 47
	movs	r0, #2
	b	.L254
.L270:
	.align	2
.L269:
	.word	SPI_TxISR_32BIT
	.word	SPI_RxISR_32BIT
	.word	-65536
	.word	SPI_RxISR_16BIT
	.word	SPI_TxISR_16BIT
	.word	SPI_RxISR_8BIT
	.word	SPI_TxISR_8BIT
	.cfi_endproc
.LFE344:
	.size	HAL_SPI_TransmitReceive_IT, .-HAL_SPI_TransmitReceive_IT
	.section	.text.HAL_SPI_Transmit_DMA,"ax",%progbits
	.align	1
	.global	HAL_SPI_Transmit_DMA
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_Transmit_DMA, %function
HAL_SPI_Transmit_DMA:
.LFB345:
	.loc 1 2087 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL227:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 2090 3
	.loc 1 2092 3
	.loc 1 2092 11 is_stmt 0
	ldrb	r5, [r0, #129]	@ zero_extendqisi2
	uxtb	r5, r5
	.loc 1 2092 6
	cmp	r5, #1
	bne	.L285
	mov	r4, r0
	mov	r6, r2
	.loc 1 2097 3 is_stmt 1
	.loc 1 2097 6 is_stmt 0
	cmp	r2, #0
	it	ne
	cmpne	r1, #0
	beq	.L272
	.loc 1 2103 3 is_stmt 1
	.loc 1 2103 7
	.loc 1 2103 16 is_stmt 0
	ldrb	r3, [r0, #128]	@ zero_extendqisi2
	.loc 1 2103 9
	cmp	r3, #1
	beq	.L286
	.loc 1 2103 66 is_stmt 1 discriminator 2
	.loc 1 2103 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #128]
	.loc 1 2103 5 is_stmt 1 discriminator 2
	.loc 1 2106 3 discriminator 2
	.loc 1 2106 15 is_stmt 0 discriminator 2
	movs	r3, #3
	strb	r3, [r0, #129]
	.loc 1 2107 3 is_stmt 1 discriminator 2
	.loc 1 2107 19 is_stmt 0 discriminator 2
	movs	r3, #0
	str	r3, [r0, #132]
	.loc 1 2108 3 is_stmt 1 discriminator 2
	.loc 1 2108 20 is_stmt 0 discriminator 2
	str	r1, [r0, #92]
	.loc 1 2109 3 is_stmt 1 discriminator 2
	.loc 1 2109 20 is_stmt 0 discriminator 2
	strh	r2, [r0, #96]	@ movhi
	.loc 1 2110 3 is_stmt 1 discriminator 2
	.loc 1 2110 21 is_stmt 0 discriminator 2
	strh	r2, [r0, #98]	@ movhi
	.loc 1 2113 3 is_stmt 1 discriminator 2
	.loc 1 2113 20 is_stmt 0 discriminator 2
	str	r3, [r0, #100]
	.loc 1 2114 3 is_stmt 1 discriminator 2
	.loc 1 2114 15 is_stmt 0 discriminator 2
	str	r3, [r0, #116]
	.loc 1 2115 3 is_stmt 1 discriminator 2
	.loc 1 2115 15 is_stmt 0 discriminator 2
	str	r3, [r0, #112]
	.loc 1 2116 3 is_stmt 1 discriminator 2
	.loc 1 2116 20 is_stmt 0 discriminator 2
	strh	r3, [r0, #104]	@ movhi
	.loc 1 2117 3 is_stmt 1 discriminator 2
	.loc 1 2117 21 is_stmt 0 discriminator 2
	strh	r3, [r0, #106]	@ movhi
	.loc 1 2120 3 is_stmt 1 discriminator 2
	.loc 1 2120 17 is_stmt 0 discriminator 2
	ldr	r3, [r0, #8]
	.loc 1 2120 6 discriminator 2
	cmp	r3, #393216
	beq	.L288
	.loc 1 2126 5 is_stmt 1
	.loc 1 2126 47 is_stmt 0
	ldr	r2, [r0]
.LVL228:
	.loc 1 2126 57
	ldr	r3, [r2, #12]
	.loc 1 2126 67
	bic	r3, r3, #393216
	.loc 1 2126 92
	orr	r3, r3, #131072
	.loc 1 2126 33
	str	r3, [r2, #12]
.LVL229:
.L274:
	.loc 1 2130 3 is_stmt 1
	.loc 1 2130 19 is_stmt 0
	ldr	r3, [r4, #12]
	.loc 1 2130 6
	cmp	r3, #15
	bls	.L275
	.loc 1 2130 55 discriminator 1
	ldr	r2, [r4, #120]
	.loc 1 2130 69 discriminator 1
	ldr	r2, [r2, #24]
	.loc 1 2130 47 discriminator 1
	cmp	r2, #16384
	bne	.L276
.L275:
	.loc 1 2130 121 discriminator 3
	cmp	r3, #7
	bls	.L277
	.loc 1 2131 56
	ldr	r2, [r4, #120]
	.loc 1 2131 70
	ldr	r2, [r2, #24]
	.loc 1 2131 47
	cmp	r2, #8192
	it	ne
	cmpne	r2, #16384
	bne	.L276
.L277:
	.loc 1 2140 3 is_stmt 1
	.loc 1 2140 6 is_stmt 0
	cmp	r3, #7
	bhi	.L278
	.loc 1 2142 5 is_stmt 1
	.loc 1 2142 13 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2142 27
	ldr	r2, [r3, #24]
	.loc 1 2142 8
	cmp	r2, #8192
	beq	.L289
.L279:
	.loc 1 2146 5 is_stmt 1
	.loc 1 2146 27 is_stmt 0
	ldr	r3, [r3, #24]
	.loc 1 2146 8
	cmp	r3, #16384
	beq	.L290
.L280:
	.loc 1 2161 3 is_stmt 1
	.loc 1 2164 3
	.loc 1 2164 7 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2164 38
	ldr	r2, .L294
	str	r2, [r3, #64]
	.loc 1 2167 3 is_stmt 1
	.loc 1 2167 7 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2167 34
	ldr	r2, .L294+4
	str	r2, [r3, #60]
	.loc 1 2170 3 is_stmt 1
	.loc 1 2170 7 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2170 35
	ldr	r2, .L294+8
	str	r2, [r3, #76]
	.loc 1 2173 3 is_stmt 1
	.loc 1 2173 7 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2173 35
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 2176 3 is_stmt 1
	.loc 1 2176 9 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2176 19
	ldr	r3, [r2, #8]
	.loc 1 2176 27
	bic	r3, r3, #32768
	str	r3, [r2, #8]
	.loc 1 2179 3 is_stmt 1
	.loc 1 2179 91 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2180 38
	ldrh	r3, [r4, #98]
	.loc 1 2179 17
	uxth	r3, r3
	adds	r2, r2, #32
	ldr	r1, [r4, #92]
.LVL230:
	ldr	r0, [r4, #120]
.LVL231:
	bl	HAL_DMA_Start_IT
.LVL232:
	.loc 1 2179 6
	mov	r1, r0
	cmp	r0, #0
	bne	.L291
	.loc 1 2193 3 is_stmt 1
	.loc 1 2193 11 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2193 25
	ldr	r3, [r3, #28]
	.loc 1 2193 6
	cmp	r3, #256
	beq	.L292
	.loc 1 2199 5 is_stmt 1
	.loc 1 2199 42 is_stmt 0
	ldr	r0, [r4]
	.loc 1 2199 52
	ldr	r2, [r0, #4]
	.loc 1 2199 61
	ldr	r3, .L294+12
	ands	r3, r3, r2
	.loc 1 2199 88
	orrs	r3, r3, r6
	.loc 1 2199 30
	str	r3, [r0, #4]
.L283:
	.loc 1 2203 3 is_stmt 1
	.loc 1 2203 9 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2203 19
	ldr	r3, [r2, #8]
	.loc 1 2203 27
	orr	r3, r3, #32768
	str	r3, [r2, #8]
	.loc 1 2206 3 is_stmt 1
	.loc 1 2206 10 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2206 20
	ldr	r3, [r2, #16]
	.loc 1 2206 26
	orr	r3, r3, #800
	str	r3, [r2, #16]
	.loc 1 2209 3 is_stmt 1
	.loc 1 2209 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2209 21
	ldr	r3, [r2]
	.loc 1 2209 28
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 2211 3 is_stmt 1
	.loc 1 2211 17 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 2211 6
	cmp	r3, #4194304
	beq	.L293
.L284:
	.loc 1 2218 3 is_stmt 1
	.loc 1 2218 7
	.loc 1 2218 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 2218 5 is_stmt 1
	.loc 1 2220 3
	.loc 1 2220 10 is_stmt 0
	mov	r5, r1
	b	.L272
.LVL233:
.L288:
	.loc 1 2122 5 is_stmt 1
	.loc 1 2122 13 is_stmt 0
	ldr	r2, [r0]
.LVL234:
	.loc 1 2122 23
	ldr	r3, [r2]
	.loc 1 2122 30
	orr	r3, r3, #2048
	str	r3, [r2]
.LVL235:
	b	.L274
.L276:
	.loc 1 2135 5 is_stmt 1
	.loc 1 2135 9
	.loc 1 2135 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 2135 7 is_stmt 1
	.loc 1 2136 5
	.loc 1 2136 12 is_stmt 0
	b	.L272
.L289:
	.loc 1 2144 7 is_stmt 1
	.loc 1 2144 32 is_stmt 0
	ldrh	r2, [r4, #98]
	uxth	r2, r2
	.loc 1 2144 46
	adds	r2, r2, #1
	.loc 1 2144 25
	lsrs	r2, r2, #1
	strh	r2, [r4, #98]	@ movhi
	b	.L279
.L290:
	.loc 1 2148 7 is_stmt 1
	.loc 1 2148 32 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 2148 46
	adds	r3, r3, #3
	.loc 1 2148 25
	lsrs	r3, r3, #2
	strh	r3, [r4, #98]	@ movhi
	b	.L280
.L278:
	.loc 1 2151 8 is_stmt 1
	.loc 1 2151 11 is_stmt 0
	cmp	r3, #15
	bhi	.L280
	.loc 1 2153 5 is_stmt 1
	.loc 1 2153 13 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2153 27
	ldr	r3, [r3, #24]
	.loc 1 2153 8
	cmp	r3, #16384
	bne	.L280
	.loc 1 2155 7 is_stmt 1
	.loc 1 2155 32 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 2155 46
	adds	r3, r3, #1
	.loc 1 2155 25
	lsrs	r3, r3, #1
	strh	r3, [r4, #98]	@ movhi
	b	.L280
.LVL236:
.L291:
	.loc 1 2183 5 is_stmt 1
	.loc 1 2183 11 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2183 24
	orr	r3, r3, #16
	str	r3, [r4, #132]
	.loc 1 2184 5 is_stmt 1
	.loc 1 2184 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 2187 5 is_stmt 1
	.loc 1 2187 9
	.loc 1 2187 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 2187 7 is_stmt 1
	.loc 1 2189 5
	.loc 1 2189 12 is_stmt 0
	b	.L272
.L292:
	.loc 1 2195 5 is_stmt 1
	.loc 1 2195 42 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2195 52
	ldr	r0, [r2, #4]
	.loc 1 2195 88
	ldr	r3, .L294+12
	ands	r3, r3, r0
	.loc 1 2195 30
	str	r3, [r2, #4]
	b	.L283
.L293:
	.loc 1 2214 5 is_stmt 1
	.loc 1 2214 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2214 21
	ldr	r3, [r2]
	.loc 1 2214 28
	orr	r3, r3, #512
	str	r3, [r2]
	b	.L284
.LVL237:
.L285:
	.loc 1 2094 12
	movs	r5, #2
.LVL238:
.L272:
	.loc 1 2221 1
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.LVL239:
.L286:
	.loc 1 2103 47
	movs	r5, #2
	b	.L272
.L295:
	.align	2
.L294:
	.word	SPI_DMAHalfTransmitCplt
	.word	SPI_DMATransmitCplt
	.word	SPI_DMAError
	.word	-65536
	.cfi_endproc
.LFE345:
	.size	HAL_SPI_Transmit_DMA, .-HAL_SPI_Transmit_DMA
	.section	.text.HAL_SPI_Receive_DMA,"ax",%progbits
	.align	1
	.global	HAL_SPI_Receive_DMA
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_Receive_DMA, %function
HAL_SPI_Receive_DMA:
.LFB346:
	.loc 1 2233 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL240:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 2236 3
	.loc 1 2239 3
	.loc 1 2239 11 is_stmt 0
	ldrb	r5, [r0, #129]	@ zero_extendqisi2
	uxtb	r5, r5
	.loc 1 2239 6
	cmp	r5, #1
	bne	.L314
	mov	r6, r2
	.loc 1 2245 3 is_stmt 1
	.loc 1 2245 6 is_stmt 0
	cmp	r2, #0
	it	ne
	cmpne	r1, #0
	beq	.L315
	.loc 1 2252 3 is_stmt 1
	.loc 1 2252 7
	.loc 1 2252 16 is_stmt 0
	ldrb	r3, [r0, #128]	@ zero_extendqisi2
	.loc 1 2252 9
	cmp	r3, #1
	beq	.L312
	.loc 1 2252 66 is_stmt 1 discriminator 2
	.loc 1 2252 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #128]
	.loc 1 2252 5 is_stmt 1 discriminator 2
	.loc 1 2255 3 discriminator 2
	.loc 1 2255 15 is_stmt 0 discriminator 2
	movs	r3, #4
	strb	r3, [r0, #129]
	.loc 1 2256 3 is_stmt 1 discriminator 2
	.loc 1 2256 19 is_stmt 0 discriminator 2
	movs	r3, #0
	str	r3, [r0, #132]
	.loc 1 2257 3 is_stmt 1 discriminator 2
	.loc 1 2257 20 is_stmt 0 discriminator 2
	str	r1, [r0, #100]
	.loc 1 2258 3 is_stmt 1 discriminator 2
	.loc 1 2258 20 is_stmt 0 discriminator 2
	strh	r2, [r4, #104]	@ movhi
	.loc 1 2259 3 is_stmt 1 discriminator 2
	.loc 1 2259 21 is_stmt 0 discriminator 2
	strh	r2, [r4, #106]	@ movhi
	.loc 1 2262 3 is_stmt 1 discriminator 2
	.loc 1 2262 15 is_stmt 0 discriminator 2
	str	r3, [r0, #112]
	.loc 1 2263 3 is_stmt 1 discriminator 2
	.loc 1 2263 15 is_stmt 0 discriminator 2
	str	r3, [r0, #116]
	.loc 1 2264 3 is_stmt 1 discriminator 2
	.loc 1 2264 20 is_stmt 0 discriminator 2
	strh	r3, [r0, #96]	@ movhi
	.loc 1 2265 3 is_stmt 1 discriminator 2
	.loc 1 2265 21 is_stmt 0 discriminator 2
	strh	r3, [r0, #98]	@ movhi
	.loc 1 2268 3 is_stmt 1 discriminator 2
	.loc 1 2268 17 is_stmt 0 discriminator 2
	ldr	r3, [r0, #8]
	.loc 1 2268 6 discriminator 2
	cmp	r3, #393216
	beq	.L316
	.loc 1 2274 5 is_stmt 1
	.loc 1 2274 47 is_stmt 0
	ldr	r2, [r0]
.LVL241:
	.loc 1 2274 57
	ldr	r3, [r2, #12]
	.loc 1 2274 67
	bic	r3, r3, #393216
	.loc 1 2274 92
	orr	r3, r3, #262144
	.loc 1 2274 33
	str	r3, [r2, #12]
.LVL242:
.L301:
	.loc 1 2278 3 is_stmt 1
	.loc 1 2278 19 is_stmt 0
	ldr	r3, [r4, #12]
	.loc 1 2278 6
	cmp	r3, #15
	bls	.L302
	.loc 1 2278 55 discriminator 1
	ldr	r2, [r4, #124]
	.loc 1 2278 69 discriminator 1
	ldr	r2, [r2, #24]
	.loc 1 2278 47 discriminator 1
	cmp	r2, #16384
	bne	.L303
.L302:
	.loc 1 2278 121 discriminator 3
	cmp	r3, #7
	bls	.L304
	.loc 1 2279 56
	ldr	r3, [r4, #124]
	.loc 1 2279 70
	ldr	r3, [r3, #24]
	.loc 1 2279 47
	cmp	r3, #8192
	it	ne
	cmpne	r3, #16384
	bne	.L303
.L304:
	.loc 1 2288 3 is_stmt 1
	.loc 1 2288 9 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2288 19
	ldr	r3, [r2, #8]
	.loc 1 2288 27
	bic	r3, r3, #16384
	str	r3, [r2, #8]
	.loc 1 2291 3 is_stmt 1
	.loc 1 2291 17 is_stmt 0
	ldr	r3, [r4, #12]
	.loc 1 2291 6
	cmp	r3, #7
	bhi	.L305
	.loc 1 2293 5 is_stmt 1
	.loc 1 2293 13 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2293 27
	ldr	r2, [r3, #24]
	.loc 1 2293 8
	cmp	r2, #8192
	beq	.L317
.L306:
	.loc 1 2297 5 is_stmt 1
	.loc 1 2297 27 is_stmt 0
	ldr	r3, [r3, #24]
	.loc 1 2297 8
	cmp	r3, #16384
	beq	.L318
.L307:
	.loc 1 2312 3 is_stmt 1
	.loc 1 2315 3
	.loc 1 2315 7 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2315 38
	ldr	r2, .L322
	str	r2, [r3, #64]
	.loc 1 2318 3 is_stmt 1
	.loc 1 2318 7 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2318 34
	ldr	r2, .L322+4
	str	r2, [r3, #60]
	.loc 1 2321 3 is_stmt 1
	.loc 1 2321 7 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2321 35
	ldr	r2, .L322+8
	str	r2, [r3, #76]
	.loc 1 2324 3 is_stmt 1
	.loc 1 2324 7 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2324 35
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 2327 3 is_stmt 1
	.loc 1 2327 63 is_stmt 0
	ldr	r1, [r4]
.LVL243:
	.loc 1 2328 38
	ldrh	r3, [r4, #106]
	.loc 1 2327 17
	uxth	r3, r3
	ldr	r2, [r4, #100]
	adds	r1, r1, #48
	ldr	r0, [r4, #124]
.LVL244:
	bl	HAL_DMA_Start_IT
.LVL245:
	.loc 1 2327 6
	mov	r1, r0
	cmp	r0, #0
	bne	.L319
	.loc 1 2341 3 is_stmt 1
	.loc 1 2341 11 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2341 25
	ldr	r3, [r3, #28]
	.loc 1 2341 6
	cmp	r3, #256
	beq	.L320
	.loc 1 2347 5 is_stmt 1
	.loc 1 2347 42 is_stmt 0
	ldr	r0, [r4]
	.loc 1 2347 52
	ldr	r2, [r0, #4]
	.loc 1 2347 61
	ldr	r3, .L322+12
	ands	r3, r3, r2
	.loc 1 2347 88
	orrs	r3, r3, r6
	.loc 1 2347 30
	str	r3, [r0, #4]
.L310:
	.loc 1 2351 3 is_stmt 1
	.loc 1 2351 9 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2351 19
	ldr	r3, [r2, #8]
	.loc 1 2351 27
	orr	r3, r3, #16384
	str	r3, [r2, #8]
	.loc 1 2354 3 is_stmt 1
	.loc 1 2354 10 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2354 20
	ldr	r3, [r2, #16]
	.loc 1 2354 26
	orr	r3, r3, #832
	str	r3, [r2, #16]
	.loc 1 2357 3 is_stmt 1
	.loc 1 2357 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2357 21
	ldr	r3, [r2]
	.loc 1 2357 28
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 2359 3 is_stmt 1
	.loc 1 2359 17 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 2359 6
	cmp	r3, #4194304
	beq	.L321
.L311:
	.loc 1 2366 3 is_stmt 1
	.loc 1 2366 7
	.loc 1 2366 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 2366 5 is_stmt 1
	.loc 1 2368 3
	.loc 1 2368 10 is_stmt 0
	mov	r5, r1
	b	.L298
.LVL246:
.L314:
	.loc 1 2241 5 is_stmt 1
	.loc 1 2241 9
	.loc 1 2241 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r0, #128]
	.loc 1 2241 7 is_stmt 1
	.loc 1 2242 5
	.loc 1 2242 12 is_stmt 0
	movs	r5, #2
.LVL247:
.L298:
	.loc 1 2369 1
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.LVL248:
.L315:
	.loc 1 2247 5 is_stmt 1
	.loc 1 2247 9
	.loc 1 2247 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r0, #128]
	.loc 1 2247 7 is_stmt 1
	.loc 1 2248 5
	.loc 1 2248 12 is_stmt 0
	b	.L298
.L316:
	.loc 1 2270 5 is_stmt 1
	.loc 1 2270 13 is_stmt 0
	ldr	r2, [r0]
.LVL249:
	.loc 1 2270 23
	ldr	r3, [r2]
	.loc 1 2270 30
	bic	r3, r3, #2048
	str	r3, [r2]
.LVL250:
	b	.L301
.L303:
	.loc 1 2283 5 is_stmt 1
	.loc 1 2283 9
	.loc 1 2283 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 2283 7 is_stmt 1
	.loc 1 2284 5
	.loc 1 2284 12 is_stmt 0
	b	.L298
.L317:
	.loc 1 2295 7 is_stmt 1
	.loc 1 2295 32 is_stmt 0
	ldrh	r2, [r4, #106]
	uxth	r2, r2
	.loc 1 2295 46
	adds	r2, r2, #1
	.loc 1 2295 25
	lsrs	r2, r2, #1
	strh	r2, [r4, #106]	@ movhi
	b	.L306
.L318:
	.loc 1 2299 7 is_stmt 1
	.loc 1 2299 32 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 2299 46
	adds	r3, r3, #3
	.loc 1 2299 25
	lsrs	r3, r3, #2
	strh	r3, [r4, #106]	@ movhi
	b	.L307
.L305:
	.loc 1 2302 8 is_stmt 1
	.loc 1 2302 11 is_stmt 0
	cmp	r3, #15
	bhi	.L307
	.loc 1 2304 5 is_stmt 1
	.loc 1 2304 13 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2304 27
	ldr	r3, [r3, #24]
	.loc 1 2304 8
	cmp	r3, #16384
	bne	.L307
	.loc 1 2306 7 is_stmt 1
	.loc 1 2306 32 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 2306 46
	adds	r3, r3, #1
	.loc 1 2306 25
	lsrs	r3, r3, #1
	strh	r3, [r4, #106]	@ movhi
	b	.L307
.LVL251:
.L319:
	.loc 1 2331 5 is_stmt 1
	.loc 1 2331 11 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2331 24
	orr	r3, r3, #16
	str	r3, [r4, #132]
	.loc 1 2332 5 is_stmt 1
	.loc 1 2332 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 2335 5 is_stmt 1
	.loc 1 2335 9
	.loc 1 2335 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 2335 7 is_stmt 1
	.loc 1 2337 5
	.loc 1 2337 12 is_stmt 0
	b	.L298
.L320:
	.loc 1 2343 5 is_stmt 1
	.loc 1 2343 42 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2343 52
	ldr	r0, [r2, #4]
	.loc 1 2343 88
	ldr	r3, .L322+12
	ands	r3, r3, r0
	.loc 1 2343 30
	str	r3, [r2, #4]
	b	.L310
.L321:
	.loc 1 2362 5 is_stmt 1
	.loc 1 2362 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2362 21
	ldr	r3, [r2]
	.loc 1 2362 28
	orr	r3, r3, #512
	str	r3, [r2]
	b	.L311
.LVL252:
.L312:
	.loc 1 2252 47
	movs	r5, #2
	b	.L298
.L323:
	.align	2
.L322:
	.word	SPI_DMAHalfReceiveCplt
	.word	SPI_DMAReceiveCplt
	.word	SPI_DMAError
	.word	-65536
	.cfi_endproc
.LFE346:
	.size	HAL_SPI_Receive_DMA, .-HAL_SPI_Receive_DMA
	.section	.text.HAL_SPI_TransmitReceive_DMA,"ax",%progbits
	.align	1
	.global	HAL_SPI_TransmitReceive_DMA
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_TransmitReceive_DMA, %function
HAL_SPI_TransmitReceive_DMA:
.LFB347:
	.loc 1 2383 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL253:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 2385 3
	.loc 1 2387 3
	.loc 1 2387 11 is_stmt 0
	ldrb	r5, [r0, #129]	@ zero_extendqisi2
	uxtb	r5, r5
	.loc 1 2387 6
	cmp	r5, #1
	bne	.L340
	mov	r4, r0
	mov	r6, r3
	.loc 1 2392 3 is_stmt 1
	.loc 1 2392 6 is_stmt 0
	cmp	r2, #0
	it	ne
	cmpne	r1, #0
	beq	.L325
	.loc 1 2392 45 discriminator 1
	cmp	r3, #0
	beq	.L325
	.loc 1 2398 3 is_stmt 1
	.loc 1 2398 7
	.loc 1 2398 16 is_stmt 0
	ldrb	r3, [r0, #128]	@ zero_extendqisi2
.LVL254:
	.loc 1 2398 9
	cmp	r3, #1
	beq	.L341
	.loc 1 2398 66 is_stmt 1 discriminator 2
	.loc 1 2398 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #128]
	.loc 1 2398 5 is_stmt 1 discriminator 2
	.loc 1 2401 3 discriminator 2
	.loc 1 2401 15 is_stmt 0 discriminator 2
	movs	r3, #5
	strb	r3, [r0, #129]
	.loc 1 2402 3 is_stmt 1 discriminator 2
	.loc 1 2402 19 is_stmt 0 discriminator 2
	movs	r3, #0
	str	r3, [r0, #132]
	.loc 1 2403 3 is_stmt 1 discriminator 2
	.loc 1 2403 20 is_stmt 0 discriminator 2
	str	r1, [r0, #92]
	.loc 1 2404 3 is_stmt 1 discriminator 2
	.loc 1 2404 20 is_stmt 0 discriminator 2
	strh	r6, [r0, #96]	@ movhi
	.loc 1 2405 3 is_stmt 1 discriminator 2
	.loc 1 2405 21 is_stmt 0 discriminator 2
	strh	r6, [r0, #98]	@ movhi
	.loc 1 2406 3 is_stmt 1 discriminator 2
	.loc 1 2406 20 is_stmt 0 discriminator 2
	str	r2, [r0, #100]
	.loc 1 2407 3 is_stmt 1 discriminator 2
	.loc 1 2407 20 is_stmt 0 discriminator 2
	strh	r6, [r0, #104]	@ movhi
	.loc 1 2408 3 is_stmt 1 discriminator 2
	.loc 1 2408 21 is_stmt 0 discriminator 2
	strh	r6, [r0, #106]	@ movhi
	.loc 1 2411 3 is_stmt 1 discriminator 2
	.loc 1 2411 15 is_stmt 0 discriminator 2
	str	r3, [r0, #112]
	.loc 1 2412 3 is_stmt 1 discriminator 2
	.loc 1 2412 15 is_stmt 0 discriminator 2
	str	r3, [r0, #116]
	.loc 1 2415 3 is_stmt 1 discriminator 2
	.loc 1 2415 45 is_stmt 0 discriminator 2
	ldr	r2, [r0]
.LVL255:
	.loc 1 2415 55 discriminator 2
	ldr	r3, [r2, #12]
	.loc 1 2415 90 discriminator 2
	bic	r3, r3, #393216
	.loc 1 2415 31 discriminator 2
	str	r3, [r2, #12]
.LVL256:
	.loc 1 2418 3 is_stmt 1 discriminator 2
	.loc 1 2418 9 is_stmt 0 discriminator 2
	ldr	r2, [r0]
	.loc 1 2418 19 discriminator 2
	ldr	r3, [r2, #8]
	.loc 1 2418 27 discriminator 2
	bic	r3, r3, #49152
	str	r3, [r2, #8]
	.loc 1 2421 3 is_stmt 1 discriminator 2
	.loc 1 2421 19 is_stmt 0 discriminator 2
	ldr	r3, [r0, #12]
	.loc 1 2421 6 discriminator 2
	cmp	r3, #15
	bls	.L326
	.loc 1 2421 55 discriminator 1
	ldr	r2, [r0, #124]
	.loc 1 2421 69 discriminator 1
	ldr	r2, [r2, #24]
	.loc 1 2421 47 discriminator 1
	cmp	r2, #16384
	bne	.L327
.L326:
	.loc 1 2421 121 discriminator 3
	cmp	r3, #7
	bls	.L328
	.loc 1 2422 56
	ldr	r2, [r4, #124]
	.loc 1 2422 70
	ldr	r2, [r2, #24]
	.loc 1 2422 47
	cmp	r2, #8192
	it	ne
	cmpne	r2, #16384
	bne	.L327
.L328:
	.loc 1 2432 3 is_stmt 1
	.loc 1 2432 6 is_stmt 0
	cmp	r3, #7
	bhi	.L329
	.loc 1 2434 5 is_stmt 1
	.loc 1 2434 13 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2434 27
	ldr	r2, [r3, #24]
	.loc 1 2434 8
	cmp	r2, #8192
	beq	.L343
.L330:
	.loc 1 2438 5 is_stmt 1
	.loc 1 2438 27 is_stmt 0
	ldr	r3, [r3, #24]
	.loc 1 2438 8
	cmp	r3, #16384
	beq	.L344
.L331:
	.loc 1 2442 5 is_stmt 1
	.loc 1 2442 13 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2442 27
	ldr	r2, [r3, #24]
	.loc 1 2442 8
	cmp	r2, #8192
	beq	.L345
.L332:
	.loc 1 2446 5 is_stmt 1
	.loc 1 2446 27 is_stmt 0
	ldr	r3, [r3, #24]
	.loc 1 2446 8
	cmp	r3, #16384
	beq	.L346
.L333:
	.loc 1 2465 3 is_stmt 1
	.loc 1 2468 3
	.loc 1 2468 7 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2468 38
	ldr	r2, .L351
	str	r2, [r3, #64]
	.loc 1 2469 3 is_stmt 1
	.loc 1 2469 7 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2469 34
	ldr	r2, .L351+4
	str	r2, [r3, #60]
	.loc 1 2472 3 is_stmt 1
	.loc 1 2472 7 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2472 35
	ldr	r2, .L351+8
	str	r2, [r3, #76]
	.loc 1 2475 3 is_stmt 1
	.loc 1 2475 7 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2475 35
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 2478 3 is_stmt 1
	.loc 1 2478 63 is_stmt 0
	ldr	r1, [r4]
.LVL257:
	.loc 1 2479 38
	ldrh	r3, [r4, #106]
	.loc 1 2478 17
	uxth	r3, r3
	ldr	r2, [r4, #100]
	adds	r1, r1, #48
	ldr	r0, [r4, #124]
.LVL258:
	bl	HAL_DMA_Start_IT
.LVL259:
	.loc 1 2478 6
	cmp	r0, #0
	beq	.L335
	.loc 1 2482 5 is_stmt 1
	.loc 1 2482 11 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2482 24
	orr	r3, r3, #16
	str	r3, [r4, #132]
	.loc 1 2483 5 is_stmt 1
	.loc 1 2483 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 2486 5 is_stmt 1
	.loc 1 2486 9
	.loc 1 2486 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 2486 7 is_stmt 1
	.loc 1 2488 5
	.loc 1 2488 12 is_stmt 0
	b	.L325
.LVL260:
.L327:
	.loc 1 2427 5 is_stmt 1
	.loc 1 2427 9
	.loc 1 2427 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 2427 7 is_stmt 1
	.loc 1 2428 5
	.loc 1 2428 12 is_stmt 0
	b	.L325
.L343:
	.loc 1 2436 7 is_stmt 1
	.loc 1 2436 32 is_stmt 0
	ldrh	r2, [r4, #98]
	uxth	r2, r2
	.loc 1 2436 46
	adds	r2, r2, #1
	.loc 1 2436 25
	lsrs	r2, r2, #1
	strh	r2, [r4, #98]	@ movhi
	b	.L330
.L344:
	.loc 1 2440 7 is_stmt 1
	.loc 1 2440 32 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 2440 46
	adds	r3, r3, #3
	.loc 1 2440 25
	lsrs	r3, r3, #2
	strh	r3, [r4, #98]	@ movhi
	b	.L331
.L345:
	.loc 1 2444 7 is_stmt 1
	.loc 1 2444 32 is_stmt 0
	ldrh	r2, [r4, #106]
	uxth	r2, r2
	.loc 1 2444 46
	adds	r2, r2, #1
	.loc 1 2444 25
	lsrs	r2, r2, #1
	strh	r2, [r4, #106]	@ movhi
	b	.L332
.L346:
	.loc 1 2448 7 is_stmt 1
	.loc 1 2448 32 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 2448 46
	adds	r3, r3, #3
	.loc 1 2448 25
	lsrs	r3, r3, #2
	strh	r3, [r4, #106]	@ movhi
	b	.L333
.L329:
	.loc 1 2451 8 is_stmt 1
	.loc 1 2451 11 is_stmt 0
	cmp	r3, #15
	bhi	.L333
	.loc 1 2453 5 is_stmt 1
	.loc 1 2453 13 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2453 27
	ldr	r3, [r3, #24]
	.loc 1 2453 8
	cmp	r3, #16384
	beq	.L347
.L334:
	.loc 1 2457 5 is_stmt 1
	.loc 1 2457 13 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2457 27
	ldr	r3, [r3, #24]
	.loc 1 2457 8
	cmp	r3, #16384
	bne	.L333
	.loc 1 2459 7 is_stmt 1
	.loc 1 2459 32 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 2459 46
	adds	r3, r3, #1
	.loc 1 2459 25
	lsrs	r3, r3, #1
	strh	r3, [r4, #106]	@ movhi
	b	.L333
.L347:
	.loc 1 2455 7 is_stmt 1
	.loc 1 2455 32 is_stmt 0
	ldrh	r3, [r4, #98]
	uxth	r3, r3
	.loc 1 2455 46
	adds	r3, r3, #1
	.loc 1 2455 25
	lsrs	r3, r3, #1
	strh	r3, [r4, #98]	@ movhi
	b	.L334
.LVL261:
.L335:
	.loc 1 2492 3 is_stmt 1
	.loc 1 2492 9 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2492 19
	ldr	r3, [r2, #8]
	.loc 1 2492 27
	orr	r3, r3, #16384
	str	r3, [r2, #8]
	.loc 1 2496 3 is_stmt 1
	.loc 1 2496 7 is_stmt 0
	ldr	r2, [r4, #120]
	.loc 1 2496 38
	movs	r3, #0
	str	r3, [r2, #64]
	.loc 1 2497 3 is_stmt 1
	.loc 1 2497 7 is_stmt 0
	ldr	r2, [r4, #120]
	.loc 1 2497 34
	str	r3, [r2, #60]
	.loc 1 2498 3 is_stmt 1
	.loc 1 2498 7 is_stmt 0
	ldr	r2, [r4, #120]
	.loc 1 2498 35
	str	r3, [r2, #80]
	.loc 1 2501 3 is_stmt 1
	.loc 1 2501 7 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2501 35
	ldr	r2, .L351+8
	str	r2, [r3, #76]
	.loc 1 2504 3 is_stmt 1
	.loc 1 2504 91 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2505 38
	ldrh	r3, [r4, #98]
	.loc 1 2504 17
	uxth	r3, r3
	adds	r2, r2, #32
	ldr	r1, [r4, #92]
	ldr	r0, [r4, #120]
	bl	HAL_DMA_Start_IT
.LVL262:
	.loc 1 2504 6
	mov	r1, r0
	cbnz	r0, .L348
	.loc 1 2520 3 is_stmt 1
	.loc 1 2520 11 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2520 25
	ldr	r3, [r3, #28]
	.loc 1 2520 6
	cmp	r3, #256
	beq	.L349
	.loc 1 2526 5 is_stmt 1
	.loc 1 2526 42 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2526 52
	ldr	r0, [r2, #4]
	.loc 1 2526 61
	ldr	r3, .L351+12
	ands	r3, r3, r0
	.loc 1 2526 88
	orrs	r3, r3, r6
	.loc 1 2526 30
	str	r3, [r2, #4]
.L338:
	.loc 1 2530 3 is_stmt 1
	.loc 1 2530 9 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2530 19
	ldr	r3, [r2, #8]
	.loc 1 2530 27
	orr	r3, r3, #32768
	str	r3, [r2, #8]
	.loc 1 2533 3 is_stmt 1
	.loc 1 2533 10 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2533 20
	ldr	r3, [r2, #16]
	.loc 1 2533 26
	orr	r3, r3, #864
	str	r3, [r2, #16]
	.loc 1 2536 3 is_stmt 1
	.loc 1 2536 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2536 21
	ldr	r3, [r2]
	.loc 1 2536 28
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 2538 3 is_stmt 1
	.loc 1 2538 17 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 2538 6
	cmp	r3, #4194304
	beq	.L350
.L339:
	.loc 1 2545 3 is_stmt 1
	.loc 1 2545 7
	.loc 1 2545 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 2545 5 is_stmt 1
	.loc 1 2547 3
	.loc 1 2547 10 is_stmt 0
	mov	r5, r1
	b	.L325
.L348:
	.loc 1 2508 5 is_stmt 1
	.loc 1 2508 11 is_stmt 0
	ldr	r0, [r4, #124]
	bl	HAL_DMA_Abort
.LVL263:
	.loc 1 2511 5 is_stmt 1
	.loc 1 2511 11 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2511 24
	orr	r3, r3, #16
	str	r3, [r4, #132]
	.loc 1 2512 5 is_stmt 1
	.loc 1 2512 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 2515 5 is_stmt 1
	.loc 1 2515 9
	.loc 1 2515 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 2515 7 is_stmt 1
	.loc 1 2517 5
	.loc 1 2517 12 is_stmt 0
	b	.L325
.L349:
	.loc 1 2522 5 is_stmt 1
	.loc 1 2522 42 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2522 52
	ldr	r0, [r2, #4]
	.loc 1 2522 88
	ldr	r3, .L351+12
	ands	r3, r3, r0
	.loc 1 2522 30
	str	r3, [r2, #4]
	b	.L338
.L350:
	.loc 1 2541 5 is_stmt 1
	.loc 1 2541 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2541 21
	ldr	r3, [r2]
	.loc 1 2541 28
	orr	r3, r3, #512
	str	r3, [r2]
	b	.L339
.LVL264:
.L340:
	.loc 1 2389 12
	movs	r5, #2
.LVL265:
.L325:
	.loc 1 2548 1
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.LVL266:
.L341:
	.loc 1 2398 47
	movs	r5, #2
	b	.L325
.L352:
	.align	2
.L351:
	.word	SPI_DMAHalfTransmitReceiveCplt
	.word	SPI_DMATransmitReceiveCplt
	.word	SPI_DMAError
	.word	-65536
	.cfi_endproc
.LFE347:
	.size	HAL_SPI_TransmitReceive_DMA, .-HAL_SPI_TransmitReceive_DMA
	.section	.text.HAL_SPI_Abort,"ax",%progbits
	.align	1
	.global	HAL_SPI_Abort
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_Abort, %function
HAL_SPI_Abort:
.LFB348:
	.loc 1 2564 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL267:
	.loc 1 2565 3
	.loc 1 2567 3
	.loc 1 2570 3
	.loc 1 2570 7
	.loc 1 2570 16 is_stmt 0
	ldrb	r3, [r0, #128]	@ zero_extendqisi2
	.loc 1 2570 9
	cmp	r3, #1
	beq	.L367
	.loc 1 2564 1 discriminator 2
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	mov	r4, r0
	.loc 1 2570 66 is_stmt 1 discriminator 2
	.loc 1 2570 79 is_stmt 0 discriminator 2
	movs	r3, #1
	strb	r3, [r0, #128]
	.loc 1 2570 5 is_stmt 1 discriminator 2
	.loc 1 2573 3 discriminator 2
	.loc 1 2573 15 is_stmt 0 discriminator 2
	movs	r3, #7
	strb	r3, [r0, #129]
	.loc 1 2576 3 is_stmt 1 discriminator 2
.LVL268:
	.loc 1 2577 3 discriminator 2
	.loc 1 2577 43 is_stmt 0 discriminator 2
	ldr	r3, .L378
	ldr	r3, [r3]
	ldr	r2, .L378+4
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #9
	.loc 1 2577 17 discriminator 2
	movs	r2, #100
	mul	r3, r2, r3
	.loc 1 2577 9 discriminator 2
	str	r3, [sp, #4]
	.loc 1 2580 3 is_stmt 1 discriminator 2
	.loc 1 2580 14 is_stmt 0 discriminator 2
	ldr	r3, [r0]
	.loc 1 2580 24 discriminator 2
	ldr	r2, [r3]
	.loc 1 2580 6 discriminator 2
	tst	r2, #512
	beq	.L355
	.loc 1 2583 5 is_stmt 1
	.loc 1 2583 22 is_stmt 0
	ldr	r2, [r3, #16]
	.loc 1 2583 28
	bic	r2, r2, #8
	str	r2, [r3, #16]
.L358:
	.loc 1 2584 5 is_stmt 1
	.loc 1 2586 7
	.loc 1 2586 12 is_stmt 0
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	str	r3, [sp, #4]
	.loc 1 2587 7 is_stmt 1
	.loc 1 2587 17 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 2587 10
	cbz	r3, .L373
	.loc 1 2592 59 is_stmt 1
	.loc 1 2592 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 2592 31
	ldr	r3, [r3, #16]
	.loc 1 2592 59
	tst	r3, #8
	bne	.L358
	b	.L357
.L373:
	.loc 1 2589 9 is_stmt 1
	.loc 1 2589 15 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2589 28
	orr	r3, r3, #64
	str	r3, [r4, #132]
	.loc 1 2590 9 is_stmt 1
.L357:
	.loc 1 2595 5
	.loc 1 2595 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2595 21
	ldr	r3, [r2]
	.loc 1 2595 28
	orr	r3, r3, #1024
	str	r3, [r2]
.L361:
	.loc 1 2596 5 is_stmt 1
	.loc 1 2598 7
	.loc 1 2598 12 is_stmt 0
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	str	r3, [sp, #4]
	.loc 1 2599 7 is_stmt 1
	.loc 1 2599 17 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 2599 10
	cbz	r3, .L374
	.loc 1 2604 59 is_stmt 1
	.loc 1 2604 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 2604 31
	ldr	r3, [r3]
	.loc 1 2604 59
	tst	r3, #512
	bne	.L361
	b	.L360
.L374:
	.loc 1 2601 9 is_stmt 1
	.loc 1 2601 15 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2601 28
	orr	r3, r3, #64
	str	r3, [r4, #132]
	.loc 1 2602 9 is_stmt 1
.L360:
	.loc 1 2607 5
	.loc 1 2607 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2607 23
	ldr	r3, [r2, #24]
	.loc 1 2607 31
	orr	r3, r3, #2048
	str	r3, [r2, #24]
.L363:
	.loc 1 2608 5 is_stmt 1
	.loc 1 2610 7
	.loc 1 2610 12 is_stmt 0
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	str	r3, [sp, #4]
	.loc 1 2611 7 is_stmt 1
	.loc 1 2611 17 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 2611 10
	cbz	r3, .L375
	.loc 1 2616 61 is_stmt 1
	.loc 1 2616 23 is_stmt 0
	ldr	r3, [r4]
	.loc 1 2616 33
	ldr	r3, [r3, #20]
	.loc 1 2616 61
	tst	r3, #2048
	bne	.L363
	b	.L355
.L375:
	.loc 1 2613 9 is_stmt 1
	.loc 1 2613 15 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2613 28
	orr	r3, r3, #64
	str	r3, [r4, #132]
	.loc 1 2614 9 is_stmt 1
.L355:
	.loc 1 2620 3
	.loc 1 2620 14 is_stmt 0
	ldr	r3, [r4]
	.loc 1 2620 24
	ldr	r3, [r3, #8]
	.loc 1 2620 6
	tst	r3, #32768
	beq	.L364
	.loc 1 2622 5 is_stmt 1
	.loc 1 2622 13 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2622 8
	cbz	r3, .L364
	.loc 1 2625 7 is_stmt 1
	.loc 1 2625 39 is_stmt 0
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 2628 7 is_stmt 1
	.loc 1 2628 11 is_stmt 0
	ldr	r0, [r4, #120]
.LVL269:
	bl	HAL_DMA_Abort
.LVL270:
	.loc 1 2628 10
	cbnz	r0, .L376
.L364:
	.loc 1 2639 3 is_stmt 1
	.loc 1 2639 14 is_stmt 0
	ldr	r3, [r4]
	.loc 1 2639 24
	ldr	r3, [r3, #8]
	.loc 1 2639 6
	tst	r3, #16384
	beq	.L365
	.loc 1 2641 5 is_stmt 1
	.loc 1 2641 13 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2641 8
	cbz	r3, .L365
	.loc 1 2644 7 is_stmt 1
	.loc 1 2644 39 is_stmt 0
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 2647 7 is_stmt 1
	.loc 1 2647 11 is_stmt 0
	ldr	r0, [r4, #124]
	bl	HAL_DMA_Abort
.LVL271:
	.loc 1 2647 10
	cbnz	r0, .L377
.L365:
	.loc 1 2658 3 is_stmt 1
	mov	r0, r4
	bl	SPI_AbortTransfer
.LVL272:
	.loc 1 2661 3
	.loc 1 2661 14 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2661 6
	tst	r3, #64
	bne	.L368
	.loc 1 2669 5 is_stmt 1
	.loc 1 2669 21 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #132]
.L366:
.LVL273:
	.loc 1 2673 3 is_stmt 1
	.loc 1 2673 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 2676 3 is_stmt 1
	.loc 1 2676 7
	.loc 1 2676 20 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #128]
	.loc 1 2676 5 is_stmt 1
	.loc 1 2678 3
	.loc 1 2679 1 is_stmt 0
	add	sp, sp, #8
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
.LVL274:
.L376:
	.cfi_restore_state
	.loc 1 2630 9 is_stmt 1
	.loc 1 2630 13 is_stmt 0
	ldr	r0, [r4, #120]
	bl	HAL_DMA_GetError
.LVL275:
	.loc 1 2630 12
	cmp	r0, #32
	bne	.L364
	.loc 1 2632 11 is_stmt 1
	.loc 1 2632 27 is_stmt 0
	movs	r3, #64
	str	r3, [r4, #132]
	b	.L364
.L377:
	.loc 1 2649 9 is_stmt 1
	.loc 1 2649 13 is_stmt 0
	ldr	r0, [r4, #124]
	bl	HAL_DMA_GetError
.LVL276:
	.loc 1 2649 12
	cmp	r0, #32
	bne	.L365
	.loc 1 2651 11 is_stmt 1
	.loc 1 2651 27 is_stmt 0
	movs	r3, #64
	str	r3, [r4, #132]
	b	.L365
.L368:
	.loc 1 2664 15
	movs	r0, #1
	b	.L366
.LVL277:
.L367:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 2570 47
	movs	r0, #2
.LVL278:
	.loc 1 2679 1
	bx	lr
.L379:
	.align	2
.L378:
	.word	SystemCoreClock
	.word	91625969
	.cfi_endproc
.LFE348:
	.size	HAL_SPI_Abort, .-HAL_SPI_Abort
	.section	.text.HAL_SPI_DMAPause,"ax",%progbits
	.align	1
	.global	HAL_SPI_DMAPause
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_DMAPause, %function
HAL_SPI_DMAPause:
.LFB350:
	.loc 1 2843 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL279:
	.loc 1 2845 3
	.loc 1 2845 9 is_stmt 0
	ldr	r3, [r0, #132]
	.loc 1 2845 22
	orr	r3, r3, #1024
	str	r3, [r0, #132]
	.loc 1 2847 3 is_stmt 1
	.loc 1 2848 1 is_stmt 0
	movs	r0, #1
.LVL280:
	bx	lr
	.cfi_endproc
.LFE350:
	.size	HAL_SPI_DMAPause, .-HAL_SPI_DMAPause
	.section	.text.HAL_SPI_DMAResume,"ax",%progbits
	.align	1
	.global	HAL_SPI_DMAResume
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_DMAResume, %function
HAL_SPI_DMAResume:
.LFB351:
	.loc 1 2858 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL281:
	.loc 1 2860 3
	.loc 1 2860 9 is_stmt 0
	ldr	r3, [r0, #132]
	.loc 1 2860 22
	orr	r3, r3, #1024
	str	r3, [r0, #132]
	.loc 1 2862 3 is_stmt 1
	.loc 1 2863 1 is_stmt 0
	movs	r0, #1
.LVL282:
	bx	lr
	.cfi_endproc
.LFE351:
	.size	HAL_SPI_DMAResume, .-HAL_SPI_DMAResume
	.section	.text.HAL_SPI_DMAStop,"ax",%progbits
	.align	1
	.global	HAL_SPI_DMAStop
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_DMAStop, %function
HAL_SPI_DMAStop:
.LFB352:
	.loc 1 2873 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL283:
	.loc 1 2875 3
	.loc 1 2875 9 is_stmt 0
	ldr	r3, [r0, #132]
	.loc 1 2875 22
	orr	r3, r3, #1024
	str	r3, [r0, #132]
	.loc 1 2877 3 is_stmt 1
	.loc 1 2878 1 is_stmt 0
	movs	r0, #1
.LVL284:
	bx	lr
	.cfi_endproc
.LFE352:
	.size	HAL_SPI_DMAStop, .-HAL_SPI_DMAStop
	.section	.text.HAL_SPI_TxCpltCallback,"ax",%progbits
	.align	1
	.weak	HAL_SPI_TxCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_TxCpltCallback, %function
HAL_SPI_TxCpltCallback:
.LFB354:
	.loc 1 3140 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL285:
	.loc 1 3142 3
	.loc 1 3147 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE354:
	.size	HAL_SPI_TxCpltCallback, .-HAL_SPI_TxCpltCallback
	.section	.text.SPI_DMATransmitCplt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_DMATransmitCplt, %function
SPI_DMATransmitCplt:
.LFB365:
	.loc 1 3341 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL286:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 3342 3
	.loc 1 3342 22 is_stmt 0
	ldr	r0, [r0, #56]
.LVL287:
	.loc 1 3344 3 is_stmt 1
	.loc 1 3344 11 is_stmt 0
	ldrb	r3, [r0, #129]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 3344 6
	cmp	r3, #7
	beq	.L384
	.loc 1 3346 5 is_stmt 1
	.loc 1 3346 13 is_stmt 0
	ldr	r3, [r0, #120]
	.loc 1 3346 27
	ldr	r3, [r3, #28]
	.loc 1 3346 8
	cmp	r3, #256
	beq	.L388
	.loc 1 3357 7 is_stmt 1
	.loc 1 3357 14 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3357 24
	ldr	r3, [r2, #16]
	.loc 1 3357 30
	orr	r3, r3, #8
	str	r3, [r2, #16]
.LVL288:
.L384:
	.loc 1 3360 1
	pop	{r3, pc}
.LVL289:
.L388:
	.loc 1 3351 7 is_stmt 1
	bl	HAL_SPI_TxCpltCallback
.LVL290:
	b	.L384
	.cfi_endproc
.LFE365:
	.size	SPI_DMATransmitCplt, .-SPI_DMATransmitCplt
	.section	.text.HAL_SPI_RxCpltCallback,"ax",%progbits
	.align	1
	.weak	HAL_SPI_RxCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_RxCpltCallback, %function
HAL_SPI_RxCpltCallback:
.LFB355:
	.loc 1 3156 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL291:
	.loc 1 3158 3
	.loc 1 3163 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE355:
	.size	HAL_SPI_RxCpltCallback, .-HAL_SPI_RxCpltCallback
	.section	.text.SPI_DMAReceiveCplt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_DMAReceiveCplt, %function
SPI_DMAReceiveCplt:
.LFB366:
	.loc 1 3369 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL292:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 3370 3
	.loc 1 3370 22 is_stmt 0
	ldr	r0, [r0, #56]
.LVL293:
	.loc 1 3372 3 is_stmt 1
	.loc 1 3372 11 is_stmt 0
	ldrb	r3, [r0, #129]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 3372 6
	cmp	r3, #7
	beq	.L390
	.loc 1 3374 5 is_stmt 1
	.loc 1 3374 13 is_stmt 0
	ldr	r3, [r0, #124]
	.loc 1 3374 27
	ldr	r3, [r3, #28]
	.loc 1 3374 8
	cmp	r3, #256
	beq	.L394
	.loc 1 3385 7 is_stmt 1
	.loc 1 3385 14 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3385 24
	ldr	r3, [r2, #16]
	.loc 1 3385 30
	orr	r3, r3, #8
	str	r3, [r2, #16]
.LVL294:
.L390:
	.loc 1 3388 1
	pop	{r3, pc}
.LVL295:
.L394:
	.loc 1 3379 7 is_stmt 1
	bl	HAL_SPI_RxCpltCallback
.LVL296:
	b	.L390
	.cfi_endproc
.LFE366:
	.size	SPI_DMAReceiveCplt, .-SPI_DMAReceiveCplt
	.section	.text.HAL_SPI_TxRxCpltCallback,"ax",%progbits
	.align	1
	.weak	HAL_SPI_TxRxCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_TxRxCpltCallback, %function
HAL_SPI_TxRxCpltCallback:
.LFB356:
	.loc 1 3172 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL297:
	.loc 1 3174 3
	.loc 1 3179 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE356:
	.size	HAL_SPI_TxRxCpltCallback, .-HAL_SPI_TxRxCpltCallback
	.section	.text.SPI_DMATransmitReceiveCplt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_DMATransmitReceiveCplt, %function
SPI_DMATransmitReceiveCplt:
.LFB367:
	.loc 1 3397 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL298:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 3398 3
	.loc 1 3398 22 is_stmt 0
	ldr	r0, [r0, #56]
.LVL299:
	.loc 1 3400 3 is_stmt 1
	.loc 1 3400 11 is_stmt 0
	ldrb	r3, [r0, #129]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 3400 6
	cmp	r3, #7
	beq	.L396
	.loc 1 3402 5 is_stmt 1
	.loc 1 3402 13 is_stmt 0
	ldr	r3, [r0, #120]
	.loc 1 3402 27
	ldr	r3, [r3, #28]
	.loc 1 3402 8
	cmp	r3, #256
	beq	.L400
	.loc 1 3413 7 is_stmt 1
	.loc 1 3413 14 is_stmt 0
	ldr	r2, [r0]
	.loc 1 3413 24
	ldr	r3, [r2, #16]
	.loc 1 3413 30
	orr	r3, r3, #8
	str	r3, [r2, #16]
.LVL300:
.L396:
	.loc 1 3416 1
	pop	{r3, pc}
.LVL301:
.L400:
	.loc 1 3407 7 is_stmt 1
	bl	HAL_SPI_TxRxCpltCallback
.LVL302:
	b	.L396
	.cfi_endproc
.LFE367:
	.size	SPI_DMATransmitReceiveCplt, .-SPI_DMATransmitReceiveCplt
	.section	.text.HAL_SPI_TxHalfCpltCallback,"ax",%progbits
	.align	1
	.weak	HAL_SPI_TxHalfCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_TxHalfCpltCallback, %function
HAL_SPI_TxHalfCpltCallback:
.LFB357:
	.loc 1 3188 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL303:
	.loc 1 3190 3
	.loc 1 3195 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE357:
	.size	HAL_SPI_TxHalfCpltCallback, .-HAL_SPI_TxHalfCpltCallback
	.section	.text.SPI_DMAHalfTransmitCplt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_DMAHalfTransmitCplt, %function
SPI_DMAHalfTransmitCplt:
.LFB368:
	.loc 1 3425 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL304:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 3426 3
.LVL305:
	.loc 1 3432 3
	ldr	r0, [r0, #56]
.LVL306:
	bl	HAL_SPI_TxHalfCpltCallback
.LVL307:
	.loc 1 3434 1 is_stmt 0
	pop	{r3, pc}
	.cfi_endproc
.LFE368:
	.size	SPI_DMAHalfTransmitCplt, .-SPI_DMAHalfTransmitCplt
	.section	.text.HAL_SPI_RxHalfCpltCallback,"ax",%progbits
	.align	1
	.weak	HAL_SPI_RxHalfCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_RxHalfCpltCallback, %function
HAL_SPI_RxHalfCpltCallback:
.LFB358:
	.loc 1 3204 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL308:
	.loc 1 3206 3
	.loc 1 3211 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE358:
	.size	HAL_SPI_RxHalfCpltCallback, .-HAL_SPI_RxHalfCpltCallback
	.section	.text.SPI_DMAHalfReceiveCplt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_DMAHalfReceiveCplt, %function
SPI_DMAHalfReceiveCplt:
.LFB369:
	.loc 1 3443 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL309:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 3444 3
.LVL310:
	.loc 1 3450 3
	ldr	r0, [r0, #56]
.LVL311:
	bl	HAL_SPI_RxHalfCpltCallback
.LVL312:
	.loc 1 3452 1 is_stmt 0
	pop	{r3, pc}
	.cfi_endproc
.LFE369:
	.size	SPI_DMAHalfReceiveCplt, .-SPI_DMAHalfReceiveCplt
	.section	.text.HAL_SPI_TxRxHalfCpltCallback,"ax",%progbits
	.align	1
	.weak	HAL_SPI_TxRxHalfCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_TxRxHalfCpltCallback, %function
HAL_SPI_TxRxHalfCpltCallback:
.LFB359:
	.loc 1 3220 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL313:
	.loc 1 3222 3
	.loc 1 3227 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE359:
	.size	HAL_SPI_TxRxHalfCpltCallback, .-HAL_SPI_TxRxHalfCpltCallback
	.section	.text.SPI_DMAHalfTransmitReceiveCplt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_DMAHalfTransmitReceiveCplt, %function
SPI_DMAHalfTransmitReceiveCplt:
.LFB370:
	.loc 1 3461 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL314:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 3462 3
.LVL315:
	.loc 1 3468 3
	ldr	r0, [r0, #56]
.LVL316:
	bl	HAL_SPI_TxRxHalfCpltCallback
.LVL317:
	.loc 1 3470 1 is_stmt 0
	pop	{r3, pc}
	.cfi_endproc
.LFE370:
	.size	SPI_DMAHalfTransmitReceiveCplt, .-SPI_DMAHalfTransmitReceiveCplt
	.section	.text.HAL_SPI_ErrorCallback,"ax",%progbits
	.align	1
	.weak	HAL_SPI_ErrorCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_ErrorCallback, %function
HAL_SPI_ErrorCallback:
.LFB360:
	.loc 1 3236 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL318:
	.loc 1 3238 3
	.loc 1 3246 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE360:
	.size	HAL_SPI_ErrorCallback, .-HAL_SPI_ErrorCallback
	.section	.text.SPI_DMAError,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_DMAError, %function
SPI_DMAError:
.LFB371:
	.loc 1 3479 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL319:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 3480 3
	.loc 1 3480 22 is_stmt 0
	ldr	r4, [r0, #56]
.LVL320:
	.loc 1 3483 3 is_stmt 1
	.loc 1 3483 7 is_stmt 0
	bl	HAL_DMA_GetError
.LVL321:
	.loc 1 3483 6
	cmp	r0, #2
	bne	.L414
.L411:
	.loc 1 3496 1
	pop	{r4, pc}
.LVL322:
.L414:
	.loc 1 3486 5 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL323:
	.loc 1 3488 5
	.loc 1 3488 11 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 3488 24
	orr	r3, r3, #16
	str	r3, [r4, #132]
	.loc 1 3489 5 is_stmt 1
	.loc 1 3489 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 3493 5 is_stmt 1
	mov	r0, r4
	bl	HAL_SPI_ErrorCallback
.LVL324:
	.loc 1 3496 1 is_stmt 0
	b	.L411
	.cfi_endproc
.LFE371:
	.size	SPI_DMAError, .-SPI_DMAError
	.section	.text.SPI_DMAAbortOnError,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_DMAAbortOnError, %function
SPI_DMAAbortOnError:
.LFB372:
	.loc 1 3505 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL325:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 3506 3
	.loc 1 3506 22 is_stmt 0
	ldr	r0, [r0, #56]
.LVL326:
	.loc 1 3507 3 is_stmt 1
	.loc 1 3507 21 is_stmt 0
	movs	r3, #0
	strh	r3, [r0, #106]	@ movhi
	.loc 1 3508 3 is_stmt 1
	.loc 1 3508 21 is_stmt 0
	strh	r3, [r0, #98]	@ movhi
	.loc 1 3511 3 is_stmt 1
	.loc 1 3511 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r0, #129]
	.loc 1 3516 3 is_stmt 1
	bl	HAL_SPI_ErrorCallback
.LVL327:
	.loc 1 3518 1 is_stmt 0
	pop	{r3, pc}
	.cfi_endproc
.LFE372:
	.size	SPI_DMAAbortOnError, .-SPI_DMAAbortOnError
	.section	.text.HAL_SPI_AbortCpltCallback,"ax",%progbits
	.align	1
	.weak	HAL_SPI_AbortCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_AbortCpltCallback, %function
HAL_SPI_AbortCpltCallback:
.LFB361:
	.loc 1 3254 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL328:
	.loc 1 3256 3
	.loc 1 3261 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE361:
	.size	HAL_SPI_AbortCpltCallback, .-HAL_SPI_AbortCpltCallback
	.section	.text.HAL_SPI_Abort_IT,"ax",%progbits
	.align	1
	.global	HAL_SPI_Abort_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_Abort_IT, %function
HAL_SPI_Abort_IT:
.LFB349:
	.loc 1 2697 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL329:
	push	{r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 24
	mov	r4, r0
	.loc 1 2698 3
	.loc 1 2699 3
	.loc 1 2700 3
.LVL330:
	.loc 1 2701 3
	.loc 1 2704 3
	.loc 1 2704 15 is_stmt 0
	movs	r3, #7
	strb	r3, [r0, #129]
	.loc 1 2707 3 is_stmt 1
.LVL331:
	.loc 1 2708 3
	.loc 1 2708 43 is_stmt 0
	ldr	r3, .L453
	ldr	r3, [r3]
	ldr	r2, .L453+4
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #9
	.loc 1 2708 17
	movs	r2, #100
	mul	r3, r2, r3
	.loc 1 2708 9
	str	r3, [sp, #4]
	.loc 1 2711 3 is_stmt 1
	.loc 1 2711 14 is_stmt 0
	ldr	r3, [r0]
	.loc 1 2711 24
	ldr	r2, [r3]
	.loc 1 2711 6
	tst	r2, #512
	beq	.L419
	.loc 1 2714 5 is_stmt 1
	.loc 1 2714 22 is_stmt 0
	ldr	r2, [r3, #16]
	.loc 1 2714 28
	bic	r2, r2, #8
	str	r2, [r3, #16]
.L422:
	.loc 1 2715 5 is_stmt 1
	.loc 1 2717 7
	.loc 1 2717 12 is_stmt 0
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	str	r3, [sp, #4]
	.loc 1 2718 7 is_stmt 1
	.loc 1 2718 17 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 2718 10
	cbz	r3, .L443
	.loc 1 2723 59 is_stmt 1
	.loc 1 2723 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 2723 31
	ldr	r3, [r3, #16]
	.loc 1 2723 59
	tst	r3, #8
	bne	.L422
	b	.L421
.L443:
	.loc 1 2720 9 is_stmt 1
	.loc 1 2720 15 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2720 28
	orr	r3, r3, #64
	str	r3, [r4, #132]
	.loc 1 2721 9 is_stmt 1
.L421:
	.loc 1 2726 5
	.loc 1 2726 11 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2726 21
	ldr	r3, [r2]
	.loc 1 2726 28
	orr	r3, r3, #1024
	str	r3, [r2]
.L425:
	.loc 1 2727 5 is_stmt 1
	.loc 1 2729 7
	.loc 1 2729 12 is_stmt 0
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	str	r3, [sp, #4]
	.loc 1 2730 7 is_stmt 1
	.loc 1 2730 17 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 2730 10
	cbz	r3, .L444
	.loc 1 2735 59 is_stmt 1
	.loc 1 2735 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 2735 31
	ldr	r3, [r3]
	.loc 1 2735 59
	tst	r3, #512
	bne	.L425
	b	.L424
.L444:
	.loc 1 2732 9 is_stmt 1
	.loc 1 2732 15 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2732 28
	orr	r3, r3, #64
	str	r3, [r4, #132]
	.loc 1 2733 9 is_stmt 1
.L424:
	.loc 1 2738 5
	.loc 1 2738 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2738 23
	ldr	r3, [r2, #24]
	.loc 1 2738 31
	orr	r3, r3, #2048
	str	r3, [r2, #24]
.L427:
	.loc 1 2739 5 is_stmt 1
	.loc 1 2741 7
	.loc 1 2741 12 is_stmt 0
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	str	r3, [sp, #4]
	.loc 1 2742 7 is_stmt 1
	.loc 1 2742 17 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 2742 10
	cbz	r3, .L445
	.loc 1 2747 61 is_stmt 1
	.loc 1 2747 23 is_stmt 0
	ldr	r3, [r4]
	.loc 1 2747 33
	ldr	r3, [r3, #20]
	.loc 1 2747 61
	tst	r3, #2048
	bne	.L427
	b	.L419
.L445:
	.loc 1 2744 9 is_stmt 1
	.loc 1 2744 15 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2744 28
	orr	r3, r3, #64
	str	r3, [r4, #132]
	.loc 1 2745 9 is_stmt 1
.L419:
	.loc 1 2753 3
	.loc 1 2753 11 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2753 6
	cbz	r3, .L434
	.loc 1 2755 5 is_stmt 1
	.loc 1 2755 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2755 26
	ldr	r2, [r2, #8]
	.loc 1 2755 8
	tst	r2, #32768
	bne	.L446
	.loc 1 2774 7 is_stmt 1
	.loc 1 2774 39 is_stmt 0
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 2700 12
	movs	r5, #1
.LVL332:
.L428:
	.loc 1 2778 3 is_stmt 1
	.loc 1 2778 11 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2778 6
	cmp	r3, #0
	beq	.L437
	.loc 1 2780 5 is_stmt 1
	.loc 1 2780 16 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2780 26
	ldr	r2, [r2, #8]
	.loc 1 2780 8
	tst	r2, #16384
	bne	.L447
	.loc 1 2799 7 is_stmt 1
	.loc 1 2799 39 is_stmt 0
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 2701 12
	movs	r3, #1
.LVL333:
.L430:
	.loc 1 2804 3 is_stmt 1
	.loc 1 2804 6 is_stmt 0
	tst	r5, r3
	bne	.L448
	.loc 1 2707 13
	movs	r5, #0
.LVL334:
.L432:
	.loc 1 2832 3 is_stmt 1
	.loc 1 2833 1 is_stmt 0
	mov	r0, r5
	add	sp, sp, #12
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	@ sp needed
	pop	{r4, r5, pc}
.LVL335:
.L446:
	.cfi_restore_state
	.loc 1 2758 7 is_stmt 1
	.loc 1 2758 39 is_stmt 0
	ldr	r2, .L453+8
	str	r2, [r3, #80]
	.loc 1 2760 7 is_stmt 1
.LVL336:
	.loc 1 2763 7
	.loc 1 2763 11 is_stmt 0
	ldr	r0, [r4, #120]
.LVL337:
	bl	HAL_DMA_Abort_IT
.LVL338:
	.loc 1 2763 10
	cbnz	r0, .L449
	.loc 1 2760 25
	movs	r5, #0
	b	.L428
.L449:
	.loc 1 2765 9 is_stmt 1
	.loc 1 2765 13 is_stmt 0
	ldr	r0, [r4, #120]
	bl	HAL_DMA_GetError
.LVL339:
	.loc 1 2765 12
	cmp	r0, #128
	beq	.L450
	.loc 1 2760 25
	movs	r5, #0
	b	.L428
.L450:
	.loc 1 2767 11 is_stmt 1
.LVL340:
	.loc 1 2768 11
	.loc 1 2768 15 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 2768 43
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 2767 29
	movs	r5, #1
	b	.L428
.LVL341:
.L434:
	.loc 1 2700 12
	movs	r5, #1
	b	.L428
.LVL342:
.L447:
	.loc 1 2783 7 is_stmt 1
	.loc 1 2783 39 is_stmt 0
	ldr	r2, .L453+12
	str	r2, [r3, #80]
	.loc 1 2785 7 is_stmt 1
.LVL343:
	.loc 1 2788 7
	.loc 1 2788 11 is_stmt 0
	ldr	r0, [r4, #124]
	bl	HAL_DMA_Abort_IT
.LVL344:
	.loc 1 2788 10
	cbnz	r0, .L451
	.loc 1 2785 25
	movs	r3, #0
	b	.L430
.L451:
	.loc 1 2790 9 is_stmt 1
	.loc 1 2790 13 is_stmt 0
	ldr	r0, [r4, #124]
	bl	HAL_DMA_GetError
.LVL345:
	.loc 1 2790 12
	cmp	r0, #128
	beq	.L452
	.loc 1 2785 25
	movs	r3, #0
	b	.L430
.L452:
	.loc 1 2792 11 is_stmt 1
.LVL346:
	.loc 1 2793 11
	.loc 1 2793 15 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 2793 43
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 2792 29
	movs	r3, #1
	b	.L430
.L437:
	.loc 1 2701 12
	movs	r3, #1
	b	.L430
.LVL347:
.L448:
	.loc 1 2807 5 is_stmt 1
	mov	r0, r4
	bl	SPI_AbortTransfer
.LVL348:
	.loc 1 2810 5
	.loc 1 2810 16 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 2810 8
	tst	r3, #64
	bne	.L441
	.loc 1 2818 7 is_stmt 1
	.loc 1 2818 23 is_stmt 0
	movs	r5, #0
.LVL349:
	str	r5, [r4, #132]
.L433:
.LVL350:
	.loc 1 2822 5 is_stmt 1
	.loc 1 2822 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 2828 5 is_stmt 1
	mov	r0, r4
	bl	HAL_SPI_AbortCpltCallback
.LVL351:
	b	.L432
.LVL352:
.L441:
	.loc 1 2813 17 is_stmt 0
	movs	r5, #1
.LVL353:
	b	.L433
.L454:
	.align	2
.L453:
	.word	SystemCoreClock
	.word	91625969
	.word	SPI_DMATxAbortCallback
	.word	SPI_DMARxAbortCallback
	.cfi_endproc
.LFE349:
	.size	HAL_SPI_Abort_IT, .-HAL_SPI_Abort_IT
	.section	.text.SPI_DMARxAbortCallback,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_DMARxAbortCallback, %function
SPI_DMARxAbortCallback:
.LFB374:
	.loc 1 3566 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL354:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 3567 3
	.loc 1 3567 22 is_stmt 0
	ldr	r4, [r0, #56]
.LVL355:
	.loc 1 3569 3 is_stmt 1
	.loc 1 3569 7 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 3569 35
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 3572 3 is_stmt 1
	.loc 1 3572 11 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 3572 6
	cbz	r3, .L456
	.loc 1 3574 5 is_stmt 1
	.loc 1 3574 21 is_stmt 0
	ldr	r3, [r3, #80]
	.loc 1 3574 8
	cbnz	r3, .L455
.L456:
	.loc 1 3581 3 is_stmt 1
	mov	r0, r4
.LVL356:
	bl	SPI_AbortTransfer
.LVL357:
	.loc 1 3584 3
	.loc 1 3584 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 3590 3 is_stmt 1
	mov	r0, r4
	bl	HAL_SPI_AbortCpltCallback
.LVL358:
.L455:
	.loc 1 3592 1 is_stmt 0
	pop	{r4, pc}
	.cfi_endproc
.LFE374:
	.size	SPI_DMARxAbortCallback, .-SPI_DMARxAbortCallback
	.section	.text.SPI_DMATxAbortCallback,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SPI_DMATxAbortCallback, %function
SPI_DMATxAbortCallback:
.LFB373:
	.loc 1 3529 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL359:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 3530 3
	.loc 1 3530 22 is_stmt 0
	ldr	r4, [r0, #56]
.LVL360:
	.loc 1 3532 3 is_stmt 1
	.loc 1 3532 7 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 3532 35
	movs	r2, #0
	str	r2, [r3, #80]
	.loc 1 3535 3 is_stmt 1
	.loc 1 3535 11 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 3535 6
	cbz	r3, .L460
	.loc 1 3537 5 is_stmt 1
	.loc 1 3537 21 is_stmt 0
	ldr	r3, [r3, #80]
	.loc 1 3537 8
	cbnz	r3, .L459
.L460:
	.loc 1 3544 3 is_stmt 1
	mov	r0, r4
.LVL361:
	bl	SPI_AbortTransfer
.LVL362:
	.loc 1 3547 3
	.loc 1 3547 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 3553 3 is_stmt 1
	mov	r0, r4
	bl	HAL_SPI_AbortCpltCallback
.LVL363:
.L459:
	.loc 1 3555 1 is_stmt 0
	pop	{r4, pc}
	.cfi_endproc
.LFE373:
	.size	SPI_DMATxAbortCallback, .-SPI_DMATxAbortCallback
	.section	.text.HAL_SPI_SuspendCallback,"ax",%progbits
	.align	1
	.weak	HAL_SPI_SuspendCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_SuspendCallback, %function
HAL_SPI_SuspendCallback:
.LFB362:
	.loc 1 3269 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL364:
	.loc 1 3271 3
	.loc 1 3276 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE362:
	.size	HAL_SPI_SuspendCallback, .-HAL_SPI_SuspendCallback
	.section	.text.HAL_SPI_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_SPI_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_IRQHandler, %function
HAL_SPI_IRQHandler:
.LFB353:
	.loc 1 2887 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL365:
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 4, -28
	.cfi_offset 5, -24
	.cfi_offset 6, -20
	.cfi_offset 7, -16
	.cfi_offset 8, -12
	.cfi_offset 9, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 2888 3
	.loc 1 2888 27 is_stmt 0
	ldr	r6, [r0]
	.loc 1 2888 12
	ldr	r2, [r6, #16]
.LVL366:
	.loc 1 2889 3 is_stmt 1
	.loc 1 2889 12 is_stmt 0
	ldr	r3, [r6, #20]
.LVL367:
	.loc 1 2890 3 is_stmt 1
	.loc 1 2890 12 is_stmt 0
	and	r5, r2, r3
.LVL368:
	.loc 1 2891 3 is_stmt 1
	.loc 1 2891 12 is_stmt 0
	ldr	r9, [r6, #8]
.LVL369:
	.loc 1 2892 3 is_stmt 1
	.loc 1 2894 3
	.loc 1 2894 24 is_stmt 0
	ldrb	r7, [r0, #129]	@ zero_extendqisi2
	uxtb	r7, r7
.LVL370:
	.loc 1 2896 3 is_stmt 1
	.loc 1 2900 3
	.loc 1 2900 6 is_stmt 0
	tst	r3, #2048
	beq	.L465
	.loc 1 2900 63 discriminator 1
	tst	r2, #8
	bne	.L492
.L465:
	.loc 1 2915 3 is_stmt 1
	.loc 1 2915 90 is_stmt 0
	and	r3, r5, #100
.LVL371:
	.loc 1 2915 6
	cmp	r3, #4
	beq	.L493
	.loc 1 2892 12
	movs	r3, #0
.LVL372:
.L467:
	.loc 1 2924 3 is_stmt 1
	.loc 1 2924 105 is_stmt 0
	and	r8, r5, #69
	.loc 1 2924 6
	cmp	r8, #1
	beq	.L494
.LVL373:
.L468:
	.loc 1 2932 3 is_stmt 1
	.loc 1 2932 105 is_stmt 0
	and	r2, r5, #38
	.loc 1 2932 6
	cmp	r2, #2
	beq	.L495
	.loc 1 2947 3 is_stmt 1
	.loc 1 2947 6 is_stmt 0
	cmp	r3, #0
	bne	.L464
	.loc 1 2953 3 is_stmt 1
	.loc 1 2953 6 is_stmt 0
	tst	r5, #8
	beq	.L472
	.loc 1 2956 5 is_stmt 1
	.loc 1 2956 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2956 23
	ldr	r3, [r2, #24]
.LVL374:
	.loc 1 2956 31
	orr	r3, r3, #8
	str	r3, [r2, #24]
	.loc 1 2957 5 is_stmt 1
	.loc 1 2957 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2957 23
	ldr	r3, [r2, #24]
	.loc 1 2957 31
	orr	r3, r3, #16
	str	r3, [r2, #24]
	.loc 1 2958 5 is_stmt 1
	.loc 1 2958 13 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2958 23
	ldr	r3, [r2, #24]
	.loc 1 2958 31
	orr	r3, r3, #2048
	str	r3, [r2, #24]
	.loc 1 2961 5 is_stmt 1
	.loc 1 2961 12 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2961 22
	ldr	r3, [r2, #16]
	.loc 1 2961 28
	bic	r3, r3, #8
	str	r3, [r2, #16]
	.loc 1 2964 5 is_stmt 1
	.loc 1 2964 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 2964 26
	ldr	r3, [r3, #8]
	.loc 1 2964 8
	tst	r3, #49152
	beq	.L473
.L474:
	.loc 1 2997 5 is_stmt 1
	mov	r0, r4
	bl	SPI_CloseTransfer
.LVL375:
	.loc 1 2999 5
	.loc 1 2999 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 3000 5 is_stmt 1
	.loc 1 3000 13 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 3000 8
	cmp	r3, #0
	bne	.L496
	.loc 1 3026 5 is_stmt 1
	.loc 1 3026 8 is_stmt 0
	cmp	r7, #5
	beq	.L497
	.loc 1 3030 10 is_stmt 1
	.loc 1 3030 13 is_stmt 0
	cmp	r7, #4
	beq	.L498
	.loc 1 3034 10 is_stmt 1
	.loc 1 3034 13 is_stmt 0
	cmp	r7, #3
	bne	.L464
	.loc 1 3036 7 is_stmt 1
	mov	r0, r4
	bl	HAL_SPI_TxCpltCallback
.LVL376:
	.loc 1 3042 5
	.loc 1 3044 5
	b	.L464
.LVL377:
.L492:
	.loc 1 2903 5
	.loc 1 2903 23 is_stmt 0
	ldr	r3, [r6, #24]
.LVL378:
	.loc 1 2903 31
	orr	r3, r3, #2048
	str	r3, [r6, #24]
	.loc 1 2909 5 is_stmt 1
	bl	HAL_SPI_SuspendCallback
.LVL379:
	.loc 1 2911 5
	b	.L464
.LVL380:
.L493:
	.loc 1 2918 5
	.loc 1 2918 9 is_stmt 0
	ldr	r3, [r4, #116]
	.loc 1 2918 5
	mov	r0, r4
.LVL381:
	blx	r3
.LVL382:
	.loc 1 2919 5 is_stmt 1
	.loc 1 2919 9 is_stmt 0
	ldr	r3, [r4, #112]
	.loc 1 2919 5
	mov	r0, r4
	blx	r3
.LVL383:
	.loc 1 2920 5 is_stmt 1
	.loc 1 2920 13 is_stmt 0
	movs	r3, #1
	b	.L467
.LVL384:
.L494:
	.loc 1 2927 5 is_stmt 1
	.loc 1 2927 9 is_stmt 0
	ldr	r3, [r4, #112]
.LVL385:
	.loc 1 2927 5
	mov	r0, r4
	blx	r3
.LVL386:
	.loc 1 2928 5 is_stmt 1
	.loc 1 2928 13 is_stmt 0
	mov	r3, r8
	b	.L468
.LVL387:
.L495:
	.loc 1 2935 5 is_stmt 1
	.loc 1 2935 9 is_stmt 0
	ldr	r3, [r4, #116]
.LVL388:
	.loc 1 2935 5
	mov	r0, r4
	blx	r3
.LVL389:
	.loc 1 2936 5 is_stmt 1
	.loc 1 2947 3
.L464:
	.loc 1 3131 1 is_stmt 0
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.LVL390:
.L475:
	.loc 1 2976 14 is_stmt 1
	.loc 1 2976 17 is_stmt 0
	cmp	r3, #7
	bls	.L477
	.loc 1 2979 11 is_stmt 1
	.loc 1 2979 29 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 2979 45
	ldrh	r2, [r6, #48]
	.loc 1 2979 43
	strh	r2, [r3]	@ movhi
	.loc 1 2983 11 is_stmt 1
	.loc 1 2983 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 2983 28
	adds	r3, r3, #2
	str	r3, [r4, #100]
.L476:
	.loc 1 2992 9 is_stmt 1
	.loc 1 2992 13 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 2992 26
	subs	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #106]	@ movhi
.L473:
	.loc 1 2967 32 is_stmt 1
	.loc 1 2967 18 is_stmt 0
	ldrh	r3, [r4, #106]
	uxth	r3, r3
	.loc 1 2967 32
	cmp	r3, #0
	beq	.L474
	.loc 1 2970 9 is_stmt 1
	.loc 1 2970 23 is_stmt 0
	ldr	r3, [r4, #12]
	.loc 1 2970 12
	cmp	r3, #15
	bls	.L475
	.loc 1 2972 11 is_stmt 1
	.loc 1 2972 73 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2972 29
	ldr	r3, [r4, #100]
	.loc 1 2972 45
	ldr	r2, [r2, #48]
	.loc 1 2972 43
	str	r2, [r3]
	.loc 1 2973 11 is_stmt 1
	.loc 1 2973 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 2973 28
	adds	r3, r3, #4
	str	r3, [r4, #100]
	b	.L476
.L477:
	.loc 1 2988 11 is_stmt 1
	.loc 1 2988 71 is_stmt 0
	ldr	r2, [r4]
	.loc 1 2988 28
	ldr	r3, [r4, #100]
	.loc 1 2988 44
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	.loc 1 2988 42
	strb	r2, [r3]
	.loc 1 2989 11 is_stmt 1
	.loc 1 2989 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 2989 28
	adds	r3, r3, #1
	str	r3, [r4, #100]
	b	.L476
.L496:
	.loc 1 3005 7 is_stmt 1
	mov	r0, r4
	bl	HAL_SPI_ErrorCallback
.LVL391:
	.loc 1 3007 7
	b	.L464
.L497:
	.loc 1 3028 7
	mov	r0, r4
	bl	HAL_SPI_TxRxCpltCallback
.LVL392:
	b	.L464
.L498:
	.loc 1 3032 7
	mov	r0, r4
	bl	HAL_SPI_RxCpltCallback
.LVL393:
	b	.L464
.LVL394:
.L472:
	.loc 1 3048 3
	.loc 1 3048 6 is_stmt 0
	tst	r5, #864
	beq	.L464
	.loc 1 3051 5 is_stmt 1
	.loc 1 3051 8 is_stmt 0
	tst	r5, #64
	beq	.L483
	.loc 1 3053 7 is_stmt 1
	.loc 1 3053 13 is_stmt 0
	ldr	r3, [r4, #132]
.LVL395:
	.loc 1 3053 26
	orr	r3, r3, #4
	str	r3, [r4, #132]
	.loc 1 3054 7 is_stmt 1
	.loc 1 3054 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 3054 25
	ldr	r3, [r2, #24]
	.loc 1 3054 33
	orr	r3, r3, #64
	str	r3, [r2, #24]
.L483:
	.loc 1 3058 5 is_stmt 1
	.loc 1 3058 8 is_stmt 0
	tst	r5, #512
	beq	.L484
	.loc 1 3060 7 is_stmt 1
	.loc 1 3060 13 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 3060 26
	orr	r3, r3, #1
	str	r3, [r4, #132]
	.loc 1 3061 7 is_stmt 1
	.loc 1 3061 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 3061 25
	ldr	r3, [r2, #24]
	.loc 1 3061 33
	orr	r3, r3, #512
	str	r3, [r2, #24]
.L484:
	.loc 1 3061 67 is_stmt 1 discriminator 1
	.loc 1 3065 5 discriminator 1
	.loc 1 3065 8 is_stmt 0 discriminator 1
	tst	r5, #256
	beq	.L485
	.loc 1 3067 7 is_stmt 1
	.loc 1 3067 13 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 3067 26
	orr	r3, r3, #8
	str	r3, [r4, #132]
	.loc 1 3068 7 is_stmt 1
	.loc 1 3068 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 3068 25
	ldr	r3, [r2, #24]
	.loc 1 3068 33
	orr	r3, r3, #256
	str	r3, [r2, #24]
.L485:
	.loc 1 3072 5 is_stmt 1
	.loc 1 3072 8 is_stmt 0
	tst	r5, #32
	beq	.L486
	.loc 1 3074 7 is_stmt 1
	.loc 1 3074 13 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 3074 26
	orr	r3, r3, #128
	str	r3, [r4, #132]
	.loc 1 3075 7 is_stmt 1
	.loc 1 3075 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 3075 25
	ldr	r3, [r2, #24]
	.loc 1 3075 33
	orr	r3, r3, #32
	str	r3, [r2, #24]
.L486:
	.loc 1 3078 5 is_stmt 1
	.loc 1 3078 13 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 3078 8
	cmp	r3, #0
	beq	.L464
	.loc 1 3081 7 is_stmt 1
	.loc 1 3081 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 3081 25
	ldr	r3, [r2]
	.loc 1 3081 32
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 3084 7 is_stmt 1
	.loc 1 3084 14 is_stmt 0
	ldr	r2, [r4]
	.loc 1 3084 24
	ldr	r1, [r2, #16]
	.loc 1 3084 30
	ldr	r3, .L499
	ands	r3, r3, r1
	str	r3, [r2, #16]
	.loc 1 3088 7 is_stmt 1
	.loc 1 3088 20 is_stmt 0
	and	r9, r9, #49152
.LVL396:
	.loc 1 3088 10
	cmp	r9, #49152
	bne	.L488
	.loc 1 3091 9 is_stmt 1
	.loc 1 3091 15 is_stmt 0
	ldr	r2, [r4]
	.loc 1 3091 25
	ldr	r3, [r2, #8]
	.loc 1 3091 33
	bic	r3, r3, #49152
	str	r3, [r2, #8]
	.loc 1 3094 9 is_stmt 1
	.loc 1 3094 17 is_stmt 0
	ldr	r3, [r4, #124]
	.loc 1 3094 12
	cbz	r3, .L489
	.loc 1 3098 11 is_stmt 1
	.loc 1 3098 43 is_stmt 0
	ldr	r2, .L499+4
	str	r2, [r3, #80]
	.loc 1 3099 11 is_stmt 1
	.loc 1 3099 25 is_stmt 0
	ldr	r0, [r4, #124]
	bl	HAL_DMA_Abort_IT
.LVL397:
	.loc 1 3099 14
	cbz	r0, .L489
	.loc 1 3101 13 is_stmt 1
	.loc 1 3101 19 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 3101 32
	orr	r3, r3, #64
	str	r3, [r4, #132]
.L489:
	.loc 1 3105 9 is_stmt 1
	.loc 1 3105 17 is_stmt 0
	ldr	r3, [r4, #120]
	.loc 1 3105 12
	cmp	r3, #0
	beq	.L464
	.loc 1 3109 11 is_stmt 1
	.loc 1 3109 43 is_stmt 0
	ldr	r2, .L499+4
	str	r2, [r3, #80]
	.loc 1 3110 11 is_stmt 1
	.loc 1 3110 25 is_stmt 0
	ldr	r0, [r4, #120]
	bl	HAL_DMA_Abort_IT
.LVL398:
	.loc 1 3110 14
	cmp	r0, #0
	beq	.L464
	.loc 1 3112 13 is_stmt 1
	.loc 1 3112 19 is_stmt 0
	ldr	r3, [r4, #132]
	.loc 1 3112 32
	orr	r3, r3, #64
	str	r3, [r4, #132]
	b	.L464
.L488:
	.loc 1 3119 9 is_stmt 1
	.loc 1 3119 21 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #129]
	.loc 1 3125 9 is_stmt 1
	mov	r0, r4
	bl	HAL_SPI_ErrorCallback
.LVL399:
	.loc 1 3129 5
	b	.L464
.L500:
	.align	2
.L499:
	.word	-876
	.word	SPI_DMAAbortOnError
	.cfi_endproc
.LFE353:
	.size	HAL_SPI_IRQHandler, .-HAL_SPI_IRQHandler
	.section	.text.HAL_SPI_GetState,"ax",%progbits
	.align	1
	.global	HAL_SPI_GetState
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_GetState, %function
HAL_SPI_GetState:
.LFB363:
	.loc 1 3304 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL400:
	.loc 1 3306 3
	.loc 1 3306 14 is_stmt 0
	ldrb	r0, [r0, #129]	@ zero_extendqisi2
.LVL401:
	.loc 1 3307 1
	bx	lr
	.cfi_endproc
.LFE363:
	.size	HAL_SPI_GetState, .-HAL_SPI_GetState
	.section	.text.HAL_SPI_GetError,"ax",%progbits
	.align	1
	.global	HAL_SPI_GetError
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_GetError, %function
HAL_SPI_GetError:
.LFB364:
	.loc 1 3316 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL402:
	.loc 1 3318 3
	.loc 1 3318 14 is_stmt 0
	ldr	r0, [r0, #132]
.LVL403:
	.loc 1 3319 1
	bx	lr
	.cfi_endproc
.LFE364:
	.size	HAL_SPI_GetError, .-HAL_SPI_GetError
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h7xx.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dma.h"
	.file 8 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_spi.h"
	.file 9 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/system_stm32h7xx.h"
	.file 10 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x18e5
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x20
	.4byte	.LASF220
	.byte	0x1d
	.4byte	.LASF221
	.4byte	.LASF222
	.4byte	.LLRL95
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0xe
	.byte	0x2
	.byte	0x5
	.4byte	.LASF0
	.uleb128 0xe
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0xc
	.4byte	.LASF3
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x40
	.uleb128 0xe
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0xc
	.4byte	.LASF4
	.byte	0x2
	.byte	0x39
	.byte	0x1c
	.4byte	0x53
	.uleb128 0xe
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0xe
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0xc
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x6d
	.uleb128 0xe
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0xe
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0xe
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x21
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0xe
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0xc
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x34
	.uleb128 0x1b
	.4byte	0x90
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x3
	.byte	0x24
	.byte	0x14
	.4byte	0x47
	.uleb128 0x17
	.4byte	0xa1
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x61
	.uleb128 0x17
	.4byte	0xb2
	.uleb128 0x22
	.4byte	.LASF223
	.byte	0x9
	.byte	0x39
	.byte	0x11
	.4byte	0xb2
	.uleb128 0x14
	.byte	0x4
	.2byte	0x250
	.4byte	0xe4
	.uleb128 0x13
	.ascii	"CCR\000"
	.2byte	0x252
	.4byte	0xbe
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF15
	.2byte	0x253
	.byte	0x2
	.4byte	0xcf
	.uleb128 0x14
	.byte	0x8
	.2byte	0x255
	.4byte	0x111
	.uleb128 0x13
	.ascii	"CSR\000"
	.2byte	0x257
	.4byte	0xbe
	.byte	0
	.uleb128 0x13
	.ascii	"CFR\000"
	.2byte	0x258
	.4byte	0xbe
	.byte	0x4
	.byte	0
	.uleb128 0x15
	.4byte	.LASF16
	.2byte	0x259
	.byte	0x2
	.4byte	0xf0
	.uleb128 0x14
	.byte	0x4
	.2byte	0x25b
	.4byte	0x133
	.uleb128 0xb
	.4byte	.LASF17
	.2byte	0x25d
	.byte	0x15
	.4byte	0xbe
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF18
	.2byte	0x25e
	.byte	0x2
	.4byte	0x11d
	.uleb128 0x14
	.byte	0x8
	.2byte	0x260
	.4byte	0x162
	.uleb128 0xb
	.4byte	.LASF19
	.2byte	0x262
	.byte	0x15
	.4byte	0xbe
	.byte	0
	.uleb128 0xb
	.4byte	.LASF20
	.2byte	0x263
	.byte	0x15
	.4byte	0xbe
	.byte	0x4
	.byte	0
	.uleb128 0x15
	.4byte	.LASF21
	.2byte	0x264
	.byte	0x2
	.4byte	0x13f
	.uleb128 0x23
	.4byte	0xb2
	.4byte	0x17e
	.uleb128 0x24
	.4byte	0x89
	.byte	0x2
	.byte	0
	.uleb128 0x14
	.byte	0x54
	.2byte	0x5c3
	.4byte	0x25f
	.uleb128 0x13
	.ascii	"CR1\000"
	.2byte	0x5c5
	.4byte	0xbe
	.byte	0
	.uleb128 0x13
	.ascii	"CR2\000"
	.2byte	0x5c6
	.4byte	0xbe
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF22
	.2byte	0x5c7
	.byte	0x15
	.4byte	0xbe
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF23
	.2byte	0x5c8
	.byte	0x15
	.4byte	0xbe
	.byte	0xc
	.uleb128 0x13
	.ascii	"IER\000"
	.2byte	0x5c9
	.4byte	0xbe
	.byte	0x10
	.uleb128 0x13
	.ascii	"SR\000"
	.2byte	0x5ca
	.4byte	0xbe
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF24
	.2byte	0x5cb
	.byte	0x15
	.4byte	0xbe
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF25
	.2byte	0x5cc
	.byte	0xc
	.4byte	0xb2
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF26
	.2byte	0x5cd
	.byte	0x15
	.4byte	0xbe
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF27
	.2byte	0x5ce
	.byte	0xc
	.4byte	0x16e
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF28
	.2byte	0x5cf
	.byte	0x15
	.4byte	0xbe
	.byte	0x30
	.uleb128 0xb
	.4byte	.LASF29
	.2byte	0x5d0
	.byte	0xc
	.4byte	0x16e
	.byte	0x34
	.uleb128 0xb
	.4byte	.LASF30
	.2byte	0x5d1
	.byte	0x15
	.4byte	0xbe
	.byte	0x40
	.uleb128 0xb
	.4byte	.LASF31
	.2byte	0x5d2
	.byte	0x15
	.4byte	0xbe
	.byte	0x44
	.uleb128 0xb
	.4byte	.LASF32
	.2byte	0x5d3
	.byte	0x15
	.4byte	0xbe
	.byte	0x48
	.uleb128 0xb
	.4byte	.LASF33
	.2byte	0x5d4
	.byte	0x15
	.4byte	0xbe
	.byte	0x4c
	.uleb128 0xb
	.4byte	.LASF34
	.2byte	0x5d5
	.byte	0x15
	.4byte	0xbe
	.byte	0x50
	.byte	0
	.uleb128 0x15
	.4byte	.LASF35
	.2byte	0x5d7
	.byte	0x3
	.4byte	0x17e
	.uleb128 0x16
	.4byte	0x40
	.byte	0x5
	.byte	0xb5
	.4byte	0x283
	.uleb128 0x7
	.4byte	.LASF36
	.byte	0
	.uleb128 0x25
	.ascii	"SET\000"
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x5
	.byte	0xb8
	.byte	0x3
	.4byte	0x26b
	.uleb128 0xe
	.byte	0x8
	.byte	0x4
	.4byte	.LASF38
	.uleb128 0x26
	.byte	0x4
	.uleb128 0xe
	.byte	0x1
	.byte	0x8
	.4byte	.LASF39
	.uleb128 0xe
	.byte	0x4
	.byte	0x4
	.4byte	.LASF40
	.uleb128 0xe
	.byte	0x8
	.byte	0x4
	.4byte	.LASF41
	.uleb128 0x16
	.4byte	0x40
	.byte	0x6
	.byte	0x28
	.4byte	0x2d1
	.uleb128 0x7
	.4byte	.LASF42
	.byte	0
	.uleb128 0x7
	.4byte	.LASF43
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF44
	.byte	0x2
	.uleb128 0x7
	.4byte	.LASF45
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.4byte	.LASF46
	.byte	0x6
	.byte	0x2d
	.byte	0x3
	.4byte	0x2ad
	.uleb128 0x16
	.4byte	0x40
	.byte	0x6
	.byte	0x33
	.4byte	0x2f5
	.uleb128 0x7
	.4byte	.LASF47
	.byte	0
	.uleb128 0x7
	.4byte	.LASF48
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.4byte	.LASF49
	.byte	0x6
	.byte	0x36
	.byte	0x3
	.4byte	0x2dd
	.uleb128 0x1c
	.byte	0x30
	.byte	0x7
	.byte	0x30
	.4byte	0x3a6
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0x7
	.byte	0x32
	.byte	0xc
	.4byte	0xb2
	.byte	0
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0x7
	.byte	0x35
	.byte	0xc
	.4byte	0xb2
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0x7
	.byte	0x39
	.byte	0xc
	.4byte	0xb2
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x7
	.byte	0x3c
	.byte	0xc
	.4byte	0xb2
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x7
	.byte	0x3f
	.byte	0xc
	.4byte	0xb2
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0x7
	.byte	0x42
	.byte	0xc
	.4byte	0xb2
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF56
	.byte	0x7
	.byte	0x45
	.byte	0xc
	.4byte	0xb2
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0x7
	.byte	0x4a
	.byte	0xc
	.4byte	0xb2
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF58
	.byte	0x7
	.byte	0x4d
	.byte	0xc
	.4byte	0xb2
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF59
	.byte	0x7
	.byte	0x52
	.byte	0xc
	.4byte	0xb2
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF60
	.byte	0x7
	.byte	0x55
	.byte	0xc
	.4byte	0xb2
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x7
	.byte	0x5b
	.byte	0xc
	.4byte	0xb2
	.byte	0x2c
	.byte	0
	.uleb128 0xc
	.4byte	.LASF62
	.byte	0x7
	.byte	0x60
	.byte	0x2
	.4byte	0x301
	.uleb128 0x16
	.4byte	0x40
	.byte	0x7
	.byte	0x66
	.4byte	0x3dc
	.uleb128 0x7
	.4byte	.LASF63
	.byte	0
	.uleb128 0x7
	.4byte	.LASF64
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF65
	.byte	0x2
	.uleb128 0x7
	.4byte	.LASF66
	.byte	0x3
	.uleb128 0x7
	.4byte	.LASF67
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	.LASF68
	.byte	0x7
	.byte	0x6c
	.byte	0x2
	.4byte	0x3b2
	.uleb128 0x17
	.4byte	0x3dc
	.uleb128 0x1d
	.4byte	.LASF119
	.byte	0x78
	.byte	0x7
	.byte	0x88
	.4byte	0x4fe
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x7
	.byte	0x8a
	.byte	0x9
	.4byte	0x296
	.byte	0
	.uleb128 0x1
	.4byte	.LASF70
	.byte	0x7
	.byte	0x8c
	.byte	0x13
	.4byte	0x3a6
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF71
	.byte	0x7
	.byte	0x8e
	.byte	0x13
	.4byte	0x2f5
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0x7
	.byte	0x90
	.byte	0x21
	.4byte	0x3e8
	.byte	0x35
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x7
	.byte	0x92
	.byte	0x9
	.4byte	0x296
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x7
	.byte	0x94
	.byte	0xb
	.4byte	0x50e
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF75
	.byte	0x7
	.byte	0x96
	.byte	0xb
	.4byte	0x50e
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0x7
	.byte	0x98
	.byte	0xb
	.4byte	0x50e
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF77
	.byte	0x7
	.byte	0x9a
	.byte	0xb
	.4byte	0x50e
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0x7
	.byte	0x9c
	.byte	0xb
	.4byte	0x50e
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x7
	.byte	0x9e
	.byte	0xb
	.4byte	0x50e
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF80
	.byte	0x7
	.byte	0xa0
	.byte	0x14
	.4byte	0xbe
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF81
	.byte	0x7
	.byte	0xa2
	.byte	0xb
	.4byte	0xb2
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF82
	.byte	0x7
	.byte	0xa4
	.byte	0xb
	.4byte	0xb2
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0x7
	.byte	0xa6
	.byte	0x1a
	.4byte	0x513
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF84
	.byte	0x7
	.byte	0xa8
	.byte	0x20
	.4byte	0x518
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF85
	.byte	0x7
	.byte	0xaa
	.byte	0xb
	.4byte	0xb2
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF86
	.byte	0x7
	.byte	0xad
	.byte	0x1d
	.4byte	0x51d
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF87
	.byte	0x7
	.byte	0xaf
	.byte	0x23
	.4byte	0x522
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF88
	.byte	0x7
	.byte	0xb1
	.byte	0xb
	.4byte	0xb2
	.byte	0x74
	.byte	0
	.uleb128 0x1e
	.4byte	0x509
	.uleb128 0x12
	.4byte	0x509
	.byte	0
	.uleb128 0xd
	.4byte	0x3ed
	.uleb128 0xd
	.4byte	0x4fe
	.uleb128 0xd
	.4byte	0xe4
	.uleb128 0xd
	.4byte	0x111
	.uleb128 0xd
	.4byte	0x133
	.uleb128 0xd
	.4byte	0x162
	.uleb128 0xc
	.4byte	.LASF89
	.byte	0x7
	.byte	0xb3
	.byte	0x2
	.4byte	0x3ed
	.uleb128 0xd
	.4byte	0x527
	.uleb128 0xd
	.4byte	0x90
	.uleb128 0xd
	.4byte	0x9c
	.uleb128 0xd
	.4byte	0x25f
	.uleb128 0x1c
	.byte	0x58
	.byte	0x8
	.byte	0x2e
	.4byte	0x66e
	.uleb128 0x1
	.4byte	.LASF56
	.byte	0x8
	.byte	0x30
	.byte	0xc
	.4byte	0xb2
	.byte	0
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0x8
	.byte	0x33
	.byte	0xc
	.4byte	0xb2
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF90
	.byte	0x8
	.byte	0x36
	.byte	0xc
	.4byte	0xb2
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF91
	.byte	0x8
	.byte	0x39
	.byte	0xc
	.4byte	0xb2
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x8
	.byte	0x3c
	.byte	0xc
	.4byte	0xb2
	.byte	0x10
	.uleb128 0x27
	.ascii	"NSS\000"
	.byte	0x8
	.byte	0x3f
	.byte	0xc
	.4byte	0xb2
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0x8
	.byte	0x44
	.byte	0xc
	.4byte	0xb2
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF94
	.byte	0x8
	.byte	0x4a
	.byte	0xc
	.4byte	0xb2
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF95
	.byte	0x8
	.byte	0x4d
	.byte	0xc
	.4byte	0xb2
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF96
	.byte	0x8
	.byte	0x50
	.byte	0xc
	.4byte	0xb2
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF97
	.byte	0x8
	.byte	0x53
	.byte	0xc
	.4byte	0xb2
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF98
	.byte	0x8
	.byte	0x57
	.byte	0xc
	.4byte	0xb2
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF99
	.byte	0x8
	.byte	0x5a
	.byte	0xc
	.4byte	0xb2
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF100
	.byte	0x8
	.byte	0x60
	.byte	0xc
	.4byte	0xb2
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF101
	.byte	0x8
	.byte	0x64
	.byte	0xc
	.4byte	0xb2
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF102
	.byte	0x8
	.byte	0x67
	.byte	0xc
	.4byte	0xb2
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF103
	.byte	0x8
	.byte	0x6b
	.byte	0xc
	.4byte	0xb2
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF104
	.byte	0x8
	.byte	0x6f
	.byte	0xc
	.4byte	0xb2
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF105
	.byte	0x8
	.byte	0x74
	.byte	0xc
	.4byte	0xb2
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF106
	.byte	0x8
	.byte	0x79
	.byte	0xc
	.4byte	0xb2
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF107
	.byte	0x8
	.byte	0x7d
	.byte	0xc
	.4byte	0xb2
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF108
	.byte	0x8
	.byte	0x80
	.byte	0xc
	.4byte	0xb2
	.byte	0x54
	.byte	0
	.uleb128 0xc
	.4byte	.LASF109
	.byte	0x8
	.byte	0x82
	.byte	0x3
	.4byte	0x547
	.uleb128 0x16
	.4byte	0x40
	.byte	0x8
	.byte	0x88
	.4byte	0x6b6
	.uleb128 0x7
	.4byte	.LASF110
	.byte	0
	.uleb128 0x7
	.4byte	.LASF111
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF112
	.byte	0x2
	.uleb128 0x7
	.4byte	.LASF113
	.byte	0x3
	.uleb128 0x7
	.4byte	.LASF114
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0x7
	.4byte	.LASF116
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF117
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.4byte	.LASF118
	.byte	0x8
	.byte	0x91
	.byte	0x3
	.4byte	0x67a
	.uleb128 0x17
	.4byte	0x6b6
	.uleb128 0x1d
	.4byte	.LASF120
	.byte	0x88
	.byte	0x8
	.byte	0xa9
	.4byte	0x7a4
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x8
	.byte	0xab
	.byte	0x10
	.4byte	0x542
	.byte	0
	.uleb128 0x1
	.4byte	.LASF70
	.byte	0x8
	.byte	0xad
	.byte	0x13
	.4byte	0x66e
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF121
	.byte	0x8
	.byte	0xaf
	.byte	0x12
	.4byte	0x53d
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF122
	.byte	0x8
	.byte	0xb1
	.byte	0xc
	.4byte	0xa1
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF123
	.byte	0x8
	.byte	0xb3
	.byte	0x15
	.4byte	0xad
	.byte	0x62
	.uleb128 0x1
	.4byte	.LASF124
	.byte	0x8
	.byte	0xb5
	.byte	0xc
	.4byte	0x538
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF125
	.byte	0x8
	.byte	0xb7
	.byte	0xc
	.4byte	0xa1
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF126
	.byte	0x8
	.byte	0xb9
	.byte	0x15
	.4byte	0xad
	.byte	0x6a
	.uleb128 0x1
	.4byte	.LASF127
	.byte	0x8
	.byte	0xbb
	.byte	0xc
	.4byte	0xb2
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF128
	.byte	0x8
	.byte	0xbd
	.byte	0xa
	.4byte	0x7b4
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF129
	.byte	0x8
	.byte	0xbf
	.byte	0xa
	.4byte	0x7b4
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF130
	.byte	0x8
	.byte	0xc1
	.byte	0x16
	.4byte	0x533
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF131
	.byte	0x8
	.byte	0xc3
	.byte	0x16
	.4byte	0x533
	.byte	0x7c
	.uleb128 0x1
	.4byte	.LASF71
	.byte	0x8
	.byte	0xc5
	.byte	0x13
	.4byte	0x2f5
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0x8
	.byte	0xc7
	.byte	0x21
	.4byte	0x6c2
	.byte	0x81
	.uleb128 0x1
	.4byte	.LASF80
	.byte	0x8
	.byte	0xc9
	.byte	0x15
	.4byte	0xbe
	.byte	0x84
	.byte	0
	.uleb128 0x1e
	.4byte	0x7af
	.uleb128 0x12
	.4byte	0x7af
	.byte	0
	.uleb128 0xd
	.4byte	0x6c7
	.uleb128 0xd
	.4byte	0x7a4
	.uleb128 0xc
	.4byte	.LASF132
	.byte	0x8
	.byte	0xdf
	.byte	0x3
	.4byte	0x6c7
	.uleb128 0x1b
	.4byte	0x7b9
	.uleb128 0x18
	.4byte	.LASF133
	.2byte	0x4b0
	.byte	0x13
	.4byte	0x2d1
	.4byte	0x7e0
	.uleb128 0x12
	.4byte	0x533
	.byte	0
	.uleb128 0x18
	.4byte	.LASF134
	.2byte	0x4af
	.byte	0x13
	.4byte	0x2d1
	.4byte	0x7f6
	.uleb128 0x12
	.4byte	0x533
	.byte	0
	.uleb128 0x18
	.4byte	.LASF135
	.2byte	0x4bf
	.byte	0xa
	.4byte	0xb2
	.4byte	0x80c
	.uleb128 0x12
	.4byte	0x533
	.byte	0
	.uleb128 0x18
	.4byte	.LASF136
	.2byte	0x4ae
	.byte	0x13
	.4byte	0x2d1
	.4byte	0x831
	.uleb128 0x12
	.4byte	0x533
	.uleb128 0x12
	.4byte	0xb2
	.uleb128 0x12
	.4byte	0xb2
	.uleb128 0x12
	.4byte	0xb2
	.byte	0
	.uleb128 0x28
	.4byte	.LASF224
	.byte	0xa
	.2byte	0x433
	.byte	0xa
	.4byte	0xb2
	.uleb128 0x1f
	.4byte	.LASF139
	.2byte	0xf95
	.byte	0x11
	.4byte	0xb2
	.4byte	.LFB384
	.4byte	.LFE384-.LFB384
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x889
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0xf95
	.byte	0x3c
	.4byte	0x889
	.4byte	.LLST3
	.uleb128 0x10
	.4byte	.LASF137
	.2byte	0xf97
	.byte	0xc
	.4byte	0xb2
	.uleb128 0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.uleb128 0x5
	.4byte	.LASF138
	.2byte	0xf98
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST4
	.byte	0
	.uleb128 0xd
	.4byte	0x7c5
	.uleb128 0x1f
	.4byte	.LASF140
	.2byte	0xf80
	.byte	0x1a
	.4byte	0x2d1
	.4byte	.LFB383
	.4byte	.LFE383-.LFB383
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x902
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0xf80
	.byte	0x4e
	.4byte	0x889
	.4byte	.LLST5
	.uleb128 0x2
	.4byte	.LASF142
	.2byte	0xf80
	.byte	0x5d
	.4byte	0xb2
	.4byte	.LLST6
	.uleb128 0x2
	.4byte	.LASF143
	.2byte	0xf80
	.byte	0x6e
	.4byte	0x283
	.4byte	.LLST7
	.uleb128 0x2
	.4byte	.LASF144
	.2byte	0xf81
	.byte	0x3e
	.4byte	0xb2
	.4byte	.LLST8
	.uleb128 0x2
	.4byte	.LASF145
	.2byte	0xf81
	.byte	0x50
	.4byte	0xb2
	.4byte	.LLST9
	.uleb128 0x4
	.4byte	.LVL24
	.4byte	0x831
	.byte	0
	.uleb128 0x9
	.4byte	.LASF147
	.2byte	0xf33
	.4byte	.LFB382
	.4byte	.LFE382-.LFB382
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x936
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xf33
	.byte	0x32
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.4byte	.LASF146
	.2byte	0xf35
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST2
	.byte	0
	.uleb128 0xd
	.4byte	0x7b9
	.uleb128 0x9
	.4byte	.LASF148
	.2byte	0xf0c
	.4byte	.LFB381
	.4byte	.LFE381-.LFB381
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x95f
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xf0c
	.byte	0x32
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x9
	.4byte	.LASF149
	.2byte	0xee2
	.4byte	.LFB380
	.4byte	.LFE380-.LFB380
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x983
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xee2
	.byte	0x30
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x9
	.4byte	.LASF150
	.2byte	0xeb2
	.4byte	.LFB379
	.4byte	.LFE379-.LFB379
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9b7
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xeb2
	.byte	0x30
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.4byte	.LASF151
	.2byte	0xeb6
	.byte	0x16
	.4byte	0x9b7
	.4byte	.LLST1
	.byte	0
	.uleb128 0xd
	.4byte	0xad
	.uleb128 0x9
	.4byte	.LASF152
	.2byte	0xe88
	.4byte	.LFB378
	.4byte	.LFE378-.LFB378
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9e0
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xe88
	.byte	0x2f
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x9
	.4byte	.LASF153
	.2byte	0xe62
	.4byte	.LFB377
	.4byte	.LFE377-.LFB377
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa04
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xe62
	.byte	0x30
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x9
	.4byte	.LASF154
	.2byte	0xe36
	.4byte	.LFB376
	.4byte	.LFE376-.LFB376
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa38
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xe36
	.byte	0x30
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.4byte	.LASF155
	.2byte	0xe3a
	.byte	0x16
	.4byte	0x9b7
	.4byte	.LLST0
	.byte	0
	.uleb128 0x9
	.4byte	.LASF156
	.2byte	0xe10
	.4byte	.LFB375
	.4byte	.LFE375-.LFB375
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa5c
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xe10
	.byte	0x2f
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x9
	.4byte	.LASF157
	.2byte	0xded
	.4byte	.LFB374
	.4byte	.LFE374-.LFB374
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xab4
	.uleb128 0x2
	.4byte	.LASF158
	.2byte	0xded
	.byte	0x37
	.4byte	0x533
	.4byte	.LLST86
	.uleb128 0x10
	.4byte	.LASF141
	.2byte	0xdef
	.byte	0x16
	.4byte	0x936
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x6
	.4byte	.LVL357
	.4byte	0x93b
	.4byte	0xaa3
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL358
	.4byte	0xdad
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	.LASF159
	.2byte	0xdc8
	.4byte	.LFB373
	.4byte	.LFE373-.LFB373
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb0c
	.uleb128 0x2
	.4byte	.LASF158
	.2byte	0xdc8
	.byte	0x37
	.4byte	0x533
	.4byte	.LLST87
	.uleb128 0x10
	.4byte	.LASF141
	.2byte	0xdca
	.byte	0x16
	.4byte	0x936
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x6
	.4byte	.LVL362
	.4byte	0x93b
	.4byte	0xafb
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL363
	.4byte	0xdad
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	.LASF160
	.2byte	0xdb0
	.4byte	.LFB372
	.4byte	.LFE372-.LFB372
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb4b
	.uleb128 0x2
	.4byte	.LASF158
	.2byte	0xdb0
	.byte	0x34
	.4byte	0x533
	.4byte	.LLST80
	.uleb128 0x5
	.4byte	.LASF141
	.2byte	0xdb2
	.byte	0x16
	.4byte	0x936
	.4byte	.LLST81
	.uleb128 0x4
	.4byte	.LVL327
	.4byte	0xdd2
	.byte	0
	.uleb128 0x9
	.4byte	.LASF161
	.2byte	0xd96
	.4byte	.LFB371
	.4byte	.LFE371-.LFB371
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbb8
	.uleb128 0x2
	.4byte	.LASF158
	.2byte	0xd96
	.byte	0x2d
	.4byte	0x533
	.4byte	.LLST79
	.uleb128 0x10
	.4byte	.LASF141
	.2byte	0xd98
	.byte	0x16
	.4byte	0x936
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x6
	.4byte	.LVL321
	.4byte	0x7f6
	.4byte	0xb93
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.4byte	.LVL323
	.4byte	0x902
	.4byte	0xba7
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL324
	.4byte	0xdd2
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	.LASF162
	.2byte	0xd84
	.4byte	.LFB370
	.4byte	.LFE370-.LFB370
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbf7
	.uleb128 0x2
	.4byte	.LASF158
	.2byte	0xd84
	.byte	0x3f
	.4byte	0x533
	.4byte	.LLST77
	.uleb128 0x5
	.4byte	.LASF141
	.2byte	0xd86
	.byte	0x16
	.4byte	0x936
	.4byte	.LLST78
	.uleb128 0x4
	.4byte	.LVL317
	.4byte	0xdf7
	.byte	0
	.uleb128 0x9
	.4byte	.LASF163
	.2byte	0xd72
	.4byte	.LFB369
	.4byte	.LFE369-.LFB369
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc36
	.uleb128 0x2
	.4byte	.LASF158
	.2byte	0xd72
	.byte	0x37
	.4byte	0x533
	.4byte	.LLST75
	.uleb128 0x5
	.4byte	.LASF141
	.2byte	0xd74
	.byte	0x16
	.4byte	0x936
	.4byte	.LLST76
	.uleb128 0x4
	.4byte	.LVL312
	.4byte	0xe1c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF164
	.2byte	0xd60
	.4byte	.LFB368
	.4byte	.LFE368-.LFB368
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc75
	.uleb128 0x2
	.4byte	.LASF158
	.2byte	0xd60
	.byte	0x38
	.4byte	0x533
	.4byte	.LLST73
	.uleb128 0x5
	.4byte	.LASF141
	.2byte	0xd62
	.byte	0x16
	.4byte	0x936
	.4byte	.LLST74
	.uleb128 0x4
	.4byte	.LVL307
	.4byte	0xe41
	.byte	0
	.uleb128 0x9
	.4byte	.LASF165
	.2byte	0xd44
	.4byte	.LFB367
	.4byte	.LFE367-.LFB367
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcb4
	.uleb128 0x2
	.4byte	.LASF158
	.2byte	0xd44
	.byte	0x3b
	.4byte	0x533
	.4byte	.LLST71
	.uleb128 0x5
	.4byte	.LASF141
	.2byte	0xd46
	.byte	0x16
	.4byte	0x936
	.4byte	.LLST72
	.uleb128 0x4
	.4byte	.LVL302
	.4byte	0xe66
	.byte	0
	.uleb128 0x9
	.4byte	.LASF166
	.2byte	0xd28
	.4byte	.LFB366
	.4byte	.LFE366-.LFB366
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcf3
	.uleb128 0x2
	.4byte	.LASF158
	.2byte	0xd28
	.byte	0x33
	.4byte	0x533
	.4byte	.LLST69
	.uleb128 0x5
	.4byte	.LASF141
	.2byte	0xd2a
	.byte	0x16
	.4byte	0x936
	.4byte	.LLST70
	.uleb128 0x4
	.4byte	.LVL296
	.4byte	0xe8b
	.byte	0
	.uleb128 0x9
	.4byte	.LASF167
	.2byte	0xd0c
	.4byte	.LFB365
	.4byte	.LFE365-.LFB365
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd32
	.uleb128 0x2
	.4byte	.LASF158
	.2byte	0xd0c
	.byte	0x34
	.4byte	0x533
	.4byte	.LLST67
	.uleb128 0x5
	.4byte	.LASF141
	.2byte	0xd0e
	.byte	0x16
	.4byte	0x936
	.4byte	.LLST68
	.uleb128 0x4
	.4byte	.LVL290
	.4byte	0xeb0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF168
	.2byte	0xcf3
	.byte	0xa
	.4byte	0xb2
	.4byte	.LFB364
	.4byte	.LFE364-.LFB364
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd5d
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0xcf3
	.byte	0x34
	.4byte	0x889
	.4byte	.LLST94
	.byte	0
	.uleb128 0xa
	.4byte	.LASF169
	.2byte	0xce7
	.byte	0x16
	.4byte	0x6b6
	.4byte	.LFB363
	.4byte	.LFE363-.LFB363
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd88
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0xce7
	.byte	0x40
	.4byte	0x889
	.4byte	.LLST93
	.byte	0
	.uleb128 0xf
	.4byte	.LASF170
	.2byte	0xcc4
	.byte	0x1c
	.4byte	.LFB362
	.4byte	.LFE362-.LFB362
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdad
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xcc4
	.byte	0x47
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF171
	.2byte	0xcb5
	.byte	0x1c
	.4byte	.LFB361
	.4byte	.LFE361-.LFB361
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdd2
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xcb5
	.byte	0x49
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF172
	.2byte	0xca3
	.byte	0x1c
	.4byte	.LFB360
	.4byte	.LFE360-.LFB360
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdf7
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xca3
	.byte	0x45
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF173
	.2byte	0xc93
	.byte	0x1c
	.4byte	.LFB359
	.4byte	.LFE359-.LFB359
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe1c
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xc93
	.byte	0x4c
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF174
	.2byte	0xc83
	.byte	0x1c
	.4byte	.LFB358
	.4byte	.LFE358-.LFB358
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe41
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xc83
	.byte	0x4a
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF175
	.2byte	0xc73
	.byte	0x1c
	.4byte	.LFB357
	.4byte	.LFE357-.LFB357
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe66
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xc73
	.byte	0x4a
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF176
	.2byte	0xc63
	.byte	0x1c
	.4byte	.LFB356
	.4byte	.LFE356-.LFB356
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe8b
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xc63
	.byte	0x48
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF177
	.2byte	0xc53
	.byte	0x1c
	.4byte	.LFB355
	.4byte	.LFE355-.LFB355
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xeb0
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xc53
	.byte	0x46
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF178
	.2byte	0xc43
	.byte	0x1c
	.4byte	.LFB354
	.4byte	.LFE354-.LFB354
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xed5
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0xc43
	.byte	0x46
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF179
	.2byte	0xb46
	.byte	0x6
	.4byte	.LFB353
	.4byte	.LFE353-.LFB353
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1037
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0xb46
	.byte	0x2c
	.4byte	0x936
	.4byte	.LLST88
	.uleb128 0x5
	.4byte	.LASF180
	.2byte	0xb48
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST89
	.uleb128 0x5
	.4byte	.LASF146
	.2byte	0xb49
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST90
	.uleb128 0x10
	.4byte	.LASF181
	.2byte	0xb4a
	.byte	0xc
	.4byte	0xb2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.4byte	.LASF182
	.2byte	0xb4b
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST91
	.uleb128 0x5
	.4byte	.LASF183
	.2byte	0xb4c
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST92
	.uleb128 0x10
	.4byte	.LASF72
	.2byte	0xb4e
	.byte	0x18
	.4byte	0x6b6
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x10
	.4byte	.LASF155
	.2byte	0xb50
	.byte	0x16
	.4byte	0x9b7
	.uleb128 0x3
	.byte	0x76
	.sleb128 48
	.byte	0x9f
	.uleb128 0x6
	.4byte	.LVL375
	.4byte	0x902
	.4byte	0xf7b
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.4byte	.LVL376
	.4byte	0xeb0
	.4byte	0xf8f
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.4byte	.LVL379
	.4byte	0xd88
	.uleb128 0x19
	.4byte	.LVL382
	.4byte	0xfa8
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.4byte	.LVL383
	.4byte	0xfb8
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.4byte	.LVL386
	.4byte	0xfc8
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.4byte	.LVL389
	.4byte	0xfd8
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.4byte	.LVL391
	.4byte	0xdd2
	.4byte	0xfec
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.4byte	.LVL392
	.4byte	0xe66
	.4byte	0x1000
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.4byte	.LVL393
	.4byte	0xe8b
	.4byte	0x1014
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.4byte	.LVL397
	.4byte	0x7ca
	.uleb128 0x4
	.4byte	.LVL398
	.4byte	0x7ca
	.uleb128 0x11
	.4byte	.LVL399
	.4byte	0xdd2
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF184
	.2byte	0xb38
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB352
	.4byte	.LFE352-.LFB352
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1062
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0xb38
	.byte	0x36
	.4byte	0x936
	.4byte	.LLST66
	.byte	0
	.uleb128 0xa
	.4byte	.LASF185
	.2byte	0xb29
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x108d
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0xb29
	.byte	0x38
	.4byte	0x936
	.4byte	.LLST65
	.byte	0
	.uleb128 0xa
	.4byte	.LASF186
	.2byte	0xb1a
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10b8
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0xb1a
	.byte	0x37
	.4byte	0x936
	.4byte	.LLST64
	.byte	0
	.uleb128 0xa
	.4byte	.LASF187
	.2byte	0xa88
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x116a
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0xa88
	.byte	0x37
	.4byte	0x936
	.4byte	.LLST82
	.uleb128 0x5
	.4byte	.LASF188
	.2byte	0xa8a
	.byte	0x15
	.4byte	0x2d1
	.4byte	.LLST83
	.uleb128 0x10
	.4byte	.LASF189
	.2byte	0xa8b
	.byte	0x15
	.4byte	0xbe
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x5
	.4byte	.LASF190
	.2byte	0xa8c
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST84
	.uleb128 0x5
	.4byte	.LASF191
	.2byte	0xa8d
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST85
	.uleb128 0x4
	.4byte	.LVL338
	.4byte	0x7ca
	.uleb128 0x4
	.4byte	.LVL339
	.4byte	0x7f6
	.uleb128 0x4
	.4byte	.LVL344
	.4byte	0x7ca
	.uleb128 0x4
	.4byte	.LVL345
	.4byte	0x7f6
	.uleb128 0x6
	.4byte	.LVL348
	.4byte	0x93b
	.4byte	0x1159
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL351
	.4byte	0xdad
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF192
	.2byte	0xa03
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11ec
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0xa03
	.byte	0x34
	.4byte	0x936
	.4byte	.LLST62
	.uleb128 0x5
	.4byte	.LASF188
	.2byte	0xa05
	.byte	0x15
	.4byte	0x2d1
	.4byte	.LLST63
	.uleb128 0x10
	.4byte	.LASF189
	.2byte	0xa07
	.byte	0x15
	.4byte	0xbe
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x4
	.4byte	.LVL270
	.4byte	0x7e0
	.uleb128 0x4
	.4byte	.LVL271
	.4byte	0x7e0
	.uleb128 0x6
	.4byte	.LVL272
	.4byte	0x93b
	.4byte	0x11d9
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.4byte	.LVL275
	.4byte	0x7f6
	.uleb128 0x4
	.4byte	.LVL276
	.4byte	0x7f6
	.byte	0
	.uleb128 0xa
	.4byte	.LASF193
	.2byte	0x94d
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1262
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x94d
	.byte	0x42
	.4byte	0x936
	.4byte	.LLST58
	.uleb128 0x2
	.4byte	.LASF194
	.2byte	0x94d
	.byte	0x57
	.4byte	0x53d
	.4byte	.LLST59
	.uleb128 0x2
	.4byte	.LASF195
	.2byte	0x94d
	.byte	0x69
	.4byte	0x538
	.4byte	.LLST60
	.uleb128 0x2
	.4byte	.LASF196
	.2byte	0x94e
	.byte	0x38
	.4byte	0xa1
	.4byte	.LLST61
	.uleb128 0x4
	.4byte	.LVL259
	.4byte	0x80c
	.uleb128 0x4
	.4byte	.LVL262
	.4byte	0x80c
	.uleb128 0x4
	.4byte	.LVL263
	.4byte	0x7e0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF197
	.2byte	0x8b8
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12b6
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x8b8
	.byte	0x3a
	.4byte	0x936
	.4byte	.LLST55
	.uleb128 0x2
	.4byte	.LASF198
	.2byte	0x8b8
	.byte	0x49
	.4byte	0x538
	.4byte	.LLST56
	.uleb128 0x2
	.4byte	.LASF196
	.2byte	0x8b8
	.byte	0x59
	.4byte	0xa1
	.4byte	.LLST57
	.uleb128 0x4
	.4byte	.LVL245
	.4byte	0x80c
	.byte	0
	.uleb128 0xa
	.4byte	.LASF199
	.2byte	0x826
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x130a
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x826
	.byte	0x3b
	.4byte	0x936
	.4byte	.LLST52
	.uleb128 0x2
	.4byte	.LASF198
	.2byte	0x826
	.byte	0x50
	.4byte	0x53d
	.4byte	.LLST53
	.uleb128 0x2
	.4byte	.LASF196
	.2byte	0x826
	.byte	0x60
	.4byte	0xa1
	.4byte	.LLST54
	.uleb128 0x4
	.4byte	.LVL232
	.4byte	0x80c
	.byte	0
	.uleb128 0xa
	.4byte	.LASF200
	.2byte	0x726
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1385
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x726
	.byte	0x41
	.4byte	0x936
	.4byte	.LLST46
	.uleb128 0x2
	.4byte	.LASF194
	.2byte	0x726
	.byte	0x56
	.4byte	0x53d
	.4byte	.LLST47
	.uleb128 0x2
	.4byte	.LASF195
	.2byte	0x726
	.byte	0x68
	.4byte	0x538
	.4byte	.LLST48
	.uleb128 0x2
	.4byte	.LASF196
	.2byte	0x727
	.byte	0x37
	.4byte	0xa1
	.4byte	.LLST49
	.uleb128 0x5
	.4byte	.LASF201
	.2byte	0x729
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST50
	.uleb128 0x5
	.4byte	.LASF151
	.2byte	0x72b
	.byte	0x16
	.4byte	0x9b7
	.4byte	.LLST51
	.byte	0
	.uleb128 0xa
	.4byte	.LASF202
	.2byte	0x6c7
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x13d0
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x6c7
	.byte	0x39
	.4byte	0x936
	.4byte	.LLST43
	.uleb128 0x2
	.4byte	.LASF198
	.2byte	0x6c7
	.byte	0x48
	.4byte	0x538
	.4byte	.LLST44
	.uleb128 0x2
	.4byte	.LASF196
	.2byte	0x6c7
	.byte	0x58
	.4byte	0xa1
	.4byte	.LLST45
	.byte	0
	.uleb128 0xa
	.4byte	.LASF203
	.2byte	0x66d
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x141b
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x66d
	.byte	0x3a
	.4byte	0x936
	.4byte	.LLST40
	.uleb128 0x2
	.4byte	.LASF198
	.2byte	0x66d
	.byte	0x4f
	.4byte	0x53d
	.4byte	.LLST41
	.uleb128 0x2
	.4byte	.LASF196
	.2byte	0x66d
	.byte	0x5f
	.4byte	0xa1
	.4byte	.LLST42
	.byte	0
	.uleb128 0xa
	.4byte	.LASF204
	.2byte	0x526
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15a2
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x526
	.byte	0x3e
	.4byte	0x936
	.4byte	.LLST27
	.uleb128 0x2
	.4byte	.LASF194
	.2byte	0x526
	.byte	0x53
	.4byte	0x53d
	.4byte	.LLST28
	.uleb128 0x2
	.4byte	.LASF195
	.2byte	0x526
	.byte	0x65
	.4byte	0x538
	.4byte	.LLST29
	.uleb128 0x2
	.4byte	.LASF196
	.2byte	0x527
	.byte	0x34
	.4byte	0xa1
	.4byte	.LLST30
	.uleb128 0x2
	.4byte	.LASF144
	.2byte	0x527
	.byte	0x43
	.4byte	0xb2
	.4byte	.LLST31
	.uleb128 0x5
	.4byte	.LASF151
	.2byte	0x52a
	.byte	0x16
	.4byte	0x9b7
	.4byte	.LLST32
	.uleb128 0x5
	.4byte	.LASF155
	.2byte	0x52b
	.byte	0x16
	.4byte	0x9b7
	.4byte	.LLST33
	.uleb128 0x5
	.4byte	.LASF205
	.2byte	0x52e
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST34
	.uleb128 0x5
	.4byte	.LASF206
	.2byte	0x52f
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST35
	.uleb128 0x5
	.4byte	.LASF207
	.2byte	0x530
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST36
	.uleb128 0x5
	.4byte	.LASF208
	.2byte	0x531
	.byte	0xc
	.4byte	0xa1
	.4byte	.LLST37
	.uleb128 0x5
	.4byte	.LASF209
	.2byte	0x532
	.byte	0xc
	.4byte	0xa1
	.4byte	.LLST38
	.uleb128 0x5
	.4byte	.LASF210
	.2byte	0x533
	.byte	0xc
	.4byte	0xa1
	.4byte	.LLST39
	.uleb128 0x4
	.4byte	.LVL111
	.4byte	0x831
	.uleb128 0x4
	.4byte	.LVL133
	.4byte	0x831
	.uleb128 0x6
	.4byte	.LVL134
	.4byte	0x902
	.4byte	0x152b
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.4byte	.LVL153
	.4byte	0x831
	.uleb128 0x6
	.4byte	.LVL154
	.4byte	0x902
	.4byte	0x1548
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.4byte	.LVL171
	.4byte	0x831
	.uleb128 0x6
	.4byte	.LVL172
	.4byte	0x902
	.4byte	0x1565
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.4byte	.LVL176
	.4byte	0x88e
	.4byte	0x1591
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x38
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
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
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL177
	.4byte	0x902
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF211
	.2byte	0x418
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16d8
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x418
	.byte	0x36
	.4byte	0x936
	.4byte	.LLST20
	.uleb128 0x2
	.4byte	.LASF198
	.2byte	0x418
	.byte	0x45
	.4byte	0x538
	.4byte	.LLST21
	.uleb128 0x2
	.4byte	.LASF196
	.2byte	0x418
	.byte	0x55
	.4byte	0xa1
	.4byte	.LLST22
	.uleb128 0x2
	.4byte	.LASF144
	.2byte	0x418
	.byte	0x64
	.4byte	0xb2
	.4byte	.LLST23
	.uleb128 0x5
	.4byte	.LASF205
	.2byte	0x41a
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST24
	.uleb128 0x5
	.4byte	.LASF207
	.2byte	0x41b
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST25
	.uleb128 0x5
	.4byte	.LASF210
	.2byte	0x41c
	.byte	0xc
	.4byte	0xa1
	.4byte	.LLST26
	.uleb128 0x10
	.4byte	.LASF155
	.2byte	0x41f
	.byte	0x16
	.4byte	0x9b7
	.uleb128 0x3
	.byte	0x79
	.sleb128 48
	.byte	0x9f
	.uleb128 0x4
	.4byte	.LVL77
	.4byte	0x831
	.uleb128 0x4
	.4byte	.LVL81
	.4byte	0x831
	.uleb128 0x6
	.4byte	.LVL85
	.4byte	0x902
	.4byte	0x1662
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.4byte	.LVL91
	.4byte	0x831
	.uleb128 0x6
	.4byte	.LVL95
	.4byte	0x902
	.4byte	0x167f
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.4byte	.LVL97
	.4byte	0x831
	.uleb128 0x6
	.4byte	.LVL101
	.4byte	0x902
	.4byte	0x169c
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.4byte	.LVL103
	.4byte	0x902
	.4byte	0x16b0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL104
	.4byte	0x88e
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x38
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF212
	.2byte	0x338
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17ee
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x338
	.byte	0x37
	.4byte	0x936
	.4byte	.LLST15
	.uleb128 0x2
	.4byte	.LASF198
	.2byte	0x338
	.byte	0x4c
	.4byte	0x53d
	.4byte	.LLST16
	.uleb128 0x2
	.4byte	.LASF196
	.2byte	0x338
	.byte	0x5c
	.4byte	0xa1
	.4byte	.LLST17
	.uleb128 0x2
	.4byte	.LASF144
	.2byte	0x338
	.byte	0x6b
	.4byte	0xb2
	.4byte	.LLST18
	.uleb128 0x10
	.4byte	.LASF151
	.2byte	0x33b
	.byte	0x16
	.4byte	0x9b7
	.uleb128 0x3
	.byte	0x78
	.sleb128 32
	.byte	0x9f
	.uleb128 0x5
	.4byte	.LASF205
	.2byte	0x33e
	.byte	0xc
	.4byte	0xb2
	.4byte	.LLST19
	.uleb128 0x4
	.4byte	.LVL61
	.4byte	0x831
	.uleb128 0x4
	.4byte	.LVL63
	.4byte	0x831
	.uleb128 0x6
	.4byte	.LVL64
	.4byte	0x902
	.4byte	0x1778
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.4byte	.LVL65
	.4byte	0x831
	.uleb128 0x6
	.4byte	.LVL66
	.4byte	0x902
	.4byte	0x1795
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.4byte	.LVL67
	.4byte	0x831
	.uleb128 0x6
	.4byte	.LVL68
	.4byte	0x902
	.4byte	0x17b2
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.4byte	.LVL69
	.4byte	0x88e
	.4byte	0x17dd
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x38
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL70
	.4byte	0x902
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	.LASF213
	.2byte	0x225
	.byte	0x1c
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1813
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0x225
	.byte	0x41
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF214
	.2byte	0x215
	.byte	0x1c
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1838
	.uleb128 0x8
	.4byte	.LASF141
	.2byte	0x215
	.byte	0x3f
	.4byte	0x936
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xa
	.4byte	.LASF215
	.2byte	0x1e9
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1873
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x1e9
	.byte	0x35
	.4byte	0x936
	.4byte	.LLST14
	.uleb128 0x11
	.4byte	.LVL56
	.4byte	0x17ee
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.4byte	.LASF216
	.byte	0x1
	.byte	0xef
	.byte	0x13
	.4byte	0x2d1
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2a
	.4byte	.LASF141
	.byte	0x1
	.byte	0xef
	.byte	0x33
	.4byte	0x936
	.4byte	.LLST10
	.uleb128 0x1a
	.4byte	.LASF217
	.byte	0xf1
	.4byte	0xb2
	.4byte	.LLST11
	.uleb128 0x1a
	.4byte	.LASF218
	.byte	0xf2
	.4byte	0xb2
	.4byte	.LLST12
	.uleb128 0x1a
	.4byte	.LASF219
	.byte	0xf4
	.4byte	0xb2
	.4byte	.LLST13
	.uleb128 0x6
	.4byte	.LVL29
	.4byte	0x83e
	.4byte	0x18d7
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL37
	.4byte	0x1813
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
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
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
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
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
	.uleb128 0x1b
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x21
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
.LLST3:
	.byte	0x6
	.4byte	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL18-.LVL16
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL18-.LVL16
	.uleb128 .LFE384-.LVL16
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL18
	.byte	0x4
	.uleb128 .LVL18-.LVL18
	.uleb128 .LVL19-.LVL18
	.uleb128 0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL19-.LVL18
	.uleb128 .LVL20-.LVL18
	.uleb128 0x3
	.byte	0x70
	.sleb128 -7
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL20-.LVL18
	.uleb128 .LVL21-.LVL18
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL21-.LVL18
	.uleb128 .LFE384-.LVL18
	.uleb128 0xb
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x23
	.uleb128 0xc
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.byte	0x33
	.byte	0x25
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LFE383-.LVL22
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LFE383-.LVL22
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LFE383-.LVL22
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LFE383-.LVL22
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL25-.LVL22
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL25-.LVL22
	.uleb128 .LFE383-.LVL22
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL13
	.byte	0x4
	.uleb128 .LVL13-.LVL13
	.uleb128 .LVL14-.LVL13
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL15-.LVL13
	.uleb128 .LFE382-.LVL13
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST1:
	.byte	0x8
	.4byte	.LVL8
	.uleb128 .LVL9-.LVL8
	.uleb128 0x3
	.byte	0x73
	.sleb128 32
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL2
	.byte	0x4
	.uleb128 .LVL2-.LVL2
	.uleb128 .LVL3-.LVL2
	.uleb128 0x3
	.byte	0x72
	.sleb128 48
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL3-.LVL2
	.uleb128 .LVL4-.LVL2
	.uleb128 0x6
	.byte	0x70
	.sleb128 0
	.byte	0x6
	.byte	0x23
	.uleb128 0x30
	.byte	0x9f
	.byte	0
.LLST86:
	.byte	0x6
	.4byte	.LVL354
	.byte	0x4
	.uleb128 .LVL354-.LVL354
	.uleb128 .LVL356-.LVL354
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL356-.LVL354
	.uleb128 .LFE374-.LVL354
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST87:
	.byte	0x6
	.4byte	.LVL359
	.byte	0x4
	.uleb128 .LVL359-.LVL359
	.uleb128 .LVL361-.LVL359
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL361-.LVL359
	.uleb128 .LFE373-.LVL359
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST80:
	.byte	0x6
	.4byte	.LVL325
	.byte	0x4
	.uleb128 .LVL325-.LVL325
	.uleb128 .LVL326-.LVL325
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL326-.LVL325
	.uleb128 .LFE372-.LVL325
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST81:
	.byte	0x8
	.4byte	.LVL326
	.uleb128 .LVL327-1-.LVL326
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST79:
	.byte	0x6
	.4byte	.LVL319
	.byte	0x4
	.uleb128 .LVL319-.LVL319
	.uleb128 .LVL321-1-.LVL319
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL321-1-.LVL319
	.uleb128 .LFE371-.LVL319
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST77:
	.byte	0x6
	.4byte	.LVL314
	.byte	0x4
	.uleb128 .LVL314-.LVL314
	.uleb128 .LVL316-.LVL314
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL316-.LVL314
	.uleb128 .LFE370-.LVL314
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST78:
	.byte	0x6
	.4byte	.LVL315
	.byte	0x4
	.uleb128 .LVL315-.LVL315
	.uleb128 .LVL316-.LVL315
	.uleb128 0x2
	.byte	0x70
	.sleb128 56
	.byte	0x4
	.uleb128 .LVL316-.LVL315
	.uleb128 .LVL317-1-.LVL315
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST75:
	.byte	0x6
	.4byte	.LVL309
	.byte	0x4
	.uleb128 .LVL309-.LVL309
	.uleb128 .LVL311-.LVL309
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL311-.LVL309
	.uleb128 .LFE369-.LVL309
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST76:
	.byte	0x6
	.4byte	.LVL310
	.byte	0x4
	.uleb128 .LVL310-.LVL310
	.uleb128 .LVL311-.LVL310
	.uleb128 0x2
	.byte	0x70
	.sleb128 56
	.byte	0x4
	.uleb128 .LVL311-.LVL310
	.uleb128 .LVL312-1-.LVL310
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST73:
	.byte	0x6
	.4byte	.LVL304
	.byte	0x4
	.uleb128 .LVL304-.LVL304
	.uleb128 .LVL306-.LVL304
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL306-.LVL304
	.uleb128 .LFE368-.LVL304
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST74:
	.byte	0x6
	.4byte	.LVL305
	.byte	0x4
	.uleb128 .LVL305-.LVL305
	.uleb128 .LVL306-.LVL305
	.uleb128 0x2
	.byte	0x70
	.sleb128 56
	.byte	0x4
	.uleb128 .LVL306-.LVL305
	.uleb128 .LVL307-1-.LVL305
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST71:
	.byte	0x6
	.4byte	.LVL298
	.byte	0x4
	.uleb128 .LVL298-.LVL298
	.uleb128 .LVL299-.LVL298
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL299-.LVL298
	.uleb128 .LFE367-.LVL298
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST72:
	.byte	0x6
	.4byte	.LVL299
	.byte	0x4
	.uleb128 .LVL299-.LVL299
	.uleb128 .LVL300-.LVL299
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL301-.LVL299
	.uleb128 .LVL302-1-.LVL299
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST69:
	.byte	0x6
	.4byte	.LVL292
	.byte	0x4
	.uleb128 .LVL292-.LVL292
	.uleb128 .LVL293-.LVL292
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL293-.LVL292
	.uleb128 .LFE366-.LVL292
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST70:
	.byte	0x6
	.4byte	.LVL293
	.byte	0x4
	.uleb128 .LVL293-.LVL293
	.uleb128 .LVL294-.LVL293
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL295-.LVL293
	.uleb128 .LVL296-1-.LVL293
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST67:
	.byte	0x6
	.4byte	.LVL286
	.byte	0x4
	.uleb128 .LVL286-.LVL286
	.uleb128 .LVL287-.LVL286
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL287-.LVL286
	.uleb128 .LFE365-.LVL286
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST68:
	.byte	0x6
	.4byte	.LVL287
	.byte	0x4
	.uleb128 .LVL287-.LVL287
	.uleb128 .LVL288-.LVL287
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL289-.LVL287
	.uleb128 .LVL290-1-.LVL287
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST94:
	.byte	0x6
	.4byte	.LVL402
	.byte	0x4
	.uleb128 .LVL402-.LVL402
	.uleb128 .LVL403-.LVL402
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL403-.LVL402
	.uleb128 .LFE364-.LVL402
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST93:
	.byte	0x6
	.4byte	.LVL400
	.byte	0x4
	.uleb128 .LVL400-.LVL400
	.uleb128 .LVL401-.LVL400
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL401-.LVL400
	.uleb128 .LFE363-.LVL400
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST88:
	.byte	0x6
	.4byte	.LVL365
	.byte	0x4
	.uleb128 .LVL365-.LVL365
	.uleb128 .LVL372-.LVL365
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL372-.LVL365
	.uleb128 .LVL377-.LVL365
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL377-.LVL365
	.uleb128 .LVL379-1-.LVL365
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL379-1-.LVL365
	.uleb128 .LVL380-.LVL365
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL380-.LVL365
	.uleb128 .LVL381-.LVL365
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL381-.LVL365
	.uleb128 .LFE353-.LVL365
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST89:
	.byte	0x6
	.4byte	.LVL366
	.byte	0x4
	.uleb128 .LVL366-.LVL366
	.uleb128 .LVL372-.LVL366
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL377-.LVL366
	.uleb128 .LVL379-1-.LVL366
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL380-.LVL366
	.uleb128 .LVL382-1-.LVL366
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST90:
	.byte	0x6
	.4byte	.LVL367
	.byte	0x4
	.uleb128 .LVL367-.LVL367
	.uleb128 .LVL371-.LVL367
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL377-.LVL367
	.uleb128 .LVL378-.LVL367
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST91:
	.byte	0x6
	.4byte	.LVL369
	.byte	0x4
	.uleb128 .LVL369-.LVL369
	.uleb128 .LVL389-.LVL369
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL390-.LVL369
	.uleb128 .LVL396-.LVL369
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST92:
	.byte	0x6
	.4byte	.LVL369
	.byte	0x4
	.uleb128 .LVL369-.LVL369
	.uleb128 .LVL372-.LVL369
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL372-.LVL369
	.uleb128 .LVL374-.LVL369
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL377-.LVL369
	.uleb128 .LVL383-.LVL369
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL383-.LVL369
	.uleb128 .LVL384-.LVL369
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL384-.LVL369
	.uleb128 .LVL385-.LVL369
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL386-.LVL369
	.uleb128 .LVL387-.LVL369
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL387-.LVL369
	.uleb128 .LVL388-.LVL369
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL394-.LVL369
	.uleb128 .LVL395-.LVL369
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST66:
	.byte	0x6
	.4byte	.LVL283
	.byte	0x4
	.uleb128 .LVL283-.LVL283
	.uleb128 .LVL284-.LVL283
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL284-.LVL283
	.uleb128 .LFE352-.LVL283
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST65:
	.byte	0x6
	.4byte	.LVL281
	.byte	0x4
	.uleb128 .LVL281-.LVL281
	.uleb128 .LVL282-.LVL281
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL282-.LVL281
	.uleb128 .LFE351-.LVL281
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST64:
	.byte	0x6
	.4byte	.LVL279
	.byte	0x4
	.uleb128 .LVL279-.LVL279
	.uleb128 .LVL280-.LVL279
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL280-.LVL279
	.uleb128 .LFE350-.LVL279
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST82:
	.byte	0x6
	.4byte	.LVL329
	.byte	0x4
	.uleb128 .LVL329-.LVL329
	.uleb128 .LVL332-.LVL329
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL332-.LVL329
	.uleb128 .LVL335-.LVL329
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL335-.LVL329
	.uleb128 .LVL337-.LVL329
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL337-.LVL329
	.uleb128 .LVL341-.LVL329
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL341-.LVL329
	.uleb128 .LVL342-.LVL329
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL342-.LVL329
	.uleb128 .LFE349-.LVL329
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST83:
	.byte	0x6
	.4byte	.LVL331
	.byte	0x4
	.uleb128 .LVL331-.LVL331
	.uleb128 .LVL334-.LVL331
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL334-.LVL331
	.uleb128 .LVL335-.LVL331
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL335-.LVL331
	.uleb128 .LVL350-.LVL331
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL350-.LVL331
	.uleb128 .LVL352-.LVL331
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL352-.LVL331
	.uleb128 .LFE349-.LVL331
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST84:
	.byte	0x6
	.4byte	.LVL330
	.byte	0x4
	.uleb128 .LVL330-.LVL330
	.uleb128 .LVL332-.LVL330
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL332-.LVL330
	.uleb128 .LVL334-.LVL330
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL335-.LVL330
	.uleb128 .LVL336-.LVL330
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL336-.LVL330
	.uleb128 .LVL340-.LVL330
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL340-.LVL330
	.uleb128 .LVL342-.LVL330
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL342-.LVL330
	.uleb128 .LVL349-.LVL330
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL352-.LVL330
	.uleb128 .LVL353-.LVL330
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST85:
	.byte	0x6
	.4byte	.LVL330
	.byte	0x4
	.uleb128 .LVL330-.LVL330
	.uleb128 .LVL333-.LVL330
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL333-.LVL330
	.uleb128 .LVL334-.LVL330
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL335-.LVL330
	.uleb128 .LVL343-.LVL330
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL343-.LVL330
	.uleb128 .LVL346-.LVL330
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL346-.LVL330
	.uleb128 .LVL347-.LVL330
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL347-.LVL330
	.uleb128 .LVL348-1-.LVL330
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST62:
	.byte	0x6
	.4byte	.LVL267
	.byte	0x4
	.uleb128 .LVL267-.LVL267
	.uleb128 .LVL269-.LVL267
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL269-.LVL267
	.uleb128 .LVL277-.LVL267
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL277-.LVL267
	.uleb128 .LVL278-.LVL267
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL278-.LVL267
	.uleb128 .LFE348-.LVL267
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST63:
	.byte	0x6
	.4byte	.LVL268
	.byte	0x4
	.uleb128 .LVL268-.LVL268
	.uleb128 .LVL273-.LVL268
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL273-.LVL268
	.uleb128 .LVL274-.LVL268
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL274-.LVL268
	.uleb128 .LVL277-.LVL268
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST58:
	.byte	0x6
	.4byte	.LVL253
	.byte	0x4
	.uleb128 .LVL253-.LVL253
	.uleb128 .LVL258-.LVL253
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL258-.LVL253
	.uleb128 .LVL260-.LVL253
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL260-.LVL253
	.uleb128 .LVL261-.LVL253
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL261-.LVL253
	.uleb128 .LVL264-.LVL253
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL264-.LVL253
	.uleb128 .LVL265-.LVL253
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL265-.LVL253
	.uleb128 .LVL266-.LVL253
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL266-.LVL253
	.uleb128 .LFE347-.LVL253
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST59:
	.byte	0x6
	.4byte	.LVL253
	.byte	0x4
	.uleb128 .LVL253-.LVL253
	.uleb128 .LVL257-.LVL253
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL257-.LVL253
	.uleb128 .LVL260-.LVL253
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL260-.LVL253
	.uleb128 .LVL261-.LVL253
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL261-.LVL253
	.uleb128 .LVL264-.LVL253
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL264-.LVL253
	.uleb128 .LVL265-.LVL253
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL265-.LVL253
	.uleb128 .LVL266-.LVL253
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL266-.LVL253
	.uleb128 .LFE347-.LVL253
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST60:
	.byte	0x6
	.4byte	.LVL253
	.byte	0x4
	.uleb128 .LVL253-.LVL253
	.uleb128 .LVL255-.LVL253
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL255-.LVL253
	.uleb128 .LVL256-.LVL253
	.uleb128 0x3
	.byte	0x70
	.sleb128 100
	.byte	0x4
	.uleb128 .LVL256-.LVL253
	.uleb128 .LVL264-.LVL253
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL264-.LVL253
	.uleb128 .LVL265-.LVL253
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL265-.LVL253
	.uleb128 .LVL266-.LVL253
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL266-.LVL253
	.uleb128 .LFE347-.LVL253
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST61:
	.byte	0x6
	.4byte	.LVL253
	.byte	0x4
	.uleb128 .LVL253-.LVL253
	.uleb128 .LVL254-.LVL253
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL254-.LVL253
	.uleb128 .LVL264-.LVL253
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL264-.LVL253
	.uleb128 .LVL265-.LVL253
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL265-.LVL253
	.uleb128 .LFE347-.LVL253
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0
.LLST55:
	.byte	0x6
	.4byte	.LVL240
	.byte	0x4
	.uleb128 .LVL240-.LVL240
	.uleb128 .LVL244-.LVL240
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL244-.LVL240
	.uleb128 .LVL246-.LVL240
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL246-.LVL240
	.uleb128 .LVL247-.LVL240
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL247-.LVL240
	.uleb128 .LVL248-.LVL240
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL248-.LVL240
	.uleb128 .LVL251-.LVL240
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL251-.LVL240
	.uleb128 .LVL252-.LVL240
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL252-.LVL240
	.uleb128 .LFE346-.LVL240
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST56:
	.byte	0x6
	.4byte	.LVL240
	.byte	0x4
	.uleb128 .LVL240-.LVL240
	.uleb128 .LVL243-.LVL240
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL243-.LVL240
	.uleb128 .LVL246-.LVL240
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL246-.LVL240
	.uleb128 .LVL247-.LVL240
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL247-.LVL240
	.uleb128 .LVL248-.LVL240
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL248-.LVL240
	.uleb128 .LVL251-.LVL240
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL251-.LVL240
	.uleb128 .LVL252-.LVL240
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL252-.LVL240
	.uleb128 .LFE346-.LVL240
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST57:
	.byte	0x6
	.4byte	.LVL240
	.byte	0x4
	.uleb128 .LVL240-.LVL240
	.uleb128 .LVL241-.LVL240
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL241-.LVL240
	.uleb128 .LVL242-.LVL240
	.uleb128 0x3
	.byte	0x70
	.sleb128 104
	.byte	0x4
	.uleb128 .LVL242-.LVL240
	.uleb128 .LVL246-.LVL240
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL246-.LVL240
	.uleb128 .LVL247-.LVL240
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL247-.LVL240
	.uleb128 .LVL248-.LVL240
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL248-.LVL240
	.uleb128 .LVL249-.LVL240
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL249-.LVL240
	.uleb128 .LVL250-.LVL240
	.uleb128 0x3
	.byte	0x70
	.sleb128 104
	.byte	0x4
	.uleb128 .LVL250-.LVL240
	.uleb128 .LVL252-.LVL240
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL252-.LVL240
	.uleb128 .LFE346-.LVL240
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST52:
	.byte	0x6
	.4byte	.LVL227
	.byte	0x4
	.uleb128 .LVL227-.LVL227
	.uleb128 .LVL231-.LVL227
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL231-.LVL227
	.uleb128 .LVL233-.LVL227
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL233-.LVL227
	.uleb128 .LVL236-.LVL227
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL236-.LVL227
	.uleb128 .LVL237-.LVL227
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL237-.LVL227
	.uleb128 .LVL238-.LVL227
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL238-.LVL227
	.uleb128 .LVL239-.LVL227
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL239-.LVL227
	.uleb128 .LFE345-.LVL227
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST53:
	.byte	0x6
	.4byte	.LVL227
	.byte	0x4
	.uleb128 .LVL227-.LVL227
	.uleb128 .LVL230-.LVL227
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL230-.LVL227
	.uleb128 .LVL233-.LVL227
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL233-.LVL227
	.uleb128 .LVL236-.LVL227
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL236-.LVL227
	.uleb128 .LVL237-.LVL227
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL237-.LVL227
	.uleb128 .LVL238-.LVL227
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL238-.LVL227
	.uleb128 .LVL239-.LVL227
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL239-.LVL227
	.uleb128 .LFE345-.LVL227
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST54:
	.byte	0x6
	.4byte	.LVL227
	.byte	0x4
	.uleb128 .LVL227-.LVL227
	.uleb128 .LVL228-.LVL227
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL228-.LVL227
	.uleb128 .LVL229-.LVL227
	.uleb128 0x3
	.byte	0x70
	.sleb128 96
	.byte	0x4
	.uleb128 .LVL229-.LVL227
	.uleb128 .LVL233-.LVL227
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL233-.LVL227
	.uleb128 .LVL234-.LVL227
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL234-.LVL227
	.uleb128 .LVL235-.LVL227
	.uleb128 0x3
	.byte	0x70
	.sleb128 96
	.byte	0x4
	.uleb128 .LVL235-.LVL227
	.uleb128 .LVL237-.LVL227
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL237-.LVL227
	.uleb128 .LVL238-.LVL227
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL238-.LVL227
	.uleb128 .LVL239-.LVL227
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL239-.LVL227
	.uleb128 .LFE345-.LVL227
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST46:
	.byte	0x6
	.4byte	.LVL207
	.byte	0x4
	.uleb128 .LVL207-.LVL207
	.uleb128 .LVL209-.LVL207
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL209-.LVL207
	.uleb128 .LFE344-.LVL207
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST47:
	.byte	0x6
	.4byte	.LVL207
	.byte	0x4
	.uleb128 .LVL207-.LVL207
	.uleb128 .LVL212-.LVL207
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL212-.LVL207
	.uleb128 .LVL213-.LVL207
	.uleb128 0x3
	.byte	0x7c
	.sleb128 92
	.byte	0x4
	.uleb128 .LVL213-.LVL207
	.uleb128 .LVL215-.LVL207
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL215-.LVL207
	.uleb128 .LVL216-.LVL207
	.uleb128 0x3
	.byte	0x7c
	.sleb128 92
	.byte	0x4
	.uleb128 .LVL216-.LVL207
	.uleb128 .LVL223-.LVL207
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL223-.LVL207
	.uleb128 .LVL224-.LVL207
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL224-.LVL207
	.uleb128 .LVL226-.LVL207
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL226-.LVL207
	.uleb128 .LFE344-.LVL207
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST48:
	.byte	0x6
	.4byte	.LVL207
	.byte	0x4
	.uleb128 .LVL207-.LVL207
	.uleb128 .LVL210-.LVL207
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL210-.LVL207
	.uleb128 .LVL213-.LVL207
	.uleb128 0x3
	.byte	0x7c
	.sleb128 100
	.byte	0x4
	.uleb128 .LVL213-.LVL207
	.uleb128 .LVL215-.LVL207
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL215-.LVL207
	.uleb128 .LVL216-.LVL207
	.uleb128 0x3
	.byte	0x7c
	.sleb128 100
	.byte	0x4
	.uleb128 .LVL216-.LVL207
	.uleb128 .LVL223-.LVL207
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL223-.LVL207
	.uleb128 .LVL224-.LVL207
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL224-.LVL207
	.uleb128 .LVL226-.LVL207
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL226-.LVL207
	.uleb128 .LFE344-.LVL207
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST49:
	.byte	0x6
	.4byte	.LVL207
	.byte	0x4
	.uleb128 .LVL207-.LVL207
	.uleb128 .LVL214-.LVL207
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL214-.LVL207
	.uleb128 .LVL215-.LVL207
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL215-.LVL207
	.uleb128 .LVL216-.LVL207
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL216-.LVL207
	.uleb128 .LVL223-.LVL207
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL223-.LVL207
	.uleb128 .LVL224-.LVL207
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL224-.LVL207
	.uleb128 .LVL226-.LVL207
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL226-.LVL207
	.uleb128 .LFE344-.LVL207
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST50:
	.byte	0x6
	.4byte	.LVL211
	.byte	0x4
	.uleb128 .LVL211-.LVL211
	.uleb128 .LVL216-.LVL211
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL217-.LVL211
	.uleb128 .LVL218-.LVL211
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL219-.LVL211
	.uleb128 .LVL220-.LVL211
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL221-.LVL211
	.uleb128 .LVL222-.LVL211
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST51:
	.byte	0x6
	.4byte	.LVL208
	.byte	0x4
	.uleb128 .LVL208-.LVL208
	.uleb128 .LVL225-.LVL208
	.uleb128 0x3
	.byte	0x74
	.sleb128 32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL226-.LVL208
	.uleb128 .LFE344-.LVL208
	.uleb128 0x3
	.byte	0x74
	.sleb128 32
	.byte	0x9f
	.byte	0
.LLST43:
	.byte	0x6
	.4byte	.LVL196
	.byte	0x4
	.uleb128 .LVL196-.LVL196
	.uleb128 .LVL197-.LVL196
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL197-.LVL196
	.uleb128 .LVL201-.LVL196
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL201-.LVL196
	.uleb128 .LVL202-.LVL196
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL202-.LVL196
	.uleb128 .LVL205-.LVL196
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL205-.LVL196
	.uleb128 .LVL206-.LVL196
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL206-.LVL196
	.uleb128 .LFE343-.LVL196
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST44:
	.byte	0x6
	.4byte	.LVL196
	.byte	0x4
	.uleb128 .LVL196-.LVL196
	.uleb128 .LVL198-.LVL196
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL198-.LVL196
	.uleb128 .LVL199-.LVL196
	.uleb128 0x3
	.byte	0x73
	.sleb128 100
	.byte	0x4
	.uleb128 .LVL199-.LVL196
	.uleb128 .LVL202-.LVL196
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL202-.LVL196
	.uleb128 .LVL203-.LVL196
	.uleb128 0x3
	.byte	0x73
	.sleb128 100
	.byte	0x4
	.uleb128 .LVL203-.LVL196
	.uleb128 .LVL206-.LVL196
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL206-.LVL196
	.uleb128 .LFE343-.LVL196
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST45:
	.byte	0x6
	.4byte	.LVL196
	.byte	0x4
	.uleb128 .LVL196-.LVL196
	.uleb128 .LVL200-.LVL196
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL200-.LVL196
	.uleb128 .LVL202-.LVL196
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL202-.LVL196
	.uleb128 .LVL204-.LVL196
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL204-.LVL196
	.uleb128 .LVL206-.LVL196
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL206-.LVL196
	.uleb128 .LFE343-.LVL196
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST40:
	.byte	0x6
	.4byte	.LVL181
	.byte	0x4
	.uleb128 .LVL181-.LVL181
	.uleb128 .LVL185-.LVL181
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL185-.LVL181
	.uleb128 .LVL186-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL186-.LVL181
	.uleb128 .LVL189-.LVL181
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL189-.LVL181
	.uleb128 .LVL190-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL190-.LVL181
	.uleb128 .LVL191-.LVL181
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL191-.LVL181
	.uleb128 .LVL192-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL192-.LVL181
	.uleb128 .LVL193-.LVL181
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL193-.LVL181
	.uleb128 .LVL194-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL194-.LVL181
	.uleb128 .LVL195-.LVL181
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL195-.LVL181
	.uleb128 .LFE342-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST41:
	.byte	0x6
	.4byte	.LVL181
	.byte	0x4
	.uleb128 .LVL181-.LVL181
	.uleb128 .LVL183-.LVL181
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL183-.LVL181
	.uleb128 .LVL184-.LVL181
	.uleb128 0x3
	.byte	0x70
	.sleb128 92
	.byte	0x4
	.uleb128 .LVL184-.LVL181
	.uleb128 .LVL186-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL186-.LVL181
	.uleb128 .LVL187-.LVL181
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL187-.LVL181
	.uleb128 .LVL188-.LVL181
	.uleb128 0x3
	.byte	0x70
	.sleb128 92
	.byte	0x4
	.uleb128 .LVL188-.LVL181
	.uleb128 .LVL190-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL190-.LVL181
	.uleb128 .LFE342-.LVL181
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST42:
	.byte	0x6
	.4byte	.LVL181
	.byte	0x4
	.uleb128 .LVL181-.LVL181
	.uleb128 .LVL182-.LVL181
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL182-.LVL181
	.uleb128 .LVL190-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL190-.LVL181
	.uleb128 .LVL192-.LVL181
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL192-.LVL181
	.uleb128 .LFE342-.LVL181
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST27:
	.byte	0x6
	.4byte	.LVL108
	.byte	0x4
	.uleb128 .LVL108-.LVL108
	.uleb128 .LVL111-1-.LVL108
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL111-1-.LVL108
	.uleb128 .LFE341-.LVL108
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST28:
	.byte	0x6
	.4byte	.LVL108
	.byte	0x4
	.uleb128 .LVL108-.LVL108
	.uleb128 .LVL111-1-.LVL108
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL111-1-.LVL108
	.uleb128 .LVL136-.LVL108
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL136-.LVL108
	.uleb128 .LVL155-.LVL108
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL155-.LVL108
	.uleb128 .LVL175-.LVL108
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL175-.LVL108
	.uleb128 .LVL178-.LVL108
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL178-.LVL108
	.uleb128 .LVL179-.LVL108
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL179-.LVL108
	.uleb128 .LVL180-.LVL108
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL180-.LVL108
	.uleb128 .LFE341-.LVL108
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST29:
	.byte	0x6
	.4byte	.LVL108
	.byte	0x4
	.uleb128 .LVL108-.LVL108
	.uleb128 .LVL111-1-.LVL108
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL111-1-.LVL108
	.uleb128 .LVL114-.LVL108
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL114-.LVL108
	.uleb128 .LVL115-.LVL108
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL115-.LVL108
	.uleb128 .LVL116-.LVL108
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL116-.LVL108
	.uleb128 .LVL117-.LVL108
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL117-.LVL108
	.uleb128 .LVL118-.LVL108
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL118-.LVL108
	.uleb128 .LVL178-.LVL108
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL178-.LVL108
	.uleb128 .LVL179-.LVL108
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL179-.LVL108
	.uleb128 .LVL180-.LVL108
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL180-.LVL108
	.uleb128 .LFE341-.LVL108
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST30:
	.byte	0x6
	.4byte	.LVL108
	.byte	0x4
	.uleb128 .LVL108-.LVL108
	.uleb128 .LVL111-1-.LVL108
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL111-1-.LVL108
	.uleb128 .LFE341-.LVL108
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0
.LLST31:
	.byte	0x6
	.4byte	.LVL108
	.byte	0x4
	.uleb128 .LVL108-.LVL108
	.uleb128 .LVL180-.LVL108
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL180-.LVL108
	.uleb128 .LFE341-.LVL108
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
.LLST32:
	.byte	0x6
	.4byte	.LVL109
	.byte	0x4
	.uleb128 .LVL109-.LVL109
	.uleb128 .LVL119-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL120-.LVL109
	.uleb128 .LVL121-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL135-.LVL109
	.uleb128 .LVL155-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL173-.LVL109
	.uleb128 .LVL174-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL178-.LVL109
	.uleb128 .LVL179-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL180-.LVL109
	.uleb128 .LFE341-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 32
	.byte	0x9f
	.byte	0
.LLST33:
	.byte	0x6
	.4byte	.LVL109
	.byte	0x4
	.uleb128 .LVL109-.LVL109
	.uleb128 .LVL119-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 48
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL120-.LVL109
	.uleb128 .LVL121-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 48
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL135-.LVL109
	.uleb128 .LVL155-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 48
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL173-.LVL109
	.uleb128 .LVL174-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 48
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL178-.LVL109
	.uleb128 .LVL179-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 48
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL180-.LVL109
	.uleb128 .LFE341-.LVL109
	.uleb128 0x3
	.byte	0x7b
	.sleb128 48
	.byte	0x9f
	.byte	0
.LLST34:
	.byte	0x6
	.4byte	.LVL111
	.byte	0x4
	.uleb128 .LVL111-.LVL111
	.uleb128 .LVL121-.LVL111
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL121-.LVL111
	.uleb128 .LVL135-.LVL111
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL135-.LVL111
	.uleb128 .LVL137-.LVL111
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL137-.LVL111
	.uleb128 .LVL173-.LVL111
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL173-.LVL111
	.uleb128 .LVL175-.LVL111
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL175-.LVL111
	.uleb128 .LVL178-.LVL111
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL178-.LVL111
	.uleb128 .LVL179-.LVL111
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL180-.LVL111
	.uleb128 .LFE341-.LVL111
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST35:
	.byte	0x6
	.4byte	.LVL118
	.byte	0x4
	.uleb128 .LVL118-.LVL118
	.uleb128 .LVL119-.LVL118
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL119-.LVL118
	.uleb128 .LVL120-.LVL118
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL120-.LVL118
	.uleb128 .LVL121-.LVL118
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL121-.LVL118
	.uleb128 .LVL135-.LVL118
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL135-.LVL118
	.uleb128 .LVL136-.LVL118
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL136-.LVL118
	.uleb128 .LVL137-.LVL118
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL137-.LVL118
	.uleb128 .LVL155-.LVL118
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL155-.LVL118
	.uleb128 .LVL175-.LVL118
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST36:
	.byte	0x6
	.4byte	.LVL122
	.byte	0x4
	.uleb128 .LVL122-.LVL122
	.uleb128 .LVL123-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL128-.LVL122
	.uleb128 .LVL129-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL132-.LVL122
	.uleb128 .LVL133-1-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL138-.LVL122
	.uleb128 .LVL139-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL144-.LVL122
	.uleb128 .LVL145-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL148-.LVL122
	.uleb128 .LVL149-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL152-.LVL122
	.uleb128 .LVL153-1-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL156-.LVL122
	.uleb128 .LVL157-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL162-.LVL122
	.uleb128 .LVL163-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL166-.LVL122
	.uleb128 .LVL167-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL170-.LVL122
	.uleb128 .LVL171-1-.LVL122
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST37:
	.byte	0x6
	.4byte	.LVL111
	.byte	0x4
	.uleb128 .LVL111-.LVL111
	.uleb128 .LVL126-.LVL111
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL127-.LVL111
	.uleb128 .LVL142-.LVL111
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL143-.LVL111
	.uleb128 .LVL160-.LVL111
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL161-.LVL111
	.uleb128 .LFE341-.LVL111
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST38:
	.byte	0x6
	.4byte	.LVL111
	.byte	0x4
	.uleb128 .LVL111-.LVL111
	.uleb128 .LVL121-.LVL111
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL121-.LVL111
	.uleb128 .LVL124-.LVL111
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL125-.LVL111
	.uleb128 .LVL130-.LVL111
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL131-.LVL111
	.uleb128 .LVL135-.LVL111
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL135-.LVL111
	.uleb128 .LVL137-.LVL111
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL137-.LVL111
	.uleb128 .LVL140-.LVL111
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL141-.LVL111
	.uleb128 .LVL146-.LVL111
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL147-.LVL111
	.uleb128 .LVL150-.LVL111
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL151-.LVL111
	.uleb128 .LVL155-.LVL111
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL155-.LVL111
	.uleb128 .LVL158-.LVL111
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL159-.LVL111
	.uleb128 .LVL164-.LVL111
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL165-.LVL111
	.uleb128 .LVL168-.LVL111
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL169-.LVL111
	.uleb128 .LVL173-.LVL111
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL173-.LVL111
	.uleb128 .LVL175-.LVL111
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL178-.LVL111
	.uleb128 .LVL179-.LVL111
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL180-.LVL111
	.uleb128 .LFE341-.LVL111
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST39:
	.byte	0x6
	.4byte	.LVL110
	.byte	0x4
	.uleb128 .LVL110-.LVL110
	.uleb128 .LVL112-.LVL110
	.uleb128 0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL112-.LVL110
	.uleb128 .LVL113-.LVL110
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL178-.LVL110
	.uleb128 .LVL179-.LVL110
	.uleb128 0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.byte	0
.LLST20:
	.byte	0x6
	.4byte	.LVL74
	.byte	0x4
	.uleb128 .LVL74-.LVL74
	.uleb128 .LVL77-1-.LVL74
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL77-1-.LVL74
	.uleb128 .LFE340-.LVL74
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST21:
	.byte	0x6
	.4byte	.LVL74
	.byte	0x4
	.uleb128 .LVL74-.LVL74
	.uleb128 .LVL77-1-.LVL74
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL77-1-.LVL74
	.uleb128 .LFE340-.LVL74
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LLST22:
	.byte	0x6
	.4byte	.LVL74
	.byte	0x4
	.uleb128 .LVL74-.LVL74
	.uleb128 .LVL77-1-.LVL74
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL77-1-.LVL74
	.uleb128 .LFE340-.LVL74
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST23:
	.byte	0x6
	.4byte	.LVL74
	.byte	0x4
	.uleb128 .LVL74-.LVL74
	.uleb128 .LVL77-1-.LVL74
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL77-1-.LVL74
	.uleb128 .LFE340-.LVL74
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST24:
	.byte	0x6
	.4byte	.LVL77
	.byte	0x4
	.uleb128 .LVL77-.LVL77
	.uleb128 .LVL80-.LVL77
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL80-.LVL77
	.uleb128 .LVL105-.LVL77
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL105-.LVL77
	.uleb128 .LVL106-.LVL77
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL107-.LVL77
	.uleb128 .LFE340-.LVL77
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST25:
	.byte	0x6
	.4byte	.LVL80
	.byte	0x4
	.uleb128 .LVL80-.LVL80
	.uleb128 .LVL81-1-.LVL80
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL83-.LVL80
	.uleb128 .LVL84-.LVL80
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL86-.LVL80
	.uleb128 .LVL87-.LVL80
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL88-.LVL80
	.uleb128 .LVL89-.LVL80
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL90-.LVL80
	.uleb128 .LVL91-1-.LVL80
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL93-.LVL80
	.uleb128 .LVL94-.LVL80
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL96-.LVL80
	.uleb128 .LVL97-1-.LVL80
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL99-.LVL80
	.uleb128 .LVL100-.LVL80
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST26:
	.byte	0x6
	.4byte	.LVL75
	.byte	0x4
	.uleb128 .LVL75-.LVL75
	.uleb128 .LVL78-.LVL75
	.uleb128 0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL78-.LVL75
	.uleb128 .LVL79-.LVL75
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL105-.LVL75
	.uleb128 .LVL106-.LVL75
	.uleb128 0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL61-1-.LVL59
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL61-1-.LVL59
	.uleb128 .LFE339-.LVL59
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST16:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL61-1-.LVL59
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL61-1-.LVL59
	.uleb128 .LFE339-.LVL59
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST17:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL61-1-.LVL59
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL61-1-.LVL59
	.uleb128 .LFE339-.LVL59
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST18:
	.byte	0x6
	.4byte	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL61-1-.LVL59
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL61-1-.LVL59
	.uleb128 .LFE339-.LVL59
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL61
	.byte	0x4
	.uleb128 .LVL61-.LVL61
	.uleb128 .LVL62-.LVL61
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL62-.LVL61
	.uleb128 .LVL71-.LVL61
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL71-.LVL61
	.uleb128 .LVL72-.LVL61
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL73-.LVL61
	.uleb128 .LFE339-.LVL61
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL55
	.byte	0x4
	.uleb128 .LVL55-.LVL55
	.uleb128 .LVL56-1-.LVL55
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL56-1-.LVL55
	.uleb128 .LVL57-.LVL55
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL57-.LVL55
	.uleb128 .LVL58-.LVL55
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL58-.LVL55
	.uleb128 .LFE336-.LVL55
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL27
	.byte	0x4
	.uleb128 .LVL27-.LVL27
	.uleb128 .LVL28-.LVL27
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL28-.LVL27
	.uleb128 .LVL44-.LVL27
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL44-.LVL27
	.uleb128 .LVL45-.LVL27
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL45-.LVL27
	.uleb128 .LVL46-.LVL27
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL46-.LVL27
	.uleb128 .LVL47-.LVL27
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL47-.LVL27
	.uleb128 .LFE335-.LVL27
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL30
	.byte	0x4
	.uleb128 .LVL30-.LVL30
	.uleb128 .LVL32-.LVL30
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL33-.LVL30
	.uleb128 .LVL38-.LVL30
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL40-.LVL30
	.uleb128 .LVL41-.LVL30
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL43-.LVL30
	.uleb128 .LVL44-.LVL30
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST12:
	.byte	0x6
	.4byte	.LVL29
	.byte	0x4
	.uleb128 .LVL29-.LVL29
	.uleb128 .LVL31-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL32-.LVL29
	.uleb128 .LVL34-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL35-.LVL29
	.uleb128 .LVL36-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL48-.LVL29
	.uleb128 .LVL49-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL50-.LVL29
	.uleb128 .LVL51-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL52-.LVL29
	.uleb128 .LVL53-.LVL29
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST13:
	.byte	0x8
	.4byte	.LVL42
	.uleb128 .LVL43-.LVL42
	.uleb128 0x1
	.byte	0x52
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x1a4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB375
	.4byte	.LFE375-.LFB375
	.4byte	.LFB376
	.4byte	.LFE376-.LFB376
	.4byte	.LFB377
	.4byte	.LFE377-.LFB377
	.4byte	.LFB378
	.4byte	.LFE378-.LFB378
	.4byte	.LFB379
	.4byte	.LFE379-.LFB379
	.4byte	.LFB380
	.4byte	.LFE380-.LFB380
	.4byte	.LFB381
	.4byte	.LFE381-.LFB381
	.4byte	.LFB382
	.4byte	.LFE382-.LFB382
	.4byte	.LFB384
	.4byte	.LFE384-.LFB384
	.4byte	.LFB383
	.4byte	.LFE383-.LFB383
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
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.4byte	.LFB352
	.4byte	.LFE352-.LFB352
	.4byte	.LFB354
	.4byte	.LFE354-.LFB354
	.4byte	.LFB365
	.4byte	.LFE365-.LFB365
	.4byte	.LFB355
	.4byte	.LFE355-.LFB355
	.4byte	.LFB366
	.4byte	.LFE366-.LFB366
	.4byte	.LFB356
	.4byte	.LFE356-.LFB356
	.4byte	.LFB367
	.4byte	.LFE367-.LFB367
	.4byte	.LFB357
	.4byte	.LFE357-.LFB357
	.4byte	.LFB368
	.4byte	.LFE368-.LFB368
	.4byte	.LFB358
	.4byte	.LFE358-.LFB358
	.4byte	.LFB369
	.4byte	.LFE369-.LFB369
	.4byte	.LFB359
	.4byte	.LFE359-.LFB359
	.4byte	.LFB370
	.4byte	.LFE370-.LFB370
	.4byte	.LFB360
	.4byte	.LFE360-.LFB360
	.4byte	.LFB371
	.4byte	.LFE371-.LFB371
	.4byte	.LFB372
	.4byte	.LFE372-.LFB372
	.4byte	.LFB361
	.4byte	.LFE361-.LFB361
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.4byte	.LFB374
	.4byte	.LFE374-.LFB374
	.4byte	.LFB373
	.4byte	.LFE373-.LFB373
	.4byte	.LFB362
	.4byte	.LFE362-.LFB362
	.4byte	.LFB353
	.4byte	.LFE353-.LFB353
	.4byte	.LFB363
	.4byte	.LFE363-.LFB363
	.4byte	.LFB364
	.4byte	.LFE364-.LFB364
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
.LLRL95:
	.byte	0x7
	.4byte	.LFB375
	.uleb128 .LFE375-.LFB375
	.byte	0x7
	.4byte	.LFB376
	.uleb128 .LFE376-.LFB376
	.byte	0x7
	.4byte	.LFB377
	.uleb128 .LFE377-.LFB377
	.byte	0x7
	.4byte	.LFB378
	.uleb128 .LFE378-.LFB378
	.byte	0x7
	.4byte	.LFB379
	.uleb128 .LFE379-.LFB379
	.byte	0x7
	.4byte	.LFB380
	.uleb128 .LFE380-.LFB380
	.byte	0x7
	.4byte	.LFB381
	.uleb128 .LFE381-.LFB381
	.byte	0x7
	.4byte	.LFB382
	.uleb128 .LFE382-.LFB382
	.byte	0x7
	.4byte	.LFB384
	.uleb128 .LFE384-.LFB384
	.byte	0x7
	.4byte	.LFB383
	.uleb128 .LFE383-.LFB383
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
	.4byte	.LFB350
	.uleb128 .LFE350-.LFB350
	.byte	0x7
	.4byte	.LFB351
	.uleb128 .LFE351-.LFB351
	.byte	0x7
	.4byte	.LFB352
	.uleb128 .LFE352-.LFB352
	.byte	0x7
	.4byte	.LFB354
	.uleb128 .LFE354-.LFB354
	.byte	0x7
	.4byte	.LFB365
	.uleb128 .LFE365-.LFB365
	.byte	0x7
	.4byte	.LFB355
	.uleb128 .LFE355-.LFB355
	.byte	0x7
	.4byte	.LFB366
	.uleb128 .LFE366-.LFB366
	.byte	0x7
	.4byte	.LFB356
	.uleb128 .LFE356-.LFB356
	.byte	0x7
	.4byte	.LFB367
	.uleb128 .LFE367-.LFB367
	.byte	0x7
	.4byte	.LFB357
	.uleb128 .LFE357-.LFB357
	.byte	0x7
	.4byte	.LFB368
	.uleb128 .LFE368-.LFB368
	.byte	0x7
	.4byte	.LFB358
	.uleb128 .LFE358-.LFB358
	.byte	0x7
	.4byte	.LFB369
	.uleb128 .LFE369-.LFB369
	.byte	0x7
	.4byte	.LFB359
	.uleb128 .LFE359-.LFB359
	.byte	0x7
	.4byte	.LFB370
	.uleb128 .LFE370-.LFB370
	.byte	0x7
	.4byte	.LFB360
	.uleb128 .LFE360-.LFB360
	.byte	0x7
	.4byte	.LFB371
	.uleb128 .LFE371-.LFB371
	.byte	0x7
	.4byte	.LFB372
	.uleb128 .LFE372-.LFB372
	.byte	0x7
	.4byte	.LFB361
	.uleb128 .LFE361-.LFB361
	.byte	0x7
	.4byte	.LFB349
	.uleb128 .LFE349-.LFB349
	.byte	0x7
	.4byte	.LFB374
	.uleb128 .LFE374-.LFB374
	.byte	0x7
	.4byte	.LFB373
	.uleb128 .LFE373-.LFB373
	.byte	0x7
	.4byte	.LFB362
	.uleb128 .LFE362-.LFB362
	.byte	0x7
	.4byte	.LFB353
	.uleb128 .LFE353-.LFB353
	.byte	0x7
	.4byte	.LFB363
	.uleb128 .LFE363-.LFB363
	.byte	0x7
	.4byte	.LFB364
	.uleb128 .LFE364-.LFB364
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF189:
	.ascii	"count\000"
.LASF72:
	.ascii	"State\000"
.LASF149:
	.ascii	"SPI_TxISR_32BIT\000"
.LASF88:
	.ascii	"DMAmuxRequestGenStatusMask\000"
.LASF167:
	.ascii	"SPI_DMATransmitCplt\000"
.LASF37:
	.ascii	"FlagStatus\000"
.LASF62:
	.ascii	"DMA_InitTypeDef\000"
.LASF218:
	.ascii	"packet_length\000"
.LASF104:
	.ascii	"MasterSSIdleness\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF203:
	.ascii	"HAL_SPI_Transmit_IT\000"
.LASF84:
	.ascii	"DMAmuxChannelStatus\000"
.LASF44:
	.ascii	"HAL_BUSY\000"
.LASF97:
	.ascii	"CRCPolynomial\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF32:
	.ascii	"RXCRC\000"
.LASF177:
	.ascii	"HAL_SPI_RxCpltCallback\000"
.LASF199:
	.ascii	"HAL_SPI_Transmit_DMA\000"
.LASF207:
	.ascii	"temp_sr_reg\000"
.LASF140:
	.ascii	"SPI_WaitOnFlagUntilTimeout\000"
.LASF163:
	.ascii	"SPI_DMAHalfReceiveCplt\000"
.LASF198:
	.ascii	"pData\000"
.LASF212:
	.ascii	"HAL_SPI_Transmit\000"
.LASF162:
	.ascii	"SPI_DMAHalfTransmitReceiveCplt\000"
.LASF215:
	.ascii	"HAL_SPI_DeInit\000"
.LASF124:
	.ascii	"pRxBuffPtr\000"
.LASF9:
	.ascii	"long long int\000"
.LASF1:
	.ascii	"signed char\000"
.LASF174:
	.ascii	"HAL_SPI_RxHalfCpltCallback\000"
.LASF75:
	.ascii	"XferHalfCpltCallback\000"
.LASF179:
	.ascii	"HAL_SPI_IRQHandler\000"
.LASF34:
	.ascii	"I2SCFGR\000"
.LASF136:
	.ascii	"HAL_DMA_Start_IT\000"
.LASF98:
	.ascii	"CRCLength\000"
.LASF161:
	.ascii	"SPI_DMAError\000"
.LASF76:
	.ascii	"XferM1CpltCallback\000"
.LASF20:
	.ascii	"RGCFR\000"
.LASF49:
	.ascii	"HAL_LockTypeDef\000"
.LASF132:
	.ascii	"SPI_HandleTypeDef\000"
.LASF192:
	.ascii	"HAL_SPI_Abort\000"
.LASF6:
	.ascii	"long int\000"
.LASF121:
	.ascii	"pTxBuffPtr\000"
.LASF113:
	.ascii	"HAL_SPI_STATE_BUSY_TX\000"
.LASF52:
	.ascii	"PeriphInc\000"
.LASF142:
	.ascii	"Flag\000"
.LASF60:
	.ascii	"MemBurst\000"
.LASF101:
	.ascii	"FifoThreshold\000"
.LASF217:
	.ascii	"crc_length\000"
.LASF66:
	.ascii	"HAL_DMA_STATE_ERROR\000"
.LASF0:
	.ascii	"short int\000"
.LASF13:
	.ascii	"uint16_t\000"
.LASF41:
	.ascii	"double\000"
.LASF35:
	.ascii	"SPI_TypeDef\000"
.LASF159:
	.ascii	"SPI_DMATxAbortCallback\000"
.LASF157:
	.ascii	"SPI_DMARxAbortCallback\000"
.LASF81:
	.ascii	"StreamBaseAddress\000"
.LASF56:
	.ascii	"Mode\000"
.LASF73:
	.ascii	"Parent\000"
.LASF71:
	.ascii	"Lock\000"
.LASF219:
	.ascii	"crc_poly_msb_mask\000"
.LASF144:
	.ascii	"Timeout\000"
.LASF51:
	.ascii	"Direction\000"
.LASF195:
	.ascii	"pRxData\000"
.LASF166:
	.ascii	"SPI_DMAReceiveCplt\000"
.LASF86:
	.ascii	"DMAmuxRequestGen\000"
.LASF131:
	.ascii	"hdmarx\000"
.LASF187:
	.ascii	"HAL_SPI_Abort_IT\000"
.LASF45:
	.ascii	"HAL_TIMEOUT\000"
.LASF107:
	.ascii	"MasterKeepIOState\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF63:
	.ascii	"HAL_DMA_STATE_RESET\000"
.LASF223:
	.ascii	"SystemCoreClock\000"
.LASF139:
	.ascii	"SPI_GetPacketSize\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF210:
	.ascii	"init_max_data_in_fifo\000"
.LASF133:
	.ascii	"HAL_DMA_Abort_IT\000"
.LASF173:
	.ascii	"HAL_SPI_TxRxHalfCpltCallback\000"
.LASF31:
	.ascii	"TXCRC\000"
.LASF82:
	.ascii	"StreamIndex\000"
.LASF176:
	.ascii	"HAL_SPI_TxRxCpltCallback\000"
.LASF42:
	.ascii	"HAL_OK\000"
.LASF120:
	.ascii	"__SPI_HandleTypeDef\000"
.LASF125:
	.ascii	"RxXferSize\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF153:
	.ascii	"SPI_RxISR_32BIT\000"
.LASF169:
	.ascii	"HAL_SPI_GetState\000"
.LASF122:
	.ascii	"TxXferSize\000"
.LASF105:
	.ascii	"MasterInterDataIdleness\000"
.LASF67:
	.ascii	"HAL_DMA_STATE_ABORT\000"
.LASF171:
	.ascii	"HAL_SPI_AbortCpltCallback\000"
.LASF80:
	.ascii	"ErrorCode\000"
.LASF94:
	.ascii	"FirstBit\000"
.LASF55:
	.ascii	"MemDataAlignment\000"
.LASF26:
	.ascii	"TXDR\000"
.LASF197:
	.ascii	"HAL_SPI_Receive_DMA\000"
.LASF115:
	.ascii	"HAL_SPI_STATE_BUSY_TX_RX\000"
.LASF106:
	.ascii	"MasterReceiverAutoSusp\000"
.LASF46:
	.ascii	"HAL_StatusTypeDef\000"
.LASF134:
	.ascii	"HAL_DMA_Abort\000"
.LASF93:
	.ascii	"BaudRatePrescaler\000"
.LASF183:
	.ascii	"handled\000"
.LASF138:
	.ascii	"data_size\000"
.LASF64:
	.ascii	"HAL_DMA_STATE_READY\000"
.LASF91:
	.ascii	"CLKPolarity\000"
.LASF208:
	.ascii	"initial_TxXferCount\000"
.LASF70:
	.ascii	"Init\000"
.LASF158:
	.ascii	"hdma\000"
.LASF193:
	.ascii	"HAL_SPI_TransmitReceive_DMA\000"
.LASF99:
	.ascii	"NSSPMode\000"
.LASF180:
	.ascii	"itsource\000"
.LASF172:
	.ascii	"HAL_SPI_ErrorCallback\000"
.LASF206:
	.ascii	"fifo_length\000"
.LASF103:
	.ascii	"RxCRCInitializationPattern\000"
.LASF224:
	.ascii	"HAL_GetTick\000"
.LASF16:
	.ascii	"DMAMUX_ChannelStatus_TypeDef\000"
.LASF100:
	.ascii	"NSSPolarity\000"
.LASF220:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF108:
	.ascii	"IOSwap\000"
.LASF48:
	.ascii	"HAL_LOCKED\000"
.LASF194:
	.ascii	"pTxData\000"
.LASF156:
	.ascii	"SPI_RxISR_8BIT\000"
.LASF89:
	.ascii	"DMA_HandleTypeDef\000"
.LASF147:
	.ascii	"SPI_CloseTransfer\000"
.LASF78:
	.ascii	"XferErrorCallback\000"
.LASF155:
	.ascii	"prxdr_16bits\000"
.LASF130:
	.ascii	"hdmatx\000"
.LASF92:
	.ascii	"CLKPhase\000"
.LASF190:
	.ascii	"dma_tx_abort_done\000"
.LASF209:
	.ascii	"initial_RxXferCount\000"
.LASF18:
	.ascii	"DMAMUX_RequestGen_TypeDef\000"
.LASF17:
	.ascii	"RGCR\000"
.LASF150:
	.ascii	"SPI_TxISR_16BIT\000"
.LASF40:
	.ascii	"float\000"
.LASF127:
	.ascii	"CRCSize\000"
.LASF123:
	.ascii	"TxXferCount\000"
.LASF196:
	.ascii	"Size\000"
.LASF25:
	.ascii	"RESERVED0\000"
.LASF69:
	.ascii	"Instance\000"
.LASF29:
	.ascii	"RESERVED2\000"
.LASF116:
	.ascii	"HAL_SPI_STATE_ERROR\000"
.LASF36:
	.ascii	"RESET\000"
.LASF213:
	.ascii	"HAL_SPI_MspDeInit\000"
.LASF165:
	.ascii	"SPI_DMATransmitReceiveCplt\000"
.LASF77:
	.ascii	"XferM1HalfCpltCallback\000"
.LASF109:
	.ascii	"SPI_InitTypeDef\000"
.LASF141:
	.ascii	"hspi\000"
.LASF28:
	.ascii	"RXDR\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF170:
	.ascii	"HAL_SPI_SuspendCallback\000"
.LASF128:
	.ascii	"RxISR\000"
.LASF102:
	.ascii	"TxCRCInitializationPattern\000"
.LASF68:
	.ascii	"HAL_DMA_StateTypeDef\000"
.LASF87:
	.ascii	"DMAmuxRequestGenStatus\000"
.LASF65:
	.ascii	"HAL_DMA_STATE_BUSY\000"
.LASF188:
	.ascii	"errorcode\000"
.LASF205:
	.ascii	"tickstart\000"
.LASF53:
	.ascii	"MemInc\000"
.LASF19:
	.ascii	"RGSR\000"
.LASF154:
	.ascii	"SPI_RxISR_16BIT\000"
.LASF117:
	.ascii	"HAL_SPI_STATE_ABORT\000"
.LASF33:
	.ascii	"UDRDR\000"
.LASF27:
	.ascii	"RESERVED1\000"
.LASF135:
	.ascii	"HAL_DMA_GetError\000"
.LASF110:
	.ascii	"HAL_SPI_STATE_RESET\000"
.LASF119:
	.ascii	"__DMA_HandleTypeDef\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF58:
	.ascii	"FIFOMode\000"
.LASF43:
	.ascii	"HAL_ERROR\000"
.LASF186:
	.ascii	"HAL_SPI_DMAPause\000"
.LASF151:
	.ascii	"ptxdr_16bits\000"
.LASF38:
	.ascii	"long double\000"
.LASF59:
	.ascii	"FIFOThreshold\000"
.LASF39:
	.ascii	"char\000"
.LASF50:
	.ascii	"Request\000"
.LASF175:
	.ascii	"HAL_SPI_TxHalfCpltCallback\000"
.LASF160:
	.ascii	"SPI_DMAAbortOnError\000"
.LASF191:
	.ascii	"dma_rx_abort_done\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF90:
	.ascii	"DataSize\000"
.LASF126:
	.ascii	"RxXferCount\000"
.LASF182:
	.ascii	"cfg1\000"
.LASF83:
	.ascii	"DMAmuxChannel\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF178:
	.ascii	"HAL_SPI_TxCpltCallback\000"
.LASF200:
	.ascii	"HAL_SPI_TransmitReceive_IT\000"
.LASF168:
	.ascii	"HAL_SPI_GetError\000"
.LASF184:
	.ascii	"HAL_SPI_DMAStop\000"
.LASF118:
	.ascii	"HAL_SPI_StateTypeDef\000"
.LASF112:
	.ascii	"HAL_SPI_STATE_BUSY\000"
.LASF202:
	.ascii	"HAL_SPI_Receive_IT\000"
.LASF54:
	.ascii	"PeriphDataAlignment\000"
.LASF111:
	.ascii	"HAL_SPI_STATE_READY\000"
.LASF85:
	.ascii	"DMAmuxChannelStatusMask\000"
.LASF15:
	.ascii	"DMAMUX_Channel_TypeDef\000"
.LASF22:
	.ascii	"CFG1\000"
.LASF23:
	.ascii	"CFG2\000"
.LASF164:
	.ascii	"SPI_DMAHalfTransmitCplt\000"
.LASF95:
	.ascii	"TIMode\000"
.LASF57:
	.ascii	"Priority\000"
.LASF221:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_spi.c\000"
.LASF145:
	.ascii	"Tickstart\000"
.LASF96:
	.ascii	"CRCCalculation\000"
.LASF185:
	.ascii	"HAL_SPI_DMAResume\000"
.LASF216:
	.ascii	"HAL_SPI_Init\000"
.LASF129:
	.ascii	"TxISR\000"
.LASF222:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF201:
	.ascii	"tmp_TxXferCount\000"
.LASF148:
	.ascii	"SPI_AbortTransfer\000"
.LASF114:
	.ascii	"HAL_SPI_STATE_BUSY_RX\000"
.LASF24:
	.ascii	"IFCR\000"
.LASF211:
	.ascii	"HAL_SPI_Receive\000"
.LASF47:
	.ascii	"HAL_UNLOCKED\000"
.LASF143:
	.ascii	"Status\000"
.LASF214:
	.ascii	"HAL_SPI_MspInit\000"
.LASF137:
	.ascii	"fifo_threashold\000"
.LASF30:
	.ascii	"CRCPOLY\000"
.LASF181:
	.ascii	"trigger\000"
.LASF152:
	.ascii	"SPI_TxISR_8BIT\000"
.LASF79:
	.ascii	"XferAbortCallback\000"
.LASF21:
	.ascii	"DMAMUX_RequestGenStatus_TypeDef\000"
.LASF74:
	.ascii	"XferCpltCallback\000"
.LASF146:
	.ascii	"itflag\000"
.LASF61:
	.ascii	"PeriphBurst\000"
.LASF204:
	.ascii	"HAL_SPI_TransmitReceive\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
