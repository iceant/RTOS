#include <main.h>
#include <gd32f4xx.h>
#include <board.h>
#include <stdio.h>
#include <os_kernel.h>
#include <sdk_hex.h>
#include <div0_test.h>

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t boot_thread_stack[1024];
static os_thread_t boot_thread;

static void boot_thread_entry(void* p){
    uint32_t nCount = 0;
    while(1){
        printf("nCount: %u, Tick:%u\n", nCount++, os_tick_get());
//        for(int i=0; i<0x3fffff; i++);
        os_thread_mdelay(1000);

//        div0_test();
    }
}

static size_t idle_count = 0;

static void idle_action(void* p){
    printf("idle...(%u)\n", idle_count++);
    for(int i=0; i<0x3fffff; i++);
//    os_thread_mdelay(1000);
}

static os_size_t USART0_RxIdx=0;
static uint8_t USART0_RxBuffer[512];
static os_sem_t USART0_RxSem;
static os_thread_t USART0_RxThread;
static uint8_t USART0_RxThreadStack[1024];


static void USART0_RxHandler(uint16_t ch, void* ud){
    USART0_RxBuffer[USART0_RxIdx++]=ch;
    if(USART0_RxIdx==512){
        memset(USART0_RxBuffer, 0, 512);
        USART0_RxIdx = 0;
    }
    os_sem_release(&USART0_RxSem);
}

static void USART0_RxThread_Entry(void* p){
    while(1){
//        while (USART0_RxIdx<2 ||
//            (USART0_RxBuffer[USART0_RxIdx-2]!='\r' && USART0_RxBuffer[USART0_RxIdx-1]!='\n')){
//            os_sem_take(&USART0_RxSem, OS_WAITING_INFINITY);
//        }
        while(USART0_RxIdx==0){
            os_sem_take(&USART0_RxSem, OS_WAITING_INFINITY);
        }

        if(USART0_RxBuffer[USART0_RxIdx-2]=='\r' && USART0_RxBuffer[USART0_RxIdx-1]=='\n')
        {
            sdk_hex_dump(USART0_RxBuffer, USART0_RxIdx, BSP_USART0_Printf);
            memset(USART0_RxBuffer, 0, OS_ARRAY_SIZE(USART0_RxBuffer));
            USART0_RxIdx = 0;
        }
    }
}

int main(void){
    Board_Init();

    idle_count = 0;

    printf("Board Init Done!\n");
    printf("SystemCoreClock:%u\n", SystemCoreClock);

    os_kernel_init();

//    os_idle_set_action(idle_action, 0);

    os_thread_init(&boot_thread, "boot"
    , boot_thread_entry, 0
    , boot_thread_stack, OS_ARRAY_SIZE(boot_thread_stack)
    , 20, 10, 0
    );

    os_thread_startup(&boot_thread);

    BSP_USART0_SetRxHandler(USART0_RxHandler, 0);
    os_sem_init(&USART0_RxSem, "USART0_RxSem", 0, OS_SEM_FLAG_FIFO);
    os_thread_init(&USART0_RxThread, "USART0"
            , USART0_RxThread_Entry, 0
            , USART0_RxThreadStack, OS_ARRAY_SIZE(USART0_RxThreadStack)
            , 20, 10, 0
    );

    os_thread_startup(&USART0_RxThread);


    printf("os_kernel_startup()...\n");
    os_kernel_startup();
    printf("os_kernel_startup()...done! ERROR Shoule Not Be Here!!!\n");

    while(1){
        printf("Tick:%u\n", os_scheduler__lock_nest);
    }

    return 0;
}