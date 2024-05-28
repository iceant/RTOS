#include <use_can0.h>
#include <os_kernel.h>
#include <sdk_ring.h>
#include <sdk_hex.h>
#include <string.h>
#include <sdk_mp.h>
#include <sdk_fmt.h>
////////////////////////////////////////////////////////////////////////////////
////
typedef struct USE_CAN0_RxRecord_S{
    can_receive_message_struct can_msg;
    uint32_t tick_ms;
}USE_CAN0_RxRecord_T;

typedef struct USE_CAN0_Snapshot_S{
    sdk_mp_t Current;
    sdk_mp_t Voltage;
    sdk_mp_t Power;
    sdk_mp_t EnergySum;
    sdk_mp_t EnergyWH;
}USE_CAN0_Snapshot_T;

////////////////////////////////////////////////////////////////////////////////
////
#define USE_CAN0_RX_THREAD_STACK_SIZE   1024
#define USE_CAN0_RX_OBJECT_SIZE         sizeof(USE_CAN0_RxRecord_T)
#define USE_CAN0_RX_OBJECT_COUNT        100
#define USE_CAN0_RX_RING_SIZE           (USE_CAN0_RX_OBJECT_COUNT * USE_CAN0_RX_OBJECT_SIZE)


#define K_VOLTAGE_RATIO                 100045U /*斜率: 1.00045 precision: 100000*/
#define VOLTAGE_BASE                    24000U  /*precision: 10000*/
#define VOLTAGE_BASE_PRECISION          10000
#define K_VOLTAGE_RATIO_PRECISION       100000
#define VOLTAGE_PRECISION               1000
#define VOLTAGE_CALIBRATION_BASE        24988U

////////////////////////////////////////////////////////////////////////////////
////

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USE_CAN0__RxThreadStack[USE_CAN0_RX_THREAD_STACK_SIZE];
static os_thread_t USE_CAN0__RxThread;
static os_semaphore_t USE_CAN0__RxSem;
static uint8_t USE_CAN0__RxRingBlock[USE_CAN0_RX_RING_SIZE];
static sdk_ring_t USE_CAN0__RxRing;

static USE_CAN0_Snapshot_T USE_CAN0_LatestSnapshot={0};
static sdk_mp_t USE_CAN0__VoltageRatio;

////////////////////////////////////////////////////////////////////////////////
////

static void USE_CAN0__RxHandler(can_receive_message_struct* rxMsg, void* userdata)
{
    uint32_t tick = BSP_TIM6__TickCount;
    USE_CAN0_RxRecord_T* record = sdk_ring_get_write_slot(&USE_CAN0__RxRing);
    memcpy(&record->can_msg, rxMsg, sizeof(*rxMsg));
    record->tick_ms = tick;

    os_semaphore_release(&USE_CAN0__RxSem);
}


static sdk_mp_t* voltage_real_value(sdk_mp_t voltage, sdk_mp_t* result){
    if(!voltage) return 0;
    sdk_fmt_print("VOLTAGE: %M\n", voltage, 10);
    uint32_t uVoltage = sdk_mp_tointu(voltage);
    if(uVoltage<=VOLTAGE_BASE){
        return 0;
    }

    /* 公式: (VoltageRead - VOLTAGE_BASE) * K_VOLTAGE_RATIO + VOLTAGE_CALIBRATION_BASE */
    sdk_mp_subui(voltage, voltage, VOLTAGE_BASE, 0);
    sdk_mp_mului(voltage, voltage, K_VOLTAGE_RATIO, 0);
    sdk_mp_addui(voltage, voltage, VOLTAGE_CALIBRATION_BASE, 0);
//    sdk_mp_div(voltage, voltage, USE_CAN0__VoltageRatio, 0);

    if(result){
        *result = voltage;
    }
    return result;
}

