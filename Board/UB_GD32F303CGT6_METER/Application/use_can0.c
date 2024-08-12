#include <use_can0.h>
#include <sdk_mp.h>
#include <sdk_fmt.h>
#include <os_kernel.h>
#include <string.h>
#include "gd32f30x_can.h"
#include "bsp_can0.h"
#include <sdk_ring.h>
#include <bsp_tim6.h>
#include <sdk_hex.h>
#include <device_protocol.h>
#include <mcu_protocol.h>
#include <bsp_usart1.h>
#include <device_session.h>

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

#define HUMAN_VOLTAGE_PRECISION          10000
#define HUMAN_CURRENT_PRECISION          1000
#define HUMAN_ENERGY_PRECISION           10000000
#define HUMAN_POWER_PRECISION            1000

#define HUMAN_POWER_RATIO               ((HUMAN_VOLTAGE_PRECISION * HUMAN_CURRENT_PRECISION)/HUMAN_POWER_PRECISION)

#define HOUR_IN_MS                      (60 * 60 * 1000)
#define KWH_UNIT                        1000

#define USE_CAN0_STATE_CHARGE_IDLE          0
#define USE_CAN0_STATE_CHARGE_START         1
#define USE_CAN0_STATE_CHARGE_WIP           2
#define USE_CAN0_STATE_CHARGE_TIMEOUT       3

#define METER_PROTOCOL_DC_VOLTAGE_DECIMALS  4
#define METER_PROTOCOL_DC_CURRENT_DECIMALS  3
#define METER_PROTOCOL_DC_POWER_DECIMALS    4
#define METER_PROTOCOL_DC_ENERGY_DECIMALS   7
#define METER_PROTOCOL_DC_FACTOR_DECIMALS   2
////////////////////////////////////////////////////////////////////////////////
////
static sdk_mp_t USE_CAN0__EnergyRatio;
static sdk_mp_t Power_Ratio;
static USE_CAN0_Snapshot_T USE_CAN0_LatestSnapshot;

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USE_CAN0__RxRingBlock[USE_CAN0_RX_RING_SIZE];
static sdk_ring_t USE_CAN0__RxRing;
static os_semaphore_t USE_CAN0__RxSem;
static os_thread_t USE_CAN0__RxThread;

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USE_CAN0__RxThreadStack[USE_CAN0_RX_THREAD_STACK_SIZE];
static int USE_CAN0__State = USE_CAN0_STATE_CHARGE_IDLE;

static device_protocol_t USE_CAN0__Protocol;
static mcu_protocol_t    USE_CAN0__MCU_Protocol;
static char              USE_CAN0__StringBuffer[256];
////////////////////////////////////////////////////////////////////////////////
////

static void USE_CAN0__RxHandler(can_receive_message_struct* rxMsg, void* userdata)
{
    /* 采集到数据 */
    uint32_t tick = BSP_TIM6__TickCount;
    USE_CAN0_RxRecord_T* record = sdk_ring_get_write_slot(&USE_CAN0__RxRing);
    if(record){
        memcpy(&record->can_msg, rxMsg, sizeof(*rxMsg));
        record->tick_ms = tick;
    }
    os_semaphore_release(&USE_CAN0__RxSem);
}

static uint32_t current_real_value(uint32_t current){
    return current;
}

static uint32_t voltage_real_value(uint32_t voltage){
    return voltage;
}

static void USE_CAN0__SendMQTT(uint8_t* data, uint32_t size){
    BSP_USART1_Lock();
    mcu_protocol_meter_data(&USE_CAN0__MCU_Protocol, data, size);
    mcu_protocol_send(&USE_CAN0__MCU_Protocol);
    BSP_USART1_UnLock();
}

static void USE_CAN0_SendToOLED(uint8_t x, uint8_t y, const char* string, uint8_t size){
    BSP_USART1_Lock();
    mcu_protocol_oled_display(&USE_CAN0__MCU_Protocol, x, y, size, string);
    mcu_protocol_send(&USE_CAN0__MCU_Protocol);
    BSP_USART1_UnLock();
}

#define USE_CAN0_MAX_LINES 122
static bool USE_CAN0__SendFlag = false;

