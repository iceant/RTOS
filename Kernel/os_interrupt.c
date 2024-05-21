#include <os_interrupt.h>
#include <cpu_atomic.h>
#include <os_scheduler.h>
////////////////////////////////////////////////////////////////////////////////
////
static volatile os_uint_t os_interrupt__nest = 0;



////////////////////////////////////////////////////////////////////////////////
////

void os_interrupt_init(void){
    os_interrupt__nest = 0;
}

void os_interrupt_enter(void)
{
    cpu_atomic_add_return((cpu_atomic_t*)&os_interrupt__nest, 1);
}

void os_interrupt_exit(void){
    cpu_atomic_sub_return((cpu_atomic_t*)&os_interrupt__nest, 1);
//    if(result > 0U){
//        /* 有嵌套的中断还在运行 */
//        return;
//    }
//    if(result==0U){
        /* 检查是否有需要调度的 */
//        if(os_scheduler_skipped()>0){
//            os_scheduler_schedule();
//        }
//    }
}

os_uint_t os_interrupt_nest(void){
    return os_interrupt__nest;
}

