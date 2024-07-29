#include <string.h>
#include "global.h"
#include <board.h>
#include <spi_flash.h>
#include <sdk_ultoa.h>
#include <A7670C.h>
#include <stdio.h>
#include <sdk_hex.h>
#include <float.h>
////////////////////////////////////////////////////////////////////////////////
////


/* 前4个扇区(0 - 3)用于保存 global_save_t, 地址范围: [0x00000000 - 0x00003FFF] */
#define W25Q_FLASH_BASE 0x00000000
#define GLOBAL_SAVE_ADDRESS_START   W25Q_FLASH_BASE
#define GLOBAL_SAVE_ADDRESS_END     W25Q_FLASH_BASE + (1024*4*4)

#define PAGE(T, N) (((T) + (N) -1)/(N))
#define A7670C_DELAY_TIME 0x3ffff

#define GLOBAL_STATE_IDLE 0
#define GLOBAL_STATE_INIT 1
////////////////////////////////////////////////////////////////////////////////
////
typedef struct global_save_s{
    uint32_t version;
    bool network_disable;
    global_voltage_calibration_t voltage_calibrations[4];
    global_current_calibration_t current_calibrations[4];
}global_save_t;

#define GLOBAL_SAVE_SIZE sizeof(global_save_t)

////////////////////////////////////////////////////////////////////////////////
////
static   global_t global__instance;
static int global__state=GLOBAL_STATE_IDLE;
////////////////////////////////////////////////////////////////////////////////
////
static A7670C_Result global__fetch_IMEI_ICCID(void){
    int nRetry = 0;
    A7670C_Result result;
    A7670C_ICCID_Read_Response ICCID_Read_Response;
    A7670C_SIMEI_Read_Response SIMEI_Read_Response;

    while(1){
        result = A7670C_SIMEI_Read(&SIMEI_Read_Response, 12000);
        if(SIMEI_Read_Response.code == kA7670C_Response_Code_OK){
            os_printf("IMEI: %s\n", SIMEI_Read_Response.value);
            memcpy(global__instance.IMEI, SIMEI_Read_Response.value, sizeof(SIMEI_Read_Response.value));
            break;
        }
        if(nRetry++==5){
            return kA7670C_Result_TIMEOUT;
        }
        A7670C_NopDelay(A7670C_DELAY_TIME);
    }

    nRetry = 0;
    while(1){
        result = A7670C_ICCID_Read(&ICCID_Read_Response, 12000);

        if(ICCID_Read_Response.code == kA7670C_Response_Code_OK){
//            os_printf("CCID: %s\n", ICCID_Read_Response.ICCID);
//            sdk_hex_dump("ICCID", ICCID_Read_Response.ICCID, sizeof(ICCID_Read_Response.ICCID));
            memcpy(global__instance.ICCID, ICCID_Read_Response.ICCID, sizeof(ICCID_Read_Response.ICCID));
            break;
        }
        if(nRetry++==5){
            return kA7670C_Result_TIMEOUT;
        }
        A7670C_NopDelay(A7670C_DELAY_TIME);
    }

    return kA7670C_Result_OK;
}

static void global_set_str(char* dst, char* s){
    memcpy(dst, s, strlen(s));
}

////////////////////////////////////////////////////////////////////////////////
////
int global_load_net_info(void){
#if defined(ENABLE_4G)
    global__fetch_IMEI_ICCID();
#endif
    global_show();
    return 0;
}

