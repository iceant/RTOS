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
	.file	"stm32h7xx_ll_delayblock.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_ll_delayblock.c"
	.section	.text.DelayBlock_Enable,"ax",%progbits
	.align	1
	.global	DelayBlock_Enable
	.syntax unified
	.thumb
	.thumb_func
	.type	DelayBlock_Enable, %function
DelayBlock_Enable:
.LFB335:
	.loc 1 102 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 103 3
.LVL1:
	.loc 1 104 3
	.loc 1 105 3
	.loc 1 106 3
	.loc 1 107 3
	.loc 1 108 3
	.loc 1 109 3
	.loc 1 111 3
	.loc 1 111 13 is_stmt 0
	movs	r3, #3
	str	r3, [r0]
	.loc 1 113 3 is_stmt 1
.LVL2:
	.loc 1 113 20 is_stmt 0
	movs	r7, #0
	.loc 1 104 12
	mov	r10, r7
	.loc 1 103 12
	mov	fp, r7
.LVL3:
.L2:
	.loc 1 113 38 is_stmt 1 discriminator 1
	cmp	r7, #11
	bhi	.L16
	.loc 1 116 5
	.loc 1 116 14 is_stmt 0
	mov	r8, #65536
	lsl	r8, r8, r7
.LVL4:
	.loc 1 117 5 is_stmt 1
	.loc 1 118 5
	.loc 1 117 12 is_stmt 0
	mov	r9, #0
	.loc 1 118 23
	mov	r6, r9
