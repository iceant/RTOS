#include <os_timewheel.h>
#include <os_list.h>
#include <os_timer.h>
#include <os_macros.h>

/* -------------------------------------------------------------------------------------------------------------- */
/*
| TV5 | TV4 | TV3 | TV2 | TV1 |
  6b    6b    6b    6b    8b
*/

/* -------------------------------------------------------------------------------------------------------------- */
#define OS_TVR_BITS 8
#define OS_TVN_BITS 6
#define OS_TVN_SIZE (1<<OS_TVN_BITS)
#define OS_TVR_SIZE (1<<OS_TVR_BITS)

#define OS_TVN_MASK (OS_TVN_SIZE -1)        /* 0xFF */
#define OS_TVR_MASK (OS_TVR_SIZE -1)        /* 0x3F */

#define OS_TV_BITS(N) (OS_TVR_BITS + (N) * OS_TVN_BITS)
#define OS_TV_MAX(N) ((1 << OS_TV_BITS(N))-1)

#define OS_TV1_MAX OS_TV_MAX(0)
#define OS_TV2_MAX OS_TV_MAX(1)
#define OS_TV3_MAX OS_TV_MAX(2)
#define OS_TV4_MAX OS_TV_MAX(3)
#define OS_TV5_MAX 0xFFFFFFFFu

/* -------------------------------------------------------------------------------------------------------------- */

#define OS_TV_INIT(V) \
    for(os_size_t i=0; i<OS_ARRAY_SIZE(V); i++){ \
        OS_LIST_INIT(&V[i]);                     \
    }

#define OS_TV_INDEX(N) ((os_timewheel__current_tick >> (OS_TVR_BITS + (N) * OS_TVN_BITS)) & OS_TVN_MASK)

/* -------------------------------------------------------------------------------------------------------------- */
static os_list_t os_timewheel__1[OS_TVR_SIZE];
static os_list_t os_timewheel__2[OS_TVN_SIZE];
static os_list_t os_timewheel__3[OS_TVN_SIZE];
static os_list_t os_timewheel__4[OS_TVN_SIZE];
static os_list_t os_timewheel__5[OS_TVN_SIZE];
static os_tick_t os_timewheel__current_tick;


static os_err_t os_timewheel__add_timer_again(os_timer_t * timer, os_tick_t tick_now)
{
    register os_list_t * list_p = 0;

    timer->expires_tick = timer->ticks + tick_now;

    if(timer->expires_tick <= OS_TV1_MAX){
        list_p = &os_timewheel__1[timer->expires_tick & OS_TVR_MASK];
    }else if(timer->expires_tick <= OS_TV2_MAX){
        list_p = &os_timewheel__2[(timer->expires_tick >> OS_TV_BITS(0)) & OS_TVN_MASK];
    }else if(timer->expires_tick <= OS_TV3_MAX){
        list_p = &os_timewheel__3[(timer->expires_tick >> OS_TV_BITS(1)) & OS_TVN_MASK];
    }else if(timer->expires_tick <= OS_TV4_MAX){
        list_p = &os_timewheel__4[(timer->expires_tick >> OS_TV_BITS(2)) & OS_TVN_MASK];
    }else if(timer->expires_tick <= OS_TV5_MAX){
        list_p = &os_timewheel__5[(timer->expires_tick >> OS_TV_BITS(3)) & OS_TVN_MASK];
    }

    if(!list_p){
        return OS_TIMEWHEEL_RET_ERROR;
    }

    OS_LIST_REMOVE(&timer->timer_node);
    OS_LIST_INSERT_BEFORE(list_p, &timer->timer_node);

    return OS_TIMEWHEEL_RET_OK;
}
/* -------------------------------------------------------------------------------------------------------------- */


