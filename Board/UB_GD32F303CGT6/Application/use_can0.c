#include <use_can0.h>
#include <os_kernel.h>
#include <sdk_ring.h>
#include <string.h>
#include <bsp_tim6.h>
#include "meter_protocol.h"
#include "global.h"
#include "CAN.h"
#include <mcu_protocol.h>
#include <sdk_crc16.h>

////////////////////////////////////////////////////////////////////////////////
////
typedef struct USE_CAN0_CanRxMessage_S{
    os_tick_t tick_stamp;
    can_receive_message_struct can_msg;
}USE_CAN0_CanRxMessage_T;

////////////////////////////////////////////////////////////////////////////////
////
#define USE_CAN0_RX_THREAD_STACK_SIZE 1024
#define OBJECT_SIZE sizeof(USE_CAN0_CanRxMessage_T)
#define OBJECT_COUNT 50
#define BLOCK_SIZE (OBJECT_SIZE * OBJECT_COUNT)

#define USE_CAN0_MAX_METER_PROTOCOL_BUFFER_COUNT 2
#define USE_CAN0_TIMEOUT_MS 15000
#define USE_CAN0_MAX_LINES 166

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t USE_CAN0_RxThread_Stack[USE_CAN0_RX_THREAD_STACK_SIZE];
static os_thread_t USE_CAN0_RxThread;
static os_semaphore_t USE_CAN0_RxSem;
static uint8_t USE_CAN0_RxBlock[BLOCK_SIZE];
static sdk_ring_t USE_CAN0_RxRing;

static meter_protocol_t USE_CAN0__MeterProtocolBuffers[USE_CAN0_MAX_METER_PROTOCOL_BUFFER_COUNT];
static int USE_CAN0_MeterProtocl_WriteIdx = 0;

static USE_CAN0_OnTimeout_Handler USE_CAN0__OnTimeoutHandler=0;
static void* USE_CAN0__OnTimeoutHandler_Userdata=0;
static mcu_protocol_t mcu_tx_protocol;
static CAN_Parse_Session_T USE_CAN0__CAN_ParseSession;
////////////////////////////////////////////////////////////////////////////////
////

static void USE_CAN0__HandleRxMessage(bool isTimeout);

static meter_protocol_t *USE_CAN0__SendCAN(meter_protocol_t *protocol, const global_t *global, uint32_t tick);

static void USE_CAN0_RxHandler(can_receive_message_struct* rxMsg, void* userdata)
{
    uint32_t tick = BSP_TIM6__TickCount;
    USE_CAN0_CanRxMessage_T* msg = sdk_ring_get_write_slot(&USE_CAN0_RxRing);
    if(!msg){return;}
    memcpy(&msg->can_msg, rxMsg, sizeof(*rxMsg));
    msg->tick_stamp = tick;
    os_semaphore_release(&USE_CAN0_RxSem);
}

static void USE_CAN0_RxThread_Entry(void* p){
    BSP_CAN0_SetRxHandler(USE_CAN0_RxHandler, 0);
    int err = 0;
    while(1){
        err = os_semaphore_take(&USE_CAN0_RxSem, USE_CAN0_TIMEOUT_MS);
        if(err==OS_EOK)
        {
            USE_CAN0__HandleRxMessage(false);
        }else if(err==OS_ETIMEOUT){
            USE_CAN0__HandleRxMessage(true);
        }
    }
}
static char USE_CAN0__Hex[17]={0};