static void USE_CAN0_HandleProtocol(int state){
    int lines = USE_CAN0__Protocol.lines;
    int write_idx = USE_CAN0__Protocol.write_idx;
    device_protocol_buffer_t * buffer = &USE_CAN0__Protocol.buffers[write_idx];
    uint32_t Current = USE_CAN0_LatestSnapshot.Current;
    uint32_t Voltage = USE_CAN0_LatestSnapshot.Voltage;
    uint32_t Power = sdk_mp_tointu(USE_CAN0_LatestSnapshot.Power)/HUMAN_POWER_RATIO;
    uint32_t Energy = sdk_mp_toint(USE_CAN0_LatestSnapshot.EnergyWH);
    device_session_t* session = device_session_get();
    uint32_t ticks = BSP_TIM6__TickCount;

    if(state==USE_CAN0_STATE_CHARGE_IDLE){
        /* 充电结束了, 发送数据 */

        int idx = DEVICE_PROTOCOL_DU_DC_LINE_ITEM_BYTES * lines + 47 /* 第一条数据起始位置 */;

        /* 写入一行数据 */
        DEVICE_PROTOCOL_DATETIME_SET(buffer->buffer, idx
        , session->datetime.year
        , session->datetime.month
        , session->datetime.date
        , session->datetime.hour
        , session->datetime.minute
        , session->datetime.second
        , ticks
        ); idx+=9;
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, Voltage); idx+=4;
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, Current); idx+=4;
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, Power); idx+=4;
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, Energy); idx+=4;
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, 100); idx+=4;  /*功率因素*/
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, 50); idx+=4; /*频率*/

        /* 填写头部信息 */
        DEVICE_PROTOCOL_START_SET(buffer->buffer);
        DEVICE_PROTOCOL_CMD_SET(buffer->buffer, 0x03);
        DEVICE_PROTOCOL_RSP_SET(buffer->buffer, 0xFE);
        DEVICE_PROTOCOL_ENCRYPT_SET(buffer->buffer, 0x01);
        DEVICE_PROTOCOL_DU_SIZE_SET(buffer->buffer, 4042);

        idx = 31;
        DEVICE_PROTOCOL_DATETIME_SET(buffer->buffer, idx
        , session->datetime.year
        , session->datetime.month
        , session->datetime.date
        , session->datetime.hour
        , session->datetime.minute
        , session->datetime.second
        , ticks
        );

        SDK_HEX_SET_UINT8(buffer->buffer, 40, 0x03); /*信息类型ID*/
        SDK_HEX_SET_UINT8(buffer->buffer, 41, METER_PROTOCOL_DC_VOLTAGE_DECIMALS); /*电压分辨率*/
        SDK_HEX_SET_UINT8(buffer->buffer, 42, METER_PROTOCOL_DC_CURRENT_DECIMALS); /*电压分辨率*/
        SDK_HEX_SET_UINT8(buffer->buffer, 43, METER_PROTOCOL_DC_POWER_DECIMALS);  /*功率分辨率*/
        SDK_HEX_SET_UINT8(buffer->buffer, 44, METER_PROTOCOL_DC_ENERGY_DECIMALS);  /*电量分辨率*/
        SDK_HEX_SET_UINT8(buffer->buffer, 45, METER_PROTOCOL_DC_FACTOR_DECIMALS);  /*功率因素分辨率*/
        SDK_HEX_SET_UINT8(buffer->buffer, 46, USE_CAN0__Protocol.lines);           /*行数*/


        /* 却换到下一个buffer */
        write_idx = write_idx+1;
        if(write_idx >= DEVICE_PROTOCOL_BUFFER_COUNT){
            write_idx = 0;
        }
        USE_CAN0__Protocol.write_idx = write_idx;
        USE_CAN0__Protocol.lines = 0;
        memset(USE_CAN0__Protocol.buffers[write_idx].buffer, 0, sizeof(USE_CAN0__Protocol.buffers[write_idx].buffer));

        USE_CAN0__SendMQTT(buffer->buffer, 4072); /* 主控接收到数据后，要填充 CPUID 以及 CRC16 */

    }else if(state==USE_CAN0_STATE_CHARGE_WIP){
        /* 充电过程中 */

        if(!USE_CAN0__SendFlag){
            /* 第一条数据，及时通知服务器 */
            lines = USE_CAN0_MAX_LINES-1;
            USE_CAN0__SendFlag = true;
        }

        int idx = DEVICE_PROTOCOL_DU_DC_LINE_ITEM_BYTES * lines + 47 /* 第一条数据起始位置 */;

        /* 写入一行数据 */
        DEVICE_PROTOCOL_DATETIME_SET(buffer->buffer, idx
                                     , session->datetime.year
                                     , session->datetime.month
                                     , session->datetime.date
                                     , session->datetime.hour
                                     , session->datetime.minute
                                     , session->datetime.second
                                     , ticks
                                     ); idx+=9;
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, Voltage); idx+=4;
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, Current); idx+=4;
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, Power); idx+=4;
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, Energy); idx+=4;
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, 100); idx+=4;  /*功率因素*/
        SDK_HEX_SET_UINT32_BE(buffer->buffer, idx, 50); idx+=4; /*频率*/

        /* 计算下一行的位置 */
        lines = lines + 1;
        if(lines>=USE_CAN0_MAX_LINES){

            /* 填写头部信息 */
            DEVICE_PROTOCOL_START_SET(buffer->buffer);
            DEVICE_PROTOCOL_CMD_SET(buffer->buffer, 0x03);
            DEVICE_PROTOCOL_RSP_SET(buffer->buffer, 0xFE);
            DEVICE_PROTOCOL_ENCRYPT_SET(buffer->buffer, 0x01);
            DEVICE_PROTOCOL_DU_SIZE_SET(buffer->buffer, 4042);

            idx = 31;
            DEVICE_PROTOCOL_DATETIME_SET(buffer->buffer, idx
                , session->datetime.year
                , session->datetime.month
                , session->datetime.date
                , session->datetime.hour
                , session->datetime.minute
                , session->datetime.second
                , ticks
            );

            SDK_HEX_SET_UINT8(buffer->buffer, 40, 0x03); /*信息类型ID*/
            SDK_HEX_SET_UINT8(buffer->buffer, 41, METER_PROTOCOL_DC_VOLTAGE_DECIMALS); /*电压分辨率*/
            SDK_HEX_SET_UINT8(buffer->buffer, 42, METER_PROTOCOL_DC_CURRENT_DECIMALS); /*电压分辨率*/
            SDK_HEX_SET_UINT8(buffer->buffer, 43, METER_PROTOCOL_DC_POWER_DECIMALS);  /*功率分辨率*/
            SDK_HEX_SET_UINT8(buffer->buffer, 44, METER_PROTOCOL_DC_ENERGY_DECIMALS);  /*电量分辨率*/
            SDK_HEX_SET_UINT8(buffer->buffer, 45, METER_PROTOCOL_DC_FACTOR_DECIMALS);  /*功率因素分辨率*/
            SDK_HEX_SET_UINT8(buffer->buffer, 46, USE_CAN0__Protocol.lines);           /*行数*/


            /* 却换到下一个buffer */
            write_idx = write_idx+1;
            if(write_idx >= DEVICE_PROTOCOL_BUFFER_COUNT){
                write_idx = 0;
            }
            USE_CAN0__Protocol.write_idx = write_idx;
            USE_CAN0__Protocol.lines = 0;
            memset(USE_CAN0__Protocol.buffers[write_idx].buffer, 0, sizeof(USE_CAN0__Protocol.buffers[write_idx].buffer));

            USE_CAN0__SendMQTT(buffer->buffer, 4072); /* 主控接收到数据后，要填充 CPUID 以及 CRC16 */
        }else{
            USE_CAN0__Protocol.lines = lines;
        }


    }else if(state == USE_CAN0_STATE_CHARGE_START){
        /* 开始充电 */
        USE_CAN0__SendFlag = false;
    }


}


