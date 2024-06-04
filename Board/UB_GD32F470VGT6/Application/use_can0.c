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
    uint32_t Current;
    uint32_t Voltage;
    sdk_mp_t Power;
    sdk_mp_t EnergySum;
    sdk_mp_t EnergyWH;
    uint32_t TickStamp;
}USE_CAN0_Snapshot_T;

////////////////////////////////////////////////////////////////////////////////
////
#define USE_CAN0_RX_THREAD_STACK_SIZE   1024
#define USE_CAN0_RX_OBJECT_SIZE         sizeof(USE_CAN0_RxRecord_T)
#define USE_CAN0_RX_OBJECT_COUNT        100
#define USE_CAN0_RX_RING_SIZE           (USE_CAN0_RX_OBJECT_COUNT * USE_CAN0_RX_OBJECT_SIZE)


#define K_VOLTAGE_RATIO                 0.987289474 /*斜率: 1.00045 precision: 100000*/
#define VOLTAGE_BASE                    24000U  /*precision: 10000*/
#define VOLTAGE_BASE_PRECISION          10000
#define K_VOLTAGE_RATIO_PRECISION       1000000000
#define VOLTAGE_PRECISION               1000
#define VOLTAGE_CALIBRATION_BASE        24988U

#define HUMAN_VOLTAGE_PRECISION          10000
#define HUMAN_CURRENT_PRECISION          1000
#define HUMAN_ENERGY_PRECISION           10000000

#define HOUR_IN_MS (60 * 60 * 1000)
#define KWH_UNIT 1000

#define HUMAN_VOLTAGE_DOT                4
#define HUMAN_CURRENT_DOT                3
#define HUMAN_ENERGY_DOT                 7
////////////////////////////////////////////////////////////////////////////////
////

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USE_CAN0__RxThreadStack[USE_CAN0_RX_THREAD_STACK_SIZE];
static os_thread_t USE_CAN0__RxThread;
static os_semaphore_t USE_CAN0__RxSem;
static uint8_t USE_CAN0__RxRingBlock[USE_CAN0_RX_RING_SIZE];
static sdk_ring_t USE_CAN0__RxRing;

static USE_CAN0_Snapshot_T USE_CAN0_LatestSnapshot={0};
static sdk_mp_t USE_CAN0__EnergyRatio;
static int USE_CAN0__State;

static uint8_t OLED_Buffer[64];

#define USE_CAN0_STATE_CHARGE_IDLE          0
#define USE_CAN0_STATE_CHARGE_START         1
#define USE_CAN0_STATE_CHARGE_WIP           2
////////////////////////////////////////////////////////////////////////////////
////

static void USE_CAN0__RxHandler(can_receive_message_struct* rxMsg, void* userdata)
{
    uint32_t tick = BSP_TIM6__TickCount;
    USE_CAN0_RxRecord_T* record = sdk_ring_get_write_slot(&USE_CAN0__RxRing);
    if(record){
        memcpy(&record->can_msg, rxMsg, sizeof(*rxMsg));
        record->tick_ms = tick;
    }
    os_semaphore_release(&USE_CAN0__RxSem);
}

static uint32_t voltage_real_value(uint32_t voltage){
    if(voltage<=VOLTAGE_BASE){
        return 0;
    }
    return (uint32_t)((voltage - VOLTAGE_BASE) * K_VOLTAGE_RATIO + VOLTAGE_CALIBRATION_BASE);
}



