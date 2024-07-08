#include <task_mcu_datetime.h>
#include <os_kernel.h>
#include <mcu_session.h>
#include <global.h>

////////////////////////////////////////////////////////////////////////////////
////
#define TASK_MCU_DATETIME_STACK_SIZE 1024

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t Task_MCU_DateTime__Stack[TASK_MCU_DATETIME_STACK_SIZE];
static os_thread_t Task_MCU_DateTime__Thread;


static void Task_MCU_DateTime_Thread_Entry(void* p){
    global_datetime_t * datetime;
    mcu_session_t* mcu_session = mcu_session_get_default();
    while(1){
        datetime = &global_get()->datetime;

        uint8_t * buffer = MCU_SESSION_DU_GET(mcu_session);
        int idx =0;
        SDK_HEX_SET_UINT16_BE(buffer, idx, datetime->year); idx+=2;
        SDK_HEX_SET_UINT8(buffer, idx, datetime->month); idx+=1;
        SDK_HEX_SET_UINT8(buffer, idx, datetime->date); idx+=1;
        SDK_HEX_SET_UINT8(buffer, idx, datetime->hour); idx+=1;
        SDK_HEX_SET_UINT8(buffer, idx, datetime->min); idx+=1;
        SDK_HEX_SET_UINT8(buffer, idx, datetime->sec); idx+=1;
        mcu_session_pack(mcu_session, kMCU_PROTOCOL_DU_DATETIME, 0, 7);
        mcu_session_send(mcu_session, 0, 0);


        os_thread_mdelay(1000);
    }
}
////////////////////////////////////////////////////////////////////////////////
////


void Task_MCU_DateTime_Init(void)
{
    os_thread_init(&Task_MCU_DateTime__Thread, "TskMCUDateTime", Task_MCU_DateTime_Thread_Entry, 0
        , Task_MCU_DateTime__Stack, sizeof(Task_MCU_DateTime__Stack)
        , GLOBAL_DEFAULT_THREAD_PRIORITY
        , GLOBAL_DEFAULT_THREAD_TTICKS);

    os_thread_startup(&Task_MCU_DateTime__Thread);

}