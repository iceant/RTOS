#include <mqtt.h>
#include <A7670C.h>
#include <os_kernel.h>
#include <stdio.h>
#include <string.h>
#include "global.h"
#include <ff.h>
#include <sdk_hex.h>
////////////////////////////////////////////////////////////////////////////////
#define TX_BUFFER_SZ 	(1024*4)
#define TX_TASK_COUNT	50

#define STACK_SIZE 1024

#define MQTT_QUEUE_META_FILE "0:mqtt_queue.dat"
#define MQTT_QUEUE_DATA_FILE "0:mqtt_data_%u.dat"

////////////////////////////////////////////////////////////////////////////////
////

typedef struct C__PACKED mqtt_tx_task_s{
    uint32_t    tx_data_size;
    uint8_t     tx_buffer[TX_BUFFER_SZ];
}mqtt_tx_task_t;

typedef struct mqtt_tx_queue_s{
    mqtt_tx_task_t tasks[TX_TASK_COUNT];
    int read_idx;
    int write_idx;
    os_semaphore_t read_lock;
    os_semaphore_t write_lock;
    uint32_t f_items;
    uint32_t f_send_items;
}mqtt_tx_queue_t;

#define MQTT_TX_TASK_SIZE sizeof(mqtt_tx_task_t)
////////////////////////////////////////////////////////////////////////////////

static A7670C_MQTT_Session session={0};

static os_thread_t tx_thread={0};

C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t stack[STACK_SIZE]={0};

static bool MQTT_TxThreadReady = false;

C__ALIGNED(OS_ALIGN_SIZE)
static mqtt_tx_queue_t tx_queue={0};

static FIL mqtt__f_object;
static os_mutex_t mqtt__f_lock;
static char mqtt__f_name[256];
static mqtt_tx_task_t mqtt__f_task;
////////////////////////////////////////////////////////////////////////////////
////

static int mqtt_queue_meta_write(mqtt_tx_queue_t* queue)
{
    FRESULT f_result;
    UINT write_size;

    if(global_get()->fatfs.state==GLOBAL_FATFS_STATE_MOUNT_SUCCESS){
        f_result = f_open(&mqtt__f_object, MQTT_QUEUE_META_FILE, FA_OPEN_ALWAYS | FA_WRITE);
        if(f_result!=FR_OK){
            printf("[MQTT] open %s failed! code=%d\n", MQTT_QUEUE_META_FILE, f_result);
            return -1;
        }
        uint8_t wbuffer[8];
        SDK_HEX_SET_UINT32_BE(wbuffer, 0, queue->f_items);
        SDK_HEX_SET_UINT32_BE(wbuffer, 4, queue->f_send_items);
        f_result = f_write(&mqtt__f_object, wbuffer, sizeof(wbuffer), &write_size);
        if(f_result!=FR_OK){
            printf("[MQTT] write %s failed! code=%d\n", MQTT_QUEUE_META_FILE, f_result);
            return -2;
        }
        f_close(&mqtt__f_object);
        return 0;
    }
    return -3;
}


static int mqtt_queue_meta_read(mqtt_tx_queue_t * queue){
    FRESULT f_result;
    UINT read_size;
    uint8_t rbuffer[8];

    if(global_get()->fatfs.state==GLOBAL_FATFS_STATE_MOUNT_SUCCESS){
        f_result = f_open(&mqtt__f_object, MQTT_QUEUE_META_FILE, FA_OPEN_ALWAYS | FA_READ);
        if(f_result!=FR_OK){
            printf("[MQTT] open %s failed! code=%d\n", MQTT_QUEUE_META_FILE, f_result);
            return -1;
        }

        f_result = f_read(&mqtt__f_object, rbuffer, sizeof(rbuffer), &read_size);
        if(f_result!=FR_OK){
            printf("[MQTT] read %s failed! code=%d\n", MQTT_QUEUE_META_FILE, f_result);
            return -2;
        }

        queue->f_items = SDK_HEX_GET_UINT32_BE(rbuffer, 0);
        if(queue->f_items==-1U){
            queue->f_items = 0;
        }
        queue->f_send_items = SDK_HEX_GET_UINT32_BE(rbuffer, 4);
        if(queue->f_send_items==-1U){
            queue->f_send_items = 0;
        }

        f_close(&mqtt__f_object);
        return 0;
    }
    return -3;
}

static int mqtt_queue_data_write(mqtt_tx_queue_t * queue, mqtt_tx_task_t * task){
    FRESULT f_result;
    UINT write_size;
    int size;
    if(global_get()->fatfs.state==GLOBAL_FATFS_STATE_MOUNT_SUCCESS){

        size= snprintf(mqtt__f_name, sizeof(mqtt__f_name), MQTT_QUEUE_DATA_FILE, queue->f_items);
        mqtt__f_name[size]='\0';

        f_result = f_open(&mqtt__f_object, mqtt__f_name, FA_CREATE_ALWAYS | FA_WRITE | FA_READ);
        if(f_result!=FR_OK){
            printf("[MQTT] data open %s failed! code=%d\n", mqtt__f_name, f_result);
            return -1;
        }
        f_result = f_write(&mqtt__f_object, task->tx_buffer, task->tx_data_size, &write_size);
        if(f_result!=FR_OK){
            printf("[MQTT] data write %s failed! code=%d\n", mqtt__f_name, f_result);
            return -2;
        }
        f_close(&mqtt__f_object);
        return 0;
    }
    return -3;
}

