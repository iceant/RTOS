#include <task_timesync.h>

#include <board.h>
#include <os_kernel.h>
#include <A7670C.h>
#include <DS1307.h>
#include <global.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////

#define TASK_NTP_PERIOD_MS  			(60*60*1000)
#define TASK_NTP_SHORT_PERIOD_MS  			(60*1000)
//#define TASK_NTP_PERIOD_MS  			(30*1000)


#define TIME_DELAY 0x3FFF
#define RETRY_MAX  5

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t Task_TimeSync_Stack[1024];
static os_thread_t Task_TimeSync_Thread;

////////////////////////////////////////////////////////////////////////////////
////

static int Task_TimeSync_Sync(void){
    int nRetry = RETRY_MAX;
    A7670C_Result result;
    A7670C_CCLK_Read_Response CCLK_Read_Response;
    A7670C_CNTP_Write_Response CNTP_Write_Response;
    A7670C_CNTP_Exec_Response CNTP_Exec_Response;
    while(A7670C_GetStartupState()!=A7670C_STARTUP_STATE_READY);
    do {
        // 1. 设置 NTP 服务其
        result = A7670C_CNTP_Write(&CNTP_Write_Response, "ntp1.aliyun.com", 32, 24000);
        if (CNTP_Write_Response.code == kA7670C_Response_Code_OK) {
            break;
        }
        printf("[TASK_NTC] CNTP Write Failed! Code=%d, Retry=%d\r\n", CNTP_Write_Response.code, nRetry);
        if(nRetry==0) {
            return -1;
        }
        A7670C_NopDelay(TIME_DELAY);
    }while(nRetry--);

    nRetry = RETRY_MAX;
    do {
        // 2. 同步时间
        result = A7670C_CNTP_Exec(&CNTP_Exec_Response, 12000);
        if (CNTP_Exec_Response.code != kA7670C_Response_Code_OK) {
            printf("[TASK_NTC] CNTP Exec Failed! Code=%d, Error=%d\r\n", CNTP_Exec_Response.code,
                   CNTP_Exec_Response.err_code);
            if(nRetry==0) {
                return -2;
            }
            A7670C_NopDelay(TIME_DELAY);
        }else{
            break;
        }
    } while (nRetry--);


    nRetry=RETRY_MAX;
    do {
        // 3. 读取时间
        result = A7670C_CCLK_Read(&CCLK_Read_Response, 12000);
        if (CCLK_Read_Response.code != kA7670C_Response_Code_OK) {
            printf("[TASK_NTC] CCLK Read Failed! Code=%d\r\n", CCLK_Read_Response.code);
            if(nRetry==0) {
                return -3;
            }
            A7670C_NopDelay(TIME_DELAY);
        }else{
            break;
        }
    } while (nRetry--);


    // 4. 转换时间
    A7670C_CCLK_DateTime datetime;
    A7670C_CCLK_ToDateTime(&datetime, &CCLK_Read_Response);
    
    if(datetime.year==2070 && datetime.month==1 && datetime.day==1 && datetime.hour==0){
        return -3;
    }

    // 5. 设置到RTC中
    DS1307_SetYear(datetime.year);
    DS1307_SetMonth(datetime.month);
    DS1307_SetDate(datetime.day);
    DS1307_SetHour(datetime.hour);
    DS1307_SetMinute(datetime.min);
    DS1307_SetSecond(datetime.sec+2);

    global_set_datetime(datetime.year, datetime.month, datetime.day, datetime.hour, datetime.min, datetime.sec+2);

    printf("[TASK_NTC] DateTime SynTo: %04d-%02d-%02d %02d:%02d:%02d\r\n"
            , DS1307_GetYear()
            , DS1307_GetMonth()
            , DS1307_GetDate()
            , DS1307_GetHour()
            , DS1307_GetMinute()
            , DS1307_GetSecond()
    );

    return 0;
}

static void Task_TimeSync_ThreadEntry(void* p){
    int err = 0;
    while(1){
        err = Task_TimeSync_Sync();
        if(err!=0){
            printf("[TASK_NTC] Sync Failed! Code=%d\n", err);
            os_thread_mdelay(TASK_NTP_SHORT_PERIOD_MS);
            continue;
        }
        os_thread_mdelay(TASK_NTP_PERIOD_MS);
    }
}

////////////////////////////////////////////////////////////////////////////////
////


void Task_TimeSync_Init(void)
{
    os_thread_init(&Task_TimeSync_Thread, "Tsk_TimSyc"
                   , Task_TimeSync_ThreadEntry, 0
                   , Task_TimeSync_Stack, sizeof(Task_TimeSync_Stack)
            , GLOBAL_DEFAULT_THREAD_PRIORITY
            , GLOBAL_DEFAULT_THREAD_TTICKS);
    os_thread_startup(&Task_TimeSync_Thread);

}

void Task_TimeSync_Invoke(void){
    Task_TimeSync_Sync();
}


