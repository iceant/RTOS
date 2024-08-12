#include <main.h>
#include <board.h>
#include <os_kernel.h>
#include <sdk_fmt.h>


////////////////////////////////////////////////////////////////////////////////
////

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t BootThread_Stack[1024];
static os_thread_t BootThread;

static void BootThread_Entry(void* p){
    int nCount = 0;
    while(1){
        printf("Hello %d! Tick:%u\n", nCount++, BSP_TIM6__TickCount);
        os_thread_mdelay(1000);
    }
}

////////////////////////////////////////////////////////////////////////////////
////



int main(void){


    Board_Init();

    os_kernel_init();

    os_thread_init(&BootThread, "Boot", BootThread_Entry, 0
                   , BootThread_Stack, sizeof(BootThread_Stack), 20, 10);
    os_thread_startup(&BootThread);


    os_kernel_startup();


    while(1);
    return 0;
}

