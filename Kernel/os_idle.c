#include <os_idle.h>
#include <os_thread.h>

////////////////////////////////////////////////////////////////////////////////
////
C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t os_idle__task_stack[OS_IDLE_TASK_STACK_SIZE];

static os_thread_t os_idle__task;
static os_idle_handler os_idle__handler=0;
static void* os_idle__handler_parameter=0;

static void os_idle_thread(void* p){
    while(1){
        if(os_idle__handler){
            os_idle__handler(os_idle__handler_parameter);
        }
    }
}


////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_idle_init(void){
    os_thread_init(&os_idle__task, "idle", os_idle_thread, 0, os_idle__task_stack, sizeof(os_idle__task_stack), OS_PRIORITY_MAX-1, 5);
    os_thread_startup(&os_idle__task);
    return OS_EOK;
}

void os_idle_set_handler(os_idle_handler handler, void* p){
    os_idle__handler = handler;
    os_idle__handler_parameter = p;
}

