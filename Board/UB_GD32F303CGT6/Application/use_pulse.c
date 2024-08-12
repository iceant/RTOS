#include <use_pulse.h>
#include <os_memory.h>
#include <sdk_ring.h>
#include <bsp_pulse.h>
#include <bsp_tim2.h>
#include <sdk_mp.h>
#include <string.h>
#include "global.h"

////////////////////////////////////////////////////////////////////////////////
////
typedef struct use_pulse_s{
    uint32_t nTick;
    uint32_t nCount;
}use_pulse_t;

#define OBJECT_SIZE sizeof(use_pulse_t)
#define OBJECT_COUNT 21
#define BLOCK_SIZE (OBJECT_SIZE * OBJECT_COUNT)

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t  use_pulse__block[BLOCK_SIZE];
static sdk_ring_t use_pulse__ring;

//C__ALIGNED(OS_ALIGN_SIZE)
//static uint8_t use_pulse__thread_stack[1024];
//static os_thread_t use_pulse__thread;
//static os_semaphore_t use_pulse__sem;

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t use_pulse__tim2_thread_stack[1024];
static os_thread_t use_pulse__tim2_thread;
static os_semaphore_t use_pulse__tim2_sem;

////////////////////////////////////////////////////////////////////////////////
////
//static void use_pulse_thread_entry(void* p){
//    os_size_t used = 0;
//    os_size_t i;
//    while(1){
//        while((used= sdk_ring_used(&use_pulse__ring))==0){
//            os_semaphore_take(&use_pulse__sem, OS_WAIT_INFINITY);
//        }
//
//        for(i=0; i<used; i++){
//            use_pulse_t * item = sdk_ring_pop(&use_pulse__ring);
//            for(os_size_t n = 0; n<item->nCount; n++){
//                BSP_Pulse_Generate(item->nTick);
//            }
//        }
//    }
//}

static void USE_Pulse__Tim2Handler(uint32_t tick){
    /* 每个 tick 触发一次 */
    os_semaphore_release(&use_pulse__tim2_sem);
}

static sdk_mp_t use_pulse__power_constants;

static void use_pulse_tim2_thread_entry(void* p){
    BSP_TIM2_SetHandler(USE_Pulse__Tim2Handler);
    global_t* global = global_get();
    sdk_mp_t power_sum;
    sdk_mp_t power_sub;
    sdk_mp_t power_wms;

    sdk_mp_new(0, &power_wms);
    sdk_mp_new(0, &power_sum);
    sdk_mp_new(0, &power_sub);

    uint32_t nCount = 0;
    uint32_t nSum = 0;

    /* P = 3600 x 1000000 */
    sdk_mp_new(3600, &use_pulse__power_constants);
    sdk_mp_mului(use_pulse__power_constants, use_pulse__power_constants, 1000000, 0);
    cpu_uint_t level;
    while(1){
        os_semaphore_take(&use_pulse__tim2_sem, OS_WAIT_INFINITY);

        if(sdk_mp_cmp(global->power_wms, power_wms)!=0){
            level = cpu_interrupt_disable();
            memcpy(power_wms, global->power_wms, sdk_mp_nbytes());
            cpu_interrupt_enable(level);
        }

        /* power_sub = 现有电量 - 已处理电量 */
        sdk_mp_sub(power_sub, power_wms, power_sum, &power_sub);

        if(sdk_mp_cmp(power_wms, power_sum)<0){
            sdk_mp_fromintu(power_sum, 0, 0);
            sdk_mp_fromintu(power_sub, 0, 0);
            nSum = 0;
            nCount = 0;
            continue;
        }

        /* 剩余电量 > 常量 */
        if(sdk_mp_cmp(power_sub, use_pulse__power_constants)>0){
            /* 删除一个常量 */
            sdk_mp_add(power_sum, power_sum, use_pulse__power_constants, &power_sum);
            nSum += 1;
            BSP_Pulse_Generate(1);
//            sdk_fmt_print("Power:%P, Sub:%P, Sum:%P, nSum=%d\n", global->power_wms, 10, power_sub, 10, power_sum, 10, nSum);
            /* 1Tick = 100微秒, 发送脉冲 */
//            use_pulse_generate(5, 1);
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
////


void use_pulse_init(void)
{
    sdk_ring_init(&use_pulse__ring, use_pulse__block, OBJECT_COUNT, OBJECT_SIZE);

//    os_semaphore_init(&use_pulse__sem, "PulseSem", 0, OS_QUEUE_FIFO);
//    os_thread_init(&use_pulse__thread, "PulseThd", use_pulse_thread_entry,0
//                   , use_pulse__thread_stack, OS_ARRAY_SIZE(use_pulse__thread_stack), 20, 10);
//    os_thread_startup(&use_pulse__thread);


    os_semaphore_init(&use_pulse__tim2_sem, "PulseT2Sem", 0, OS_QUEUE_FIFO);
    os_thread_init(&use_pulse__tim2_thread, "PulseT2Thd", use_pulse_tim2_thread_entry,0
                   , use_pulse__tim2_thread_stack, OS_ARRAY_SIZE(use_pulse__tim2_thread_stack), 20, 10);
    os_thread_startup(&use_pulse__tim2_thread);
}

void use_pulse_generate(uint32_t nTick, uint32_t nCount){
//    use_pulse_t* item = sdk_ring_get_write_slot(&use_pulse__ring);
//    if(item){
//        item->nTick = nTick;
//        item->nCount = nCount;
//        os_semaphore_release(&use_pulse__sem);
//    }
}

