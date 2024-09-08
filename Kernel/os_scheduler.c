#include <os_scheduler.h>
#include <cpu.h>
#include <cpu_kernel_functions.h>
#include <os_priority.h>
#include <os_readylist.h>
#include <os_macros.h>
#include <os_timewheel.h>
#include <assert.h>
#include <os_sem.h>
#include <os_mutex.h>
#include <os_memory.h>
/* -------------------------------------------------------------------------------------------------------------- */
/* CONTROL */
#define OS_SCHEDULER_LOCK_VAR() cpu_uint_t os_scheduler__lock_var__;
#define OS_SCHEDULER_LOCK()     os_scheduler__lock_var__ = cpu_local_basepri_disable(OS_LOCK_BASE_PRIORITY)
#define OS_SCHEDULER_UNLOCK()   cpu_local_basepri_enable(os_scheduler__lock_var__)


/* -------------------------------------------------------------------------------------------------------------- */
/* EXTERNAL VARIABLES */
os_uint_t os_scheduler__disable_nest;
os_uint_t os_scheduler__interrupt_nest;
os_tick_t os_scheduler__systick;
os_thread_t * os_scheduler__current_thread_p;
os_thread_t * os_scheduler__delay_thread_p;
os_bool_t os_scheduler__need_schedule;

/* -------------------------------------------------------------------------------------------------------------- */
/* STATIC VARIABLES */
static os_bool_t os_scheduler__startup_flag;
static int os_scheduler__schedule_wip_flag;
static os_priority_t os_scheduler__highest_priority;
static os_thread_t * os_scheduler__highest_thread_p;
static os_list_t os_scheduler__wait_list;
/* -------------------------------------------------------------------------------------------------------------- */
/* STATIC FUNCTIONS */
C_STATIC_FORCEINLINE void os_scheduler__push_back_ready(os_thread_t * thread){
    thread->state = OS_THREAD_STATE_READY;
    thread->remain_ticks = 0;
    os_readylist_push_back(thread);
}

C_STATIC_FORCEINLINE void os_scheduler__push_front_ready(os_thread_t * thread){
    thread->state = OS_THREAD_STATE_READY;
    thread->remain_ticks = 0;
    os_readylist_push_front(thread);
}


C_STATIC_FORCEINLINE void os_scheduler__wait_push_back(os_thread_t * thread){
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_INSERT_BEFORE(&os_scheduler__wait_list, &thread->ready_node);
}

C_STATIC_FORCEINLINE void os_scheduler__wait_push_front(os_thread_t * thread){
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_INSERT_BEFORE(&os_scheduler__wait_list, &thread->ready_node);
}


/* -------------------------------------------------------------------------------------------------------------- */
/* SVC FUNCTIONS */

static void os_scheduler__svc_schedule(cpu_uint_t * args, cpu_uint_t* result){
//    cpu_uint_t R0 = args[0];
//    cpu_uint_t R1 = args[1];
//    cpu_uint_t R2 = args[2];
//    cpu_uint_t R3 = args[3];
//    cpu_uint_t R12 = args[4];
//    cpu_uint_t LR = args[5];
//    cpu_uint_t PC = args[6];
//    cpu_uint_t xPSR = args[7];

    *result = os_scheduler_schedule();
}

static void os_scheduler__svc_thread_resume(cpu_uint_t * args, cpu_uint_t* result){
    os_thread_t* thread_p = (os_thread_t*)args[0];
    *result = os_scheduler_resume(thread_p);
}

static void os_scheduler__svc_thread_yield(cpu_uint_t * args, cpu_uint_t* result){
    os_thread_t* thread_p = (os_thread_t*)args[0];
    *result = os_scheduler_yield(thread_p);
}


static void os_scheduler__svc_thread_delay(cpu_uint_t * args, cpu_uint_t* result){
    os_thread_t* thread_p = (os_thread_t*)args[0];
    os_tick_t ticks = (os_tick_t)args[1];
    *result = os_scheduler_delay(thread_p, ticks);
}

extern os_err_t os_sem_take_in_kernel(os_sem_t* sem, os_tick_t ticks);
extern os_err_t os_sem_release_in_kernel(os_sem_t* sem);

static void os_sem__svc_take(cpu_uint_t * args, cpu_uint_t* result){
    os_sem_t * p = (os_sem_t*)args[0];
    os_tick_t ticks = (os_tick_t)args[1];
    *result = os_sem_take_in_kernel(p, ticks);
}

