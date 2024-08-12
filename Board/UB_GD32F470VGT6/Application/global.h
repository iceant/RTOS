#ifndef INCLUDED_GLOBAL_H
#define INCLUDED_GLOBAL_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

////////////////////////////////////////////////////////////////////////////////
////
#define GLOBAL_CALIBRATION_MAX_SIZE 16

#define GLOBAL_CALIBRATION_ENABLE           1
#define GLOBAL_CALIBRATION_CURRENT_ENABLE   0

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

#if defined(GLOBAL_CALIBRATION_ENABLE) && (GLOBAL_CALIBRATION_ENABLE==1)
typedef struct global_calibration_s{
    bool enabled;
    uint32_t std_base;          /* 标准最小值 */
    uint32_t rd_base;           /* 测量最小值 */
    uint32_t rd_min;            /* 测量分段最小值 */
    uint32_t rd_max;            /* 测量分段最大值 */
    double   ratio;             /* 斜率   =    (std_val - std_base)/(rd_val - rd_base) */
                                /* 标准值  =   (rd_val - rd_base) x ratio + std_base */
}global_calibration_t;
#endif

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

typedef struct global_version_s{
    uint32_t version;
}global_version_t;

typedef struct global_s{
    uint32_t version;
    bool network_disable;

#if defined(GLOBAL_CALIBRATION_ENABLE) && (GLOBAL_CALIBRATION_ENABLE==1)
    global_calibration_t voltage_calibrations[GLOBAL_CALIBRATION_MAX_SIZE];
#if defined(GLOBAL_CALIBRATION_CURRENT_ENABLE) && (GLOBAL_CALIBRATION_CURRENT_ENABLE==1)
    global_calibration_t current_calibrations[GLOBAL_CALIBRATION_MAX_SIZE];
#endif

#endif

    global_datetime_t datetime;
    glboal_mqtt_t mqtt;
    char IMEI[16];
    char ICCID[21];
    int meter_state;
    global_fatfs_t fatfs;
    int network_state;
}global_t;

////////////////////////////////////////////////////////////////////////////////
////

#define GLOBAL_VERSION 2024080801

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
