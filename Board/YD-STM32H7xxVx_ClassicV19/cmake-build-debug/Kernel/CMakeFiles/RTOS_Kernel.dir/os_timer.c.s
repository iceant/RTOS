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
	.file	"os_timer.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/Kernel/os_timer.c"
	.section	.text.os_timer__add,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	os_timer__add, %function
os_timer__add:
.LFB45:
	.loc 1 35 46
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 36 5
	.loc 1 37 5
	.loc 1 37 13 is_stmt 0
	ldr	r3, [r0, #20]
	.loc 1 37 7
	cmp	r3, #255
	bls	.L3
	.loc 1 39 11 is_stmt 1
	.loc 1 39 13 is_stmt 0
	cmp	r3, #16384
	bcc	.L4
	.loc 1 41 11 is_stmt 1
	.loc 1 41 13 is_stmt 0
	cmp	r3, #1048576
	bcc	.L5
	.loc 1 43 11 is_stmt 1
	.loc 1 43 13 is_stmt 0
	cmp	r3, #67108864
	bcs	.L6
	.loc 1 44 14
	ldr	r3, .L7
	b	.L2
.L3:
	.loc 1 38 14
	ldr	r3, .L7+4
.L2:
.LVL1:
	.loc 1 48 5 is_stmt 1
	.loc 1 48 9
	.loc 1 48 29 is_stmt 0
	ldr	r1, [r0]
	.loc 1 48 64
	ldr	r2, [r0, #4]
	.loc 1 48 43
	str	r2, [r1, #4]
	.loc 1 48 72 is_stmt 1
	.loc 1 48 127 is_stmt 0
	ldr	r1, [r0]
	.loc 1 48 106
	str	r1, [r2]
	.loc 1 48 135 is_stmt 1
	.loc 1 48 189 is_stmt 0
	str	r0, [r0]
	.loc 1 48 161
	str	r0, [r0, #4]
	.loc 1 48 7 is_stmt 1
	.loc 1 49 5
	.loc 1 49 9
	.loc 1 49 16 is_stmt 0
	ldr	r2, [r3]
	.loc 1 49 30
	str	r0, [r2, #4]
	.loc 1 49 53 is_stmt 1
	.loc 1 49 87 is_stmt 0
	ldr	r2, [r3]
	.loc 1 49 79
	str	r2, [r0]
	.loc 1 49 95 is_stmt 1
	.loc 1 49 108 is_stmt 0
	str	r0, [r3]
	.loc 1 49 131 is_stmt 1
	.loc 1 49 157 is_stmt 0
	str	r3, [r0, #4]
	.loc 1 49 7 is_stmt 1
	.loc 1 50 1 is_stmt 0
	bx	lr
.LVL2:
.L4:
	.loc 1 40 14
	ldr	r3, .L7+8
	b	.L2
.L5:
	.loc 1 42 14
	ldr	r3, .L7+12
	b	.L2
.L6:
	.loc 1 46 14
	ldr	r3, .L7+16
	b	.L2
.L8:
	.align	2
.L7:
	.word	os_timer__tv+16
	.word	os_timer__tvroot
	.word	os_timer__tv
	.word	os_timer__tv+8
	.word	os_timer__tv+24
	.cfi_endproc
.LFE45:
	.size	os_timer__add, .-os_timer__add
	.section	.text.os_timer_init,"ax",%progbits
	.align	1
	.global	os_timer_init
	.syntax unified
	.thumb
	.thumb_func
	.type	os_timer_init, %function
os_timer_init:
.LFB46:
	.loc 1 64 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 65 5
	.loc 1 66 5
	.loc 1 66 28 is_stmt 0
	movs	r3, #0
	ldr	r2, .L12
	str	r3, [r2]
	.loc 1 67 5 is_stmt 1
	.loc 1 67 9
	.loc 1 67 63 is_stmt 0
	ldr	r2, .L12+4
	str	r2, [r2]
	.loc 1 67 35
	str	r2, [r2, #4]
	.loc 1 67 7 is_stmt 1
	.loc 1 68 5
.LVL3:
	b	.L10
.LVL4:
.L11:
	.loc 1 69 9 discriminator 3
	.loc 1 69 13 discriminator 3
	.loc 1 69 68 is_stmt 0 discriminator 3
	ldr	r1, .L12+8
	add	r2, r1, r3, lsl #3
	.loc 1 69 65 discriminator 3
	str	r2, [r1, r3, lsl #3]
	.loc 1 69 38 discriminator 3
	str	r2, [r2, #4]
	.loc 1 69 11 is_stmt 1 discriminator 3
	.loc 1 68 68 discriminator 3
	adds	r3, r3, #1
.LVL5:
.L10:
	.loc 1 68 15 discriminator 1
	cmp	r3, #3
	bls	.L11
	.loc 1 71 5
.LVL6:
.LBB96:
.LBB97:
	.file 2 "D:/RTOS/CPU/ARM_CortexM4/cpu_lock.h"
	.loc 2 26 5
	.loc 2 26 11 is_stmt 0
	movs	r0, #0
	ldr	r3, .L12+12
.LVL7:
	str	r0, [r3]
.LVL8:
.LBE97:
.LBE96:
	.loc 1 72 5 is_stmt 1
	.loc 1 73 1 is_stmt 0
	bx	lr
.L13:
	.align	2
.L12:
	.word	os_timer__current_tick
	.word	os_timer__tvroot
	.word	os_timer__tv
	.word	os_timer__lock
	.cfi_endproc
.LFE46:
	.size	os_timer_init, .-os_timer_init
	.section	.text.os_timer_add,"ax",%progbits
	.align	1
	.global	os_timer_add
	.syntax unified
	.thumb
	.thumb_func
	.type	os_timer_add, %function
os_timer_add:
.LFB47:
	.loc 1 76 1 is_stmt 1
	.cfi_startproc
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL9:
	push	{r3, r4, r5, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	.loc 1 77 5
.LVL10:
.LBB98:
.LBB99:
	.loc 2 30 5
.LBB100:
.LBB101:
	.file 3 "D:/RTOS/CPU/ARM_CortexM4/cpu_interrupt.h"
	.loc 3 19 5
	.loc 3 20 5
.LBB102:
.LBB103:
	.file 4 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h"
	.loc 4 165 5
	.loc 4 167 5
	.syntax unified
@ 167 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	MRS r5, primask
@ 0 "" 2
.LVL11:
	.loc 4 168 5
	.thumb
	.syntax unified
.LBE103:
.LBE102:
	.loc 3 21 5
.LBB104:
.LBB105:
	.loc 4 41 5
	.syntax unified
@ 41 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	cpsid i
@ 0 "" 2
	.thumb
	.syntax unified
.LBE105:
.LBE104:
	.loc 3 22 5
.LBB106:
.LBB107:
	.loc 4 335 5
	.syntax unified
@ 335 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	isb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE107:
.LBE106:
	.loc 3 23 5
.LBB108:
.LBB109:
	.loc 4 357 5
	.syntax unified
@ 357 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dmb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE109:
.LBE108:
	.loc 3 24 5
.LBE101:
.LBE100:
	.loc 2 30 11 is_stmt 0
	ldr	r4, .L16
	str	r5, [r4]
.LVL12:
.LBE99:
.LBE98:
	.loc 1 77 36 is_stmt 1
	.loc 1 79 5
	.loc 1 79 20 is_stmt 0
	str	r1, [r0, #8]
	.loc 1 80 5 is_stmt 1
	.loc 1 80 21 is_stmt 0
	str	r2, [r0, #12]
	.loc 1 81 5 is_stmt 1
	.loc 1 81 18 is_stmt 0
	str	r3, [r0, #16]
	.loc 1 82 5 is_stmt 1
	.loc 1 82 49 is_stmt 0
	ldr	r2, .L16+4
.LVL13:
	ldr	r2, [r2]
	add	r3, r3, r2
.LVL14:
	.loc 1 82 24
	str	r3, [r0, #20]
	.loc 1 83 5 is_stmt 1
	.loc 1 83 18 is_stmt 0
	ldr	r3, [sp, #16]
	str	r3, [r0, #24]
	.loc 1 85 5 is_stmt 1
	bl	os_timer__add
.LVL15:
	.loc 1 87 5
.LBB110:
.LBB111:
	.loc 2 34 5
	ldr	r3, [r4]
.LVL16:
.LBB112:
	.loc 3 28 5
.LBB113:
.LBB114:
	.loc 4 179 5
	.syntax unified
@ 179 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	MSR primask, r3
@ 0 "" 2
.LVL17:
	.thumb
	.syntax unified
.LBE114:
.LBE113:
	.loc 3 29 5
.LBB115:
.LBB116:
	.loc 4 335 5
	.syntax unified
@ 335 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	isb 0xF
@ 0 "" 2
.LVL18:
	.thumb
	.syntax unified
.LBE116:
.LBE115:
.LBE112:
.LBE111:
.LBE110:
	.loc 1 87 38
	.loc 1 89 5
	.loc 1 90 1 is_stmt 0
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.LVL19:
.L17:
	.align	2
.L16:
	.word	os_timer__lock
	.word	os_timer__current_tick
	.cfi_endproc
.LFE47:
	.size	os_timer_add, .-os_timer_add
	.section	.text.os_timer_remove,"ax",%progbits
	.align	1
	.global	os_timer_remove
	.syntax unified
	.thumb
	.thumb_func
	.type	os_timer_remove, %function
os_timer_remove:
.LFB48:
	.loc 1 93 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL20:
	.loc 1 94 5
.LBB117:
.LBB118:
	.loc 2 30 5
.LBB119:
.LBB120:
	.loc 3 19 5
	.loc 3 20 5
.LBB121:
.LBB122:
	.loc 4 165 5
	.loc 4 167 5
	.syntax unified
@ 167 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	MRS r2, primask
@ 0 "" 2
.LVL21:
	.loc 4 168 5
	.thumb
	.syntax unified
.LBE122:
.LBE121:
	.loc 3 21 5
.LBB123:
.LBB124:
	.loc 4 41 5
	.syntax unified
@ 41 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	cpsid i
@ 0 "" 2
	.thumb
	.syntax unified
.LBE124:
.LBE123:
	.loc 3 22 5
.LBB125:
.LBB126:
	.loc 4 335 5
	.syntax unified
@ 335 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	isb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE126:
.LBE125:
	.loc 3 23 5
.LBB127:
.LBB128:
	.loc 4 357 5
	.syntax unified
@ 357 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dmb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE128:
.LBE127:
	.loc 3 24 5
.LBE120:
.LBE119:
	.loc 2 30 11 is_stmt 0
	ldr	r3, .L19
	str	r2, [r3]
.LVL22:
.LBE118:
.LBE117:
	.loc 1 94 36 is_stmt 1
	.loc 1 95 5
	.loc 1 95 9
	.loc 1 95 29 is_stmt 0
	ldr	r1, [r0]
	.loc 1 95 64
	ldr	r2, [r0, #4]
.LVL23:
	.loc 1 95 43
	str	r2, [r1, #4]
	.loc 1 95 72 is_stmt 1
	.loc 1 95 127 is_stmt 0
	ldr	r1, [r0]
	.loc 1 95 106
	str	r1, [r2]
.LVL24:
	.loc 1 95 135 is_stmt 1
	.loc 1 95 189 is_stmt 0
	str	r0, [r0]
	.loc 1 95 161
	str	r0, [r0, #4]
	.loc 1 95 7 is_stmt 1
	.loc 1 96 5
.LVL25:
.LBB129:
.LBB130:
	.loc 2 34 5
	ldr	r3, [r3]
.LVL26:
.LBB131:
	.loc 3 28 5
.LBB132:
.LBB133:
	.loc 4 179 5
	.syntax unified
@ 179 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	MSR primask, r3
@ 0 "" 2
.LVL27:
	.thumb
	.syntax unified
.LBE133:
.LBE132:
	.loc 3 29 5
.LBB134:
.LBB135:
	.loc 4 335 5
	.syntax unified
@ 335 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	isb 0xF
@ 0 "" 2
.LVL28:
	.thumb
	.syntax unified
.LBE135:
.LBE134:
.LBE131:
.LBE130:
.LBE129:
	.loc 1 96 38
	.loc 1 98 5
	.loc 1 99 1 is_stmt 0
	movs	r0, #0
.LVL29:
	bx	lr
.L20:
	.align	2
.L19:
	.word	os_timer__lock
	.cfi_endproc
.LFE48:
	.size	os_timer_remove, .-os_timer_remove
	.section	.text.os_timer_tick,"ax",%progbits
	.align	1
	.global	os_timer_tick
	.syntax unified
	.thumb
	.thumb_func
	.type	os_timer_tick, %function
os_timer_tick:
.LFB49:
	.loc 1 101 29 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	.loc 1 102 5
.LVL30:
.LBB136:
.LBB137:
	.loc 2 30 5
.LBB138:
.LBB139:
	.loc 3 19 5
	.loc 3 20 5
.LBB140:
.LBB141:
	.loc 4 165 5
	.loc 4 167 5
	.syntax unified
@ 167 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	MRS r2, primask
@ 0 "" 2
.LVL31:
	.loc 4 168 5
	.thumb
	.syntax unified
.LBE141:
.LBE140:
	.loc 3 21 5
.LBB142:
.LBB143:
	.loc 4 41 5
	.syntax unified
@ 41 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	cpsid i
@ 0 "" 2
	.thumb
	.syntax unified
.LBE143:
.LBE142:
	.loc 3 22 5
.LBB144:
.LBB145:
	.loc 4 335 5
	.syntax unified
@ 335 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	isb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE145:
.LBE144:
	.loc 3 23 5
.LBB146:
.LBB147:
	.loc 4 357 5
	.syntax unified
@ 357 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	dmb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.LBE147:
.LBE146:
	.loc 3 24 5
.LBE139:
.LBE138:
	.loc 2 30 11 is_stmt 0
	ldr	r3, .L38
	str	r2, [r3]
.LVL32:
.LBE137:
.LBE136:
	.loc 1 102 36 is_stmt 1
	.loc 1 104 5
	.loc 1 105 5
	.loc 1 106 5
	.loc 1 107 5
	.loc 1 108 5
	.loc 1 110 5
	.loc 1 110 27 is_stmt 0
	ldr	r3, .L38+4
	ldr	r5, [r3]
	adds	r5, r5, #1
	str	r5, [r3]
	.loc 1 112 5 is_stmt 1
.LVL33:
	.loc 1 114 5
	.loc 1 114 7 is_stmt 0
	cmp	r5, #255
	bls	.L29
	.loc 1 116 11 is_stmt 1
	.loc 1 116 13 is_stmt 0
	cmp	r5, #16384
	bcc	.L30
	.loc 1 118 11 is_stmt 1
	.loc 1 118 13 is_stmt 0
	cmp	r5, #1048576
	bcc	.L31
	.loc 1 120 11 is_stmt 1
	.loc 1 120 13 is_stmt 0
	cmp	r5, #67108864
	bcs	.L32
	.loc 1 121 14
	ldr	r7, .L38+8
	b	.L22
.L29:
	.loc 1 115 14
	ldr	r7, .L38+12
.L22:
.LVL34:
	.loc 1 126 5 is_stmt 1
	.loc 1 126 15 is_stmt 0
	ldr	r4, [r7, #4]
	.loc 1 126 7
	cmp	r4, r7
	beq	.L35
	.loc 1 104 23
	movs	r0, #0
	b	.L23
.LVL35:
.L30:
	.loc 1 117 14
	ldr	r7, .L38+16
	b	.L22
.L31:
	.loc 1 119 14
	ldr	r7, .L38+20
	b	.L22
.L32:
	.loc 1 123 14
	ldr	r7, .L38+24
	b	.L22
.LVL36:
.L35:
	.loc 1 127 9 is_stmt 1
.LBB148:
.LBB149:
	.loc 2 34 5
	ldr	r3, .L38
	ldr	r3, [r3]
.LVL37:
.LBB150:
	.loc 3 28 5
.LBB151:
.LBB152:
	.loc 4 179 5
	.syntax unified
@ 179 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	MSR primask, r3
@ 0 "" 2
.LVL38:
	.thumb
	.syntax unified
.LBE152:
.LBE151:
	.loc 3 29 5
.LBB153:
.LBB154:
	.loc 4 335 5
	.syntax unified
@ 335 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	isb 0xF
@ 0 "" 2
.LVL39:
	.thumb
	.syntax unified
.LBE154:
.LBE153:
.LBE150:
.LBE149:
.LBE148:
	.loc 1 127 42
	.loc 1 128 9
	.loc 1 128 16 is_stmt 0
	movs	r0, #0
	b	.L24
.LVL40:
.L37:
	.loc 1 140 17 is_stmt 1
	.loc 1 140 58 is_stmt 0
	ldr	r3, [r4, #16]
	.loc 1 140 51
	add	r3, r3, r5
	.loc 1 140 36
	str	r3, [r4, #20]
	.loc 1 141 17 is_stmt 1
	mov	r0, r4
	bl	os_timer__add
.LVL41:
	.loc 1 135 26 is_stmt 0
	movs	r0, #1
.LVL42:
.L25:
	.loc 1 135 26 discriminator 1
	mov	r4, r6
.LVL43:
.L23:
	.loc 1 143 19 is_stmt 1 discriminator 1
	.loc 1 131 34 discriminator 1
	cmp	r7, r4
	beq	.L36
	.loc 1 132 9
.LVL44:
	.loc 1 133 9
	.loc 1 133 14 is_stmt 0
	ldr	r6, [r4, #4]
.LVL45:
	.loc 1 134 9 is_stmt 1
	.loc 1 134 17 is_stmt 0
	ldr	r3, [r4, #20]
	.loc 1 134 11
	cmp	r5, r3
	bcc	.L25
	.loc 1 135 13 is_stmt 1
.LVL46:
	.loc 1 136 13
	.loc 1 136 21 is_stmt 0
	ldr	r3, [r4, #8]
	.loc 1 136 15
	cbz	r3, .L26
	.loc 1 137 17 is_stmt 1
	ldr	r1, [r4, #12]
	mov	r0, r4
	blx	r3
.LVL47:
.L26:
	.loc 1 139 13
	.loc 1 139 21 is_stmt 0
	ldr	r3, [r4, #24]
	.loc 1 139 15
	tst	r3, #2
	bne	.L37
	.loc 1 143 17 is_stmt 1 discriminator 1
	.loc 1 143 21 discriminator 1
	.loc 1 143 41 is_stmt 0 discriminator 1
	ldr	r2, [r4]
	.loc 1 143 76 discriminator 1
	ldr	r3, [r4, #4]
	.loc 1 143 55 discriminator 1
	str	r3, [r2, #4]
	.loc 1 143 84 is_stmt 1 discriminator 1
	.loc 1 143 139 is_stmt 0 discriminator 1
	ldr	r2, [r4]
	.loc 1 143 118 discriminator 1
	str	r2, [r3]
	.loc 1 143 147 is_stmt 1 discriminator 1
	.loc 1 143 201 is_stmt 0 discriminator 1
	str	r4, [r4]
	.loc 1 143 173 discriminator 1
	str	r4, [r4, #4]
	.loc 1 135 26 discriminator 1
	movs	r0, #1
	b	.L25
.LVL48:
.L36:
	.loc 1 148 5 is_stmt 1
.LBB155:
.LBB156:
	.loc 2 34 5
	ldr	r3, .L38
	ldr	r3, [r3]
.LVL49:
.LBB157:
	.loc 3 28 5
.LBB158:
.LBB159:
	.loc 4 179 5
	.syntax unified
@ 179 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	MSR primask, r3
@ 0 "" 2
.LVL50:
	.thumb
	.syntax unified
.LBE159:
.LBE158:
	.loc 3 29 5
.LBB160:
.LBB161:
	.loc 4 335 5
	.syntax unified
@ 335 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_functions.h" 1
	isb 0xF
@ 0 "" 2
.LVL51:
	.thumb
	.syntax unified
.LBE161:
.LBE160:
.LBE157:
.LBE156:
.LBE155:
	.loc 1 148 38
	.loc 1 150 5
.L24:
	.loc 1 152 1 is_stmt 0
	pop	{r3, r4, r5, r6, r7, pc}
.LVL52:
.L39:
	.align	2
.L38:
	.word	os_timer__lock
	.word	os_timer__current_tick
	.word	os_timer__tv+16
	.word	os_timer__tvroot
	.word	os_timer__tv
	.word	os_timer__tv+8
	.word	os_timer__tv+24
	.cfi_endproc
.LFE49:
	.size	os_timer_tick, .-os_timer_tick
	.section	.text.os_timer_node_init,"ax",%progbits
	.align	1
	.global	os_timer_node_init
	.syntax unified
	.thumb
	.thumb_func
	.type	os_timer_node_init, %function
os_timer_node_init:
.LFB50:
	.loc 1 156 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL53:
	mov	r3, r0
	.loc 1 157 5
	.loc 1 157 9
	.loc 1 157 63 is_stmt 0
	str	r0, [r0]
	.loc 1 157 35
	str	r0, [r0, #4]
	.loc 1 157 7 is_stmt 1
	.loc 1 158 5
	.loc 1 158 24 is_stmt 0
	movs	r0, #0
.LVL54:
	str	r0, [r3, #20]
	.loc 1 159 5 is_stmt 1
	.loc 1 159 18 is_stmt 0
	str	r0, [r3, #16]
	.loc 1 160 5 is_stmt 1
	.loc 1 160 18 is_stmt 0
	str	r0, [r3, #24]
	.loc 1 161 5 is_stmt 1
	.loc 1 161 21 is_stmt 0
	str	r0, [r3, #12]
	.loc 1 162 5 is_stmt 1
	.loc 1 162 20 is_stmt 0
	str	r0, [r3, #8]
	.loc 1 164 5 is_stmt 1
	.loc 1 165 1 is_stmt 0
	bx	lr
	.cfi_endproc
.LFE50:
	.size	os_timer_node_init, .-os_timer_node_init
	.section	.bss.os_timer__lock,"aw",%nobits
	.align	2
	.type	os_timer__lock, %object
	.size	os_timer__lock, 4
os_timer__lock:
	.space	4
	.section	.bss.os_timer__tv,"aw",%nobits
	.align	2
	.type	os_timer__tv, %object
	.size	os_timer__tv, 32
os_timer__tv:
	.space	32
	.section	.bss.os_timer__tvroot,"aw",%nobits
	.align	2
	.type	os_timer__tvroot, %object
	.size	os_timer__tvroot, 8
os_timer__tvroot:
	.space	8
	.section	.bss.os_timer__current_tick,"aw",%nobits
	.align	2
	.type	os_timer__current_tick, %object
	.size	os_timer__current_tick, 4
os_timer__current_tick:
	.space	4
	.text
.Letext0:
	.file 5 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 6 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 7 "D:/RTOS/CPU/ARM_CortexM4/cpu_types.h"
	.file 8 "D:/RTOS/Kernel/os_types.h"
	.file 9 "D:/RTOS/Kernel/os_errors.h"
	.file 10 "D:/RTOS/Kernel/os_list.h"
	.file 11 "D:/RTOS/Kernel/os_tick.h"
	.file 12 "D:/RTOS/Kernel/os_timer.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x7b8
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x17
	.4byte	.LASF64
	.byte	0x1d
	.4byte	.LASF65
	.4byte	.LASF66
	.4byte	.LLRL33
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
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x5
	.byte	0x4d
	.byte	0x12
	.4byte	0x4e
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x5
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
	.uleb128 0x18
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x6
	.byte	0x2c
	.byte	0x13
	.4byte	0x42
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x6
	.byte	0x30
	.byte	0x14
	.4byte	0x55
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.4byte	.LASF13
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x7
	.byte	0xf
	.byte	0x12
	.4byte	0x90
	.uleb128 0x19
	.4byte	0xa3
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x2
	.byte	0x17
	.byte	0x1d
	.4byte	0xaf
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x8
	.byte	0x51
	.byte	0x11
	.4byte	0x84
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x8
	.byte	0x52
	.byte	0x12
	.4byte	0x90
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x8
	.byte	0x6b
	.byte	0x13
	.4byte	0xcc
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x9
	.byte	0xc
	.byte	0x12
	.4byte	0xc0
	.uleb128 0x2
	.4byte	.LASF20
	.byte	0xa
	.byte	0x6
	.byte	0x1f
	.4byte	0xfc
	.uleb128 0x12
	.4byte	.LASF26
	.byte	0x8
	.byte	0xa
	.byte	0x9
	.4byte	0x123
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0xa
	.byte	0xa
	.byte	0x16
	.4byte	0x12f
	.byte	0
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0xa
	.byte	0xb
	.byte	0x16
	.4byte	0x12f
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0xa
	.byte	0x7
	.byte	0x1f
	.4byte	0xfc
	.uleb128 0xa
	.4byte	0xf0
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0xb
	.byte	0x10
	.byte	0x13
	.4byte	0xcc
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0xc
	.byte	0x1f
	.byte	0x1b
	.4byte	0x14c
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1c
	.byte	0xc
	.byte	0x23
	.4byte	0x1a7
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0xc
	.byte	0x24
	.byte	0x14
	.4byte	0xf0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0xc
	.byte	0x25
	.byte	0x18
	.4byte	0x1a7
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0xc
	.byte	0x26
	.byte	0xb
	.4byte	0x1cd
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0xc
	.byte	0x27
	.byte	0xf
	.4byte	0x134
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0xc
	.byte	0x28
	.byte	0xf
	.4byte	0x134
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF33
	.byte	0xc
	.byte	0x29
	.byte	0x9
	.4byte	0x76
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.4byte	.LASF34
	.byte	0xc
	.byte	0x21
	.byte	0x10
	.4byte	0x1b3
	.uleb128 0xa
	.4byte	0x1b8
	.uleb128 0x1a
	.4byte	0x1c8
	.uleb128 0x13
	.4byte	0x1c8
	.uleb128 0x13
	.4byte	0x1cd
	.byte	0
	.uleb128 0xa
	.4byte	0x140
	.uleb128 0x1b
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF35
	.byte	0x1d
	.byte	0x12
	.4byte	0x134
	.uleb128 0x5
	.byte	0x3
	.4byte	os_timer__current_tick
	.uleb128 0xe
	.4byte	.LASF36
	.byte	0x1e
	.byte	0x12
	.4byte	0x123
	.uleb128 0x5
	.byte	0x3
	.4byte	os_timer__tvroot
	.uleb128 0x1c
	.4byte	0x123
	.4byte	0x201
	.uleb128 0x1d
	.4byte	0x7d
	.byte	0x3
	.byte	0
	.uleb128 0xe
	.4byte	.LASF37
	.byte	0x1f
	.byte	0x12
	.4byte	0x1f1
	.uleb128 0x5
	.byte	0x3
	.4byte	os_timer__tv
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0x20
	.byte	0x13
	.4byte	0xb4
	.uleb128 0x5
	.byte	0x3
	.4byte	os_timer__lock
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x9b
	.4byte	0xe4
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24b
	.uleb128 0x8
	.4byte	.LASF45
	.byte	0x9b
	.byte	0x2a
	.4byte	0x1c8
	.4byte	.LLST32
	.byte	0
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x65
	.4byte	0x413
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x413
	.uleb128 0x9
	.4byte	.LASF41
	.byte	0x68
	.byte	0x17
	.4byte	0x413
	.4byte	.LLST19
	.uleb128 0x9
	.4byte	.LASF42
	.byte	0x69
	.byte	0x18
	.4byte	0x134
	.4byte	.LLST20
	.uleb128 0x9
	.4byte	.LASF43
	.byte	0x6a
	.byte	0x1a
	.4byte	0x41a
	.4byte	.LLST21
	.uleb128 0x9
	.4byte	.LASF44
	.byte	0x6b
	.byte	0x1f
	.4byte	0x12f
	.4byte	.LLST22
	.uleb128 0x9
	.4byte	.LASF45
	.byte	0x6c
	.byte	0x1b
	.4byte	0x1c8
	.4byte	.LLST23
	.uleb128 0x3
	.4byte	0x70a
	.4byte	.LBB136
	.4byte	.LBE136-.LBB136
	.byte	0x1
	.byte	0x66
	.byte	0x5
	.4byte	0x32a
	.uleb128 0x1
	.4byte	0x715
	.4byte	.LLST24
	.uleb128 0x6
	.4byte	0x752
	.4byte	.LBB138
	.4byte	.LBE138-.LBB138
	.byte	0x2
	.byte	0x1e
	.byte	0xd
	.uleb128 0xf
	.4byte	0x762
	.4byte	.LLST25
	.uleb128 0x3
	.4byte	0x795
	.4byte	.LBB140
	.4byte	.LBE140-.LBB140
	.byte	0x3
	.byte	0x14
	.byte	0xe
	.4byte	0x2fe
	.uleb128 0x10
	.4byte	0x7a5
	.byte	0
	.uleb128 0x4
	.4byte	0x7b2
	.4byte	.LBB142
	.4byte	.LBE142-.LBB142
	.byte	0x15
	.uleb128 0x4
	.4byte	0x776
	.4byte	.LBB144
	.4byte	.LBE144-.LBB144
	.byte	0x16
	.uleb128 0x4
	.4byte	0x76f
	.4byte	.LBB146
	.4byte	.LBE146-.LBB146
	.byte	0x17
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	0x6ed
	.4byte	.LBB148
	.4byte	.LBE148-.LBB148
	.byte	0x1
	.byte	0x7f
	.byte	0x9
	.4byte	0x38e
	.uleb128 0x1
	.4byte	0x6f8
	.4byte	.LLST26
	.uleb128 0x6
	.4byte	0x73a
	.4byte	.LBB150
	.4byte	.LBE150-.LBB150
	.byte	0x2
	.byte	0x22
	.byte	0x5
	.uleb128 0x1
	.4byte	0x745
	.4byte	.LLST27
	.uleb128 0x3
	.4byte	0x77d
	.4byte	.LBB151
	.4byte	.LBE151-.LBB151
	.byte	0x3
	.byte	0x1c
	.byte	0x5
	.4byte	0x37e
	.uleb128 0x1
	.4byte	0x788
	.4byte	.LLST28
	.byte	0
	.uleb128 0x4
	.4byte	0x776
	.4byte	.LBB153
	.4byte	.LBE153-.LBB153
	.byte	0x1d
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	0x6ed
	.4byte	.LBB155
	.4byte	.LBE155-.LBB155
	.byte	0x1
	.byte	0x94
	.byte	0x5
	.4byte	0x3f2
	.uleb128 0x1
	.4byte	0x6f8
	.4byte	.LLST29
	.uleb128 0x6
	.4byte	0x73a
	.4byte	.LBB157
	.4byte	.LBE157-.LBB157
	.byte	0x2
	.byte	0x22
	.byte	0x5
	.uleb128 0x1
	.4byte	0x745
	.4byte	.LLST30
	.uleb128 0x3
	.4byte	0x77d
	.4byte	.LBB158
	.4byte	.LBE158-.LBB158
	.byte	0x3
	.byte	0x1c
	.byte	0x5
	.4byte	0x3e2
	.uleb128 0x1
	.4byte	0x788
	.4byte	.LLST31
	.byte	0
	.uleb128 0x4
	.4byte	0x776
	.4byte	.LBB160
	.4byte	.LBE160-.LBB160
	.byte	0x1d
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL41
	.4byte	0x6b9
	.4byte	0x406
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL47
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.byte	0x2
	.4byte	.LASF46
	.uleb128 0xa
	.4byte	0x123
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x5c
	.4byte	0xe4
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x523
	.uleb128 0x8
	.4byte	.LASF45
	.byte	0x5c
	.byte	0x27
	.4byte	0x1c8
	.4byte	.LLST13
	.uleb128 0x3
	.4byte	0x70a
	.4byte	.LBB117
	.4byte	.LBE117-.LBB117
	.byte	0x1
	.byte	0x5e
	.byte	0x5
	.4byte	0x4c2
	.uleb128 0x1
	.4byte	0x715
	.4byte	.LLST14
	.uleb128 0x6
	.4byte	0x752
	.4byte	.LBB119
	.4byte	.LBE119-.LBB119
	.byte	0x2
	.byte	0x1e
	.byte	0xd
	.uleb128 0xf
	.4byte	0x762
	.4byte	.LLST15
	.uleb128 0x3
	.4byte	0x795
	.4byte	.LBB121
	.4byte	.LBE121-.LBB121
	.byte	0x3
	.byte	0x14
	.byte	0xe
	.4byte	0x496
	.uleb128 0x10
	.4byte	0x7a5
	.byte	0
	.uleb128 0x4
	.4byte	0x7b2
	.4byte	.LBB123
	.4byte	.LBE123-.LBB123
	.byte	0x15
	.uleb128 0x4
	.4byte	0x776
	.4byte	.LBB125
	.4byte	.LBE125-.LBB125
	.byte	0x16
	.uleb128 0x4
	.4byte	0x76f
	.4byte	.LBB127
	.4byte	.LBE127-.LBB127
	.byte	0x17
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	0x6ed
	.4byte	.LBB129
	.4byte	.LBE129-.LBB129
	.byte	0x1
	.byte	0x60
	.byte	0x5
	.uleb128 0x1
	.4byte	0x6f8
	.4byte	.LLST16
	.uleb128 0x6
	.4byte	0x73a
	.4byte	.LBB131
	.4byte	.LBE131-.LBB131
	.byte	0x2
	.byte	0x22
	.byte	0x5
	.uleb128 0x1
	.4byte	0x745
	.4byte	.LLST17
	.uleb128 0x3
	.4byte	0x77d
	.4byte	.LBB132
	.4byte	.LBE132-.LBB132
	.byte	0x3
	.byte	0x1c
	.byte	0x5
	.4byte	0x512
	.uleb128 0x1
	.4byte	0x788
	.4byte	.LLST18
	.byte	0
	.uleb128 0x4
	.4byte	0x776
	.4byte	.LBB134
	.4byte	.LBE134-.LBB134
	.byte	0x1d
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF48
	.byte	0x4b
	.4byte	0xe4
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x678
	.uleb128 0x8
	.4byte	.LASF45
	.byte	0x4b
	.byte	0x24
	.4byte	0x1c8
	.4byte	.LLST3
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x4b
	.byte	0x3e
	.4byte	0x1a7
	.4byte	.LLST4
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x4b
	.byte	0x4e
	.4byte	0x1cd
	.4byte	.LLST5
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0x4b
	.byte	0x62
	.4byte	0x134
	.4byte	.LLST6
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x4b
	.byte	0x6d
	.4byte	0x76
	.4byte	.LLST7
	.uleb128 0x3
	.4byte	0x70a
	.4byte	.LBB98
	.4byte	.LBE98-.LBB98
	.byte	0x1
	.byte	0x4d
	.byte	0x5
	.4byte	0x602
	.uleb128 0x1
	.4byte	0x715
	.4byte	.LLST8
	.uleb128 0x6
	.4byte	0x752
	.4byte	.LBB100
	.4byte	.LBE100-.LBB100
	.byte	0x2
	.byte	0x1e
	.byte	0xd
	.uleb128 0xf
	.4byte	0x762
	.4byte	.LLST9
	.uleb128 0x3
	.4byte	0x795
	.4byte	.LBB102
	.4byte	.LBE102-.LBB102
	.byte	0x3
	.byte	0x14
	.byte	0xe
	.4byte	0x5d6
	.uleb128 0x10
	.4byte	0x7a5
	.byte	0
	.uleb128 0x4
	.4byte	0x7b2
	.4byte	.LBB104
	.4byte	.LBE104-.LBB104
	.byte	0x15
	.uleb128 0x4
	.4byte	0x776
	.4byte	.LBB106
	.4byte	.LBE106-.LBB106
	.byte	0x16
	.uleb128 0x4
	.4byte	0x76f
	.4byte	.LBB108
	.4byte	.LBE108-.LBB108
	.byte	0x17
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	0x6ed
	.4byte	.LBB110
	.4byte	.LBE110-.LBB110
	.byte	0x1
	.byte	0x57
	.byte	0x5
	.4byte	0x666
	.uleb128 0x1
	.4byte	0x6f8
	.4byte	.LLST10
	.uleb128 0x6
	.4byte	0x73a
	.4byte	.LBB112
	.4byte	.LBE112-.LBB112
	.byte	0x2
	.byte	0x22
	.byte	0x5
	.uleb128 0x1
	.4byte	0x745
	.4byte	.LLST11
	.uleb128 0x3
	.4byte	0x77d
	.4byte	.LBB113
	.4byte	.LBE113-.LBB113
	.byte	0x3
	.byte	0x1c
	.byte	0x5
	.4byte	0x656
	.uleb128 0x1
	.4byte	0x788
	.4byte	.LLST12
	.byte	0
	.uleb128 0x4
	.4byte	0x776
	.4byte	.LBB115
	.4byte	.LBE115-.LBB115
	.byte	0x1d
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LVL15
	.4byte	0x6b9
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF49
	.byte	0x3f
	.4byte	0xe4
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6b9
	.uleb128 0x21
	.ascii	"i\000"
	.byte	0x1
	.byte	0x41
	.byte	0xf
	.4byte	0xd8
	.4byte	.LLST1
	.uleb128 0x6
	.4byte	0x722
	.4byte	.LBB96
	.4byte	.LBE96-.LBB96
	.byte	0x1
	.byte	0x47
	.byte	0x5
	.uleb128 0x1
	.4byte	0x72d
	.4byte	.LLST2
	.byte	0
	.byte	0
	.uleb128 0x22
	.4byte	.LASF67
	.byte	0x1
	.byte	0x23
	.byte	0xd
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ed
	.uleb128 0x23
	.4byte	.LASF45
	.byte	0x1
	.byte	0x23
	.byte	0x28
	.4byte	0x1c8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x9
	.4byte	.LASF43
	.byte	0x24
	.byte	0x11
	.4byte	0x41a
	.4byte	.LLST0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF50
	.byte	0x2
	.byte	0x21
	.4byte	0x705
	.uleb128 0xd
	.4byte	.LASF52
	.byte	0x2
	.byte	0x21
	.byte	0x4f
	.4byte	0x705
	.byte	0
	.uleb128 0xa
	.4byte	0xb4
	.uleb128 0xc
	.4byte	.LASF51
	.byte	0x2
	.byte	0x1d
	.4byte	0x722
	.uleb128 0xd
	.4byte	.LASF52
	.byte	0x2
	.byte	0x1d
	.byte	0x4d
	.4byte	0x705
	.byte	0
	.uleb128 0xc
	.4byte	.LASF53
	.byte	0x2
	.byte	0x19
	.4byte	0x73a
	.uleb128 0xd
	.4byte	.LASF52
	.byte	0x2
	.byte	0x19
	.byte	0x4e
	.4byte	0x705
	.byte	0
	.uleb128 0xc
	.4byte	.LASF54
	.byte	0x3
	.byte	0x1b
	.4byte	0x752
	.uleb128 0xd
	.4byte	.LASF55
	.byte	0x3
	.byte	0x1b
	.byte	0x53
	.4byte	0xa3
	.byte	0
	.uleb128 0x14
	.4byte	.LASF60
	.byte	0x3
	.byte	0x12
	.byte	0x39
	.4byte	0xa3
	.4byte	0x76f
	.uleb128 0x15
	.4byte	.LASF62
	.byte	0x3
	.byte	0x13
	.byte	0x19
	.4byte	0xa3
	.byte	0
	.uleb128 0x16
	.4byte	.LASF56
	.2byte	0x163
	.uleb128 0x16
	.4byte	.LASF57
	.2byte	0x14d
	.uleb128 0xc
	.4byte	.LASF58
	.byte	0x4
	.byte	0xb1
	.4byte	0x795
	.uleb128 0xd
	.4byte	.LASF59
	.byte	0x4
	.byte	0xb1
	.byte	0x4c
	.4byte	0x90
	.byte	0
	.uleb128 0x14
	.4byte	.LASF61
	.byte	0x4
	.byte	0xa3
	.byte	0x37
	.4byte	0x90
	.4byte	0x7b2
	.uleb128 0x15
	.4byte	.LASF62
	.byte	0x4
	.byte	0xa5
	.byte	0xe
	.4byte	0x90
	.byte	0
	.uleb128 0x24
	.4byte	.LASF63
	.byte	0x4
	.byte	0x27
	.byte	0x33
	.byte	0x3
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.sleb128 3
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 5
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
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xb
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 51
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
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
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x20
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
.LLST32:
	.byte	0x6
	.4byte	.LVL53
	.byte	0x4
	.uleb128 .LVL53-.LVL53
	.uleb128 .LVL54-.LVL53
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL54-.LVL53
	.uleb128 .LFE50-.LVL53
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST19:
	.byte	0x6
	.4byte	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL40-.LVL32
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL40-.LVL32
	.uleb128 .LVL42-.LVL32
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL32
	.uleb128 .LVL46-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL46-.LVL32
	.uleb128 .LVL48-.LVL32
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL32
	.uleb128 .LVL51-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LLST20:
	.byte	0x6
	.4byte	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL33-.LVL32
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL33-.LVL32
	.uleb128 .LVL52-.LVL32
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST21:
	.byte	0x6
	.4byte	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL34-.LVL32
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL34-.LVL32
	.uleb128 .LVL35-.LVL32
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL35-.LVL32
	.uleb128 .LVL36-.LVL32
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL32
	.uleb128 .LVL52-.LVL32
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LLST22:
	.byte	0x6
	.4byte	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL40-.LVL32
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL40-.LVL32
	.uleb128 .LVL43-.LVL32
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL43-.LVL32
	.uleb128 .LVL45-.LVL32
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL45-.LVL32
	.uleb128 .LVL48-.LVL32
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL48-.LVL32
	.uleb128 .LVL51-.LVL32
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST23:
	.byte	0x6
	.4byte	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL40-.LVL32
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL40-.LVL32
	.uleb128 .LVL43-.LVL32
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL44-.LVL32
	.uleb128 .LVL48-.LVL32
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST24:
	.byte	0x8
	.4byte	.LVL30
	.uleb128 .LVL32-.LVL30
	.uleb128 0x6
	.byte	0x3
	.4byte	os_timer__lock
	.byte	0x9f
	.byte	0
.LLST25:
	.byte	0x8
	.4byte	.LVL31
	.uleb128 .LVL40-.LVL31
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LLST26:
	.byte	0x8
	.4byte	.LVL36
	.uleb128 .LVL39-.LVL36
	.uleb128 0x6
	.byte	0x3
	.4byte	os_timer__lock
	.byte	0x9f
	.byte	0
.LLST27:
	.byte	0x8
	.4byte	.LVL37
	.uleb128 .LVL39-.LVL37
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST28:
	.byte	0x8
	.4byte	.LVL37
	.uleb128 .LVL38-.LVL37
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST29:
	.byte	0x8
	.4byte	.LVL48
	.uleb128 .LVL51-.LVL48
	.uleb128 0x6
	.byte	0x3
	.4byte	os_timer__lock
	.byte	0x9f
	.byte	0
.LLST30:
	.byte	0x8
	.4byte	.LVL49
	.uleb128 .LVL51-.LVL49
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST31:
	.byte	0x8
	.4byte	.LVL49
	.uleb128 .LVL50-.LVL49
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST13:
	.byte	0x6
	.4byte	.LVL20
	.byte	0x4
	.uleb128 .LVL20-.LVL20
	.uleb128 .LVL29-.LVL20
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL29-.LVL20
	.uleb128 .LFE48-.LVL20
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST14:
	.byte	0x8
	.4byte	.LVL20
	.uleb128 .LVL22-.LVL20
	.uleb128 0x6
	.byte	0x3
	.4byte	os_timer__lock
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x6
	.4byte	.LVL21
	.byte	0x4
	.uleb128 .LVL21-.LVL21
	.uleb128 .LVL23-.LVL21
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL23-.LVL21
	.uleb128 .LVL24-.LVL21
	.uleb128 0x5
	.byte	0x3
	.4byte	os_timer__lock
	.byte	0
.LLST16:
	.byte	0x8
	.4byte	.LVL25
	.uleb128 .LVL28-.LVL25
	.uleb128 0x6
	.byte	0x3
	.4byte	os_timer__lock
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x8
	.4byte	.LVL26
	.uleb128 .LVL28-.LVL26
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST18:
	.byte	0x8
	.4byte	.LVL26
	.uleb128 .LVL27-.LVL26
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL15-1-.LVL9
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL15-1-.LVL9
	.uleb128 .LFE47-.LVL9
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL15-1-.LVL9
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL15-1-.LVL9
	.uleb128 .LFE47-.LVL9
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL13-.LVL9
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL13-.LVL9
	.uleb128 .LVL15-1-.LVL9
	.uleb128 0x2
	.byte	0x70
	.sleb128 12
	.byte	0x4
	.uleb128 .LVL15-1-.LVL9
	.uleb128 .LFE47-.LVL9
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL14-.LVL9
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL14-.LVL9
	.uleb128 .LVL15-1-.LVL9
	.uleb128 0x2
	.byte	0x70
	.sleb128 16
	.byte	0x4
	.uleb128 .LVL15-1-.LVL9
	.uleb128 .LFE47-.LVL9
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL19-.LVL9
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL19-.LVL9
	.uleb128 .LFE47-.LVL9
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
.LLST8:
	.byte	0x8
	.4byte	.LVL10
	.uleb128 .LVL12-.LVL10
	.uleb128 0x6
	.byte	0x3
	.4byte	os_timer__lock
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x8
	.4byte	.LVL11
	.uleb128 .LVL19-.LVL11
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LLST10:
	.byte	0x8
	.4byte	.LVL15
	.uleb128 .LVL18-.LVL15
	.uleb128 0x6
	.byte	0x3
	.4byte	os_timer__lock
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x8
	.4byte	.LVL16
	.uleb128 .LVL18-.LVL16
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST12:
	.byte	0x8
	.4byte	.LVL16
	.uleb128 .LVL17-.LVL16
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL3
	.byte	0x4
	.uleb128 .LVL3-.LVL3
	.uleb128 .LVL4-.LVL3
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL4-.LVL3
	.uleb128 .LVL7-.LVL3
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LLST2:
	.byte	0x8
	.4byte	.LVL6
	.uleb128 .LVL8-.LVL6
	.uleb128 0x6
	.byte	0x3
	.4byte	os_timer__lock
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x8
	.4byte	.LVL1
	.uleb128 .LVL2-.LVL1
	.uleb128 0x1
	.byte	0x53
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x44
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
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
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
.LLRL33:
	.byte	0x7
	.4byte	.LFB45
	.uleb128 .LFE45-.LFB45
	.byte	0x7
	.4byte	.LFB46
	.uleb128 .LFE46-.LFB46
	.byte	0x7
	.4byte	.LFB47
	.uleb128 .LFE47-.LFB47
	.byte	0x7
	.4byte	.LFB48
	.uleb128 .LFE48-.LFB48
	.byte	0x7
	.4byte	.LFB49
	.uleb128 .LFE49-.LFB49
	.byte	0x7
	.4byte	.LFB50
	.uleb128 .LFE50-.LFB50
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF31:
	.ascii	"ticks\000"
.LASF62:
	.ascii	"result\000"
.LASF53:
	.ascii	"cpu_lock_init\000"
.LASF35:
	.ascii	"os_timer__current_tick\000"
.LASF56:
	.ascii	"cpu_DMB\000"
.LASF15:
	.ascii	"cpu_lock_t\000"
.LASF51:
	.ascii	"cpu_lock_lock\000"
.LASF57:
	.ascii	"cpu_ISB\000"
.LASF66:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF24:
	.ascii	"os_tick_t\000"
.LASF2:
	.ascii	"short int\000"
.LASF17:
	.ascii	"os_uint_t\000"
.LASF30:
	.ascii	"userdata\000"
.LASF67:
	.ascii	"os_timer__add\000"
.LASF34:
	.ascii	"os_timer_timeout_t\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF59:
	.ascii	"priMask\000"
.LASF64:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions\000"
.LASF43:
	.ascii	"head\000"
.LASF45:
	.ascii	"timer\000"
.LASF60:
	.ascii	"cpu_interrupt_disable\000"
.LASF58:
	.ascii	"cpu_set_PRIMASK\000"
.LASF48:
	.ascii	"os_timer_add\000"
.LASF8:
	.ascii	"long long int\000"
.LASF4:
	.ascii	"long int\000"
.LASF32:
	.ascii	"expire_tick\000"
.LASF42:
	.ascii	"current_tick\000"
.LASF61:
	.ascii	"cpu_get_PRIMASK\000"
.LASF18:
	.ascii	"os_size_t\000"
.LASF23:
	.ascii	"os_list_t\000"
.LASF13:
	.ascii	"long double\000"
.LASF38:
	.ascii	"os_timer__lock\000"
.LASF28:
	.ascii	"wait_node\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"signed char\000"
.LASF33:
	.ascii	"flags\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF47:
	.ascii	"os_timer_remove\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF49:
	.ascii	"os_timer_init\000"
.LASF11:
	.ascii	"int32_t\000"
.LASF19:
	.ascii	"os_err_t\000"
.LASF52:
	.ascii	"lock\000"
.LASF46:
	.ascii	"_Bool\000"
.LASF14:
	.ascii	"cpu_uint_t\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF39:
	.ascii	"os_timer_node_init\000"
.LASF16:
	.ascii	"os_int_t\000"
.LASF65:
	.ascii	"D:/RTOS/Kernel/os_timer.c\000"
.LASF44:
	.ascii	"node\000"
.LASF36:
	.ascii	"os_timer__tvroot\000"
.LASF5:
	.ascii	"__int32_t\000"
.LASF55:
	.ascii	"level\000"
.LASF27:
	.ascii	"os_timer_s\000"
.LASF25:
	.ascii	"os_timer_t\000"
.LASF40:
	.ascii	"os_timer_tick\000"
.LASF26:
	.ascii	"os_list_node_s\000"
.LASF20:
	.ascii	"os_list_node_t\000"
.LASF54:
	.ascii	"cpu_interrupt_enable\000"
.LASF41:
	.ascii	"nee_schedule\000"
.LASF21:
	.ascii	"prev\000"
.LASF37:
	.ascii	"os_timer__tv\000"
.LASF50:
	.ascii	"cpu_lock_unlock\000"
.LASF29:
	.ascii	"timeout\000"
.LASF22:
	.ascii	"next\000"
.LASF63:
	.ascii	"cpu_disable_irq\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
