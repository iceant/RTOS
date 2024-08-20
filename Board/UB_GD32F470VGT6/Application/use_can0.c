#include <use_can0.h>
#include <os_kernel.h>
#include <sdk_ring.h>
#include <sdk_hex.h>
#include <string.h>
#include <sdk_mp.h>
#include <sdk_fmt.h>
#include <sdk_ultoa.h>
#include "global.h"
#include "meter_protocol.h"
#include <mqtt.h>
#include <sdk_crc16.h>
#include <mcu_session.h>
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
#define USE_CAN0_RX_OBJECT_COUNT        500
#define USE_CAN0_RX_RING_SIZE           (USE_CAN0_RX_OBJECT_COUNT * USE_CAN0_RX_OBJECT_SIZE)


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

/* Current = ((rdCurrent - CURRENT_BASE) x K_CURRENT_RATIO + CURRENT_CALIBRATION_BASE) */
#define K_CURRENT_RATIO                 0.99890 /*斜率: 1.00045 precision: 100000*/
#define CURRENT_BASE                    25000U  /*precision: 10000*/
#define CURRENT_BASE_PRECISION          10000
#define K_CURRENT_RATIO_PRECISION       1000000000
#define CURRENT_PRECISION               1000
#define CURRENT_CALIBRATION_BASE        24988U


#define HUMAN_VOLTAGE_PRECISION          10000
#define HUMAN_CURRENT_PRECISION          1000
#define HUMAN_ENERGY_PRECISION           10000000
#define HUMAN_POWER_PRECISION            1000

#define HUMAN_POWER_RATIO               ((HUMAN_VOLTAGE_PRECISION * HUMAN_CURRENT_PRECISION)/HUMAN_POWER_PRECISION)

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
static sdk_mp_t Power_Ratio={0};
static int USE_CAN0__State;

static uint8_t OLED_Buffer[64];
static char USE_CAN0__ShowBuf[32];

#define USE_CAN0_STATE_CHARGE_IDLE          0
#define USE_CAN0_STATE_CHARGE_START         1
#define USE_CAN0_STATE_CHARGE_WIP           2
////////////////////////////////////////////////////////////////////////////////
////
static void USE_CAN0__MeterProtocolInit(meter_protocol_t * protocol){
    meter_protocol_dc_init(protocol);
    METER_PROTOCOL_HWID_SET(protocol, BSP_CPUID_Read(), strlen(BSP_CPUID_Read()));
    protocol->lines = 0;
}

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
    global_t* global = global_get();

    uint32_t result = voltage;

#if defined(GLOBAL_CALIBRATION_ENABLE) && (GLOBAL_CALIBRATION_ENABLE==1)
    for(size_t i=0; i<OS_ARRAY_SIZE(global->voltage_calibrations); i++){
        if(!global->voltage_calibrations[i].enabled) continue;

        if((voltage >= global->voltage_calibrations[i].rd_min)
            && (voltage <= global->voltage_calibrations[i].rd_max)){
            uint32_t rd_base = global->voltage_calibrations[i].rd_base;
            double ratio = global->voltage_calibrations[i].ratio;
            uint32_t std_base = global->voltage_calibrations[i].std_base;

            result =  (uint32_t)(((voltage - rd_base) * ratio) + std_base);
            break;
        }
    }
#endif

//    printf("RdVol:%d, UseVol:%d\n", voltage, result);

    return result;

#if 0
    if(global->meter.std_voltage_min!=-1U && global->meter.rd_voltage_min!=-1U){
        if(voltage<=global->meter.rd_voltage_min){
            return 0;
        }
        return (uint32_t)(((voltage - global->meter.rd_voltage_min) * global->meter.voltage_ratio) + global->meter.std_voltage_min);
    }else{
        return voltage;
    }
#endif
}

