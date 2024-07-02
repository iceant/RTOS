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
static uint8_t BootThread_Stack[4096];
static os_thread_t BootThread;

////////////////////////////////////////////////////////////////////////////////
////


static void BootThread_Entry(void* p){
    char time_display_buf[32];
    int err;

    printf("[APP] Boot Thread Startup...\n");

#if defined(ENABLE_OLED)
    int OLED__line = 0;
    OLED_TurnOn();
    OLED_ShowString(0, OLED__line++, "[OLED] OK        ", 12);
#endif


#if defined(ENABLE_SPI_FLASH)
    uint32_t FlashID = sFLASH_ReadID();
    os_printf("FlashID: %d(0x%08x)\r\n", FlashID, FlashID);
#if defined(ENABLE_OLED)
    OLED_ShowString(0, OLED__line++, "[EXT_FLASH] OK   ", 12);
#endif
#endif

#if defined(ENABLE_4G)
    A7670C_Result result = A7670C_Startup();
    if(result!=kA7670C_Result_OK){
        Board_Reboot();
        return;
    }
#if defined(ENABLE_OLED)
    OLED_ShowString(0, OLED__line++, "[4G] OK          ", 12);
#endif
    global_load_net_info();
#endif


#if defined(ENABLE_4G)
    /* 启动网络对时 */
#if defined(ENABLE_DS1307)
    Task_TimeSync_Init();
    os_thread_mdelay(2000);
#if defined(ENABLE_OLED)
    OLED_ShowString(0, OLED__line++, "[NTP] OK          ", 12);
#endif
#endif

#if defined(ENABLE_MQTT)
    /*启动MQTT*/
    err = MQTT_Init();
    if(err!=0){
        Board_Reboot();
    }
    #endif /*defined(ENABLE_MQTT)*/

#if defined(ENABLE_OLED)
    OLED_ShowString(0, OLED__line++, "[MQTT] OK          ", 12);
#endif

    Task_HeartBeat_Init();
#endif

#if defined(ENABLE_GD32F303)
    /* 与 GD32F303CGT6 通讯 */
    USE_USART2_Init();
    /* 与 GD32F303CGT6 同步时间 */
    Task_MCU_DateTime_Init();

#if defined(ENABLE_OLED)
    OLED_ShowString(0, OLED__line++, "[CAN] OK          ", 12);
#endif

#endif


#if defined(ENABLE_CAN0)
    USE_CAN0_Init();
#if defined(ENABLE_OLED)
    OLED_ShowString(0, OLED__line++, "[METER] OK          ", 12);
#endif

#endif

    /* 更新 GLOBAL 里的时间 */
#if defined(ENABLE_OLED)
    OLED_Clear();
#endif

    while(1){
        #if defined(ENABLE_DS1307)
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
#if defined(ENABLE_OLED)
        OLED_ShowString(0, 0, time_display_buf, 12);
#endif
        #endif /* defined(ENABLE_DS1307) */
        
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
    /* startup */
    Board_Init();

    /* 加载全局数据 */
    global_init();

    /*初始化终端*/
    USE_USART0_Init();

#if defined(ENABLE_SDCARD)
    USE_SD_CARD_Init();
#endif


#if defined(ENABLE_KEY)
    USE_KEY_Init();
#endif

    sdk_fmt_register('F', sdk_float_str_fmt);

    dbg_print("__HXTAL: %d\n", HXTAL_VALUE);
    dbg_print("SystemCoreClock: %ld\n", SystemCoreClock);
    dbg_print("CK_SYS: %d\n", rcu_clock_freq_get(CK_SYS));
    dbg_print("CK_AHB: %d\n", rcu_clock_freq_get(CK_AHB));
    dbg_print("CK_APB1: %d\n", rcu_clock_freq_get(CK_APB1));
    dbg_print("CK_APB2: %d\n", rcu_clock_freq_get(CK_APB2));
    dbg_print("[CPUID] %s\n", BSP_CPUID_Read());

    /*启动*/
    os_thread_init(&BootThread, "Boot", BootThread_Entry, 0
                   , BootThread_Stack, sizeof(BootThread_Stack), 20,10);
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