static void os_sem__svc_release(cpu_uint_t * args, cpu_uint_t* result){
    os_sem_t * p = (os_sem_t*)args[0];
    *result = os_sem_release_in_kernel(p);
}

extern os_err_t os_mutex_take_in_kernel(os_mutex_t* mutex, os_tick_t ticks);
extern os_err_t os_mutex_release_in_kernel(os_mutex_t* mutex);

static void os_mutex__svc_take(cpu_uint_t * args, cpu_uint_t* result){
    os_mutex_t * p = (os_mutex_t*)args[0];
    os_tick_t ticks = (os_tick_t)args[1];
    *result = os_mutex_take_in_kernel(p, ticks);
}

static void os_mutex__svc_release(cpu_uint_t * args, cpu_uint_t* result){
    os_mutex_t * p = (os_mutex_t*)args[0];
    *result = os_mutex_release_in_kernel(p);
}

static void os_scheduler__lock(cpu_uint_t * args, cpu_uint_t* result){
    cpu_uint_t level = (cpu_uint_t)args[0];
    *result = cpu_local_basepri_disable(level);
}

static void os_scheduler__unlock(cpu_uint_t * args, cpu_uint_t* result){
    cpu_local_basepri_enable(args[0]);
    *result = 0;
}

static void os_scheduler__thread_exit_in_kernel(os_thread_t* thread){
    OS_SCHEDULER_LOCK_VAR();
    OS_SCHEDULER_LOCK();
    if(thread){
        if(thread->exit_function){
            thread->exit_function(thread);
        }
        thread->state = -1;
        OS_LIST_REMOVE(&thread->ready_node);
        OS_LIST_REMOVE(&thread->timer_node.timer_node);
        OS_LIST_REMOVE(&thread->pend_node);

        if((OS_BIT_GET(thread->flag, OS_THREAD_FLAG_CREATE_BIT)) == OS_THREAD_FLAG_CREATE_NEW){
            OS_FREE(thread);
        }
    }
    os_scheduler__current_thread_p = 0;
    OS_SCHEDULER_UNLOCK();
}

static void os_scheduler__thread_exit(cpu_uint_t * args, cpu_uint_t * result){
    os_scheduler__thread_exit_in_kernel((os_thread_t*)args[0]);
    *result = 0;
}

static os_err_t os_scheduler_yield_no_schedule(os_thread_t* thread)
{
    assert(thread->state==OS_THREAD_STATE_RUNNING);
    OS_SCHEDULER_LOCK_VAR();
    OS_SCHEDULER_LOCK();
    thread->state = OS_THREAD_STATE_YIELD;
    thread->remain_ticks = 0;
    os_scheduler__wait_push_back(thread);
    OS_SCHEDULER_UNLOCK();
    return OS_ERR_OK;
}
/* -------------------------------------------------------------------------------------------------------------- */
/*  */

static void os_scheduler__schedule_callback(void){
    os_scheduler__current_thread_p = os_scheduler__highest_thread_p;
    os_scheduler__current_thread_p->remain_ticks = os_scheduler__current_thread_p->init_ticks;
    os_scheduler__current_thread_p->state = OS_THREAD_STATE_RUNNING;
    os_scheduler__schedule_wip_flag = 0;
}

/* -------------------------------------------------------------------------------------------------------------- */
/* PUBLIC FUNCTIONS */
os_err_t os_scheduler_init(void)
{
    
    os_scheduler__disable_nest = 0;
    os_scheduler__interrupt_nest = 0;
    os_scheduler__systick = 0;
    os_scheduler__current_thread_p = 0;
    os_scheduler__need_schedule = OS_FALSE;
    os_scheduler__schedule_wip_flag = 0;
    os_scheduler__highest_priority = OS_PRIORITY_MAX;
    os_scheduler__highest_thread_p = 0;
    os_scheduler__startup_flag = OS_FALSE;
    OS_LIST_INIT(&os_scheduler__wait_list);
    
    cpu_kernel_register(1, os_scheduler__svc_schedule);
    cpu_kernel_register(2, os_scheduler__svc_thread_resume);
    cpu_kernel_register(3, os_scheduler__svc_thread_yield);
    cpu_kernel_register(4, os_scheduler__svc_thread_delay);
    cpu_kernel_register(5, os_sem__svc_take);
    cpu_kernel_register(6, os_sem__svc_release);
    cpu_kernel_register(7, os_mutex__svc_take);
    cpu_kernel_register(8, os_mutex__svc_release);
    cpu_kernel_register(9, os_scheduler__thread_exit);

    return OS_ERR_OK;
}

