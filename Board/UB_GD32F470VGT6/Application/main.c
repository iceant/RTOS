#include "main.h"
#include <os_kernel.h>
#include <board.h>
#include <sdk_hex.h>
#include <sdk_fmt.h>
#include <string.h>
#include <sdk_float_fmt.h>
////////////////////////////////////////////////////////////////////////////////
////

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

#if defined(ENABLE_CAN0)
    USE_CAN0_Init();
#endif

#if defined(ENABLE_OLED)
    OLED_TurnOn();
#endif

    USE_USART2_Init();

    char buf[32];
    while(1){
        snprintf(buf, sizeof(buf), "%04d-%02d-%02d %02d:%02d:%02d"
                , DS1307_GetYear()
                , DS1307_GetMonth()
                , DS1307_GetDate()
                , DS1307_GetHour()
                , DS1307_GetMinute()
                , DS1307_GetSecond());

        os_printf("%s\n", buf);

        OLED_ShowString(0, 0, buf, 12);

//        mcu_protocol_t protocol;
//        mcu_protocol_du_print(&protocol, "MAIN", 5);

//        os_thread_yield();
        os_thread_mdelay(1000);
    }

}


////////////////////////////////////////////////////////////////////////////////
////
#define dbg_print os_printf

////////////////////////////////////////////////////////////////////////////////
////

#define USE_RELEASE_VERSION 1

#if (USE_RELEASE_VERSION)
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

    sdk_fmt_register('F', sdk_float_str_fmt);

    dbg_print("__HXTAL: %d\n", HXTAL_VALUE);
    dbg_print("SystemCoreClock: %ld\n", SystemCoreClock);
    dbg_print("CK_SYS: %d\n", rcu_clock_freq_get(CK_SYS));
    dbg_print("CK_AHB: %d\n", rcu_clock_freq_get(CK_AHB));
    dbg_print("CK_APB1: %d\n", rcu_clock_freq_get(CK_APB1));
    dbg_print("CK_APB2: %d\n", rcu_clock_freq_get(CK_APB2));

    USE_USART0_Init();

    os_thread_init(&BootThread, "Boot", BootThread_Entry, 0
                   , BootThread_Stack, sizeof(BootThread_Stack), 30,10);
    os_thread_startup(&BootThread);

//    Test_Printf_Init();

    os_kernel_startup();


    size_t nCount = 0;
    while(1) {
        sdk_ringbuffer_t* usart0_rx_buf = USE_USART0_GetRxBuffer();
        if(sdk_ringbuffer_used(usart0_rx_buf)>0){
            sdk_hex_dump("USART0", usart0_rx_buf->buffer, sdk_ringbuffer_used(usart0_rx_buf));            
        }
        os_printf("[main] ERROR count=%d\n", nCount++);
        for(int i=0; i<0x3FFFFFF; i++){}
    }
}
#else
int main(void)
{
    Board_Init();

    os_thread_init(&BootThread, "Boot", BootThread_Entry, 0
            , BootThread_Stack, sizeof(BootThread_Stack), 30,10);
    os_thread_startup(&BootThread);

    Test_Printf_Init();

    os_kernel_startup();


    while(1){}
}
#endif