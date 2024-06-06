#include <task_mcu_datetime.h>
#include <os_kernel.h>
#include <mcu_protocol.h>
#include <DS1307.h>
#include <global.h>
////////////////////////////////////////////////////////////////////////////////
////
#define TASK_MCU_DATETIME_STACK_SIZE 1024

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t Task_MCU_DateTime__Stack[TASK_MCU_DATETIME_STACK_SIZE];
static os_thread_t Task_MCU_DateTime__Thread;


static void Task_MCU_DateTime_Thread_Entry(void* p){
    while(1){

        mcu_protocol_du_datetime(&mcu_protocol_g_tx_protocol
                                 , global_g_datetime.year
                                 , global_g_datetime.month
                                 , global_g_datetime.date
                                 , global_g_datetime.hour
                                 , global_g_datetime.min
                                 , global_g_datetime.sec);

        sdk_hex_dump("[TASK_MCU_DATETIME]", mcu_protocol_g_tx_protocol.buffer, MCU_PROTOCOL_PKG_SIZE_GET(&mcu_protocol_g_tx_protocol));
        mcu_protocol_send(&mcu_protocol_g_tx_protocol);

        os_thread_mdelay(1000);
    }
}
////////////////////////////////////////////////////////////////////////////////
////


void Task_MCU_DateTime_Init(void)
{
    os_thread_init(&Task_MCU_DateTime__Thread, "TskMCUDateTime", Task_MCU_DateTime_Thread_Entry, 0
        , Task_MCU_DateTime__Stack, sizeof(Task_MCU_DateTime__Stack), 20, 100);
    os_thread_startup(&Task_MCU_DateTime__Thread);

}