static void USE_CAN0__RxThreadEntry(void* p){

    BSP_CAN0_SetRxHandler(USE_CAN0__RxHandler, 0);
    os_size_t used = 0;
    os_size_t i = 0;
    uint32_t current = 0;
    uint32_t voltage = 0;
    uint32_t rVoltage = 0;
    uint32_t rCurrent = 0;
    uint32_t nCount = BSP_TIM6__TickCount;
    uint32_t DeltaMS = 0;
    os_err_t err;

    while(1){
        err = os_semaphore_take(&USE_CAN0__RxSem, os_tick_from_millisecond(15000));
        if(err==OS_ETIMEOUT){

            USE_CAN0_LatestSnapshot.Voltage = 0;
            USE_CAN0_LatestSnapshot.Current = 0;

            if(USE_CAN0__State!=USE_CAN0_STATE_CHARGE_IDLE){
                /* 之前在充电，现在停止了 */
                USE_CAN0__State = USE_CAN0_STATE_CHARGE_IDLE;

                USE_CAN0_HandleProtocol(USE_CAN0_STATE_CHARGE_IDLE);
            }

            continue;
        }

        used = sdk_ring_used(&USE_CAN0__RxRing);
        for(i=0; i<used; i++){
            USE_CAN0_RxRecord_T* record = sdk_ring_pop(&USE_CAN0__RxRing);
            if(!record) continue;

            current = SDK_HEX_GET_UINT32_BE(record->can_msg.rx_data, 0);
            voltage = SDK_HEX_GET_UINT16_BE(record->can_msg.rx_data, 4);

            if(current>0x7FFFFFFFU){
                current = current - 0x80000000U;
            }else{
                current = 0x7FFFFFFFU - current;
            }

            if(current<5){
                current = 0;
            }

            rCurrent = current_real_value(current);
            rVoltage = voltage_real_value(voltage * 1000);

            if(USE_CAN0_LatestSnapshot.Current==0 || USE_CAN0_LatestSnapshot.Voltage==0){
                if(USE_CAN0__State!=USE_CAN0_STATE_CHARGE_IDLE){
                    /* 之前在充电，现在停止了 */
                    USE_CAN0__State = USE_CAN0_STATE_CHARGE_IDLE;

                    USE_CAN0_HandleProtocol(USE_CAN0_STATE_CHARGE_IDLE);
                }
            }

            if(USE_CAN0_LatestSnapshot.Current!=0 && USE_CAN0_LatestSnapshot.Voltage!=0){
                if(USE_CAN0__State == USE_CAN0_STATE_CHARGE_IDLE){
                    /* 开始充电 */
                    USE_CAN0__State = USE_CAN0_STATE_CHARGE_WIP;

                    /* 重置数据 */
                    sdk_mp_fromintu(USE_CAN0_LatestSnapshot.Power, 0, 0);
                    sdk_mp_fromintu(USE_CAN0_LatestSnapshot.EnergySum, 0, 0);
                    sdk_mp_fromintu(USE_CAN0_LatestSnapshot.EnergyWH, 0, 0);

                    USE_CAN0_HandleProtocol(USE_CAN0_STATE_CHARGE_START);

                    /* TODO: 发送 OLED 显示指令给主控，显示数据 */
                }else{
                    /* 充电过程中, 计算电量 Current x Voltage x DeltaMS */
                    DeltaMS = record->tick_ms - USE_CAN0_LatestSnapshot.TickStamp;
                    sdk_mp_fromintu(USE_CAN0_LatestSnapshot.Power, USE_CAN0_LatestSnapshot.Current, &USE_CAN0_LatestSnapshot.Power);
                    sdk_mp_mului(USE_CAN0_LatestSnapshot.Power, USE_CAN0_LatestSnapshot.Power, USE_CAN0_LatestSnapshot.Voltage, &USE_CAN0_LatestSnapshot.Power);
                    sdk_mp_mului(USE_CAN0_LatestSnapshot.Power, USE_CAN0_LatestSnapshot.Power, DeltaMS, &USE_CAN0_LatestSnapshot.Power);

                    sdk_mp_add(USE_CAN0_LatestSnapshot.EnergySum, USE_CAN0_LatestSnapshot.EnergySum, USE_CAN0_LatestSnapshot.Power, 0);
                    /*转换为人类可阅读的值*/
                    sdk_mp_div(USE_CAN0_LatestSnapshot.EnergyWH, USE_CAN0_LatestSnapshot.EnergySum, USE_CAN0__EnergyRatio, &USE_CAN0_LatestSnapshot.EnergyWH);

                    USE_CAN0_HandleProtocol(USE_CAN0_STATE_CHARGE_WIP);
                }
            }


            if(BSP_TIM6__TickCount - nCount >=1000){
                /* 用于显示 */
                nCount = BSP_TIM6__TickCount;
                /* TODO: 发送 OLED 显示指令给主控，显示数据 */
            }

            /* 更新最后一条数据 */
            USE_CAN0_LatestSnapshot.Voltage = rVoltage;
            USE_CAN0_LatestSnapshot.Current = rCurrent;
            USE_CAN0_LatestSnapshot.TickStamp = record->tick_ms;

        }

    }
}


////////////////////////////////////////////////////////////////////////////////
////

void USE_CAN0_Init(void)
{
    sdk_fmt_register('M', sdk_mp_fmt);
    sdk_mp_set(128);

    memset(&USE_CAN0_LatestSnapshot, 0, sizeof(USE_CAN0_LatestSnapshot));
    memset(&USE_CAN0__MCU_Protocol, 0, sizeof(USE_CAN0__MCU_Protocol));
    device_protocol_init(&USE_CAN0__Protocol);

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
            , OS_THREAD_DEFAULT_PRIORITY
            , OS_THREAD_DEFAULT_TICKS);
    os_thread_startup(&USE_CAN0__RxThread);
}