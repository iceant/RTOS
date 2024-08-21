/*!
    \file    gd32f4xx_it.c
    \brief   interrupt service routines

    \version 2024-01-15, V3.2.0, firmware for GD32F4xx
*/

/*
    Copyright (c) 2024, GigaDevice Semiconductor Inc.

    Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this
       list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright notice,
       this list of conditions and the following disclaimer in the documentation
       and/or other materials provided with the distribution.
    3. Neither the name of the copyright holder nor the names of its contributors
       may be used to endorse or promote products derived from this software without
       specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
OF SUCH DAMAGE.
*/

#include <stdio.h>
#include "gd32f4xx_it.h"
#include <os_kernel.h>
#include <cpu.h>

/*!
    \brief      this function handles NMI exception
    \param[in]  none
    \param[out] none
    \retval     none
*/
//void NMI_Handler(void)
//{
//    cpu_disable_irq();
//    printf("NMI_Handler\n");
//    /* if NMI exception occurs, go to infinite loop */
////    while(1) {
////    }
//    while(1);
//
////    NVIC_SystemReset();
//}

/*!
    \brief      this function handles HardFault exception
    \param[in]  none
    \param[out] none
    \retval     none
*/
//void HardFault_Handler(void)
//{
//    /* if Hard Fault exception occurs, go to infinite loop */
//    while(1) {
//    }
//}

/*!
    \brief      this function handles MemManage exception
    \param[in]  none
    \param[out] none
    \retval     none
*/
//void MemManage_Handler(void)
//{
//    cpu_disable_irq();
//
//    /* if Memory Manage exception occurs, go to infinite loop */
//    printf("MemManage_Handler\n");
//    while(1);
//}

/*!
    \brief      this function handles BusFault exception
    \param[in]  none
    \param[out] none
    \retval     none
*/
//void BusFault_Handler(void)
//{
//    cpu_disable_irq();
//    printf("BusFault_Handler\n");
//    while(1);
//}

/*!
    \brief      this function handles UsageFault exception
    \param[in]  none
    \param[out] none
    \retval     none
*/
//void UsageFault_Handler(void)
//{
//    cpu_disable_irq();
//    printf("UsageFault_Handler\n");
//    while(1);
//}

/*!
    \brief      this function handles SVC exception
    \param[in]  none
    \param[out] none
    \retval     none
*/
//void SVC_Handler(void)
//{
//    /* if SVC exception occurs, go to infinite loop */
//    while(1) {
//    }
//}

/*!
    \brief      this function handles DebugMon exception
    \param[in]  none
    \param[out] none
    \retval     none
*/
void DebugMon_Handler(void)
{
    printf("DebugMon_Handler\n");
    /* if DebugMon exception occurs, go to infinite loop */
    while(1);
}

/*!
    \brief      this function handles PendSV exception
    \param[in]  none
    \param[out] none
    \retval     none
*/
__asm void PendSV_Handler(void)
{
    /* if PendSV exception occurs, go to infinite loop */
    IMPORT cpu_stack__switch_flag
    IMPORT cpu_stack__from_stack_p
    IMPORT cpu_stack__to_stack_p

        MRS R1, PRIMASK
        CPSID I

        LDR R0, =cpu_stack__switch_flag
        LDR R2, [R0]
        CBZ R2, __PendSV_Exit

        MOV R2, #0x00
        STR R2, [R0]

        LDR R2, =cpu_stack__from_stack_p
        LDR R0, [R2]
        CBZ R0, __PendSV_SwitchTo


        MRS R0, PSP


        TST LR, #0x10
        IT EQ
        VSTMDBEQ R0!, {S16-S31}

        MOV R2, LR
        MRS R3, CONTROL
        STMDB R0!, {R2-R11}

        LDR R2, =cpu_stack__from_stack_p
        LDR R3, [R2]
        STR R0, [R3]

__PendSV_SwitchTo
        LDR R0, =cpu_stack__to_stack_p
        LDR R0, [R0]
        LDR R0, [R0]

        LDMIA R0!, {R2-R11}
        MOV LR, R2
        MSR CONTROL, R3
        DMB
        ISB

        TST LR, #0x10
        IT EQ
        VLDMIAEQ R0!, {S16-S31}

        MSR PSP, R0
        DMB
        ISB

__PendSV_Exit
        MSR PRIMASK, R1
        ISB
        BX LR

    ALIGN 4
}

/*!
    \brief    this function handles SysTick exception
    \param[in]  none
    \param[out] none
    \retval     none
*/
//size_t SysTick__Tick=0;

void SysTick_Handler(void)
{
//    SysTick__Tick++;

    os_interrupt_enter();
    os_scheduler_systick();
    os_interrupt_leave();
}


