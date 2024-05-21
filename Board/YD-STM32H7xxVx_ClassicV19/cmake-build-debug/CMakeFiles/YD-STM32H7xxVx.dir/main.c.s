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
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/main.c"
	.section	.rodata.BootThreadEntry.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"worker1\000"
	.align	2
.LC1:
	.ascii	"worker1 ready! \015\012\000"
	.align	2
.LC2:
	.ascii	"worker2\000"
	.align	2
.LC3:
	.ascii	"worker2 ready! \015\012\000"
	.align	2
.LC4:
	.ascii	"[Boot] count=%d tick:%lu\015\012\000"
	.section	.text.BootThreadEntry,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	BootThreadEntry, %function
BootThreadEntry:
.LFB384:
	.loc 1 46 37
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 20
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 40
	.loc 1 47 5
	ldr	r5, .L4
	ldr	r4, .L4+4
	movs	r3, #5
	str	r3, [sp, #12]
	movs	r7, #20
	str	r7, [sp, #8]
	mov	r6, #2048
	str	r6, [sp, #4]
	ldr	r3, .L4+8
	str	r3, [sp]
	movs	r3, #1
	mov	r2, r5
	ldr	r1, .L4+12
	mov	r0, r4
.LVL1:
	bl	os_thread_init
.LVL2:
	.loc 1 50 5
	mov	r0, r4
	bl	os_thread_startup
.LVL3:
	.loc 1 51 5
	ldr	r0, .L4+16
	bl	BSP_USART1_Printf
.LVL4:
	.loc 1 53 5
	ldr	r4, .L4+20
	movs	r3, #10
	str	r3, [sp, #12]
	str	r7, [sp, #8]
	str	r6, [sp, #4]
	ldr	r3, .L4+24
	str	r3, [sp]
	movs	r3, #2
	mov	r2, r5
	ldr	r1, .L4+28
	mov	r0, r4
	bl	os_thread_init
.LVL5:
	.loc 1 56 5
	mov	r0, r4
	bl	os_thread_startup
.LVL6:
	.loc 1 57 5
	ldr	r0, .L4+32
	bl	BSP_USART1_Printf
.LVL7:
	.loc 1 59 5
	.loc 1 59 9 is_stmt 0
	movs	r4, #0
.LVL8:
.L2:
	.loc 1 60 5 is_stmt 1 discriminator 1
	.loc 1 61 9 discriminator 1
	adds	r5, r4, #1
.LVL9:
	bl	os_scheduler_get_current_tick
.LVL10:
	mov	r2, r0
	mov	r1, r4
	ldr	r0, .L4+36
	bl	BSP_USART1_Printf
.LVL11:
	.loc 1 66 9 discriminator 1
	mov	r0, #1000
	bl	os_thread_mdelay
.LVL12:
	.loc 1 60 10 discriminator 1
	.loc 1 61 9 is_stmt 0 discriminator 1
	mov	r4, r5
	b	.L2
.L5:
	.align	2
.L4:
	.word	worker_thread_entry
	.word	worker1
	.word	worker1_thread_stack
	.word	.LC0
	.word	.LC1
	.word	worker2
	.word	worker2_thread_stack
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.cfi_endproc
.LFE384:
	.size	BootThreadEntry, .-BootThreadEntry
	.section	.rodata.worker_thread_entry.str1.4,"aMS",%progbits,1
	.align	2
.LC5:
	.ascii	"Worker[%s] ... \015\012\000"
	.align	2
.LC6:
	.ascii	"[%s] %ld remain:%ld, tick:%ld\015\012\000"
	.section	.text.worker_thread_entry,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	worker_thread_entry, %function
worker_thread_entry:
.LFB383:
	.loc 1 16 41 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL13:
	push	{r4, r5, r6, r7, r8, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 32
	mov	r6, r0
	.loc 1 17 5
	.loc 1 17 46 is_stmt 0
	bl	os_thread_self
.LVL14:
	.loc 1 17 5
	adds	r1, r0, #4
	ldr	r0, .L12
	bl	BSP_USART1_Printf
.LVL15:
	.loc 1 18 5 is_stmt 1
	.loc 1 19 5
	.loc 1 19 15 is_stmt 0
	movs	r5, #0
	b	.L10
.LVL16:
.L7:
	.loc 1 23 17 is_stmt 1
	bl	BSP_LED3_Toggle
.LVL17:
	.loc 1 24 17
.L9:
	.loc 1 33 9
	.loc 1 33 64 is_stmt 0
	bl	os_thread_self
.LVL18:
	.loc 1 33 80
	adds	r4, r0, #4
	.loc 1 33 9
	adds	r7, r5, #1
.LVL19:
	.loc 1 33 98
	bl	os_thread_self
.LVL20:
	.loc 1 33 9
	ldr	r8, [r0, #84]
	bl	os_scheduler_get_current_tick
.LVL21:
	str	r0, [sp]
	mov	r3, r8
	mov	r2, r5
	mov	r1, r4
	ldr	r0, .L12+4
	bl	BSP_USART1_Printf
.LVL22:
	.loc 1 35 9 is_stmt 1
	bl	os_thread_yield
.LVL23:
	.loc 1 20 10
	.loc 1 33 9 is_stmt 0
	mov	r5, r7
.LVL24:
.L10:
	.loc 1 20 5 is_stmt 1
	.loc 1 21 9
	cmp	r6, #1
	beq	.L7
	cmp	r6, #2
	bne	.L9
	.loc 1 27 17
	bl	BSP_LED5_Toggle
.LVL25:
	.loc 1 28 17
	b	.L9
.L13:
	.align	2
.L12:
	.word	.LC5
	.word	.LC6
	.cfi_endproc
.LFE383:
	.size	worker_thread_entry, .-worker_thread_entry
	.section	.rodata.main.str1.4,"aMS",%progbits,1
	.align	2
.LC7:
	.ascii	"SystemCoreClock: %d\015\012\000"
	.align	2
.LC8:
	.ascii	"HAL_RCC_GetPCLK1Freq: %d\015\012\000"
	.align	2
.LC9:
	.ascii	"Boot\000"
	.align	2
.LC10:
	.ascii	"kernel startup: %d\015\012\000"
	.align	2
.LC11:
	.ascii	"Hello, %d\015\012\000"
	.section	.text.main,"ax",%progbits
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
.LFB386:
	.loc 1 79 15
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	.loc 1 80 5
	bl	Board_Init
.LVL26:
	.loc 1 81 5
	ldr	r3, .L18
	ldr	r1, [r3]
	ldr	r0, .L18+4
	bl	BSP_USART1_Printf
.LVL27:
	.loc 1 82 5
	bl	HAL_RCC_GetPCLK1Freq
.LVL28:
	mov	r1, r0
	ldr	r0, .L18+8
	bl	BSP_USART1_Printf
.LVL29:
	.loc 1 90 5
	mov	r0, #500
	bl	os_tick_from_millisecond
.LVL30:
	ldr	r4, .L18+12
	str	r0, [sp, #12]
	movs	r3, #20
	str	r3, [sp, #8]
	mov	r3, #1024
	str	r3, [sp, #4]
	ldr	r3, .L18+16
	str	r3, [sp]
	movs	r3, #0
	ldr	r2, .L18+20
	ldr	r1, .L18+24
	mov	r0, r4
	bl	os_thread_init
.LVL31:
	.loc 1 92 5
	mov	r0, r4
	bl	os_thread_startup
.LVL32:
	.loc 1 94 5
	.loc 1 94 20 is_stmt 0
	bl	os_kernel_startup
.LVL33:
	mov	r1, r0
.LVL34:
	.loc 1 95 5 is_stmt 1
	ldr	r0, .L18+28
.LVL35:
	bl	BSP_USART1_Printf
.LVL36:
	.loc 1 98 5
	.loc 1 98 9 is_stmt 0
	movs	r4, #0
.LVL37:
.L15:
	.loc 1 100 5 is_stmt 1
	.loc 1 103 9
	mov	r1, r4
	adds	r4, r4, #1
.LVL38:
	ldr	r0, .L18+32
	bl	BSP_USART1_Printf
.LVL39:
	.loc 1 104 9
	mov	r0, #1000
	bl	BSP_TIMDelay_Ms
.LVL40:
	.loc 1 105 9
	.loc 1 105 11 is_stmt 0
	cmp	r4, #10
	bne	.L15
	.loc 1 106 13 is_stmt 1
.LBB12:
.LBB13:
	.file 2 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
	.loc 2 524 5
.LBB14:
.LBB15:
	.loc 2 346 5
	.syntax unified
@ 346 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE15:
.LBE14:
	.loc 2 526 5
	.loc 2 527 40 is_stmt 0
	mov	r1, #-536813568
	ldr	r2, [r1, #3340]
	.loc 2 527 113
	and	r2, r2, #1792
	.loc 2 526 81
	ldr	r3, .L18+36
	orrs	r3, r3, r2
	.loc 2 526 79
	str	r3, [r1, #3340]
	.loc 2 529 5 is_stmt 1
.LBB16:
.LBB17:
	.loc 2 346 5
	.syntax unified
@ 346 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.L16:
.LBE17:
.LBE16:
	.loc 2 531 5
	.loc 2 533 9
	.syntax unified
@ 533 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	nop
@ 0 "" 2
	.loc 2 531 5
	.thumb
	.syntax unified
	b	.L16
.L19:
	.align	2
.L18:
	.word	SystemCoreClock
	.word	.LC7
	.word	.LC8
	.word	BootThread
	.word	BootThreadStack
	.word	BootThreadEntry
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	100270084
.LBE13:
.LBE12:
	.cfi_endproc
.LFE386:
	.size	main, .-main
	.section	.bss.BootThread,"aw",%nobits
	.align	2
	.type	BootThread, %object
	.size	BootThread, 100
BootThread:
	.space	100
	.section	.bss.BootThreadStack,"aw",%nobits
	.align	2
	.type	BootThreadStack, %object
	.size	BootThreadStack, 1024
BootThreadStack:
	.space	1024
	.section	.bss.worker2,"aw",%nobits
	.align	2
	.type	worker2, %object
	.size	worker2, 100
worker2:
	.space	100
	.section	.bss.worker2_thread_stack,"aw",%nobits
	.align	2
	.type	worker2_thread_stack, %object
	.size	worker2_thread_stack, 2048
worker2_thread_stack:
	.space	2048
	.section	.bss.worker1,"aw",%nobits
	.align	2
	.type	worker1, %object
	.size	worker1, 100
worker1:
	.space	100
	.section	.bss.worker1_thread_stack,"aw",%nobits
	.align	2
	.type	worker1_thread_stack, %object
	.size	worker1_thread_stack, 2048
worker1_thread_stack:
	.space	2048
	.text
.Letext0:
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 4 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 5 "D:/RTOS/Kernel/os_types.h"
	.file 6 "D:/RTOS/Kernel/os_errors.h"
	.file 7 "D:/RTOS/Kernel/os_list.h"
	.file 8 "D:/RTOS/Kernel/os_priority.h"
	.file 9 "D:/RTOS/Kernel/os_tick.h"
	.file 10 "D:/RTOS/Kernel/os_timer.h"
	.file 11 "D:/RTOS/Kernel/os_thread.h"
	.file 12 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_cmsis_device-src/Include/system_stm32h7xx.h"
	.file 13 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/BSP/bsp_led5.h"
	.file 14 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/BSP/bsp_led3.h"
	.file 15 "D:/RTOS/Kernel/os_scheduler.h"
	.file 16 "D:/RTOS/Kernel/os_kernel.h"
	.file 17 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/cmake-build-debug/_deps/stm32h7xx_hal_driver-src/Inc/stm32h7xx_hal_rcc.h"
	.file 18 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdio.h"
	.file 19 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/board.h"
	.file 20 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/BSP/bsp_timdelay.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x820
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x18
	.4byte	.LASF81
	.byte	0x1d
	.4byte	.LASF82
	.4byte	.LASF83
	.4byte	.LLRL6
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF0
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x3
	.byte	0x2b
	.byte	0x17
	.4byte	0x40
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x3
	.byte	0x4d
	.byte	0x12
	.4byte	0x5a
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x6d
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x19
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x34
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x4
	.byte	0x2c
	.byte	0x13
	.4byte	0x4e
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x61
	.uleb128 0x1a
	.4byte	0xa8
	.uleb128 0x1b
	.4byte	.LASF56
	.byte	0xc
	.byte	0x39
	.byte	0x11
	.4byte	0xa8
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x1c
	.byte	0x4
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.uleb128 0x1d
	.4byte	0xce
	.uleb128 0x8
	.4byte	0xd5
	.uleb128 0xb
	.4byte	0xce
	.4byte	0xef
	.uleb128 0x1e
	.4byte	0x89
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.4byte	.LASF17
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF18
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x5
	.byte	0x51
	.byte	0x11
	.4byte	0x9c
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x5
	.byte	0x52
	.byte	0x12
	.4byte	0xa8
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x5
	.byte	0x6b
	.byte	0x13
	.4byte	0x109
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x6
	.byte	0xc
	.byte	0x12
	.4byte	0xfd
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x7
	.byte	0x6
	.byte	0x1f
	.4byte	0x139
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x8
	.byte	0x7
	.byte	0x9
	.4byte	0x160
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x7
	.byte	0xa
	.byte	0x16
	.4byte	0x160
	.byte	0
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0x7
	.byte	0xb
	.byte	0x16
	.4byte	0x160
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.4byte	0x12d
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x8
	.byte	0xd
	.byte	0x12
	.4byte	0xfd
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x9
	.byte	0x10
	.byte	0x13
	.4byte	0x109
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0xa
	.byte	0x1f
	.byte	0x1b
	.4byte	0x189
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x1c
	.byte	0xa
	.byte	0x23
	.4byte	0x1e4
	.uleb128 0x2
	.4byte	.LASF31
	.byte	0xa
	.byte	0x24
	.byte	0x14
	.4byte	0x12d
	.byte	0
	.uleb128 0x2
	.4byte	.LASF32
	.byte	0xa
	.byte	0x25
	.byte	0x18
	.4byte	0x1e4
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF33
	.byte	0xa
	.byte	0x26
	.byte	0xb
	.4byte	0xcc
	.byte	0xc
	.uleb128 0x2
	.4byte	.LASF34
	.byte	0xa
	.byte	0x27
	.byte	0xf
	.4byte	0x171
	.byte	0x10
	.uleb128 0x2
	.4byte	.LASF35
	.byte	0xa
	.byte	0x28
	.byte	0xf
	.4byte	0x171
	.byte	0x14
	.uleb128 0x2
	.4byte	.LASF36
	.byte	0xa
	.byte	0x29
	.byte	0x9
	.4byte	0x82
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.4byte	.LASF37
	.byte	0xa
	.byte	0x21
	.byte	0x10
	.4byte	0x1f0
	.uleb128 0x8
	.4byte	0x1f5
	.uleb128 0xd
	.4byte	0x205
	.uleb128 0x4
	.4byte	0x205
	.uleb128 0x4
	.4byte	0xcc
	.byte	0
	.uleb128 0x8
	.4byte	0x17d
	.uleb128 0x3
	.4byte	.LASF38
	.byte	0xb
	.byte	0x20
	.byte	0x1c
	.4byte	0x216
	.uleb128 0xc
	.4byte	.LASF39
	.byte	0x64
	.byte	0xb
	.byte	0x24
	.4byte	0x2f2
	.uleb128 0x1f
	.ascii	"sp\000"
	.byte	0xb
	.byte	0x25
	.byte	0xb
	.4byte	0xcc
	.byte	0
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0xb
	.byte	0x26
	.byte	0xa
	.4byte	0xdf
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF41
	.byte	0xb
	.byte	0x27
	.byte	0x17
	.4byte	0x2f2
	.byte	0xc
	.uleb128 0x2
	.4byte	.LASF42
	.byte	0xb
	.byte	0x28
	.byte	0xb
	.4byte	0xcc
	.byte	0x10
	.uleb128 0x2
	.4byte	.LASF43
	.byte	0xb
	.byte	0x29
	.byte	0xb
	.4byte	0xcc
	.byte	0x14
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0xb
	.byte	0x2a
	.byte	0xf
	.4byte	0x115
	.byte	0x18
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0xb
	.byte	0x2b
	.byte	0x14
	.4byte	0x12d
	.byte	0x1c
	.uleb128 0x2
	.4byte	.LASF31
	.byte	0xb
	.byte	0x2c
	.byte	0x14
	.4byte	0x12d
	.byte	0x24
	.uleb128 0x2
	.4byte	.LASF46
	.byte	0xb
	.byte	0x2d
	.byte	0x10
	.4byte	0x17d
	.byte	0x2c
	.uleb128 0x2
	.4byte	.LASF47
	.byte	0xb
	.byte	0x2e
	.byte	0x13
	.4byte	0x165
	.byte	0x48
	.uleb128 0x2
	.4byte	.LASF48
	.byte	0xb
	.byte	0x2f
	.byte	0x13
	.4byte	0x165
	.byte	0x4c
	.uleb128 0x2
	.4byte	.LASF49
	.byte	0xb
	.byte	0x30
	.byte	0xf
	.4byte	0x171
	.byte	0x50
	.uleb128 0x2
	.4byte	.LASF50
	.byte	0xb
	.byte	0x31
	.byte	0xf
	.4byte	0x171
	.byte	0x54
	.uleb128 0x2
	.4byte	.LASF51
	.byte	0xb
	.byte	0x32
	.byte	0x9
	.4byte	0x82
	.byte	0x58
	.uleb128 0x2
	.4byte	.LASF52
	.byte	0xb
	.byte	0x33
	.byte	0xe
	.4byte	0x121
	.byte	0x5c
	.uleb128 0x2
	.4byte	.LASF53
	.byte	0xb
	.byte	0x34
	.byte	0x16
	.4byte	0x30e
	.byte	0x60
	.byte	0
	.uleb128 0x3
	.4byte	.LASF54
	.byte	0xb
	.byte	0x21
	.byte	0x10
	.4byte	0x2fe
	.uleb128 0x8
	.4byte	0x303
	.uleb128 0xd
	.4byte	0x30e
	.uleb128 0x4
	.4byte	0xcc
	.byte	0
	.uleb128 0x3
	.4byte	.LASF55
	.byte	0xb
	.byte	0x22
	.byte	0x10
	.4byte	0x31a
	.uleb128 0x8
	.4byte	0x31f
	.uleb128 0xd
	.4byte	0x32a
	.uleb128 0x4
	.4byte	0x32a
	.byte	0
	.uleb128 0x8
	.4byte	0x20a
	.uleb128 0xb
	.4byte	0x90
	.4byte	0x340
	.uleb128 0x12
	.4byte	0x89
	.2byte	0x7ff
	.byte	0
	.uleb128 0xe
	.4byte	.LASF57
	.byte	0x8
	.4byte	0x32f
	.uleb128 0x5
	.byte	0x3
	.4byte	worker1_thread_stack
	.uleb128 0xf
	.4byte	.LASF59
	.byte	0x9
	.4byte	0x20a
	.uleb128 0x5
	.byte	0x3
	.4byte	worker1
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0xc
	.4byte	0x32f
	.uleb128 0x5
	.byte	0x3
	.4byte	worker2_thread_stack
	.uleb128 0xf
	.4byte	.LASF60
	.byte	0xd
	.4byte	0x20a
	.uleb128 0x5
	.byte	0x3
	.4byte	worker2
	.uleb128 0xb
	.4byte	0x90
	.4byte	0x391
	.uleb128 0x12
	.4byte	0x89
	.2byte	0x3ff
	.byte	0
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x2c
	.4byte	0x380
	.uleb128 0x5
	.byte	0x3
	.4byte	BootThreadStack
	.uleb128 0xf
	.4byte	.LASF62
	.byte	0x2d
	.4byte	0x20a
	.uleb128 0x5
	.byte	0x3
	.4byte	BootThread
	.uleb128 0xa
	.4byte	.LASF65
	.byte	0xb
	.byte	0x5a
	.byte	0xa
	.4byte	0x121
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0xd
	.byte	0x12
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0xe
	.byte	0x13
	.uleb128 0xa
	.4byte	.LASF66
	.byte	0xb
	.byte	0x5c
	.byte	0xe
	.4byte	0x32a
	.uleb128 0x9
	.4byte	.LASF69
	.byte	0xb
	.byte	0x62
	.byte	0xa
	.4byte	0x121
	.4byte	0x3ed
	.uleb128 0x4
	.4byte	0xa8
	.byte	0
	.uleb128 0xa
	.4byte	.LASF67
	.byte	0xf
	.byte	0x3f
	.byte	0xb
	.4byte	0x109
	.uleb128 0x20
	.4byte	.LASF84
	.byte	0x14
	.byte	0x13
	.byte	0x6
	.4byte	0x40b
	.uleb128 0x4
	.4byte	0xb4
	.byte	0
	.uleb128 0xa
	.4byte	.LASF68
	.byte	0x10
	.byte	0x43
	.byte	0xa
	.4byte	0x121
	.uleb128 0x9
	.4byte	.LASF70
	.byte	0xb
	.byte	0x4f
	.byte	0xa
	.4byte	0x121
	.4byte	0x42d
	.uleb128 0x4
	.4byte	0x32a
	.byte	0
	.uleb128 0x9
	.4byte	.LASF71
	.byte	0xb
	.byte	0x49
	.byte	0xa
	.4byte	0x121
	.4byte	0x466
	.uleb128 0x4
	.4byte	0x32a
	.uleb128 0x4
	.4byte	0xda
	.uleb128 0x4
	.4byte	0x2f2
	.uleb128 0x4
	.4byte	0xcc
	.uleb128 0x4
	.4byte	0xcc
	.uleb128 0x4
	.4byte	0x115
	.uleb128 0x4
	.4byte	0x165
	.uleb128 0x4
	.4byte	0x171
	.byte	0
	.uleb128 0x9
	.4byte	.LASF72
	.byte	0x9
	.byte	0x1c
	.byte	0xb
	.4byte	0x171
	.4byte	0x47c
	.uleb128 0x4
	.4byte	0xa8
	.byte	0
	.uleb128 0x21
	.4byte	.LASF73
	.byte	0x11
	.2byte	0x1f32
	.byte	0xa
	.4byte	0xa8
	.uleb128 0x9
	.4byte	.LASF74
	.byte	0x12
	.byte	0xce
	.byte	0x4
	.4byte	0x82
	.4byte	0x4a0
	.uleb128 0x4
	.4byte	0xda
	.uleb128 0x22
	.byte	0
	.uleb128 0x10
	.4byte	.LASF75
	.byte	0x13
	.byte	0x2a
	.uleb128 0x23
	.4byte	.LASF85
	.byte	0x1
	.byte	0x4f
	.byte	0x5
	.4byte	0x82
	.4byte	.LFB386
	.4byte	.LFE386-.LFB386
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x60e
	.uleb128 0x24
	.ascii	"err\000"
	.byte	0x1
	.byte	0x5e
	.byte	0xe
	.4byte	0x121
	.4byte	.LLST4
	.uleb128 0x11
	.4byte	.LASF76
	.byte	0x62
	.byte	0x9
	.4byte	0x82
	.4byte	.LLST5
	.uleb128 0x25
	.4byte	0x815
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0x1
	.byte	0x6a
	.byte	0xd
	.4byte	0x513
	.uleb128 0x13
	.4byte	0x81c
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.2byte	0x20c
	.uleb128 0x13
	.4byte	0x81c
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.2byte	0x211
	.byte	0
	.uleb128 0x7
	.4byte	.LVL26
	.4byte	0x4a0
	.uleb128 0x5
	.4byte	.LVL27
	.4byte	0x489
	.4byte	0x533
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC7
	.byte	0
	.uleb128 0x7
	.4byte	.LVL28
	.4byte	0x47c
	.uleb128 0x5
	.4byte	.LVL29
	.4byte	0x489
	.4byte	0x553
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC8
	.byte	0
	.uleb128 0x5
	.4byte	.LVL30
	.4byte	0x466
	.4byte	0x568
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa
	.2byte	0x1f4
	.byte	0
	.uleb128 0x5
	.4byte	.LVL31
	.4byte	0x42d
	.4byte	0x5ab
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC9
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	BootThreadEntry
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x5
	.byte	0x3
	.4byte	BootThreadStack
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x3
	.byte	0xa
	.2byte	0x400
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7d
	.sleb128 8
	.uleb128 0x1
	.byte	0x44
	.byte	0
	.uleb128 0x5
	.4byte	.LVL32
	.4byte	0x417
	.4byte	0x5bf
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL33
	.4byte	0x40b
	.uleb128 0x5
	.4byte	.LVL36
	.4byte	0x489
	.4byte	0x5df
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC10
	.byte	0
	.uleb128 0x5
	.4byte	.LVL39
	.4byte	0x489
	.4byte	0x5fc
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC11
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 -1
	.byte	0
	.uleb128 0x14
	.4byte	.LVL40
	.4byte	0x3f9
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa
	.2byte	0x3e8
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF77
	.byte	0x2e
	.4byte	.LFB384
	.4byte	.LFE384-.LFB384
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x758
	.uleb128 0x16
	.ascii	"p\000"
	.byte	0x2e
	.byte	0x23
	.4byte	0xcc
	.4byte	.LLST0
	.uleb128 0x11
	.4byte	.LASF76
	.byte	0x3b
	.byte	0x9
	.4byte	0x82
	.4byte	.LLST1
	.uleb128 0x5
	.4byte	.LVL2
	.4byte	0x42d
	.4byte	0x684
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x5
	.byte	0x3
	.4byte	worker1_thread_stack
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7d
	.sleb128 8
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7d
	.sleb128 12
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x5
	.4byte	.LVL3
	.4byte	0x417
	.4byte	0x698
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x5
	.4byte	.LVL4
	.4byte	0x489
	.4byte	0x6af
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x5
	.4byte	.LVL5
	.4byte	0x42d
	.4byte	0x6f5
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x5
	.byte	0x3
	.4byte	worker2_thread_stack
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7d
	.sleb128 8
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7d
	.sleb128 12
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x5
	.4byte	.LVL6
	.4byte	0x417
	.4byte	0x709
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x5
	.4byte	.LVL7
	.4byte	0x489
	.4byte	0x720
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.uleb128 0x7
	.4byte	.LVL10
	.4byte	0x3ed
	.uleb128 0x5
	.4byte	.LVL11
	.4byte	0x489
	.4byte	0x746
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC4
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL12
	.4byte	0x3d7
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa
	.2byte	0x3e8
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF78
	.byte	0x10
	.4byte	.LFB383
	.4byte	.LFE383-.LFB383
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x815
	.uleb128 0x16
	.ascii	"p\000"
	.byte	0x10
	.byte	0x27
	.4byte	0xcc
	.4byte	.LLST2
	.uleb128 0x26
	.ascii	"id\000"
	.byte	0x1
	.byte	0x12
	.byte	0x9
	.4byte	0x82
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x11
	.4byte	.LASF76
	.byte	0x13
	.byte	0xf
	.4byte	0x115
	.4byte	.LLST3
	.uleb128 0x7
	.4byte	.LVL14
	.4byte	0x3cb
	.uleb128 0x5
	.4byte	.LVL15
	.4byte	0x489
	.4byte	0x7b5
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.byte	0
	.uleb128 0x7
	.4byte	.LVL17
	.4byte	0x3c4
	.uleb128 0x7
	.4byte	.LVL18
	.4byte	0x3cb
	.uleb128 0x7
	.4byte	.LVL20
	.4byte	0x3cb
	.uleb128 0x7
	.4byte	.LVL21
	.4byte	0x3ed
	.uleb128 0x5
	.4byte	.LVL22
	.4byte	0x489
	.4byte	0x802
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC6
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.4byte	.LVL23
	.4byte	0x3b1
	.uleb128 0x7
	.4byte	.LVL25
	.4byte	0x3bd
	.byte	0
	.uleb128 0x17
	.4byte	.LASF79
	.2byte	0x20a
	.uleb128 0x17
	.4byte	.LASF80
	.2byte	0x158
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
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
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.sleb128 16
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x88
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.sleb128 20
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.sleb128 2
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 5
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
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x17
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
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
.LLST4:
	.byte	0x6
	.4byte	.LVL34
	.byte	0x4
	.uleb128 .LVL34-.LVL34
	.uleb128 .LVL35-.LVL34
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL35-.LVL34
	.uleb128 .LVL36-1-.LVL34
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL36
	.byte	0x4
	.uleb128 .LVL36-.LVL36
	.uleb128 .LVL37-.LVL36
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL37-.LVL36
	.uleb128 .LFE386-.LVL36
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
	.uleb128 .LFE384-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL7
	.byte	0x4
	.uleb128 .LVL7-.LVL7
	.uleb128 .LVL8-.LVL7
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL8-.LVL7
	.uleb128 .LVL9-.LVL7
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL9-.LVL7
	.uleb128 .LFE384-.LVL7
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL13
	.byte	0x4
	.uleb128 .LVL13-.LVL13
	.uleb128 .LVL14-1-.LVL13
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL14-1-.LVL13
	.uleb128 .LFE383-.LVL13
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL16-.LVL15
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL15
	.uleb128 .LVL19-.LVL15
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL19-.LVL15
	.uleb128 .LVL24-.LVL15
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL24-.LVL15
	.uleb128 .LFE383-.LVL15
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
	.4byte	.LFB384
	.4byte	.LFE384-.LFB384
	.4byte	.LFB383
	.4byte	.LFE383-.LFB383
	.4byte	.LFB386
	.4byte	.LFE386-.LFB386
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
.LLRL6:
	.byte	0x7
	.4byte	.LFB384
	.uleb128 .LFE384-.LFB384
	.byte	0x7
	.4byte	.LFB383
	.uleb128 .LFE383-.LFB383
	.byte	0x7
	.4byte	.LFB386
	.uleb128 .LFE386-.LFB386
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF34:
	.ascii	"ticks\000"
.LASF53:
	.ascii	"exit_function\000"
.LASF79:
	.ascii	"cpu_reboot\000"
.LASF83:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF0:
	.ascii	"short int\000"
.LASF20:
	.ascii	"os_uint_t\000"
.LASF33:
	.ascii	"userdata\000"
.LASF48:
	.ascii	"curr_priority\000"
.LASF46:
	.ascii	"timer_node\000"
.LASF37:
	.ascii	"os_timer_timeout_t\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF55:
	.ascii	"os_thread_exit_t\000"
.LASF72:
	.ascii	"os_tick_from_millisecond\000"
.LASF81:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF61:
	.ascii	"BootThreadStack\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF77:
	.ascii	"BootThreadEntry\000"
.LASF50:
	.ascii	"remain_ticks\000"
.LASF17:
	.ascii	"float\000"
.LASF9:
	.ascii	"long long int\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF6:
	.ascii	"long int\000"
.LASF54:
	.ascii	"os_thread_entry_t\000"
.LASF4:
	.ascii	"__uint8_t\000"
.LASF84:
	.ascii	"BSP_TIMDelay_Ms\000"
.LASF22:
	.ascii	"os_err_t\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF51:
	.ascii	"state\000"
.LASF73:
	.ascii	"HAL_RCC_GetPCLK1Freq\000"
.LASF40:
	.ascii	"name\000"
.LASF21:
	.ascii	"os_size_t\000"
.LASF71:
	.ascii	"os_thread_init\000"
.LASF15:
	.ascii	"long double\000"
.LASF31:
	.ascii	"wait_node\000"
.LASF41:
	.ascii	"thread_entry\000"
.LASF45:
	.ascii	"ready_node\000"
.LASF24:
	.ascii	"prev\000"
.LASF1:
	.ascii	"signed char\000"
.LASF36:
	.ascii	"flags\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF63:
	.ascii	"BSP_LED5_Toggle\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF42:
	.ascii	"parameter\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF76:
	.ascii	"nCount\000"
.LASF58:
	.ascii	"worker2_thread_stack\000"
.LASF16:
	.ascii	"char\000"
.LASF65:
	.ascii	"os_thread_yield\000"
.LASF85:
	.ascii	"main\000"
.LASF13:
	.ascii	"int32_t\000"
.LASF47:
	.ascii	"init_priority\000"
.LASF49:
	.ascii	"init_ticks\000"
.LASF56:
	.ascii	"SystemCoreClock\000"
.LASF70:
	.ascii	"os_thread_startup\000"
.LASF67:
	.ascii	"os_scheduler_get_current_tick\000"
.LASF75:
	.ascii	"Board_Init\000"
.LASF68:
	.ascii	"os_kernel_startup\000"
.LASF80:
	.ascii	"cpu_DSB\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF18:
	.ascii	"double\000"
.LASF35:
	.ascii	"expire_tick\000"
.LASF66:
	.ascii	"os_thread_self\000"
.LASF19:
	.ascii	"os_int_t\000"
.LASF27:
	.ascii	"os_tick_t\000"
.LASF26:
	.ascii	"os_priority_t\000"
.LASF57:
	.ascii	"worker1_thread_stack\000"
.LASF5:
	.ascii	"__int32_t\000"
.LASF30:
	.ascii	"os_timer_s\000"
.LASF28:
	.ascii	"os_timer_t\000"
.LASF44:
	.ascii	"stack_size\000"
.LASF39:
	.ascii	"os_thread_s\000"
.LASF38:
	.ascii	"os_thread_t\000"
.LASF62:
	.ascii	"BootThread\000"
.LASF64:
	.ascii	"BSP_LED3_Toggle\000"
.LASF29:
	.ascii	"os_list_node_s\000"
.LASF23:
	.ascii	"os_list_node_t\000"
.LASF52:
	.ascii	"error\000"
.LASF69:
	.ascii	"os_thread_mdelay\000"
.LASF74:
	.ascii	"BSP_USART1_Printf\000"
.LASF43:
	.ascii	"stack_addr\000"
.LASF59:
	.ascii	"worker1\000"
.LASF60:
	.ascii	"worker2\000"
.LASF78:
	.ascii	"worker_thread_entry\000"
.LASF82:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/main.c\000"
.LASF32:
	.ascii	"timeout\000"
.LASF25:
	.ascii	"next\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