int global_init(void){
    if(global__state==GLOBAL_STATE_IDLE){
        memset(&global__instance, 0, sizeof(global__instance));
        #if defined(ENABLE_SPI_FLASH)
        global_read();
        #endif

        if(global__instance.version!=GLOBAL_VERSION){
            global__instance.version = GLOBAL_VERSION;
            global__instance.network_disable = false;

            /* 电压分段校准 10V ~ 50V*/
            global__instance.voltage_calibrations[0].enabled=true;
            global__instance.voltage_calibrations[0].rd_voltage_min=100000;
            global__instance.voltage_calibrations[0].rd_voltage_max=500000;
            global__instance.voltage_calibrations[0].std_voltage_min=99999;
            global__instance.voltage_calibrations[0].voltage_ratio=0.999910475f;

            /* 电压分段校准 50V ~ 100V*/
            global__instance.voltage_calibrations[1].enabled=true;
            global__instance.voltage_calibrations[1].rd_voltage_min=500000;
            global__instance.voltage_calibrations[1].rd_voltage_max=1000000;
            global__instance.voltage_calibrations[1].std_voltage_min=499964;
            global__instance.voltage_calibrations[1].voltage_ratio=0.999967820f;

            /* 电压分段校准 100V ~ 200V*/
            global__instance.voltage_calibrations[2].enabled=true;
            global__instance.voltage_calibrations[2].rd_voltage_min=1000000;
            global__instance.voltage_calibrations[2].rd_voltage_max=2000000;
            global__instance.voltage_calibrations[2].std_voltage_min=999948;
            global__instance.voltage_calibrations[2].voltage_ratio=1.000142100f;

            /* 电压分段校准 200V ~ 1100V*/
            global__instance.voltage_calibrations[3].enabled=true;
            global__instance.voltage_calibrations[3].rd_voltage_min=2000000;
            global__instance.voltage_calibrations[3].rd_voltage_max=10999999;
            global__instance.voltage_calibrations[3].std_voltage_min=2000090;
            global__instance.voltage_calibrations[3].voltage_ratio=0.999887293f;


            for(int i=0; i<4; i++){
                global__instance.current_calibrations[i].enabled=false;
                global__instance.current_calibrations[i].rd_current_max=-1;
                global__instance.current_calibrations[i].std_current_min=-1;
                global__instance.current_calibrations[i].rd_current_min=-1;
                global__instance.current_calibrations[i].current_ratio=1.0f;
            }

            /* 电流分段校准 5 ~ 50 A */
            global__instance.current_calibrations[0].enabled=true;
            global__instance.current_calibrations[0].rd_current_min=5000;
            global__instance.current_calibrations[0].rd_current_max=5100;
            global__instance.current_calibrations[0].std_current_min=4997;
            global__instance.current_calibrations[0].current_ratio=0.998320759f;

//            /* 电流分段校准 50 ~ 150 A, 效果不好*/
//            global__instance.current_calibrations[2].enabled=true;
//            global__instance.current_calibrations[2].rd_current_min=50000;
//            global__instance.current_calibrations[2].rd_current_max=151000;
//            global__instance.current_calibrations[2].std_current_min=50120;
//            global__instance.current_calibrations[2].current_ratio=0.999726435f;

            /* 电流分段校准 150 ~ 250 A */
            global__instance.current_calibrations[1].enabled=true;
            global__instance.current_calibrations[1].rd_current_min=150000;
            global__instance.current_calibrations[1].rd_current_max=251000;
            global__instance.current_calibrations[1].std_current_min=150252;
            global__instance.current_calibrations[1].current_ratio=0.998483987f;
        }

        global_set_str(global__instance.mqtt.ClientID, BSP_CPUID_Read());
        global_set_str(global__instance.mqtt.Server, GLOBAL_MQTT_SERVER);
        global_set_str(global__instance.mqtt.Username, GLOBAL_MQTT_USERNAME);
        global_set_str(global__instance.mqtt.Password, GLOBAL_MQTT_PASSWORD);

        char buf[256];

        snprintf(buf, sizeof(buf), "/DEVICES/%s/UPSTREAM", BSP_CPUID_Read());
        global_set_str(global__instance.mqtt.Topic_Upstream, buf);

        snprintf(buf, sizeof(buf), "/DEVICES/%s/DOWNSTREAM", BSP_CPUID_Read());
        global_set_str(global__instance.mqtt.Topic_Downstream, buf);

        global__instance.meter_state = GLOBAL_METER_STATE_IDLE;
        global__instance.network_state = GLOBAL_NETWORK_STATE_IDLE;
        
        global__state = GLOBAL_STATE_INIT;
    }

//    global_show();

    return 0;
}

