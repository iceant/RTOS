#include <meter_task.h>
#include <os_kernel.h>
#include <board.h>
#include <sdk_ring.h>
#include <string.h>
#include <sdk_hex.h>
#include <sdk_mp.h>
#include <meter_protocol.h>
#include <mcu_protocol.h>
////////////////////////////////////////////////////////////////////////////////
////
typedef struct MeterTask_CanRxMessage_S{
    os_tick_t tick_stamp;
    can_receive_message_struct can_msg;
}MeterTask_CanRxMessage_T;

typedef struct MeterTask_Session_S{
    uint32_t Current;       /* 采集到的瞬时电流 */
    uint32_t Voltage;       /* 采集到的瞬时电压 */
    sdk_mp_t Power;         /* 用于计算瞬时值 */
    sdk_mp_t EnergySum;     /* 用于累计 */
    sdk_mp_t EnergyWH;      /* 用于显示 */
    os_tick_t TickStamp;    /* 数据接收时间 */
}MeterTask_Session_T;
////////////////////////////////////////////////////////////////////////////////
////
#define METER_TASK_STACK_SIZE                   1024
#define METER_TASK_RX_RING_OBJECT_SIZE          sizeof(MeterTask_CanRxMessage_T)
#define METER_TASK_RX_RING_OBJECT_COUNT         20
#define METER_TASK_RX_BLOCK_SIZE                (METER_TASK_RX_RING_OBJECT_COUNT * METER_TASK_RX_RING_OBJECT_SIZE)

#define METER_TASK_STATE_IDLE                   0
#define METER_TASK_STATE_CHARGING               1


////////////////////////////////////////////////////////////////////////////////
//// 用于校准

/*
    K_VOLTAGE_RATIO = (VOLTAGE_CALIBRATION_MAX - VOLTAGE_CALIBRATION_MIN)/(rdVOLTAGE_MAX - VOLTAGE_BASE)
    Voltage = ((rdVoltage - VOLTAGE_BASE) x K_VOLTAGE_RATIO + VOLTAGE_CALIBRATION_BASE)
 */
#define K_VOLTAGE_RATIO                 0.99890 /*斜率: 1.00045 precision: 100000*/
#define VOLTAGE_BASE                    25000U  /*precision: 10000*/
#define VOLTAGE_BASE_PRECISION          10000
#define K_VOLTAGE_RATIO_PRECISION       1000000000
#define VOLTAGE_PRECISION               1000
#define VOLTAGE_CALIBRATION_BASE        24988U

////////////////////////////////////////////////////////////////////////////////
//// 用于显示

#define HUMAN_VOLTAGE_PRECISION          10000
#define HUMAN_CURRENT_PRECISION          1000
#define HUMAN_ENERGY_PRECISION           10000000
#define HUMAN_POWER_PRECISION            10000
#define HUMAN_FACTOR_PRECISION           100


#define HOUR_IN_MS (60 * 60 * 1000)
#define KWH_UNIT 1000

/* 小数点位数 */
#define HUMAN_VOLTAGE_DOT                4
#define HUMAN_CURRENT_DOT                3
#define HUMAN_ENERGY_DOT                 7

////////////////////////////////////////////////////////////////////////////////
////


C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t MeterTask_Stack[METER_TASK_STACK_SIZE];
static os_thread_t MeterTask_Thread;
static uint8_t MeterTask_RxBlock[METER_TASK_RX_BLOCK_SIZE];
static sdk_ring_t MeterTask_RxRing;
static os_semaphore_t MeterTask_RxSem;

static int MeterTask__State = METER_TASK_STATE_IDLE;
static MeterTask_Session_T MeterTask__LatestData = {0};
static sdk_mp_t MeterTask__EnergyRatio;
////////////////////////////////////////////////////////////////////////////////
////

static void MeterTask_CAN0_RxHandler(can_receive_message_struct* rxMsg, void* userdata)
{
    os_tick_t tick = BSP_TIM6__TickCount;
    MeterTask_CanRxMessage_T* rx_msg_p = sdk_ring_get_write_slot(&MeterTask_RxRing);
    if(!rx_msg_p){
        return;
    }
    memcpy(&rx_msg_p->can_msg, rxMsg, sizeof(*rxMsg));
    rx_msg_p->tick_stamp = tick;

    os_semaphore_release(&MeterTask_RxSem);
}

static void MeterTask_HandleProtocol(void){
    meter_protocol_t * meter_protocol = meter_protocol_current();
    meter_protocol_datetime_t* datetime = meter_protocol_datetime_get();
    meter_protocol_dc_append(meter_protocol, datetime
            , MeterTask__LatestData.Voltage
            , MeterTask__LatestData.Current
            , sdk_mp_tointu(MeterTask__LatestData.Power) / HUMAN_VOLTAGE_PRECISION / HUMAN_CURRENT_PRECISION * HUMAN_POWER_PRECISION
            , sdk_mp_tointu(MeterTask__LatestData.EnergyWH)
            , HUMAN_FACTOR_PRECISION
            , 50
    );

    if(meter_protocol_dc_is_full(meter_protocol)){
        METER_PROTOCOL_DC_REP_DATETIME_SET(meter_protocol
        , datetime->year
        , datetime->month
        , datetime->date
        , datetime->hour
        , datetime->min
        , datetime->sec
        , datetime->ms);

        uint32_t pkg_size = METER_PROTOCOL_DC_PKG_SIZE(meter_protocol);
        MCU_PROTOCOL_DU_SET(&mcu_protocol_g_tx_protocol, meter_protocol->buffer, pkg_size);

        meter_protocol_next();

        mcu_protocol_send(&mcu_protocol_g_tx_protocol); /*TODO: 用一个专用线程发送，不阻塞*/
    }

}

