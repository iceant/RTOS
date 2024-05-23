#include <test_printf.h>
#include <os_kernel.h>

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t task1_stack[1024];
static os_thread_t task1;

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t task2_stack[1024];
static os_thread_t task2;

static void thread_entry(void* o){
    int nCount = 0;
    while(1){
        os_printf("[%s] %ld\n", os_thread_self()->name, nCount++);
        os_thread_yield();
    }
}

void Test_Printf_Init(void)
{
    os_thread_init(&task1, "Task1", thread_entry, 0, task1_stack, sizeof(task1_stack), 20, 1000);
    os_thread_startup(&task1);

    os_thread_init(&task2, "Task2", thread_entry, 0, task2_stack, sizeof(task2_stack), 20, 1000);
    os_thread_startup(&task2);
}