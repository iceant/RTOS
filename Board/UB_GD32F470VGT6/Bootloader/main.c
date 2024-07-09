#include "main.h"
#include "board.h"
#include "iap.h"
#include <os_kernel.h>
#include "use_usart0.h"
#include <A7670C.h>
#include <mcu_session.h>
#include <use_key.h>
#include <use_usart2.h>
////////////////////////////////////////////////////////////////////////////////
////
#define HW32_ADDR(ADDR) (*(volatile uint32_t*)(ADDR))
#define APPLICATION_ADDRESS (0x08010000U)

////////////////////////////////////////////////////////////////////////////////

static void delay_ms(uint32_t ms){
    for(uint32_t m=0; m<ms; m++){
        for(int i=0; i<1000; i++){
            for(int j=0; j<60; j++){
            }
        }
    }
}

static bool bootloader_need_upgrade(void){
    return false;
}

static void bootloader_exec_upgrade(void){
    while(1);
}

static void bootloader_jump(void* address){
//    Board_DeInit();
    iap_jump((uint32_t)address);
}

////////////////////////////////////////////////////////////////////////////////
////

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t BootThread_Stack[1024];
static os_thread_t BootThread;

static void BootThread_Entry(void* p){

#if defined(ENABLE_KEY)
    USE_KEY_Init();
#endif

#if defined(ENABLE_OLED)
    int OLED__line = 0;
    OLED_TurnOn();
    OLED_ShowString(0, OLED__line++, "Booting......     ", 12);
#endif

#if defined(ENABLE_4G)
    OLED_ShowString(0, OLED__line++, "[4G] Enable       ", 12);
    A7670C_Result result = A7670C_Startup();
    if(result!=kA7670C_Result_OK){
        Board_Reboot();
        return;
    }
    OLED_ShowString(0, OLED__line++, "[UPG] Check Upgrade", 12);
    iap_check_upgrade();
#endif

    printf("Jump To %p\n", APPLICATION_ADDRESS);
    iap_jump(APPLICATION_ADDRESS);

    while(1);

}

int main(void){

#if 1
    Board_Init();

    /*初始化终端*/
    USE_USART0_Init();

    USE_USART2_Init();

    printf("========== BOOTLOADER ==========\n");

    mcu_session_init(mcu_session_get_default());


    os_thread_init(&BootThread, "BootThd", BootThread_Entry, 0, BootThread_Stack, sizeof(BootThread_Stack), 20, 10);
    os_thread_startup(&BootThread);

    os_kernel_startup();

#else

    iap_jump(APPLICATION_ADDRESS);

#endif



    while(1);

    return 0;
}