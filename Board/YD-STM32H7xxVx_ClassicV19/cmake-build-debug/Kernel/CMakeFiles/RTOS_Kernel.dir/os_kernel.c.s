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
	.file	"os_kernel.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Kernel/os_kernel.c"
	.section	.text.os_kernel_init,"ax",%progbits
	.align	1
	.global	os_kernel_init
	.syntax unified
	.thumb
	.thumb_func
	.type	os_kernel_init, %function
os_kernel_init:
.LFB45:
	.loc 1 5 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 6 5
	bl	os_memory_init
.LVL0:
	.loc 1 8 5
	bl	os_priority_init
.LVL1:
	.loc 1 10 5
	bl	os_timer_init
.LVL2:
	.loc 1 12 5
	bl	os_interrupt_init
.LVL3:
	.loc 1 14 5
	bl	os_scheduler_init
.LVL4:
	.loc 1 16 5
	bl	os_idle_init
.LVL5:
	.loc 1 18 5
	.loc 1 19 1 is_stmt 0
	movs	r0, #0
	pop	{r3, pc}
	.cfi_endproc
.LFE45:
	.size	os_kernel_init, .-os_kernel_init
	.section	.text.os_kernel_startup,"ax",%progbits
	.align	1
	.global	os_kernel_startup
	.syntax unified
	.thumb
	.thumb_func
	.type	os_kernel_startup, %function
os_kernel_startup:
.LFB46:
	.loc 1 22 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 23 5
	.loc 1 23 12 is_stmt 0
	bl	os_scheduler_startup
.LVL6:
	.loc 1 24 1
	pop	{r3, pc}
	.cfi_endproc
.LFE46:
	.size	os_kernel_startup, .-os_kernel_startup
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "D:/RTOS/Kernel/os_types.h"
	.file 5 "D:/RTOS/Kernel/os_errors.h"
	.file 6 "D:/RTOS/Kernel/os_scheduler.h"
	.file 7 "D:/RTOS/Kernel/os_idle.h"
	.file 8 "D:/RTOS/Kernel/os_timer.h"
	.file 9 "D:/RTOS/Kernel/os_memory.h"
	.file 10 "D:/RTOS/Kernel/os_priority.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x175
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x1d
	.4byte	.LASF22
	.4byte	.LASF23
	.4byte	.LLRL0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x2
	.byte	0x4d
	.byte	0x12
	.4byte	0x4e
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
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
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x3
	.byte	0x2c
	.byte	0x13
	.4byte	0x42
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x4
	.byte	0x51
	.byte	0x11
	.4byte	0x78
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x5
	.byte	0xc
	.byte	0x12
	.4byte	0x8b
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x6
	.byte	0x27
	.4byte	0x97
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x7
	.byte	0xf
	.4byte	0x97
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x6
	.byte	0x21
	.4byte	0x97
	.uleb128 0x5
	.4byte	.LASF20
	.4byte	0x6a
	.4byte	0xda
	.uleb128 0x6
	.byte	0
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x8
	.byte	0x37
	.4byte	0x97
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0xa
	.byte	0x21
	.byte	0x6
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x9
	.byte	0x15
	.4byte	0x97
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x1
	.byte	0x15
	.byte	0xa
	.4byte	0x97
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11c
	.uleb128 0x2
	.4byte	.LVL6
	.4byte	0xaa
	.byte	0
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x1
	.byte	0x4
	.byte	0xa
	.4byte	0x97
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF20
	.4byte	0x6a
	.4byte	0x141
	.uleb128 0x6
	.byte	0
	.uleb128 0x2
	.4byte	.LVL0
	.4byte	0xed
	.uleb128 0x2
	.4byte	.LVL1
	.4byte	0xe5
	.uleb128 0x2
	.4byte	.LVL2
	.4byte	0xda
	.uleb128 0x2
	.4byte	.LVL3
	.4byte	0xcb
	.uleb128 0x2
	.4byte	.LVL4
	.4byte	0xc0
	.uleb128 0x2
	.4byte	.LVL5
	.4byte	0xb5
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
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.sleb128 10
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0xb
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
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
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
.LLRL0:
	.byte	0x7
	.4byte	.LFB45
	.uleb128 .LFE45-.LFB45
	.byte	0x7
	.4byte	.LFB46
	.uleb128 .LFE46-.LFB46
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF6:
	.ascii	"long long int\000"
.LASF18:
	.ascii	"os_timer_init\000"
.LASF26:
	.ascii	"os_kernel_init\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF25:
	.ascii	"os_kernel_startup\000"
.LASF16:
	.ascii	"os_idle_init\000"
.LASF19:
	.ascii	"os_memory_init\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF15:
	.ascii	"os_scheduler_startup\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF17:
	.ascii	"os_scheduler_init\000"
.LASF14:
	.ascii	"char\000"
.LASF20:
	.ascii	"os_interrupt_init\000"
.LASF24:
	.ascii	"os_priority_init\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF23:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF4:
	.ascii	"long int\000"
.LASF21:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions\000"
.LASF13:
	.ascii	"os_err_t\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF12:
	.ascii	"os_int_t\000"
.LASF9:
	.ascii	"__int32_t\000"
.LASF11:
	.ascii	"long double\000"
.LASF2:
	.ascii	"short int\000"
.LASF22:
	.ascii	"D:/RTOS/Kernel/os_kernel.c\000"
.LASF10:
	.ascii	"int32_t\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