os_err_t os_scheduler_thread_exit(os_thread_t * thread){
    if(cpu_in_privilege()){
        os_scheduler__thread_exit_in_kernel(thread);
        os_scheduler__need_schedule = OS_TRUE;
    }else{
        cpu_kernel_thread_exit(thread);
    }
    return OS_ERR_OK;
}


os_err_t os_scheduler_startup(void)
{
    os_scheduler__startup_flag = OS_TRUE;
    return os_scheduler_schedule();
}

os_err_t os_scheduler_systick(void){
    os_err_t err;
    OS_SCHEDULER_LOCK_VAR();
    OS_SCHEDULER_LOCK();
    
    if(os_scheduler__startup_flag==OS_FALSE){
        OS_SCHEDULER_UNLOCK();
        return OS_SCHEDULER_ERR_NOT_STARTED;
    }
    
    if(os_scheduler__disable_nest>0u){
        /* scheduler disabled, skip tick */
        OS_SCHEDULER_UNLOCK();
        return OS_SCHEDULER_ERR_DISABLED;
    }

    os_scheduler__systick++;

    if(os_scheduler__current_thread_p && os_scheduler__current_thread_p->state==OS_THREAD_STATE_RUNNING){

        if(os_scheduler__current_thread_p->remain_ticks>0u){
            os_scheduler__current_thread_p->remain_ticks--;
        }
        if(os_scheduler__current_thread_p->remain_ticks==0){
            os_scheduler__push_back_ready(os_scheduler__current_thread_p);
            os_scheduler__need_schedule = OS_TRUE;
        }

    }

    err = os_timewheel_tick();

    if(err==OS_TIMEWHEEL_RET_NEED_SCHEDULE){
        os_scheduler__need_schedule = OS_TRUE;
    }

//    if(os_scheduler__need_schedule && os_scheduler__delay_thread_p!=0){
//        /* 紧急调度 */
//        int cmp = os_priority_cmp(os_scheduler__current_thread_p->current_priority, os_scheduler__delay_thread_p->current_priority);
//        if(cmp==OS_PRIORITY_CMP_LOW){
//            os_scheduler_yield_no_schedule(os_scheduler__current_thread_p);
//            os_scheduler__need_schedule = OS_TRUE;
//            os_scheduler__delay_thread_p = 0;
//        }
//    }
//
//    if(os_scheduler__need_schedule){
//        OS_SCHEDULER_UNLOCK();
//        return os_scheduler_schedule();
//    }

    OS_SCHEDULER_UNLOCK();
    return OS_ERR_OK;
}

void os_scheduler_lock(void){
    os_scheduler__disable_nest++;
}

void os_scheduler_unlock(void){
    os_scheduler__disable_nest--;
}

os_err_t os_scheduler_schedule(void){
    OS_SCHEDULER_LOCK_VAR();
    
    if(os_scheduler__startup_flag==OS_FALSE){
        return OS_SCHEDULER_ERR_NOT_STARTED;
    }
    
    if(os_scheduler__disable_nest>0u){
        return OS_SCHEDULER_ERR_DISABLED;
    }
    
    if(os_scheduler__interrupt_nest>0u){
        return OS_SCHEDULER_ERR_IRQ_NEST;
    }
    
    if(os_scheduler__schedule_wip_flag==1){
        /* 同一时间只允许一个调度在运行 */
        return OS_SCHEDULER_ERR_WIP;
    }
    
    OS_SCHEDULER_LOCK();
    os_scheduler__schedule_wip_flag = 1;
    
    /* 找到最高优先级的任务，准备调度 */
    os_scheduler__highest_priority = os_priority_highest();
    os_scheduler__highest_thread_p = os_readylist_pop(os_scheduler__highest_priority);
    
    /* 将等待调度的任务加入列表 */
    os_list_node_t * node;
    for(node = OS_LIST_NEXT(&os_scheduler__wait_list); node!=&os_scheduler__wait_list; ){
        os_thread_t* thread = OS_LIST_CONTAINER(node, os_thread_t, ready_node);
        node = OS_LIST_NEXT(node);
        os_readylist_push_back(thread);
    }
    
    if(os_scheduler__highest_thread_p){
        if(os_scheduler__highest_thread_p->current_priority == OS_THREAD_IDLE_PRIORITY){
            /* IDLE THREAD Always In Queue */
            os_scheduler__push_back_ready(os_scheduler__highest_thread_p);
        }
    }else{
        os_scheduler__schedule_wip_flag = 0;
        OS_SCHEDULER_UNLOCK();
        return OS_SCHEDULER_ERR_NO_NEXT_THREAD;
    }
    
    if(os_scheduler__current_thread_p && (os_scheduler__current_thread_p->state == OS_THREAD_STATE_RUNNING)){
        if(os_priority_cmp(os_scheduler__current_thread_p->current_priority, os_scheduler__highest_priority)==OS_PRIORITY_CMP_HIGH){
            /* 不抢占, 放回调度表 */
            os_scheduler__push_front_ready(os_scheduler__highest_thread_p);
            os_scheduler__schedule_wip_flag = 0;
            OS_SCHEDULER_UNLOCK();
            return OS_SCHEDULER_ERR_CURRENT_THREAD_RUNNING;
        }else{
            /* 要调度的任务有相同或者更高优先级，抢占 */
            os_scheduler__push_back_ready(os_scheduler__current_thread_p);
        }
    }
    
    /* 调度成功，返回 */
    OS_SCHEDULER_UNLOCK();
    
    int err = cpu_stack_switch(os_scheduler__current_thread_p?&os_scheduler__current_thread_p->sp:0
            , &os_scheduler__highest_thread_p->sp, os_scheduler__schedule_callback);
    if(err!=CPU_STACK_OK){
        OS_SCHEDULER_LOCK();
        /* 调度失败了，可能之前已经有调度请求还没有完成, 将任务放回调度表，等待下次调度 */
        os_scheduler__push_front_ready(os_scheduler__highest_thread_p);
        os_scheduler__schedule_wip_flag = 0;
        OS_SCHEDULER_UNLOCK();
        return OS_SCHEDULER_ERR_FAILED;
    }
    
    return OS_SCHEDULER_ERR_OK;
}

