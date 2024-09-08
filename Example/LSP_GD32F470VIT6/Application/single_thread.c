#include <single_thread.h>
#include <os_kernel.h>
#include <printf.h>

/* -------------------------------------------------------------------------------------------------------------- */
static uint8_t single_thread_stack[1024];
static os_thread_t single_thread;

static void single_thread_entry(void* p){
    int nCount = 0;
    while(1){
        printf("[SingleThread] %d\n", nCount++);
        os_thread_mdelay(1000);
    }
}
/* -------------------------------------------------------------------------------------------------------------- */


void single_thread_startup(void)
{
    os_thread_init(&single_thread, "Single", single_thread_entry, 0
    , single_thread_stack, 1024, single_thread_stack+1024-CPU_STACK_MINIMAL_NBR
    , 10, 20, 0, 0);
    
    os_thread_startup(&single_thread);
}