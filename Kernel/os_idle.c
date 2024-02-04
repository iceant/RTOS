#include <os_idle.h>
#include <stdio.h>
////////////////////////////////////////////////////////////////////////////////
////

#ifndef OS_IDLE_STACK_SIZE
    #define OS_IDLE_STACK_SIZE 512
#endif

#ifndef OS_IDLE_THREAD_PRIORITY
    #define OS_IDLE_THREAD_PRIORITY OS_PRIORITY_MAX-1
#endif

#ifndef OS_IDLE_THREAD_TIME_SLICE
    #define OS_IDLE_THREAD_TIME_SLICE 10
#endif

__ALIGNED(OS_ALIGN_SIZE)
static uint8_t os_idle__stack[OS_IDLE_STACK_SIZE];
static os_thread_t os_idle__thread;

static os_idle_hook os_idle__hook;
static void* os_idle__hook_parameter;

static void os_idle__thread_entry(void* p)
{
    while(1){
        if(os_idle__hook){
            os_idle__hook(os_idle__hook_parameter);
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_idle_init(void)
{
    os_thread_init(&os_idle__thread, "idle", &os_idle__thread_entry, 0, os_idle__stack, sizeof(os_idle__stack), OS_IDLE_THREAD_PRIORITY, OS_IDLE_THREAD_TIME_SLICE);
    os_thread_startup(&os_idle__thread);
    
    return OS_EOK;
}

void os_idle_set_hook(os_idle_hook hook, void* parameter)
{
    os_idle__hook = hook;
    os_idle__hook_parameter = parameter;
}

