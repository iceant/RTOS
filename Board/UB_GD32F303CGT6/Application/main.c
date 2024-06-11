#include <main.h>
#include <board.h>
#include <os_kernel.h>
#include <sdk_fmt.h>
#include <meter_protocol.h>
#include <mcu_protocol.h>
#include "global.h"
////////////////////////////////////////////////////////////////////////////////
////
C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t BootThread_Stack[1024];
static os_thread_t BootThread;
static char BootThread_Buf[256];
static void BootThread_Entry(void* p){

    /* 等待主控MCU启动 */
    os_thread_mdelay(5000);

    /* 通知主控，我已经启动了 */
    mcu_protocol_du_print(&mcu_protocol_g_tx_protocol, "GD303 Startup", 13);

    while(1){
        meter_protocol_datetime_t * datetime = meter_protocol_datetime_get();
        /* 每秒发送一次数据，测试TIMER的精度 */
        int sz = snprintf(BootThread_Buf, sizeof(BootThread_Buf), "Tick:%d, ID:%s, %04d-%02d-%02d %02d:%02d:%02d.%d"
                          , BSP_TIM6__TickCount
                          , strlen(global_get()->CPUID)?global_get()->CPUID:"N/A"
                          , datetime->year
                          , datetime->month
                          , datetime->date
                          , datetime->hour
                          , datetime->min
                          , datetime->sec
                          , BSP_TIM6__TickCount%1000);
        mcu_protocol_du_print(&mcu_protocol_g_tx_protocol, BootThread_Buf, sz);
//        mcu_protocol_du_print(&mcu_protocol_g_tx_protocol, "Hello", 5);
        os_thread_mdelay(1000);
    }
}

////////////////////////////////////////////////////////////////////////////////
////



int main(void){


    Board_Init();

#if 1
    os_kernel_init();

    /* 用于和 MCU 通讯 */
    USE_USART1_Init();

    USE_CAN0_Init();

    os_thread_init(&BootThread, "Boot", BootThread_Entry, 0
                   , BootThread_Stack, sizeof(BootThread_Stack), 20, 10);
    os_thread_startup(&BootThread);


    os_kernel_startup();

#endif

#if 0
    char buf[128];
    uint32_t nCount = 0;

    char* message = "Hello";
    while(1) {
        int size = snprintf(buf, sizeof(buf), "Hello, %d", BSP_TIM6__TickCount);
        mcu_protocol_du_print(&mcu_protocol_g_tx_protocol, buf, size);
//        mcu_protocol_du_print(&mcu_protocol_g_tx_protocol, message, strlen(message));

//        BSP_USART1_DMATx(message, strlen(message));

        for(uint32_t i=0; i<0x3ffffff; i++);
    }

#endif

    while(1);
    return 0;
}

