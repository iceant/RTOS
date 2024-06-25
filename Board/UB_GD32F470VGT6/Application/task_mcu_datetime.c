#include <task_mcu_datetime.h>
#include <os_kernel.h>
#include <mcu_protocol.h>
#include <DS1307.h>
#include <global.h>
#include <bsp_cpuid.h>
////////////////////////////////////////////////////////////////////////////////
////
#define TASK_MCU_DATETIME_STACK_SIZE 1024

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t Task_MCU_DateTime__Stack[TASK_MCU_DATETIME_STACK_SIZE];
static os_thread_t Task_MCU_DateTime__Thread;


static void Task_MCU_DateTime_Thread_Entry(void* p){
    global_datetime_t * datetime;
    while(1){
        datetime = &global_get()->datetime;
        mcu_protocol_du_datetime(&mcu_protocol_g_tx_protocol
                                 , datetime->year
                                 , datetime->month
                                 , datetime->date
                                 , datetime->hour
                                 , datetime->min
                                 , datetime->sec);
        mcu_protocol_send(&mcu_protocol_g_tx_protocol);

        /* Send CPUID */
        //printf("[TASK_MCU_DT]Send CPUID:%s\n", BSP_CPUID_Read());
        mcu_protocol_init(&mcu_protocol_g_tx_protocol, kMCU_PROTOCOL_DU_CPUID, BSP_CPUID_Read(), strlen(BSP_CPUID_Read()));
        mcu_protocol_crc(&mcu_protocol_g_tx_protocol);
        mcu_protocol_send(&mcu_protocol_g_tx_protocol);

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