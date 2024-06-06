#include <main.h>
#include <board.h>
#include <os_kernel.h>
#include <sdk_fmt.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////
////
#define BOOT_THREAD_STACK_SIZE 1024

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t BootThread_Stack[BOOT_THREAD_STACK_SIZE];
static os_thread_t BootThread;

////////////////////////////////////////////////////////////////////////////////
////
static void BootThread_Entry(void* p){
    os_size_t nCount = 0;
    char buf[32];

    while(1){
        int size = sdk_fmt_sfmt(buf, sizeof(buf), "Thread:%p, nCount:%d\n", os_thread_self(), nCount++);
        mcu_protocol_du_print(&mcu_protocol_g_tx_protocol, buf, size);

        os_thread_mdelay(1000);
    }
}



////////////////////////////////////////////////////////////////////////////////
////


int main(void){


    Board_Init();

#if 1
    os_kernel_init();

    USE_USART1_Init();

    os_thread_init(&BootThread, "BootThd", BootThread_Entry, 0, BootThread_Stack, sizeof(BootThread_Stack)
                   , 20, 10);
    os_thread_startup(&BootThread);

    os_kernel_startup();

#endif

#if 0
    char buf[32];
    uint32_t nCount = 0;

    char* message = "Hello";
    while(1) {
        int size = snprintf(buf, sizeof(buf), "Hello, %d", nCount++);
        mcu_protocol_du_print(&mcuProtocol, buf, size);
//        mcu_protocol_du_print(&mcuProtocol, message, strlen(message));

//        BSP_USART1_DMATx(message, strlen(message));

        for(uint32_t i=0; i<0x3ffffff; i++);
    }

#endif

    while(1);
    return 0;
}

