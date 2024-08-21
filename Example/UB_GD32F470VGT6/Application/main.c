#include <main.h>
#include <gd32f4xx.h>
#include <board.h>
#include <stdio.h>
#include <os_kernel.h>

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t boot_thread_stack[1024];
static os_thread_t boot_thread;

static void boot_thread_entry(void* p){
    uint32_t nCount = 0;
    while(1){
        printf("nCount: %u\n", nCount++);
//        for(int i=0; i<0x3fffff; i++);
        os_thread_delay(10);
    }
}

static size_t idle_count = 0;

static void idle_action(void* p){
    printf("idle...(%u)\n", idle_count++);
    for(int i=0; i<0x3fffff; i++);
//    os_thread_mdelay(1000);
}

int main(void){
    Board_Init();

    idle_count = 0;

    printf("Board Init Done!\n");
    printf("SystemCoreClock:%u\n", SystemCoreClock);

    os_kernel_init();

    os_idle_set_action(idle_action, 0);

    os_thread_init(&boot_thread, "boot"
    , boot_thread_entry, 0
    , boot_thread_stack, OS_ARRAY_SIZE(boot_thread_stack)
    , 20, 10, 0
    );

    os_thread_startup(&boot_thread);

    printf("os_kernel_startup()...\n");
    os_kernel_startup();
    printf("os_kernel_startup()...done! ERROR Shoule Not Be Here!!!\n");

    while(1){
        printf("Tick:%u\n", os_scheduler__lock_nest);
    }

    return 0;
}