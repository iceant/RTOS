#include <test_two_yield_thread.h>
#include <os_kernel.h>
#include <stdio.h>
#include <cpu.h>

static uint8_t stacks1[1024];
static uint8_t stacks2[1024];
static os_thread_t thread1;
static os_thread_t thread2;
static void thread_entry(void* p){
    uint8_t  nStopFlag = 0;
    while(1)
    {
        printf("%s\n", os_thread_self()->name);
        if(thread1.state==thread2.state){
            while(nStopFlag==0);
        }
        os_thread_yield();
    }
}

void TestTwoYieldThread(void){
    os_thread_init(&thread1, "thread1", thread_entry, 0, stacks1, OS_ARRAY_SIZE(stacks1), 20, 10, 0);
    os_thread_startup(&thread1);
    
    os_thread_init(&thread2, "thread2", thread_entry, 0, stacks2, OS_ARRAY_SIZE(stacks2), 20, 10, 0);
    os_thread_startup(&thread2);
}