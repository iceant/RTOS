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
	.file	"cpu_pendsv.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_pendsv.c"
	.section	.text.PendSV_Handler,"ax",%progbits
	.align	1
	.global	PendSV_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	PendSV_Handler, %function
PendSV_Handler:
.LFB34:
	.loc 1 8 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 9 5
	.syntax unified
@ 9 "D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_pendsv.c" 1
	    .global cpu_stack__switch_flag         
    .global cpu_stack__curr_p              
    .global cpu_stack__next_p              
                                           
        MRS R1, PRIMASK                    
        CPSID I                            
                                           
        LDR R0, =cpu_stack__switch_flag    
        LDR R2, [R0]                       
        CBZ R2, __PendSV_Exit /* if(cpu__stack_switch_flag==0) goto __PendSV_Exit; */              
                                                                                                   
        MOV R2, #0x00                                                                              
        STR R2, [R0]    /* cpu__stack_switch_flag=0 */                                             
                                                                                                   
        LDR R2, =cpu_stack__curr_p                                                                 
        LDR R0, [R2]                                                                               
        CBZ R0, __PendSV_SwitchTo /* if(cpu__stack_curr_p==0) goto __PendSV_SwitchTo; */           
                                                                                                   
        MRS R0, PSP     /* Save Current Stack From PSP */                                          
        TST LR, #0x10                                                                              
        IT EQ                                                                                      
        VSTMDBEQ R0!, {S16-S31}                                                                    
        MOV R2, LR                                                                                 
        MRS R3, CONTROL                                                                            
        STMDB R0!, {R2-R11}                                                                        
                                                                                                   
        LDR R2, =cpu_stack__curr_p                                                                 
        LDR R3, [R2]                                                                               
        STR R0, [R3] /* Save Current SP to cpu__stack_curr_p->sp */                                
                                                                                                   
__PendSV_SwitchTo:                                                                                 
        LDR R0, =cpu_stack__next_p                                                                 
        LDR R0, [R0]                                                                               
        LDR R0, [R0]                                                                               
                                                                                                   
        LDMIA R0!, {R2-R11}                                                                        
        MOV LR, R2                                                                                 
        MSR CONTROL, R3                                                                            
        ISB                                                                                        
        TST LR, #0x10                                                                              
        IT EQ                                                                                      
        VLDMIAEQ R0!, {S16-S31}                                                                    
        MSR PSP, R0                                                                                
                                                                                                   
__PendSV_Exit:                                                                                     
        MSR PRIMASK, R1                                                                            
        ISB                                                                                        
        BX LR                                                                                      
        .align 4                                                                                   
@ 0 "" 2
	.loc 1 67 1 is_stmt 0
	.thumb
	.syntax unified
	.cfi_endproc
.LFE34:
	.size	PendSV_Handler, .-PendSV_Handler
	.text
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x7b
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x1d
	.4byte	.LASF10
	.4byte	.LASF11
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
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x1
	.byte	0x7
	.byte	0x1d
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
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
	.4byte	.LFB34
	.uleb128 .LFE34-.LFB34
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF8:
	.ascii	"unsigned int\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF4:
	.ascii	"long int\000"
.LASF11:
	.ascii	"D:\\\\RTOS\\\\Board\\\\YD-STM32H7xxVx_ClassicV19\\\\"
	.ascii	"cmake-build-debug\000"
.LASF0:
	.ascii	"signed char\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF2:
	.ascii	"short int\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF9:
	.ascii	"GNU C11 12.2.1 20221205 -mabi=aapcs -mcpu=cortex-m7"
	.ascii	" -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -march=arm"
	.ascii	"v7e-m+fp.dp -g -gstrict-dwarf -O0 -Og -std=gnu99 -s"
	.ascii	"td=gnu11 -fno-builtin -fomit-frame-pointer -ffuncti"
	.ascii	"on-sections -fdata-sections -fno-exceptions -fstack"
	.ascii	"-protector\000"
.LASF10:
	.ascii	"D:/RTOS/CPU/ARM_CortexM4/GCC/cpu_pendsv.c\000"
.LASF12:
	.ascii	"PendSV_Handler\000"
.LASF6:
	.ascii	"long long int\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