/* 计算电能 */
static void MeterTask_ThreadEntry(void* p){
    os_size_t used = 0;
    os_size_t i;
    uint32_t current;
    uint32_t voltage;
    uint32_t DeltaMS;

    while(1){
        while((used=sdk_ring_used(&MeterTask_RxRing))==0){
            os_semaphore_take(&MeterTask_RxSem, os_tick_from_millisecond(OS_WAIT_INFINITY));
        }

        for(i=0; i<used; i++){
            MeterTask_CanRxMessage_T* record = sdk_ring_pop(&MeterTask_RxRing);
            if(!record) continue;

            current= SDK_HEX_GET_UINT32_BE(record->can_msg.rx_data, 0);
            uint32_t rdVoltage = SDK_HEX_GET_UINT16_BE(record->can_msg.rx_data, 4);

            if(current>0x7FFFFFFFU){
                current = current - 0x80000000U;
            }else{
                current = 0x7FFFFFFFU - current;
            }

            if(current<5){
                current = 0;
            }

            voltage = rdVoltage * VOLTAGE_PRECISION;

            if(MeterTask__LatestData.Current==0 && MeterTask__LatestData.Voltage==0){
                if(MeterTask__State == METER_TASK_STATE_CHARGING){
                    /* 充电结束 */
                    MeterTask__State = METER_TASK_STATE_IDLE;

                    MeterTask_HandleProtocol();
                }
            }

            if(MeterTask__LatestData.Current!=0 && MeterTask__LatestData.Voltage!=0){
                if(MeterTask__State == METER_TASK_STATE_IDLE){
                    /*开始充电，第一条记录先记下，计算从第二条记录开始*/
                    MeterTask__State == METER_TASK_STATE_CHARGING;

                    /* 重置为0 */
                    sdk_mp_fromintu(MeterTask__LatestData.Power, 0, 0);
                    sdk_mp_fromintu(MeterTask__LatestData.EnergySum, 0, 0);
                    sdk_mp_fromintu(MeterTask__LatestData.EnergyWH, 0, 0);
                }else{
                    DeltaMS = record->tick_stamp - MeterTask__LatestData.TickStamp;
                    /* 计算: EnergyMS = Voltage x Current x DeltaMS */
                    sdk_mp_fromintu(MeterTask__LatestData.Power, MeterTask__LatestData.Current, &MeterTask__LatestData.Power);
                    sdk_mp_mului(MeterTask__LatestData.Power, MeterTask__LatestData.Power, MeterTask__LatestData.Voltage, &MeterTask__LatestData.Power);
                    sdk_mp_mului(MeterTask__LatestData.Power, MeterTask__LatestData.Power, DeltaMS, &MeterTask__LatestData.Power);

                    sdk_mp_add(MeterTask__LatestData.EnergySum, MeterTask__LatestData.EnergySum, MeterTask__LatestData.Power, 0);
                    /*转换为人类可阅读的值*/
                    sdk_mp_div(MeterTask__LatestData.EnergyWH, MeterTask__LatestData.EnergySum, MeterTask__EnergyRatio, &MeterTask__LatestData.EnergyWH);

                    /* 添加一行，发送 */
                    MeterTask_HandleProtocol();
                }
            }

            MeterTask__LatestData.Current = current;
            MeterTask__LatestData.Voltage = voltage;
            MeterTask__LatestData.TickStamp = record->tick_stamp;

        }
    }
}

////////////////////////////////////////////////////////////////////////////////
////



void Meter_Task_Init(void)
{
    sdk_mp_set(128);
    sdk_fmt_register('M', sdk_mp_fmtu);

    sdk_mp_new(0, &MeterTask__EnergyRatio);
    sdk_mp_new(0, &MeterTask__LatestData.Power);
    sdk_mp_new(0, &MeterTask__LatestData.EnergySum);
    sdk_mp_new(0, &MeterTask__LatestData.EnergyWH);


    sdk_mp_new(HUMAN_CURRENT_PRECISION, &MeterTask__EnergyRatio);
    sdk_mp_mului(MeterTask__EnergyRatio, MeterTask__EnergyRatio, HUMAN_VOLTAGE_PRECISION, &MeterTask__EnergyRatio);
    sdk_mp_mului(MeterTask__EnergyRatio, MeterTask__EnergyRatio, HOUR_IN_MS, &MeterTask__EnergyRatio);
    sdk_mp_mului(MeterTask__EnergyRatio, MeterTask__EnergyRatio, KWH_UNIT, &MeterTask__EnergyRatio);
    sdk_mp_divui(MeterTask__EnergyRatio, MeterTask__EnergyRatio, HUMAN_ENERGY_PRECISION, &MeterTask__EnergyRatio);

    sdk_ring_init(&MeterTask_RxRing, MeterTask_RxBlock, METER_TASK_RX_RING_OBJECT_COUNT, METER_TASK_RX_RING_OBJECT_SIZE);

    os_semaphore_init(&MeterTask_RxSem, "MeterTsk_Sem", 0, OS_QUEUE_FIFO);
    os_thread_init(&MeterTask_Thread, "MeterTsk", MeterTask_ThreadEntry, 0
        , MeterTask_Stack, sizeof(MeterTask_Stack)
        , 20, 10);
    os_thread_startup(&MeterTask_Thread);
}

