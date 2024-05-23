#include <os_timer.h>
#include <cpu.h>

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
static os_tick_t os_timer__current_tick;
static os_list_t os_timer__tvroot;
static os_list_t os_timer__tv[4]={0};
static cpu_lock_t os_timer__lock;
////////////////////////////////////////////////////////////////////////////////
////
static void os_timer__add(os_timer_t * timer){
    if(timer==0) return;
    register os_list_t * head;
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
#define OS_TIMER_LOCK() cpu_lock_lock(&os_timer__lock);
#define OS_TIMER_UNLOCK() cpu_lock_unlock(&os_timer__lock);


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
    cpu_lock_init(&os_timer__lock);
    return OS_TIMER_EOK;
}

os_err_t os_timer_add(os_timer_t * timer, os_timer_timeout_t timeout, void * userdata, os_tick_t ticks, int flags)
{
    if(timer==0) return OS_EINVAL;

    OS_TIMER_LOCK();
    
    timer->timeout = timeout;
    timer->userdata = userdata;
    timer->ticks = ticks;
    timer->expire_tick = os_timer__current_tick + timer->ticks;
    timer->flags = flags;

    os_timer__add(timer);

    OS_TIMER_UNLOCK();

    return OS_TIMER_EOK;
}

os_err_t os_timer_remove(os_timer_t * timer)
{
    if(!timer) return OS_EINVAL;
    OS_TIMER_LOCK();
    OS_LIST_REMOVE(&timer->wait_node);
    OS_TIMER_UNLOCK();

    return OS_TIMER_EOK;
}

os_bool_t os_timer_tick(void){

    register os_bool_t nee_schedule = OS_FALSE;
    register os_tick_t current_tick=0;
    register os_list_t * head=0;
    register os_list_node_t * node=0;
    register os_timer_t * timer=0;

    OS_TIMER_LOCK();

    os_timer__current_tick++;
    
    current_tick = os_timer__current_tick;

    if(current_tick <= TVR_MAX){
        head = &os_timer__tvroot;
    }else if(current_tick <= TV0_MAX){
        head = &os_timer__tv[0];
    }else if(current_tick <= TV1_MAX){
        head = &os_timer__tv[1];
    }else if(current_tick <= TV2_MAX){
        head = &os_timer__tv[2];
    }else if(current_tick <= TV3_MAX){
        head = &os_timer__tv[3];
    }

    if(OS_LIST_IS_EMPTY(head)){
        OS_TIMER_UNLOCK();
        return nee_schedule;
    }

    for(node = OS_LIST_NEXT(head); node!=head; ){
        timer = OS_CONTAINER_OF(node, os_timer_t, wait_node);
        node = OS_LIST_NEXT(node);
        if(timer->expire_tick <= current_tick){
            nee_schedule = OS_TRUE;
            if(timer->timeout){
                timer->timeout(timer, timer->userdata);
            }
            if(timer->flags & OS_TIMER_FLAG_REPEAT){
                timer->expire_tick = current_tick + timer->ticks;
                os_timer__add(timer);
            }else{
                OS_LIST_REMOVE(&timer->wait_node);
            }
        }
    }

    OS_TIMER_UNLOCK();

    return nee_schedule;

}


os_err_t os_timer_node_init(os_timer_t * timer)
{
    if(!timer) return OS_EINVAL;

    OS_LIST_INIT(&timer->wait_node);
    timer->expire_tick = 0;
    timer->ticks = 0;
    timer->flags = 0;
    timer->userdata = 0;
    timer->timeout = 0;

    return OS_EOK;
}