static void USE_CAN0__RxThreadEntry(void* p){
    os_size_t used = 0;
    uint32_t current = 0;
    uint16_t voltage = 0;
    uint32_t nCount = 0;
    uint32_t TickMS = 0;
    uint32_t LatestTick = 0;
    BSP_CAN0_SetRxHandler(USE_CAN0__RxHandler, 0);

    while(1){
        while((used = sdk_ring_used(&USE_CAN0__RxRing))==0) {
            os_semaphore_take(&USE_CAN0__RxSem, OS_SEMAPHORE_FLAG_FIFO);
        }

        for(os_size_t i=0; i<used; i++){
            USE_CAN0_RxRecord_T* record = sdk_ring_pop(&USE_CAN0__RxRing);
            if(!record) continue;

            uint8_t DL= record->can_msg.rx_dlen;
            if(DL>6){
                current= SDK_HEX_GET_UINT32_BE(record->can_msg.rx_data, 0);
                voltage = SDK_HEX_GET_UINT16_BE(record->can_msg.rx_data, 4);

                TickMS = record->tick_ms - LatestTick;
                LatestTick = record->tick_ms;

                if(current>0x7FFFFFFFU){
                    current = current - 0x80000000U;
                }else{
                    current = 0x7FFFFFFFU - current;
                }

                sdk_mp_fromintu(USE_CAN0_LatestSnapshot.Current, current, &USE_CAN0_LatestSnapshot.Current);
                sdk_mp_fromintu(USE_CAN0_LatestSnapshot.Voltage, voltage, &USE_CAN0_LatestSnapshot.Voltage);
                sdk_mp_mului(USE_CAN0_LatestSnapshot.Voltage, USE_CAN0_LatestSnapshot.Voltage, 1000, 0);

                voltage_real_value(USE_CAN0_LatestSnapshot.Voltage, &USE_CAN0_LatestSnapshot.Voltage);

                if((BSP_TIM6__TickCount-nCount)>=1000){
                    nCount = BSP_TIM6__TickCount;
                    os_printf("Current: %u, Voltage_Raw:%u, Voltage:%u, Tick:%d\n"
                              , current
                              , voltage
                              , sdk_mp_tointu(USE_CAN0_LatestSnapshot.Voltage), TickMS);
                }

            }


        }


    }
}
////////////////////////////////////////////////////////////////////////////////
////


void USE_CAN0_Init(void)
{
    sdk_fmt_register('M', sdk_mp_fmt);
    sdk_mp_set(128);

    sdk_mp_new(0, &USE_CAN0__VoltageRatio);
    sdk_mp_new(0, &USE_CAN0_LatestSnapshot.Current);
    sdk_mp_new(0, &USE_CAN0_LatestSnapshot.Voltage);
    sdk_mp_new(0, &USE_CAN0_LatestSnapshot.Power);
    sdk_mp_new(0, &USE_CAN0_LatestSnapshot.EnergySum);
    sdk_mp_new(0, &USE_CAN0_LatestSnapshot.EnergyWH);


    sdk_mp_fromint(USE_CAN0__VoltageRatio, VOLTAGE_BASE_PRECISION, 0);
    sdk_mp_mului(USE_CAN0__VoltageRatio, USE_CAN0__VoltageRatio, K_VOLTAGE_RATIO_PRECISION, 0);
    sdk_mp_divui(USE_CAN0__VoltageRatio, USE_CAN0__VoltageRatio, VOLTAGE_PRECISION, 0);


    sdk_ring_init(&USE_CAN0__RxRing, USE_CAN0__RxRingBlock, USE_CAN0_RX_OBJECT_COUNT, USE_CAN0_RX_OBJECT_SIZE);
    os_semaphore_init(&USE_CAN0__RxSem, "USE_CAN0_RxSem", 0, OS_SEMAPHORE_FLAG_FIFO);
    os_thread_init(&USE_CAN0__RxThread, "USE_CAN0_RxThd", USE_CAN0__RxThreadEntry, 0, USE_CAN0__RxThreadStack, sizeof(USE_CAN0__RxThreadStack), 20,
                   os_tick_from_millisecond(20));
    os_thread_startup(&USE_CAN0__RxThread);
}