static uint32_t current_real_value(uint32_t current){
    global_t* global = global_get();

    uint32_t result = current;

#if defined(GLOBAL_CALIBRATION_CURRENT_ENABLE) && (GLOBAL_CALIBRATION_CURRENT_ENABLE==1)
    for(size_t i=0; i<OS_ARRAY_SIZE(global->current_calibrations); i++){
        if(!global->current_calibrations[i].enabled) continue;

        if((current >= global->current_calibrations[i].rd_min)
           && (current <= global->current_calibrations[i].rd_max)){
            uint32_t rd_base = global->current_calibrations[i].rd_base;
            double ratio = global->current_calibrations[i].ratio;
            uint32_t std_base = global->current_calibrations[i].std_base;

            result =  (uint32_t)(((current - rd_base) * ratio) + std_base);
            break;
        }
    }
#endif

    return result;

#if 0
    if(global->meter.std_current_min!=-1U && global->meter.rd_current_min!=-1U){
        if(current<=global->meter.rd_current_min){
            return 0;
        }
        return (uint32_t)(((current - global->meter.rd_current_min) * global->meter.current_ratio) + global->meter.std_current_min);
    }else{
        return current;
    }
#endif
}



static bool USE_CAN0__FirstPackageSendFlag = false;

static void USE_CAN0_HandleMeterProtocol(int state){
    uint32_t tick = BSP_TIM6__TickCount;
    meter_protocol_t* protocol = meter_protocol_current();
    uint32_t Current = USE_CAN0_LatestSnapshot.Current;
    uint32_t Voltage = USE_CAN0_LatestSnapshot.Voltage;
    uint32_t Power = sdk_mp_tointu(USE_CAN0_LatestSnapshot.Power)/HUMAN_POWER_RATIO;
    uint32_t Energy = sdk_mp_toint(USE_CAN0_LatestSnapshot.EnergyWH);

    global_t* global = global_get();

    switch (state) {
        case USE_CAN0_STATE_CHARGE_IDLE:{
            /* 充电结束 */

            USE_CAN0__FirstPackageSendFlag = false;

            protocol->lines = METER_PROTOCOL_DC_MAX_LINES;

            METER_PROTOCOL_DC_LINE_FILL(protocol, protocol->lines
            , global->datetime.year
            , global->datetime.month
            , global->datetime.date
            , global->datetime.hour
            , global->datetime.min
            , global->datetime.sec
            , tick
            , Voltage
            , Current
            , Power
            , Energy
            , 100
            , 50
            );

            protocol->lines+=1;

            if(protocol->lines==METER_PROTOCOL_DC_MAX_LINES+1){
                /* 一个包完整，发送 */
                int size = protocol->lines * METER_PROTOCOL_DC_LINE_SIZE + METER_PROTOCOL_DC_HEAD_SIZE;

                METER_PROTOCOL_DC_LINES_SET(protocol, protocol->lines);
                METER_PROTOCOL_DC_REP_DATETIME_SET(protocol
                , global->datetime.year
                , global->datetime.month
                , global->datetime.date
                , global->datetime.hour
                , global->datetime.min
                , global->datetime.sec
                , tick);

                uint16_t crc = sdk_crc16(protocol->buffer, size);
                METER_PROTOCOL_DC_CRC_SET(protocol, crc);

                meter_protocol_t * next_protocol = meter_protocol_next();
                USE_CAN0__MeterProtocolInit(next_protocol);

                printf("[USE_CAN0] Send DC Data On Charge Done!\n");
                MQTT_Publish(protocol->buffer, size+2);

            }


            break;
        }
        case USE_CAN0_STATE_CHARGE_WIP:{
            /* 充电中 */
            if(USE_CAN0__FirstPackageSendFlag==false){
                /* 发送第一条数据 */
                USE_CAN0__FirstPackageSendFlag = true;
                protocol->lines = METER_PROTOCOL_DC_MAX_LINES;

                printf("[USE_CAN0] Send DC Data On Start Charge!\n");
            }

            METER_PROTOCOL_DC_LINE_FILL(protocol, protocol->lines
            , global->datetime.year
            , global->datetime.month
            , global->datetime.date
            , global->datetime.hour
            , global->datetime.min
            , global->datetime.sec
            , tick
            , Voltage
            , Current
            , Power
            , Energy
            , 100
            , 50
            );

            protocol->lines+=1;

            if(protocol->lines==METER_PROTOCOL_DC_MAX_LINES+1){
                /* 一个包完整，发送 */
                int size = protocol->lines * METER_PROTOCOL_DC_LINE_SIZE + METER_PROTOCOL_DC_HEAD_SIZE;

                METER_PROTOCOL_DC_LINES_SET(protocol, protocol->lines);
                METER_PROTOCOL_DC_REP_DATETIME_SET(protocol
                , global->datetime.year
                , global->datetime.month
                , global->datetime.date
                , global->datetime.hour
                , global->datetime.min
                , global->datetime.sec
                , tick);

                uint16_t crc = sdk_crc16(protocol->buffer, size);
                METER_PROTOCOL_DC_CRC_SET(protocol, crc);

                meter_protocol_t * next_protocol = meter_protocol_next();
                USE_CAN0__MeterProtocolInit(next_protocol);

                printf("[USE_CAN0] Send DC Data On Charging!\n");
                MQTT_Publish(protocol->buffer, size+2);

            }

            break;
        }
        default:
            break;
    }
}

