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
	.file	"syscalls.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/syscalls.c"
	.section	.text.initialise_monitor_handles,"ax",%progbits
	.align	1
	.global	initialise_monitor_handles
	.syntax unified
	.thumb
	.thumb_func
	.type	initialise_monitor_handles, %function
initialise_monitor_handles:
.LFB25:
	.loc 1 45 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 46 1
	bx	lr
	.cfi_endproc
.LFE25:
	.size	initialise_monitor_handles, .-initialise_monitor_handles
	.section	.text._getpid,"ax",%progbits
	.align	1
	.global	_getpid
	.syntax unified
	.thumb
	.thumb_func
	.type	_getpid, %function
_getpid:
.LFB26:
	.loc 1 49 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 50 3
	.loc 1 51 1 is_stmt 0
	movs	r0, #1
	bx	lr
	.cfi_endproc
.LFE26:
	.size	_getpid, .-_getpid
	.section	.text._kill,"ax",%progbits
	.align	1
	.global	_kill
	.syntax unified
	.thumb
	.thumb_func
	.type	_kill, %function
_kill:
.LFB27:
	.loc 1 54 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 55 3
	.loc 1 56 3
	.loc 1 57 2
	.loc 1 57 4 is_stmt 0
	bl	__errno
.LVL1:
	.loc 1 57 8
	movs	r3, #22
	str	r3, [r0]
	.loc 1 58 3 is_stmt 1
	.loc 1 59 1 is_stmt 0
	mov	r0, #-1
	pop	{r3, pc}
	.cfi_endproc
.LFE27:
	.size	_kill, .-_kill
	.section	.text._exit,"ax",%progbits
	.align	1
	.global	_exit
	.syntax unified
	.thumb
	.thumb_func
	.type	_exit, %function
_exit:
.LFB28:
	.loc 1 62 1 is_stmt 1
	.cfi_startproc
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL2:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 63 3
	mov	r1, #-1
	bl	_kill
.LVL3:
.L6:
	.loc 1 64 3 discriminator 1
	.loc 1 64 14 discriminator 1
	.loc 1 64 9 discriminator 1
	b	.L6
	.cfi_endproc
.LFE28:
	.size	_exit, .-_exit
	.section	.text._read,"ax",%progbits
	.align	1
	.weak	_read
	.syntax unified
	.thumb
	.thumb_func
	.type	_read, %function
_read:
.LFB29:
	.loc 1 68 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL4:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r1
	mov	r6, r2
	.loc 1 69 3
	.loc 1 70 3
	.loc 1 72 3
.LVL5:
	.loc 1 72 16 is_stmt 0
	movs	r5, #0
	.loc 1 72 3
	b	.L9
.LVL6:
.L10:
	.loc 1 74 5 is_stmt 1 discriminator 3
	.loc 1 74 14 is_stmt 0 discriminator 3
	bl	__io_getchar
.LVL7:
	.loc 1 74 9 discriminator 3
	mov	r1, r4
.LVL8:
	.loc 1 74 12 discriminator 3
	strb	r0, [r1], #1
.LVL9:
	.loc 1 72 43 is_stmt 1 discriminator 3
	adds	r5, r5, #1
.LVL10:
	.loc 1 74 9 is_stmt 0 discriminator 3
	mov	r4, r1
.LVL11:
.L9:
	.loc 1 72 29 is_stmt 1 discriminator 1
	cmp	r5, r6
	blt	.L10
	.loc 1 77 3
	.loc 1 78 1 is_stmt 0
	mov	r0, r6
	pop	{r4, r5, r6, pc}
	.cfi_endproc
.LFE29:
	.size	_read, .-_read
	.section	.text._write,"ax",%progbits
	.align	1
	.weak	_write
	.syntax unified
	.thumb
	.thumb_func
	.type	_write, %function
_write:
.LFB30:
	.loc 1 81 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL12:
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	mov	r4, r1
	mov	r6, r2
	.loc 1 82 3
	.loc 1 83 3
	.loc 1 85 3
.LVL13:
	.loc 1 85 16 is_stmt 0
	movs	r5, #0
	.loc 1 85 3
	b	.L13
.LVL14:
.L14:
	.loc 1 87 5 is_stmt 1 discriminator 3
	ldrb	r0, [r4], #1	@ zero_extendqisi2
.LVL15:
	bl	__io_putchar
.LVL16:
	.loc 1 85 43 discriminator 3
	adds	r5, r5, #1
.LVL17:
.L13:
	.loc 1 85 29 discriminator 1
	cmp	r5, r6
	blt	.L14
	.loc 1 89 3
	.loc 1 90 1 is_stmt 0
	mov	r0, r6
	pop	{r4, r5, r6, pc}
	.cfi_endproc