static void USE_CAN0__RxThreadEntry(void* p){
    os_size_t used = 0;
    uint32_t current = 0;
    uint16_t voltage = 0;
    uint32_t rVoltage = 0;
    uint32_t nCount = BSP_TIM6__TickCount;
    uint32_t DeltaMS = 0;
    BSP_CAN0_SetRxHandler(USE_CAN0__RxHandler, 0);
    USE_CAN0__State = USE_CAN0_STATE_CHARGE_IDLE;
    while(1){
        while((used = sdk_ring_used(&USE_CAN0__RxRing))==0) {
            os_semaphore_take(&USE_CAN0__RxSem, OS_WAIT_INFINITY);
        }

        for(os_size_t i=0; i<used; i++){
            USE_CAN0_RxRecord_T* record = sdk_ring_pop(&USE_CAN0__RxRing);
            if(!record) continue;

            uint8_t DL= record->can_msg.rx_dlen;
            if(DL>6){
                current= SDK_HEX_GET_UINT32_BE(record->can_msg.rx_data, 0);
                voltage = SDK_HEX_GET_UINT16_BE(record->can_msg.rx_data, 4);


                if(current>0x7FFFFFFFU){
                    current = current - 0x80000000U;
                }else{
                    current = 0x7FFFFFFFU - current;
                }

                if(current<5){
                    current = 0;
                }
                rVoltage = voltage_real_value(voltage * VOLTAGE_PRECISION);

                if(USE_CAN0_LatestSnapshot.Current==0 && USE_CAN0_LatestSnapshot.Voltage==0){
                    if(USE_CAN0__State!=USE_CAN0_STATE_CHARGE_IDLE){
                        /* 之前在充电，现在停止了 */
                        USE_CAN0__State = USE_CAN0_STATE_CHARGE_IDLE;

                        /*
                         1. 显示最终的电能
                         */
                        sdk_fmt_sfmt(OLED_Buffer, sizeof(OLED_Buffer), "Energy: %M", USE_CAN0_LatestSnapshot.EnergyWH, 10);
                        OLED_Clear();
                        OLED_ShowString(1,2, OLED_Buffer, 12);
                    }
                }

                if(USE_CAN0_LatestSnapshot.Current!=0 && USE_CAN0_LatestSnapshot.Voltage!=0){
                    if(USE_CAN0__State==USE_CAN0_STATE_CHARGE_IDLE){
                        /* 第一个数据 */
                        USE_CAN0__State = USE_CAN0_STATE_CHARGE_WIP;
                        sdk_mp_fromintu(USE_CAN0_LatestSnapshot.Power, 0, 0);
                        sdk_mp_fromintu(USE_CAN0_LatestSnapshot.EnergySum, 0, 0);
                        sdk_mp_fromintu(USE_CAN0_LatestSnapshot.EnergyWH, 0, 0);
                        nCount = BSP_TIM6__TickCount;
                    }else
                    if(USE_CAN0__State==USE_CAN0_STATE_CHARGE_WIP){
                        /*充电中, 计算电量
                         Current x Voltage x DeltaMS
                         */
                        DeltaMS = record->tick_ms - USE_CAN0_LatestSnapshot.TickStamp;
                        sdk_mp_fromintu(USE_CAN0_LatestSnapshot.Power, USE_CAN0_LatestSnapshot.Current, &USE_CAN0_LatestSnapshot.Power);
                        sdk_mp_mului(USE_CAN0_LatestSnapshot.Power, USE_CAN0_LatestSnapshot.Power, USE_CAN0_LatestSnapshot.Voltage, &USE_CAN0_LatestSnapshot.Power);
                        sdk_mp_mului(USE_CAN0_LatestSnapshot.Power, USE_CAN0_LatestSnapshot.Power, DeltaMS, &USE_CAN0_LatestSnapshot.Power);

                        sdk_mp_add(USE_CAN0_LatestSnapshot.EnergySum, USE_CAN0_LatestSnapshot.EnergySum, USE_CAN0_LatestSnapshot.Power, 0);
                        /*转换为人类可阅读的值*/
                        sdk_mp_div(USE_CAN0_LatestSnapshot.EnergyWH, USE_CAN0_LatestSnapshot.EnergySum, USE_CAN0__EnergyRatio, &USE_CAN0_LatestSnapshot.EnergyWH);

                        if(BSP_TIM6__TickCount-nCount>1000){
                            nCount = BSP_TIM6__TickCount;
                            snprintf((char*)OLED_Buffer, sizeof(OLED_Buffer), "Current: %d", USE_CAN0_LatestSnapshot.Current);
                            OLED_ShowString(1, 2, OLED_Buffer, 12);
                            os_printf("%s ", OLED_Buffer);

                            snprintf((char*)OLED_Buffer, sizeof(OLED_Buffer), "Voltage: %d", USE_CAN0_LatestSnapshot.Voltage);
                            OLED_ShowString(1, 3, OLED_Buffer, 12);
                            os_printf("%s ", OLED_Buffer);

                            sdk_fmt_sfmt(OLED_Buffer, sizeof(OLED_Buffer), "Energy : %M", USE_CAN0_LatestSnapshot.EnergyWH, 10);
                            OLED_ShowString(1,4, OLED_Buffer, 12);
                            os_printf("%s\n", OLED_Buffer);
                        }
                    }
                }


                USE_CAN0_LatestSnapshot.Current = current;
                USE_CAN0_LatestSnapshot.Voltage = rVoltage;
                USE_CAN0_LatestSnapshot.TickStamp = record->tick_ms;

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

    sdk_mp_new(0, &USE_CAN0__EnergyRatio);
    sdk_mp_new(0, &USE_CAN0_LatestSnapshot.Power);
    sdk_mp_new(0, &USE_CAN0_LatestSnapshot.EnergySum);
    sdk_mp_new(0, &USE_CAN0_LatestSnapshot.EnergyWH);


    sdk_mp_new(HUMAN_CURRENT_PRECISION, &USE_CAN0__EnergyRatio);
    sdk_mp_mului(USE_CAN0__EnergyRatio, USE_CAN0__EnergyRatio, HUMAN_VOLTAGE_PRECISION, &USE_CAN0__EnergyRatio);
    sdk_mp_mului(USE_CAN0__EnergyRatio, USE_CAN0__EnergyRatio, HOUR_IN_MS, &USE_CAN0__EnergyRatio);
    sdk_mp_mului(USE_CAN0__EnergyRatio, USE_CAN0__EnergyRatio, KWH_UNIT, &USE_CAN0__EnergyRatio);
    sdk_mp_divui(USE_CAN0__EnergyRatio, USE_CAN0__EnergyRatio, HUMAN_ENERGY_PRECISION, &USE_CAN0__EnergyRatio);



    sdk_ring_init(&USE_CAN0__RxRing, USE_CAN0__RxRingBlock, USE_CAN0_RX_OBJECT_COUNT, USE_CAN0_RX_OBJECT_SIZE);
    os_semaphore_init(&USE_CAN0__RxSem, "USE_CAN0_RxSem", 0, OS_SEMAPHORE_FLAG_FIFO);
    os_thread_init(&USE_CAN0__RxThread, "USE_CAN0_RxThd", USE_CAN0__RxThreadEntry, 0
                   , USE_CAN0__RxThreadStack, sizeof(USE_CAN0__RxThreadStack)
                   , 20,10);
    os_thread_startup(&USE_CAN0__RxThread);
}