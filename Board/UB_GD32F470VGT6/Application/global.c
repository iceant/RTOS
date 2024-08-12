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
}global_save_t;

#define GLOBAL_SAVE_SIZE sizeof(global_save_t)

////////////////////////////////////////////////////////////////////////////////
////
static global_t global__instance __attribute__((section(".bss.RAM_Array")))={0};
//static global_t global__instance ={0};
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

#define VOLTAGE(v) (v*10000)
#define CURRENT(c) (c*1000)

int global_init(void){

    printf("global_t size:%d\n", sizeof(global_t));

    if(global__state==GLOBAL_STATE_IDLE){
        memset(&global__instance, 0, sizeof(global__instance));
        #if defined(ENABLE_SPI_FLASH)
        global_read();
        #endif

        if(global__instance.version!=GLOBAL_VERSION){
            global__instance.version = GLOBAL_VERSION;
            global__instance.network_disable = false;

#if defined(GLOBAL_CALIBRATION_ENABLE) && (GLOBAL_CALIBRATION_ENABLE==1)
            for(os_size_t i=0; i< OS_ARRAY_SIZE(global__instance.voltage_calibrations); i++){
                global__instance.voltage_calibrations[i].enabled=false;
                global__instance.voltage_calibrations[i].std_base=-1;
                global__instance.voltage_calibrations[i].rd_base=-1;
                global__instance.voltage_calibrations[i].rd_min=-1;
                global__instance.voltage_calibrations[i].rd_max=-1;
                global__instance.voltage_calibrations[i].ratio=1.0f;
            }

            /* 电压分段校准 0~10V*/
            int idx = 0;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(0);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(10);
            global__instance.voltage_calibrations[idx].ratio=1.01009899f;

            /* 电压分段校准 10 ~ 15V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(10);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(15);
            global__instance.voltage_calibrations[idx].ratio=1.006644295f;

            /* 电压分段校准 15 ~ 20V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(15);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(20);
            global__instance.voltage_calibrations[idx].ratio=1.004929648f;

            /* 电压分段校准 20 ~ 30V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(20);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(30);
            global__instance.voltage_calibrations[idx].ratio=1.003224114f;

            /* 电压分段校准 30 ~ 40V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(30);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(40);
            global__instance.voltage_calibrations[idx].ratio=1.002408546f;

            /* 电压分段校准 40 ~ 50V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(40);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(50);
            global__instance.voltage_calibrations[idx].ratio=1.001931844f;

            /* 电压分段校准 50 ~ 70V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(50);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(70);
            global__instance.voltage_calibrations[idx].ratio=1.001369099f;

            /* 电压分段校准 70 ~ 90V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(70);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(90);
            global__instance.voltage_calibrations[idx].ratio=1.001070089f;

            /* 电压分段校准 90 ~ 100V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(90);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(100);
            global__instance.voltage_calibrations[idx].ratio=1.000948849f;

            /* 电压分段校准 100 ~ 120V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(100);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(120);
            global__instance.voltage_calibrations[idx].ratio=1.000733945f;

            /* 电压分段校准 120 ~ 150V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(120);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(150);
            global__instance.voltage_calibrations[idx].ratio=1.000293529f;

            /* 电压分段校准 150 ~ 200V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(150);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(200);
            global__instance.voltage_calibrations[idx].ratio=1.000545273f;

            /* 电压分段校准 250 ~ 400V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(250);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(400);
            global__instance.voltage_calibrations[idx].ratio=1.000392452f;

            /* 电压分段校准 400 ~ 450V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(400);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(450);
            global__instance.voltage_calibrations[idx].ratio=0.999810047f;

            /* 电压分段校准 450 ~ 750V */
            idx = idx+1;
            global__instance.voltage_calibrations[idx].enabled=true;
            global__instance.voltage_calibrations[idx].rd_base=0;
            global__instance.voltage_calibrations[idx].std_base=0;
            global__instance.voltage_calibrations[idx].rd_min=VOLTAGE(450);
            global__instance.voltage_calibrations[idx].rd_max=VOLTAGE(750);
            global__instance.voltage_calibrations[idx].ratio=0.999892225f;

            /* --------------------------------------------------------------------------------------------------- */
#if defined(GLOBAL_CALIBRATION_CURRENT_ENABLE) && (GLOBAL_CALIBRATION_CURRENT_ENABLE==1)
            for(os_size_t i=0; i< OS_ARRAY_SIZE(global__instance.current_calibrations); i++){
                global__instance.current_calibrations[i].enabled=false;
                global__instance.current_calibrations[i].std_base=-1;
                global__instance.current_calibrations[i].rd_base=-1;
                global__instance.current_calibrations[i].rd_min=-1;
                global__instance.current_calibrations[i].rd_max=-1;
                global__instance.current_calibrations[i].ratio=1.0f;
            }

            /* 电流分段校准 7.5 ~ 30 A */
            idx = 0;
            global__instance.current_calibrations[idx].enabled=true;
            global__instance.current_calibrations[idx].rd_base=0;
            global__instance.current_calibrations[idx].std_base=0;
            global__instance.current_calibrations[idx].rd_min=CURRENT(7.5);
            global__instance.current_calibrations[idx].rd_max=CURRENT(30);
            global__instance.current_calibrations[idx].ratio=0.999083312f;

            /* 电流分段校准 50 ~ 70 A */
            idx+=1;
            global__instance.current_calibrations[idx].enabled=true;
            global__instance.current_calibrations[idx].rd_base=0;
            global__instance.current_calibrations[idx].std_base=0;
            global__instance.current_calibrations[idx].rd_min=CURRENT(50);
            global__instance.current_calibrations[idx].rd_max=CURRENT(70);
            global__instance.current_calibrations[idx].ratio=0.998414343f;

            /* 电流分段校准 70 ~ 75 A */
            idx+=1;
            global__instance.current_calibrations[idx].enabled=true;
            global__instance.current_calibrations[idx].rd_base=0;
            global__instance.current_calibrations[idx].std_base=0;
            global__instance.current_calibrations[idx].rd_min=CURRENT(70);
            global__instance.current_calibrations[idx].rd_max=CURRENT(75);
            global__instance.current_calibrations[idx].ratio=1.000504942f;

            /* 电流分段校准 75 ~ 200 A */
            idx+=1;
            global__instance.current_calibrations[idx].enabled=true;
            global__instance.current_calibrations[idx].rd_base=0;
            global__instance.current_calibrations[idx].std_base=0;
            global__instance.current_calibrations[idx].rd_min=CURRENT(75);
            global__instance.current_calibrations[idx].rd_max=CURRENT(200);
            global__instance.current_calibrations[idx].ratio=0.999770506f;

            /* 电流分段校准 200 ~ 250 A */
            idx+=1;
            global__instance.current_calibrations[idx].enabled=true;
            global__instance.current_calibrations[idx].rd_base=0;
            global__instance.current_calibrations[idx].std_base=0;
            global__instance.current_calibrations[idx].rd_min=CURRENT(200);
            global__instance.current_calibrations[idx].rd_max=CURRENT(250);
            global__instance.current_calibrations[idx].ratio=0.999350887f;
#endif

#endif
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

#if defined(GLOBAL_CALIBRATION_ENABLE) && (GLOBAL_CALIBRATION_ENABLE==1)
    printf("METER:\n");
//    for(os_size_t i=0; i< OS_ARRAY_SIZE(global__instance.voltage_calibrations); i++){
//        for(os_size_t j=0; j<2; j++){
//            printf("\t");
//        }
//        printf("\tvoltage_calibrations.%d.enabled=%s\n", i, global__instance.voltage_calibrations[i].enabled?"true":"false");
//        printf("\tvoltage_calibrations.%d.std_base=%d\n", i, global__instance.voltage_calibrations[i].std_base);
//        printf("\tvoltage_calibrations.%d.rd_base=%d\n", i, global__instance.voltage_calibrations[i].rd_base);
//        printf("\tvoltage_calibrations.%d.rd_min=%d\n", i, global__instance.voltage_calibrations[i].rd_min);
//        printf("\tvoltage_calibrations.%d.rd_max=%d\n", i, global__instance.voltage_calibrations[i].rd_max);
//        printf("\tvoltage_calibrations.%d.ratio=%f\n", i, global__instance.voltage_calibrations[i].ratio);
//
//    }
#if defined(GLOBAL_CALIBRATION_CURRENT_ENABLE) && (GLOBAL_CALIBRATION_CURRENT_ENABLE==1)
    for(os_size_t i=0; i< OS_ARRAY_SIZE(global__instance.current_calibrations); i++){
        for(os_size_t j=0; j<2; j++){
            printf("\t");
        }
        printf("\tcurrent_calibrations.%d.enabled=%s\n", i, global__instance.current_calibrations[i].enabled?"true":"false");
        printf("\tcurrent_calibrations.%d.std_base=%d\n", i, global__instance.current_calibrations[i].std_base);
        printf("\tcurrent_calibrations.%d.rd_base=%d\n", i, global__instance.current_calibrations[i].rd_base);
        printf("\tcurrent_calibrations.%d.rd_min=%d\n", i, global__instance.current_calibrations[i].rd_min);
        printf("\tcurrent_calibrations.%d.rd_max=%d\n", i, global__instance.current_calibrations[i].rd_max);
        printf("\tcurrent_calibrations.%d.ratio=%f\n", i, global__instance.current_calibrations[i].ratio);

    }
#endif

#endif

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