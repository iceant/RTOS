/*!
    \file    main.c
    \brief   led spark with systick

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

#include "main.h"
#include <os_kernel.h>
#include <board.h>
#include <sdk_hex.h>


////////////////////////////////////////////////////////////////////////////////
////
#if 1
C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t BootThread_Stack[2048];
static os_thread_t BootThread;

static void BootThread_Entry(void* p){

#if defined(ENABLE_SPI_FLASH)
    uint32_t FlashID = sFLASH_ReadID();
    os_printf("FlashID: %d(0x%08x)\r\n", FlashID, FlashID);
#endif

#if defined(ENABLE_4G)
    A7670C_Result result = A7670C_Startup();
    if(result!=kA7670C_Result_OK){
        cpu_reboot();
        return;
    }

    Task_TimeSync_Init();
#endif

    while(1){
        os_printf("%04d-%02d-%02d %02d:%02d:%02d\n"
            , DS1307_GetYear()
            , DS1307_GetMonth()
            , DS1307_GetDate()
            , DS1307_GetHour()
            , DS1307_GetMinute()
            , DS1307_GetSecond()
        );
//        os_thread_yield();
        os_thread_mdelay(1000);
    }
}
#endif

////////////////////////////////////////////////////////////////////////////////
////


/*!
    \brief    main function
    \param[in]  none
    \param[out] none
    \retval     none
*/
int main(void)
{
    /* delay */
    int i;
    for(i=0; i<0x3ffff; i++);

    /* startup */
    Board_Init();
    
    os_printf("__HXTAL: %ld\n", HXTAL_VALUE);
    os_printf("SystemCoreClock: %ld\n", SystemCoreClock);
    os_printf("CK_SYS: %ld\n", rcu_clock_freq_get(CK_SYS));
    os_printf("CK_AHB: %ld\n", rcu_clock_freq_get(CK_AHB));
    os_printf("CK_APB1: %ld\n", rcu_clock_freq_get(CK_APB1));
    os_printf("CK_APB2: %ld\n", rcu_clock_freq_get(CK_APB2));

    USE_USART0_Init();

    os_thread_init(&BootThread, "Boot", BootThread_Entry, 0
                   , BootThread_Stack, sizeof(BootThread_Stack), 30,10);
    os_thread_startup(&BootThread);

    Test_Printf_Init();

    os_kernel_startup();


    size_t nCount = 0;
    while(1) {
        sdk_ringbuffer_t* usart0_rx_buf = USE_USART0_GetRxBuffer();
        if(sdk_ringbuffer_used(usart0_rx_buf)>0){
            sdk_hex_dump("USART0", usart0_rx_buf->buffer, sdk_ringbuffer_used(usart0_rx_buf));            
        }
        os_printf("[main] ERROR count=%d\n", nCount++);
        for(int i=0; i<0x3FffFFf; i++){}
    }
}