.LVL5:
.L3:
	.loc 1 118 42 is_stmt 1 discriminator 1
	cmp	r6, #127
	bhi	.L10
	.loc 1 121 7
	.loc 1 121 61 is_stmt 0
	lsls	r3, r6, #8
	.loc 1 121 45
	orr	r3, r3, #12
	.loc 1 121 19
	str	r3, [r4, #4]
	.loc 1 124 7 is_stmt 1
	.loc 1 124 19 is_stmt 0
	bl	HAL_GetTick
.LVL6:
	mov	r5, r0
.LVL7:
	.loc 1 125 7 is_stmt 1
.L4:
	.loc 1 125 47
	.loc 1 125 20 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 125 47
	cmp	r3, #0
	blt	.L17
	.loc 1 127 9 is_stmt 1
	.loc 1 127 13 is_stmt 0
	bl	HAL_GetTick
.LVL8:
	.loc 1 127 27
	subs	r0, r0, r5
	.loc 1 127 11
	cmp	r0, #254
	bls	.L4
	.loc 1 129 18
	movs	r0, #3
.LVL9:
.L5:
	.loc 1 164 1
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.LVL10:
.L17:
	.loc 1 132 7 is_stmt 1
	.loc 1 132 10 is_stmt 0
	cmp	r9, #0
	bne	.L7
	.loc 1 134 9 is_stmt 1
	.loc 1 134 19 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 134 12
	tst	r3, r8
	beq	.L8
	.loc 1 137 18
	mov	r9, #1
.LVL11:
	b	.L8
.LVL12:
.L7:
	.loc 1 143 9 is_stmt 1
	.loc 1 143 18 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 143 11
	tst	r3, r8
	beq	.L18
.LVL13:
.L8:
	.loc 1 118 81 is_stmt 1 discriminator 2
	adds	r6, r6, #1
.LVL14:
	b	.L3
.L18:
	.loc 1 146 11
	.loc 1 146 13 is_stmt 0
	cmp	fp, #0
	bne	.L10
	.loc 1 148 13 is_stmt 1
.LVL15:
	.loc 1 149 13
	.loc 1 149 17 is_stmt 0
	add	r10, r7, #1
.LVL16:
	.loc 1 148 18
	mov	fp, r6
.LVL17:
.L10:
	.loc 1 113 76 is_stmt 1 discriminator 2
	adds	r7, r7, #1
.LVL18:
	b	.L2
.LVL19:
.L16:
	.loc 1 158 3
	.loc 1 158 13 is_stmt 0
	movs	r0, #0
	str	r0, [r4]
	.loc 1 159 3 is_stmt 1
	.loc 1 159 13 is_stmt 0
	movs	r3, #3
	str	r3, [r4]
	.loc 1 160 3 is_stmt 1
	.loc 1 160 21 is_stmt 0
	orr	r3, r10, fp, lsl #8
	.loc 1 160 15
	str	r3, [r4, #4]
	.loc 1 161 3 is_stmt 1
	.loc 1 161 13 is_stmt 0
	movs	r3, #1
	str	r3, [r4]
	.loc 1 163 3 is_stmt 1
	.loc 1 163 10 is_stmt 0
	b	.L5
	.cfi_endproc
.LFE335:
	.size	DelayBlock_Enable, .-DelayBlock_Enable
	.section	.text.DelayBlock_Disable,"ax",%progbits
	.align	1
	.global	DelayBlock_Disable
	.syntax unified
	.thumb
	.thumb_func
	.type	DelayBlock_Disable, %function
DelayBlock_Disable:
.LFB336:
	.loc 1 172 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL20:
	mov	r3, r0
	.loc 1 174 3
	.loc 1 174 13 is_stmt 0
	movs	r0, #0
.LVL21:
	str	r0, [r3]
	.loc 1 175 3 is_stmt 1
	.loc 1 176 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE336:
	.size	DelayBlock_Disable, .-DelayBlock_Disable
	.section	.text.DelayBlock_Configure,"ax",%progbits
	.align	1
	.global	DelayBlock_Configure
	.syntax unified
	.thumb
	.thumb_func
	.type	DelayBlock_Configure, %function
DelayBlock_Configure:
.LFB337:
	.loc 1 186 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL22:
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	mov	r3, r0
	.loc 1 189 3
	.loc 1 189 13 is_stmt 0
	movs	r0, #0
.LVL23:
	str	r0, [r3]
	.loc 1 190 3 is_stmt 1
	.loc 1 190 13 is_stmt 0
	movs	r4, #3
	str	r4, [r3]
	.loc 1 191 3 is_stmt 1
	.loc 1 191 26 is_stmt 0
	orr	r1, r1, r2, lsl #8
.LVL24:
	.loc 1 191 15
	str	r1, [r3, #4]
	.loc 1 192 3 is_stmt 1
	.loc 1 192 13 is_stmt 0
	movs	r2, #1
.LVL25:
	str	r2, [r3]
	.loc 1 194 3 is_stmt 1
	.loc 1 195 1 is_stmt 0
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE337:
	.size	DelayBlock_Configure, .-DelayBlock_Configure
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x224
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x1d
	.4byte	.LASF34
	.4byte	.LASF35
	.4byte	.LLRL12
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
	.uleb128 0x5
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
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
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
	.uleb128 0xb
	.byte	0x8
	.byte	0x4
	.2byte	0x59f
	.byte	0x9
	.4byte	0xaf
	.uleb128 0xc
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x5a1
	.byte	0x15
	.4byte	0x84
	.byte	0
	.uleb128 0xd
	.4byte	.LASF11
	.byte	0x4
	.2byte	0x5a2
	.byte	0x15
	.4byte	0x84
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.4byte	.LASF12
	.byte	0x4
	.2byte	0x5a3
	.byte	0x3
	.4byte	0x89
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
	.uleb128 0xf
	.byte	0x1
	.4byte	0x34
	.byte	0x5
	.byte	0x28
	.byte	0x1
	.4byte	0xfe
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x2
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.4byte	.LASF21
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0xd8
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x6
	.2byte	0x433
	.byte	0xa
	.4byte	0x78
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0xb9
	.4byte	0xfe
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15d
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0xb9
	.byte	0x36
	.4byte	0x15d
	.4byte	.LLST9
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0xb9
	.byte	0x45
	.4byte	0x78
	.4byte	.LLST10
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0xb9
	.byte	0x58
	.4byte	0x78
	.4byte	.LLST11
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0xaf
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0xab
	.4byte	0xfe
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18b
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0xab
	.byte	0x34
	.4byte	0x15d
	.4byte	.LLST8
	.byte	0
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x1
	.byte	0x65
	.byte	0x13
	.4byte	0xfe
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x65
	.byte	0x33
	.4byte	0x15d
	.4byte	.LLST0
	.uleb128 0x2
	.4byte	.LASF27
	.byte	0x67
	.4byte	0x78
	.4byte	.LLST1
	.uleb128 0x13
	.ascii	"sel\000"
	.byte	0x1
	.byte	0x68
	.byte	0xc
	.4byte	0x78
	.4byte	.LLST2
	.uleb128 0x2
	.4byte	.LASF28
	.byte	0x69
	.4byte	0x78
	.4byte	.LLST3
	.uleb128 0x2
	.4byte	.LASF29
	.byte	0x6a
	.4byte	0x78
	.4byte	.LLST4
	.uleb128 0x2
	.4byte	.LASF30
	.byte	0x6b
	.4byte	0x78
	.4byte	.LLST5
	.uleb128 0x2
	.4byte	.LASF31
	.byte	0x6c
	.4byte	0x78
	.4byte	.LLST6
	.uleb128 0x2
	.4byte	.LASF32
	.byte	0x6d
	.4byte	0x78
	.4byte	.LLST7
	.uleb128 0x7
	.4byte	.LVL6
	.4byte	0x10a
	.uleb128 0x7
	.4byte	.LVL8
	.4byte	0x10a
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
	.uleb128 0x3
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x34
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
.LLST9:
	.byte	0x6
	.4byte	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LFE337-.LVL22
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL24-.LVL22
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL24-.LVL22
	.uleb128 .LFE337-.LVL22
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL25-.LVL22
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL25-.LVL22
	.uleb128 .LFE337-.LVL22
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL20
	.byte	0x4
	.uleb128 .LVL20-.LVL20
	.uleb128 .LVL21-.LVL20
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL21-.LVL20
	.uleb128 .LFE336-.LVL20
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LFE335-.LVL0
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL3-.LVL1
	.uleb128 .LVL15-.LVL1
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL15-.LVL1
	.uleb128 .LVL17-.LVL1
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL17-.LVL1
	.uleb128 .LFE335-.LVL1
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL3-.LVL1
	.uleb128 .LFE335-.LVL1
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL2
	.byte	0x4
	.uleb128 .LVL2-.LVL2
	.uleb128 .LVL3-.LVL2
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL3-.LVL2
	.uleb128 .LFE335-.LVL2
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL5-.LVL4
	.uleb128 .LVL9-.LVL4
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL10-.LVL4
	.uleb128 .LVL19-.LVL4
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL5-.LVL4
	.uleb128 .LVL9-.LVL4
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL10-.LVL4
	.uleb128 .LVL11-.LVL4
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL12-.LVL4
	.uleb128 .LVL19-.LVL4
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL9-.LVL4
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL10-.LVL4
	.uleb128 .LVL19-.LVL4
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL7
	.byte	0x4
	.uleb128 .LVL7-.LVL7
	.uleb128 .LVL9-.LVL7
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL10-.LVL7
	.uleb128 .LVL17-.LVL7
	.uleb128 0x1
	.byte	0x55
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x2c
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
.LLRL12:
	.byte	0x7
	.4byte	.LFB335
	.uleb128 .LFE335-.LFB335
	.byte	0x7
	.4byte	.LFB336
	.uleb128 .LFE336-.LFB336
	.byte	0x7
	.4byte	.LFB337
	.uleb128 .LFE337-.LFB337
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF11:
	.ascii	"CFGR\000"
.LASF18:
	.ascii	"HAL_ERROR\000"
.LASF29:
	.ascii	"unit_current\000"
.LASF26:
	.ascii	"DelayBlock_Disable\000"
.LASF17:
	.ascii	"HAL_OK\000"
.LASF35:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF22:
	.ascii	"DLYBx\000"
.LASF12:
	.ascii	"DLYB_TypeDef\000"
.LASF34:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_ll_delayblock.c\000"
.LASF15:
	.ascii	"float\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF33:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF28:
	.ascii	"sel_current\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF4:
	.ascii	"long int\000"
.LASF36:
	.ascii	"HAL_GetTick\000"
.LASF20:
	.ascii	"HAL_TIMEOUT\000"
.LASF16:
	.ascii	"double\000"
.LASF24:
	.ascii	"Units\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF37:
	.ascii	"DelayBlock_Enable\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF25:
	.ascii	"DelayBlock_Configure\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF27:
	.ascii	"unit\000"
.LASF23:
	.ascii	"PhaseSel\000"
.LASF21:
	.ascii	"HAL_StatusTypeDef\000"
.LASF6:
	.ascii	"long long int\000"
.LASF32:
	.ascii	"tickstart\000"
.LASF14:
	.ascii	"char\000"
.LASF0:
	.ascii	"short int\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF19:
	.ascii	"HAL_BUSY\000"
.LASF31:
	.ascii	"lng_mask\000"
.LASF13:
	.ascii	"long double\000"
.LASF1:
	.ascii	"signed char\000"
.LASF30:
	.ascii	"tuning\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
