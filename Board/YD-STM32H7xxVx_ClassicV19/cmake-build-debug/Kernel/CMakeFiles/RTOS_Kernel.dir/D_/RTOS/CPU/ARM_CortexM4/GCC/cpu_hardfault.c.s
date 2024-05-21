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
	.file	"cpu_hardfault.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_hardfault.c"
	.section	.rodata.show_cfsr.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"IACCVIOL \000"
	.align	2
.LC1:
	.ascii	"DACCVIOL \000"
	.align	2
.LC2:
	.ascii	"MUNSTKERR \000"
	.align	2
.LC3:
	.ascii	"MSTKERR \000"
	.align	2
.LC4:
	.ascii	"MLSPERR \000"
	.align	2
.LC5:
	.ascii	"MMARVALID \000"
	.align	2
.LC6:
	.ascii	"IBUSERR \000"
	.align	2
.LC7:
	.ascii	"PRECISERR \000"
	.align	2
.LC8:
	.ascii	"IMPRECISERR \000"
	.align	2
.LC9:
	.ascii	"UNSTKERR \000"
	.align	2
.LC10:
	.ascii	"STKERR \000"
	.align	2
.LC11:
	.ascii	"LSPERR \000"
	.align	2
.LC12:
	.ascii	"BFARVALID \000"
	.align	2
.LC13:
	.ascii	"UNDEFINSTR \000"
	.align	2
.LC14:
	.ascii	"INVSTATE \000"
	.align	2
.LC15:
	.ascii	"INVPC \000"
	.align	2
.LC16:
	.ascii	"NOCP \000"
	.align	2
.LC17:
	.ascii	"UNALIGNED \000"
	.align	2
.LC18:
	.ascii	"DIVBYZERO \000"
	.align	2
.LC19:
	.ascii	"\012\000"
	.section	.text.show_cfsr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	show_cfsr, %function
show_cfsr:
.LFB8:
	.loc 1 142 43
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 143 5
	.loc 1 143 7 is_stmt 0
	tst	r0, #1
	bne	.L22
.LVL1:
.L2:
	.loc 1 144 5 is_stmt 1
	.loc 1 144 7 is_stmt 0
	tst	r4, #2
	bne	.L23
.L3:
	.loc 1 145 5 is_stmt 1
	.loc 1 145 7 is_stmt 0
	tst	r4, #8
	bne	.L24
.L4:
	.loc 1 146 5 is_stmt 1
	.loc 1 146 7 is_stmt 0
	tst	r4, #16
	bne	.L25
.L5:
	.loc 1 147 5 is_stmt 1
	.loc 1 147 7 is_stmt 0
	tst	r4, #32
	bne	.L26
.L6:
	.loc 1 148 5 is_stmt 1
	.loc 1 148 7 is_stmt 0
	tst	r4, #128
	bne	.L27
.L7:
	.loc 1 150 5 is_stmt 1
	.loc 1 150 7 is_stmt 0
	tst	r4, #256
	bne	.L28
.L8:
	.loc 1 151 5 is_stmt 1
	.loc 1 151 7 is_stmt 0
	tst	r4, #512
	bne	.L29
.L9:
	.loc 1 152 5 is_stmt 1
	.loc 1 152 7 is_stmt 0
	tst	r4, #1024
	bne	.L30
.L10:
	.loc 1 153 5 is_stmt 1
	.loc 1 153 7 is_stmt 0
	tst	r4, #2048
	bne	.L31
.L11:
	.loc 1 154 5 is_stmt 1
	.loc 1 154 7 is_stmt 0
	tst	r4, #4096
	bne	.L32
.L12:
	.loc 1 155 5 is_stmt 1
	.loc 1 155 7 is_stmt 0
	tst	r4, #8192
	bne	.L33
.L13:
	.loc 1 156 5 is_stmt 1
	.loc 1 156 7 is_stmt 0
	tst	r4, #32768
	bne	.L34
.L14:
	.loc 1 158 5 is_stmt 1
	.loc 1 158 7 is_stmt 0
	tst	r4, #65536
	bne	.L35
.L15:
	.loc 1 159 5 is_stmt 1
	.loc 1 159 7 is_stmt 0
	tst	r4, #131072
	bne	.L36
.L16:
	.loc 1 160 5 is_stmt 1
	.loc 1 160 7 is_stmt 0
	tst	r4, #262144
	bne	.L37
.L17:
	.loc 1 161 5 is_stmt 1
	.loc 1 161 7 is_stmt 0
	tst	r4, #524288
	bne	.L38
.L18:
	.loc 1 162 5 is_stmt 1
	.loc 1 162 7 is_stmt 0
	tst	r4, #16777216
	bne	.L39
.L19:
	.loc 1 163 5 is_stmt 1
	.loc 1 163 7 is_stmt 0
	tst	r4, #33554432
	bne	.L40
