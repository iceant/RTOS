#include <mqtt.h>
#include <A7670C.h>
#include <os_kernel.h>
#include <stdio.h>
#include <string.h>
#include "global.h"
////////////////////////////////////////////////////////////////////////////////
#define TX_BUFFER_SZ 	(1024*4)
#define TX_TASK_COUNT	10

#define STACK_SIZE 1024

////////////////////////////////////////////////////////////////////////////////
////


typedef struct mqtt_tx_task_s{
    uint8_t tx_buffer[TX_BUFFER_SZ];
    size_t tx_data_size;
}mqtt_tx_task_t;


////////////////////////////////////////////////////////////////////////////////
static A7670C_MQTT_Session session;
static mqtt_tx_task_t tx_tasks[TX_TASK_COUNT];
static volatile int write_idx;
static volatile int read_idx;

static os_semaphore_t read_lock;
static os_semaphore_t  write_lock;
static os_thread_t tx_thread;

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t stack[STACK_SIZE];

static bool MQTT_TxThreadReady = false;
////////////////////////////////////////////////////////////////////////////////


static A7670C_Result MQTT__cmd_info(void){
    char buf[256] = {0};
    global_t* global = global_get();
    int buf_size = snprintf(buf, 128, "CPUID:%s,IMEI:%s,CCID:%s", BSP_CPUID_Read(), global->IMEI, global->ICCID);
    printf("%s\n", buf);
    MQTT_Publish(buf, buf_size);
    return kA7670C_Result_OK;
}

static void A7670C_MQTT__RxDataHandler(void* data, int data_size, void* userdata)
{
    if(strstr((char*)data, "reboot")){
        Board_Reboot();
    }else if(strstr((char*)data, "cpuid")){
        MQTT__cmd_info();
    }
}

static void A7670C_MQTT__OnConnectLost(void){
    MQTT_Reset();
}

static void tx_thread_entry(void* p){
    int nRetry = 3;
    A7670C_Result result;
    MQTT_TxThreadReady = true;
    while(1){

        while(read_idx==write_idx){
            os_semaphore_take(&read_lock, OS_WAIT_INFINITY);
        }

//        printf("[MQTT] TX Thread: read_idx=%d, write_idx=%d\r\n", read_idx, write_idx);

        while(read_idx!=write_idx){
            mqtt_tx_task_t* task = &tx_tasks[read_idx];

            printf("MQTT SEND: read_idx = %d/%d, buffer=%08x, size=%d\n", read_idx, TX_TASK_COUNT, (uint32_t)task->tx_buffer, task->tx_data_size);

            int next_read_idx = read_idx+1;
            if(next_read_idx>=TX_TASK_COUNT){
                next_read_idx = 0;
            }

            read_idx = next_read_idx;

            global_t* global = global_get();

#if defined(MQTT_RESUB_ON_PUB)
            nRetry = 3;
            result = A7670C_MQTT_UnsubscribeOneTopic(&session, global->mqtt.Topic_Downstream, kA7670C_Bool_No);
            while(result!=kA7670C_Result_OK){
                printf("MQTT Unsub Downstream Topic Result: %d\n", result);
                if(nRetry-- ==0){
                    break;
                }
                os_thread_mdelay(1000);
            }
#endif

            nRetry = 3;
            do{
                result = A7670C_MQTT_Publish(&session, global->mqtt.Topic_Upstream
                                             , task->tx_buffer, task->tx_data_size
                                             , kA7670C_Qos_1
                                             , 60, kA7670C_Bool_No, kA7670C_Bool_No);

                if(result!=kA7670C_Result_OK){
                    printf("[MQTT] Publish Failed!\r\n");
                    A7670C_MQTT__OnConnectLost();
                }

                if(nRetry--==0){
                    break;
                }

                A7670C_NopDelay(0x3fffff);
            }while(result!=kA7670C_Result_OK);

#if defined(MQTT_RESUB_ON_PUB)
            nRetry = 3;
            result = A7670C_MQTT_SubscribeOneTopic(&session, global->mqtt.Topic_Downstream, kA7670C_Qos_0, kA7670C_Bool_No);
            while(result!=kA7670C_Result_OK){
                printf("MQTT Sub Downstream Topic Result: %d\n", result);
                if(nRetry-- ==0){
                    break;
                }
                rt_thread_mdelay(1000);
            }
#endif

            os_sem_release(&write_lock);
        }

    }
}


////////////////////////////////////////////////////////////////////////////////