void global_show(void){
    printf("MQTT:\n");
    printf("\tClientID:%s\n", global__instance.mqtt.ClientID);
    printf("\tServer:%s\n", global__instance.mqtt.Server);
    printf("\tUsername:%s\n", global__instance.mqtt.Username);
    printf("\tPassword:%s\n", global__instance.mqtt.Password);
    printf("\tUpstream:%s\n", global__instance.mqtt.Topic_Upstream);
    printf("\tDownstream:%s\n", global__instance.mqtt.Topic_Downstream);
    printf("HWINFO:\n");
    printf("\tIMEI:%s\n", global__instance.IMEI);
    printf("\tICCID:%s\n", global__instance.ICCID);
    printf("METER:\n");
    for(int i=0; i<4; i++){
        for(int j=0; j<i; j++){
            printf("\t");
        }
        printf("\tvoltage_calibrations.%d.enabled=%s\n", i, global__instance.voltage_calibrations[i].enabled?"true":"false");
        printf("\tvoltage_calibrations.%d.rf_voltage_max=%d\n", i, global__instance.voltage_calibrations[i].rd_voltage_max);
        printf("\tvoltage_calibrations.%d.std_voltage_min=%d\n", i, global__instance.voltage_calibrations[i].std_voltage_min);
        printf("\tvoltage_calibrations.%d.rd_voltage_min=%d\n", i, global__instance.voltage_calibrations[i].rd_voltage_min);
        printf("\tvoltage_calibrations.%d.voltage_ratio=%d\n", i, global__instance.voltage_calibrations[i].voltage_ratio);

    }
    for(int i=0; i<4; i++){
        for(int j=0; j<i; j++){
            printf("\t");
        }
        printf("\tcurrent_calibrations.%d.enabled=%s\n", i, global__instance.current_calibrations[i].enabled?"true":"false");
        printf("\tcurrent_calibrations.%d.rd_current_max=%d\n", i, global__instance.current_calibrations[i].rd_current_max);
        printf("\tcurrent_calibrations.%d.std_current_min=%d\n", i, global__instance.current_calibrations[i].std_current_min);
        printf("\tcurrent_calibrations.%d.rd_current_min=%d\n", i, global__instance.current_calibrations[i].rd_current_min);
        printf("\tcurrent_calibrations.%d.current_ratio=%d\n", i, global__instance.current_calibrations[i].current_ratio);

    }

    printf("NETWORK:\n");
    printf("\tnetwork_disable:%s\n", global__instance.network_disable?"true":"false");
}

global_t* global_get(void){
    return &global__instance;
}

int global_save(void){
    #if defined(ENABLE_SPI_FLASH)
    global_save_t save;
    memcpy(&save, &global__instance, sizeof(save));
    int sectors = PAGE(GLOBAL_SAVE_SIZE, sFLASH_SECTOR_SIZE);
    for(int i=0; i<sectors; i++){
        sFLASH_EraseSector(GLOBAL_SAVE_ADDRESS_START);
    }

    sFLASH_WriteBuffer((uint8_t*)&save, GLOBAL_SAVE_ADDRESS_START, GLOBAL_SAVE_SIZE);
    #endif
    return 0;
}

int global_read(void){
    #if defined(ENABLE_SPI_FLASH)
    global_save_t save;

    sFLASH_ReadBuffer((uint8_t*)&save, GLOBAL_SAVE_ADDRESS_START, GLOBAL_SAVE_SIZE);
    if(save.version!=GLOBAL_VERSION){
        // TODO: support read from old version
        return -1;
    }
    memcpy(&global__instance, &save, sizeof(save));
    #endif /*defined(ENABLE_SPI_FLASH)*/

    return 0;
}

int global_set_datetime(uint16_t year, uint8_t month, uint8_t date, uint8_t hour, uint8_t min, uint8_t sec)
{
    global__instance.datetime.year = year;
    global__instance.datetime.month = month;
    global__instance.datetime.date = date;
    global__instance.datetime.hour = hour;
    global__instance.datetime.min = min;
    global__instance.datetime.sec = sec;
    return 0;
}