.L20:
	.loc 1 165 5 is_stmt 1
	ldr	r0, .L41
	bl	printf
.LVL2:
	.loc 1 166 1 is_stmt 0
	pop	{r4, pc}
.LVL3:
.L22:
	.loc 1 143 25 is_stmt 1 discriminator 1
	ldr	r0, .L41+4
.LVL4:
	bl	printf
.LVL5:
	b	.L2
.L23:
	.loc 1 144 25 discriminator 1
	ldr	r0, .L41+8
	bl	printf
.LVL6:
	b	.L3
.L24:
	.loc 1 145 25 discriminator 1
	ldr	r0, .L41+12
	bl	printf
.LVL7:
	b	.L4
.L25:
	.loc 1 146 25 discriminator 1
	ldr	r0, .L41+16
	bl	printf
.LVL8:
	b	.L5
.L26:
	.loc 1 147 25 discriminator 1
	ldr	r0, .L41+20
	bl	printf
.LVL9:
	b	.L6
.L27:
	.loc 1 148 25 discriminator 1
	ldr	r0, .L41+24
	bl	printf
.LVL10:
	b	.L7
.L28:
	.loc 1 150 25 discriminator 1
	ldr	r0, .L41+28
	bl	printf
.LVL11:
	b	.L8
.L29:
	.loc 1 151 25 discriminator 1
	ldr	r0, .L41+32
	bl	printf
.LVL12:
	b	.L9
.L30:
	.loc 1 152 26 discriminator 1
	ldr	r0, .L41+36
	bl	printf
.LVL13:
	b	.L10
.L31:
	.loc 1 153 26 discriminator 1
	ldr	r0, .L41+40
	bl	printf
.LVL14:
	b	.L11
.L32:
	.loc 1 154 26 discriminator 1
	ldr	r0, .L41+44
	bl	printf
.LVL15:
	b	.L12
.L33:
	.loc 1 155 26 discriminator 1
	ldr	r0, .L41+48
	bl	printf
.LVL16:
	b	.L13
.L34:
	.loc 1 156 26 discriminator 1
	ldr	r0, .L41+52
	bl	printf
.LVL17:
	b	.L14
.L35:
	.loc 1 158 26 discriminator 1
	ldr	r0, .L41+56
	bl	printf
.LVL18:
	b	.L15
.L36:
	.loc 1 159 26 discriminator 1
	ldr	r0, .L41+60
	bl	printf
.LVL19:
	b	.L16
.L37:
	.loc 1 160 26 discriminator 1
	ldr	r0, .L41+64
	bl	printf
.LVL20:
	b	.L17
.L38:
	.loc 1 161 26 discriminator 1
	ldr	r0, .L41+68
	bl	printf
.LVL21:
	b	.L18
.L39:
	.loc 1 162 26 discriminator 1
	ldr	r0, .L41+72
	bl	printf
.LVL22:
	b	.L19
.L40:
	.loc 1 163 26 discriminator 1
	ldr	r0, .L41+76
	bl	printf
.LVL23:
	b	.L20
.L42:
	.align	2
.L41:
	.word	.LC19
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.cfi_endproc
.LFE8:
	.size	show_cfsr, .-show_cfsr
	.section	.rodata.show_hfsr.str1.4,"aMS",%progbits,1
	.align	2
.LC20:
	.ascii	"VECTBL \000"
	.align	2
.LC21:
	.ascii	"FORCED \000"
	.align	2
.LC22:
	.ascii	"DEBUGEVT \000"
	.section	.text.show_hfsr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	show_hfsr, %function
show_hfsr:
.LFB7:
	.loc 1 135 47
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL24:
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 1 136 5
	.loc 1 136 15 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 136 7
	tst	r3, #2
	bne	.L48
.LVL25:
.L44:
	.loc 1 137 5 is_stmt 1
	.loc 1 137 15 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 137 7
	tst	r3, #1073741824
	bne	.L49
.L45:
	.loc 1 138 5 is_stmt 1
	.loc 1 138 8 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 138 7
	cmp	r3, #0
	blt	.L50
.L46:
	.loc 1 139 5 is_stmt 1
	ldr	r0, .L51
	bl	printf
.LVL26:
	.loc 1 140 1 is_stmt 0
	add	sp, sp, #12
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.LVL27:
.L48:
	.cfi_restore_state
	.loc 1 136 25 is_stmt 1 discriminator 1
	ldr	r0, .L51+4
.LVL28:
	bl	printf
.LVL29:
	b	.L44
.L49:
	.loc 1 137 26 discriminator 1
	ldr	r0, .L51+8
	bl	printf
.LVL30:
	b	.L45
.L50:
	.loc 1 138 26 discriminator 1
	ldr	r0, .L51+12
	bl	printf
.LVL31:
	b	.L46
.L52:
	.align	2
