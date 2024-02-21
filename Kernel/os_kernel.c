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

os_err_t os_kernel_init(os_err_t (*os_kernel_init_on_start)(void), os_err_t (*os_kernel_init_on_finished)(void))
{
    os_err_t err;

    if(os_kernel__init_flag>FLAG_OFF) return OS_ERROR;

    os_kernel__init_flag = FLAG_START;

    if(os_kernel_init_on_start){
        err = os_kernel_init_on_start();
        if(err!=OS_EOK){
            return err;
        }
    }

    os_memory_init();
    
    os_timer_init();
    
    os_scheduler_init();
    
    os_idle_init();

    if(os_kernel_init_on_finished){
        err = os_kernel_init_on_finished();
        if(err!=OS_EOK){
            return err;
        }
    }

    err = OS_EOK;
    os_kernel__init_flag = FLAG_DONE;
    return err;
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


