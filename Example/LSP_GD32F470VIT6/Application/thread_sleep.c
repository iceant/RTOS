#include <thread_sleep.h>
#include <os_kernel.h>
#include <stdio.h>

static uint8_t stacks1[1024];
static os_thread_t thread1;

static uint8_t stacks2[1024];
static os_thread_t thread2;

static void thread_entry(void* p){
    uint32_t nCount = 0;
    int nSleepMs = (int)p;
    while(1){
        printf("[%s] nCount=%d, Tick=%u\n", os_thread_self()->name, nCount++, os_tick_get());
        os_thread_mdelay(nSleepMs);
    }
}

void thread_sleep_test(void)
{
    os_thread_init(&thread1, "sleep1", thread_entry, 500, stacks1, OS_ARRAY_SIZE(stacks1), 20, 10, 0);
    os_thread_startup(&thread1);
    
    os_thread_init(&thread2, "sleep2", thread_entry, 1000, stacks2, OS_ARRAY_SIZE(stacks2), 20, 10, 0);
    os_thread_startup(&thread2);
}