.L51:
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.cfi_endproc
.LFE7:
	.size	show_hfsr, .-show_hfsr
	.section	.rodata.show_dfsr.str1.4,"aMS",%progbits,1
	.align	2
.LC23:
	.ascii	"HALTED \000"
	.align	2
.LC24:
	.ascii	"BKPT \000"
	.align	2
.LC25:
	.ascii	"DWTTRAP \000"
	.align	2
.LC26:
	.ascii	"VCATCH \000"
	.align	2
.LC27:
	.ascii	"EXTERNAL \000"
	.section	.text.show_dfsr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	show_dfsr, %function
show_dfsr:
.LFB6:
	.loc 1 126 47
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL32:
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 1 127 5
	.loc 1 127 15 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 127 7
	tst	r3, #1
	bne	.L60
.LVL33:
.L54:
	.loc 1 128 5 is_stmt 1
	.loc 1 128 15 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 128 7
	tst	r3, #2
	bne	.L61
.L55:
	.loc 1 129 5 is_stmt 1
	.loc 1 129 15 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 129 7
	tst	r3, #4
	bne	.L62
.L56:
	.loc 1 130 5 is_stmt 1
	.loc 1 130 15 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 130 7
	tst	r3, #8
	bne	.L63
.L57:
	.loc 1 131 5 is_stmt 1
	.loc 1 131 15 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 131 7
	tst	r3, #16
	bne	.L64
.L58:
	.loc 1 132 5 is_stmt 1
	ldr	r0, .L65
	bl	printf
.LVL34:
	.loc 1 133 1 is_stmt 0
	add	sp, sp, #12
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.LVL35:
.L60:
	.cfi_restore_state
	.loc 1 127 25 is_stmt 1 discriminator 1
	ldr	r0, .L65+4
.LVL36:
	bl	printf
.LVL37:
	b	.L54
.L61:
	.loc 1 128 25 discriminator 1
	ldr	r0, .L65+8
	bl	printf
.LVL38:
	b	.L55
.L62:
	.loc 1 129 25 discriminator 1
	ldr	r0, .L65+12
	bl	printf
.LVL39:
	b	.L56
.L63:
	.loc 1 130 25 discriminator 1
	ldr	r0, .L65+16
	bl	printf
.LVL40:
	b	.L57
.L64:
	.loc 1 131 25 discriminator 1
	ldr	r0, .L65+20
	bl	printf
.LVL41:
	b	.L58
.L66:
	.align	2
.L65:
	.word	.LC19
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.cfi_endproc
.LFE6:
	.size	show_dfsr, .-show_dfsr
	.section	.rodata.show_exc_return.str1.4,"aMS",%progbits,1
	.align	2
.LC28:
	.ascii	"ISR/MSP/FPCA=1\000"
	.align	2
.LC29:
	.ascii	"ISR/MSP/FPCA=0\000"
	.align	2
.LC30:
	.ascii	"THD/MSP/FPCA=1\000"
	.align	2
.LC31:
	.ascii	"THD/MSP/FPCA=0\000"
	.align	2
.LC32:
	.ascii	"ISR/PSP/FPCA=1\000"
	.align	2
.LC33:
	.ascii	"ISR/PSP/FPCA=0\000"
	.align	2
.LC34:
	.ascii	"INVALID\000"
	.section	.text.show_exc_return,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	show_exc_return, %function
show_exc_return:
.LFB5:
	.loc 1 98 49
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL42:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 99 5
	adds	r0, r0, #31
.LVL43:
	cmp	r0, #28
	bhi	.L68
	tbb	[pc, r0]
.L70:
	.byte	(.L75-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L74-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L73-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L72-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L71-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L68-.L70)/2
	.byte	(.L69-.L70)/2
	.p2align 1
.L75:
	.loc 1 101 13
	ldr	r0, .L78
.LVL44:
	bl	printf
.LVL45:
	.loc 1 102 13
.L76:
	.loc 1 122 5
	ldr	r0, .L78+4
	bl	printf
.LVL46:
	.loc 1 124 1 is_stmt 0
	pop	{r3, pc}
.L72:
	.loc 1 104 13 is_stmt 1
	ldr	r0, .L78+8
	bl	printf
.LVL47:
	.loc 1 105 13
	b	.L76
.L74:
	.loc 1 107 13
	ldr	r0, .L78+12
	bl	printf
.LVL48:
	.loc 1 108 13
	b	.L76
.L71:
	.loc 1 110 13
	ldr	r0, .L78+16
	bl	printf
.LVL49:
	.loc 1 111 13
	b	.L76
.L73:
	.loc 1 113 13
	ldr	r0, .L78+20
	bl	printf
.LVL50:
	.loc 1 114 13
	b	.L76
.L69:
	.loc 1 116 13
	ldr	r0, .L78+24
	bl	printf
.LVL51:
	.loc 1 117 13
	b	.L76
.L68:
	.loc 1 119 13
	ldr	r0, .L78+28
	bl	printf