static int mqtt_queue_data_read(mqtt_tx_queue_t * queue, uint32_t idx, mqtt_tx_task_t* task /* mqtt__f_task */){
    FRESULT f_result;
    UINT read_size;
    int size;

    if(global_get()->fatfs.state==GLOBAL_FATFS_STATE_MOUNT_SUCCESS){
        size= snprintf(mqtt__f_name, sizeof(mqtt__f_name), MQTT_QUEUE_DATA_FILE, idx);
        mqtt__f_name[size]='\0';

        f_result = f_open(&mqtt__f_object, mqtt__f_name, FA_OPEN_EXISTING | FA_READ);
        if(f_result!=FR_OK){
            printf("[MQTT] open %s failed! code=%d\n", mqtt__f_name, f_result);
            return -1;
        }

        f_result = f_read(&mqtt__f_object, task->tx_buffer, sizeof(task->tx_buffer), &read_size);
        if(f_result!=FR_OK){
            printf("[MQTT] write %s failed! code=%d\n", mqtt__f_name, f_result);
            return -2;
        }
        task->tx_data_size = read_size;
        f_close(&mqtt__f_object);

        f_unlink(mqtt__f_name); /* 删除文件 */

        return 0;
    }
    return -3;
}


////////////////////////////////////////////////////////////////////////////////
//// MQTT TX QUEUE

static int mqtt_tx_queue_init(mqtt_tx_queue_t* queue){
    memset(queue, 0, sizeof(*queue));
    queue->read_idx = 0;
    queue->write_idx = 0;
    queue->f_items = 0;
    queue->f_send_items = 0;

    os_mutex_init(&mqtt__f_lock);
    os_semaphore_init(&queue->read_lock, "MQTT_TxQ_RdLk", 0, OS_QUEUE_FIFO);
    os_semaphore_init(&queue->write_lock, "MQTT_TxQ_WrLk", 0, OS_QUEUE_FIFO);

    if(global_get()->fatfs.state == GLOBAL_FATFS_STATE_MOUNT_SUCCESS){
        return mqtt_queue_meta_read(queue);
    }
    return 0;
}

static int mqtt_tx_queue_blocked_put(mqtt_tx_queue_t* queue, uint8_t * data, int data_size){

    int next_write_idx;

    while(1){
        next_write_idx = queue->write_idx + 1;
        if(next_write_idx == TX_TASK_COUNT){
            next_write_idx = 0;
        }
        if(next_write_idx==queue->read_idx){
            os_semaphore_take(&queue->write_lock, OS_WAIT_INFINITY);
        }else{
            break;
        }
    }


    int copy_size = OS_MIN(data_size, TX_BUFFER_SZ);

    mqtt_tx_task_t* task = &queue->tasks[queue->write_idx];
    memcpy(task->tx_buffer, data, copy_size);
    task->tx_data_size = copy_size;

    printf("[MQTT] Put Into %d/%d \n", queue->write_idx, TX_TASK_COUNT);

    queue->write_idx = next_write_idx;

    os_semaphore_release(&queue->read_lock);

    return 0;
}

static mqtt_tx_task_t * mqtt_tx_queue_blocked_pop(mqtt_tx_queue_t * queue){
    mqtt_tx_task_t* task = 0;

    if(queue->f_send_items != queue->f_items){
        /*先处理文件中的数据*/
        int err = mqtt_queue_data_read(queue, queue->f_send_items, &mqtt__f_task);
        if(err==0){
            printf("[MQTT] read %d task from file!\n", queue->f_send_items);
            queue->f_send_items+=1;
            mqtt_queue_meta_write(queue);
            return &mqtt__f_task;
        }else{
            /*出错了，怎么办?*/
            printf("[MQTT] read %d task from file FAILED!!!\n", queue->f_send_items);
        }
    }

    while(queue->read_idx==queue->write_idx){
        os_semaphore_take(&queue->read_lock, OS_WAIT_INFINITY);
    }

    int next_read_idx = queue->read_idx + 1;
    if(next_read_idx == TX_TASK_COUNT){
        next_read_idx = 0;
    }
    task = &queue->tasks[queue->read_idx];
    queue->read_idx = next_read_idx;

    return task;
}

static int mqtt_tx_queue_write_unlock(mqtt_tx_queue_t* queue){
    return os_semaphore_release(&queue->write_lock);
}