int MQTT_Init(void)
{
    os_sem_init(&read_lock, "MQTT_RD_LOCK", 0, OS_QUEUE_FIFO);
    os_sem_init(&write_lock, "MQTT_WR_LOCK", 0, OS_QUEUE_FIFO);

    write_idx = 0;
    read_idx = 0;

    int nRetry = 3;

    global_t* global = global_get();



    os_thread_init(&tx_thread, "MQTT_TX_THD", tx_thread_entry, 0
            , stack, STACK_SIZE, 10
            , 50);
    os_thread_startup(&tx_thread);



    A7670C_MQTT_Init(&session, A7670C_MQTT__RxDataHandler, 0, A7670C_MQTT__OnConnectLost);
    A7670C_Result result = A7670C_MQTT_Connect(&session, global->mqtt.ClientID
                                               , global->mqtt.Server
                                               ,  64800, true
                                               , global->mqtt.Username
                                               , global->mqtt.Password);
    while(result!=kA7670C_Result_OK){
        printf("MQTT Connect Result: %d\n", result);
        if(nRetry-- ==0){
            return -1;
        }
        A7670C_NopDelay(0x3fffff);
        result = A7670C_MQTT_Connect(&session, global->mqtt.ClientID
                , global->mqtt.Server
                ,  64800, true
                , global->mqtt.Username
                , global->mqtt.Password);
    }

    nRetry = 3;
    printf("[MQTT] Subscribe %s\n", global->mqtt.Topic_Downstream);
    result = A7670C_MQTT_SubscribeOneTopic(&session, global->mqtt.Topic_Downstream
                                           , kA7670C_Qos_0, kA7670C_Bool_Unspecified);
    while(result!=kA7670C_Result_OK){
        printf("MQTT Sub Downstream Topic Result: %d\n", result);
        if(nRetry-- ==0){
            return -2;
        }
        A7670C_NopDelay(0x3fffff);
        result = A7670C_MQTT_SubscribeOneTopic(&session, global->mqtt.Topic_Downstream
                                               , kA7670C_Qos_0, kA7670C_Bool_Unspecified);
    }


    MQTT__cmd_info();
//    printf("MQTT Init Done!\n");

    return 0;
}

int MQTT_Publish(void* data, int data_size)
{
    while(A7670C_GetStartupState()!=A7670C_STARTUP_STATE_READY);
    
    int next_write_idx = write_idx + 1;
    if(next_write_idx>=TX_TASK_COUNT){
        next_write_idx = 0;
    }

    while(next_write_idx==read_idx){
        /*FULL*/
        os_semaphore_take(&write_lock, os_tick_from_millisecond(1000));
    }

    mqtt_tx_task_t* task = &tx_tasks[write_idx];
    memcpy(task->tx_buffer, data, data_size);
    task->tx_data_size = data_size;

    write_idx = next_write_idx;

    os_sem_release(&read_lock);

    return 0;
}

int MQTT_Reset(void){
    int nRetry = 3;
    printf("MQTT Try To Reconnect...\r\n");
    global_t* global = global_get();

//    A7670C_Reset();

    /*启动4G模块*/
    A7670C_Result A7670c_result = A7670C_Startup();

    if(A7670c_result!=kA7670C_Result_OK){
        /*启动4G模块失败，直接跳转到应用中*/
        Board_Reboot();
    }

    //A7670C_MQTT_Init(&session, A7670C_MQTT__RxDataHandler, 0, A7670C_MQTT__OnConnectLost);
    A7670C_MQTT_Disconnect(&session, 60, true);
    session.state = kA7670C_MQTT_State_IDLE;
    A7670C_Result result = A7670C_MQTT_Connect(&session, global->mqtt.ClientID
                                               , global->mqtt.Server
                                               ,  64800, true
                                               , global->mqtt.Username
                                               , global->mqtt.Password);
    while(result!=kA7670C_Result_OK){
        printf("MQTT Connect Result: %d\n", result);
        result = A7670C_MQTT_Connect(&session, global->mqtt.ClientID
                                     , global->mqtt.Server
                                     ,  64800, true
                                     , global->mqtt.Username
                                     , global->mqtt.Password);
        if(nRetry-- ==0){
            Board_Reboot();
        }
        os_thread_mdelay(1000);
    }

    nRetry = 3;
    result = A7670C_MQTT_SubscribeOneTopic(&session, global->mqtt.Topic_Downstream
                                           , kA7670C_Qos_0, kA7670C_Bool_No);
    while(result!=kA7670C_Result_OK){
        printf("MQTT Sub Downstream Topic Result: %d\n", result);
        if(nRetry-- ==0){
            Board_Reboot();
        }
        os_thread_mdelay(1000);
    }

    return 0;
}
