#include <os_idle.h>

////////////////////////////////////////////////////////////////////////////////
////
C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t os_idle__stack[OS_KERNEL_IDLE_THREAD_STACK_SIZE];
static os_thread_t os_idle__thread;
static os_idle_action_t os_idle__action;
static void* os_idle__action_ud;

static void os_idle__thread_entry(void*  p){
    while(1){
        if(os_idle__action){
            os_idle__action(os_idle__action_ud);
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
////
void os_idle_init(void){
    os_idle__action = 0;
    os_idle__action_ud = 0;
}

void os_idle_startup(void)
{
    os_thread_init(&os_idle__thread, "idle", os_idle__thread_entry, 0
                   , os_idle__stack, OS_KERNEL_IDLE_THREAD_STACK_SIZE
                   , OS_KERNEL_IDLE_THREAD_PRIORITY, OS_KERNEL_IDLE_THREAD_TICKS, 0);

    os_thread_startup(&os_idle__thread);
}

void os_idle_set_action(os_idle_action_t action, void* ud)
{
    os_idle__action = action;
    os_idle__action_ud = ud;
}