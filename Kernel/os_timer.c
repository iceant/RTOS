#include <os_timer.h>
#include <os_macros.h>
#include <cpu.h>
#include <os_scheduler.h>
////////////////////////////////////////////////////////////////////////////////
////

/* 111111 111111 111111 111111 11111111 */
#define TVN_BITS (6)
#define TVR_BITS (8)
#define TVN_SIZE (1 << TVN_BITS)
#define TVR_SIZE (1 << TVR_BITS)
#define TVN_MASK (TVN_SIZE - 1)
#define TVR_MASK (TVR_SIZE - 1)

#define TVR_MAX 0xFF
#define TV0_MAX 0x3FFF
#define TV1_MAX 0xFFFFF
#define TV2_MAX 0x3FFFFFF
#define TV3_MAX 0xFFFFFFFF

/*第一个圈的指针位置*/
#define FIRST_INDEX(v) ((v) & TVR_MASK)

/*第n圈的指针位置, n!=1*/
#define NTH_INDEX(v, n) (((v) >> (TVR_BITS + (n) * TVN_BITS)) & TVN_MASK)

////////////////////////////////////////////////////////////////////////////////
////
static volatile os_tick_t os_timer__current_tick;
static os_list_t os_timer__tvroot;
static os_list_t os_timer__tv[4]={0};

////////////////////////////////////////////////////////////////////////////////
////
static void os_timer__add(os_timer_t * timer){
    if(timer==0) return;
    register os_list_t * head = 0;

    if(timer->expire_tick <= TVR_MAX){
        head = &os_timer__tvroot;
    }else if(timer->expire_tick <= TV0_MAX){
        head = &os_timer__tv[0];
    }else if(timer->expire_tick <= TV1_MAX){
        head = &os_timer__tv[1];
    }else if(timer->expire_tick <= TV2_MAX){
        head = &os_timer__tv[2];
    }else if(timer->expire_tick <= TV3_MAX){
        head = &os_timer__tv[3];
    }
    OS_LIST_REMOVE(&timer->wait_node);
    OS_LIST_INSERT_BEFORE(head, &timer->wait_node);
}

////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_timer_init(void)
{
    os_size_t i;
    os_timer__current_tick = 0;
    OS_LIST_INIT(&os_timer__tvroot);
    for(i=0; i< OS_ARRAY_SIZE(os_timer__tv); i++){
        OS_LIST_INIT(&os_timer__tv[i]);
    }
    return OS_ERR_OK;
}

os_err_t os_timer_add(os_timer_t * timer, os_timer_timeout_t timeout, void * userdata, os_tick_t ticks, int flags)
{

    timer->timeout = timeout;
    timer->userdata = userdata;
    timer->ticks = ticks;
    timer->expire_tick = os_timer__current_tick + timer->ticks;
    timer->flags = flags;

    os_timer__add(timer);

    return OS_ERR_OK;
}

os_err_t os_timer_remove(os_timer_t * timer)
{
    if(!timer) return OS_ERR_EINVAL;

    cpu_interrupt_context_t ctx;
    cpu_interrupt_disable(&ctx);

    OS_LIST_REMOVE(&timer->wait_node);

    cpu_interrupt_enable(&ctx);

    return OS_ERR_OK;
}


os_bool_t os_timer_tick(void){

    register os_list_t * head=0;
    register os_list_node_t * node=0;
    register os_timer_t * timer=0;
    register os_bool_t need_schedule = OS_FALSE;

    os_timer__current_tick++;

    if(os_timer__current_tick <= TVR_MAX){
        head = &os_timer__tvroot;
    }else if(os_timer__current_tick <= TV0_MAX){
        head = &os_timer__tv[0];
    }else if(os_timer__current_tick <= TV1_MAX){
        head = &os_timer__tv[1];
    }else if(os_timer__current_tick <= TV2_MAX){
        head = &os_timer__tv[2];
    }else if(os_timer__current_tick <= TV3_MAX){
        head = &os_timer__tv[3];
    }

    if(OS_LIST_IS_EMPTY(head)){
        return need_schedule;
    }

    for(node = OS_LIST_NEXT(head); node!=head; ){
        timer = OS_CONTAINER_OF(node, os_timer_t, wait_node);
        node = OS_LIST_NEXT(node);
        if(timer->expire_tick <= os_timer__current_tick){
            // TODO: run in a thread
            need_schedule = OS_TRUE;
            if(timer->timeout){
                timer->timeout(timer, timer->userdata);
            }
            if(timer->flags & OS_TIMER_FLAG_REPEAT){
                timer->expire_tick = os_timer__current_tick + timer->ticks;
                os_timer__add(timer);
            }else{
                OS_LIST_REMOVE(&timer->wait_node);
            }
        }
    }

    return need_schedule;

}


os_err_t os_timer_node_init(os_timer_t * timer)
{
    if(!timer) return OS_ERR_EINVAL;

    OS_LIST_INIT(&timer->wait_node);
    timer->expire_tick = 0;
    timer->ticks = 0;
    timer->flags = 0;
    timer->userdata = 0;
    timer->timeout = 0;

    return OS_ERR_OK;
}
