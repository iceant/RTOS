#include "main.h"
#include "board.h"
#include "mcu_session.h"
#include <os_kernel.h>
#include <delay.h>
#include <iap.h>
#include <use_usart1.h>


////////////////////////////////////////////////////////////////////////////////
////

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t BootThread_Stack[1024];
static os_thread_t BootThread;

static void BootThread_Entry(void* p){

    mcu_session_printf(mcu_session_get_default(), "==== BOOTLOADER:%s ====", BSP_CPUID_Read());

    iap_check_upgrade();


    /* no need to upgrade */
    iap_jump(IAP_FW_APP_ADDRESS);

    while(1){
        mcu_session_printf(mcu_session_get_default(), "==== BOOTLOADER:%s ====", BSP_CPUID_Read());
        os_thread_mdelay(86400000);
    }
}
////////////////////////////////////////////////////////////////////////////////
////

int main(void){

    Board_Init();
    os_kernel_init();

    mcu_session_init(mcu_session_get_default());
    USE_USART1_Init();


    os_thread_init(&BootThread, "BootThd", BootThread_Entry, 0
                   , BootThread_Stack, sizeof(BootThread_Stack), 20, 10);
    os_thread_startup(&BootThread);

    os_kernel_startup();


    while(1);

    return 0;
}