static void USE_CAN0__HandleRxMessage(bool isTimeout) {
    meter_protocol_t* protocol = &USE_CAN0__MeterProtocolBuffers[USE_CAN0_MeterProtocl_WriteIdx];
    global_t* global = global_get();
    int used = (int)sdk_ring_used(&USE_CAN0_RxRing);

    for(int i=0; i<used; i++){
        USE_CAN0_CanRxMessage_T* msg = sdk_ring_pop(&USE_CAN0_RxRing);
        if(!msg){
            continue;
        }

#if 0
        memset(USE_CAN0__Hex, 0, sizeof(USE_CAN0__Hex));
        SDK_HEX_ENCODE_BE(USE_CAN0__Hex, sizeof(USE_CAN0__Hex), msg->can_msg.rx_data, msg->can_msg.rx_dlen);
        mcu_protocol_du_print(&mcu_protocol_g_tx_protocol, USE_CAN0__Hex, strlen(USE_CAN0__Hex));
#endif

        uint32_t tick = BSP_TIM6__TickCount;
        uint32_t FrameID = (msg->can_msg.rx_ff==CAN_FF_STANDARD)?msg->can_msg.rx_sfid:msg->can_msg.rx_efid;
        uint8_t TPCM_Type = CAN_GetTPCMType(FrameID, msg->can_msg.rx_data, msg->can_msg.rx_dlen);

        if(TPCM_Type!=CAN_TPCM_UNKNOWN){
            /*分包类型直接发送*/
            METER_PROTOCOL_CAN_LINE_FILL(protocol, protocol->lines, global->datetime.year
            , global->datetime.month
            , global->datetime.date
            , global->datetime.hour
            , global->datetime.min
            , global->datetime.sec
            , tick
            , FrameID
            , msg->can_msg.rx_dlen
            , msg->can_msg.rx_data
            );
            protocol->lines+=1;
        }else{
            /*不是分包*/
            int updated = CAN_Parse(&USE_CAN0__CAN_ParseSession, FrameID, msg->can_msg.rx_data, msg->can_msg.rx_dlen);
            if(updated==0) continue; /*没有更新*/
            METER_PROTOCOL_CAN_LINE_FILL(protocol, protocol->lines, global->datetime.year
            , global->datetime.month
            , global->datetime.date
            , global->datetime.hour
            , global->datetime.min
            , global->datetime.sec
            , tick
            , FrameID
            , msg->can_msg.rx_dlen
            , msg->can_msg.rx_data
            );
            protocol->lines+=1;
        }

        if(protocol->lines==USE_CAN0_MAX_LINES+1){
            protocol = USE_CAN0__SendCAN(protocol, global, tick);
        }
    }

    if(isTimeout){
        if(protocol->lines>0){
            uint32_t tick = BSP_TIM6__TickCount;
            protocol = USE_CAN0__SendCAN(protocol, global, tick);
        }
        CAN_Parse_Session_Init(&USE_CAN0__CAN_ParseSession);
    }
}

static meter_protocol_t *USE_CAN0__SendCAN(meter_protocol_t *protocol, const global_t *global, uint32_t tick) {
    METER_PROTOCOL_CAN_INIT(protocol, global->CPUID);
    METER_PROTOCOL_DUSIZE_SET(protocol, protocol->lines * 24 /*每行字节数*/ + 11/*时间，数据类型，数据条数*/);
    METER_PROTOCOL_CAN_LINES_SET(protocol, protocol->lines);
    METER_PROTOCOL_DATETIME_SET(protocol, 31, global->datetime.year, global->datetime.month, global->datetime.date,
                                global->datetime.hour, global->datetime.min, global->datetime.sec, tick);
    int buffer_size = protocol->lines * 24 /*每行字节数*/ + 42 /* 头部字节数 */;
    uint16_t crc = sdk_crc16(protocol->buffer, buffer_size);
    SDK_HEX_SET_UINT16_LE(protocol->buffer, buffer_size, crc);

    mcu_protocol_can_init(&mcu_tx_protocol, protocol->buffer, buffer_size + 2);
    mcu_protocol_send(&mcu_tx_protocol);

    int next_idx = USE_CAN0_MeterProtocl_WriteIdx;
    if(next_idx==USE_CAN0_MAX_METER_PROTOCOL_BUFFER_COUNT){
        next_idx = 0;
    }
    USE_CAN0_MeterProtocl_WriteIdx = next_idx;
    protocol = &USE_CAN0__MeterProtocolBuffers[USE_CAN0_MeterProtocl_WriteIdx];
    protocol->lines = 0;
    return protocol;
}


////////////////////////////////////////////////////////////////////////////////
////


void USE_CAN0_Init(void)
{

    CAN_Parse_Session_Init(&USE_CAN0__CAN_ParseSession);

    memset(USE_CAN0__MeterProtocolBuffers, 0, sizeof(*USE_CAN0__MeterProtocolBuffers) * OS_ARRAY_SIZE(USE_CAN0__MeterProtocolBuffers));
    USE_CAN0__OnTimeoutHandler = 0;
    USE_CAN0__OnTimeoutHandler_Userdata = 0;
    USE_CAN0_MeterProtocl_WriteIdx = 0;
    sdk_ring_init(&USE_CAN0_RxRing, USE_CAN0_RxBlock, OBJECT_COUNT, OBJECT_SIZE);
    os_semaphore_init(&USE_CAN0_RxSem, "CAN0_RxSem", 0, OS_QUEUE_FIFO);
    os_thread_init(&USE_CAN0_RxThread, "CAN0_RxThd", USE_CAN0_RxThread_Entry, 0,
                   USE_CAN0_RxThread_Stack, sizeof(USE_CAN0_RxThread_Stack),
                   20, 10);
    os_thread_startup(&USE_CAN0_RxThread);
}

void USE_CAN0_SetOnTimeoutHandler(USE_CAN0_OnTimeout_Handler handler, void* userdata)
{
    USE_CAN0__OnTimeoutHandler = handler;
    USE_CAN0__OnTimeoutHandler_Userdata = userdata;
}
