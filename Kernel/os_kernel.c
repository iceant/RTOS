#include <os_kernel.h>
#include <os_memory.h>

////////////////////////////////////////////////////////////////////////////////
////
#define FLAG_OFF    (0)
#define FLAG_START  (1)
#define FLAG_DONE   (2)

static int8_t os_kernel__init_flag = FLAG_OFF;
static int8_t os_kernel__startup_flag = FLAG_OFF;

////////////////////////////////////////////////////////////////////////////////
////

os_err_t os_kernel_init(void)
{
    if(os_kernel__init_flag>FLAG_OFF) return OS_ERROR;

    os_kernel__init_flag = FLAG_START;

    os_memory_init();
    
    os_timer_init();
    
    os_scheduler_init();
    
    os_idle_init();

    os_kernel_cpu_config();

    os_kernel__init_flag = FLAG_DONE;

    return OS_EOK;
}

os_err_t os_kernel_startup(void)
{
    if(os_kernel__init_flag!=FLAG_DONE) return OS_ESTATE;

    if(os_kernel__startup_flag>FLAG_OFF) return OS_ERROR;

    os_kernel__startup_flag = FLAG_START;

    os_err_t err = os_scheduler_schedule();
    if(err==OS_EOK){
        os_kernel__startup_flag = FLAG_DONE;
    }
    return err;
}

bool os_kernel_ready(void)
{
    return (os_kernel__init_flag==FLAG_DONE && os_kernel__startup_flag==FLAG_DONE);
}