.LFE30:
	.size	_write, .-_write
	.section	.text._close,"ax",%progbits
	.align	1
	.global	_close
	.syntax unified
	.thumb
	.thumb_func
	.type	_close, %function
_close:
.LFB31:
	.loc 1 93 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL18:
	.loc 1 94 3
	.loc 1 95 3
	.loc 1 96 1 is_stmt 0
	mov	r0, #-1
.LVL19:
	bx	lr
	.cfi_endproc
.LFE31:
	.size	_close, .-_close
	.section	.text._fstat,"ax",%progbits
	.align	1
	.global	_fstat
	.syntax unified
	.thumb
	.thumb_func
	.type	_fstat, %function
_fstat:
.LFB32:
	.loc 1 100 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL20:
	.loc 1 101 3
	.loc 1 102 3
	.loc 1 102 15 is_stmt 0
	mov	r3, #8192
	str	r3, [r1, #4]
	.loc 1 103 3 is_stmt 1
	.loc 1 104 1 is_stmt 0
	movs	r0, #0
.LVL21:
	bx	lr
	.cfi_endproc
.LFE32:
	.size	_fstat, .-_fstat
	.section	.text._isatty,"ax",%progbits
	.align	1
	.global	_isatty
	.syntax unified
	.thumb
	.thumb_func
	.type	_isatty, %function
_isatty:
.LFB33:
	.loc 1 107 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL22:
	.loc 1 108 3
	.loc 1 109 3
	.loc 1 110 1 is_stmt 0
	movs	r0, #1
.LVL23:
	bx	lr
	.cfi_endproc
.LFE33:
	.size	_isatty, .-_isatty
	.section	.text._lseek,"ax",%progbits
	.align	1
	.global	_lseek
	.syntax unified
	.thumb
	.thumb_func
	.type	_lseek, %function
_lseek:
.LFB34:
	.loc 1 113 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL24:
	.loc 1 114 3
	.loc 1 115 3
	.loc 1 116 3
	.loc 1 117 3
	.loc 1 118 1 is_stmt 0
	movs	r0, #0
.LVL25:
	bx	lr
	.cfi_endproc
.LFE34:
	.size	_lseek, .-_lseek
	.section	.text._open,"ax",%progbits
	.align	1
	.global	_open
	.syntax unified
	.thumb
	.thumb_func
	.type	_open, %function
_open:
.LFB35:
	.loc 1 121 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 12, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 1
	@ link register save eliminated.
.LVL26:
	push	{r1, r2, r3}
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -12
	.cfi_offset 2, -8
	.cfi_offset 3, -4
	.loc 1 122 3
	.loc 1 123 3
	.loc 1 125 3
	.loc 1 126 1 is_stmt 0
	mov	r0, #-1
.LVL27:
	add	sp, sp, #12
	.cfi_restore 3
	.cfi_restore 2
	.cfi_restore 1
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE35:
	.size	_open, .-_open
	.section	.text._wait,"ax",%progbits
	.align	1
	.global	_wait
	.syntax unified
	.thumb
	.thumb_func
	.type	_wait, %function
_wait:
.LFB36:
	.loc 1 129 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL28:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 130 3
	.loc 1 131 2
	.loc 1 131 4 is_stmt 0
	bl	__errno
.LVL29:
	.loc 1 131 8
	movs	r3, #10
	str	r3, [r0]
	.loc 1 132 3 is_stmt 1
	.loc 1 133 1 is_stmt 0
	mov	r0, #-1
	pop	{r3, pc}
	.cfi_endproc
.LFE36:
	.size	_wait, .-_wait
	.section	.text._unlink,"ax",%progbits
	.align	1
	.global	_unlink
	.syntax unified
	.thumb
	.thumb_func
	.type	_unlink, %function
_unlink:
.LFB37:
	.loc 1 136 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL30:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 137 3
	.loc 1 138 2
	.loc 1 138 4 is_stmt 0
	bl	__errno
.LVL31:
	.loc 1 138 8
	movs	r3, #2
	str	r3, [r0]
	.loc 1 139 3 is_stmt 1
	.loc 1 140 1 is_stmt 0
	mov	r0, #-1
	pop	{r3, pc}
	.cfi_endproc
.LFE37:
	.size	_unlink, .-_unlink
	.section	.text._times,"ax",%progbits
	.align	1
	.global	_times
	.syntax unified
	.thumb
	.thumb_func
	.type	_times, %function
_times:
.LFB38:
	.loc 1 143 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL32:
	.loc 1 144 3
	.loc 1 145 3
	.loc 1 146 1 is_stmt 0
	mov	r0, #-1
.LVL33:
	bx	lr
	.cfi_endproc
.LFE38:
	.size	_times, .-_times
	.section	.text._stat,"ax",%progbits
	.align	1
	.global	_stat
	.syntax unified
	.thumb
	.thumb_func
	.type	_stat, %function
_stat:
.LFB39:
	.loc 1 149 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL34:
	.loc 1 150 3
	.loc 1 151 3
	.loc 1 151 15 is_stmt 0
	mov	r3, #8192
	str	r3, [r1, #4]
	.loc 1 152 3 is_stmt 1
	.loc 1 153 1 is_stmt 0
	movs	r0, #0
.LVL35:
	bx	lr
	.cfi_endproc
.LFE39:
	.size	_stat, .-_stat
	.section	.text._link,"ax",%progbits
	.align	1
	.global	_link
	.syntax unified
	.thumb
	.thumb_func
	.type	_link, %function
_link:
.LFB40:
	.loc 1 156 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL36:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 157 3
	.loc 1 158 3
	.loc 1 159 2
	.loc 1 159 4 is_stmt 0
	bl	__errno
.LVL37:
	.loc 1 159 8
	movs	r3, #31
	str	r3, [r0]
	.loc 1 160 3 is_stmt 1
	.loc 1 161 1 is_stmt 0
	mov	r0, #-1
	pop	{r3, pc}
	.cfi_endproc
.LFE40:
	.size	_link, .-_link
	.section	.text._fork,"ax",%progbits
	.align	1
	.global	_fork
	.syntax unified
	.thumb
	.thumb_func
	.type	_fork, %function
_fork:
.LFB41:
	.loc 1 164 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 165 2
	.loc 1 165 4 is_stmt 0
	bl	__errno
.LVL38:
	.loc 1 165 8
	movs	r3, #11
	str	r3, [r0]
	.loc 1 166 3 is_stmt 1
	.loc 1 167 1 is_stmt 0
	mov	r0, #-1
	pop	{r3, pc}
	.cfi_endproc
.LFE41:
	.size	_fork, .-_fork
	.section	.text._execve,"ax",%progbits
	.align	1
	.global	_execve
	.syntax unified
	.thumb
	.thumb_func
	.type	_execve, %function
_execve:
.LFB42:
	.loc 1 170 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL39:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 171 3
	.loc 1 172 3
	.loc 1 173 3
	.loc 1 174 2
	.loc 1 174 4 is_stmt 0
	bl	__errno
.LVL40:
	.loc 1 174 8
	movs	r3, #12
	str	r3, [r0]
	.loc 1 175 3 is_stmt 1
	.loc 1 176 1 is_stmt 0
	mov	r0, #-1
	pop	{r3, pc}
	.cfi_endproc
.LFE42:
	.size	_execve, .-_execve
	.global	environ
	.section	.data.environ,"aw"
	.align	2
	.type	environ, %object
	.size	environ, 4
environ:
	.word	__env
	.global	__env
	.section	.bss.__env,"aw",%nobits
	.align	2
	.type	__env, %object
	.size	__env, 4
__env:
	.space	4
	.weak	__io_putchar
	.weak	__io_getchar
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_types.h"
	.file 4 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_timeval.h"
	.file 5 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_timespec.h"
	.file 6 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\types.h"
	.file 7 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\stat.h"
	.file 8 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\times.h"
	.file 9 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\errno.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x71b
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x11
	.4byte	.LASF82
	.byte	0x1d
	.4byte	.LASF83
	.4byte	.LASF84
	.4byte	.LLRL25
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x1
	.4byte	.LASF8
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x55
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x1
	.4byte	.LASF9
	.byte	0x2
	.byte	0xc8
	.byte	0x17
	.4byte	0x5c
	.uleb128 0x12
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x1
	.4byte	.LASF12
	.byte	0x3
	.byte	0x1e
	.byte	0xe
	.4byte	0x42
	.uleb128 0x1
	.4byte	.LASF13
	.byte	0x3
	.byte	0x22
	.byte	0xe
	.4byte	0x42
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0x3
	.byte	0x2e
	.byte	0xe
	.4byte	0x42
	.uleb128 0x1
	.4byte	.LASF15
	.byte	0x3
	.byte	0x38
	.byte	0xf
	.4byte	0x34
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0x3
	.byte	0x3c
	.byte	0x18
	.4byte	0x3b
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0x3
	.byte	0x3f
	.byte	0x18
	.4byte	0x3b
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0x3
	.byte	0x4b
	.byte	0x18
	.4byte	0x3b
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0x3
	.byte	0x5a
	.byte	0x14
	.4byte	0x49
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x3
	.byte	0x66
	.byte	0x10
	.4byte	0xa3
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x3
	.byte	0xd5
	.byte	0x18
	.4byte	0x3b
	.uleb128 0x8
	.4byte	0x108
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF22
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0x4
	.byte	0x2a
	.byte	0x19
	.4byte	0x6a
	.uleb128 0xa
	.4byte	.LASF36
	.byte	0x10
	.byte	0x5
	.byte	0x2f
	.4byte	0x142
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x5
	.byte	0x30
	.byte	0x9
	.4byte	0x10f
	.byte	0
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0x5
	.byte	0x31
	.byte	0x7
	.4byte	0x42
	.byte	0x8
	.byte	0
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0x6
	.byte	0x61
	.byte	0x14
	.4byte	0x8b
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0x6
	.byte	0x66
	.byte	0x15
	.4byte	0x97
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x6
	.byte	0x6b
	.byte	0x17
	.4byte	0x55
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x6
	.byte	0x89
	.byte	0x11
	.4byte	0xd3
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x6
	.byte	0x9b
	.byte	0x11
	.4byte	0xeb
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x6
	.byte	0x9f
	.byte	0x11
	.4byte	0xaf
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x6
	.byte	0xa3
	.byte	0x11
	.4byte	0xbb
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x6
	.byte	0xa7
	.byte	0x11
	.4byte	0xc7
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x6
	.byte	0xbb
	.byte	0x12
	.4byte	0xdf
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x6
	.byte	0xc0
	.byte	0x13
	.4byte	0xf7
	.uleb128 0xa
	.4byte	.LASF37
	.byte	0x58
	.byte	0x7
	.byte	0x1b
	.4byte	0x27d
	.uleb128 0x2
	.4byte	.LASF38
	.byte	0x7
	.byte	0x1d
	.byte	0x9
	.4byte	0x17e
	.byte	0
	.uleb128 0x2
	.4byte	.LASF39
	.byte	0x7
	.byte	0x1e
	.byte	0x9
	.4byte	0x166
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0x7
	.byte	0x1f
	.byte	0xa
	.4byte	0x1a2
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF41
	.byte	0x7
	.byte	0x20
	.byte	0xb
	.4byte	0x1ae
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF42
	.byte	0x7
	.byte	0x21
	.byte	0x9
	.4byte	0x18a
	.byte	0xa
	.uleb128 0x2
	.4byte	.LASF43
	.byte	0x7
	.byte	0x22
	.byte	0x9
	.4byte	0x196
	.byte	0xc
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x7
	.byte	0x23
	.byte	0x9
	.4byte	0x17e
	.byte	0xe
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0x7
	.byte	0x24
	.byte	0x9
	.4byte	0x172
	.byte	0x10
	.uleb128 0x2
	.4byte	.LASF46
	.byte	0x7
	.byte	0x2a
	.byte	0x13
	.4byte	0x11b
	.byte	0x18
	.uleb128 0x2
	.4byte	.LASF47
	.byte	0x7
	.byte	0x2b
	.byte	0x13
	.4byte	0x11b
	.byte	0x28
	.uleb128 0x2
	.4byte	.LASF48
	.byte	0x7
	.byte	0x2c
	.byte	0x13
	.4byte	0x11b
	.byte	0x38
	.uleb128 0x2
	.4byte	.LASF49
	.byte	0x7
	.byte	0x2d
	.byte	0xd
	.4byte	0x14e
	.byte	0x48
	.uleb128 0x2
	.4byte	.LASF50
	.byte	0x7
	.byte	0x2e
	.byte	0xc
	.4byte	0x142
	.byte	0x4c
	.uleb128 0x2
	.4byte	.LASF51
	.byte	0x7
	.byte	0x30
	.byte	0x8
	.4byte	0x27d
	.byte	0x50
	.byte	0
	.uleb128 0xb
	.4byte	0x42
	.4byte	0x28d
	.uleb128 0xc
	.4byte	0x7d
	.byte	0x1
	.byte	0
	.uleb128 0x13
	.ascii	"tms\000"
	.byte	0x10
	.byte	0x8
	.byte	0x11
	.byte	0x8
	.4byte	0x2cf
	.uleb128 0x2
	.4byte	.LASF52
	.byte	0x8
	.byte	0x12
	.byte	0xa
	.4byte	0x15a
	.byte	0
	.uleb128 0x2
	.4byte	.LASF53
	.byte	0x8
	.byte	0x13
	.byte	0xa
	.4byte	0x15a
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF54
	.byte	0x8
	.byte	0x14
	.byte	0xa
	.4byte	0x15a
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF55
	.byte	0x8
	.byte	0x15
	.byte	0xa
	.4byte	0x15a
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.4byte	0x103
	.4byte	0x2df
	.uleb128 0xc
	.4byte	0x7d
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF56
	.byte	0x27
	.byte	0x7
	.4byte	0x2cf
	.uleb128 0x5
	.byte	0x3
	.4byte	__env
	.uleb128 0xd
	.4byte	.LASF57
	.byte	0x28
	.byte	0x8
	.4byte	0x301
	.uleb128 0x5
	.byte	0x3
	.4byte	environ
	.uleb128 0x8
	.4byte	0x103
	.uleb128 0x14
	.4byte	.LASF85
	.byte	0x1
	.byte	0x23
	.byte	0xc
	.4byte	0x76
	.4byte	0x31c
	.uleb128 0x15
	.4byte	0x76
	.byte	0
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x1
	.byte	0x24
	.byte	0xc
	.4byte	0x76
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x9
	.byte	0x13
	.byte	0xd
	.4byte	0x334
	.uleb128 0x8
	.4byte	0x76
	.uleb128 0x3
	.4byte	.LASF62
	.byte	0xa9
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x389
	.uleb128 0x4
	.4byte	.LASF60
	.byte	0xa9
	.byte	0x13
	.4byte	0x103
	.4byte	.LLST22
	.uleb128 0x4
	.4byte	.LASF61
	.byte	0xa9
	.byte	0x20
	.4byte	0x301
	.4byte	.LLST23
	.uleb128 0x6
	.ascii	"env\000"
	.byte	0xa9
	.byte	0x2d
	.4byte	0x301
	.4byte	.LLST24
	.uleb128 0x7
	.4byte	.LVL40
	.4byte	0x328
	.byte	0
	.uleb128 0x3
	.4byte	.LASF63
	.byte	0xa3
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ac
	.uleb128 0x7
	.4byte	.LVL38
	.4byte	0x328
	.byte	0
	.uleb128 0x3
	.4byte	.LASF64
	.byte	0x9b
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ed
	.uleb128 0x6
	.ascii	"old\000"
	.byte	0x9b
	.byte	0x11
	.4byte	0x103
	.4byte	.LLST20
	.uleb128 0x6
	.ascii	"new\000"
	.byte	0x9b
	.byte	0x1c
	.4byte	0x103
	.4byte	.LLST21
	.uleb128 0x7
	.4byte	.LVL37
	.4byte	0x328
	.byte	0
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x94
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x422
	.uleb128 0x4
	.4byte	.LASF66
	.byte	0x94
	.byte	0x11
	.4byte	0x103
	.4byte	.LLST19
	.uleb128 0x9
	.ascii	"st\000"
	.byte	0x94
	.byte	0x24
	.4byte	0x422
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x8
	.4byte	0x1ba
	.uleb128 0x3
	.4byte	.LASF67
	.byte	0x8e
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x450
	.uleb128 0x6
	.ascii	"buf\000"
	.byte	0x8e
	.byte	0x18
	.4byte	0x450
	.4byte	.LLST18
	.byte	0
	.uleb128 0x8
	.4byte	0x28d
	.uleb128 0x3
	.4byte	.LASF68
	.byte	0x87
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x487
	.uleb128 0x4
	.4byte	.LASF60
	.byte	0x87
	.byte	0x13
	.4byte	0x103
	.4byte	.LLST17
	.uleb128 0x7
	.4byte	.LVL31
	.4byte	0x328
	.byte	0
	.uleb128 0x3
	.4byte	.LASF69
	.byte	0x80
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b9
	.uleb128 0x4
	.4byte	.LASF70
	.byte	0x80
	.byte	0x10
	.4byte	0x334
	.4byte	.LLST16
	.uleb128 0x7
	.4byte	.LVL29
	.4byte	0x328
	.byte	0
	.uleb128 0x3
	.4byte	.LASF71
	.byte	0x78
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4f2
	.uleb128 0x4
	.4byte	.LASF72
	.byte	0x78
	.byte	0x11
	.4byte	0x103
	.4byte	.LLST15
	.uleb128 0x16
	.4byte	.LASF73
	.byte	0x1
	.byte	0x78
	.byte	0x1b
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.byte	0
	.uleb128 0x3
	.4byte	.LASF74
	.byte	0x70
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x535
	.uleb128 0x4
	.4byte	.LASF66
	.byte	0x70
	.byte	0x10
	.4byte	0x76
	.4byte	.LLST14
	.uleb128 0x9
	.ascii	"ptr\000"
	.byte	0x70
	.byte	0x1a
	.4byte	0x76
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.ascii	"dir\000"
	.byte	0x70
	.byte	0x23
	.4byte	0x76
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x3
	.4byte	.LASF75
	.byte	0x6a
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x55e
	.uleb128 0x4
	.4byte	.LASF66
	.byte	0x6a
	.byte	0x11
	.4byte	0x76
	.4byte	.LLST13
	.byte	0
	.uleb128 0x3
	.4byte	.LASF76
	.byte	0x63
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x593
	.uleb128 0x4
	.4byte	.LASF66
	.byte	0x63
	.byte	0x10
	.4byte	0x76
	.4byte	.LLST12
	.uleb128 0x9
	.ascii	"st\000"
	.byte	0x63
	.byte	0x23
	.4byte	0x422
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x3
	.4byte	.LASF77
	.byte	0x5c
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5bc
	.uleb128 0x4
	.4byte	.LASF66
	.byte	0x5c
	.byte	0x10
	.4byte	0x76
	.4byte	.LLST11
	.byte	0
	.uleb128 0x3
	.4byte	.LASF78
	.byte	0x50
	.byte	0x1b
	.4byte	0x76
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x61a
	.uleb128 0x4
	.4byte	.LASF66
	.byte	0x50
	.byte	0x26
	.4byte	0x76
	.4byte	.LLST7
	.uleb128 0x6
	.ascii	"ptr\000"
	.byte	0x50
	.byte	0x32
	.4byte	0x103
	.4byte	.LLST8
	.uleb128 0x6
	.ascii	"len\000"
	.byte	0x50
	.byte	0x3b
	.4byte	0x76
	.4byte	.LLST9
	.uleb128 0xf
	.4byte	.LASF80
	.byte	0x53
	.4byte	0x76
	.4byte	.LLST10
	.uleb128 0x7
	.4byte	.LVL16
	.4byte	0x306
	.byte	0
	.uleb128 0x3
	.4byte	.LASF79
	.byte	0x43
	.byte	0x1b
	.4byte	0x76
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x678
	.uleb128 0x4
	.4byte	.LASF66
	.byte	0x43
	.byte	0x25
	.4byte	0x76
	.4byte	.LLST3
	.uleb128 0x6
	.ascii	"ptr\000"
	.byte	0x43
	.byte	0x31
	.4byte	0x103
	.4byte	.LLST4
	.uleb128 0x6
	.ascii	"len\000"
	.byte	0x43
	.byte	0x3a
	.4byte	0x76
	.4byte	.LLST5
	.uleb128 0xf
	.4byte	.LASF80
	.byte	0x46
	.4byte	0x76
	.4byte	.LLST6
	.uleb128 0x7
	.4byte	.LVL7
	.4byte	0x31c
	.byte	0
	.uleb128 0x18
	.4byte	.LASF86
	.byte	0x1
	.byte	0x3d
	.byte	0x6
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6b5
	.uleb128 0x4
	.4byte	.LASF70
	.byte	0x3d
	.byte	0x11
	.4byte	0x76
	.4byte	.LLST2
	.uleb128 0x19
	.4byte	.LVL3
	.4byte	0x6b5
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	.LASF81
	.byte	0x35
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6f6
	.uleb128 0x6
	.ascii	"pid\000"
	.byte	0x35
	.byte	0xf
	.4byte	0x76
	.4byte	.LLST0
	.uleb128 0x6
	.ascii	"sig\000"
	.byte	0x35
	.byte	0x18
	.4byte	0x76
	.4byte	.LLST1
	.uleb128 0x7
	.4byte	.LVL1
	.4byte	0x328
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF87
	.byte	0x1
	.byte	0x30
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LASF88
	.byte	0x1
	.byte	0x2c
	.byte	0x6
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x4
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.sleb128 7
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
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
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x1a
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
.LLST22:
	.byte	0x6
	.4byte	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL40-1-.LVL39
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL40-1-.LVL39
	.uleb128 .LFE42-.LVL39
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST23:
	.byte	0x6
	.4byte	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL40-1-.LVL39
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL40-1-.LVL39
	.uleb128 .LFE42-.LVL39
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST24:
	.byte	0x6
	.4byte	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL40-1-.LVL39
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL40-1-.LVL39
	.uleb128 .LFE42-.LVL39
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST20:
	.byte	0x6
	.4byte	.LVL36
	.byte	0x4
	.uleb128 .LVL36-.LVL36
	.uleb128 .LVL37-1-.LVL36
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL37-1-.LVL36
	.uleb128 .LFE40-.LVL36
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST21:
	.byte	0x6
	.4byte	.LVL36
	.byte	0x4
	.uleb128 .LVL36-.LVL36
	.uleb128 .LVL37-1-.LVL36
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL37-1-.LVL36
	.uleb128 .LFE40-.LVL36
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL34
	.byte	0x4
	.uleb128 .LVL34-.LVL34
	.uleb128 .LVL35-.LVL34
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL35-.LVL34
	.uleb128 .LFE39-.LVL34
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST18:
	.byte	0x6
	.4byte	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL33-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL33-.LVL32
	.uleb128 .LFE38-.LVL32
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x6
	.4byte	.LVL30
	.byte	0x4
	.uleb128 .LVL30-.LVL30
	.uleb128 .LVL31-1-.LVL30
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL31-1-.LVL30
	.uleb128 .LFE37-.LVL30
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST16:
	.byte	0x6
	.4byte	.LVL28
	.byte	0x4
	.uleb128 .LVL28-.LVL28
	.uleb128 .LVL29-1-.LVL28
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL29-1-.LVL28
	.uleb128 .LFE36-.LVL28
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x6
	.4byte	.LVL26
	.byte	0x4
	.uleb128 .LVL26-.LVL26
	.uleb128 .LVL27-.LVL26
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL27-.LVL26
	.uleb128 .LFE35-.LVL26
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST14:
	.byte	0x6
	.4byte	.LVL24
	.byte	0x4
	.uleb128 .LVL24-.LVL24
	.uleb128 .LVL25-.LVL24
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL25-.LVL24
	.uleb128 .LFE34-.LVL24
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL23-.LVL22
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL23-.LVL22
	.uleb128 .LFE33-.LVL22
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST12:
	.byte	0x6
	.4byte	.LVL20
	.byte	0x4
	.uleb128 .LVL20-.LVL20
	.uleb128 .LVL21-.LVL20
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL21-.LVL20
	.uleb128 .LFE32-.LVL20
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x6
	.4byte	.LVL18
	.byte	0x4
	.uleb128 .LVL18-.LVL18
	.uleb128 .LVL19-.LVL18
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL19-.LVL18
	.uleb128 .LFE31-.LVL18
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL12
	.byte	0x4
	.uleb128 .LVL12-.LVL12
	.uleb128 .LVL14-.LVL12
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL14-.LVL12
	.uleb128 .LFE30-.LVL12
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL12
	.byte	0x4
	.uleb128 .LVL12-.LVL12
	.uleb128 .LVL14-.LVL12
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL14-.LVL12
	.uleb128 .LVL15-.LVL12
	.uleb128 0x3
	.byte	0x74
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL12
	.uleb128 .LFE30-.LVL12
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL12
	.byte	0x4
	.uleb128 .LVL12-.LVL12
	.uleb128 .LVL14-.LVL12
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL14-.LVL12
	.uleb128 .LFE30-.LVL12
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL13
	.byte	0x4
	.uleb128 .LVL13-.LVL13
	.uleb128 .LVL14-.LVL13
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL13
	.uleb128 .LFE30-.LVL13
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL6-.LVL4
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL6-.LVL4
	.uleb128 .LFE29-.LVL4
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL7-1-.LVL4
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL7-1-.LVL4
	.uleb128 .LVL8-.LVL4
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL8-.LVL4
	.uleb128 .LVL9-.LVL4
	.uleb128 0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL9-.LVL4
	.uleb128 .LFE29-.LVL4
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL6-.LVL4
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL6-.LVL4
	.uleb128 .LFE29-.LVL4
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL5
	.byte	0x4
	.uleb128 .LVL5-.LVL5
	.uleb128 .LVL6-.LVL5
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL5
	.uleb128 .LFE29-.LVL5
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL2
	.byte	0x4
	.uleb128 .LVL2-.LVL2
	.uleb128 .LVL3-1-.LVL2
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-1-.LVL2
	.uleb128 .LFE28-.LVL2
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
	.uleb128 .LVL1-1-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL1-1-.LVL0
	.uleb128 .LFE27-.LVL0
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
	.uleb128 .LVL1-1-.LVL0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL1-1-.LVL0
	.uleb128 .LFE27-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0xa4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
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
.LLRL25:
	.byte	0x7
	.4byte	.LFB25
	.uleb128 .LFE25-.LFB25
	.byte	0x7
	.4byte	.LFB26
	.uleb128 .LFE26-.LFB26
	.byte	0x7
	.4byte	.LFB27
	.uleb128 .LFE27-.LFB27
	.byte	0x7
	.4byte	.LFB28
	.uleb128 .LFE28-.LFB28
	.byte	0x7
	.4byte	.LFB29
	.uleb128 .LFE29-.LFB29
	.byte	0x7
	.4byte	.LFB30
	.uleb128 .LFE30-.LFB30
	.byte	0x7
	.4byte	.LFB31
	.uleb128 .LFE31-.LFB31
	.byte	0x7
	.4byte	.LFB32
	.uleb128 .LFE32-.LFB32
	.byte	0x7
	.4byte	.LFB33
	.uleb128 .LFE33-.LFB33
	.byte	0x7
	.4byte	.LFB34
	.uleb128 .LFE34-.LFB34
	.byte	0x7
	.4byte	.LFB35
	.uleb128 .LFE35-.LFB35
	.byte	0x7
	.4byte	.LFB36
	.uleb128 .LFE36-.LFB36
	.byte	0x7
	.4byte	.LFB37
	.uleb128 .LFE37-.LFB37
	.byte	0x7
	.4byte	.LFB38
	.uleb128 .LFE38-.LFB38
	.byte	0x7
	.4byte	.LFB39
	.uleb128 .LFE39-.LFB39
	.byte	0x7
	.4byte	.LFB40
	.uleb128 .LFE40-.LFB40
	.byte	0x7
	.4byte	.LFB41
	.uleb128 .LFE41-.LFB41
	.byte	0x7
	.4byte	.LFB42
	.uleb128 .LFE42-.LFB42
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF44:
	.ascii	"st_rdev\000"
.LASF28:
	.ascii	"clock_t\000"
.LASF57:
	.ascii	"environ\000"
.LASF32:
	.ascii	"uid_t\000"
.LASF74:
	.ascii	"_lseek\000"
.LASF14:
	.ascii	"_off_t\000"
.LASF54:
	.ascii	"tms_cutime\000"
.LASF62:
	.ascii	"_execve\000"
.LASF24:
	.ascii	"tv_sec\000"
.LASF84:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF27:
	.ascii	"blksize_t\000"
.LASF65:
	.ascii	"_stat\000"
.LASF48:
	.ascii	"st_ctim\000"
.LASF56:
	.ascii	"__env\000"
.LASF86:
	.ascii	"_exit\000"
.LASF78:
	.ascii	"_write\000"
.LASF38:
	.ascii	"st_dev\000"
.LASF76:
	.ascii	"_fstat\000"
.LASF66:
	.ascii	"file\000"
.LASF81:
	.ascii	"_kill\000"
.LASF23:
	.ascii	"time_t\000"
.LASF2:
	.ascii	"short int\000"
.LASF9:
	.ascii	"__int_least64_t\000"
.LASF49:
	.ascii	"st_blksize\000"
.LASF88:
	.ascii	"initialise_monitor_handles\000"
.LASF6:
	.ascii	"long long int\000"
.LASF43:
	.ascii	"st_gid\000"
.LASF19:
	.ascii	"__mode_t\000"
.LASF29:
	.ascii	"ino_t\000"
.LASF55:
	.ascii	"tms_cstime\000"
.LASF67:
	.ascii	"_times\000"
.LASF21:
	.ascii	"__nlink_t\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF60:
	.ascii	"name\000"
.LASF31:
	.ascii	"dev_t\000"
.LASF69:
	.ascii	"_wait\000"
.LASF11:
	.ascii	"long double\000"
.LASF39:
	.ascii	"st_ino\000"
.LASF79:
	.ascii	"_read\000"
.LASF58:
	.ascii	"__io_getchar\000"
.LASF25:
	.ascii	"tv_nsec\000"
.LASF0:
	.ascii	"signed char\000"
.LASF73:
	.ascii	"flags\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF34:
	.ascii	"mode_t\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF41:
	.ascii	"st_nlink\000"
.LASF71:
	.ascii	"_open\000"
.LASF61:
	.ascii	"argv\000"
.LASF13:
	.ascii	"__blksize_t\000"
.LASF46:
	.ascii	"st_atim\000"
.LASF64:
	.ascii	"_link\000"
.LASF82:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF70:
	.ascii	"status\000"
.LASF33:
	.ascii	"gid_t\000"
.LASF77:
	.ascii	"_close\000"
.LASF22:
	.ascii	"char\000"
.LASF4:
	.ascii	"long int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF35:
	.ascii	"nlink_t\000"
.LASF50:
	.ascii	"st_blocks\000"
.LASF75:
	.ascii	"_isatty\000"
.LASF47:
	.ascii	"st_mtim\000"
.LASF18:
	.ascii	"__ino_t\000"
.LASF53:
	.ascii	"tms_stime\000"
.LASF42:
	.ascii	"st_uid\000"
.LASF45:
	.ascii	"st_size\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF51:
	.ascii	"st_spare4\000"
.LASF85:
	.ascii	"__io_putchar\000"
.LASF80:
	.ascii	"DataIdx\000"
.LASF8:
	.ascii	"__uint32_t\000"
.LASF63:
	.ascii	"_fork\000"
.LASF30:
	.ascii	"off_t\000"
.LASF87:
	.ascii	"_getpid\000"
.LASF15:
	.ascii	"__dev_t\000"
.LASF20:
	.ascii	"__off_t\000"
.LASF26:
	.ascii	"blkcnt_t\000"
.LASF72:
	.ascii	"path\000"
.LASF36:
	.ascii	"timespec\000"
.LASF16:
	.ascii	"__uid_t\000"
.LASF83:
	.ascii	"D:/RTOS/Board/YD-STM32H7xxVx_ClassicV19/syscalls.c\000"
.LASF37:
	.ascii	"stat\000"
.LASF40:
	.ascii	"st_mode\000"
.LASF52:
	.ascii	"tms_utime\000"
.LASF68:
	.ascii	"_unlink\000"
.LASF12:
	.ascii	"__blkcnt_t\000"
.LASF59:
	.ascii	"__errno\000"
.LASF17:
	.ascii	"__gid_t\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