.LVL52:
	.loc 1 120 13
	b	.L76
.L79:
	.align	2
.L78:
	.word	.LC28
	.word	.LC19
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.cfi_endproc
.LFE5:
	.size	show_exc_return, .-show_exc_return
	.section	.text.HardFault_Handler,"ax",%progbits
	.align	1
	.global	HardFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	HardFault_Handler, %function
HardFault_Handler:
.LFB3:
	.loc 1 10 29
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 11 5
	.syntax unified
@ 11 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_hardfault.c" 1
	        TST LR, #4                                 
        ITE EQ                                     
        MRSEQ R0, MSP                              
        MRSNE R0, PSP                              
        MOV R1, LR                                 
        LDR R2, =HardFault_Handler_C               
        BX R2                                      
        .align 4
@ 0 "" 2
	.loc 1 23 1 is_stmt 0
	.thumb
	.syntax unified
	bx	lr
	.cfi_endproc
.LFE3:
	.size	HardFault_Handler, .-HardFault_Handler
	.section	.rodata.HardFault_Handler_C.str1.4,"aMS",%progbits,1
	.align	2
.LC35:
	.ascii	"[HardFault]\012\000"
	.align	2
.LC36:
	.ascii	"-- Stack Frame --\012\000"
	.align	2
.LC37:
	.ascii	"R0  = 0x%08lx\012\000"
	.align	2
.LC38:
	.ascii	"R1  = 0x%08lx\012\000"
	.align	2
.LC39:
	.ascii	"R2  = 0x%08lx\012\000"
	.align	2
.LC40:
	.ascii	"R3  = 0x%08lx\012\000"
	.align	2
.LC41:
	.ascii	"R12 = 0x%08lx\012\000"
	.align	2
.LC42:
	.ascii	"LR  = 0x%08lx\012\000"
	.align	2
.LC43:
	.ascii	"PC  = 0x%08lx\012\000"
	.align	2
.LC44:
	.ascii	"PSR = 0x%08lx\012\000"
	.align	2
.LC45:
	.ascii	"-- FSR/FAR --\012\000"
	.align	2
.LC46:
	.ascii	"CFSR = 0x%08lx \000"
	.align	2
.LC47:
	.ascii	"HFSR = 0x%08lx \000"
	.align	2
.LC48:
	.ascii	"DFSR = 0x%08lx \000"
	.align	2
.LC49:
	.ascii	"AFSR = 0x%08lx\012\000"
	.align	2
.LC50:
	.ascii	"MMFAR = 0x%08lx\012\000"
	.align	2
.LC51:
	.ascii	"BFAR  = 0x%08lx\012\000"
	.align	2
.LC52:
	.ascii	"-- MISC --\012\000"
	.align	2
.LC53:
	.ascii	"LR/EXC_RETURN = 0x%08x \000"
	.section	.text.HardFault_Handler_C,"ax",%progbits
	.align	1
	.global	HardFault_Handler_C
	.syntax unified
	.thumb
	.thumb_func
	.type	HardFault_Handler_C, %function
