#include <two_thread_yield_test.h>
#include <os_kernel.h>
#include <stdio.h>

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t stacks1[1024];

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t stacks2[1024];

static os_thread_t thread1;
static os_thread_t thread2;

static void worker(void* p){
    while(1){
        printf("[worker] %s, CONTROL=%d\n", os_thread_self()->name, cpu_get_control());
        os_thread_yield();
    }
}

void TowThreadYieldTest_Start(void)
{
    os_thread_init(&thread1, "worker1", worker, 0, stacks1, OS_ARRAY_SIZE(stacks1), 20, 10, 0);
    os_thread_startup(&thread1);


    os_thread_init(&thread2, "worker2", worker, 0, stacks2, OS_ARRAY_SIZE(stacks2), 20, 10, 0);
    os_thread_startup(&thread2);
}