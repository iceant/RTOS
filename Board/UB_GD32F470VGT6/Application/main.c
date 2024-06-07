#include "main.h"
#include <os_kernel.h>
#include <board.h>
#include <sdk_hex.h>
#include <sdk_fmt.h>
#include <string.h>
#include <sdk_float_fmt.h>
#include <meter_protocol.h>

////////////////////////////////////////////////////////////////////////////////
////
#define dbg_print os_printf
#define USE_RELEASE_VERSION 1

////////////////////////////////////////////////////////////////////////////////
////

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t BootThread_Stack[2048];
static os_thread_t BootThread;

////////////////////////////////////////////////////////////////////////////////
////


static void BootThread_Entry(void* p){
    char time_display_buf[32];
    int err;
#if defined(ENABLE_SPI_FLASH)
    uint32_t FlashID = sFLASH_ReadID();
    os_printf("FlashID: %d(0x%08x)\r\n", FlashID, FlashID);
#endif

#if defined(ENABLE_OLED)
    OLED_TurnOn();
    OLED_ShowString(0, 0, "System Booting...", 12);
#endif

#if defined(ENABLE_4G)
    A7670C_Result result = A7670C_Startup();
    if(result!=kA7670C_Result_OK){
        cpu_reboot();
        return;
    }
#endif

    /* 加载全局数据, 可能读取 IMEI/ICCID */
    global_init();

#if defined(ENABLE_4G)
    /*启动MQTT*/
    err = MQTT_Init();
    if(err!=0){
        Board_Reboot();
    }

    /* 启动网络对时 */
    Task_TimeSync_Init();
#endif

#if defined(ENABLE_CAN0)
    USE_CAN0_Init();
#endif

    /* 与 GD32F303CGT6 通讯 */
    USE_USART2_Init();
    /* 与 GD32F303CGT6 同步时间 */
    Task_MCU_DateTime_Init();

    /* 更新 GLOBAL 里的时间 */

    while(1){
        uint16_t year = DS1307_GetYear();
        uint8_t month = DS1307_GetMonth();
        uint8_t date = DS1307_GetDate();
        uint8_t hour = DS1307_GetHour();
        uint8_t min = DS1307_GetMinute();
        uint8_t sec = DS1307_GetSecond();

        global_set_datetime(year, month, date, hour, min, sec);

        snprintf(time_display_buf, sizeof(time_display_buf), "%04d-%02d-%02d %02d:%02d:%02d"
                , year
                , month
                , date
                , hour
                , min
                , sec);

        os_printf("%s\n", time_display_buf);

        OLED_ShowString(0, 0, time_display_buf, 12);

        os_thread_mdelay(1000);
    }

}

////////////////////////////////////////////////////////////////////////////////
////


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
    dbg_print("CPUID: %s\n", BSP_CPUID_Read());

    /*初始化终端*/
    USE_USART0_Init();

    /*启动*/
    os_thread_init(&BootThread, "Boot", BootThread_Entry, 0
                   , BootThread_Stack, sizeof(BootThread_Stack), 30,10);
    os_thread_startup(&BootThread);


    os_kernel_startup();

    ////////////////////////////////////////////////////////////////////////////////
    //// 不应该运行以下代码

    while(1);
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