HardFault_Handler_C:
.LFB4:
	.loc 1 49 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL53:
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
	sub	sp, sp, #28
	.cfi_def_cfa_offset 64
	mov	r8, r1
	.loc 1 50 5
	.loc 1 51 5
	.loc 1 52 5
	.loc 1 53 5
	.loc 1 54 5
	.loc 1 55 5
	.loc 1 56 5
	.loc 1 57 5
	.loc 1 58 5
	.loc 1 59 5
	.loc 1 60 5
	.loc 1 62 5
	.loc 1 62 23 is_stmt 0
	mov	r4, #-536813568
	ldr	r3, [r4, #3384]
	str	r3, [sp, #16]
.LVL54:
	.loc 1 63 5 is_stmt 1
	.loc 1 63 29 is_stmt 0
	ldr	r3, [r4, #3380]
.LVL55:
	str	r3, [sp, #20]
.LVL56:
	.loc 1 64 5 is_stmt 1
	.loc 1 64 10 is_stmt 0
	ldr	r5, [r4, #3368]
.LVL57:
	.loc 1 66 5 is_stmt 1
	.loc 1 66 16 is_stmt 0
	ldr	fp, [r0]
.LVL58:
	.loc 1 67 5 is_stmt 1
	.loc 1 67 16 is_stmt 0
	ldr	r10, [r0, #4]
.LVL59:
	.loc 1 68 5 is_stmt 1
	.loc 1 68 16 is_stmt 0
	ldr	r9, [r0, #8]
.LVL60:
	.loc 1 69 5 is_stmt 1
	.loc 1 69 16 is_stmt 0
	ldr	r3, [r0, #12]
.LVL61:
	str	r3, [sp, #4]
.LVL62:
	.loc 1 70 5 is_stmt 1
	.loc 1 70 17 is_stmt 0
	ldr	r7, [r0, #16]
.LVL63:
	.loc 1 71 5 is_stmt 1
	.loc 1 71 16 is_stmt 0
	ldr	r6, [r0, #20]
.LVL64:
	.loc 1 72 5 is_stmt 1
	.loc 1 72 16 is_stmt 0
	ldr	r2, [r0, #24]
	str	r2, [sp, #8]
.LVL65:
	.loc 1 73 5 is_stmt 1
	.loc 1 73 17 is_stmt 0
	ldr	r0, [r0, #28]
.LVL66:
	str	r0, [sp, #12]
.LVL67:
	.loc 1 75 5 is_stmt 1
	ldr	r0, .L88
.LVL68:
	bl	printf
.LVL69:
	.loc 1 76 5
	ldr	r0, .L88+4
	bl	printf
.LVL70:
	.loc 1 77 5
	mov	r1, fp
	ldr	r0, .L88+8
	bl	printf
.LVL71:
	.loc 1 78 5
	mov	r1, r10
	ldr	r0, .L88+12
	bl	printf
.LVL72:
	.loc 1 79 5
	mov	r1, r9
	ldr	r0, .L88+16
	bl	printf
.LVL73:
	.loc 1 80 5
	ldr	r1, [sp, #4]
	ldr	r0, .L88+20
	bl	printf
.LVL74:
	.loc 1 81 5
	mov	r1, r7
	ldr	r0, .L88+24
	bl	printf
.LVL75:
	.loc 1 82 5
	mov	r1, r6
	ldr	r0, .L88+28
	bl	printf
.LVL76:
	.loc 1 83 5
	ldr	r1, [sp, #8]
	ldr	r0, .L88+32
	bl	printf
.LVL77:
	.loc 1 84 5
	ldr	r1, [sp, #12]
	ldr	r0, .L88+36
	bl	printf
.LVL78:
	.loc 1 86 5
	ldr	r0, .L88+40
	bl	printf
.LVL79:
	.loc 1 87 5
	mov	r1, r5
	ldr	r0, .L88+44
	bl	printf
.LVL80:
	.loc 1 87 38
	mov	r0, r5
	bl	show_cfsr
.LVL81:
	.loc 1 88 5
	ldr	r1, [r4, #3372]
	ldr	r0, .L88+48
	bl	printf
.LVL82:
	.loc 1 88 77
	ldr	r0, [r4, #3372]
	bl	show_hfsr
.LVL83:
	.loc 1 89 5
	ldr	r1, [r4, #3376]
	ldr	r0, .L88+52
	bl	printf
.LVL84:
	.loc 1 89 77
	ldr	r0, [r4, #3376]
	bl	show_dfsr
.LVL85:
	.loc 1 90 5
	ldr	r1, [r4, #3388]
	ldr	r0, .L88+56
	bl	printf
.LVL86:
	.loc 1 91 5
	.loc 1 91 7 is_stmt 0
	tst	r5, #128
	bne	.L86
.L82:
	.loc 1 92 5 is_stmt 1
	.loc 1 92 7 is_stmt 0
	tst	r5, #32768
	bne	.L87
.L83:
	.loc 1 93 5 is_stmt 1
	ldr	r0, .L88+60
	bl	printf
.LVL87:
	.loc 1 94 5
	mov	r1, r8
	ldr	r0, .L88+64
	bl	printf
.LVL88:
	.loc 1 94 50
	mov	r0, r8
	bl	show_exc_return
.LVL89:
.L84:
	.loc 1 95 5 discriminator 1
	.loc 1 95 10 discriminator 1
	b	.L84
.L86:
	.loc 1 91 23 discriminator 1
	ldr	r1, [sp, #20]
	ldr	r0, .L88+68
	bl	printf
.LVL90:
	b	.L82
.L87:
	.loc 1 92 23 discriminator 1
	ldr	r1, [sp, #16]
	ldr	r0, .L88+72
	bl	printf
.LVL91:
	b	.L83
.L89:
	.align	2
.L88:
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC52
	.word	.LC53
	.word	.LC50
	.word	.LC51
	.cfi_endproc
.LFE4:
	.size	HardFault_Handler_C, .-HardFault_Handler_C
	.text
.Letext0:
	.file 2 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "m:\\noinstall\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\arm-none-eabi\\include\\stdio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x7b6
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x1d
	.4byte	.LASF34
	.4byte	.LASF35
	.4byte	.LLRL11
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x55
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0xd
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0xe
	.4byte	0x7f
	.uleb128 0xa
	.4byte	0x86
	.uleb128 0xf
	.4byte	0x8b
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x49
	.uleb128 0x10
	.4byte	0x95
	.uleb128 0x11
	.4byte	.LASF36
	.byte	0x4
	.byte	0xce
	.byte	0x5
	.4byte	0x6a
	.4byte	0xbd
	.uleb128 0x12
	.4byte	0x90
	.uleb128 0x13
	.byte	0
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x8e
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2a9
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x8e
	.byte	0x25
	.4byte	0x55
	.4byte	.LLST0
	.uleb128 0x2
	.4byte	.LVL2
	.4byte	0xa6
	.4byte	0xf7
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC19
	.byte	0
	.uleb128 0x2
	.4byte	.LVL5
	.4byte	0xa6
	.4byte	0x10e
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL6
	.4byte	0xa6
	.4byte	0x125
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x2
	.4byte	.LVL7
	.4byte	0xa6
	.4byte	0x13c
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.uleb128 0x2
	.4byte	.LVL8
	.4byte	0xa6
	.4byte	0x153
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.uleb128 0x2
	.4byte	.LVL9
	.4byte	0xa6
	.4byte	0x16a
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC4
	.byte	0
	.uleb128 0x2
	.4byte	.LVL10
	.4byte	0xa6
	.4byte	0x181
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.byte	0
	.uleb128 0x2
	.4byte	.LVL11
	.4byte	0xa6
	.4byte	0x198
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC6
	.byte	0
	.uleb128 0x2
	.4byte	.LVL12
	.4byte	0xa6
	.4byte	0x1af
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC7
	.byte	0
	.uleb128 0x2
	.4byte	.LVL13
	.4byte	0xa6
	.4byte	0x1c6
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC8
	.byte	0
	.uleb128 0x2
	.4byte	.LVL14
	.4byte	0xa6
	.4byte	0x1dd
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC9
	.byte	0
	.uleb128 0x2
	.4byte	.LVL15
	.4byte	0xa6
	.4byte	0x1f4
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC10
	.byte	0
	.uleb128 0x2
	.4byte	.LVL16
	.4byte	0xa6
	.4byte	0x20b
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC11
	.byte	0
	.uleb128 0x2
	.4byte	.LVL17
	.4byte	0xa6
	.4byte	0x222
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC12
	.byte	0
	.uleb128 0x2
	.4byte	.LVL18
	.4byte	0xa6
	.4byte	0x239
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC13
	.byte	0
	.uleb128 0x2
	.4byte	.LVL19
	.4byte	0xa6
	.4byte	0x250
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC14
	.byte	0
	.uleb128 0x2
	.4byte	.LVL20
	.4byte	0xa6
	.4byte	0x267
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC15
	.byte	0
	.uleb128 0x2
	.4byte	.LVL21
	.4byte	0xa6
	.4byte	0x27e
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC16
	.byte	0
	.uleb128 0x2
	.4byte	.LVL22
	.4byte	0xa6
	.4byte	0x295
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC17
	.byte	0
	.uleb128 0x6
	.4byte	.LVL23
	.4byte	0xa6
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC18
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x87
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x325
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x87
	.byte	0x29
	.4byte	0xa1
	.4byte	.LLST1
	.uleb128 0x2
	.4byte	.LVL26
	.4byte	0xa6
	.4byte	0x2e3
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC19
	.byte	0
	.uleb128 0x2
	.4byte	.LVL29
	.4byte	0xa6
	.4byte	0x2fa
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC20
	.byte	0
	.uleb128 0x2
	.4byte	.LVL30
	.4byte	0xa6
	.4byte	0x311
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC21
	.byte	0
	.uleb128 0x6
	.4byte	.LVL31
	.4byte	0xa6
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC22
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x7e
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3cf
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x7e
	.byte	0x29
	.4byte	0xa1
	.4byte	.LLST2
	.uleb128 0x2
	.4byte	.LVL34
	.4byte	0xa6
	.4byte	0x35f
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC19
	.byte	0
	.uleb128 0x2
	.4byte	.LVL37
	.4byte	0xa6
	.4byte	0x376
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC23
	.byte	0
	.uleb128 0x2
	.4byte	.LVL38
	.4byte	0xa6
	.4byte	0x38d
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC24
	.byte	0
	.uleb128 0x2
	.4byte	.LVL39
	.4byte	0xa6
	.4byte	0x3a4
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC25
	.byte	0
	.uleb128 0x2
	.4byte	.LVL40
	.4byte	0xa6
	.4byte	0x3bb
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC26
	.byte	0
	.uleb128 0x6
	.4byte	.LVL41
	.4byte	0xa6
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC27
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x62
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4a7
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x62
	.byte	0x2a
	.4byte	0x71
	.4byte	.LLST3
	.uleb128 0x2
	.4byte	.LVL45
	.4byte	0xa6
	.4byte	0x409
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC28
	.byte	0
	.uleb128 0x2
	.4byte	.LVL46
	.4byte	0xa6
	.4byte	0x420
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC19
	.byte	0
	.uleb128 0x2
	.4byte	.LVL47
	.4byte	0xa6
	.4byte	0x437
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC29
	.byte	0
	.uleb128 0x2
	.4byte	.LVL48
	.4byte	0xa6
	.4byte	0x44e
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC30
	.byte	0
	.uleb128 0x2
	.4byte	.LVL49
	.4byte	0xa6
	.4byte	0x465
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC31
	.byte	0
	.uleb128 0x2
	.4byte	.LVL50
	.4byte	0xa6
	.4byte	0x47c
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC32
	.byte	0
	.uleb128 0x2
	.4byte	.LVL51
	.4byte	0xa6
	.4byte	0x493
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC33
	.byte	0
	.uleb128 0x6
	.4byte	.LVL52
	.4byte	0xa6
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC34
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0x1
	.byte	0x30
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7a2
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x30
	.byte	0x2a
	.4byte	0x7a2
	.4byte	.LLST4
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x30
	.byte	0x47
	.4byte	0x71
	.4byte	.LLST5
	.uleb128 0x5
	.4byte	.LASF23
	.byte	0x32
	.4byte	0x55
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x33
	.4byte	0x55
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x34
	.4byte	0x55
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x35
	.4byte	0x55
	.4byte	.LLST6
	.uleb128 0x5
	.4byte	.LASF27
	.byte	0x36
	.4byte	0x55
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x5
	.4byte	.LASF28
	.byte	0x37
	.4byte	0x55
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x38
	.4byte	0x55
	.4byte	.LLST7
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0x39
	.4byte	0x55
	.4byte	.LLST8
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x3a
	.4byte	0x55
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x3b
	.4byte	0x55
	.4byte	.LLST9
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0x3c
	.4byte	0x55
	.4byte	.LLST10
	.uleb128 0x2
	.4byte	.LVL69
	.4byte	0xa6
	.4byte	0x580
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC35
	.byte	0
	.uleb128 0x2
	.4byte	.LVL70
	.4byte	0xa6
	.4byte	0x597
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC36
	.byte	0
	.uleb128 0x2
	.4byte	.LVL71
	.4byte	0xa6
	.4byte	0x5b4
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC37
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7b
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL72
	.4byte	0xa6
	.4byte	0x5d1
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC38
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7a
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL73
	.4byte	0xa6
	.4byte	0x5ee
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC39
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL74
	.4byte	0xa6
	.4byte	0x60c
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC40
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -60
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.4byte	.LVL75
	.4byte	0xa6
	.4byte	0x629
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC41
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL76
	.4byte	0xa6
	.4byte	0x646
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC42
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL77
	.4byte	0xa6
	.4byte	0x664
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC43
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -56
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.4byte	.LVL78
	.4byte	0xa6
	.4byte	0x682
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC44
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.4byte	.LVL79
	.4byte	0xa6
	.4byte	0x699
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC45
	.byte	0
	.uleb128 0x2
	.4byte	.LVL80
	.4byte	0xa6
	.4byte	0x6b6
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC46
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL81
	.4byte	0xbd
	.4byte	0x6ca
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL82
	.4byte	0xa6
	.4byte	0x6e1
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC47
	.byte	0
	.uleb128 0xb
	.4byte	.LVL83
	.4byte	0x2a9
	.uleb128 0x2
	.4byte	.LVL84
	.4byte	0xa6
	.4byte	0x701
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC48
	.byte	0
	.uleb128 0xb
	.4byte	.LVL85
	.4byte	0x325
	.uleb128 0x2
	.4byte	.LVL86
	.4byte	0xa6
	.4byte	0x721
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC49
	.byte	0
	.uleb128 0x2
	.4byte	.LVL87
	.4byte	0xa6
	.4byte	0x738
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC52
	.byte	0
	.uleb128 0x2
	.4byte	.LVL88
	.4byte	0xa6
	.4byte	0x755
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC53
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL89
	.4byte	0x3cf
	.4byte	0x769
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x2
	.4byte	.LVL90
	.4byte	0xa6
	.4byte	0x787
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC50
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -44
	.byte	0x6
	.byte	0
	.uleb128 0x6
	.4byte	.LVL91
	.4byte	0xa6
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC51
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0x55
	.uleb128 0x15
	.4byte	.LASF38
	.byte	0x1
	.byte	0xa
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
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
	.sleb128 19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.sleb128 19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x37
	.byte	0
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
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x15
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
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL4-.LVL0
	.uleb128 .LFE8-.LVL0
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LLST1:
	.byte	0x6
	.4byte	.LVL24
	.byte	0x4
	.uleb128 .LVL24-.LVL24
	.uleb128 .LVL25-.LVL24
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL25-.LVL24
	.uleb128 .LVL27-.LVL24
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x4
	.uleb128 .LVL27-.LVL24
	.uleb128 .LVL28-.LVL24
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL28-.LVL24
	.uleb128 .LFE7-.LVL24
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
.LLST2:
	.byte	0x6
	.4byte	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL33-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL33-.LVL32
	.uleb128 .LVL35-.LVL32
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x4
	.uleb128 .LVL35-.LVL32
	.uleb128 .LVL36-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL36-.LVL32
	.uleb128 .LFE6-.LVL32
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
.LLST3:
	.byte	0x6
	.4byte	.LVL42
	.byte	0x4
	.uleb128 .LVL42-.LVL42
	.uleb128 .LVL43-.LVL42
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL43-.LVL42
	.uleb128 .LVL44-.LVL42
	.uleb128 0x3
	.byte	0x70
	.sleb128 -31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL44-.LVL42
	.uleb128 .LFE5-.LVL42
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x6
	.4byte	.LVL53
	.byte	0x4
	.uleb128 .LVL53-.LVL53
	.uleb128 .LVL66-.LVL53
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL66-.LVL53
	.uleb128 .LFE4-.LVL53
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x6
	.4byte	.LVL53
	.byte	0x4
	.uleb128 .LVL53-.LVL53
	.uleb128 .LVL69-1-.LVL53
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL69-1-.LVL53
	.uleb128 .LFE4-.LVL53
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST6:
	.byte	0x6
	.4byte	.LVL62
	.byte	0x4
	.uleb128 .LVL62-.LVL62
	.uleb128 .LVL69-1-.LVL62
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL69-1-.LVL62
	.uleb128 .LFE4-.LVL62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
.LLST7:
	.byte	0x6
	.4byte	.LVL65
	.byte	0x4
	.uleb128 .LVL65-.LVL65
	.uleb128 .LVL69-1-.LVL65
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL69-1-.LVL65
	.uleb128 .LFE4-.LVL65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
.LLST8:
	.byte	0x6
	.4byte	.LVL67
	.byte	0x4
	.uleb128 .LVL67-.LVL67
	.uleb128 .LVL68-.LVL67
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL68-.LVL67
	.uleb128 .LFE4-.LVL67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
.LLST9:
	.byte	0x6
	.4byte	.LVL54
	.byte	0x4
	.uleb128 .LVL54-.LVL54
	.uleb128 .LVL55-.LVL54
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL55-.LVL54
	.uleb128 .LFE4-.LVL54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
.LLST10:
	.byte	0x6
	.4byte	.LVL56
	.byte	0x4
	.uleb128 .LVL56-.LVL56
	.uleb128 .LVL61-.LVL56
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL61-.LVL56
	.uleb128 .LFE4-.LVL56
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
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
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
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
.LLRL11:
	.byte	0x7
	.4byte	.LFB8
	.uleb128 .LFE8-.LFB8
	.byte	0x7
	.4byte	.LFB7
	.uleb128 .LFE7-.LFB7
	.byte	0x7
	.4byte	.LFB6
	.uleb128 .LFE6-.LFB6
	.byte	0x7
	.4byte	.LFB5
	.uleb128 .LFE5-.LFB5
	.byte	0x7
	.4byte	.LFB3
	.uleb128 .LFE3-.LFB3
	.byte	0x7
	.4byte	.LFB4
	.uleb128 .LFE4-.LFB4
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF20:
	.ascii	"value\000"
.LASF13:
	.ascii	"show_cfsr\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF35:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF14:
	.ascii	"show_hfsr\000"
.LASF33:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions\000"
.LASF37:
	.ascii	"HardFault_Handler_C\000"
.LASF28:
	.ascii	"stacked_lr\000"
.LASF27:
	.ascii	"stacked_r12\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF31:
	.ascii	"bus_fault_address\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF15:
	.ascii	"cfsr\000"
.LASF19:
	.ascii	"show_exc_return\000"
.LASF16:
	.ascii	"hfsr\000"
.LASF11:
	.ascii	"__uint32_t\000"
.LASF22:
	.ascii	"lr_value\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF18:
	.ascii	"dfsr\000"
.LASF29:
	.ascii	"stacked_pc\000"
.LASF17:
	.ascii	"show_dfsr\000"
.LASF6:
	.ascii	"long long int\000"
.LASF38:
	.ascii	"HardFault_Handler\000"
.LASF10:
	.ascii	"char\000"
.LASF36:
	.ascii	"printf\000"
.LASF2:
	.ascii	"short int\000"
.LASF34:
	.ascii	"D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_hardfault.c\000"
.LASF4:
	.ascii	"long int\000"
.LASF21:
	.ascii	"hardfault_args\000"
.LASF9:
	.ascii	"long double\000"
.LASF32:
	.ascii	"memmanage_fault_address\000"
.LASF0:
	.ascii	"signed char\000"
.LASF30:
	.ascii	"stacked_psr\000"
.LASF23:
	.ascii	"stacked_r0\000"
.LASF24:
	.ascii	"stacked_r1\000"
.LASF25:
	.ascii	"stacked_r2\000"
.LASF26:
	.ascii	"stacked_r3\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
