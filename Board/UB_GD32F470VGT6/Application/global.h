#ifndef INCLUDED_GLOBAL_H
#define INCLUDED_GLOBAL_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct global_datetime_s{
    uint16_t    year;
    uint8_t     month;
    uint8_t     date;
    uint8_t     hour;
    uint8_t     min;
    uint8_t     sec;
}global_datetime_t;

typedef struct global_meter_s{
    uint32_t std_voltage_min;   /*  标准电压最小值 */
    uint32_t rd_voltage_min;    /*  测量电压最小值 */
    double voltage_ratio;        /* 电压斜率    =   (标准电压最大值 - 标准电压最小值)/(测量电压最大值 - 测量电压最小值)
                                    标准电压值   =   (测量电压值 - 测量电压最小值) x 电压斜率 + 标准电压最小值
                                */
    uint32_t std_current_min;
    uint32_t rd_current_min;    /*  测量电流最小值 */
    double current_ratio;        /* 电流斜率    =   (标准电流最大值 - 标准电流最小值)/(测量电流最大值 - 测量电流最小值)
                                    标准电流值   =   (测量电流值 - 测量电流最小值) x 电流斜率 + 标准电流最小值
                                */
}global_meter_t;

typedef struct global_fatfs_s{
    int state;
}global_fatfs_t;

typedef struct glboal_mqtt_s{
    char Topic_Upstream[256];
    char Topic_Downstream[256];
    char ClientID[64];
    char Server[256];
    char Username[64];
    char Password[32];
}glboal_mqtt_t;

typedef struct global_s{
    global_datetime_t datetime;
    global_meter_t meter;
    glboal_mqtt_t mqtt;
    char IMEI[16];
    char ICCID[21];
    int meter_state;
    global_fatfs_t fatfs;
    int network_state;
}global_t;

////////////////////////////////////////////////////////////////////////////////
////
#define GLOBAL_SIZE sizeof(global_t)

#define GLOBAL_DEFAULT_THREAD_PRIORITY 20
#define GLOBAL_DEFAULT_THREAD_TTICKS   10

#define GLOBAL_MQTT_SERVER              "tcp://mqtt.ubattery.cn:11883"
#define GLOBAL_MQTT_USERNAME            "guest"
#define GLOBAL_MQTT_PASSWORD            "guest"

#define GLOBAL_METER_STATE_IDLE         1
#define GLOBAL_METER_STATE_START        2
#define GLOBAL_METER_STATE_CHARGING     3
#define GLOBAL_METER_STATE_ERROR        4

#define GLOBAL_FATFS_STATE_INIT_SUCCESS     (1)
#define GLOBAL_FATFS_STATE_MOUNT_SUCCESS    (2)

#define GLOBAL_FATFS_STATE_INIT_FAILED      (-1)
#define GLOBAL_FATFS_STATE_MOUNT_FAILED     (-2)

#define GLOBAL_NETWORK_STATE_IDLE                               0
#define GLOBAL_NETWORK_STATE_INITIALIZED                        1
#define GLOBAL_NETWORK_STATE_MQTT_INITIALIZED                   2
#define GLOBAL_NETWORK_STATE_MQTT_DOWNSTREAM_TOPIC_SUBSCRIBED   3


////////////////////////////////////////////////////////////////////////////////
////

int global_load_net_info(void);

int global_init(void);

void global_show(void);

global_t* global_get(void);

int global_save(void);

int global_read(void);

int global_set_datetime(uint16_t year, uint8_t month, uint8_t date, uint8_t hour, uint8_t min, uint8_t sec);

#endif /*INCLUDED_GLOBAL_H*/
