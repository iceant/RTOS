#include <two_thread_yield_test.h>
#include <os_kernel.h>
//#include <stdio.h>
#include <sdk_fmt.h>
////////////////////////////////////////////////////////////////////////////////
////


C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t stacks1[1024];

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t stacks2[1024];

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t stacks3[1024];

static os_thread_t thread1;
static os_thread_t thread2;
static os_thread_t thread3;

static void worker(void* p){
    uint32_t nCount = 0;
    uint32_t delayMs = (uint32_t ) p;
    while(1){
//        sdk_fmt_print("[worker] %s, nCount=%u\n", os_thread_self()->name, nCount++);
//        printf("[worker] %s, nCount=%u\n", os_thread_self()->name, nCount++);
        printf("[worker] %s\n", os_thread_self()->name);
//        os_thread_mdelay(delayMs);
        os_thread_yield();
    }
}

void TowThreadYieldTest_Start(void)
{
    OS_THREAD_INIT(&thread1, "worker1", worker, (void*)300, stacks1, OS_ARRAY_SIZE(stacks1), 20, 10);
    os_thread_startup(&thread1);


    OS_THREAD_INIT(&thread2, "worker2", worker, (void*)200, stacks2, OS_ARRAY_SIZE(stacks2), 20, 10);
    os_thread_startup(&thread2);

//    os_thread_init(&thread3, "worker3", worker, (void*)100, stacks3, OS_ARRAY_SIZE(stacks3), 24, 10, 0);
//    os_thread_startup(&thread3);
}