static uint8_t USE_CAN0__SendEnergyToGD303Buffer[17]={0};
static void USE_CAN0__SendEnergyToGD303(void){
/*
 * START:   0xBE, 0xEF
 * DU_SIZE: <uint16_t,BE>
 * DU_TYPE: <uint8_t>  0xD0
 * DU     : <nBits:uint8_t=16>,<uint8_t[nBits]>
 * CRC    : uint16_t LE
 */
//    USE_CAN0_LatestSnapshot.EnergySum

    mcu_session_t* session = mcu_session_get_default();
    int nBytes = sdk_mp_nbytes();
    USE_CAN0__SendEnergyToGD303Buffer[0] = nBytes;
    memcpy(USE_CAN0__SendEnergyToGD303Buffer+1, USE_CAN0_LatestSnapshot.EnergySum, nBytes);
    mcu_session_pack(session, kMCU_PROTOCOL_DU_PWR, USE_CAN0__SendEnergyToGD303Buffer, nBytes+1);
    mcu_session_send(session, 0, 0);
}


static void USE_CAN0__RxThreadEntry(void* p){

    printf("[USE_CAN0] OK\n");

    os_size_t used = 0;
    uint32_t current = 0;
    uint16_t voltage = 0;
    uint32_t rVoltage = 0;
    uint32_t rCurrent = 0;
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

//                printf("rawCurrent: %x, rawVoltage:%x\n", current, voltage);

                if(current>0x7FFFFFFFU){
                    current = current - 0x80000000U;
                }else{
                    current = 0x7FFFFFFFU - current;
                }

                if(current<5){
                    current = 0;
                }

                rCurrent = current_real_value(current);
                rVoltage = voltage_real_value(voltage * VOLTAGE_PRECISION);

                if(USE_CAN0_LatestSnapshot.Current==0 || USE_CAN0_LatestSnapshot.Voltage==0){
                    if(USE_CAN0__State!=USE_CAN0_STATE_CHARGE_IDLE){
                        /* 之前在充电，现在停止了 */
                        USE_CAN0__State = USE_CAN0_STATE_CHARGE_IDLE;
                        global_get()->meter_state = GLOBAL_METER_STATE_IDLE;

                        /* 发送给 GD303 处理脉冲 */

                        USE_CAN0__SendEnergyToGD303();

                        /* 显示最终的电能 */
                        sdk_mp_tostr(USE_CAN0__ShowBuf, sizeof(USE_CAN0__ShowBuf), 10, USE_CAN0_LatestSnapshot.EnergyWH);
                        sdk_fmt_sfmt((char*)OLED_Buffer, sizeof(OLED_Buffer), "Energy: %F", USE_CAN0__ShowBuf, 7);
                        sdk_fmt_print("%s\n", OLED_Buffer);

                        OLED_Clear();
                        OLED_ShowString(1,5, OLED_Buffer, 12);


                        /* 处理打包发送 */
                        USE_CAN0_HandleMeterProtocol(USE_CAN0_STATE_CHARGE_IDLE);
                    }
                }

                if(USE_CAN0_LatestSnapshot.Current!=0 && USE_CAN0_LatestSnapshot.Voltage!=0){
                    if(USE_CAN0__State==USE_CAN0_STATE_CHARGE_IDLE){
                        /* 第一个数据 */
                        USE_CAN0__State = USE_CAN0_STATE_CHARGE_WIP;
                        global_get()->meter_state = GLOBAL_METER_STATE_CHARGING;
                        
                        sdk_mp_fromintu(USE_CAN0_LatestSnapshot.Power, 0, 0);
                        sdk_mp_fromintu(USE_CAN0_LatestSnapshot.EnergySum, 0, 0);
                        sdk_mp_fromintu(USE_CAN0_LatestSnapshot.EnergyWH, 0, 0);
                        nCount = BSP_TIM6__TickCount;

                        USE_CAN0__SendEnergyToGD303();

                        USE_CAN0_HandleMeterProtocol(USE_CAN0_STATE_CHARGE_START);
                        
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

                        /* 将电能发给GD303 */
                        USE_CAN0__SendEnergyToGD303();

                        /* 处理打包 */
                        USE_CAN0_HandleMeterProtocol(USE_CAN0_STATE_CHARGE_WIP);
                    }
                }


                if((BSP_TIM6__TickCount-nCount)>=1000){
                    nCount = BSP_TIM6__TickCount;

                    if(USE_CAN0_LatestSnapshot.Current!=0){
                        sdk_ultoa(USE_CAN0_LatestSnapshot.Current, USE_CAN0__ShowBuf, 10);
                        sdk_fmt_sfmt((char*)OLED_Buffer, sizeof(OLED_Buffer), "Current: %F", USE_CAN0__ShowBuf, 3);
                        OLED_ShowString(1, 2, OLED_Buffer, 12);
                        os_printf("%s ", OLED_Buffer);
                    }else{
                        sdk_fmt_sfmt((char*)OLED_Buffer, sizeof(OLED_Buffer), "                    ");
                        OLED_ShowString(1, 2, OLED_Buffer, 12);
//                        os_printf("%s ", OLED_Buffer);
                    }

                    if(USE_CAN0_LatestSnapshot.Voltage!=0){
                        sdk_ultoa(USE_CAN0_LatestSnapshot.Voltage, USE_CAN0__ShowBuf, 10);
                        sdk_fmt_sfmt((char*)OLED_Buffer, sizeof(OLED_Buffer), "Voltage: %F", USE_CAN0__ShowBuf, 4);
                        OLED_ShowString(1, 3, OLED_Buffer, 12);
                        os_printf("%s ", OLED_Buffer);
                    }
                    else{
                        sdk_fmt_sfmt((char*)OLED_Buffer, sizeof(OLED_Buffer), "                    ");
                        OLED_ShowString(1, 3, OLED_Buffer, 12);
//                        os_printf("%s ", OLED_Buffer);
                    }

                    if(USE_CAN0__State==USE_CAN0_STATE_CHARGE_WIP){
                        sdk_mp_tostr(USE_CAN0__ShowBuf, sizeof(USE_CAN0__ShowBuf), 10, USE_CAN0_LatestSnapshot.EnergyWH);
                        sdk_fmt_sfmt((char*)OLED_Buffer, sizeof(OLED_Buffer), "Energy : %F", USE_CAN0__ShowBuf, 7);
                        OLED_ShowString(1,5, OLED_Buffer, 12);
                        os_printf("%s\n", OLED_Buffer);
                    }

                }

                USE_CAN0_LatestSnapshot.Current = rCurrent;
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
    meter_protocol_t* protocol = meter_protocol_current();
    USE_CAN0__MeterProtocolInit(protocol);

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

    sdk_mp_new(HUMAN_CURRENT_PRECISION, &Power_Ratio);                                   /*电流缩放比例*/
    sdk_mp_mului(Power_Ratio, Power_Ratio, HUMAN_VOLTAGE_PRECISION, &Power_Ratio); /*电压缩放比例*/
    sdk_mp_divui(Power_Ratio, Power_Ratio, HUMAN_POWER_PRECISION, &Power_Ratio);


    sdk_ring_init(&USE_CAN0__RxRing, USE_CAN0__RxRingBlock, USE_CAN0_RX_OBJECT_COUNT, USE_CAN0_RX_OBJECT_SIZE);
    os_semaphore_init(&USE_CAN0__RxSem, "USE_CAN0_RxSem", 0, OS_SEMAPHORE_FLAG_FIFO);
    os_thread_init(&USE_CAN0__RxThread, "USE_CAN0_RxThd", USE_CAN0__RxThreadEntry, 0
                   , USE_CAN0__RxThreadStack, sizeof(USE_CAN0__RxThreadStack)
            , GLOBAL_DEFAULT_THREAD_PRIORITY
            , GLOBAL_DEFAULT_THREAD_TTICKS);
    os_thread_startup(&USE_CAN0__RxThread);
}