os_err_t os_timewheel_init(void)
{
    os_timewheel__current_tick = 0;
    OS_TV_INIT(os_timewheel__1);
    OS_TV_INIT(os_timewheel__2);
    OS_TV_INIT(os_timewheel__3);
    OS_TV_INIT(os_timewheel__4);
    OS_TV_INIT(os_timewheel__5);
    return OS_ERR_OK;
}


os_err_t os_timewheel_tick(void){
    os_err_t err = OS_ERR_OK;
    os_list_node_t * node_p;
    os_list_t * list_p = 0;
    os_timer_t* timer=0;
    
    os_timewheel__current_tick++;
    
    os_tick_t tick_now = os_timewheel__current_tick;
    if(os_timewheel__current_tick <= OS_TV1_MAX){
        list_p = &os_timewheel__1[tick_now & OS_TVR_MASK];
    }else if(tick_now <= OS_TV2_MAX){
        list_p = &os_timewheel__2[(tick_now >> OS_TV_BITS(0)) & OS_TVN_MASK];
    }else if(tick_now <= OS_TV3_MAX){
        list_p = &os_timewheel__3[(tick_now >> OS_TV_BITS(1)) & OS_TVN_MASK];
    }else if(tick_now <= OS_TV4_MAX){
        list_p = &os_timewheel__4[(tick_now >> OS_TV_BITS(2)) & OS_TVN_MASK];
    }else if(tick_now <= OS_TV5_MAX){
        list_p = &os_timewheel__5[(tick_now >> OS_TV_BITS(3)) & OS_TVN_MASK];
    }
    
    if(!list_p) return OS_ERR_ERROR;

    for(node_p = OS_LIST_NEXT(list_p); node_p!=list_p; ){
        timer = OS_LIST_CONTAINER(node_p, os_timer_t, timer_node);
        node_p = OS_LIST_NEXT(node_p);
        if(timer->expires_tick <= tick_now){
            err = OS_TIMEWHEEL_RET_NEED_SCHEDULE;
            OS_LIST_REMOVE(&timer->timer_node); /* remove from the list */
            if(timer->timeout_function){
                timer->timeout_function(timer, tick_now);
            }
            
            if(timer->flag==OS_TIMER_FLAG_REPEAT){
                os_timewheel__add_timer_again(timer, tick_now);
            }
        }

    }
    
    return err;
}

os_err_t os_timewheel_add_timer(os_timer_t * timer, os_tick_t ticks
        , os_timer_timeout_t timeout_function, void* userdata, int flag)
{
    os_list_t * list_p = 0;

    timer->ticks = ticks;
    timer->expires_tick = 0u;
    timer->timeout_function = timeout_function;
    timer->userdata = userdata;
    timer->flag = flag;

    os_tick_t expire_tick = os_timewheel__current_tick + ticks;

    if(expire_tick <= OS_TV1_MAX){
        list_p = &os_timewheel__1[expire_tick & OS_TVR_MASK];
    }else if(expire_tick <= OS_TV2_MAX){
        list_p = &os_timewheel__2[(expire_tick >> OS_TV_BITS(0)) & OS_TVN_MASK];
    }else if(expire_tick <= OS_TV3_MAX){
        list_p = &os_timewheel__3[(expire_tick >> OS_TV_BITS(1)) & OS_TVN_MASK];
    }else if(expire_tick <= OS_TV4_MAX){
        list_p = &os_timewheel__4[(expire_tick >> OS_TV_BITS(2)) & OS_TVN_MASK];
    }else if(expire_tick <= OS_TV5_MAX){
        list_p = &os_timewheel__5[(expire_tick >> OS_TV_BITS(3)) & OS_TVN_MASK];
    }

    if(!list_p){
        return OS_TIMEWHEEL_RET_ERROR;
    }

    timer->expires_tick = expire_tick;

    OS_LIST_REMOVE(&timer->timer_node);
    OS_LIST_INSERT_BEFORE(list_p, &timer->timer_node);

    return OS_TIMEWHEEL_RET_OK;
}