os_err_t os_scheduler_schedule_in_thread(void){
    
    if(os_scheduler__startup_flag==OS_FALSE){
        return OS_SCHEDULER_ERR_NOT_STARTED;
    }
    
    return  cpu_kernel_schedule();
}

/* -------------------------------------------------------------------------------------------------------------- */
/* THREAD MANAGE FUNCTIONS */

os_err_t os_scheduler_suspend(os_thread_t * thread){
    OS_SCHEDULER_LOCK_VAR();
    OS_SCHEDULER_LOCK();
    thread->state = OS_THREAD_STATE_SUSPEND;
    thread->remain_ticks = 0;
    OS_SCHEDULER_UNLOCK();
    return OS_ERR_OK;
}

os_err_t os_scheduler_resume(os_thread_t* thread)
{
    OS_SCHEDULER_LOCK_VAR();
    OS_SCHEDULER_LOCK();
    os_scheduler__push_back_ready(thread);
    OS_SCHEDULER_UNLOCK();
    return os_scheduler_schedule();
}


os_err_t os_scheduler_yield(os_thread_t* thread)
{
    assert(thread->state==OS_THREAD_STATE_RUNNING);
    OS_SCHEDULER_LOCK_VAR();
    OS_SCHEDULER_LOCK();
    thread->state = OS_THREAD_STATE_YIELD;
    thread->remain_ticks = 0;
    os_scheduler__wait_push_back(thread);
    OS_SCHEDULER_UNLOCK();
    return os_scheduler_schedule();
}

static void os_scheduler__thread_timeout(os_timer_t* timer, os_tick_t tick_now){
//    os_thread_t * thread  = timer->userdata;
    os_thread_t* thread = OS_LIST_CONTAINER(timer, os_thread_t, timer_node);
    os_scheduler__push_back_ready(thread);
    thread->error = OS_BIT_SET(thread->error, OS_THREAD_ERR_TIMEOUT_POS);
}

os_err_t os_scheduler_delay(os_thread_t* thread, os_tick_t ticks){
    OS_SCHEDULER_LOCK_VAR();
    OS_SCHEDULER_LOCK();
    os_timewheel_add_timer(&thread->timer_node, ticks, os_scheduler__thread_timeout, thread, OS_TIMER_FLAG_ONCE);
    thread->state = OS_THREAD_STATE_DELAY;
    thread->remain_ticks = 0;
    OS_SCHEDULER_UNLOCK();
    return os_scheduler_schedule();
}

os_bool_t os_scheduler_interrupt_nest(){
    return os_scheduler__interrupt_nest>0u;
}

os_err_t os_scheduler_push_back_ready(os_thread_t* thread){
    os_scheduler__push_back_ready(thread);
    return OS_ERR_OK;
}
