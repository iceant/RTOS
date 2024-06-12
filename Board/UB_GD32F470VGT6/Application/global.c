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
    global_meter_t meter;
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
            os_printf("CCID: %s\n", ICCID_Read_Response.ICCID);
            sdk_hex_dump("ICCID", ICCID_Read_Response.ICCID, sizeof(ICCID_Read_Response.ICCID));
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


int global_init(void){
    if(global__state==GLOBAL_STATE_IDLE){
        memset(&global__instance, 0, sizeof(global__instance));
        #if defined(ENABLE_SPI_FLASH)
        global_read();
        #endif
        if(global__instance.meter.std_current_min==-1U || global__instance.meter.std_voltage_min==-1U){
            printf("[GLOBAL] No Saved Value!\n");
        }

#if defined(ENABLE_4G)
        global__fetch_IMEI_ICCID();
#endif

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
        
        global__state = GLOBAL_STATE_INIT;
    }

    global_show();

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
    printf("\tstd_voltage_min:%d\n", global__instance.meter.std_voltage_min);
    printf("\tstd_current_min:%d\n", global__instance.meter.std_current_min);
    printf("\trd_voltage_min:%d\n", global__instance.meter.rd_voltage_min);
    printf("\trd_current_min:%d\n", global__instance.meter.rd_current_min);
    printf("\tcurrent_ratio:%f\n", global__instance.meter.current_ratio);
    printf("\tvoltage_ratio:%f\n", global__instance.meter.voltage_ratio);
}

global_t* global_get(void){
    return &global__instance;
}

int global_save(void){
    #if defined(ENABLE_SPI_FLASH)
    global_save_t save;
    memcpy(&save.meter, &global__instance.meter, sizeof(save.meter));
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
    char buf[32];
    sFLASH_ReadBuffer((uint8_t*)&save, GLOBAL_SAVE_ADDRESS_START, GLOBAL_SAVE_SIZE);
    memcpy(&global__instance.meter, &save.meter, sizeof(global__instance.meter));
    printf("[GLOBAL] Read: meter:\n");
    printf("[GLOBAL] \t std_voltage_min: %d\n", save.meter.std_voltage_min);
    printf("[GLOBAL] \t rd_voltage_min: %d\n", save.meter.rd_voltage_min);
    printf("[GLOBAL] \t std_current_min: %d\n", save.meter.std_current_min);
    printf("[GLOBAL] \t rd_current_min: %d\n", save.meter.rd_current_min);
    sdk_ultoa(save.meter.voltage_ratio, buf, 10);
    printf("[GLOBAL] \t voltage_ratio: %s\n", buf);
    sdk_ultoa(save.meter.current_ratio, buf, 10);
    printf("[GLOBAL] \t current_ratio: %s\n", buf);
    #endif
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