static int mqtt_tx_queue_write_to_fs(mqtt_tx_queue_t * queue, mqtt_tx_task_t * task)
{
    int err = 0;

    os_mutex_lock(&mqtt__f_lock);
    {
        err = mqtt_queue_data_write(queue, task);
        queue->f_items+=1;
        err = mqtt_queue_meta_write(queue);
    }
    os_mutex_unlock(&mqtt__f_lock);
    return err;
}


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
    mqtt_tx_task_t * task = 0;
    while(1){
        while((task = mqtt_tx_queue_blocked_pop(&tx_queue))!=0){

             global_t* global = global_get();

            if(global->network_state>=GLOBAL_NETWORK_STATE_MQTT_INITIALIZED /* MQTT 可用 */){
                nRetry = 3;
                do{
                    result = A7670C_MQTT_Publish(&session, global->mqtt.Topic_Upstream
                            , task->tx_buffer, task->tx_data_size
                            , kA7670C_Qos_0
                            , 60, kA7670C_Bool_No, kA7670C_Bool_No);

                    if(result!=kA7670C_Result_OK){
                        printf("[MQTT] Publish Failed!\r\n");
                        /* 发送失败，记录到文件系统中 */
                        mqtt_tx_queue_write_to_fs(&tx_queue, task);

                        A7670C_MQTT__OnConnectLost();
                    }else{
                        printf("MQTT SEND SUCCESS: read_idx = %d/%d, size=%d\n", tx_queue.read_idx-1, TX_TASK_COUNT, task->tx_data_size);
                        break;
                    }

                    if(nRetry--==0){
                        break;
                    }

                }while(1);
            }else{
                /* MQTT 不可用 */
                mqtt_tx_queue_write_to_fs(&tx_queue, task);
            }
        }
        mqtt_tx_queue_write_unlock(&tx_queue);
    }
}

////////////////////////////////////////////////////////////////////////////////

int MQTT_Init(void)
{
    int nRetry = 3;
    mqtt_tx_queue_init(&tx_queue);

    global_t* global = global_get();

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
        result = A7670C_MQTT_Connect(&session, global->mqtt.ClientID
                , global->mqtt.Server
                ,  64800, true
                , global->mqtt.Username
                , global->mqtt.Password);
    }

    global->network_state=GLOBAL_NETWORK_STATE_MQTT_INITIALIZED;

    nRetry = 3;
    printf("[MQTT] Subscribe %s\n", global->mqtt.Topic_Downstream);
    result = A7670C_MQTT_SubscribeOneTopic(&session, global->mqtt.Topic_Downstream
                                           , kA7670C_Qos_0, kA7670C_Bool_Unspecified);
    while(result!=kA7670C_Result_OK){
        printf("MQTT Sub Downstream Topic Result: %d\n", result);
        if(nRetry-- ==0){
            return -2;
        }
        result = A7670C_MQTT_SubscribeOneTopic(&session, global->mqtt.Topic_Downstream
                                               , kA7670C_Qos_0, kA7670C_Bool_Unspecified);
    }

    global->network_state=GLOBAL_NETWORK_STATE_MQTT_DOWNSTREAM_TOPIC_SUBSCRIBED;

    MQTT__cmd_info();

    os_thread_init(&tx_thread, "MQTT_TX_THD", tx_thread_entry, 0
            , stack, STACK_SIZE, 20
            , 20);
    os_thread_startup(&tx_thread);

    return 0;
}

int MQTT_Publish(void* data, int data_size)
{
//    if(A7670C_GetStartupState()!=A7670C_STARTUP_STATE_READY) {
//        printf("[MQTT] A7670C Is Not Ready!!!\n");
//        return -1;
//    }

    return mqtt_tx_queue_blocked_put(&tx_queue, data, data_size);
}

int MQTT_Reset(void){
    int nRetry = 3;
    printf("MQTT Try To Reconnect...\r\n");
    global_t* global = global_get();
    global->network_state = GLOBAL_NETWORK_STATE_IDLE;

    /*启动4G模块*/
    A7670C_Result A7670c_result;

    do{
        A7670c_result = A7670C_Startup();
        os_thread_mdelay(1000);
    }while(A7670c_result!=kA7670C_Result_OK);


    global->network_state = GLOBAL_NETWORK_STATE_INITIALIZED;

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
            return 0;
        }
        os_thread_mdelay(1000);
    }

    global->network_state = GLOBAL_NETWORK_STATE_MQTT_INITIALIZED;

    nRetry = 3;
    result = A7670C_MQTT_SubscribeOneTopic(&session, global->mqtt.Topic_Downstream
                                           , kA7670C_Qos_0, kA7670C_Bool_No);
    while(result!=kA7670C_Result_OK){
        printf("MQTT Sub Downstream Topic Result: %d\n", result);
        if(nRetry-- ==0){
            Board_Reboot();
            return 0;
        }
        os_thread_mdelay(1000);
    }

    global->network_state = GLOBAL_NETWORK_STATE_MQTT_DOWNSTREAM_TOPIC_SUBSCRIBED;

    return 0;
}
