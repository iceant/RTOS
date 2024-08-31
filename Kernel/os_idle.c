#include <os_idle.h>
#include <os_thread.h>
/* -------------------------------------------------------------------------------------------------------------- */
/*  */

static os_idle_function_t os_idle__function_p;
static void* os_idle__function_parameter;

C_ALIGNED(OS_ALIGN_SIZE)
static uint8_t os_idle__stack[OS_THREAD_IDLE_STACK_SIZE];
static os_thread_t os_idle__thread;

static void os_idle__thread_entry(void* p){
    while(1){
        if(os_idle__function_p){
            os_idle__function_p(os_idle__function_parameter);
        }
    }
}

/* -------------------------------------------------------------------------------------------------------------- */
/*  */

void os_idle_init(void){
    OS_THREAD_INIT(&os_idle__thread, "idle", os_idle__thread_entry, 0, os_idle__stack, OS_THREAD_IDLE_STACK_SIZE, OS_THREAD_IDLE_PRIORITY, 10);
    os_thread_startup(&os_idle__thread);
}

void os_idle_register(os_idle_function_t function, void* ud){
    os_idle__function_p = function;
    os_idle__function_parameter = ud;
}

