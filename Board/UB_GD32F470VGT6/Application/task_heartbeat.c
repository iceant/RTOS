#include <task_heartbeat.h>
#include <os_kernel.h>
#include <mqtt.h>
#include <meter_protocol.h>
#include <global.h>
#include <bsp_cpuid.h>
#include <sdk_crc16.h>
#include <bsp_tim6.h>
#include <A7670C.h>
////////////////////////////////////////////////////////////////////////////////
////
#define TASK_HEARTBEAT_TIME_MS (60*1000)

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t Task_HeartBeat_Thread_Stack[1024];
static os_thread_t Task_HeartBeat_Thread;
static meter_protocol_heartbeat_t heartbeat_buffer;
static bool Task_HeartBeat__GPS_Ready = false;
static void Task_HeartBeat_Thread_Entry(void* p){
//    A7670C_CGNSSPWR_Read_Response CGNSSPWR_Read_Response;
//
//    do{
//        A7670C_CGNSSPWR_Read(&CGNSSPWR_Read_Response, 12000);
//        if(CGNSSPWR_Read_Response.code==kA7670C_Response_Code_OK){
//            printf("GNSS_Power_Status=%d, AP_Flash_Status=%d\n", CGNSSPWR_Read_Response.GNSS_Power_Status, CGNSSPWR_Read_Response.AP_Flash_Status);
//        }
//
//        if(CGNSSPWR_Read_Response.GNSS_Power_Status==0){
//            A7670C_CGNSSPWR_Write_Response CGNSSPWR_Write_Response;
//            A7670C_CGNSSPWR_Write(&CGNSSPWR_Write_Response, 0, 1, 12000);
//            if(CGNSSPWR_Write_Response.code!=kA7670C_Response_Code_OK){
//                printf("CGNSSPWR_Write Failed!\n");
//            }
//        }
//
//        os_thread_mdelay(1000);
//    }while(CGNSSPWR_Read_Response.AP_Flash_Status==0);
//    int nRetry = 3;
//    while(1){
//        A7670C_CGPSINFO_Read_Response CGPSINFO_Read_Response;
//        A7670C_CGPSINFO_Read(&CGPSINFO_Read_Response, 9000);
//        if(CGPSINFO_Read_Response.code == kA7670C_Response_Code_OK){
//            printf("[TASK_HB] CGPSINFO.Read.Time=%d\n", CGPSINFO_Read_Response.time);
//        }
//        if(CGPSINFO_Read_Response.time!=10){
//            A7670C_CGPSINFO_Write_Response CGPSINFO_Write_Response;
//            A7670C_CGPSINFO_Write(&CGPSINFO_Write_Response, 10, 9000);
//            if(CGPSINFO_Write_Response.code!=kA7670C_Response_Code_OK){
//                printf("[TASK_HB] CGPSINFO.Write Failed!\n");
//                Task_HeartBeat__GPS_Ready = false;
//
//                if(nRetry-- == 0){
//                    break;
//                }
//
//                continue;
//            }else{
//                Task_HeartBeat__GPS_Ready = true;
//                break;
//            }
//        }
//    }
    
    while(1){
        global_t * global = global_get();
        
//        A7670C_CGPSINFO_Exec_Response CGPSINFO_Exec_Response;
//        A7670C_CGPSINFO_Exec(&CGPSINFO_Exec_Response, 9000);
//        if(CGPSINFO_Exec_Response.code == kA7670C_Response_Code_OK){
//            printf("[TASK_HB] GPSINFO = %s\n", CGPSINFO_Exec_Response.info);
//            METER_PROTOCOL_HB_GPS_SET(&heartbeat_buffer, CGPSINFO_Exec_Response.info, strlen(CGPSINFO_Exec_Response.info));
//        }
        
        METER_PROTOCOL_HB_TYPE_SET(&heartbeat_buffer);
        METER_PROTOCOL_HWID_SET(&heartbeat_buffer, BSP_CPUID_Read(), strlen(BSP_CPUID_Read()));
        METER_PROTOCOL_ENCRYPT_SET(&heartbeat_buffer, 0x01);
        METER_PROTOCOL_DUSIZE_SET(&heartbeat_buffer, 40);
        METER_PROTOCOL_HB_PILE_STATUS_SET(&heartbeat_buffer, global_get()->meter_state);
        METER_PROTOCOL_DATETIME_SET(&heartbeat_buffer, 31, global->datetime.year
        , global->datetime.month
        , global->datetime.date
        , global->datetime.hour
        , global->datetime.min
        , global->datetime.sec
        , BSP_TIM6__TickCount
        );
        uint16_t crc = sdk_crc16(heartbeat_buffer.buffer, sizeof(heartbeat_buffer.buffer));
        METER_PROTOCOL_HB_CRC_SET(&heartbeat_buffer, crc);
        
        MQTT_Publish(&heartbeat_buffer, sizeof(heartbeat_buffer));
        
        
        os_thread_mdelay(TASK_HEARTBEAT_TIME_MS);
    }
}
////////////////////////////////////////////////////////////////////////////////
////

void Task_HeartBeat_Init(void){
    memset(&heartbeat_buffer, 0, sizeof(heartbeat_buffer));
    
    os_thread_init(&Task_HeartBeat_Thread, "TskHB", Task_HeartBeat_Thread_Entry, 0,
                   Task_HeartBeat_Thread_Stack, sizeof(Task_HeartBeat_Thread_Stack)
                   , 20, 10);
    os_thread_startup(&Task_HeartBeat_Thread);
}

