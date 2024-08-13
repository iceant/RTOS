#include <main.h>
#include <board.h>
#include <os_kernel.h>
#include <sdk_fmt.h>
#include <meter_protocol.h>
#include <mcu_session.h>
#include "global.h"
#include <iap.h>
#include <use_pulse.h>
////////////////////////////////////////////////////////////////////////////////
////

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t BootThread_Stack[1024];
static os_thread_t BootThread;

static void BootThread_Entry(void* p){

//    iap_check_upgrade();

    /* 通知主控，我已经启动了 */
    mcu_session_printf(mcu_session_get_default(), "GD303 Application Startup");
    printf("[GD303] SystemCoreClock: %d\n", SystemCoreClock);
    while(1){
#if 1
        global_t * global = global_get();
        /* 每秒发送一次数据，测试TIMER的精度 */
        mcu_session_printf(mcu_session_get_default(), "Tick:%d, ID:%s, %04d-%02d-%02d %02d:%02d:%02d.%d"
                , BSP_TIM6__TickCount
                , strlen(global_get()->CPUID)?global_get()->CPUID:"N/A"
                , global->datetime.year
                , global->datetime.month
                , global->datetime.date
                , global->datetime.hour
                , global->datetime.min
                , global->datetime.sec
                , BSP_TIM6__TickCount%1000);

        os_thread_mdelay(60000);

#endif

#if 0
        printf("Tim2.Tick:%u, Tim6.Tick=%u\n", BSP_TIM2__Ticks, BSP_TIM6__TickCount);
//        BSP_Pulse_Generate(1);
        os_thread_mdelay(1000);
#endif

    }
}


////////////////////////////////////////////////////////////////////////////////
////



int main(void){


    Board_Init();

#if 1
    os_kernel_init();

    global_init();

    mcu_session_init(mcu_session_get_default());

    /* 用于和 MCU 通讯 */
    USE_USART1_Init();

    USE_CAN0_Init();

    use_pulse_init();

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

