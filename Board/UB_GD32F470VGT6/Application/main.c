#include "main.h"
#include <os_kernel.h>
#include <board.h>
#include <sdk_hex.h>
#include <sdk_fmt.h>
#include <string.h>
#include <sdk_float_fmt.h>
#include <meter_protocol.h>
#include <mcu_session.h>

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
static char time_display_buf[32];

static void BootThread_Entry(void* p){
    int err;

    printf("[APP] Boot Thread Startup...\n");

#if defined(ENABLE_LED)
    BSP_LED1_On();
    BSP_LED2_Off();
    BSP_LED3_Off();
    BSP_LED4_Off();
#endif

#if defined(ENABLE_OLED)
    os_critical_enter();
    int OLED__line = 1;
    printf("[OLED] TurnOn\n");
    OLED_TurnOn();
    printf("[OLED] OK\n");
    OLED_ShowString(0, OLED__line++, "[OLED] OK        ", 12);
    os_critical_leave();
#endif

#if defined(ENABLE_SPI_FLASH)
    uint32_t FlashID = sFLASH_ReadID();
    printf("FlashID: %d(0x%08x)\r\n", FlashID, FlashID);
    printf("[EXT_FLASH] OK\n");
#if defined(ENABLE_OLED)
    OLED_ShowString(0, OLED__line++, "[EXT_FLASH] OK   ", 12);
#endif
#endif

#if defined(ENABLE_4G)
    if(global_get()->network_disable==false){
        printf("[A7670C] Startup\n");
        A7670C_Result result = A7670C_Startup();
        if(result!=kA7670C_Result_OK){
            Board_Reboot();
            return;
        }
        printf("[A7670C] OK\n");
#if defined(ENABLE_OLED)
        OLED_ShowString(0, OLED__line++, "[4G] OK          ", 12);
#endif
        global_load_net_info();
    }
#endif


#if defined(ENABLE_4G)
    if(global_get()->network_disable==false) {
        /* 启动网络对时 */
#if defined(ENABLE_DS1307)
        printf("[NTP] Startup\n");
        Task_TimeSync_Init();
        os_thread_mdelay(2000);
        printf("[NTP] OK\n");
#if defined(ENABLE_OLED)
        OLED_ShowString(0, OLED__line++, "[NTP] OK          ", 12);
#endif
#endif

#if defined(ENABLE_MQTT)
        /*启动MQTT*/
        printf("[MQTT] Startup\n");
        err = MQTT_Init();
        if (err != 0) {
            Board_Reboot();
        }
        printf("[MQTT] OK\n");
#if defined(ENABLE_OLED)
        OLED_ShowString(0, OLED__line++, "[MQTT] OK          ", 12);
#endif

#endif /*defined(ENABLE_MQTT)*/
        printf("[HeartBeat] Startup\n");
        Task_HeartBeat_Init();
        printf("[HeartBeat] OK\n");
    }
#endif /* defined(ENABLE_4G) */

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
    printf("[METER] Startup\n");
    USE_CAN0_Init();
    printf("[METER] OK\n");
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
        OLED_ShowString(0, 1, time_display_buf, 12);
        #endif /*defined(ENABLE_OLED)*/
        #endif /* defined(ENABLE_DS1307) */

        mcu_session_t* mcu_session = mcu_session_get_default();
        mcu_session_pack(mcu_session, kMCU_PROTOCOL_DU_CPUID, (uint8_t*)BSP_CPUID_Read(), strlen(BSP_CPUID_Read()));
        mcu_session_send(mcu_session, 0, 0);

        os_thread_mdelay(1000);
    }

}


static void main__cpu_exception_handler(void* sp){
    Board_Reboot();
}
////////////////////////////////////////////////////////////////////////////////
////


#if (USE_RELEASE_VERSION)
int main(void)
{

    /* startup */
    Board_Init();

#if defined(ENABLE_LED)
    BSP_LED1_On();
    BSP_LED2_On();
    BSP_LED3_On();
    BSP_LED4_On();
#endif

    mcu_session_init(mcu_session_get_default());
    
    iap_check_upgrade();

    /* 加载全局数据 */
    global_init();

    /*初始化终端*/
    USE_USART0_Init();

    printf("========== APPLICATION ==========\n");

#if defined(ENABLE_SDCARD)
    USE_SD_CARD_Init();
#endif


#if defined(ENABLE_KEY)
    USE_KEY_Init();
#endif

    sdk_fmt_register('F', sdk_float_str_fmt);


//    dbg_print("__HXTAL: %d\n", HXTAL_VALUE);
//    dbg_print("SystemCoreClock: %ld\n", SystemCoreClock);
//    dbg_print("CK_SYS: %d\n", rcu_clock_freq_get(CK_SYS));
//    dbg_print("CK_AHB: %d\n", rcu_clock_freq_get(CK_AHB));
//    dbg_print("CK_APB1: %d\n", rcu_clock_freq_get(CK_APB1));
//    dbg_print("CK_APB2: %d\n", rcu_clock_freq_get(CK_APB2));
//    dbg_print("[CPUID] %s\n", BSP_CPUID_Read());

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

    global_init();

    os_thread_init(&BootThread, "Boot", BootThread_Entry, 0
            , BootThread_Stack, sizeof(BootThread_Stack), 30,10);
    os_thread_startup(&BootThread);

    Test_Printf_Init();

    os_kernel_startup();


    while(1){}
}
#endif