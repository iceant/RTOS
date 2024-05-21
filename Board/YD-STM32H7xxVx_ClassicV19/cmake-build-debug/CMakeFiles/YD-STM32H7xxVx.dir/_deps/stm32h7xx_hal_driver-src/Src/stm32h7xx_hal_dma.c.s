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
	.file	"stm32h7xx_hal_dma.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx_hal_dma.c"
	.section	.text.DMA_SetConfig,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	DMA_SetConfig, %function
DMA_SetConfig:
.LFB347:
	.loc 1 1774 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	push	{r4, r5, r6, r7}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 7, -4
	.loc 1 1776 3
	.loc 1 1776 60 is_stmt 0
	ldr	r7, [r0, #88]
.LVL1:
	.loc 1 1777 3 is_stmt 1
	.loc 1 1779 3
	.loc 1 1779 13 is_stmt 0
	ldr	r4, [r0]
	.loc 1 1779 2486
	ldr	r6, .L14
	ldr	r5, .L14+4
	cmp	r4, r5
	it	ne
	cmpne	r4, r6
	beq	.L2
	.loc 1 1779 218 discriminator 2
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 325 discriminator 4
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 432 discriminator 6
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 539 discriminator 8
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 646 discriminator 10
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 753 discriminator 12
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 860 discriminator 14
	add	r5, r5, #856
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 967 discriminator 16
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 1074 discriminator 18
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 1181 discriminator 20
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 1288 discriminator 22
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 1395 discriminator 24
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 1502 discriminator 26
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 1609 discriminator 28
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 1716 discriminator 30
	ldr	r5, .L14+8
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 1826 discriminator 32
	adds	r5, r5, #20
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 1936 discriminator 34
	adds	r5, r5, #20
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 2046 discriminator 36
	adds	r5, r5, #20
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 2156 discriminator 38
	adds	r5, r5, #20
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 2266 discriminator 40
	adds	r5, r5, #20
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 2376 discriminator 42
	adds	r5, r5, #20
	cmp	r4, r5
	beq	.L2
	.loc 1 1779 2486 discriminator 44
	adds	r5, r5, #20
	cmp	r4, r5
	bne	.L3
.L2:
	.loc 1 1782 5 is_stmt 1
	.loc 1 1782 9 is_stmt 0
	ldr	r4, [r0, #100]
	.loc 1 1782 42
	ldr	r5, [r0, #104]
	.loc 1 1782 36
	str	r5, [r4, #4]
	.loc 1 1784 5 is_stmt 1
	.loc 1 1784 12 is_stmt 0
	ldr	r4, [r0, #108]
	.loc 1 1784 7
	cbz	r4, .L3
	.loc 1 1787 7 is_stmt 1
	.loc 1 1787 11 is_stmt 0
	ldr	r4, [r0, #112]
	.loc 1 1787 49
	ldr	r5, [r0, #116]
	.loc 1 1787 43
	str	r5, [r4, #4]
.L3:
	.loc 1 1791 3 is_stmt 1
	.loc 1 1791 13 is_stmt 0
	ldr	r4, [r0]
	.loc 1 1791 1609
	ldr	r6, .L14
	ldr	r5, .L14+4
	cmp	r4, r5
	it	ne
	cmpne	r4, r6
	beq	.L4
	.loc 1 1791 218 discriminator 2
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 325 discriminator 4
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 432 discriminator 6
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 539 discriminator 8
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 646 discriminator 10
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 753 discriminator 12
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 860 discriminator 14
	add	r5, r5, #856
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 967 discriminator 16
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 1074 discriminator 18
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 1181 discriminator 20
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 1288 discriminator 22
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 1395 discriminator 24
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 1502 discriminator 26
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1791 1609 discriminator 28
	adds	r5, r5, #24
	cmp	r4, r5
	beq	.L4
	.loc 1 1821 8 is_stmt 1
	.loc 1 1821 779 is_stmt 0
	ldr	r6, .L14+8
	ldr	r5, .L14+12
	cmp	r4, r5
	it	ne
	cmpne	r4, r6
	beq	.L5
	.loc 1 1821 229 discriminator 2
	ldr	r5, .L14+16
	cmp	r4, r5
	beq	.L5
	.loc 1 1821 339 discriminator 4
	adds	r5, r5, #20
	cmp	r4, r5
	beq	.L5
	.loc 1 1821 449 discriminator 6
	adds	r5, r5, #20
	cmp	r4, r5
	beq	.L5
	.loc 1 1821 559 discriminator 8
	adds	r5, r5, #20
	cmp	r4, r5
	beq	.L5
	.loc 1 1821 669 discriminator 10
	adds	r5, r5, #20
	cmp	r4, r5
	beq	.L5
	.loc 1 1821 779 discriminator 12
	adds	r5, r5, #20
	cmp	r4, r5
	bne	.L1
.L5:
	.loc 1 1824 5 is_stmt 1
	.loc 1 1824 49 is_stmt 0
	ldr	r4, [r0, #92]
	.loc 1 1824 63
	and	r5, r4, #31
	.loc 1 1824 41
	movs	r4, #1
	lsls	r4, r4, r5
	.loc 1 1824 21
	str	r4, [r7, #4]
	.loc 1 1827 5 is_stmt 1
	.loc 1 1827 34 is_stmt 0
	ldr	r4, [r0]
	.loc 1 1827 53
	str	r3, [r4, #4]
	.loc 1 1830 5 is_stmt 1
	.loc 1 1830 19 is_stmt 0
	ldr	r3, [r0, #8]
.LVL2:
	.loc 1 1830 7
	cmp	r3, #64
	beq	.L12
	.loc 1 1842 7 is_stmt 1
	.loc 1 1842 36 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1842 54
	str	r1, [r3, #8]
.LVL3:
	.loc 1 1845 7 is_stmt 1
	.loc 1 1845 36 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1845 55
	str	r2, [r3, #12]
	.loc 1 1851 3 is_stmt 1
	.loc 1 1852 1 is_stmt 0
	b	.L1
.LVL4:
.L4:
	.loc 1 1794 5 is_stmt 1
	.loc 1 1794 37 is_stmt 0
	ldr	r4, [r0, #92]
	.loc 1 1794 51
	and	ip, r4, #31
	.loc 1 1794 29
	movs	r4, #63
	lsl	r4, r4, ip
	.loc 1 1794 20
	str	r4, [r7, #8]
	.loc 1 1797 5 is_stmt 1
	.loc 1 1797 32 is_stmt 0
	ldr	r5, [r0]
	.loc 1 1797 43
	ldr	r4, [r5]
	.loc 1 1797 48
	bic	r4, r4, #262144
	str	r4, [r5]
	.loc 1 1800 5 is_stmt 1
	.loc 1 1800 32 is_stmt 0
	ldr	r4, [r0]
	.loc 1 1800 50
	str	r3, [r4, #4]
	.loc 1 1803 5 is_stmt 1
	.loc 1 1803 19 is_stmt 0
	ldr	r3, [r0, #8]
.LVL5:
	.loc 1 1803 7
	cmp	r3, #64
	beq	.L13
	.loc 1 1815 7 is_stmt 1
	.loc 1 1815 34 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1815 51
	str	r1, [r3, #8]
.LVL6:
	.loc 1 1818 7 is_stmt 1
	.loc 1 1818 34 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1818 52
	str	r2, [r3, #12]
.L1:
	.loc 1 1852 1
	pop	{r4, r5, r6, r7}
	.cfi_remember_state
	.cfi_restore 7
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
.LVL7:
	bx	lr
.LVL8:
.L13:
	.cfi_restore_state
	.loc 1 1806 7 is_stmt 1
	.loc 1 1806 34 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1806 51
	str	r2, [r3, #8]
.LVL9:
	.loc 1 1809 7 is_stmt 1
	.loc 1 1809 34 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1809 52
	str	r1, [r3, #12]
	b	.L1
.LVL10:
.L12:
	.loc 1 1833 7 is_stmt 1
	.loc 1 1833 36 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1833 54
	str	r2, [r3, #8]
.LVL11:
	.loc 1 1836 7 is_stmt 1
	.loc 1 1836 36 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1836 55
	str	r1, [r3, #12]
	b	.L1
.L15:
	.align	2
.L14:
	.word	1073872912
	.word	1073872936
	.word	1476547592
	.word	1476547612
	.word	1476547632
	.cfi_endproc
.LFE347:
	.size	DMA_SetConfig, .-DMA_SetConfig
	.section	.text.DMA_CalcBaseAndBitshift,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	DMA_CalcBaseAndBitshift, %function
DMA_CalcBaseAndBitshift:
.LFB348:
	.loc 1 1861 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL12:
	.loc 1 1862 3
	.loc 1 1862 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1862 1609
	ldr	r1, .L23
	ldr	r2, .L23+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L17
	.loc 1 1862 218 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 325 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 432 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 539 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 646 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 753 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 860 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 967 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 1074 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 1181 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 1288 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 1395 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 1502 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1862 1609 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L17
	.loc 1 1884 5 is_stmt 1
	.loc 1 1884 70 is_stmt 0
	bic	r3, r3, #255
	.loc 1 1884 29
	str	r3, [r0, #88]
	.loc 1 1887 3 is_stmt 1
	.loc 1 1888 1 is_stmt 0
	ldr	r0, [r0, #88]
.LVL13:
	bx	lr
.LVL14:
.L17:
	.loc 1 1861 1
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
.LBB2:
	.loc 1 1864 5 is_stmt 1
	.loc 1 1864 70 is_stmt 0
	uxtb	r1, r3
	.loc 1 1864 79
	subs	r1, r1, #16
	.loc 1 1864 14
	ldr	r2, .L23+8
	umull	r4, r2, r2, r1
.LVL15:
	.loc 1 1867 5 is_stmt 1
	.loc 1 1868 5
	.loc 1 1868 58 is_stmt 0
	ubfx	r2, r2, #4, #3
.LVL16:
	.loc 1 1868 43
	ldr	r4, .L23+12
	ldrb	r2, [r4, r2]	@ zero_extendqisi2
	.loc 1 1868 23
	str	r2, [r0, #92]
	.loc 1 1870 5 is_stmt 1
	.loc 1 1870 8 is_stmt 0
	cmp	r1, #95
	bls	.L19
	.loc 1 1873 7 is_stmt 1
	.loc 1 1873 73 is_stmt 0
	ldr	r2, .L23+16
	ands	r2, r2, r3
	.loc 1 1873 96
	adds	r2, r2, #4
	.loc 1 1873 31
	str	r2, [r0, #88]
.L18:
.LBE2:
	.loc 1 1887 3 is_stmt 1
	.loc 1 1888 1 is_stmt 0
	ldr	r0, [r0, #88]
.LVL17:
	ldr	r4, [sp], #4
	.cfi_remember_state
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.LVL18:
.L19:
	.cfi_restore_state
.LBB3:
	.loc 1 1878 7 is_stmt 1
	.loc 1 1878 72 is_stmt 0
	ldr	r2, .L23+16
	ands	r2, r2, r3
	.loc 1 1878 31
	str	r2, [r0, #88]
	b	.L18
.L24:
	.align	2
.L23:
	.word	1073872912
	.word	1073872936
	.word	-1431655765
	.word	flagBitshiftOffset.0
	.word	-1024
.LBE3:
	.cfi_endproc
.LFE348:
	.size	DMA_CalcBaseAndBitshift, .-DMA_CalcBaseAndBitshift
	.section	.text.DMA_CheckFifoParam,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	DMA_CheckFifoParam, %function
DMA_CheckFifoParam:
.LFB349:
	.loc 1 1897 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL19:
	.loc 1 1898 3
	.loc 1 1901 3
	.loc 1 1901 17 is_stmt 0
	ldr	r3, [r0, #24]
	.loc 1 1901 6
	cbnz	r3, .L26
	.loc 1 1903 5 is_stmt 1
	.loc 1 1903 23 is_stmt 0
	ldr	r3, [r0, #40]
	.loc 1 1903 5
	cmp	r3, #1
	beq	.L27
	cmp	r3, #2
	beq	.L28
	cbz	r3, .L28
	movs	r0, #0
.LVL20:
	bx	lr
.LVL21:
.L28:
	.loc 1 1908 9 is_stmt 1
	.loc 1 1908 24 is_stmt 0
	ldr	r3, [r0, #44]
	.loc 1 1908 12
	tst	r3, #16777216
	bne	.L36
	.loc 1 1898 21
	movs	r0, #0
.LVL22:
	bx	lr
.LVL23:
.L27:
	.loc 1 1915 9 is_stmt 1
	.loc 1 1915 23 is_stmt 0
	ldr	r3, [r0, #44]
	.loc 1 1915 12
	cmp	r3, #25165824
	beq	.L37
	.loc 1 1898 21
	movs	r0, #0
.LVL24:
	bx	lr
.LVL25:
.L26:
	.loc 1 1930 8 is_stmt 1
	.loc 1 1930 11 is_stmt 0
	cmp	r3, #8192
	beq	.L44
	.loc 1 1961 5 is_stmt 1
	.loc 1 1961 23 is_stmt 0
	ldr	r3, [r0, #40]
	.loc 1 1961 5
	cmp	r3, #2
	bls	.L41
	cmp	r3, #3
	bne	.L42
	.loc 1 1970 9 is_stmt 1
	.loc 1 1970 24 is_stmt 0
	ldr	r3, [r0, #44]
	.loc 1 1970 12
	tst	r3, #16777216
	bne	.L43
	.loc 1 1898 21
	movs	r0, #0
.LVL26:
	bx	lr
.LVL27:
.L44:
	.loc 1 1932 5 is_stmt 1
	.loc 1 1932 23 is_stmt 0
	ldr	r3, [r0, #40]
	.loc 1 1932 5
	cmp	r3, #3
	bhi	.L31
	tbb	[pc, r3]
.L33:
	.byte	(.L38-.L33)/2
	.byte	(.L34-.L33)/2
	.byte	(.L38-.L33)/2
	.byte	(.L32-.L33)/2
	.p2align 1
.L31:
	movs	r0, #0
.LVL28:
	bx	lr
.LVL29:
.L34:
	.loc 1 1940 9 is_stmt 1
	.loc 1 1940 24 is_stmt 0
	ldr	r3, [r0, #44]
	.loc 1 1940 12
	tst	r3, #16777216
	bne	.L39
	.loc 1 1898 21
	movs	r0, #0
.LVL30:
	bx	lr
.LVL31:
.L32:
	.loc 1 1947 9 is_stmt 1
	.loc 1 1947 23 is_stmt 0
	ldr	r3, [r0, #44]
	.loc 1 1947 12
	cmp	r3, #25165824
	beq	.L40
	.loc 1 1898 21
	movs	r0, #0
.LVL32:
	bx	lr
.LVL33:
.L36:
	.loc 1 1910 18
	movs	r0, #1
.LVL34:
	bx	lr
.LVL35:
.L37:
	.loc 1 1917 18
	movs	r0, #1
.LVL36:
	bx	lr
.LVL37:
.L38:
	.loc 1 1936 16
	movs	r0, #1
.LVL38:
	bx	lr
.LVL39:
.L39:
	.loc 1 1942 18
	movs	r0, #1
.LVL40:
	bx	lr
.LVL41:
.L40:
	.loc 1 1949 18
	movs	r0, #1
.LVL42:
	bx	lr
.LVL43:
.L41:
	.loc 1 1966 16
	movs	r0, #1
.LVL44:
	bx	lr
.LVL45:
.L42:
	.loc 1 1961 5
	movs	r0, #0
.LVL46:
	bx	lr
.LVL47:
.L43:
	.loc 1 1972 18
	movs	r0, #1
.LVL48:
	.loc 1 1981 3 is_stmt 1
	.loc 1 1982 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE349:
	.size	DMA_CheckFifoParam, .-DMA_CheckFifoParam
	.section	.text.DMA_CalcDMAMUXChannelBaseAndMask,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	DMA_CalcDMAMUXChannelBaseAndMask, %function
DMA_CalcDMAMUXChannelBaseAndMask:
.LFB350:
	.loc 1 1991 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL49:
	.loc 1 1992 3
	.loc 1 1993 3
	.loc 1 1993 59 is_stmt 0
	ldr	r3, [r0]
.LVL50:
	.loc 1 1995 3 is_stmt 1
	.loc 1 1995 774 is_stmt 0
	ldr	r1, .L50
	ldr	r2, .L50+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L46
	.loc 1 1995 224 discriminator 2
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L46
	.loc 1 1995 334 discriminator 4
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L46
	.loc 1 1995 444 discriminator 6
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L46
	.loc 1 1995 554 discriminator 8
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L46
	.loc 1 1995 664 discriminator 10
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L46
	.loc 1 1995 774 discriminator 12
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L46
	.loc 1 2006 5 is_stmt 1
	.loc 1 2006 61 is_stmt 0
	uxtb	r2, r3
	.loc 1 2006 70
	subs	r2, r2, #16
	.loc 1 2006 19
	ldr	r1, .L50+8
	umull	r1, r2, r1, r2
	lsrs	r2, r2, #4
.LVL51:
	.loc 1 2008 5 is_stmt 1
	.loc 1 2008 127 is_stmt 0
	ldr	r1, .L50+12
	add	r1, r1, r3
	.loc 1 2008 7
	cmp	r1, #168
	bls	.L47
.L48:
	.loc 1 2013 5 is_stmt 1
	.loc 1 2013 54 is_stmt 0
	ldr	r3, .L50+16
.LVL52:
	add	r3, r3, r2
	lsls	r3, r3, #2
	.loc 1 2013 25
	str	r3, [r0, #96]
	.loc 1 2014 5 is_stmt 1
	.loc 1 2014 31 is_stmt 0
	ldr	r3, .L50+20
	str	r3, [r0, #100]
	.loc 1 2015 5 is_stmt 1
	.loc 1 2015 59 is_stmt 0
	and	r2, r2, #31
.LVL53:
	.loc 1 2015 41
	movs	r3, #1
	lsls	r3, r3, r2
	.loc 1 2015 35
	str	r3, [r0, #104]
	.loc 1 2017 1
	bx	lr
.LVL54:
.L46:
	.loc 1 1998 5 is_stmt 1
	.loc 1 1998 61 is_stmt 0
	uxtb	r3, r3
.LVL55:
	.loc 1 1998 70
	subs	r3, r3, #8
	.loc 1 1998 19
	ldr	r2, .L50+24
	umull	r2, r3, r2, r3
.LVL56:
	.loc 1 1999 5 is_stmt 1
	.loc 1 1999 54 is_stmt 0
	ldr	r2, .L50+28
	add	r2, r2, r3, lsr #4
	lsls	r2, r2, #2
	.loc 1 1999 25
	str	r2, [r0, #96]
	.loc 1 2000 5 is_stmt 1
	.loc 1 2000 31 is_stmt 0
	ldr	r2, .L50+32
	str	r2, [r0, #100]
	.loc 1 2001 5 is_stmt 1
	.loc 1 2001 59 is_stmt 0
	ubfx	r3, r3, #4, #5
.LVL57:
	.loc 1 2001 41
	movs	r2, #1
	lsl	r3, r2, r3
	.loc 1 2001 35
	str	r3, [r0, #104]
	bx	lr
.LVL58:
.L47:
	.loc 1 2011 7 is_stmt 1
	.loc 1 2011 21 is_stmt 0
	adds	r2, r2, #8
.LVL59:
	b	.L48
.L51:
	.align	2
.L50:
	.word	1476547592
	.word	1476547612
	.word	-1431655765
	.word	-1073873936
	.word	268468736
	.word	1073875072
	.word	-858993459
	.word	369137152
	.word	1476548736
	.cfi_endproc
.LFE350:
	.size	DMA_CalcDMAMUXChannelBaseAndMask, .-DMA_CalcDMAMUXChannelBaseAndMask
	.section	.text.DMA_CalcDMAMUXRequestGenBaseAndMask,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	DMA_CalcDMAMUXRequestGenBaseAndMask, %function
DMA_CalcDMAMUXRequestGenBaseAndMask:
.LFB351:
	.loc 1 2026 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL60:
	.loc 1 2027 3
	.loc 1 2027 12 is_stmt 0
	ldrb	r1, [r0, #4]	@ zero_extendqisi2
.LVL61:
	.loc 1 2029 3 is_stmt 1
	.loc 1 2029 22 is_stmt 0
	subs	r2, r1, #1
	.loc 1 2029 5
	cmp	r2, #7
	bhi	.L57
	.loc 1 2026 1
	push	{r4, r5}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
	.loc 1 2031 5 is_stmt 1
	.loc 1 2031 15 is_stmt 0
	ldr	r3, [r0]
	.loc 1 2031 776
	ldr	r5, .L60
	ldr	r4, .L60+4
	cmp	r3, r4
	it	ne
	cmpne	r3, r5
	beq	.L54
	.loc 1 2031 226 discriminator 2
	adds	r4, r4, #20
	cmp	r3, r4
	beq	.L54
	.loc 1 2031 336 discriminator 4
	adds	r4, r4, #20
	cmp	r3, r4
	beq	.L54
	.loc 1 2031 446 discriminator 6
	adds	r4, r4, #20
	cmp	r3, r4
	beq	.L54
	.loc 1 2031 556 discriminator 8
	adds	r4, r4, #20
	cmp	r3, r4
	beq	.L54
	.loc 1 2031 666 discriminator 10
	adds	r4, r4, #20
	cmp	r3, r4
	beq	.L54
	.loc 1 2031 776 discriminator 12
	adds	r4, r4, #20
	cmp	r3, r4
	beq	.L54
	.loc 1 2041 7 is_stmt 1
	.loc 1 2041 62 is_stmt 0
	ldr	r3, .L60+8
	add	r3, r3, r1
	lsls	r3, r3, #2
	.loc 1 2041 30
	str	r3, [r0, #108]
	.loc 1 2043 7 is_stmt 1
	.loc 1 2043 36 is_stmt 0
	ldr	r3, .L60+12
	str	r3, [r0, #112]
	b	.L55
.L54:
	.loc 1 2034 7 is_stmt 1
	.loc 1 2034 62 is_stmt 0
	ldr	r3, .L60+16
	add	r3, r3, r1
	lsls	r3, r3, #2
	.loc 1 2034 30
	str	r3, [r0, #108]
	.loc 1 2036 7 is_stmt 1
	.loc 1 2036 36 is_stmt 0
	ldr	r3, .L60+20
	str	r3, [r0, #112]
.L55:
	.loc 1 2046 5 is_stmt 1
	.loc 1 2046 44 is_stmt 0
	movs	r3, #1
	lsls	r3, r3, r2
	.loc 1 2046 38
	str	r3, [r0, #116]
	.loc 1 2048 1
	pop	{r4, r5}
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L57:
	bx	lr
.L61:
	.align	2
.L60:
	.word	1476547592
	.word	1476547612
	.word	268468799
	.word	1073875264
	.word	369137215
	.word	1476548928
	.cfi_endproc
.LFE351:
	.size	DMA_CalcDMAMUXRequestGenBaseAndMask, .-DMA_CalcDMAMUXRequestGenBaseAndMask
	.section	.text.HAL_DMA_Init,"ax",%progbits
	.align	1
	.global	HAL_DMA_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_Init, %function
HAL_DMA_Init:
.LFB335:
	.loc 1 217 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL62:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 218 3
	.loc 1 219 3
	.loc 1 219 24 is_stmt 0
	bl	HAL_GetTick
.LVL63:
	.loc 1 220 3 is_stmt 1
	.loc 1 221 3
	.loc 1 224 3
	.loc 1 224 5 is_stmt 0
	cmp	r4, #0
	beq	.L82
	mov	r5, r0
	.loc 1 230 3 is_stmt 1
	.loc 1 231 3
	.loc 1 232 3
	.loc 1 233 3
	.loc 1 234 3
	.loc 1 235 3
	.loc 1 236 3
	.loc 1 237 3
	.loc 1 239 3
	.loc 1 239 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 239 111
	ldr	r1, .L93
	ldr	r2, .L93+4
	.loc 1 239 1609
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	ite	eq
	moveq	r1, #1
	movne	r1, #0
	beq	.L64
	.loc 1 239 218 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 325 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 432 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 539 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 646 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 753 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 860 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L64
	.loc 1 239 967 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 1074 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 1181 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 1288 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 1395 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 1502 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 239 1609 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L64
	.loc 1 358 8 is_stmt 1
	.loc 1 358 779 is_stmt 0
	ldr	r1, .L93+8
	ldr	r2, .L93+12
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L65
	.loc 1 358 229 discriminator 2
	ldr	r2, .L93+16
	cmp	r3, r2
	beq	.L65
	.loc 1 358 339 discriminator 4
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L65
	.loc 1 358 449 discriminator 6
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L65
	.loc 1 358 559 discriminator 8
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L65
	.loc 1 358 669 discriminator 10
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L65
	.loc 1 358 779 discriminator 12
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L65
	.loc 1 405 5 is_stmt 1
	.loc 1 405 21 is_stmt 0
	movs	r3, #64
	str	r3, [r4, #84]
	.loc 1 406 5 is_stmt 1
	.loc 1 406 17 is_stmt 0
	movs	r3, #3
	strb	r3, [r4, #53]
	.loc 1 408 5 is_stmt 1
	.loc 1 408 12 is_stmt 0
	movs	r0, #1
.LVL64:
	b	.L63
.LVL65:
.L64:
	.loc 1 241 5 is_stmt 1
	.loc 1 242 5
	.loc 1 245 5
	.loc 1 247 7
	.loc 1 248 7
	.loc 1 249 7
	.loc 1 253 5
	.loc 1 253 17 is_stmt 0
	movs	r2, #2
	strb	r2, [r4, #53]
	.loc 1 256 5 is_stmt 1
	.loc 1 256 9
	.loc 1 256 22 is_stmt 0
	movs	r2, #0
	strb	r2, [r4, #52]
	.loc 1 256 7 is_stmt 1
	.loc 1 259 5
	.loc 1 259 1819 is_stmt 0
	cbnz	r1, .L67
	.loc 1 259 223 discriminator 2
	ldr	r2, .L93+20
	cmp	r3, r2
	beq	.L67
	.loc 1 259 332 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 441 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 550 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 659 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 768 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 877 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L67
	.loc 1 259 986 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 1095 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 1204 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 1313 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 1422 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 1531 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 1640 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L67
	.loc 1 259 1864 discriminator 30
	ldr	r2, [r3]
	.loc 1 259 1870 discriminator 30
	bic	r2, r2, #1
	str	r2, [r3]
	b	.L70
.L67:
	.loc 1 259 1793 discriminator 29
	ldr	r2, [r3]
	.loc 1 259 1798 discriminator 29
	bic	r2, r2, #1
	str	r2, [r3]
.LVL66:
.L70:
	.loc 1 262 74 is_stmt 1
	.loc 1 262 39 is_stmt 0
	ldr	r3, [r4]
	.loc 1 262 50
	ldr	r2, [r3]
	.loc 1 262 74
	tst	r2, #1
	beq	.L87
	.loc 1 265 7 is_stmt 1
	.loc 1 265 11 is_stmt 0
	bl	HAL_GetTick
.LVL67:
	.loc 1 265 25
	subs	r3, r0, r5
	.loc 1 265 9
	cmp	r3, #5
	bls	.L70
	.loc 1 268 9 is_stmt 1
	.loc 1 268 25 is_stmt 0
	movs	r3, #32
	str	r3, [r4, #84]
	.loc 1 271 9 is_stmt 1
	.loc 1 271 21 is_stmt 0
	movs	r3, #3
	strb	r3, [r4, #53]
	.loc 1 273 9 is_stmt 1
	.loc 1 273 16 is_stmt 0
	movs	r0, #1
.LVL68:
.L63:
	.loc 1 460 1
	pop	{r4, r5, r6, pc}
.LVL69:
.L94:
	.align	2
.L93:
	.word	1073872912
	.word	1073872936
	.word	1476547592
	.word	1476547612
	.word	1476547632
	.word	1073872960
.LVL70:
.L87:
	.loc 1 278 5 is_stmt 1
	.loc 1 278 19 is_stmt 0
	ldr	r2, [r3]
.LVL71:
	.loc 1 281 5 is_stmt 1
	.loc 1 281 19 is_stmt 0
	ldr	r1, .L95
	ands	r1, r1, r2
.LVL72:
	.loc 1 287 5 is_stmt 1
	.loc 1 287 32 is_stmt 0
	ldr	r2, [r4, #8]
	.loc 1 288 23
	ldr	r0, [r4, #12]
	.loc 1 287 43
	orrs	r2, r2, r0
	.loc 1 288 46
	ldr	r0, [r4, #16]
	.loc 1 288 34
	orrs	r2, r2, r0
	.loc 1 289 23
	ldr	r0, [r4, #20]
	.loc 1 288 54
	orrs	r2, r2, r0
	.loc 1 289 56
	ldr	r0, [r4, #24]
	.loc 1 289 44
	orrs	r2, r2, r0
	.loc 1 290 23
	ldr	r0, [r4, #28]
	.loc 1 289 74
	orrs	r2, r2, r0
	.loc 1 290 41
	ldr	r0, [r4, #32]
	.loc 1 290 29
	orrs	r2, r2, r0
	.loc 1 287 19
	orrs	r2, r2, r1
.LVL73:
	.loc 1 293 5 is_stmt 1
	.loc 1 293 18 is_stmt 0
	ldr	r1, [r4, #36]
	.loc 1 293 7
	cmp	r1, #4
	beq	.L88
.L72:
	.loc 1 302 5 is_stmt 1
	.loc 1 302 44 is_stmt 0
	ldr	r1, .L95+4
	ldr	r0, [r1]
	.loc 1 302 53
	ldr	r1, .L95+8
	ands	r1, r1, r0
	.loc 1 302 7
	cmp	r1, #536870912
	bcc	.L73
	.loc 1 305 7 is_stmt 1
	.loc 1 305 24 is_stmt 0
	ldr	r1, [r4, #4]
	.loc 1 305 76
	sub	r5, r1, #41
.LVL74:
	sub	r0, r1, #63
	.loc 1 305 213
	cmp	r0, #3
	it	hi
	cmphi	r5, #5
	bls	.L74
	.loc 1 305 179 discriminator 2
	sub	r0, r1, #71
	.loc 1 305 145 discriminator 2
	cmp	r0, #1
	bls	.L74
	.loc 1 305 247 discriminator 4
	subs	r1, r1, #79
	.loc 1 305 213 discriminator 4
	cmp	r1, #3
	bhi	.L73
.L74:
	.loc 1 307 9 is_stmt 1
	.loc 1 307 23 is_stmt 0
	orr	r2, r2, #1048576
.LVL75:
.L73:
	.loc 1 314 5 is_stmt 1
	.loc 1 314 48 is_stmt 0
	str	r2, [r3]
	.loc 1 317 5 is_stmt 1
	.loc 1 317 48 is_stmt 0
	ldr	r6, [r4]
	.loc 1 317 19
	ldr	r5, [r6, #20]
.LVL76:
	.loc 1 320 5 is_stmt 1
	.loc 1 320 19 is_stmt 0
	bic	r5, r5, #7
.LVL77:
	.loc 1 323 5 is_stmt 1
	.loc 1 323 32 is_stmt 0
	ldr	r3, [r4, #36]
	.loc 1 323 19
	orrs	r5, r5, r3
.LVL78:
	.loc 1 326 5 is_stmt 1
	.loc 1 326 7 is_stmt 0
	cmp	r3, #4
	bne	.L75
	.loc 1 329 7 is_stmt 1
	.loc 1 329 34 is_stmt 0
	ldr	r3, [r4, #40]
	.loc 1 329 21
	orrs	r5, r5, r3
.LVL79:
	.loc 1 333 7 is_stmt 1
	.loc 1 333 20 is_stmt 0
	ldr	r3, [r4, #44]
	.loc 1 333 9
	cbz	r3, .L75
	.loc 1 335 9 is_stmt 1
	.loc 1 335 13 is_stmt 0
	mov	r0, r4
	bl	DMA_CheckFifoParam
.LVL80:
	.loc 1 335 12
	cmp	r0, #0
	bne	.L89
.L75:
	.loc 1 349 5 is_stmt 1
	.loc 1 349 49 is_stmt 0
	str	r5, [r6, #20]
	.loc 1 353 5 is_stmt 1
	.loc 1 353 38 is_stmt 0
	mov	r0, r4
	bl	DMA_CalcBaseAndBitshift
.LVL81:
	.loc 1 356 5 is_stmt 1
	.loc 1 356 37 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 356 51
	and	r2, r3, #31
	.loc 1 356 29
	movs	r3, #63
	lsls	r3, r3, r2
	.loc 1 356 20
	str	r3, [r0, #8]
.LVL82:
.L76:
	.loc 1 411 3 is_stmt 1
	.loc 1 411 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 411 2486
	ldr	r1, .L95+12
	ldr	r2, .L95+16
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L78
	.loc 1 411 218 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 325 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 432 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 539 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 646 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 753 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 860 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L78
	.loc 1 411 967 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 1074 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 1181 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 1288 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 1395 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 1502 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 1609 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L78
	.loc 1 411 1716 discriminator 30
	ldr	r2, .L95+20
	cmp	r3, r2
	beq	.L78
	.loc 1 411 1826 discriminator 32
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L78
	.loc 1 411 1936 discriminator 34
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L78
	.loc 1 411 2046 discriminator 36
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L78
	.loc 1 411 2156 discriminator 38
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L78
	.loc 1 411 2266 discriminator 40
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L78
	.loc 1 411 2376 discriminator 42
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L78
	.loc 1 411 2486 discriminator 44
	adds	r2, r2, #20
	cmp	r3, r2
	bne	.L79
.L78:
	.loc 1 416 5 is_stmt 1
	mov	r0, r4
	bl	DMA_CalcDMAMUXChannelBaseAndMask
.LVL83:
	.loc 1 418 5
	.loc 1 418 18 is_stmt 0
	ldr	r3, [r4, #8]
	.loc 1 418 7
	cmp	r3, #128
	beq	.L90
.L80:
	.loc 1 425 5 is_stmt 1
	.loc 1 425 9 is_stmt 0
	ldr	r3, [r4, #96]
	.loc 1 425 52
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	.loc 1 425 30
	str	r2, [r3]
	.loc 1 428 5 is_stmt 1
	.loc 1 428 9 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 428 42
	ldr	r2, [r4, #104]
	.loc 1 428 36
	str	r2, [r3, #4]
	.loc 1 433 5 is_stmt 1
	.loc 1 433 19 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 433 35
	subs	r3, r3, #1
	.loc 1 433 7
	cmp	r3, #7
	bls	.L91
	.loc 1 447 7 is_stmt 1
	.loc 1 447 30 is_stmt 0
	movs	r3, #0
	str	r3, [r4, #108]
	.loc 1 448 7 is_stmt 1
	.loc 1 448 36 is_stmt 0
	str	r3, [r4, #112]
	.loc 1 449 7 is_stmt 1
	.loc 1 449 40 is_stmt 0
	str	r3, [r4, #116]
.L79:
	.loc 1 454 3 is_stmt 1
	.loc 1 454 19 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #84]
	.loc 1 457 3 is_stmt 1
	.loc 1 457 15 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #53]
	.loc 1 459 3 is_stmt 1
	.loc 1 459 10 is_stmt 0
	b	.L63
.LVL84:
.L88:
	.loc 1 296 7 is_stmt 1
	.loc 1 296 34 is_stmt 0
	ldr	r1, [r4, #44]
	.loc 1 296 56
	ldr	r0, [r4, #48]
	.loc 1 296 44
	orrs	r1, r1, r0
	.loc 1 296 21
	orrs	r2, r2, r1
.LVL85:
	b	.L72
.LVL86:
.L89:
	.loc 1 338 11 is_stmt 1
	.loc 1 338 27 is_stmt 0
	movs	r3, #64
	str	r3, [r4, #84]
	.loc 1 341 11 is_stmt 1
	.loc 1 341 23 is_stmt 0
	movs	r0, #1
	strb	r0, [r4, #53]
	.loc 1 343 11 is_stmt 1
	.loc 1 343 18 is_stmt 0
	b	.L63
.LVL87:
.L65:
	.loc 1 360 5 is_stmt 1
	.loc 1 363 7
	.loc 1 367 5
	.loc 1 367 17 is_stmt 0
	movs	r2, #2
	strb	r2, [r4, #53]
	.loc 1 370 5 is_stmt 1
	.loc 1 370 9
	.loc 1 370 22 is_stmt 0
	movs	r2, #0
	strb	r2, [r4, #52]
	.loc 1 370 7 is_stmt 1
	.loc 1 373 5
	.loc 1 373 19 is_stmt 0
	ldr	r2, [r3]
.LVL88:
	.loc 1 376 5 is_stmt 1
	.loc 1 376 19 is_stmt 0
	ldr	r1, .L95+24
	ands	r1, r1, r2
.LVL89:
	.loc 1 382 5 is_stmt 1
	.loc 1 382 35 is_stmt 0
	ldr	r2, [r4, #8]
	.loc 1 382 107
	cmp	r2, #64
	beq	.L83
	.loc 1 382 194 discriminator 1
	cmp	r2, #128
	beq	.L92
	.loc 1 382 194
	movs	r2, #0
.L77:
	.loc 1 383 35
	ldr	r0, [r4, #12]
.LVL90:
	.loc 1 382 211
	orr	r2, r2, r0, lsr #3
	.loc 1 384 35
	ldr	r0, [r4, #16]
	.loc 1 383 54
	orr	r2, r2, r0, lsr #3
	.loc 1 385 35
	ldr	r0, [r4, #20]
	.loc 1 384 51
	orr	r2, r2, r0, lsr #3
	.loc 1 386 35
	ldr	r0, [r4, #24]
	.loc 1 385 64
	orr	r2, r2, r0, lsr #3
	.loc 1 387 35
	ldr	r0, [r4, #28]
	.loc 1 386 61
	orr	r2, r2, r0, lsr #3
	.loc 1 388 35
	ldr	r0, [r4, #32]
	.loc 1 387 49
	orr	r2, r2, r0, lsr #4
	.loc 1 382 19
	orrs	r2, r2, r1
.LVL91:
	.loc 1 391 5 is_stmt 1
	.loc 1 391 51 is_stmt 0
	str	r2, [r3]
	.loc 1 394 5 is_stmt 1
	.loc 1 394 53 is_stmt 0
	ldr	r2, [r4]
.LVL92:
	.loc 1 394 65
	ldr	r3, .L95+28
.LVL93:
	add	r3, r3, r2
	.loc 1 394 163
	ldr	r2, .L95+32
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #4
	.loc 1 394 360
	lsls	r3, r3, #2
	.loc 1 394 23
	str	r3, [r4, #92]
	.loc 1 398 5 is_stmt 1
	.loc 1 398 40 is_stmt 0
	mov	r0, r4
	bl	DMA_CalcBaseAndBitshift
.LVL94:
	.loc 1 401 5 is_stmt 1
	.loc 1 401 50 is_stmt 0
	ldr	r2, [r4, #92]
	.loc 1 401 64
	and	r1, r2, #31
	.loc 1 401 42
	movs	r2, #1
	lsls	r2, r2, r1
	.loc 1 401 21
	str	r2, [r0, #4]
	b	.L76
.LVL95:
.L92:
	.loc 1 382 194
	mov	r2, #16384
	b	.L77
.L83:
	.loc 1 382 107
	movs	r2, #16
	b	.L77
.LVL96:
.L90:
	.loc 1 421 7 is_stmt 1
	.loc 1 421 26 is_stmt 0
	movs	r3, #0
	str	r3, [r4, #4]
	b	.L80
.L91:
	.loc 1 437 7 is_stmt 1
	mov	r0, r4
	bl	DMA_CalcDMAMUXRequestGenBaseAndMask
.LVL97:
	.loc 1 440 7
	.loc 1 440 11 is_stmt 0
	ldr	r3, [r4, #108]
	.loc 1 440 36
	movs	r2, #0
	str	r2, [r3]
	.loc 1 443 7 is_stmt 1
	.loc 1 443 11 is_stmt 0
	ldr	r3, [r4, #112]
	.loc 1 443 49
	ldr	r2, [r4, #116]
	.loc 1 443 43
	str	r2, [r3, #4]
	b	.L79
.LVL98:
.L82:
	.loc 1 226 12
	movs	r0, #1
.LVL99:
	b	.L63
.L96:
	.align	2
.L95:
	.word	-32473025
	.word	1543507968
	.word	-65536
	.word	1073872912
	.word	1073872936
	.word	1476547592
	.word	-131057
	.word	-1476547592
	.word	-858993459
	.cfi_endproc
.LFE335:
	.size	HAL_DMA_Init, .-HAL_DMA_Init
	.section	.text.HAL_DMA_DeInit,"ax",%progbits
	.align	1
	.global	HAL_DMA_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_DeInit, %function
HAL_DMA_DeInit:
.LFB336:
	.loc 1 469 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL100:
	.loc 1 470 3
	.loc 1 471 3
	.loc 1 474 3
	.loc 1 474 5 is_stmt 0
	cmp	r0, #0
	beq	.L108
	.loc 1 469 1
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 480 3 is_stmt 1
	.loc 1 480 14 is_stmt 0
	ldr	r3, [r0]
	.loc 1 480 1817
	ldr	r1, .L116
	ldr	r2, .L116+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L99
	.loc 1 480 221 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 330 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 439 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 548 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 657 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 766 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 875 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L99
	.loc 1 480 984 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 1093 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 1202 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 1311 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 1420 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 1529 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 1638 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L99
	.loc 1 480 1862 discriminator 30
	ldr	r2, [r3]
	.loc 1 480 1868 discriminator 30
	bic	r2, r2, #1
	str	r2, [r3]
	b	.L101
.L99:
	.loc 1 480 1791 discriminator 29
	ldr	r2, [r3]
	.loc 1 480 1796 discriminator 29
	bic	r2, r2, #1
	str	r2, [r3]
.L101:
	.loc 1 482 3 is_stmt 1
	.loc 1 482 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 482 1609
	ldr	r1, .L116
	ldr	r2, .L116+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L102
	.loc 1 482 218 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 325 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 432 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 539 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 646 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 753 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 860 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L102
	.loc 1 482 967 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 1074 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 1181 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 1288 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 1395 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 1502 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 482 1609 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L102
	.loc 1 508 8 is_stmt 1
	.loc 1 508 779 is_stmt 0
	ldr	r1, .L116+8
	ldr	r2, .L116+12
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L103
	.loc 1 508 229 discriminator 2
	ldr	r2, .L116+16
	cmp	r3, r2
	beq	.L103
	.loc 1 508 339 discriminator 4
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L103
	.loc 1 508 449 discriminator 6
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L103
	.loc 1 508 559 discriminator 8
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L103
	.loc 1 508 669 discriminator 10
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L103
	.loc 1 508 779 discriminator 12
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L103
	.loc 1 534 12
	movs	r0, #1
.LVL101:
	b	.L98
.LVL102:
.L102:
	.loc 1 485 5 is_stmt 1
	.loc 1 485 48 is_stmt 0
	movs	r2, #0
	str	r2, [r3]
	.loc 1 488 5 is_stmt 1
	.loc 1 488 32 is_stmt 0
	ldr	r3, [r4]
	.loc 1 488 50
	str	r2, [r3, #4]
	.loc 1 491 5 is_stmt 1
	.loc 1 491 32 is_stmt 0
	ldr	r3, [r4]
	.loc 1 491 49
	str	r2, [r3, #8]
	.loc 1 494 5 is_stmt 1
	.loc 1 494 32 is_stmt 0
	ldr	r3, [r4]
	.loc 1 494 50
	str	r2, [r3, #12]
	.loc 1 497 5 is_stmt 1
	.loc 1 497 32 is_stmt 0
	ldr	r3, [r4]
	.loc 1 497 50
	str	r2, [r3, #16]
	.loc 1 500 5 is_stmt 1
	.loc 1 500 32 is_stmt 0
	ldr	r3, [r4]
	.loc 1 500 49
	movs	r2, #33
	str	r2, [r3, #20]
	.loc 1 503 5 is_stmt 1
	.loc 1 503 38 is_stmt 0
	mov	r0, r4
.LVL103:
	bl	DMA_CalcBaseAndBitshift
.LVL104:
	.loc 1 506 5 is_stmt 1
	.loc 1 506 37 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 506 51
	and	r2, r3, #31
	.loc 1 506 29
	movs	r3, #63
	lsls	r3, r3, r2
	.loc 1 506 20
	str	r3, [r0, #8]
.LVL105:
.L105:
	.loc 1 543 5 is_stmt 1
	mov	r0, r4
	bl	DMA_CalcDMAMUXChannelBaseAndMask
.LVL106:
	.loc 1 545 5
	.loc 1 545 12 is_stmt 0
	ldr	r3, [r4, #96]
	.loc 1 545 7
	cbz	r3, .L106
	.loc 1 548 7 is_stmt 1
	.loc 1 548 32 is_stmt 0
	movs	r2, #0
	str	r2, [r3]
	.loc 1 551 7 is_stmt 1
	.loc 1 551 11 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 551 44
	ldr	r2, [r4, #104]
	.loc 1 551 38
	str	r2, [r3, #4]
.L106:
	.loc 1 554 5 is_stmt 1
	.loc 1 554 19 is_stmt 0
	ldr	r3, [r4, #4]
	.loc 1 554 35
	subs	r3, r3, #1
	.loc 1 554 7
	cmp	r3, #7
	bls	.L115
.L107:
	.loc 1 567 5 is_stmt 1
	.loc 1 567 28 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #108]
	.loc 1 568 5 is_stmt 1
	.loc 1 568 34 is_stmt 0
	str	r0, [r4, #112]
	.loc 1 569 5 is_stmt 1
	.loc 1 569 38 is_stmt 0
	str	r0, [r4, #116]
	.loc 1 574 3 is_stmt 1
	.loc 1 574 26 is_stmt 0
	str	r0, [r4, #60]
	.loc 1 575 3 is_stmt 1
	.loc 1 575 30 is_stmt 0
	str	r0, [r4, #64]
	.loc 1 576 3 is_stmt 1
	.loc 1 576 28 is_stmt 0
	str	r0, [r4, #68]
	.loc 1 577 3 is_stmt 1
	.loc 1 577 32 is_stmt 0
	str	r0, [r4, #72]
	.loc 1 578 3 is_stmt 1
	.loc 1 578 27 is_stmt 0
	str	r0, [r4, #76]
	.loc 1 579 3 is_stmt 1
	.loc 1 579 27 is_stmt 0
	str	r0, [r4, #80]
	.loc 1 582 3 is_stmt 1
	.loc 1 582 19 is_stmt 0
	str	r0, [r4, #84]
	.loc 1 585 3 is_stmt 1
	.loc 1 585 15 is_stmt 0
	strb	r0, [r4, #53]
	.loc 1 588 3 is_stmt 1
	.loc 1 588 7
	.loc 1 588 20 is_stmt 0
	strb	r0, [r4, #52]
	.loc 1 588 5 is_stmt 1
	.loc 1 590 3
.L98:
	.loc 1 591 1 is_stmt 0
	pop	{r4, pc}
.LVL107:
.L103:
	.loc 1 511 5 is_stmt 1
	.loc 1 511 51 is_stmt 0
	movs	r2, #0
	str	r2, [r3]
	.loc 1 514 5 is_stmt 1
	.loc 1 514 34 is_stmt 0
	ldr	r3, [r4]
	.loc 1 514 53
	str	r2, [r3, #4]
	.loc 1 517 5 is_stmt 1
	.loc 1 517 34 is_stmt 0
	ldr	r3, [r4]
	.loc 1 517 52
	str	r2, [r3, #8]
	.loc 1 520 5 is_stmt 1
	.loc 1 520 34 is_stmt 0
	ldr	r3, [r4]
	.loc 1 520 53
	str	r2, [r3, #12]
	.loc 1 523 5 is_stmt 1
	.loc 1 523 34 is_stmt 0
	ldr	r3, [r4]
	.loc 1 523 53
	str	r2, [r3, #16]
	.loc 1 526 5 is_stmt 1
	.loc 1 526 40 is_stmt 0
	mov	r0, r4
.LVL108:
	bl	DMA_CalcBaseAndBitshift
.LVL109:
	.loc 1 529 5 is_stmt 1
	.loc 1 529 50 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 529 64
	and	r2, r3, #31
	.loc 1 529 42
	movs	r3, #1
	lsls	r3, r3, r2
	.loc 1 529 21
	str	r3, [r0, #4]
	b	.L105
.LVL110:
.L115:
	.loc 1 558 7 is_stmt 1
	mov	r0, r4
	bl	DMA_CalcDMAMUXRequestGenBaseAndMask
.LVL111:
	.loc 1 561 7
	.loc 1 561 11 is_stmt 0
	ldr	r3, [r4, #108]
	.loc 1 561 36
	movs	r2, #0
	str	r2, [r3]
	.loc 1 564 7 is_stmt 1
	.loc 1 564 11 is_stmt 0
	ldr	r3, [r4, #112]
	.loc 1 564 49
	ldr	r2, [r4, #116]
	.loc 1 564 43
	str	r2, [r3, #4]
	b	.L107
.LVL112:
.L108:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 476 12
	movs	r0, #1
.LVL113:
	.loc 1 591 1
	bx	lr
.L117:
	.align	2
.L116:
	.word	1073872912
	.word	1073872936
	.word	1476547592
	.word	1476547612
	.word	1476547632
	.cfi_endproc
.LFE336:
	.size	HAL_DMA_DeInit, .-HAL_DMA_DeInit
	.section	.text.HAL_DMA_Start,"ax",%progbits
	.align	1
	.global	HAL_DMA_Start
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_Start, %function
HAL_DMA_Start:
.LFB337:
	.loc 1 626 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL114:
	.loc 1 627 3
	.loc 1 630 3
	.loc 1 633 3
	.loc 1 633 5 is_stmt 0
	cmp	r0, #0
	beq	.L126
	.loc 1 626 1
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 639 3 is_stmt 1
	.loc 1 639 7
	.loc 1 639 16 is_stmt 0
	ldrb	r0, [r0, #52]	@ zero_extendqisi2
.LVL115:
	.loc 1 639 9
	cmp	r0, #1
	beq	.L127
	.loc 1 639 66 is_stmt 1 discriminator 2
	.loc 1 639 79 is_stmt 0 discriminator 2
	movs	r0, #1
	strb	r0, [r4, #52]
	.loc 1 639 5 is_stmt 1 discriminator 2
	.loc 1 641 3 discriminator 2
	.loc 1 641 33 is_stmt 0 discriminator 2
	ldrb	r0, [r4, #53]	@ zero_extendqisi2
	uxtb	r0, r0
	.loc 1 641 5 discriminator 2
	cmp	r0, #1
	beq	.L132
	.loc 1 661 5 is_stmt 1
	.loc 1 661 21 is_stmt 0
	mov	r3, #2048
.LVL116:
	str	r3, [r4, #84]
	.loc 1 664 5 is_stmt 1
	.loc 1 664 9
	.loc 1 664 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 664 7 is_stmt 1
	.loc 1 667 5
.LVL117:
	.loc 1 667 12 is_stmt 0
	movs	r0, #1
.LVL118:
.L119:
	.loc 1 670 1
	pop	{r4, r5, r6, pc}
.LVL119:
.L132:
	.loc 1 644 5 is_stmt 1
	.loc 1 644 17 is_stmt 0
	movs	r0, #2
	strb	r0, [r4, #53]
	.loc 1 647 5 is_stmt 1
	.loc 1 647 21 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #84]
	.loc 1 650 5 is_stmt 1
	.loc 1 650 16 is_stmt 0
	ldr	r0, [r4]
	.loc 1 650 1819
	ldr	r6, .L133
	ldr	r5, .L133+4
	cmp	r0, r5
	it	ne
	cmpne	r0, r6
	beq	.L121
	.loc 1 650 223 discriminator 2
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 332 discriminator 4
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 441 discriminator 6
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 550 discriminator 8
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 659 discriminator 10
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 768 discriminator 12
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 877 discriminator 14
	add	r5, r5, #856
	cmp	r0, r5
	beq	.L121
	.loc 1 650 986 discriminator 16
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 1095 discriminator 18
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 1204 discriminator 20
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 1313 discriminator 22
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 1422 discriminator 24
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 1531 discriminator 26
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 1640 discriminator 28
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L121
	.loc 1 650 1864 discriminator 30
	ldr	r5, [r0]
	.loc 1 650 1870 discriminator 30
	bic	r5, r5, #1
	str	r5, [r0]
	b	.L123
.L121:
	.loc 1 650 1793 discriminator 29
	ldr	r5, [r0]
	.loc 1 650 1798 discriminator 29
	bic	r5, r5, #1
	str	r5, [r0]
.L123:
	.loc 1 653 5 is_stmt 1
	mov	r0, r4
	bl	DMA_SetConfig
.LVL120:
	.loc 1 656 5
	.loc 1 656 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 656 1818
	ldr	r1, .L133
	ldr	r2, .L133+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L124
	.loc 1 656 223 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 332 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 441 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 550 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 659 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 768 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 877 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L124
	.loc 1 656 986 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 1095 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 1204 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 1313 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 1422 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 1531 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 1640 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L124
	.loc 1 656 1863 discriminator 30
	ldr	r2, [r3]
	.loc 1 656 1869 discriminator 30
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 627 21 discriminator 30
	movs	r0, #0
	b	.L119
.L124:
	.loc 1 656 1793 discriminator 29
	ldr	r2, [r3]
	.loc 1 656 1798 discriminator 29
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 627 21 discriminator 29
	movs	r0, #0
	.loc 1 656 1818 discriminator 29
	b	.L119
.LVL121:
.L126:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 14
	.loc 1 635 12
	movs	r0, #1
.LVL122:
	.loc 1 670 1
	bx	lr
.LVL123:
.L127:
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 639 47
	movs	r0, #2
	b	.L119
.L134:
	.align	2
.L133:
	.word	1073872912
	.word	1073872936
	.cfi_endproc
.LFE337:
	.size	HAL_DMA_Start, .-HAL_DMA_Start
	.section	.text.HAL_DMA_Start_IT,"ax",%progbits
	.align	1
	.global	HAL_DMA_Start_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_Start_IT, %function
HAL_DMA_Start_IT:
.LFB338:
	.loc 1 682 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL124:
	.loc 1 683 3
	.loc 1 686 3
	.loc 1 689 3
	.loc 1 689 5 is_stmt 0
	cmp	r0, #0
	beq	.L149
	.loc 1 682 1
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 695 3 is_stmt 1
	.loc 1 695 7
	.loc 1 695 16 is_stmt 0
	ldrb	r0, [r0, #52]	@ zero_extendqisi2
.LVL125:
	.loc 1 695 9
	cmp	r0, #1
	beq	.L150
	.loc 1 695 66 is_stmt 1 discriminator 2
	.loc 1 695 79 is_stmt 0 discriminator 2
	movs	r0, #1
	strb	r0, [r4, #52]
	.loc 1 695 5 is_stmt 1 discriminator 2
	.loc 1 697 3 discriminator 2
	.loc 1 697 33 is_stmt 0 discriminator 2
	ldrb	r0, [r4, #53]	@ zero_extendqisi2
	uxtb	r0, r0
	.loc 1 697 5 discriminator 2
	cmp	r0, #1
	beq	.L155
	.loc 1 757 5 is_stmt 1
	.loc 1 757 21 is_stmt 0
	mov	r3, #2048
.LVL126:
	str	r3, [r4, #84]
	.loc 1 760 5 is_stmt 1
	.loc 1 760 9
	.loc 1 760 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 760 7 is_stmt 1
	.loc 1 763 5
.LVL127:
	.loc 1 763 12 is_stmt 0
	movs	r0, #1
.LVL128:
.L136:
	.loc 1 767 1
	pop	{r4, r5, r6, pc}
.LVL129:
.L155:
	.loc 1 700 5 is_stmt 1
	.loc 1 700 17 is_stmt 0
	movs	r0, #2
	strb	r0, [r4, #53]
	.loc 1 703 5 is_stmt 1
	.loc 1 703 21 is_stmt 0
	movs	r0, #0
	str	r0, [r4, #84]
	.loc 1 706 5 is_stmt 1
	.loc 1 706 16 is_stmt 0
	ldr	r0, [r4]
	.loc 1 706 1819
	ldr	r6, .L156
	ldr	r5, .L156+4
	cmp	r0, r5
	it	ne
	cmpne	r0, r6
	beq	.L138
	.loc 1 706 223 discriminator 2
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 332 discriminator 4
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 441 discriminator 6
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 550 discriminator 8
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 659 discriminator 10
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 768 discriminator 12
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 877 discriminator 14
	add	r5, r5, #856
	cmp	r0, r5
	beq	.L138
	.loc 1 706 986 discriminator 16
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 1095 discriminator 18
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 1204 discriminator 20
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 1313 discriminator 22
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 1422 discriminator 24
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 1531 discriminator 26
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 1640 discriminator 28
	adds	r5, r5, #24
	cmp	r0, r5
	beq	.L138
	.loc 1 706 1864 discriminator 30
	ldr	r5, [r0]
	.loc 1 706 1870 discriminator 30
	bic	r5, r5, #1
	str	r5, [r0]
	b	.L140
.L138:
	.loc 1 706 1793 discriminator 29
	ldr	r5, [r0]
	.loc 1 706 1798 discriminator 29
	bic	r5, r5, #1
	str	r5, [r0]
.L140:
	.loc 1 709 5 is_stmt 1
	mov	r0, r4
	bl	DMA_SetConfig
.LVL130:
	.loc 1 711 5
	.loc 1 711 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 711 1611
	ldr	r1, .L156
	ldr	r2, .L156+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L141
	.loc 1 711 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L141
	.loc 1 711 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 711 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L141
	.loc 1 725 7 is_stmt 1
	.loc 1 725 106 is_stmt 0
	ldr	r2, [r3]
	.loc 1 725 115
	bic	r2, r2, #14
	.loc 1 725 177
	orr	r2, r2, #10
	.loc 1 725 58
	str	r2, [r3]
	.loc 1 727 7 is_stmt 1
	.loc 1 727 14 is_stmt 0
	ldr	r3, [r4, #64]
	.loc 1 727 9
	cbz	r3, .L143
	.loc 1 730 9 is_stmt 1
	.loc 1 730 38 is_stmt 0
	ldr	r2, [r4]
	.loc 1 730 49
	ldr	r3, [r2]
	.loc 1 730 55
	orr	r3, r3, #4
	str	r3, [r2]
	b	.L143
.L141:
	.loc 1 714 7 is_stmt 1
	.loc 1 714 101 is_stmt 0
	ldr	r2, [r3]
	.loc 1 714 109
	bic	r2, r2, #30
	.loc 1 714 237
	orr	r2, r2, #22
	.loc 1 714 55
	str	r2, [r3]
	.loc 1 716 7 is_stmt 1
	.loc 1 716 14 is_stmt 0
	ldr	r3, [r4, #64]
	.loc 1 716 9
	cbz	r3, .L143
	.loc 1 719 9 is_stmt 1
	.loc 1 719 36 is_stmt 0
	ldr	r2, [r4]
	.loc 1 719 47
	ldr	r3, [r2]
	.loc 1 719 52
	orr	r3, r3, #8
	str	r3, [r2]
.L143:
	.loc 1 734 5 is_stmt 1
	.loc 1 734 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 734 2488
	ldr	r1, .L156
	ldr	r2, .L156+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L144
	.loc 1 734 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L144
	.loc 1 734 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L144
	.loc 1 734 1718 discriminator 30
	ldr	r2, .L156+8
	cmp	r3, r2
	beq	.L144
	.loc 1 734 1828 discriminator 32
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L144
	.loc 1 734 1938 discriminator 34
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L144
	.loc 1 734 2048 discriminator 36
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L144
	.loc 1 734 2158 discriminator 38
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L144
	.loc 1 734 2268 discriminator 40
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L144
	.loc 1 734 2378 discriminator 42
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L144
	.loc 1 734 2488 discriminator 44
	adds	r2, r2, #20
	cmp	r3, r2
	bne	.L145
.L144:
	.loc 1 737 7 is_stmt 1
	.loc 1 737 15 is_stmt 0
	ldr	r3, [r4, #96]
	.loc 1 737 30
	ldr	r2, [r3]
	.loc 1 737 9
	tst	r2, #65536
	beq	.L146
	.loc 1 740 9 is_stmt 1
	.loc 1 740 28 is_stmt 0
	ldr	r2, [r3]
	.loc 1 740 34
	orr	r2, r2, #256
	str	r2, [r3]
.L146:
	.loc 1 743 7 is_stmt 1
	.loc 1 743 14 is_stmt 0
	ldr	r3, [r4, #108]
	.loc 1 743 9
	cbz	r3, .L145
	.loc 1 747 9 is_stmt 1
	.loc 1 747 31 is_stmt 0
	ldr	r2, [r3]
	.loc 1 747 38
	orr	r2, r2, #256
	str	r2, [r3]
.L145:
	.loc 1 752 5 is_stmt 1
	.loc 1 752 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 752 1818
	ldr	r1, .L156
	ldr	r2, .L156+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L147
	.loc 1 752 223 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 332 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 441 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 550 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 659 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 768 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 877 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L147
	.loc 1 752 986 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 1095 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 1204 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 1313 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 1422 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 1531 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 1640 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L147
	.loc 1 752 1863 discriminator 30
	ldr	r2, [r3]
	.loc 1 752 1869 discriminator 30
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 683 21 discriminator 30
	movs	r0, #0
	b	.L136
.L147:
	.loc 1 752 1793 discriminator 29
	ldr	r2, [r3]
	.loc 1 752 1798 discriminator 29
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 683 21 discriminator 29
	movs	r0, #0
	.loc 1 752 1818 discriminator 29
	b	.L136
.LVL131:
.L149:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 14
	.loc 1 691 12
	movs	r0, #1
.LVL132:
	.loc 1 767 1
	bx	lr
.LVL133:
.L150:
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 695 47
	movs	r0, #2
	b	.L136
.L157:
	.align	2
.L156:
	.word	1073872912
	.word	1073872936
	.word	1476547592
	.cfi_endproc
.LFE338:
	.size	HAL_DMA_Start_IT, .-HAL_DMA_Start_IT
	.section	.text.HAL_DMA_Abort,"ax",%progbits
	.align	1
	.global	HAL_DMA_Abort
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_Abort, %function
HAL_DMA_Abort:
.LFB339:
	.loc 1 782 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL134:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 784 3
	.loc 1 785 3
	.loc 1 786 3
	.loc 1 788 3
	.loc 1 788 24 is_stmt 0
	bl	HAL_GetTick
.LVL135:
	.loc 1 791 3 is_stmt 1
	.loc 1 791 5 is_stmt 0
	cmp	r4, #0
	beq	.L174
	mov	r5, r0
	.loc 1 797 3 is_stmt 1
	.loc 1 797 10 is_stmt 0
	ldrb	r3, [r4, #53]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 797 5
	cmp	r3, #2
	beq	.L160
	.loc 1 799 5 is_stmt 1
	.loc 1 799 21 is_stmt 0
	movs	r3, #128
	str	r3, [r4, #84]
	.loc 1 802 5 is_stmt 1
	.loc 1 802 9
	.loc 1 802 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 802 7 is_stmt 1
	.loc 1 804 5
	.loc 1 804 12 is_stmt 0
	movs	r0, #1
.LVL136:
.L159:
	.loc 1 889 1
	pop	{r4, r5, r6, pc}
.LVL137:
.L160:
	.loc 1 809 5 is_stmt 1
	.loc 1 809 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 809 1611
	ldr	r1, .L177
	ldr	r2, .L177+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L161
	.loc 1 809 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L161
	.loc 1 809 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 809 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L161
	.loc 1 820 7 is_stmt 1
	.loc 1 820 47 is_stmt 0
	ldr	r2, [r3]
	.loc 1 820 53
	bic	r2, r2, #14
	str	r2, [r3]
	.loc 1 822 7 is_stmt 1
	.loc 1 822 77 is_stmt 0
	ldr	r6, [r4]
.LVL138:
	b	.L162
.LVL139:
.L161:
	.loc 1 812 7 is_stmt 1
	.loc 1 812 45 is_stmt 0
	ldr	r2, [r3]
	.loc 1 812 50
	bic	r2, r2, #30
	str	r2, [r3]
	.loc 1 813 7 is_stmt 1
	.loc 1 813 34 is_stmt 0
	ldr	r2, [r4]
	.loc 1 813 45
	ldr	r3, [r2, #20]
	.loc 1 813 51
	bic	r3, r3, #128
	str	r3, [r2, #20]
	.loc 1 815 7 is_stmt 1
	.loc 1 815 75 is_stmt 0
	ldr	r6, [r4]
.LVL140:
.L162:
	.loc 1 825 5 is_stmt 1
	.loc 1 825 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 825 2488
	ldr	r1, .L177
	ldr	r2, .L177+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L163
	.loc 1 825 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L163
	.loc 1 825 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L163
	.loc 1 825 1718 discriminator 30
	ldr	r2, .L177+8
	cmp	r3, r2
	beq	.L163
	.loc 1 825 1828 discriminator 32
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L163
	.loc 1 825 1938 discriminator 34
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L163
	.loc 1 825 2048 discriminator 36
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L163
	.loc 1 825 2158 discriminator 38
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L163
	.loc 1 825 2268 discriminator 40
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L163
	.loc 1 825 2378 discriminator 42
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L163
	.loc 1 825 2488 discriminator 44
	adds	r2, r2, #20
	cmp	r3, r2
	bne	.L164
.L163:
	.loc 1 828 7 is_stmt 1
	.loc 1 828 11 is_stmt 0
	ldr	r2, [r4, #96]
	.loc 1 828 26
	ldr	r3, [r2]
	.loc 1 828 32
	bic	r3, r3, #256
	str	r3, [r2]
.L164:
	.loc 1 832 5 is_stmt 1
	.loc 1 832 16 is_stmt 0
	ldr	r3, [r4]
	.loc 1 832 1819
	ldr	r1, .L177
	ldr	r2, .L177+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L165
	.loc 1 832 223 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 332 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 441 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 550 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 659 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 768 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 877 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L165
	.loc 1 832 986 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 1095 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 1204 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 1313 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 1422 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 1531 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 1640 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L165
	.loc 1 832 1864 discriminator 30
	ldr	r2, [r3]
	.loc 1 832 1870 discriminator 30
	bic	r2, r2, #1
	str	r2, [r3]
	b	.L168
.L165:
	.loc 1 832 1793 discriminator 29
	ldr	r2, [r3]
	.loc 1 832 1798 discriminator 29
	bic	r2, r2, #1
	str	r2, [r3]
.LVL141:
.L168:
	.loc 1 835 49 is_stmt 1
	.loc 1 835 13 is_stmt 0
	ldr	r3, [r6]
	.loc 1 835 49
	tst	r3, #1
	beq	.L176
	.loc 1 838 7 is_stmt 1
	.loc 1 838 11 is_stmt 0
	bl	HAL_GetTick
.LVL142:
	.loc 1 838 25
	subs	r3, r0, r5
	.loc 1 838 9
	cmp	r3, #5
	bls	.L168
	.loc 1 841 9 is_stmt 1
	.loc 1 841 25 is_stmt 0
	movs	r3, #32
	str	r3, [r4, #84]
	.loc 1 844 9 is_stmt 1
	.loc 1 844 21 is_stmt 0
	movs	r3, #3
	strb	r3, [r4, #53]
	.loc 1 847 9 is_stmt 1
	.loc 1 847 13
	.loc 1 847 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 847 11 is_stmt 1
	.loc 1 849 9
	.loc 1 849 16 is_stmt 0
	movs	r0, #1
	b	.L159
.L176:
	.loc 1 854 5 is_stmt 1
	.loc 1 854 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 854 1611
	ldr	r1, .L177
	ldr	r2, .L177+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L170
	.loc 1 854 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L170
	.loc 1 854 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 854 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L170
	.loc 1 861 7 is_stmt 1
	.loc 1 861 46 is_stmt 0
	ldr	r1, [r4, #88]
.LVL143:
	.loc 1 862 7 is_stmt 1
	.loc 1 862 52 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 862 66
	and	r2, r3, #31
	.loc 1 862 44
	movs	r3, #1
	lsls	r3, r3, r2
	.loc 1 862 23
	str	r3, [r1, #4]
	b	.L171
.L178:
	.align	2
.L177:
	.word	1073872912
	.word	1073872936
	.word	1476547592
.LVL144:
.L170:
	.loc 1 856 7 is_stmt 1
	.loc 1 856 44 is_stmt 0
	ldr	r1, [r4, #88]
.LVL145:
	.loc 1 857 7 is_stmt 1
	.loc 1 857 39 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 857 53
	and	r2, r3, #31
	.loc 1 857 31
	movs	r3, #63
	lsls	r3, r3, r2
	.loc 1 857 22
	str	r3, [r1, #8]
.LVL146:
.L171:
	.loc 1 865 5 is_stmt 1
	.loc 1 865 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 865 2488
	ldr	r1, .L179
	ldr	r2, .L179+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L172
	.loc 1 865 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L172
	.loc 1 865 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L172
	.loc 1 865 1718 discriminator 30
	ldr	r2, .L179+8
	cmp	r3, r2
	beq	.L172
	.loc 1 865 1828 discriminator 32
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L172
	.loc 1 865 1938 discriminator 34
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L172
	.loc 1 865 2048 discriminator 36
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L172
	.loc 1 865 2158 discriminator 38
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L172
	.loc 1 865 2268 discriminator 40
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L172
	.loc 1 865 2378 discriminator 42
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L172
	.loc 1 865 2488 discriminator 44
	adds	r2, r2, #20
	cmp	r3, r2
	bne	.L173
.L172:
	.loc 1 868 7 is_stmt 1
	.loc 1 868 11 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 868 44
	ldr	r2, [r4, #104]
	.loc 1 868 38
	str	r2, [r3, #4]
	.loc 1 870 7 is_stmt 1
	.loc 1 870 14 is_stmt 0
	ldr	r3, [r4, #108]
	.loc 1 870 9
	cbz	r3, .L173
	.loc 1 874 9 is_stmt 1
	.loc 1 874 31 is_stmt 0
	ldr	r2, [r3]
	.loc 1 874 38
	bic	r2, r2, #256
	str	r2, [r3]
	.loc 1 877 9 is_stmt 1
	.loc 1 877 13 is_stmt 0
	ldr	r3, [r4, #112]
	.loc 1 877 51
	ldr	r2, [r4, #116]
	.loc 1 877 45
	str	r2, [r3, #4]
.L173:
	.loc 1 882 5 is_stmt 1
	.loc 1 882 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #53]
	.loc 1 885 5 is_stmt 1
	.loc 1 885 9
	.loc 1 885 22 is_stmt 0
	movs	r0, #0
	strb	r0, [r4, #52]
	.loc 1 885 7 is_stmt 1
	.loc 1 888 3
	.loc 1 888 10 is_stmt 0
	b	.L159
.LVL147:
.L174:
	.loc 1 793 12
	movs	r0, #1
.LVL148:
	b	.L159
.L180:
	.align	2
.L179:
	.word	1073872912
	.word	1073872936
	.word	1476547592
	.cfi_endproc
.LFE339:
	.size	HAL_DMA_Abort, .-HAL_DMA_Abort
	.section	.text.HAL_DMA_Abort_IT,"ax",%progbits
	.align	1
	.global	HAL_DMA_Abort_IT
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_Abort_IT, %function
HAL_DMA_Abort_IT:
.LFB340:
	.loc 1 898 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL149:
	.loc 1 899 3
	.loc 1 902 3
	.loc 1 902 5 is_stmt 0
	cmp	r0, #0
	beq	.L193
	.loc 1 898 1
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	mov	r2, r0
	.loc 1 907 3 is_stmt 1
	.loc 1 907 10 is_stmt 0
	ldrb	r3, [r0, #53]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 907 5
	cmp	r3, #2
	beq	.L183
	.loc 1 909 5 is_stmt 1
	.loc 1 909 21 is_stmt 0
	movs	r3, #128
	str	r3, [r0, #84]
	.loc 1 910 5 is_stmt 1
	.loc 1 910 12 is_stmt 0
	movs	r0, #1
.LVL150:
.L182:
	.loc 1 968 1
	pop	{r3, pc}
.LVL151:
.L183:
	.loc 1 914 5 is_stmt 1
	.loc 1 914 15 is_stmt 0
	ldr	r3, [r0]
	.loc 1 914 113
	ldr	r0, .L200
.LVL152:
	ldr	r1, .L200+4
	.loc 1 914 1611
	cmp	r3, r1
	it	ne
	cmpne	r3, r0
	ite	eq
	moveq	r0, #1
	movne	r0, #0
	beq	.L184
	.loc 1 914 220 discriminator 2
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 327 discriminator 4
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 434 discriminator 6
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 541 discriminator 8
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 648 discriminator 10
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 755 discriminator 12
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 862 discriminator 14
	add	r1, r1, #856
	cmp	r3, r1
	beq	.L184
	.loc 1 914 969 discriminator 16
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 1076 discriminator 18
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 1183 discriminator 20
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 1290 discriminator 22
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 1397 discriminator 24
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 1504 discriminator 26
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 914 1611 discriminator 28
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L184
	.loc 1 925 7 is_stmt 1
	.loc 1 925 47 is_stmt 0
	ldr	r1, [r3]
	.loc 1 925 53
	bic	r1, r1, #14
	str	r1, [r3]
	.loc 1 928 7 is_stmt 1
	.loc 1 928 18 is_stmt 0
	ldr	r3, [r2]
	.loc 1 928 1821
	ldr	r0, .L200
	ldr	r1, .L200+4
	cmp	r3, r1
	it	ne
	cmpne	r3, r0
	beq	.L185
	.loc 1 928 225 discriminator 2
	ldr	r1, .L200+8
	cmp	r3, r1
	beq	.L185
	.loc 1 928 334 discriminator 4
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 443 discriminator 6
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 552 discriminator 8
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 661 discriminator 10
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 770 discriminator 12
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 879 discriminator 14
	add	r1, r1, #856
	cmp	r3, r1
	beq	.L185
	.loc 1 928 988 discriminator 16
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 1097 discriminator 18
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 1206 discriminator 20
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 1315 discriminator 22
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 1424 discriminator 24
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 1533 discriminator 26
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 1642 discriminator 28
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L185
	.loc 1 928 1866 discriminator 30
	ldr	r1, [r3]
	.loc 1 928 1872 discriminator 30
	bic	r1, r1, #1
	str	r1, [r3]
	b	.L190
.L184:
	.loc 1 917 7 is_stmt 1
	.loc 1 917 19 is_stmt 0
	movs	r1, #4
	strb	r1, [r2, #53]
	.loc 1 920 7 is_stmt 1
	.loc 1 920 1821 is_stmt 0
	cbnz	r0, .L187
	.loc 1 920 225 discriminator 2
	ldr	r2, .L200+8
.LVL153:
	cmp	r3, r2
	beq	.L187
	.loc 1 920 334 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 443 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 552 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 661 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 770 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 879 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L187
	.loc 1 920 988 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 1097 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 1206 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 1315 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 1424 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 1533 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 1642 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L187
	.loc 1 920 1866 discriminator 30
	ldr	r2, [r3]
	.loc 1 920 1872 discriminator 30
	bic	r2, r2, #1
	str	r2, [r3]
	.loc 1 967 10 discriminator 30
	movs	r0, #0
	b	.L182
.L187:
	.loc 1 920 1795 discriminator 29
	ldr	r2, [r3]
	.loc 1 920 1800 discriminator 29
	bic	r2, r2, #1
	str	r2, [r3]
	.loc 1 967 10 discriminator 29
	movs	r0, #0
	.loc 1 920 1821 discriminator 29
	b	.L182
.LVL154:
.L185:
	.loc 1 928 1795 discriminator 29
	ldr	r1, [r3]
	.loc 1 928 1800 discriminator 29
	bic	r1, r1, #1
	str	r1, [r3]
.L190:
	.loc 1 930 7 is_stmt 1
	.loc 1 930 17 is_stmt 0
	ldr	r3, [r2]
	.loc 1 930 2490
	ldr	r0, .L200
	ldr	r1, .L200+4
	cmp	r3, r1
	it	ne
	cmpne	r3, r0
	beq	.L191
	.loc 1 930 222 discriminator 2
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 329 discriminator 4
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 436 discriminator 6
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 543 discriminator 8
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 650 discriminator 10
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 757 discriminator 12
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 864 discriminator 14
	add	r1, r1, #856
	cmp	r3, r1
	beq	.L191
	.loc 1 930 971 discriminator 16
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 1078 discriminator 18
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 1185 discriminator 20
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 1292 discriminator 22
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 1399 discriminator 24
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 1506 discriminator 26
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 1613 discriminator 28
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L191
	.loc 1 930 1720 discriminator 30
	ldr	r1, .L200+12
	cmp	r3, r1
	beq	.L191
	.loc 1 930 1830 discriminator 32
	adds	r1, r1, #20
	cmp	r3, r1
	beq	.L191
	.loc 1 930 1940 discriminator 34
	adds	r1, r1, #20
	cmp	r3, r1
	beq	.L191
	.loc 1 930 2050 discriminator 36
	adds	r1, r1, #20
	cmp	r3, r1
	beq	.L191
	.loc 1 930 2160 discriminator 38
	adds	r1, r1, #20
	cmp	r3, r1
	beq	.L191
	.loc 1 930 2270 discriminator 40
	adds	r1, r1, #20
	cmp	r3, r1
	beq	.L191
	.loc 1 930 2380 discriminator 42
	adds	r1, r1, #20
	cmp	r3, r1
	beq	.L191
	.loc 1 930 2490 discriminator 44
	adds	r1, r1, #20
	cmp	r3, r1
	bne	.L192
.L191:
	.loc 1 933 9 is_stmt 1
	.loc 1 933 13 is_stmt 0
	ldr	r1, [r2, #96]
	.loc 1 933 28
	ldr	r3, [r1]
	.loc 1 933 34
	bic	r3, r3, #256
	str	r3, [r1]
	.loc 1 936 9 is_stmt 1
	.loc 1 936 48 is_stmt 0
	ldr	r0, [r2, #88]
.LVL155:
	.loc 1 937 9 is_stmt 1
	.loc 1 937 54 is_stmt 0
	ldr	r3, [r2, #92]
	.loc 1 937 68
	and	r1, r3, #31
	.loc 1 937 46
	movs	r3, #1
	lsls	r3, r3, r1
	.loc 1 937 25
	str	r3, [r0, #4]
	.loc 1 940 9 is_stmt 1
	.loc 1 940 13 is_stmt 0
	ldr	r3, [r2, #100]
	.loc 1 940 46
	ldr	r1, [r2, #104]
	.loc 1 940 40
	str	r1, [r3, #4]
	.loc 1 942 9 is_stmt 1
	.loc 1 942 16 is_stmt 0
	ldr	r3, [r2, #108]
	.loc 1 942 11
	cbz	r3, .L192
	.loc 1 946 11 is_stmt 1
	.loc 1 946 33 is_stmt 0
	ldr	r1, [r3]
	.loc 1 946 40
	bic	r1, r1, #256
	str	r1, [r3]
	.loc 1 949 11 is_stmt 1
	.loc 1 949 15 is_stmt 0
	ldr	r3, [r2, #112]
	.loc 1 949 53
	ldr	r1, [r2, #116]
	.loc 1 949 47
	str	r1, [r3, #4]
.LVL156:
.L192:
	.loc 1 954 7 is_stmt 1
	.loc 1 954 19 is_stmt 0
	movs	r3, #1
	strb	r3, [r2, #53]
	.loc 1 957 7 is_stmt 1
	.loc 1 957 11
	.loc 1 957 24 is_stmt 0
	movs	r3, #0
	strb	r3, [r2, #52]
	.loc 1 957 9 is_stmt 1
	.loc 1 960 7
	.loc 1 960 14 is_stmt 0
	ldr	r3, [r2, #80]
	.loc 1 960 9
	cbz	r3, .L194
	.loc 1 962 9 is_stmt 1
	mov	r0, r2
	blx	r3
.LVL157:
	.loc 1 967 10 is_stmt 0
	movs	r0, #0
	b	.L182
.LVL158:
.L193:
	.cfi_def_cfa_offset 0
	.cfi_restore 3
	.cfi_restore 14
	.loc 1 904 12
	movs	r0, #1
.LVL159:
	.loc 1 968 1
	bx	lr
.LVL160:
.L194:
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 967 10
	movs	r0, #0
	b	.L182
.L201:
	.align	2
.L200:
	.word	1073872912
	.word	1073872936
	.word	1073872960
	.word	1476547592
	.cfi_endproc
.LFE340:
	.size	HAL_DMA_Abort_IT, .-HAL_DMA_Abort_IT
	.section	.text.HAL_DMA_PollForTransfer,"ax",%progbits
	.align	1
	.global	HAL_DMA_PollForTransfer
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_PollForTransfer, %function
HAL_DMA_PollForTransfer:
.LFB341:
	.loc 1 982 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL161:
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
	mov	r4, r0
	mov	r7, r1
	mov	r6, r2
	.loc 1 983 3
.LVL162:
	.loc 1 984 3
	.loc 1 985 3
	.loc 1 985 24 is_stmt 0
	bl	HAL_GetTick
.LVL163:
	.loc 1 988 3 is_stmt 1
	.loc 1 990 3
	.loc 1 993 3
	.loc 1 993 5 is_stmt 0
	cmp	r4, #0
	beq	.L230
	mov	r10, r0
	.loc 1 998 3 is_stmt 1
	.loc 1 998 32 is_stmt 0
	ldrb	r3, [r4, #53]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 998 5
	cmp	r3, #2
	beq	.L204
	.loc 1 1001 5 is_stmt 1
	.loc 1 1001 21 is_stmt 0
	movs	r3, #128
	str	r3, [r4, #84]
	.loc 1 1002 5 is_stmt 1
	.loc 1 1002 9
	.loc 1 1002 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 1002 7 is_stmt 1
	.loc 1 1004 5
	.loc 1 1004 12 is_stmt 0
	movs	r0, #1
.LVL164:
.L203:
	.loc 1 1200 1
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.LVL165:
.L204:
	.loc 1 1007 3 is_stmt 1
	.loc 1 1007 13 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1007 1609
	ldr	r1, .L238
	ldr	r2, .L238+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L205
	.loc 1 1007 218 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 325 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 432 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 539 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 646 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 753 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 860 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 967 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 1074 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 1181 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 1288 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 1395 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 1502 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1007 1609 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L205
	.loc 1 1034 5 is_stmt 1
	.loc 1 1034 50 is_stmt 0
	ldr	r3, [r3]
	.loc 1 1034 8
	tst	r3, #32
	bne	.L233
	.loc 1 1041 5 is_stmt 1
	.loc 1 1041 7 is_stmt 0
	cbnz	r7, .L212
	.loc 1 1044 7 is_stmt 1
	.loc 1 1044 55 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1044 69
	and	r3, r3, #31
	.loc 1 1044 22
	mov	r9, #2
	lsl	r9, r9, r3
.LVL166:
.L213:
	.loc 1 1052 5 is_stmt 1
	.loc 1 1052 45 is_stmt 0
	ldr	r3, [r4, #88]
	.loc 1 1052 13
	mov	r5, r3
.LVL167:
	.loc 1 1053 5 is_stmt 1
	.loc 1 1053 14 is_stmt 0
	add	r8, r3, #4
.LVL168:
	b	.L224
.LVL169:
.L205:
	.loc 1 1010 5 is_stmt 1
	.loc 1 1010 48 is_stmt 0
	ldr	r3, [r3]
	.loc 1 1010 8
	tst	r3, #256
	bne	.L234
	.loc 1 1017 5 is_stmt 1
	.loc 1 1017 7 is_stmt 0
	cbnz	r7, .L209
	.loc 1 1020 7 is_stmt 1
	.loc 1 1020 56 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1020 70
	and	r3, r3, #31
	.loc 1 1020 22
	mov	r9, #32
	lsl	r9, r9, r3
.LVL170:
.L210:
	.loc 1 1028 5 is_stmt 1
	.loc 1 1028 44 is_stmt 0
	ldr	r3, [r4, #88]
	.loc 1 1028 13
	mov	r5, r3
.LVL171:
	.loc 1 1029 5 is_stmt 1
	.loc 1 1029 14 is_stmt 0
	add	r8, r3, #8
.LVL172:
	b	.L224
.LVL173:
.L234:
	.loc 1 1012 7 is_stmt 1
	.loc 1 1012 23 is_stmt 0
	mov	r3, #256
	str	r3, [r4, #84]
	.loc 1 1013 7 is_stmt 1
	.loc 1 1013 14 is_stmt 0
	movs	r0, #1
.LVL174:
	b	.L203
.LVL175:
.L209:
	.loc 1 1025 7 is_stmt 1
	.loc 1 1025 56 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1025 70
	and	r3, r3, #31
	.loc 1 1025 22
	mov	r9, #16
	lsl	r9, r9, r3
.LVL176:
	b	.L210
.LVL177:
.L233:
	.loc 1 1036 7 is_stmt 1
	.loc 1 1036 23 is_stmt 0
	mov	r3, #256
	str	r3, [r4, #84]
	.loc 1 1037 7 is_stmt 1
	.loc 1 1037 14 is_stmt 0
	movs	r0, #1
.LVL178:
	b	.L203
.LVL179:
.L212:
	.loc 1 1049 7 is_stmt 1
	.loc 1 1049 55 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1049 69
	and	r3, r3, #31
	.loc 1 1049 22
	mov	r9, #4
	lsl	r9, r9, r3
.LVL180:
	b	.L213
.L239:
	.align	2
.L238:
	.word	1073872912
	.word	1073872936
.LVL181:
.L214:
	.loc 1 1060 7 is_stmt 1
	.loc 1 1060 12 is_stmt 0
	ldr	r2, [r5]
	.loc 1 1060 57
	ldr	r3, [r4, #92]
	.loc 1 1060 71
	and	r3, r3, #31
	.loc 1 1060 82
	lsrs	r2, r2, r3
	.loc 1 1060 9
	tst	r2, #1
	beq	.L217
	.loc 1 1063 9 is_stmt 1
	.loc 1 1063 13 is_stmt 0
	ldr	r2, [r4, #84]
	.loc 1 1063 25
	orr	r2, r2, #2
	str	r2, [r4, #84]
	.loc 1 1066 9 is_stmt 1
	.loc 1 1066 47 is_stmt 0
	movs	r2, #1
	lsl	r3, r2, r3
	.loc 1 1066 21
	str	r3, [r8]
.L217:
	.loc 1 1069 7 is_stmt 1
	.loc 1 1069 12 is_stmt 0
	ldr	r1, [r5]
	.loc 1 1069 57
	ldr	r3, [r4, #92]
	.loc 1 1069 71
	and	r2, r3, #31
	.loc 1 1069 49
	movs	r3, #4
	lsls	r3, r3, r2
	.loc 1 1069 9
	tst	r1, r3
	beq	.L218
	.loc 1 1072 9 is_stmt 1
	.loc 1 1072 13 is_stmt 0
	ldr	r2, [r4, #84]
	.loc 1 1072 25
	orr	r2, r2, #4
	str	r2, [r4, #84]
	.loc 1 1075 9 is_stmt 1
	.loc 1 1075 21 is_stmt 0
	str	r3, [r8]
.L218:
	.loc 1 1078 7 is_stmt 1
	.loc 1 1078 12 is_stmt 0
	ldr	r1, [r5]
	.loc 1 1078 57
	ldr	r3, [r4, #92]
	.loc 1 1078 71
	and	r2, r3, #31
	.loc 1 1078 49
	movs	r3, #8
	lsls	r3, r3, r2
	.loc 1 1078 9
	tst	r1, r3
	bne	.L235
.L216:
	.loc 1 1118 5 is_stmt 1
	.loc 1 1118 7 is_stmt 0
	cmp	r6, #-1
	bne	.L236
.L219:
	.loc 1 1139 5 is_stmt 1
	.loc 1 1139 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1139 2488
	ldr	r1, .L240
	ldr	r2, .L240+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L221
	.loc 1 1139 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 1718 discriminator 30
	ldr	r2, .L240+8
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 1828 discriminator 32
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 1938 discriminator 34
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 2048 discriminator 36
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 2158 discriminator 38
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 2268 discriminator 40
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 2378 discriminator 42
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L221
	.loc 1 1139 2488 discriminator 44
	adds	r2, r2, #20
	cmp	r3, r2
	bne	.L224
.L221:
	.loc 1 1142 7 is_stmt 1
	.loc 1 1142 14 is_stmt 0
	ldr	r3, [r4, #108]
	.loc 1 1142 9
	cbz	r3, .L223
	.loc 1 1145 9 is_stmt 1
	.loc 1 1145 17 is_stmt 0
	ldr	r3, [r4, #112]
	.loc 1 1145 41
	ldr	r1, [r3]
	.loc 1 1145 54
	ldr	r2, [r4, #116]
	.loc 1 1145 11
	tst	r1, r2
	beq	.L223
	.loc 1 1148 11 is_stmt 1
	.loc 1 1148 47 is_stmt 0
	str	r2, [r3, #4]
	.loc 1 1151 11 is_stmt 1
	.loc 1 1151 15 is_stmt 0
	ldr	r3, [r4, #84]
	.loc 1 1151 27
	orr	r3, r3, #1024
	str	r3, [r4, #84]
.L223:
	.loc 1 1156 7 is_stmt 1
	.loc 1 1156 15 is_stmt 0
	ldr	r3, [r4, #100]
	.loc 1 1156 36
	ldr	r1, [r3]
	.loc 1 1156 48
	ldr	r2, [r4, #104]
	.loc 1 1156 9
	tst	r1, r2
	beq	.L224
	.loc 1 1159 9 is_stmt 1
	.loc 1 1159 40 is_stmt 0
	str	r2, [r3, #4]
	.loc 1 1162 9 is_stmt 1
	.loc 1 1162 13 is_stmt 0
	ldr	r3, [r4, #84]
	.loc 1 1162 25
	orr	r3, r3, #512
	str	r3, [r4, #84]
.L224:
	.loc 1 1056 39 is_stmt 1
	.loc 1 1056 11 is_stmt 0
	ldr	r3, [r5]
	.loc 1 1056 39
	tst	r3, r9
	bne	.L237
	.loc 1 1058 5 is_stmt 1
	.loc 1 1058 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1058 1611
	ldr	r1, .L240
	ldr	r2, .L240+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L214
	.loc 1 1058 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1058 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L214
	.loc 1 1097 7 is_stmt 1
	.loc 1 1097 12 is_stmt 0
	ldr	r1, [r5]
	.loc 1 1097 56
	ldr	r3, [r4, #92]
	.loc 1 1097 70
	and	r3, r3, #31
	.loc 1 1097 48
	movs	r2, #8
	lsls	r2, r2, r3
	.loc 1 1097 9
	tst	r1, r2
	beq	.L216
	.loc 1 1102 9 is_stmt 1
	.loc 1 1102 41 is_stmt 0
	movs	r0, #1
	lsl	r3, r0, r3
	.loc 1 1102 20
	str	r3, [r5]
	.loc 1 1105 9 is_stmt 1
	.loc 1 1105 25 is_stmt 0
	str	r0, [r4, #84]
	.loc 1 1108 9 is_stmt 1
	.loc 1 1108 21 is_stmt 0
	strb	r0, [r4, #53]
	.loc 1 1111 9 is_stmt 1
	.loc 1 1111 13
	.loc 1 1111 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 1111 11 is_stmt 1
	.loc 1 1113 9
	.loc 1 1113 16 is_stmt 0
	b	.L203
.L235:
	.loc 1 1081 9 is_stmt 1
	.loc 1 1081 13 is_stmt 0
	ldr	r2, [r4, #84]
	.loc 1 1081 25
	orr	r2, r2, #1
	str	r2, [r4, #84]
	.loc 1 1084 9 is_stmt 1
	.loc 1 1084 21 is_stmt 0
	str	r3, [r8]
	.loc 1 1087 9 is_stmt 1
	.loc 1 1087 21 is_stmt 0
	movs	r0, #1
	strb	r0, [r4, #53]
	.loc 1 1090 9 is_stmt 1
	.loc 1 1090 13
	.loc 1 1090 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 1090 11 is_stmt 1
	.loc 1 1092 9
	.loc 1 1092 16 is_stmt 0
	b	.L203
.L236:
	.loc 1 1120 7 is_stmt 1
	.loc 1 1120 12 is_stmt 0
	bl	HAL_GetTick
.LVL182:
	.loc 1 1120 26
	sub	r0, r0, r10
	.loc 1 1120 9
	cmp	r0, r6
	bhi	.L220
	.loc 1 1120 50 discriminator 1
	cmp	r6, #0
	bne	.L219
.L220:
	.loc 1 1123 9 is_stmt 1
	.loc 1 1123 25 is_stmt 0
	movs	r3, #32
	str	r3, [r4, #84]
	.loc 1 1127 9 is_stmt 1
	.loc 1 1127 16 is_stmt 0
	mov	r0, r4
	bl	HAL_DMA_Abort
.LVL183:
	.loc 1 1135 9 is_stmt 1
	.loc 1 1135 16 is_stmt 0
	movs	r0, #1
	b	.L203
.L237:
	.loc 1 1169 3 is_stmt 1
	.loc 1 1169 5 is_stmt 0
	cmp	r7, #0
	bne	.L226
	.loc 1 1172 5 is_stmt 1
	.loc 1 1172 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1172 1611
	ldr	r1, .L240
	ldr	r2, .L240+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L227
	.loc 1 1172 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1172 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L227
	.loc 1 1178 7 is_stmt 1
	.loc 1 1178 53 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1178 67
	and	r2, r3, #31
	.loc 1 1178 45
	movs	r3, #2
	lsls	r3, r3, r2
	.loc 1 1178 19
	str	r3, [r8]
	b	.L228
.L227:
	.loc 1 1174 7 is_stmt 1
	.loc 1 1174 81 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1174 95
	and	r2, r3, #31
	.loc 1 1174 73
	movs	r3, #48
	lsls	r3, r3, r2
	.loc 1 1174 19
	str	r3, [r8]
.L228:
	.loc 1 1181 5 is_stmt 1
	.loc 1 1181 17 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #53]
	.loc 1 1184 5 is_stmt 1
	.loc 1 1184 9
	.loc 1 1184 22 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 1184 7 is_stmt 1
	.loc 1 1199 10 is_stmt 0
	mov	r0, r7
	b	.L203
.L241:
	.align	2
.L240:
	.word	1073872912
	.word	1073872936
	.word	1476547592
.L226:
	.loc 1 1189 5 is_stmt 1
	.loc 1 1189 15 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1189 1611
	ldr	r1, .L242
	ldr	r2, .L242+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L229
	.loc 1 1189 220 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 327 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 434 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 541 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 648 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 755 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 862 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 969 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 1076 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 1183 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 1290 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 1397 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 1504 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1189 1611 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L229
	.loc 1 1195 7 is_stmt 1
	.loc 1 1195 53 is_stmt 0
	ldr	r2, [r4, #92]
	.loc 1 1195 67
	and	r2, r2, #31
	.loc 1 1195 45
	movs	r3, #4
	lsls	r3, r3, r2
	.loc 1 1195 19
	str	r3, [r8]
	.loc 1 1199 10
	movs	r0, #0
	b	.L203
.L229:
	.loc 1 1191 7 is_stmt 1
	.loc 1 1191 55 is_stmt 0
	ldr	r2, [r4, #92]
	.loc 1 1191 69
	and	r2, r2, #31
	.loc 1 1191 47
	movs	r3, #16
	lsls	r3, r3, r2
	.loc 1 1191 19
	str	r3, [r8]
	.loc 1 1199 10
	movs	r0, #0
	b	.L203
.LVL184:
.L230:
	.loc 1 995 12
	movs	r0, #1
.LVL185:
	b	.L203
.L243:
	.align	2
.L242:
	.word	1073872912
	.word	1073872936
	.cfi_endproc
.LFE341:
	.size	HAL_DMA_PollForTransfer, .-HAL_DMA_PollForTransfer
	.section	.text.HAL_DMA_IRQHandler,"ax",%progbits
	.align	1
	.global	HAL_DMA_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_IRQHandler, %function
HAL_DMA_IRQHandler:
.LFB342:
	.loc 1 1209 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL186:
	push	{r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 20
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 32
	mov	r4, r0
	.loc 1 1210 3
	.loc 1 1211 3
	.loc 1 1212 3
	.loc 1 1212 21 is_stmt 0
	movs	r3, #0
	str	r3, [sp, #4]
	.loc 1 1213 3 is_stmt 1
	.loc 1 1213 38 is_stmt 0
	ldr	r3, .L304
	ldr	r5, [r3]
	.loc 1 1213 12
	ldr	r3, .L304+4
	umull	r3, r5, r3, r5
	lsrs	r5, r5, #10
.LVL187:
	.loc 1 1216 3 is_stmt 1
	.loc 1 1216 60 is_stmt 0
	ldr	r7, [r0, #88]
.LVL188:
	.loc 1 1217 3 is_stmt 1
	.loc 1 1219 3
	.loc 1 1219 14 is_stmt 0
	ldr	r6, [r7]
.LVL189:
	.loc 1 1220 3 is_stmt 1
	.loc 1 1220 15 is_stmt 0
	ldr	ip, [r7]
.LVL190:
	.loc 1 1222 3 is_stmt 1
	.loc 1 1222 13 is_stmt 0
	ldr	r3, [r0]
	.loc 1 1222 111
	ldr	r1, .L304+8
	ldr	r0, .L304+12
.LVL191:
	.loc 1 1222 1609
	cmp	r3, r0
	it	ne
	cmpne	r3, r1
	ite	eq
	moveq	r0, #1
	movne	r0, #0
	beq	.L245
	.loc 1 1222 218 discriminator 2
	ldr	r2, .L304+16
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 325 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 432 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 539 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 646 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 753 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 860 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 967 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 1074 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 1181 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 1288 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 1395 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 1502 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1222 1609 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L245
	.loc 1 1431 8 is_stmt 1
	.loc 1 1431 779 is_stmt 0
	ldr	r1, .L304+20
	ldr	r2, .L304+24
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L246
	.loc 1 1431 229 discriminator 2
	ldr	r2, .L304+28
	cmp	r3, r2
	beq	.L246
	.loc 1 1431 339 discriminator 4
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L246
	.loc 1 1431 449 discriminator 6
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L246
	.loc 1 1431 559 discriminator 8
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L246
	.loc 1 1431 669 discriminator 10
	adds	r2, r2, #20
	cmp	r3, r2
	beq	.L246
	.loc 1 1431 779 discriminator 12
	adds	r2, r2, #20
	cmp	r3, r2
	bne	.L244
.L246:
	.loc 1 1433 5 is_stmt 1
	.loc 1 1433 13 is_stmt 0
	ldr	r2, [r3]
.LVL192:
	.loc 1 1436 5 is_stmt 1
	.loc 1 1436 57 is_stmt 0
	ldr	r1, [r4, #92]
	.loc 1 1436 71
	and	r1, r1, #31
	.loc 1 1436 49
	movs	r0, #4
	lsls	r0, r0, r1
	.loc 1 1436 8
	tst	r0, ip
	beq	.L287
	.loc 1 1436 89 discriminator 1
	tst	r2, #4
	beq	.L287
	.loc 1 1439 7 is_stmt 1
	.loc 1 1439 23 is_stmt 0
	str	r0, [r7, #4]
	.loc 1 1442 7 is_stmt 1
	.loc 1 1442 9 is_stmt 0
	tst	r2, #32768
	beq	.L288
	.loc 1 1445 9 is_stmt 1
	.loc 1 1445 11 is_stmt 0
	tst	r2, #65536
	bne	.L289
	.loc 1 1447 11 is_stmt 1
	.loc 1 1447 18 is_stmt 0
	ldr	r3, [r4, #72]
	.loc 1 1447 13
	cmp	r3, #0
	beq	.L244
	.loc 1 1450 13 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL193:
	b	.L244
.LVL194:
.L245:
	.loc 1 1225 5
	.loc 1 1225 56 is_stmt 0
	ldr	r2, [r4, #92]
	.loc 1 1225 70
	and	r1, r2, #31
	.loc 1 1225 48
	movs	r2, #8
	lsls	r2, r2, r1
	.loc 1 1225 8
	tst	r2, r6
	beq	.L248
	.loc 1 1227 7 is_stmt 1
	.loc 1 1227 3212 is_stmt 0
	cbnz	r0, .L249
	.loc 1 1227 228 discriminator 2
	ldr	r2, .L304+16
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 337 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 446 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 555 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 664 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 773 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 882 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 991 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 1100 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 1209 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 1318 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 1427 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 1536 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 1645 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L249
	.loc 1 1227 2041 discriminator 30
	ldr	r2, [r3]
	.loc 1 1227 3212 discriminator 30
	ubfx	r2, r2, #3, #1
	b	.L251
.L249:
	.loc 1 1227 1864 discriminator 29
	ldr	r2, [r3]
	.loc 1 1227 3212 discriminator 29
	ubfx	r2, r2, #2, #1
.L251:
	.loc 1 1227 9 discriminator 32
	cbz	r2, .L248
	.loc 1 1230 9 is_stmt 1
	.loc 1 1230 47 is_stmt 0
	ldr	r2, [r3]
	.loc 1 1230 52
	bic	r2, r2, #4
	str	r2, [r3]
	.loc 1 1233 9 is_stmt 1
	.loc 1 1233 58 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1233 72
	and	r2, r3, #31
	.loc 1 1233 50
	movs	r3, #8
	lsls	r3, r3, r2
	.loc 1 1233 24
	str	r3, [r7, #8]
	.loc 1 1236 9 is_stmt 1
	.loc 1 1236 13 is_stmt 0
	ldr	r3, [r4, #84]
	.loc 1 1236 25
	orr	r3, r3, #1
	str	r3, [r4, #84]
.L248:
	.loc 1 1240 5 is_stmt 1
	.loc 1 1240 56 is_stmt 0
	ldr	r2, [r4, #92]
	.loc 1 1240 70
	and	r2, r2, #31
	.loc 1 1240 81
	lsr	r3, r6, r2
	.loc 1 1240 8
	tst	r3, #1
	beq	.L252
	.loc 1 1242 7 is_stmt 1
	.loc 1 1242 21 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1242 3172
	ldr	r0, .L304+8
	ldr	r1, .L304+12
	cmp	r3, r1
	it	ne
	cmpne	r3, r0
	beq	.L253
	.loc 1 1242 228 discriminator 2
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 337 discriminator 4
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 446 discriminator 6
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 555 discriminator 8
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 664 discriminator 10
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 773 discriminator 12
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 882 discriminator 14
	add	r1, r1, #856
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 991 discriminator 16
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 1100 discriminator 18
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 1209 discriminator 20
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 1318 discriminator 22
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 1427 discriminator 24
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 1536 discriminator 26
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 1645 discriminator 28
	adds	r1, r1, #24
	cmp	r3, r1
	beq	.L253
	.loc 1 1242 2029 discriminator 30
	ldr	r3, [r3]
	b	.L252
.L305:
	.align	2
.L304:
	.word	SystemCoreClock
	.word	458129845
	.word	1073872912
	.word	1073872936
	.word	1073872960
	.word	1476547592
	.word	1476547612
	.word	1476547632
.L253:
	.loc 1 1242 1941 discriminator 29
	ldr	r3, [r3, #20]
	.loc 1 1242 9 discriminator 29
	tst	r3, #128
	bne	.L255
.L252:
	.loc 1 1252 5 is_stmt 1
	.loc 1 1252 56 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1252 70
	and	r3, r3, #31
	.loc 1 1252 48
	movs	r2, #4
	lsl	r3, r2, r3
	.loc 1 1252 8
	tst	r3, r6
	beq	.L256
	.loc 1 1254 7 is_stmt 1
	.loc 1 1254 21 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1254 3212
	ldr	r0, .L306
	ldr	r1, .L306+4
	cmp	r2, r1
	it	ne
	cmpne	r2, r0
	beq	.L257
	.loc 1 1254 228 discriminator 2
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 337 discriminator 4
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 446 discriminator 6
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 555 discriminator 8
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 664 discriminator 10
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 773 discriminator 12
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 882 discriminator 14
	add	r1, r1, #856
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 991 discriminator 16
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 1100 discriminator 18
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 1209 discriminator 20
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 1318 discriminator 22
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 1427 discriminator 24
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 1536 discriminator 26
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 1645 discriminator 28
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L257
	.loc 1 1254 2041 discriminator 30
	ldr	r3, [r2]
	b	.L256
.L255:
	.loc 1 1245 9 is_stmt 1
	.loc 1 1245 50 is_stmt 0
	movs	r3, #1
	lsls	r3, r3, r2
	.loc 1 1245 24
	str	r3, [r7, #8]
	.loc 1 1248 9 is_stmt 1
	.loc 1 1248 13 is_stmt 0
	ldr	r3, [r4, #84]
	.loc 1 1248 25
	orr	r3, r3, #2
	str	r3, [r4, #84]
	b	.L252
.L257:
	.loc 1 1254 1864 discriminator 29
	ldr	r2, [r2]
	.loc 1 1254 9 discriminator 29
	tst	r2, #2
	bne	.L259
.L256:
	.loc 1 1264 5 is_stmt 1
	.loc 1 1264 56 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1264 70
	and	r3, r3, #31
	.loc 1 1264 48
	movs	r2, #16
	lsl	r3, r2, r3
	.loc 1 1264 8
	tst	r3, r6
	beq	.L260
	.loc 1 1266 7 is_stmt 1
	.loc 1 1266 21 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1266 3212
	ldr	r0, .L306
	ldr	r1, .L306+4
	cmp	r2, r1
	it	ne
	cmpne	r2, r0
	beq	.L261
	.loc 1 1266 228 discriminator 2
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 337 discriminator 4
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 446 discriminator 6
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 555 discriminator 8
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 664 discriminator 10
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 773 discriminator 12
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 882 discriminator 14
	add	r1, r1, #856
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 991 discriminator 16
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 1100 discriminator 18
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 1209 discriminator 20
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 1318 discriminator 22
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 1427 discriminator 24
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 1536 discriminator 26
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 1645 discriminator 28
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L261
	.loc 1 1266 2041 discriminator 30
	ldr	r2, [r2]
	.loc 1 1266 3212 discriminator 30
	ubfx	r2, r2, #2, #1
	b	.L263
.L259:
	.loc 1 1257 9 is_stmt 1
	.loc 1 1257 24 is_stmt 0
	str	r3, [r7, #8]
	.loc 1 1260 9 is_stmt 1
	.loc 1 1260 13 is_stmt 0
	ldr	r3, [r4, #84]
	.loc 1 1260 25
	orr	r3, r3, #4
	str	r3, [r4, #84]
	b	.L256
.L261:
	.loc 1 1266 1864 discriminator 29
	ldr	r2, [r2]
	.loc 1 1266 3212 discriminator 29
	ubfx	r2, r2, #3, #1
.L263:
	.loc 1 1266 9 discriminator 32
	cbz	r2, .L260
	.loc 1 1269 9 is_stmt 1
	.loc 1 1269 24 is_stmt 0
	str	r3, [r7, #8]
	.loc 1 1272 9 is_stmt 1
	.loc 1 1272 41 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1272 52
	ldr	r2, [r3]
	.loc 1 1272 11
	tst	r2, #262144
	beq	.L264
	.loc 1 1275 11 is_stmt 1
	.loc 1 1275 53 is_stmt 0
	ldr	r3, [r3]
	.loc 1 1275 13
	tst	r3, #524288
	bne	.L265
	.loc 1 1277 13 is_stmt 1
	.loc 1 1277 20 is_stmt 0
	ldr	r3, [r4, #64]
	.loc 1 1277 15
	cbz	r3, .L260
	.loc 1 1280 15 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL195:
	b	.L260
.LVL196:
.L265:
	.loc 1 1286 13
	.loc 1 1286 20 is_stmt 0
	ldr	r3, [r4, #72]
	.loc 1 1286 15
	cbz	r3, .L260
	.loc 1 1289 15 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL197:
	b	.L260
.LVL198:
.L264:
	.loc 1 1296 11
	.loc 1 1296 53 is_stmt 0
	ldr	r2, [r3]
	.loc 1 1296 13
	tst	r2, #256
	bne	.L266
	.loc 1 1299 13 is_stmt 1
	.loc 1 1299 51 is_stmt 0
	ldr	r2, [r3]
	.loc 1 1299 56
	bic	r2, r2, #8
	str	r2, [r3]
.L266:
	.loc 1 1302 11 is_stmt 1
	.loc 1 1302 18 is_stmt 0
	ldr	r3, [r4, #64]
	.loc 1 1302 13
	cbz	r3, .L260
	.loc 1 1305 13 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL199:
.L260:
	.loc 1 1311 5
	.loc 1 1311 56 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1311 70
	and	r3, r3, #31
	.loc 1 1311 48
	movs	r2, #32
	lsl	r3, r2, r3
	.loc 1 1311 8
	tst	r3, r6
	beq	.L267
	.loc 1 1313 7 is_stmt 1
	.loc 1 1313 21 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1313 3212
	ldr	r0, .L306
	ldr	r1, .L306+4
	cmp	r2, r1
	it	ne
	cmpne	r2, r0
	beq	.L268
	.loc 1 1313 228 discriminator 2
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 337 discriminator 4
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 446 discriminator 6
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 555 discriminator 8
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 664 discriminator 10
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 773 discriminator 12
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 882 discriminator 14
	add	r1, r1, #856
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 991 discriminator 16
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 1100 discriminator 18
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 1209 discriminator 20
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 1318 discriminator 22
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 1427 discriminator 24
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 1536 discriminator 26
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 1645 discriminator 28
	adds	r1, r1, #24
	cmp	r2, r1
	beq	.L268
	.loc 1 1313 2041 discriminator 30
	ldr	r2, [r2]
	.loc 1 1313 3212 discriminator 30
	ubfx	r2, r2, #1, #1
	b	.L270
.L268:
	.loc 1 1313 1864 discriminator 29
	ldr	r2, [r2]
	.loc 1 1313 3212 discriminator 29
	ubfx	r2, r2, #4, #1
.L270:
	.loc 1 1313 9 discriminator 32
	cmp	r2, #0
	beq	.L267
	.loc 1 1316 9 is_stmt 1
	.loc 1 1316 24 is_stmt 0
	str	r3, [r7, #8]
	.loc 1 1318 9 is_stmt 1
	.loc 1 1318 39 is_stmt 0
	ldrb	r3, [r4, #53]	@ zero_extendqisi2
	uxtb	r3, r3
	.loc 1 1318 11
	cmp	r3, #4
	beq	.L302
	.loc 1 1345 9 is_stmt 1
	.loc 1 1345 41 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1345 52
	ldr	r2, [r3]
	.loc 1 1345 11
	tst	r2, #262144
	beq	.L276
	.loc 1 1348 11 is_stmt 1
	.loc 1 1348 53 is_stmt 0
	ldr	r3, [r3]
	.loc 1 1348 13
	tst	r3, #524288
	bne	.L277
	.loc 1 1350 13 is_stmt 1
	.loc 1 1350 20 is_stmt 0
	ldr	r3, [r4, #68]
	.loc 1 1350 15
	cmp	r3, #0
	beq	.L267
	.loc 1 1353 15 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL200:
	b	.L267
.L302:
	.loc 1 1321 11
	.loc 1 1321 38 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1321 49
	ldr	r3, [r2]
	.loc 1 1321 54
	bic	r3, r3, #22
	str	r3, [r2]
	.loc 1 1322 11 is_stmt 1
	.loc 1 1322 38 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1322 49
	ldr	r3, [r2, #20]
	.loc 1 1322 55
	bic	r3, r3, #128
	str	r3, [r2, #20]
	.loc 1 1324 11 is_stmt 1
	.loc 1 1324 19 is_stmt 0
	ldr	r3, [r4, #64]
	.loc 1 1324 13
	cbz	r3, .L303
.L272:
	.loc 1 1326 13 is_stmt 1
	.loc 1 1326 40 is_stmt 0
	ldr	r2, [r4]
	.loc 1 1326 51
	ldr	r3, [r2]
	.loc 1 1326 56
	bic	r3, r3, #8
	str	r3, [r2]
.L273:
	.loc 1 1330 11 is_stmt 1
	.loc 1 1330 43 is_stmt 0
	ldr	r3, [r4, #92]
	.loc 1 1330 57
	and	r2, r3, #31
	.loc 1 1330 35
	movs	r3, #63
	lsls	r3, r3, r2
	.loc 1 1330 26
	str	r3, [r7, #8]
	.loc 1 1333 11 is_stmt 1
	.loc 1 1333 23 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #53]
	.loc 1 1336 11 is_stmt 1
	.loc 1 1336 15
	.loc 1 1336 28 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 1336 13 is_stmt 1
	.loc 1 1338 11
	.loc 1 1338 18 is_stmt 0
	ldr	r3, [r4, #80]
	.loc 1 1338 13
	cmp	r3, #0
	beq	.L244
	.loc 1 1340 13 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL201:
	.loc 1 1342 11
	b	.L244
.L303:
	.loc 1 1324 58 is_stmt 0 discriminator 1
	ldr	r3, [r4, #72]
	.loc 1 1324 50 discriminator 1
	cmp	r3, #0
	bne	.L272
	b	.L273
.L277:
	.loc 1 1359 13 is_stmt 1
	.loc 1 1359 20 is_stmt 0
	ldr	r3, [r4, #60]
	.loc 1 1359 15
	cbz	r3, .L267
	.loc 1 1362 15 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL202:
	b	.L267
.L307:
	.align	2
.L306:
	.word	1073872912
	.word	1073872936
.L276:
	.loc 1 1369 11
	.loc 1 1369 53 is_stmt 0
	ldr	r2, [r3]
	.loc 1 1369 13
	tst	r2, #256
	bne	.L278
	.loc 1 1372 13 is_stmt 1
	.loc 1 1372 51 is_stmt 0
	ldr	r2, [r3]
	.loc 1 1372 56
	bic	r2, r2, #16
	str	r2, [r3]
	.loc 1 1375 13 is_stmt 1
	.loc 1 1375 25 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #53]
	.loc 1 1378 13 is_stmt 1
	.loc 1 1378 17
	.loc 1 1378 30 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
.L278:
	.loc 1 1378 15 is_stmt 1 discriminator 1
	.loc 1 1381 11 discriminator 1
	.loc 1 1381 18 is_stmt 0 discriminator 1
	ldr	r3, [r4, #60]
	.loc 1 1381 13 discriminator 1
	cbz	r3, .L267
	.loc 1 1384 13 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL203:
.L267:
	.loc 1 1391 5
	.loc 1 1391 12 is_stmt 0
	ldr	r3, [r4, #84]
	.loc 1 1391 7
	cmp	r3, #0
	beq	.L244
	.loc 1 1393 7 is_stmt 1
	.loc 1 1393 15 is_stmt 0
	ldr	r3, [r4, #84]
	.loc 1 1393 9
	tst	r3, #1
	beq	.L279
	.loc 1 1395 9 is_stmt 1
	.loc 1 1395 21 is_stmt 0
	movs	r3, #4
	strb	r3, [r4, #53]
	.loc 1 1398 9 is_stmt 1
	.loc 1 1398 20 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1398 1823
	ldr	r1, .L308
	ldr	r2, .L308+4
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L280
	.loc 1 1398 227 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 336 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 445 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 554 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 663 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 772 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 881 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 990 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 1099 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 1208 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 1317 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 1426 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 1535 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 1644 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L280
	.loc 1 1398 1868 discriminator 30
	ldr	r2, [r3]
	.loc 1 1398 1874 discriminator 30
	bic	r2, r2, #1
	str	r2, [r3]
	b	.L284
.L280:
	.loc 1 1398 1797 discriminator 29
	ldr	r2, [r3]
	.loc 1 1398 1802 discriminator 29
	bic	r2, r2, #1
	str	r2, [r3]
.L284:
	.loc 1 1400 9 is_stmt 1
	.loc 1 1402 11
	.loc 1 1402 15 is_stmt 0
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	.loc 1 1402 14
	str	r3, [sp, #4]
	cmp	r3, r5
	bhi	.L283
	.loc 1 1407 78 is_stmt 1
	.loc 1 1407 43 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1407 54
	ldr	r3, [r3]
	.loc 1 1407 78
	tst	r3, #1
	bne	.L284
.L283:
	.loc 1 1409 9 is_stmt 1
	.loc 1 1409 40 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1409 51
	ldr	r3, [r3]
	.loc 1 1409 11
	tst	r3, #1
	beq	.L285
	.loc 1 1412 11 is_stmt 1
	.loc 1 1412 23 is_stmt 0
	movs	r3, #3
	strb	r3, [r4, #53]
.L286:
	.loc 1 1421 9 is_stmt 1
	.loc 1 1421 13
	.loc 1 1421 26 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
.L279:
	.loc 1 1421 11 is_stmt 1 discriminator 1
	.loc 1 1424 7 discriminator 1
	.loc 1 1424 14 is_stmt 0 discriminator 1
	ldr	r3, [r4, #76]
	.loc 1 1424 9 discriminator 1
	cbz	r3, .L244
	.loc 1 1427 9 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL204:
.L244:
	.loc 1 1566 1 is_stmt 0
	add	sp, sp, #12
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.LVL205:
.L285:
	.cfi_restore_state
	.loc 1 1417 11 is_stmt 1
	.loc 1 1417 23 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #53]
	b	.L286
.LVL206:
.L289:
	.loc 1 1456 11 is_stmt 1
	.loc 1 1456 18 is_stmt 0
	ldr	r3, [r4, #64]
	.loc 1 1456 13
	cmp	r3, #0
	beq	.L244
	.loc 1 1459 13 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL207:
	b	.L244
.LVL208:
.L288:
	.loc 1 1465 9
	.loc 1 1465 11 is_stmt 0
	tst	r2, #32
	bne	.L290
	.loc 1 1468 11 is_stmt 1
	.loc 1 1468 22 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1468 1997
	ldr	r1, .L308
	ldr	r2, .L308+4
.LVL209:
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L291
	.loc 1 1468 229 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 338 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 447 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 556 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 665 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 774 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 883 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 992 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 1101 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 1210 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 1319 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 1428 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 1537 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 1646 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L291
	.loc 1 1468 2045 discriminator 30
	ldr	r2, [r3]
	.loc 1 1468 2051 discriminator 30
	bic	r2, r2, #4
	str	r2, [r3]
	b	.L290
.L291:
	.loc 1 1468 1865 discriminator 29
	ldr	r2, [r3]
	.loc 1 1468 1870 discriminator 29
	bic	r2, r2, #8
	.loc 1 1468 1907 discriminator 29
	str	r2, [r3]
.L290:
	.loc 1 1474 8 is_stmt 1
	.loc 1 1474 15 is_stmt 0
	ldr	r3, [r4, #64]
	.loc 1 1474 10
	cmp	r3, #0
	beq	.L244
	.loc 1 1477 11 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL210:
	b	.L244
.LVL211:
.L287:
	.loc 1 1483 10
	.loc 1 1483 54 is_stmt 0
	movs	r0, #2
	lsls	r0, r0, r1
	.loc 1 1483 13
	tst	r0, ip
	beq	.L293
	.loc 1 1483 94 discriminator 1
	tst	r2, #2
	beq	.L293
	.loc 1 1486 7 is_stmt 1
	.loc 1 1486 23 is_stmt 0
	str	r0, [r7, #4]
	.loc 1 1489 7 is_stmt 1
	.loc 1 1489 9 is_stmt 0
	tst	r2, #32768
	beq	.L294
	.loc 1 1492 9 is_stmt 1
	.loc 1 1492 11 is_stmt 0
	tst	r2, #65536
	bne	.L295
	.loc 1 1494 11 is_stmt 1
	.loc 1 1494 18 is_stmt 0
	ldr	r3, [r4, #68]
	.loc 1 1494 13
	cmp	r3, #0
	beq	.L244
	.loc 1 1497 13 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL212:
	b	.L244
.LVL213:
.L295:
	.loc 1 1503 11
	.loc 1 1503 18 is_stmt 0
	ldr	r3, [r4, #60]
	.loc 1 1503 13
	cmp	r3, #0
	beq	.L244
	.loc 1 1506 13 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL214:
	b	.L244
.LVL215:
.L294:
	.loc 1 1512 9
	.loc 1 1512 11 is_stmt 0
	tst	r2, #32
	bne	.L296
	.loc 1 1515 11 is_stmt 1
	.loc 1 1515 22 is_stmt 0
	ldr	r3, [r4]
	.loc 1 1515 2087
	ldr	r1, .L308
	ldr	r2, .L308+4
.LVL216:
	cmp	r3, r2
	it	ne
	cmpne	r3, r1
	beq	.L297
	.loc 1 1515 229 discriminator 2
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 338 discriminator 4
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 447 discriminator 6
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 556 discriminator 8
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 665 discriminator 10
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 774 discriminator 12
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 883 discriminator 14
	add	r2, r2, #856
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 992 discriminator 16
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 1101 discriminator 18
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 1210 discriminator 20
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 1319 discriminator 22
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 1428 discriminator 24
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 1537 discriminator 26
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 1646 discriminator 28
	adds	r2, r2, #24
	cmp	r3, r2
	beq	.L297
	.loc 1 1515 2135 discriminator 30
	ldr	r2, [r3]
	.loc 1 1515 2141 discriminator 30
	bic	r2, r2, #10
	str	r2, [r3]
	b	.L299
.L297:
	.loc 1 1515 1895 discriminator 29
	ldr	r2, [r3]
	.loc 1 1515 1900 discriminator 29
	bic	r2, r2, #20
	.loc 1 1515 1967 discriminator 29
	str	r2, [r3]
.L299:
	.loc 1 1518 11 is_stmt 1
	.loc 1 1518 23 is_stmt 0
	movs	r3, #1
	strb	r3, [r4, #53]
	.loc 1 1521 11 is_stmt 1
	.loc 1 1521 15
	.loc 1 1521 28 is_stmt 0
	movs	r3, #0
	strb	r3, [r4, #52]
.L296:
	.loc 1 1521 13 is_stmt 1 discriminator 1
	.loc 1 1524 9 discriminator 1
	.loc 1 1524 16 is_stmt 0 discriminator 1
	ldr	r3, [r4, #60]
	.loc 1 1524 11 discriminator 1
	cmp	r3, #0
	beq	.L244
	.loc 1 1527 11 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL217:
	b	.L244
.LVL218:
.L293:
	.loc 1 1532 10
	.loc 1 1532 54 is_stmt 0
	movs	r0, #8
	lsl	r1, r0, r1
	.loc 1 1532 13
	tst	r1, ip
	beq	.L244
	.loc 1 1532 94 discriminator 1
	tst	r2, #8
	beq	.L244
	.loc 1 1537 7 is_stmt 1 discriminator 30
	.loc 1 1537 2227 is_stmt 0 discriminator 30
	ldr	r2, [r3]
.LVL219:
	.loc 1 1537 2233 discriminator 30
	bic	r2, r2, #14
	str	r2, [r3]
	.loc 1 1540 7 is_stmt 1 discriminator 30
	.loc 1 1540 51 is_stmt 0 discriminator 30
	ldr	r3, [r4, #92]
	.loc 1 1540 65 discriminator 30
	and	r3, r3, #31
	.loc 1 1540 43 discriminator 30
	movs	r2, #1
	lsl	r3, r2, r3
	.loc 1 1540 23 discriminator 30
	str	r3, [r7, #4]
	.loc 1 1543 7 is_stmt 1 discriminator 30
	.loc 1 1543 23 is_stmt 0 discriminator 30
	str	r2, [r4, #84]
	.loc 1 1546 7 is_stmt 1 discriminator 30
	.loc 1 1546 19 is_stmt 0 discriminator 30
	strb	r2, [r4, #53]
	.loc 1 1549 7 is_stmt 1 discriminator 30
	.loc 1 1549 11 discriminator 30
	.loc 1 1549 24 is_stmt 0 discriminator 30
	movs	r3, #0
	strb	r3, [r4, #52]
	.loc 1 1549 9 is_stmt 1 discriminator 30
	.loc 1 1551 7 discriminator 30
	.loc 1 1551 15 is_stmt 0 discriminator 30
	ldr	r3, [r4, #76]
	.loc 1 1551 10 discriminator 30
	cmp	r3, #0
	beq	.L244
	.loc 1 1554 9 is_stmt 1
	mov	r0, r4
	blx	r3
.LVL220:
	.loc 1 1565 3
	b	.L244
.L309:
	.align	2
.L308:
	.word	1073872912
	.word	1073872936
	.cfi_endproc
.LFE342:
	.size	HAL_DMA_IRQHandler, .-HAL_DMA_IRQHandler
	.section	.text.HAL_DMA_RegisterCallback,"ax",%progbits
	.align	1
	.global	HAL_DMA_RegisterCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_RegisterCallback, %function
HAL_DMA_RegisterCallback:
.LFB343:
	.loc 1 1579 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL221:
	.loc 1 1581 3
	.loc 1 1584 3
	.loc 1 1584 5 is_stmt 0
	mov	r3, r0
	cbz	r0, .L320
	.loc 1 1590 3 is_stmt 1
	.loc 1 1590 7
	.loc 1 1590 16 is_stmt 0
	ldrb	r0, [r0, #52]	@ zero_extendqisi2
.LVL222:
	.loc 1 1590 9
	cmp	r0, #1
	beq	.L321
	.loc 1 1590 66 is_stmt 1 discriminator 2
	.loc 1 1590 79 is_stmt 0 discriminator 2
	movs	r0, #1
	strb	r0, [r3, #52]
	.loc 1 1590 5 is_stmt 1 discriminator 2
	.loc 1 1592 3 discriminator 2
	.loc 1 1592 33 is_stmt 0 discriminator 2
	ldrb	r0, [r3, #53]	@ zero_extendqisi2
	uxtb	r0, r0
	.loc 1 1592 5 discriminator 2
	cmp	r0, #1
	beq	.L324
	.loc 1 1628 12
	movs	r0, #1
.L312:
.LVL223:
	.loc 1 1632 3 is_stmt 1
	.loc 1 1632 7
	.loc 1 1632 20 is_stmt 0
	movs	r2, #0
.LVL224:
	strb	r2, [r3, #52]
	.loc 1 1632 5 is_stmt 1
	.loc 1 1634 3
	.loc 1 1634 10 is_stmt 0
	bx	lr
.LVL225:
.L324:
	.loc 1 1594 5 is_stmt 1
	cmp	r1, #5
	bhi	.L312
	tbb	[pc, r1]
.L314:
	.byte	(.L319-.L314)/2
	.byte	(.L318-.L314)/2
	.byte	(.L317-.L314)/2
	.byte	(.L316-.L314)/2
	.byte	(.L315-.L314)/2
	.byte	(.L313-.L314)/2
	.p2align 1
.L319:
	.loc 1 1597 7
	.loc 1 1597 30 is_stmt 0
	str	r2, [r3, #60]
	.loc 1 1598 7 is_stmt 1
	.loc 1 1581 21 is_stmt 0
	mov	r0, r1
	.loc 1 1598 7
	b	.L312
.L318:
	.loc 1 1601 7 is_stmt 1
	.loc 1 1601 34 is_stmt 0
	str	r2, [r3, #64]
	.loc 1 1602 7 is_stmt 1
	.loc 1 1581 21 is_stmt 0
	movs	r0, #0
	.loc 1 1602 7
	b	.L312
.L317:
	.loc 1 1605 7 is_stmt 1
	.loc 1 1605 32 is_stmt 0
	str	r2, [r3, #68]
	.loc 1 1606 7 is_stmt 1
	.loc 1 1581 21 is_stmt 0
	movs	r0, #0
	.loc 1 1606 7
	b	.L312
.L316:
	.loc 1 1609 7 is_stmt 1
	.loc 1 1609 36 is_stmt 0
	str	r2, [r3, #72]
	.loc 1 1610 7 is_stmt 1
	.loc 1 1581 21 is_stmt 0
	movs	r0, #0
	.loc 1 1610 7
	b	.L312
.L315:
	.loc 1 1613 7 is_stmt 1
	.loc 1 1613 31 is_stmt 0
	str	r2, [r3, #76]
	.loc 1 1614 7 is_stmt 1
	.loc 1 1581 21 is_stmt 0
	movs	r0, #0
	.loc 1 1614 7
	b	.L312
.L313:
	.loc 1 1617 7 is_stmt 1
	.loc 1 1617 31 is_stmt 0
	str	r2, [r3, #80]
	.loc 1 1618 7 is_stmt 1
	.loc 1 1581 21 is_stmt 0
	movs	r0, #0
	.loc 1 1618 7
	b	.L312
.LVL226:
.L320:
	.loc 1 1586 12
	movs	r0, #1
.LVL227:
	bx	lr
.L321:
	.loc 1 1590 47
	movs	r0, #2
	.loc 1 1635 1
	bx	lr
	.cfi_endproc
.LFE343:
	.size	HAL_DMA_RegisterCallback, .-HAL_DMA_RegisterCallback
	.section	.text.HAL_DMA_UnRegisterCallback,"ax",%progbits
	.align	1
	.global	HAL_DMA_UnRegisterCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_UnRegisterCallback, %function
HAL_DMA_UnRegisterCallback:
.LFB344:
	.loc 1 1646 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL228:
	.loc 1 1647 3
	.loc 1 1650 3
	.loc 1 1650 5 is_stmt 0
	mov	r3, r0
	cmp	r0, #0
	beq	.L336
	.loc 1 1656 3 is_stmt 1
	.loc 1 1656 7
	.loc 1 1656 16 is_stmt 0
	ldrb	r2, [r0, #52]	@ zero_extendqisi2
	.loc 1 1656 9
	cmp	r2, #1
	beq	.L337
	.loc 1 1656 66 is_stmt 1 discriminator 2
	.loc 1 1656 79 is_stmt 0 discriminator 2
	movs	r2, #1
	strb	r2, [r0, #52]
	.loc 1 1656 5 is_stmt 1 discriminator 2
	.loc 1 1658 3 discriminator 2
	.loc 1 1658 33 is_stmt 0 discriminator 2
	ldrb	r0, [r0, #53]	@ zero_extendqisi2
.LVL229:
	uxtb	r0, r0
	.loc 1 1658 5 discriminator 2
	cmp	r0, r2
	beq	.L340
	.loc 1 1702 12
	movs	r0, #1
.L327:
.LVL230:
	.loc 1 1706 3 is_stmt 1
	.loc 1 1706 7
	.loc 1 1706 20 is_stmt 0
	movs	r2, #0
	strb	r2, [r3, #52]
	.loc 1 1706 5 is_stmt 1
	.loc 1 1708 3
	.loc 1 1708 10 is_stmt 0
	bx	lr
.LVL231:
.L340:
	.loc 1 1660 5 is_stmt 1
	cmp	r1, #6
	bhi	.L327
	tbb	[pc, r1]
.L329:
	.byte	(.L335-.L329)/2
	.byte	(.L334-.L329)/2
	.byte	(.L333-.L329)/2
	.byte	(.L332-.L329)/2
	.byte	(.L331-.L329)/2
	.byte	(.L330-.L329)/2
	.byte	(.L328-.L329)/2
	.p2align 1
.L335:
	.loc 1 1663 7
	.loc 1 1663 30 is_stmt 0
	movs	r2, #0
	str	r2, [r3, #60]
	.loc 1 1664 7 is_stmt 1
	.loc 1 1647 21 is_stmt 0
	mov	r0, r1
	.loc 1 1664 7
	b	.L327
.L334:
	.loc 1 1667 7 is_stmt 1
	.loc 1 1667 34 is_stmt 0
	movs	r0, #0
	str	r0, [r3, #64]
	.loc 1 1668 7 is_stmt 1
	b	.L327
.L333:
	.loc 1 1671 7
	.loc 1 1671 32 is_stmt 0
	movs	r0, #0
	str	r0, [r3, #68]
	.loc 1 1672 7 is_stmt 1
	b	.L327
.L332:
	.loc 1 1675 7
	.loc 1 1675 36 is_stmt 0
	movs	r0, #0
	str	r0, [r3, #72]
	.loc 1 1676 7 is_stmt 1
	b	.L327
.L331:
	.loc 1 1679 7
	.loc 1 1679 31 is_stmt 0
	movs	r0, #0
	str	r0, [r3, #76]
	.loc 1 1680 7 is_stmt 1
	b	.L327
.L330:
	.loc 1 1683 7
	.loc 1 1683 31 is_stmt 0
	movs	r0, #0
	str	r0, [r3, #80]
	.loc 1 1684 7 is_stmt 1
	b	.L327
.L328:
	.loc 1 1687 7
	.loc 1 1687 30 is_stmt 0
	movs	r0, #0
	str	r0, [r3, #60]
	.loc 1 1688 7 is_stmt 1
	.loc 1 1688 34 is_stmt 0
	str	r0, [r3, #64]
	.loc 1 1689 7 is_stmt 1
	.loc 1 1689 32 is_stmt 0
	str	r0, [r3, #68]
	.loc 1 1690 7 is_stmt 1
	.loc 1 1690 36 is_stmt 0
	str	r0, [r3, #72]
	.loc 1 1691 7 is_stmt 1
	.loc 1 1691 31 is_stmt 0
	str	r0, [r3, #76]
	.loc 1 1692 7 is_stmt 1
	.loc 1 1692 31 is_stmt 0
	str	r0, [r3, #80]
	.loc 1 1693 7 is_stmt 1
	b	.L327
.LVL232:
.L336:
	.loc 1 1652 12 is_stmt 0
	movs	r0, #1
.LVL233:
	bx	lr
.LVL234:
.L337:
	.loc 1 1656 47
	movs	r0, #2
.LVL235:
	.loc 1 1709 1
	bx	lr
	.cfi_endproc
.LFE344:
	.size	HAL_DMA_UnRegisterCallback, .-HAL_DMA_UnRegisterCallback
	.section	.text.HAL_DMA_GetState,"ax",%progbits
	.align	1
	.global	HAL_DMA_GetState
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_GetState, %function
HAL_DMA_GetState:
.LFB345:
	.loc 1 1737 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL236:
	.loc 1 1738 3
	.loc 1 1738 14 is_stmt 0
	ldrb	r0, [r0, #53]	@ zero_extendqisi2
.LVL237:
	.loc 1 1739 1
	bx	lr
	.cfi_endproc
.LFE345:
	.size	HAL_DMA_GetState, .-HAL_DMA_GetState
	.section	.text.HAL_DMA_GetError,"ax",%progbits
	.align	1
	.global	HAL_DMA_GetError
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_DMA_GetError, %function
HAL_DMA_GetError:
.LFB346:
	.loc 1 1748 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL238:
	.loc 1 1749 3
	.loc 1 1749 14 is_stmt 0
	ldr	r0, [r0, #84]
.LVL239:
	.loc 1 1750 1
	bx	lr
	.cfi_endproc
.LFE346:
	.size	HAL_DMA_GetError, .-HAL_DMA_GetError
	.section	.rodata.flagBitshiftOffset.0,"a"
	.align	2
	.type	flagBitshiftOffset.0, %object
	.size	flagBitshiftOffset.0, 8
flagBitshiftOffset.0:
	.ascii	"\000\006\020\026\000\006\020\026"
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/stm32h743xx.h"
	.file 5 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_def.h"
	.file 6 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_dma.h"
	.file 7 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/system_stm32h7xx.h"
	.file 8 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xe4a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x21
	.4byte	.LASF151
	.byte	0x1d
	.4byte	.LASF152
	.4byte	.LASF153
	.4byte	.LLRL52
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x8
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x8
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x4e
	.uleb128 0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x8
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x6f
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x8
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x22
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x42
	.uleb128 0x16
	.4byte	0x84
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x63
	.uleb128 0x19
	.4byte	0x95
	.uleb128 0x16
	.4byte	0xa1
	.uleb128 0x23
	.4byte	.LASF154
	.byte	0x7
	.byte	0x39
	.byte	0x11
	.4byte	0x95
	.uleb128 0xd
	.byte	0x58
	.2byte	0x209
	.4byte	0x15a
	.uleb128 0x5
	.4byte	.LASF13
	.2byte	0x20b
	.byte	0x15
	.4byte	0xa1
	.byte	0
	.uleb128 0xc
	.ascii	"CR\000"
	.2byte	0x20c
	.4byte	0xa1
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF14
	.2byte	0x20d
	.byte	0xc
	.4byte	0x15a
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF15
	.2byte	0x20e
	.byte	0x15
	.4byte	0xa1
	.byte	0x34
	.uleb128 0x5
	.4byte	.LASF16
	.2byte	0x20f
	.byte	0xc
	.4byte	0x95
	.byte	0x38
	.uleb128 0x5
	.4byte	.LASF17
	.2byte	0x210
	.byte	0x15
	.4byte	0xa1
	.byte	0x3c
	.uleb128 0x5
	.4byte	.LASF18
	.2byte	0x211
	.byte	0xc
	.4byte	0x95
	.byte	0x40
	.uleb128 0x5
	.4byte	.LASF19
	.2byte	0x212
	.byte	0x15
	.4byte	0xa1
	.byte	0x44
	.uleb128 0x5
	.4byte	.LASF20
	.2byte	0x213
	.byte	0xc
	.4byte	0x95
	.byte	0x48
	.uleb128 0x5
	.4byte	.LASF21
	.2byte	0x214
	.byte	0x15
	.4byte	0xa1
	.byte	0x4c
	.uleb128 0x5
	.4byte	.LASF22
	.2byte	0x215
	.byte	0xc
	.4byte	0x95
	.byte	0x50
	.uleb128 0x5
	.4byte	.LASF23
	.2byte	0x216
	.byte	0x15
	.4byte	0xa1
	.byte	0x54
	.byte	0
	.uleb128 0x1a
	.4byte	0x95
	.4byte	0x16a
	.uleb128 0x1b
	.4byte	0x2d
	.byte	0xa
	.byte	0
	.uleb128 0xe
	.4byte	.LASF24
	.2byte	0x217
	.byte	0x2
	.4byte	0xb7
	.uleb128 0xd
	.byte	0x18
	.2byte	0x22f
	.4byte	0x1c9
	.uleb128 0xc
	.ascii	"CR\000"
	.2byte	0x231
	.4byte	0xa1
	.byte	0
	.uleb128 0x5
	.4byte	.LASF25
	.2byte	0x232
	.byte	0x15
	.4byte	0xa1
	.byte	0x4
	.uleb128 0xc
	.ascii	"PAR\000"
	.2byte	0x233
	.4byte	0xa1
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF26
	.2byte	0x234
	.byte	0x15
	.4byte	0xa1
	.byte	0xc
	.uleb128 0x5
	.4byte	.LASF27
	.2byte	0x235
	.byte	0x15
	.4byte	0xa1
	.byte	0x10
	.uleb128 0xc
	.ascii	"FCR\000"
	.2byte	0x236
	.4byte	0xa1
	.byte	0x14
	.byte	0
	.uleb128 0xe
	.4byte	.LASF28
	.2byte	0x237
	.byte	0x3
	.4byte	0x176
	.uleb128 0xd
	.byte	0x14
	.2byte	0x241
	.4byte	0x21e
	.uleb128 0xc
	.ascii	"CCR\000"
	.2byte	0x243
	.4byte	0xa1
	.byte	0
	.uleb128 0x5
	.4byte	.LASF29
	.2byte	0x244
	.byte	0x15
	.4byte	0xa1
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF30
	.2byte	0x245
	.byte	0x15
	.4byte	0xa1
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF31
	.2byte	0x246
	.byte	0x15
	.4byte	0xa1
	.byte	0xc
	.uleb128 0x5
	.4byte	.LASF32
	.2byte	0x247
	.byte	0x15
	.4byte	0xa1
	.byte	0x10
	.byte	0
	.uleb128 0xe
	.4byte	.LASF33
	.2byte	0x248
	.byte	0x3
	.4byte	0x1d5
	.uleb128 0xd
	.byte	0x4
	.2byte	0x250
	.4byte	0x23f
	.uleb128 0xc
	.ascii	"CCR\000"
	.2byte	0x252
	.4byte	0xa1
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF34
	.2byte	0x253
	.byte	0x2
	.4byte	0x22a
	.uleb128 0xd
	.byte	0x8
	.2byte	0x255
	.4byte	0x26c
	.uleb128 0xc
	.ascii	"CSR\000"
	.2byte	0x257
	.4byte	0xa1
	.byte	0
	.uleb128 0xc
	.ascii	"CFR\000"
	.2byte	0x258
	.4byte	0xa1
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.4byte	.LASF35
	.2byte	0x259
	.byte	0x2
	.4byte	0x24b
	.uleb128 0xd
	.byte	0x4
	.2byte	0x25b
	.4byte	0x28e
	.uleb128 0x5
	.4byte	.LASF36
	.2byte	0x25d
	.byte	0x15
	.4byte	0xa1
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF37
	.2byte	0x25e
	.byte	0x2
	.4byte	0x278
	.uleb128 0xd
	.byte	0x8
	.2byte	0x260
	.4byte	0x2bd
	.uleb128 0x5
	.4byte	.LASF38
	.2byte	0x262
	.byte	0x15
	.4byte	0xa1
	.byte	0
	.uleb128 0x5
	.4byte	.LASF39
	.2byte	0x263
	.byte	0x15
	.4byte	0xa1
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.4byte	.LASF40
	.2byte	0x264
	.byte	0x2
	.4byte	0x29a
	.uleb128 0x8
	.byte	0x8
	.byte	0x4
	.4byte	.LASF41
	.uleb128 0x24
	.byte	0x4
	.uleb128 0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF42
	.uleb128 0x8
	.byte	0x4
	.byte	0x4
	.4byte	.LASF43
	.uleb128 0x8
	.byte	0x8
	.byte	0x4
	.4byte	.LASF44
	.uleb128 0x13
	.4byte	0x4e
	.byte	0x5
	.byte	0x28
	.4byte	0x30b
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0
	.uleb128 0x6
	.4byte	.LASF46
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF47
	.byte	0x2
	.uleb128 0x6
	.4byte	.LASF48
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.4byte	.LASF49
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0x2e7
	.uleb128 0x13
	.4byte	0x4e
	.byte	0x5
	.byte	0x33
	.4byte	0x32f
	.uleb128 0x6
	.4byte	.LASF50
	.byte	0
	.uleb128 0x6
	.4byte	.LASF51
	.byte	0x1
	.byte	0
	.uleb128 0x9
	.4byte	.LASF52
	.byte	0x5
	.byte	0x36
	.byte	0x3
	.4byte	0x317
	.uleb128 0x17
	.byte	0x30
	.byte	0x6
	.byte	0x30
	.4byte	0x3e0
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x6
	.byte	0x32
	.byte	0xc
	.4byte	0x95
	.byte	0
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x6
	.byte	0x35
	.byte	0xc
	.4byte	0x95
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0x6
	.byte	0x39
	.byte	0xc
	.4byte	0x95
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF56
	.byte	0x6
	.byte	0x3c
	.byte	0xc
	.4byte	0x95
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0x6
	.byte	0x3f
	.byte	0xc
	.4byte	0x95
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF58
	.byte	0x6
	.byte	0x42
	.byte	0xc
	.4byte	0x95
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF59
	.byte	0x6
	.byte	0x45
	.byte	0xc
	.4byte	0x95
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF60
	.byte	0x6
	.byte	0x4a
	.byte	0xc
	.4byte	0x95
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x6
	.byte	0x4d
	.byte	0xc
	.4byte	0x95
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF62
	.byte	0x6
	.byte	0x52
	.byte	0xc
	.4byte	0x95
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0x6
	.byte	0x55
	.byte	0xc
	.4byte	0x95
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x6
	.byte	0x5b
	.byte	0xc
	.4byte	0x95
	.byte	0x2c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF65
	.byte	0x6
	.byte	0x60
	.byte	0x2
	.4byte	0x33b
	.uleb128 0x13
	.4byte	0x4e
	.byte	0x6
	.byte	0x66
	.4byte	0x416
	.uleb128 0x6
	.4byte	.LASF66
	.byte	0
	.uleb128 0x6
	.4byte	.LASF67
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF68
	.byte	0x2
	.uleb128 0x6
	.4byte	.LASF69
	.byte	0x3
	.uleb128 0x6
	.4byte	.LASF70
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.4byte	.LASF71
	.byte	0x6
	.byte	0x6c
	.byte	0x2
	.4byte	0x3ec
	.uleb128 0x19
	.4byte	0x416
	.uleb128 0x13
	.4byte	0x4e
	.byte	0x6
	.byte	0x72
	.4byte	0x43f
	.uleb128 0x6
	.4byte	.LASF72
	.byte	0
	.uleb128 0x6
	.4byte	.LASF73
	.byte	0x1
	.byte	0
	.uleb128 0x9
	.4byte	.LASF74
	.byte	0x6
	.byte	0x75
	.byte	0x2
	.4byte	0x427
	.uleb128 0x13
	.4byte	0x4e
	.byte	0x6
	.byte	0x7b
	.4byte	0x481
	.uleb128 0x6
	.4byte	.LASF75
	.byte	0
	.uleb128 0x6
	.4byte	.LASF76
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF77
	.byte	0x2
	.uleb128 0x6
	.4byte	.LASF78
	.byte	0x3
	.uleb128 0x6
	.4byte	.LASF79
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF81
	.byte	0x6
	.byte	0
	.uleb128 0x9
	.4byte	.LASF82
	.byte	0x6
	.byte	0x83
	.byte	0x2
	.4byte	0x44b
	.uleb128 0x25
	.4byte	.LASF155
	.byte	0x78
	.byte	0x6
	.byte	0x88
	.byte	0x10
	.4byte	0x59f
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0x6
	.byte	0x8a
	.byte	0x9
	.4byte	0x2d0
	.byte	0
	.uleb128 0x1
	.4byte	.LASF84
	.byte	0x6
	.byte	0x8c
	.byte	0x13
	.4byte	0x3e0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF85
	.byte	0x6
	.byte	0x8e
	.byte	0x13
	.4byte	0x32f
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF86
	.byte	0x6
	.byte	0x90
	.byte	0x21
	.4byte	0x422
	.byte	0x35
	.uleb128 0x1
	.4byte	.LASF87
	.byte	0x6
	.byte	0x92
	.byte	0x9
	.4byte	0x2d0
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF88
	.byte	0x6
	.byte	0x94
	.byte	0xb
	.4byte	0x5af
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF89
	.byte	0x6
	.byte	0x96
	.byte	0xb
	.4byte	0x5af
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF90
	.byte	0x6
	.byte	0x98
	.byte	0xb
	.4byte	0x5af
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF91
	.byte	0x6
	.byte	0x9a
	.byte	0xb
	.4byte	0x5af
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x6
	.byte	0x9c
	.byte	0xb
	.4byte	0x5af
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0x6
	.byte	0x9e
	.byte	0xb
	.4byte	0x5af
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF94
	.byte	0x6
	.byte	0xa0
	.byte	0x14
	.4byte	0xa1
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF95
	.byte	0x6
	.byte	0xa2
	.byte	0xb
	.4byte	0x95
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF96
	.byte	0x6
	.byte	0xa4
	.byte	0xb
	.4byte	0x95
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF97
	.byte	0x6
	.byte	0xa6
	.byte	0x1a
	.4byte	0x5b4
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF98
	.byte	0x6
	.byte	0xa8
	.byte	0x20
	.4byte	0x5b9
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF99
	.byte	0x6
	.byte	0xaa
	.byte	0xb
	.4byte	0x95
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF100
	.byte	0x6
	.byte	0xad
	.byte	0x1d
	.4byte	0x5be
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF101
	.byte	0x6
	.byte	0xaf
	.byte	0x23
	.4byte	0x5c3
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF102
	.byte	0x6
	.byte	0xb1
	.byte	0xb
	.4byte	0x95
	.byte	0x74
	.byte	0
	.uleb128 0x1c
	.4byte	0x5aa
	.uleb128 0x1d
	.4byte	0x5aa
	.byte	0
	.uleb128 0xa
	.4byte	0x48d
	.uleb128 0xa
	.4byte	0x59f
	.uleb128 0xa
	.4byte	0x23f
	.uleb128 0xa
	.4byte	0x26c
	.uleb128 0xa
	.4byte	0x28e
	.uleb128 0xa
	.4byte	0x2bd
	.uleb128 0x9
	.4byte	.LASF103
	.byte	0x6
	.byte	0xb3
	.byte	0x2
	.4byte	0x48d
	.uleb128 0xa
	.4byte	0x5c8
	.uleb128 0x17
	.byte	0xc
	.byte	0x1
	.byte	0x70
	.4byte	0x606
	.uleb128 0x1e
	.ascii	"ISR\000"
	.byte	0x72
	.4byte	0xa1
	.uleb128 0x1
	.4byte	.LASF104
	.byte	0x1
	.byte	0x73
	.byte	0x15
	.4byte	0xa1
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF105
	.byte	0x1
	.byte	0x74
	.byte	0x15
	.4byte	0xa1
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.4byte	.LASF106
	.byte	0x1
	.byte	0x75
	.byte	0x3
	.4byte	0x5d9
	.uleb128 0x17
	.byte	0x8
	.byte	0x1
	.byte	0x77
	.4byte	0x632
	.uleb128 0x1e
	.ascii	"ISR\000"
	.byte	0x79
	.4byte	0xa1
	.uleb128 0x1
	.4byte	.LASF105
	.byte	0x1
	.byte	0x7a
	.byte	0x15
	.4byte	0xa1
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.4byte	.LASF107
	.byte	0x1
	.byte	0x7b
	.byte	0x3
	.4byte	0x612
	.uleb128 0x26
	.4byte	.LASF156
	.byte	0x8
	.2byte	0x433
	.byte	0xa
	.4byte	0x95
	.uleb128 0x18
	.4byte	.LASF108
	.2byte	0x7e9
	.4byte	.LFB351
	.4byte	.LFE351-.LFB351
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x67d
	.uleb128 0xf
	.4byte	.LASF110
	.2byte	0x7e9
	.byte	0x44
	.4byte	0x5d4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x10
	.4byte	.LASF111
	.2byte	0x7eb
	.byte	0xc
	.4byte	0x95
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x18
	.4byte	.LASF109
	.2byte	0x7c6
	.4byte	.LFB350
	.4byte	.LFE350-.LFB350
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6c1
	.uleb128 0xf
	.4byte	.LASF110
	.2byte	0x7c6
	.byte	0x41
	.4byte	0x5d4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.4byte	.LASF112
	.2byte	0x7c8
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST8
	.uleb128 0x3
	.4byte	.LASF113
	.2byte	0x7c9
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST9
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF115
	.2byte	0x768
	.byte	0x1a
	.4byte	0x30b
	.4byte	.LFB349
	.4byte	.LFE349-.LFB349
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6fc
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x768
	.byte	0x40
	.4byte	0x5d4
	.4byte	.LLST6
	.uleb128 0x3
	.4byte	.LASF114
	.2byte	0x76a
	.byte	0x15
	.4byte	0x30b
	.4byte	.LLST7
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF116
	.2byte	0x744
	.byte	0x11
	.4byte	0x95
	.4byte	.LFB348
	.4byte	.LFE348-.LFB348
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x74f
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x744
	.byte	0x3c
	.4byte	0x5d4
	.4byte	.LLST3
	.uleb128 0x27
	.4byte	.LLRL4
	.uleb128 0x3
	.4byte	.LASF112
	.2byte	0x748
	.byte	0xe
	.4byte	0x95
	.4byte	.LLST5
	.uleb128 0x10
	.4byte	.LASF117
	.2byte	0x74b
	.byte	0x1a
	.4byte	0x75f
	.uleb128 0x5
	.byte	0x3
	.4byte	flagBitshiftOffset.0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	0x90
	.4byte	0x75f
	.uleb128 0x1b
	.4byte	0x2d
	.byte	0x7
	.byte	0
	.uleb128 0x16
	.4byte	0x74f
	.uleb128 0x18
	.4byte	.LASF118
	.2byte	0x6ed
	.4byte	.LFB347
	.4byte	.LFE347-.LFB347
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7d4
	.uleb128 0xf
	.4byte	.LASF110
	.2byte	0x6ed
	.byte	0x2e
	.4byte	0x5d4
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xf
	.4byte	.LASF119
	.2byte	0x6ed
	.byte	0x3d
	.4byte	0x95
	.uleb128 0x1
	.byte	0x51
	.uleb128 0xf
	.4byte	.LASF120
	.2byte	0x6ed
	.byte	0x52
	.4byte	0x95
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x4
	.4byte	.LASF121
	.2byte	0x6ed
	.byte	0x67
	.4byte	0x95
	.4byte	.LLST0
	.uleb128 0x3
	.4byte	.LASF122
	.2byte	0x6f0
	.byte	0x17
	.4byte	0x7d4
	.4byte	.LLST1
	.uleb128 0x3
	.4byte	.LASF123
	.2byte	0x6f1
	.byte	0x18
	.4byte	0x7d9
	.4byte	.LLST1
	.byte	0
	.uleb128 0xa
	.4byte	0x606
	.uleb128 0xa
	.4byte	0x632
	.uleb128 0xb
	.4byte	.LASF124
	.2byte	0x6d3
	.byte	0xa
	.4byte	0x95
	.4byte	.LFB346
	.4byte	.LFE346-.LFB346
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x809
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x6d3
	.byte	0x2e
	.4byte	0x5d4
	.4byte	.LLST51
	.byte	0
	.uleb128 0xb
	.4byte	.LASF125
	.2byte	0x6c8
	.byte	0x16
	.4byte	0x416
	.4byte	.LFB345
	.4byte	.LFE345-.LFB345
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x834
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x6c8
	.byte	0x3a
	.4byte	0x5d4
	.4byte	.LLST50
	.byte	0
	.uleb128 0xb
	.4byte	.LASF126
	.2byte	0x66d
	.byte	0x13
	.4byte	0x30b
	.4byte	.LFB344
	.4byte	.LFE344-.LFB344
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x87d
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x66d
	.byte	0x41
	.4byte	0x5d4
	.4byte	.LLST48
	.uleb128 0xf
	.4byte	.LASF127
	.2byte	0x66d
	.byte	0x61
	.4byte	0x481
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.4byte	.LASF114
	.2byte	0x66f
	.byte	0x15
	.4byte	0x30b
	.4byte	.LLST49
	.byte	0
	.uleb128 0xb
	.4byte	.LASF128
	.2byte	0x62a
	.byte	0x13
	.4byte	0x30b
	.4byte	.LFB343
	.4byte	.LFE343-.LFB343
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8d6
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x62a
	.byte	0x3f
	.4byte	0x5d4
	.4byte	.LLST45
	.uleb128 0xf
	.4byte	.LASF127
	.2byte	0x62a
	.byte	0x5f
	.4byte	0x481
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.4byte	.LASF129
	.2byte	0x62a
	.byte	0x73
	.4byte	0x8e1
	.4byte	.LLST46
	.uleb128 0x3
	.4byte	.LASF114
	.2byte	0x62d
	.byte	0x15
	.4byte	0x30b
	.4byte	.LLST47
	.byte	0
	.uleb128 0x1c
	.4byte	0x8e1
	.uleb128 0x1d
	.4byte	0x5d4
	.byte	0
	.uleb128 0xa
	.4byte	0x8d6
	.uleb128 0x28
	.4byte	.LASF148
	.byte	0x1
	.2byte	0x4b8
	.byte	0x6
	.4byte	.LFB342
	.4byte	.LFE342-.LFB342
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa61
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x4b8
	.byte	0x2c
	.4byte	0x5d4
	.4byte	.LLST42
	.uleb128 0x10
	.4byte	.LASF130
	.2byte	0x4ba
	.byte	0xc
	.4byte	0x95
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x3
	.4byte	.LASF131
	.2byte	0x4ba
	.byte	0x18
	.4byte	0x95
	.4byte	.LLST43
	.uleb128 0x3
	.4byte	.LASF132
	.2byte	0x4bb
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST44
	.uleb128 0x10
	.4byte	.LASF133
	.2byte	0x4bc
	.byte	0x15
	.4byte	0xa1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.4byte	.LASF134
	.2byte	0x4bd
	.byte	0xc
	.4byte	0x95
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x10
	.4byte	.LASF122
	.2byte	0x4c0
	.byte	0x17
	.4byte	0x7d4
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x10
	.4byte	.LASF123
	.2byte	0x4c1
	.byte	0x18
	.4byte	0x7d9
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x7
	.4byte	.LVL193
	.4byte	0x984
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL195
	.4byte	0x994
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL197
	.4byte	0x9a4
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL199
	.4byte	0x9b4
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL200
	.4byte	0x9c4
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL201
	.4byte	0x9d4
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL202
	.4byte	0x9e4
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL203
	.4byte	0x9f4
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL204
	.4byte	0xa04
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL207
	.4byte	0xa14
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL210
	.4byte	0xa24
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL212
	.4byte	0xa34
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL214
	.4byte	0xa44
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL217
	.4byte	0xa54
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.4byte	.LVL220
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF135
	.2byte	0x3d5
	.byte	0x13
	.4byte	0x30b
	.4byte	.LFB341
	.4byte	.LFE341-.LFB341
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb1c
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x3d5
	.byte	0x3e
	.4byte	0x5d4
	.4byte	.LLST35
	.uleb128 0x4
	.4byte	.LASF136
	.2byte	0x3d5
	.byte	0x61
	.4byte	0x43f
	.4byte	.LLST36
	.uleb128 0x4
	.4byte	.LASF137
	.2byte	0x3d5
	.byte	0x79
	.4byte	0x95
	.4byte	.LLST37
	.uleb128 0x29
	.4byte	.LASF114
	.byte	0x1
	.2byte	0x3d7
	.byte	0x15
	.4byte	0x30b
	.byte	0
	.uleb128 0x3
	.4byte	.LASF138
	.2byte	0x3d8
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST38
	.uleb128 0x3
	.4byte	.LASF139
	.2byte	0x3d9
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST39
	.uleb128 0x3
	.4byte	.LASF140
	.2byte	0x3dc
	.byte	0x16
	.4byte	0xb1c
	.4byte	.LLST40
	.uleb128 0x3
	.4byte	.LASF141
	.2byte	0x3de
	.byte	0x16
	.4byte	0xb1c
	.4byte	.LLST41
	.uleb128 0x12
	.4byte	.LVL163
	.4byte	0x63e
	.uleb128 0x12
	.4byte	.LVL182
	.4byte	0x63e
	.uleb128 0x14
	.4byte	.LVL183
	.4byte	0xb69
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0xa1
	.uleb128 0xb
	.4byte	.LASF142
	.2byte	0x381
	.byte	0x13
	.4byte	0x30b
	.4byte	.LFB340
	.4byte	.LFE340-.LFB340
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb69
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x381
	.byte	0x37
	.4byte	0x5d4
	.4byte	.LLST33
	.uleb128 0x3
	.4byte	.LASF123
	.2byte	0x383
	.byte	0x18
	.4byte	0x7d9
	.4byte	.LLST34
	.uleb128 0x20
	.4byte	.LVL157
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF143
	.2byte	0x30d
	.byte	0x13
	.4byte	0x30b
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbe6
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x30d
	.byte	0x34
	.4byte	0x5d4
	.4byte	.LLST28
	.uleb128 0x3
	.4byte	.LASF122
	.2byte	0x310
	.byte	0x17
	.4byte	0x7d4
	.4byte	.LLST29
	.uleb128 0x3
	.4byte	.LASF123
	.2byte	0x311
	.byte	0x18
	.4byte	0x7d9
	.4byte	.LLST30
	.uleb128 0x3
	.4byte	.LASF144
	.2byte	0x312
	.byte	0x1c
	.4byte	0xbe6
	.4byte	.LLST31
	.uleb128 0x3
	.4byte	.LASF139
	.2byte	0x314
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST32
	.uleb128 0x12
	.4byte	.LVL135
	.4byte	0x63e
	.uleb128 0x12
	.4byte	.LVL142
	.4byte	0x63e
	.byte	0
	.uleb128 0xa
	.4byte	0xa6
	.uleb128 0xb
	.4byte	.LASF145
	.2byte	0x2a9
	.byte	0x13
	.4byte	0x30b
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc66
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x2a9
	.byte	0x37
	.4byte	0x5d4
	.4byte	.LLST23
	.uleb128 0x4
	.4byte	.LASF119
	.2byte	0x2a9
	.byte	0x46
	.4byte	0x95
	.4byte	.LLST24
	.uleb128 0x4
	.4byte	.LASF120
	.2byte	0x2a9
	.byte	0x5b
	.4byte	0x95
	.4byte	.LLST25
	.uleb128 0x4
	.4byte	.LASF121
	.2byte	0x2a9
	.byte	0x70
	.4byte	0x95
	.4byte	.LLST26
	.uleb128 0x3
	.4byte	.LASF114
	.2byte	0x2ab
	.byte	0x15
	.4byte	0x30b
	.4byte	.LLST27
	.uleb128 0x14
	.4byte	.LVL130
	.4byte	0x764
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF146
	.2byte	0x271
	.byte	0x13
	.4byte	0x30b
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xce1
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x271
	.byte	0x34
	.4byte	0x5d4
	.4byte	.LLST18
	.uleb128 0x4
	.4byte	.LASF119
	.2byte	0x271
	.byte	0x43
	.4byte	0x95
	.4byte	.LLST19
	.uleb128 0x4
	.4byte	.LASF120
	.2byte	0x271
	.byte	0x58
	.4byte	0x95
	.4byte	.LLST20
	.uleb128 0x4
	.4byte	.LASF121
	.2byte	0x271
	.byte	0x6d
	.4byte	0x95
	.4byte	.LLST21
	.uleb128 0x3
	.4byte	.LASF114
	.2byte	0x273
	.byte	0x15
	.4byte	0x30b
	.4byte	.LLST22
	.uleb128 0x14
	.4byte	.LVL120
	.4byte	0x764
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF147
	.2byte	0x1d4
	.byte	0x13
	.4byte	0x30b
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd78
	.uleb128 0x4
	.4byte	.LASF110
	.2byte	0x1d4
	.byte	0x35
	.4byte	0x5d4
	.4byte	.LLST15
	.uleb128 0x3
	.4byte	.LASF122
	.2byte	0x1d6
	.byte	0x17
	.4byte	0x7d4
	.4byte	.LLST16
	.uleb128 0x3
	.4byte	.LASF123
	.2byte	0x1d7
	.byte	0x18
	.4byte	0x7d9
	.4byte	.LLST17
	.uleb128 0x11
	.4byte	.LVL104
	.4byte	0x6fc
	.4byte	0xd3f
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL106
	.4byte	0x67d
	.4byte	0xd53
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL109
	.4byte	0x6fc
	.4byte	0xd67
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL111
	.4byte	0x64b
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x2a
	.4byte	.LASF149
	.byte	0x1
	.byte	0xd8
	.byte	0x13
	.4byte	0x30b
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2b
	.4byte	.LASF110
	.byte	0x1
	.byte	0xd8
	.byte	0x33
	.4byte	0x5d4
	.4byte	.LLST10
	.uleb128 0x15
	.4byte	.LASF150
	.byte	0xda
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST11
	.uleb128 0x15
	.4byte	.LASF139
	.byte	0xdb
	.byte	0xc
	.4byte	0x95
	.4byte	.LLST12
	.uleb128 0x15
	.4byte	.LASF122
	.byte	0xdc
	.byte	0x17
	.4byte	0x7d4
	.4byte	.LLST13
	.uleb128 0x15
	.4byte	.LASF123
	.byte	0xdd
	.byte	0x18
	.4byte	0x7d9
	.4byte	.LLST14
	.uleb128 0x12
	.4byte	.LVL63
	.4byte	0x63e
	.uleb128 0x12
	.4byte	.LVL67
	.4byte	0x63e
	.uleb128 0x11
	.4byte	.LVL80
	.4byte	0x6c1
	.4byte	0xe00
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL81
	.4byte	0x6fc
	.4byte	0xe14
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL83
	.4byte	0x67d
	.4byte	0xe28
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL94
	.4byte	0x6fc
	.4byte	0xe3c
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL97
	.4byte	0x64b
	.uleb128 0x2
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
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
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
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 21
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x21
	.sleb128 0
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
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
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
.LLST8:
	.byte	0x6
	.4byte	.LVL51
	.byte	0x4
	.uleb128 .LVL51-.LVL51
	.uleb128 .LVL53-.LVL51
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL56-.LVL51
	.uleb128 .LVL57-.LVL51
	.uleb128 0x5
	.byte	0x73
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL58-.LVL51
	.uleb128 .LFE350-.LVL51
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL50
	.byte	0x4
	.uleb128 .LVL50-.LVL50
	.uleb128 .LVL52-.LVL50
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL52-.LVL50
	.uleb128 .LVL54-.LVL50
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL54-.LVL50
	.uleb128 .LVL55-.LVL50
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL55-.LVL50
	.uleb128 .LVL58-.LVL50
	.uleb128 0x2
	.byte	0x70
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL58-.LVL50
	.uleb128 .LFE350-.LVL50
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL20-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL20-.LVL19
	.uleb128 .LVL21-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL21-.LVL19
	.uleb128 .LVL22-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL22-.LVL19
	.uleb128 .LVL23-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL19
	.uleb128 .LVL24-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL24-.LVL19
	.uleb128 .LVL25-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL25-.LVL19
	.uleb128 .LVL26-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL26-.LVL19
	.uleb128 .LVL27-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL27-.LVL19
	.uleb128 .LVL28-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL28-.LVL19
	.uleb128 .LVL29-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL29-.LVL19
	.uleb128 .LVL30-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL30-.LVL19
	.uleb128 .LVL31-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL31-.LVL19
	.uleb128 .LVL32-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL32-.LVL19
	.uleb128 .LVL33-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL33-.LVL19
	.uleb128 .LVL34-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL34-.LVL19
	.uleb128 .LVL35-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL35-.LVL19
	.uleb128 .LVL36-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL36-.LVL19
	.uleb128 .LVL37-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL37-.LVL19
	.uleb128 .LVL38-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL38-.LVL19
	.uleb128 .LVL39-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL39-.LVL19
	.uleb128 .LVL40-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL40-.LVL19
	.uleb128 .LVL41-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL41-.LVL19
	.uleb128 .LVL42-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL42-.LVL19
	.uleb128 .LVL43-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL19
	.uleb128 .LVL44-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL44-.LVL19
	.uleb128 .LVL45-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL45-.LVL19
	.uleb128 .LVL46-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL46-.LVL19
	.uleb128 .LVL47-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL47-.LVL19
	.uleb128 .LVL48-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL48-.LVL19
	.uleb128 .LFE349-.LVL19
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL48-.LVL19
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL19
	.uleb128 .LFE349-.LVL19
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL12
	.byte	0x4
	.uleb128 .LVL12-.LVL12
	.uleb128 .LVL13-.LVL12
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL13-.LVL12
	.uleb128 .LVL14-.LVL12
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL12
	.uleb128 .LVL17-.LVL12
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL17-.LVL12
	.uleb128 .LVL18-.LVL12
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL18-.LVL12
	.uleb128 .LFE348-.LVL12
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL16-.LVL15
	.uleb128 0x5
	.byte	0x72
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL15
	.uleb128 .LFE348-.LVL15
	.uleb128 0x1e
	.byte	0x71
	.sleb128 0
	.byte	0xa8
	.uleb128 0x2d
	.byte	0xa8
	.uleb128 0x26
	.byte	0xa4
	.uleb128 0x26
	.byte	0x8
	.8byte	0xaaaaaaab
	.byte	0x1e
	.byte	0x8
	.byte	0x20
	.byte	0xa8
	.uleb128 0x26
	.byte	0x25
	.byte	0xa8
	.uleb128 0x2d
	.byte	0xa8
	.uleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x2
	.byte	0x74
	.sleb128 4
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL4-.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LVL6-.LVL0
	.uleb128 0x2
	.byte	0x74
	.sleb128 4
	.byte	0x4
	.uleb128 .LVL6-.LVL0
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
	.uleb128 .LVL10-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL10-.LVL0
	.uleb128 .LVL11-.LVL0
	.uleb128 0x2
	.byte	0x74
	.sleb128 4
	.byte	0x4
	.uleb128 .LVL11-.LVL0
	.uleb128 .LFE347-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL7-.LVL1
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL8-.LVL1
	.uleb128 .LFE347-.LVL1
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LLST51:
	.byte	0x6
	.4byte	.LVL238
	.byte	0x4
	.uleb128 .LVL238-.LVL238
	.uleb128 .LVL239-.LVL238
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL239-.LVL238
	.uleb128 .LFE346-.LVL238
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST50:
	.byte	0x6
	.4byte	.LVL236
	.byte	0x4
	.uleb128 .LVL236-.LVL236
	.uleb128 .LVL237-.LVL236
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL237-.LVL236
	.uleb128 .LFE345-.LVL236
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST48:
	.byte	0x6
	.4byte	.LVL228
	.byte	0x4
	.uleb128 .LVL228-.LVL228
	.uleb128 .LVL229-.LVL228
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL229-.LVL228
	.uleb128 .LVL232-.LVL228
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL232-.LVL228
	.uleb128 .LVL233-.LVL228
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL233-.LVL228
	.uleb128 .LVL234-.LVL228
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL234-.LVL228
	.uleb128 .LVL235-.LVL228
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL235-.LVL228
	.uleb128 .LFE344-.LVL228
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST49:
	.byte	0x6
	.4byte	.LVL228
	.byte	0x4
	.uleb128 .LVL228-.LVL228
	.uleb128 .LVL230-.LVL228
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL230-.LVL228
	.uleb128 .LVL231-.LVL228
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL231-.LVL228
	.uleb128 .LFE344-.LVL228
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST45:
	.byte	0x6
	.4byte	.LVL221
	.byte	0x4
	.uleb128 .LVL221-.LVL221
	.uleb128 .LVL222-.LVL221
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL222-.LVL221
	.uleb128 .LVL226-.LVL221
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL226-.LVL221
	.uleb128 .LVL227-.LVL221
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL227-.LVL221
	.uleb128 .LFE343-.LVL221
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST46:
	.byte	0x6
	.4byte	.LVL221
	.byte	0x4
	.uleb128 .LVL221-.LVL221
	.uleb128 .LVL224-.LVL221
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL224-.LVL221
	.uleb128 .LVL225-.LVL221
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL225-.LVL221
	.uleb128 .LFE343-.LVL221
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST47:
	.byte	0x6
	.4byte	.LVL221
	.byte	0x4
	.uleb128 .LVL221-.LVL221
	.uleb128 .LVL223-.LVL221
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL223-.LVL221
	.uleb128 .LVL225-.LVL221
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL225-.LVL221
	.uleb128 .LFE343-.LVL221
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST42:
	.byte	0x6
	.4byte	.LVL186
	.byte	0x4
	.uleb128 .LVL186-.LVL186
	.uleb128 .LVL191-.LVL186
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL191-.LVL186
	.uleb128 .LFE342-.LVL186
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST43:
	.byte	0x6
	.4byte	.LVL190
	.byte	0x4
	.uleb128 .LVL190-.LVL190
	.uleb128 .LVL193-1-.LVL190
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL194-.LVL190
	.uleb128 .LVL195-1-.LVL190
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL196-.LVL190
	.uleb128 .LVL197-1-.LVL190
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL198-.LVL190
	.uleb128 .LVL199-1-.LVL190
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL206-.LVL190
	.uleb128 .LVL207-1-.LVL190
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL208-.LVL190
	.uleb128 .LVL210-1-.LVL190
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL211-.LVL190
	.uleb128 .LVL212-1-.LVL190
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL213-.LVL190
	.uleb128 .LVL214-1-.LVL190
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL215-.LVL190
	.uleb128 .LVL217-1-.LVL190
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL218-.LVL190
	.uleb128 .LVL220-1-.LVL190
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST44:
	.byte	0x6
	.4byte	.LVL192
	.byte	0x4
	.uleb128 .LVL192-.LVL192
	.uleb128 .LVL193-1-.LVL192
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL206-.LVL192
	.uleb128 .LVL207-1-.LVL192
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL208-.LVL192
	.uleb128 .LVL209-.LVL192
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL211-.LVL192
	.uleb128 .LVL212-1-.LVL192
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL213-.LVL192
	.uleb128 .LVL214-1-.LVL192
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL215-.LVL192
	.uleb128 .LVL216-.LVL192
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL218-.LVL192
	.uleb128 .LVL219-.LVL192
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST35:
	.byte	0x6
	.4byte	.LVL161
	.byte	0x4
	.uleb128 .LVL161-.LVL161
	.uleb128 .LVL163-1-.LVL161
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL163-1-.LVL161
	.uleb128 .LFE341-.LVL161
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST36:
	.byte	0x6
	.4byte	.LVL161
	.byte	0x4
	.uleb128 .LVL161-.LVL161
	.uleb128 .LVL163-1-.LVL161
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL163-1-.LVL161
	.uleb128 .LFE341-.LVL161
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST37:
	.byte	0x6
	.4byte	.LVL161
	.byte	0x4
	.uleb128 .LVL161-.LVL161
	.uleb128 .LVL163-1-.LVL161
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL163-1-.LVL161
	.uleb128 .LFE341-.LVL161
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST38:
	.byte	0x6
	.4byte	.LVL166
	.byte	0x4
	.uleb128 .LVL166-.LVL166
	.uleb128 .LVL169-.LVL166
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL170-.LVL166
	.uleb128 .LVL173-.LVL166
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL176-.LVL166
	.uleb128 .LVL177-.LVL166
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL180-.LVL166
	.uleb128 .LVL184-.LVL166
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST39:
	.byte	0x6
	.4byte	.LVL163
	.byte	0x4
	.uleb128 .LVL163-.LVL163
	.uleb128 .LVL164-.LVL163
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL165-.LVL163
	.uleb128 .LVL174-.LVL163
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL174-.LVL163
	.uleb128 .LVL175-.LVL163
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL175-.LVL163
	.uleb128 .LVL178-.LVL163
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL178-.LVL163
	.uleb128 .LVL179-.LVL163
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL179-.LVL163
	.uleb128 .LVL181-.LVL163
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL181-.LVL163
	.uleb128 .LVL184-.LVL163
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL184-.LVL163
	.uleb128 .LVL185-.LVL163
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST40:
	.byte	0x6
	.4byte	.LVL167
	.byte	0x4
	.uleb128 .LVL167-.LVL167
	.uleb128 .LVL169-.LVL167
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL171-.LVL167
	.uleb128 .LVL173-.LVL167
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL181-.LVL167
	.uleb128 .LVL184-.LVL167
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST41:
	.byte	0x6
	.4byte	.LVL168
	.byte	0x4
	.uleb128 .LVL168-.LVL168
	.uleb128 .LVL169-.LVL168
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL172-.LVL168
	.uleb128 .LVL173-.LVL168
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL181-.LVL168
	.uleb128 .LVL184-.LVL168
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST33:
	.byte	0x6
	.4byte	.LVL149
	.byte	0x4
	.uleb128 .LVL149-.LVL149
	.uleb128 .LVL150-.LVL149
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL150-.LVL149
	.uleb128 .LVL151-.LVL149
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL151-.LVL149
	.uleb128 .LVL152-.LVL149
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL152-.LVL149
	.uleb128 .LVL153-.LVL149
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL153-.LVL149
	.uleb128 .LVL154-.LVL149
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL154-.LVL149
	.uleb128 .LVL157-1-.LVL149
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL157-1-.LVL149
	.uleb128 .LVL158-.LVL149
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL158-.LVL149
	.uleb128 .LVL159-.LVL149
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL159-.LVL149
	.uleb128 .LVL160-.LVL149
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL160-.LVL149
	.uleb128 .LFE340-.LVL149
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST34:
	.byte	0x8
	.4byte	.LVL155
	.uleb128 .LVL156-.LVL155
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST28:
	.byte	0x6
	.4byte	.LVL134
	.byte	0x4
	.uleb128 .LVL134-.LVL134
	.uleb128 .LVL135-1-.LVL134
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL135-1-.LVL134
	.uleb128 .LFE339-.LVL134
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST29:
	.byte	0x8
	.4byte	.LVL145
	.uleb128 .LVL146-.LVL145
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST30:
	.byte	0x8
	.4byte	.LVL143
	.uleb128 .LVL144-.LVL143
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST31:
	.byte	0x6
	.4byte	.LVL138
	.byte	0x4
	.uleb128 .LVL138-.LVL138
	.uleb128 .LVL139-.LVL138
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL140-.LVL138
	.uleb128 .LVL147-.LVL138
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST32:
	.byte	0x6
	.4byte	.LVL135
	.byte	0x4
	.uleb128 .LVL135-.LVL135
	.uleb128 .LVL136-.LVL135
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL137-.LVL135
	.uleb128 .LVL141-.LVL135
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL141-.LVL135
	.uleb128 .LVL147-.LVL135
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL147-.LVL135
	.uleb128 .LVL148-.LVL135
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST23:
	.byte	0x6
	.4byte	.LVL124
	.byte	0x4
	.uleb128 .LVL124-.LVL124
	.uleb128 .LVL125-.LVL124
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL125-.LVL124
	.uleb128 .LVL131-.LVL124
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL131-.LVL124
	.uleb128 .LVL132-.LVL124
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL132-.LVL124
	.uleb128 .LVL133-.LVL124
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL133-.LVL124
	.uleb128 .LFE338-.LVL124
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST24:
	.byte	0x6
	.4byte	.LVL124
	.byte	0x4
	.uleb128 .LVL124-.LVL124
	.uleb128 .LVL128-.LVL124
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL128-.LVL124
	.uleb128 .LVL129-.LVL124
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL124
	.uleb128 .LVL130-1-.LVL124
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL130-1-.LVL124
	.uleb128 .LVL131-.LVL124
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL131-.LVL124
	.uleb128 .LFE338-.LVL124
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST25:
	.byte	0x6
	.4byte	.LVL124
	.byte	0x4
	.uleb128 .LVL124-.LVL124
	.uleb128 .LVL128-.LVL124
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL128-.LVL124
	.uleb128 .LVL129-.LVL124
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL124
	.uleb128 .LVL130-1-.LVL124
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL130-1-.LVL124
	.uleb128 .LVL131-.LVL124
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL131-.LVL124
	.uleb128 .LFE338-.LVL124
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST26:
	.byte	0x6
	.4byte	.LVL124
	.byte	0x4
	.uleb128 .LVL124-.LVL124
	.uleb128 .LVL126-.LVL124
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL126-.LVL124
	.uleb128 .LVL129-.LVL124
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL124
	.uleb128 .LVL130-1-.LVL124
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL130-1-.LVL124
	.uleb128 .LVL131-.LVL124
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL131-.LVL124
	.uleb128 .LFE338-.LVL124
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST27:
	.byte	0x6
	.4byte	.LVL124
	.byte	0x4
	.uleb128 .LVL124-.LVL124
	.uleb128 .LVL127-.LVL124
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL127-.LVL124
	.uleb128 .LVL128-.LVL124
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL129-.LVL124
	.uleb128 .LVL132-.LVL124
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL133-.LVL124
	.uleb128 .LFE338-.LVL124
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST18:
	.byte	0x6
	.4byte	.LVL114
	.byte	0x4
	.uleb128 .LVL114-.LVL114
	.uleb128 .LVL115-.LVL114
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL115-.LVL114
	.uleb128 .LVL121-.LVL114
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL121-.LVL114
	.uleb128 .LVL122-.LVL114
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL122-.LVL114
	.uleb128 .LVL123-.LVL114
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL123-.LVL114
	.uleb128 .LFE337-.LVL114
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL114
	.byte	0x4
	.uleb128 .LVL114-.LVL114
	.uleb128 .LVL118-.LVL114
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL118-.LVL114
	.uleb128 .LVL119-.LVL114
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL119-.LVL114
	.uleb128 .LVL120-1-.LVL114
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL120-1-.LVL114
	.uleb128 .LVL121-.LVL114
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL121-.LVL114
	.uleb128 .LFE337-.LVL114
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST20:
	.byte	0x6
	.4byte	.LVL114
	.byte	0x4
	.uleb128 .LVL114-.LVL114
	.uleb128 .LVL118-.LVL114
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL118-.LVL114
	.uleb128 .LVL119-.LVL114
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL119-.LVL114
	.uleb128 .LVL120-1-.LVL114
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL120-1-.LVL114
	.uleb128 .LVL121-.LVL114
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL121-.LVL114
	.uleb128 .LFE337-.LVL114
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST21:
	.byte	0x6
	.4byte	.LVL114
	.byte	0x4
	.uleb128 .LVL114-.LVL114
	.uleb128 .LVL116-.LVL114
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL116-.LVL114
	.uleb128 .LVL119-.LVL114
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL119-.LVL114
	.uleb128 .LVL120-1-.LVL114
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL120-1-.LVL114
	.uleb128 .LVL121-.LVL114
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL121-.LVL114
	.uleb128 .LFE337-.LVL114
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST22:
	.byte	0x6
	.4byte	.LVL114
	.byte	0x4
	.uleb128 .LVL114-.LVL114
	.uleb128 .LVL117-.LVL114
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL117-.LVL114
	.uleb128 .LVL118-.LVL114
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL119-.LVL114
	.uleb128 .LVL122-.LVL114
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL123-.LVL114
	.uleb128 .LFE337-.LVL114
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x6
	.4byte	.LVL100
	.byte	0x4
	.uleb128 .LVL100-.LVL100
	.uleb128 .LVL101-.LVL100
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL101-.LVL100
	.uleb128 .LVL102-.LVL100
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL102-.LVL100
	.uleb128 .LVL103-.LVL100
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL103-.LVL100
	.uleb128 .LVL107-.LVL100
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL107-.LVL100
	.uleb128 .LVL108-.LVL100
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL108-.LVL100
	.uleb128 .LVL112-.LVL100
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL112-.LVL100
	.uleb128 .LVL113-.LVL100
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL113-.LVL100
	.uleb128 .LFE336-.LVL100
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST16:
	.byte	0x8
	.4byte	.LVL104
	.uleb128 .LVL105-.LVL104
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST17:
	.byte	0x8
	.4byte	.LVL109
	.uleb128 .LVL110-.LVL109
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL62
	.byte	0x4
	.uleb128 .LVL62-.LVL62
	.uleb128 .LVL63-1-.LVL62
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL63-1-.LVL62
	.uleb128 .LVL69-.LVL62
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL69-.LVL62
	.uleb128 .LVL70-.LVL62
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL70-.LVL62
	.uleb128 .LFE335-.LVL62
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL71
	.byte	0x4
	.uleb128 .LVL71-.LVL71
	.uleb128 .LVL72-.LVL71
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL72-.LVL71
	.uleb128 .LVL73-.LVL71
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL73-.LVL71
	.uleb128 .LVL76-.LVL71
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL76-.LVL71
	.uleb128 .LVL82-.LVL71
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL84-.LVL71
	.uleb128 .LVL86-.LVL71
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL86-.LVL71
	.uleb128 .LVL87-.LVL71
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL88-.LVL71
	.uleb128 .LVL89-.LVL71
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL89-.LVL71
	.uleb128 .LVL91-.LVL71
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL91-.LVL71
	.uleb128 .LVL92-.LVL71
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL92-.LVL71
	.uleb128 .LVL93-.LVL71
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL95-.LVL71
	.uleb128 .LVL96-.LVL71
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST12:
	.byte	0x6
	.4byte	.LVL63
	.byte	0x4
	.uleb128 .LVL63-.LVL63
	.uleb128 .LVL64-.LVL63
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL64-.LVL63
	.uleb128 .LVL65-.LVL63
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL65-.LVL63
	.uleb128 .LVL66-.LVL63
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL66-.LVL63
	.uleb128 .LVL68-.LVL63
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL70-.LVL63
	.uleb128 .LVL74-.LVL63
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL84-.LVL63
	.uleb128 .LVL86-.LVL63
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL87-.LVL63
	.uleb128 .LVL90-.LVL63
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL90-.LVL63
	.uleb128 .LVL95-.LVL63
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL95-.LVL63
	.uleb128 .LVL96-.LVL63
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL98-.LVL63
	.uleb128 .LVL99-.LVL63
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST13:
	.byte	0x8
	.4byte	.LVL81
	.uleb128 .LVL82-.LVL81
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST14:
	.byte	0x8
	.4byte	.LVL94
	.uleb128 .LVL95-.LVL94
	.uleb128 0x1
	.byte	0x50
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
.LLRL4:
	.byte	0x5
	.4byte	.LBB2
	.byte	0x4
	.uleb128 .LBB2-.LBB2
	.uleb128 .LBE2-.LBB2
	.byte	0x4
	.uleb128 .LBB3-.LBB2
	.uleb128 .LBE3-.LBB2
	.byte	0
.LLRL52:
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
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF148:
	.ascii	"HAL_DMA_IRQHandler\000"
.LASF133:
	.ascii	"count\000"
.LASF61:
	.ascii	"FIFOMode\000"
.LASF119:
	.ascii	"SrcAddress\000"
.LASF26:
	.ascii	"M0AR\000"
.LASF102:
	.ascii	"DMAmuxRequestGenStatusMask\000"
.LASF112:
	.ascii	"stream_number\000"
.LASF65:
	.ascii	"DMA_InitTypeDef\000"
.LASF21:
	.ascii	"APB2FZ1\000"
.LASF7:
	.ascii	"__uint8_t\000"
.LASF98:
	.ascii	"DMAmuxChannelStatus\000"
.LASF47:
	.ascii	"HAL_BUSY\000"
.LASF115:
	.ascii	"DMA_CheckFifoParam\000"
.LASF109:
	.ascii	"DMA_CalcDMAMUXChannelBaseAndMask\000"
.LASF0:
	.ascii	"long long unsigned int\000"
.LASF13:
	.ascii	"IDCODE\000"
.LASF132:
	.ascii	"ccr_reg\000"
.LASF77:
	.ascii	"HAL_DMA_XFER_M1CPLT_CB_ID\000"
.LASF31:
	.ascii	"CM0AR\000"
.LASF122:
	.ascii	"regs_dma\000"
.LASF108:
	.ascii	"DMA_CalcDMAMUXRequestGenBaseAndMask\000"
.LASF147:
	.ascii	"HAL_DMA_DeInit\000"
.LASF125:
	.ascii	"HAL_DMA_GetState\000"
.LASF10:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF81:
	.ascii	"HAL_DMA_XFER_ALL_CB_ID\000"
.LASF127:
	.ascii	"CallbackID\000"
.LASF124:
	.ascii	"HAL_DMA_GetError\000"
.LASF89:
	.ascii	"XferHalfCpltCallback\000"
.LASF104:
	.ascii	"Reserved0\000"
.LASF145:
	.ascii	"HAL_DMA_Start_IT\000"
.LASF120:
	.ascii	"DstAddress\000"
.LASF90:
	.ascii	"XferM1CpltCallback\000"
.LASF52:
	.ascii	"HAL_LockTypeDef\000"
.LASF35:
	.ascii	"DMAMUX_ChannelStatus_TypeDef\000"
.LASF6:
	.ascii	"long int\000"
.LASF55:
	.ascii	"PeriphInc\000"
.LASF63:
	.ascii	"MemBurst\000"
.LASF76:
	.ascii	"HAL_DMA_XFER_HALFCPLT_CB_ID\000"
.LASF73:
	.ascii	"HAL_DMA_HALF_TRANSFER\000"
.LASF69:
	.ascii	"HAL_DMA_STATE_ERROR\000"
.LASF44:
	.ascii	"double\000"
.LASF152:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build"
	.ascii	"-debug/_deps/stm32h7xx_hal_driver-src/Src/stm32h7xx"
	.ascii	"_hal_dma.c\000"
.LASF95:
	.ascii	"StreamBaseAddress\000"
.LASF87:
	.ascii	"Parent\000"
.LASF85:
	.ascii	"Lock\000"
.LASF53:
	.ascii	"Request\000"
.LASF74:
	.ascii	"HAL_DMA_LevelCompleteTypeDef\000"
.LASF137:
	.ascii	"Timeout\000"
.LASF54:
	.ascii	"Direction\000"
.LASF82:
	.ascii	"HAL_DMA_CallbackIDTypeDef\000"
.LASF100:
	.ascii	"DMAmuxRequestGen\000"
.LASF146:
	.ascii	"HAL_DMA_Start\000"
.LASF48:
	.ascii	"HAL_TIMEOUT\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF66:
	.ascii	"HAL_DMA_STATE_RESET\000"
.LASF149:
	.ascii	"HAL_DMA_Init\000"
.LASF154:
	.ascii	"SystemCoreClock\000"
.LASF107:
	.ascii	"BDMA_Base_Registers\000"
.LASF97:
	.ascii	"DMAmuxChannel\000"
.LASF75:
	.ascii	"HAL_DMA_XFER_CPLT_CB_ID\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF142:
	.ascii	"HAL_DMA_Abort_IT\000"
.LASF96:
	.ascii	"StreamIndex\000"
.LASF45:
	.ascii	"HAL_OK\000"
.LASF113:
	.ascii	"stream_baseaddress\000"
.LASF135:
	.ascii	"HAL_DMA_PollForTransfer\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF123:
	.ascii	"regs_bdma\000"
.LASF151:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF70:
	.ascii	"HAL_DMA_STATE_ABORT\000"
.LASF94:
	.ascii	"ErrorCode\000"
.LASF58:
	.ascii	"MemDataAlignment\000"
.LASF39:
	.ascii	"RGCFR\000"
.LASF49:
	.ascii	"HAL_StatusTypeDef\000"
.LASF143:
	.ascii	"HAL_DMA_Abort\000"
.LASF2:
	.ascii	"short int\000"
.LASF67:
	.ascii	"HAL_DMA_STATE_READY\000"
.LASF84:
	.ascii	"Init\000"
.LASF138:
	.ascii	"cpltlevel_mask\000"
.LASF30:
	.ascii	"CPAR\000"
.LASF156:
	.ascii	"HAL_GetTick\000"
.LASF116:
	.ascii	"DMA_CalcBaseAndBitshift\000"
.LASF51:
	.ascii	"HAL_LOCKED\000"
.LASF72:
	.ascii	"HAL_DMA_FULL_TRANSFER\000"
.LASF103:
	.ascii	"DMA_HandleTypeDef\000"
.LASF92:
	.ascii	"XferErrorCallback\000"
.LASF37:
	.ascii	"DMAMUX_RequestGen_TypeDef\000"
.LASF36:
	.ascii	"RGCR\000"
.LASF43:
	.ascii	"float\000"
.LASF128:
	.ascii	"HAL_DMA_RegisterCallback\000"
.LASF83:
	.ascii	"Instance\000"
.LASF14:
	.ascii	"RESERVED4\000"
.LASF16:
	.ascii	"RESERVED5\000"
.LASF18:
	.ascii	"RESERVED6\000"
.LASF20:
	.ascii	"RESERVED7\000"
.LASF22:
	.ascii	"RESERVED8\000"
.LASF91:
	.ascii	"XferM1HalfCpltCallback\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF121:
	.ascii	"DataLength\000"
.LASF136:
	.ascii	"CompleteLevel\000"
.LASF71:
	.ascii	"HAL_DMA_StateTypeDef\000"
.LASF101:
	.ascii	"DMAmuxRequestGenStatus\000"
.LASF68:
	.ascii	"HAL_DMA_STATE_BUSY\000"
.LASF139:
	.ascii	"tickstart\000"
.LASF56:
	.ascii	"MemInc\000"
.LASF38:
	.ascii	"RGSR\000"
.LASF118:
	.ascii	"DMA_SetConfig\000"
.LASF110:
	.ascii	"hdma\000"
.LASF24:
	.ascii	"DBGMCU_TypeDef\000"
.LASF155:
	.ascii	"__DMA_HandleTypeDef\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF79:
	.ascii	"HAL_DMA_XFER_ERROR_CB_ID\000"
.LASF46:
	.ascii	"HAL_ERROR\000"
.LASF129:
	.ascii	"pCallback\000"
.LASF19:
	.ascii	"APB1HFZ1\000"
.LASF33:
	.ascii	"BDMA_Channel_TypeDef\000"
.LASF41:
	.ascii	"long double\000"
.LASF62:
	.ascii	"FIFOThreshold\000"
.LASF42:
	.ascii	"char\000"
.LASF126:
	.ascii	"HAL_DMA_UnRegisterCallback\000"
.LASF141:
	.ascii	"ifcr_reg\000"
.LASF86:
	.ascii	"State\000"
.LASF59:
	.ascii	"Mode\000"
.LASF78:
	.ascii	"HAL_DMA_XFER_M1HALFCPLT_CB_ID\000"
.LASF8:
	.ascii	"__uint32_t\000"
.LASF80:
	.ascii	"HAL_DMA_XFER_ABORT_CB_ID\000"
.LASF25:
	.ascii	"NDTR\000"
.LASF28:
	.ascii	"DMA_Stream_TypeDef\000"
.LASF23:
	.ascii	"APB4FZ1\000"
.LASF111:
	.ascii	"request\000"
.LASF27:
	.ascii	"M1AR\000"
.LASF57:
	.ascii	"PeriphDataAlignment\000"
.LASF99:
	.ascii	"DMAmuxChannelStatusMask\000"
.LASF34:
	.ascii	"DMAMUX_Channel_TypeDef\000"
.LASF131:
	.ascii	"tmpisr_bdma\000"
.LASF114:
	.ascii	"status\000"
.LASF150:
	.ascii	"registerValue\000"
.LASF29:
	.ascii	"CNDTR\000"
.LASF60:
	.ascii	"Priority\000"
.LASF11:
	.ascii	"uint8_t\000"
.LASF17:
	.ascii	"APB1LFZ1\000"
.LASF117:
	.ascii	"flagBitshiftOffset\000"
.LASF144:
	.ascii	"enableRegister\000"
.LASF153:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF32:
	.ascii	"CM1AR\000"
.LASF15:
	.ascii	"APB3FZ1\000"
.LASF130:
	.ascii	"tmpisr_dma\000"
.LASF105:
	.ascii	"IFCR\000"
.LASF106:
	.ascii	"DMA_Base_Registers\000"
.LASF50:
	.ascii	"HAL_UNLOCKED\000"
.LASF140:
	.ascii	"isr_reg\000"
.LASF134:
	.ascii	"timeout\000"
.LASF93:
	.ascii	"XferAbortCallback\000"
.LASF40:
	.ascii	"DMAMUX_RequestGenStatus_TypeDef\000"
.LASF88:
	.ascii	"XferCpltCallback\000"
.LASF64:
	.ascii	"PeriphBurst\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
