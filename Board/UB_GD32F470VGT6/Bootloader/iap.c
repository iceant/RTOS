#include <iap.h>
#include <fmc_operation.h>
#include <spi_flash.h>
#include <cJSON.h>
#include <http.h>
#include <stdio.h>
#include <bsp_cpuid.h>
#include <string.h>
#include <sdk_hex.h>
#include <md5.h>
#include <board.h>
#include <mcu_session.h>
#include <sdk_fsm.h>
////////////////////////////////////////////////////////////////////////////////
////

#define PAGE(T, SZ) (((T)+(SZ)-1)/(SZ))

#define MCU_FLASH_PAGE_SIZE        (2*1024)    /* 2KB */
#define EXT_FLASH_PAGE_SIZE        (4*1024)    /* 4KB */


#define IAP_UPGRADE_FLAG_NONE            0
#define IAP_UPGRADE_FLAG_MCU0_BOOT       1
#define IAP_UPGRADE_FLAG_MCU0_APP        2
#define IAP_UPGRADE_FLAG_MCU1_BOOT       4
#define IAP_UPGRADE_FLAG_MCU1_APP        8

////////////////////////////////////////////////////////////////////////////////
////
static char iap__buffer[256];
static uint8_t iap__download_buffer[EXT_FLASH_PAGE_SIZE];
static uint8_t iap__download_verify_buffer[EXT_FLASH_PAGE_SIZE];

static void delay_ms(uint32_t ms){
    for(uint32_t m=0; m<ms; m++){
        for(int i=0; i<1000; i++){
            for(int j=0; j<60; j++){
            }
        }
    }
}

static const char* iap__fw_info_url(void){
    memset(iap__buffer, 0, sizeof(iap__buffer));
    snprintf(iap__buffer, sizeof(iap__buffer), "http://ubattery.cn:19093/Devices/%s/upgrade.json", BSP_CPUID_Read());
    return iap__buffer;
}

static int iap__firmware_info_read(int type, iap_firmware_info_t* info)
{
    uint32_t flashId = sFLASH_ReadID();
    if(!sFLASH_IsValidID(flashId)){
        return IAP_RET_SPI_FLASH_NOT_READY;
    }

    switch (type) {
        case IAP_FW_TYPE_MCU0_BOOT:{
            sFLASH_ReadBuffer((uint8_t*) info, IAP_FW_MCU0_BOOT_INFO_ADDR, sizeof(*info));
            break;
        }
        case IAP_FW_TYPE_MCU0_APP:{
            sFLASH_ReadBuffer((uint8_t*) info, IAP_FW_MCU0_APP_INFO_ADDR, sizeof(*info));
            break;
        }
        case IAP_FW_TYPE_MCU1_BOOT:{
            sFLASH_ReadBuffer((uint8_t*) info, IAP_FW_MCU1_BOOT_INFO_ADDR, sizeof(*info));
            break;
        }
        case IAP_FW_TYPE_MCU1_APP:{
            sFLASH_ReadBuffer((uint8_t*) info, IAP_FW_MCU1_APP_INFO_ADDR, sizeof(*info));
            break;
        }
        default:
            return IAP_RET_INVALID_FW_TYPE;
    }
    return 0;
}

static int iap__firmware_info_write(iap_firmware_info_t * info){

    uint32_t save_address = 0;

    uint32_t flashId = sFLASH_ReadID();
    if(!sFLASH_IsValidID(flashId)){
        return IAP_RET_SPI_FLASH_NOT_READY;
    }

    switch (info->type) {
        case IAP_FW_TYPE_MCU0_BOOT:{
            save_address = IAP_FW_MCU0_BOOT_INFO_ADDR;
            break;
        }
        case IAP_FW_TYPE_MCU0_APP:{
            save_address = IAP_FW_MCU0_APP_INFO_ADDR;
            break;
        }
        case IAP_FW_TYPE_MCU1_BOOT:{
            save_address = IAP_FW_MCU1_BOOT_INFO_ADDR;
            break;
        }
        case IAP_FW_TYPE_MCU1_APP:{
            save_address = IAP_FW_MCU1_APP_INFO_ADDR;
            break;
        }
        default:
            return IAP_RET_INVALID_FW_TYPE;
    }

    /*根据数据大小，准备 W25Q128 的扇区*/
    uint8_t sectors = PAGE(sizeof(*info), sFLASH_SECTOR_SIZE);
    for(uint8_t i=0; i<sectors; i++){
        sFLASH_EraseSector(save_address+i*sFLASH_SECTOR_SIZE);
    }
    sFLASH_WriteBuffer((uint8_t*)info, save_address, sizeof(*info));


    printf("[IAP] Saved Firmware Info:\n");
    printf("\tType: %d\n", info->type);
    printf("\tInstalled Version: %d\n", info->installed_version);
    printf("\tDownload Version: %d\n", info->download_version);
    printf("\tRemote Version: %d\n", info->remote_version);
    printf("\tFirmware Size: %d\n", info->size);
    printf("\tIs Downloaded?: %d\n", info->is_downloaded);

    return IAP_RET_OK;
}

static int iap__http_init(const char* url){
    Http_Init();
    int err = IAP_RET_OK;

    A7670C_HTTPPARA_Write_Response HTTPPARA_Write_Response;
    A7670C_Result result = A7670C_HTTPPARA_Write_URL(&HTTPPARA_Write_Response, url, 12000);
    if(kA7670C_Response_Code_OK!=HTTPPARA_Write_Response.code){
        err = IAP_RET_ERROR;
        goto __iap__http_init_exit;
    }

    result = A7670C_HTTPPARA_Write_READMODE(&HTTPPARA_Write_Response, 1, 12000);
    if(kA7670C_Response_Code_OK!=HTTPPARA_Write_Response.code){
        err = IAP_RET_ERROR;
        goto __iap__http_init_exit;
    }

    A7670C_HTTPACTION_Write_Response HTTPACTION_Write_Response;
    result = A7670C_HTTPACTION_Write(&HTTPACTION_Write_Response, kA7670C_HTTPACTION_Method_GET, 12000);
    if(kA7670C_Response_Code_OK!=HTTPACTION_Write_Response.code){
        err = IAP_RET_ERROR;
        goto __iap__http_init_exit;
    }

    if(HTTPACTION_Write_Response.status_code==404){
        printf("File Not Exist!\n");
        err = IAP_RET_ERROR;
        goto __iap__http_init_exit;
    }

    if(HTTPACTION_Write_Response.status_code==500){
        printf("Server ERROR!\n");
        err = IAP_RET_ERROR;
        goto __iap__http_init_exit;
    }

__iap__http_init_exit:
    if(err!=IAP_RET_OK){
        Http_Destroy();
    }
    return err;
}

static int iap__fw_download(int fw_type, const char* url, uint32_t fw_version, int fw_size, char* md5_string)
{
    iap_firmware_info_t fw_info;
    int err = iap__firmware_info_read(fw_type, &fw_info);
    if(err!=0){
        return err;
    }

    if(fw_info.download_version == fw_version){
        /* already downloaded */
        return IAP_RET_OK;
    }

    uint32_t ext_flash_save_address = 0;
    switch (fw_type) {
        case IAP_FW_TYPE_MCU0_BOOT:{
            ext_flash_save_address = IAP_FW_MCU0_BOOT_DOWNLOAD_AREA;
            break;
        }
        case IAP_FW_TYPE_MCU0_APP:{
            ext_flash_save_address = IAP_FW_MCU0_APP_DOWNLOAD_AREA;
            break;
        }
        case IAP_FW_TYPE_MCU1_BOOT:{
            ext_flash_save_address = IAP_FW_MCU1_BOOT_DOWNLOAD_AREA;
            break;
        }
        case IAP_FW_TYPE_MCU1_APP:{
            ext_flash_save_address = IAP_FW_MCU1_APP_DOWNLOAD_AREA;
            break;
        }
        default:
            return IAP_RET_INVALID_FW_TYPE;
    }

    MD5_CTX md5_ctx;
    uint8_t md5[16];
    int download_page_size = 1024;
    int total_read = 0;
    int read_size = 0;
    int buffer_size = sizeof(iap__download_buffer);
    memset(iap__download_buffer, 0, buffer_size);

    uint32_t flashId = sFLASH_ReadID();
    if(!sFLASH_IsValidID(flashId)){
        printf("[IAP] Invalid FLASH ID: %x\n", flashId);
        return IAP_RET_SPI_FLASH_NOT_READY;
    }

    __disable_irq();
    cpu_set_PRIMASK(1);
    /*根据数据大小，准备 W25Q128 的扇区*/
    uint8_t erase_sectors = PAGE(fw_size, sFLASH_SECTOR_SIZE);
    for(uint8_t i=0; i < erase_sectors; i++){
        uint32_t erase_address = ext_flash_save_address + i * sFLASH_SECTOR_SIZE;
        printf("[IAP] erase ext flash %p\n", erase_address);
        sFLASH_EraseSector(erase_address);
    }
    __enable_irq();
    cpu_set_PRIMASK(0);

__iap__fw_download_start:
    err = iap__http_init(url);
    if(err!=IAP_RET_OK){
        return IAP_RET_ERROR;
    }

    MD5Init(&md5_ctx);

    while(1){
        A7670C_HTTPREAD_Write_Response HTTPREAD_Write_Response;

        HTTPREAD_Write_Response.data = iap__download_buffer;
        HTTPREAD_Write_Response.data_len = 0;

        A7670C_Result result = A7670C_HTTPREAD_Write(&HTTPREAD_Write_Response, total_read, download_page_size, 12000);
        if(result==kA7670C_Result_TIMEOUT){
            Http_Destroy();
            goto __iap__fw_download_start;
        }
        if(kA7670C_Response_Code_OK!=HTTPREAD_Write_Response.code){
            err = IAP_RET_ERROR;
            goto __iap__fw_download_exit;
        }
        read_size = HTTPREAD_Write_Response.data_len;
        if(read_size==0){
//            printf("[IAP] download 0 bytes!!!\n");
//            total_read = 0;
//            MD5Init(&md5_ctx);
//            Http_Destroy();
//            iap__http_init(url);
//
//            for(uint8_t i=0; i < erase_sectors; i++){
//                uint32_t erase_address = ext_flash_save_address + i * sFLASH_SECTOR_SIZE;
//                sFLASH_EraseSector(erase_address);
//            }

            continue;
        }


        /*将数据写入 W25Q128, 并检查写入的内容是否正确 */
        sFLASH_WriteBuffer(iap__download_buffer, ext_flash_save_address+total_read, read_size);
        sFLASH_ReadBuffer(iap__download_verify_buffer, ext_flash_save_address+total_read, read_size);

        if(memcmp(iap__download_buffer, iap__download_verify_buffer, read_size)!=0){
            printf("[IAP] ERROR - write to W25Q128 addr:0x%08x, size=%d, failed!\n", ext_flash_save_address+total_read, read_size);
            err = IAP_RET_ERROR;
            goto __iap__fw_download_exit;
        }else{
            // 计算 MD5
            MD5Update(&md5_ctx, iap__download_verify_buffer, read_size);

            total_read += read_size;
            printf("[IAP] Download %d/%d %d\n", total_read, fw_size, read_size);
        }

        if(total_read==fw_size){
            break;
        }
    }

    MD5Final(md5, &md5_ctx);

    fw_info.remote_version = fw_version;
    fw_info.size = fw_size;
    SDK_HEX_DECODE(fw_info.md5, sizeof(fw_info.md5), md5_string, strlen(md5_string));

    if(memcmp(md5, fw_info.md5, sizeof(fw_info.md5))!=0){
        printf("[IAP] ERROR Wrong MD5 for URL: %s\n", url);
        char md5_str[33];
        SDK_HEX_ENCODE_BE(md5_str, sizeof(md5_str), fw_info.md5, sizeof(fw_info.md5));
        printf("Remote MD5: %s\n", md5_str);
        SDK_HEX_ENCODE_BE(md5_str, sizeof(md5_str), md5, sizeof(md5));
        printf("Downloaded MD5: %s\n", md5_str);
        err = IAP_RET_ERROR;
    }else{
        fw_info.type = fw_type;
        fw_info.download_version = fw_info.remote_version;
        fw_info.is_downloaded = 1;
        iap__firmware_info_write(&fw_info);
        printf("[IAP] SUCCESS - Download %s\n", url);
    }

    err = IAP_RET_OK;

__iap__fw_download_exit:
    Http_Destroy();
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

/*
    1. Boot 可以直接写 APP 区域的数据
    2. 先将 APP 区域的数据拷贝到备份区
    3.
 */
static int iap__upgrade_mcu0_app(void){
    printf("[IAP] Upgrade MCU0_APP...\n");
    iap_firmware_info_t fw_info;
    int err = 0;
    MD5_CTX md5_ctx;
    uint8_t md5[16];
    int nRetry = 3;

    iap__firmware_info_read(IAP_FW_TYPE_MCU0_APP, &fw_info);

    if(fw_info.installed_version== fw_info.download_version){
        printf("[IAP] MCU0_APP download version == installed version! SKIP!!!\n");
        return IAP_RET_OK;
    }

    uint32_t flash_id = sFLASH_ReadID();
    if(!sFLASH_IsValidID(flash_id)){
        return IAP_RET_ERROR;
    }

    uint32_t mcu_flash_address = IAP_MCU0_APP_FLASH_ADDR;
    uint32_t ext_flash_address = IAP_FW_MCU0_APP_DOWNLOAD_AREA;

__iap__upgrade_mcu0_app_program:
    if(nRetry--==0){
        return IAP_RET_ERROR;
    }


    /* 先擦除再写入 */
    size_t mcu_pages = PAGE(fw_info.size, MCU_FLASH_PAGE_SIZE);
    uint32_t used_sector_size = 0;


    __disable_irq();
    /* unlock the flash program erase controller */
    fmc_unlock();
    /* get the information of the start and end sectors */
    fmc_sector_info_struct start_sector_info = fmc_sector_info_get(mcu_flash_address);
    fmc_sector_info_struct end_sector_info = fmc_sector_info_get(mcu_flash_address + fw_info.size);
    /* erase sector */
    for(uint32_t i = start_sector_info.sector_name; i <= end_sector_info.sector_name; i++){
        uint32_t sector_num = sector_name_to_number(i);
        printf("[IAP] Erase MCU sector %d\n", i);
        /* clear pending flags */
        fmc_flag_clear(FMC_FLAG_END | FMC_FLAG_OPERR | FMC_FLAG_WPERR | FMC_FLAG_PGMERR | FMC_FLAG_PGSERR);

        if(FMC_READY != fmc_sector_erase(sector_num)){
            printf("[IAP] ERR erase sector %d failed!\n", i);
            err = IAP_RET_ERROR;
            goto __iap__upgrade_mcu0_app_exit;
        }
    }


    MD5Init(&md5_ctx);

    uint32_t read_size = 0;
    uint32_t total_read = 0;
    uint32_t write_address = mcu_flash_address;

    while(1){
        read_size = fw_info.size - total_read;
        read_size = (read_size < MCU_FLASH_PAGE_SIZE)?read_size:MCU_FLASH_PAGE_SIZE;
        sFLASH_ReadBuffer(iap__download_buffer, ext_flash_address+total_read, read_size);

        MD5Update(&md5_ctx, iap__download_buffer, read_size);

        printf("[IAP] %d/%d bytes, Read from 0x%08x - %d bytes from W25Q128\r\n"
                , total_read
                , fw_info.size
                , ext_flash_address+total_read
                , read_size);

        uint32_t* word_addr = (uint32_t*)iap__download_buffer;
        int word_page = PAGE(read_size, 4);

        for(int x=0; x< word_page; x++){
            fmc_flag_clear(FMC_FLAG_END | FMC_FLAG_OPERR | FMC_FLAG_WPERR | FMC_FLAG_PGMERR | FMC_FLAG_PGSERR);
            if (FMC_READY != fmc_word_program(write_address, word_addr[x])) //write
            {
                printf("[IAP] Write MCU Flash Addr %08x Failed!\r\n", write_address);
                err = IAP_RET_ERROR;
                goto __iap__upgrade_mcu0_app_exit;
            }
            write_address+=4;
        }

        total_read += read_size;

        if(total_read==fw_info.size){
            break;
        }
    }

    MD5Final(md5, &md5_ctx);

    if(memcmp(md5, fw_info.md5, 16)!=0){
        printf("[IAP] ERROR Wrong MD5:\n");
        char md5_str[33];
        SDK_HEX_ENCODE_BE(md5_str, sizeof(md5_str), fw_info.md5, sizeof(fw_info.md5));
        printf("Remote MD5: %s\n", md5_str);
        SDK_HEX_ENCODE_BE(md5_str, sizeof(md5_str), md5, sizeof(md5));
        printf("Check MD5: %s\n", md5_str);
        err = IAP_RET_ERROR;
        goto __iap__upgrade_mcu0_app_program;
    }

    /*升级成功*/
    fw_info.installed_version = fw_info.download_version;
    iap__firmware_info_write(&fw_info);
    printf("Upgraded Firmware Info Saved!\n");
    err = IAP_RET_OK;

__iap__upgrade_mcu0_app_exit:
    fmc_lock();
    __enable_irq();
    return err;
}


static int iap__upgrade_mcu0_boot(void){
    iap_jump(IAP_MCU0_APP_FLASH_ADDR);
    return 0;
}

////////////////////////////////////////////////////////////////////////////////
////



static void iap__upgrade_crc_error(mcu_session_t * session, void* userdata){
    printf("[IAP] CRC ERROR!!!\n");
    mcu_session_notify(session);
    session->state = IAP_STATE_CRC_ERROR;
}

////////////////////////////////////////////////////////////////////////////////
////

#define IAP_MCU1_STATE_IDLE                     0
#define IAP_MCU1_STATE_SEND_UPG_DATA            1
#define IAP_MCU1_STATE_UPG_DONE                 2



static int iap__upgrade_mcu1_app_rx_handler(mcu_session_t* session, uint8_t* data, int data_size, void* userdata){
    int type = MCU_BUFFER_DU_TYPE_GET(data);
    int idx = 0;
    uint16_t page_size = 2048;

    switch (type) {
        case kMCU_PROTOCOL_DU_UPG_READY: {

            /* MCU1 已经准备好接受升级了，发送数据 */
            uint8_t * buffer = MCU_BUFFER_DU_GET(data);
            uint8_t fw_type = SDK_HEX_GET_UINT8(buffer, idx); idx+=1;
            uint32_t fw_size = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
            uint32_t fw_version = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
            uint32_t ext_flash_address = 0;

            if(fw_type==IAP_FW_TYPE_MCU1_APP){
                printf("[IAP] receive UPG_READY MCU1_APP\n");
                 ext_flash_address = IAP_FW_MCU1_APP_DOWNLOAD_AREA;
            }else if(fw_type==IAP_FW_TYPE_MCU1_BOOT){
                printf("[IAP] receive UPG_READY MCU1_BOOT\n");
                ext_flash_address = IAP_FW_MCU1_BOOT_DOWNLOAD_AREA;
            }

            int total_page = PAGE(fw_size, page_size);
            int this_pkg = 1; /* 开始发送第一个包 */
            uint16_t this_pkg_size = (fw_size>page_size)?page_size:fw_size;
            idx = 0;
            uint8_t * send_buffer = MCU_SESSION_DU_GET(session);
            SDK_HEX_SET_UINT8(send_buffer, idx, fw_type); idx+=1;
            SDK_HEX_SET_UINT32_BE(send_buffer, idx, fw_size); idx+=4;
            SDK_HEX_SET_UINT32_BE(send_buffer, idx, fw_version); idx+=4;
            SDK_HEX_SET_UINT32_BE(send_buffer, idx, total_page); idx+=4;
            SDK_HEX_SET_UINT32_BE(send_buffer, idx, this_pkg); idx+=4;
            SDK_HEX_SET_UINT16_BE(send_buffer, idx, page_size); idx+=2;
            SDK_HEX_SET_UINT16_BE(send_buffer, idx, this_pkg_size); idx+=2;
            sFLASH_ReadBuffer(send_buffer+idx, ext_flash_address, this_pkg_size); idx+=this_pkg_size;

            printf("[IAP] SEND_UPG_DATA %d/%d\n", this_pkg, total_page);

            mcu_session_pack(session, kMCU_PROTOCOL_DU_SEND_UPG_DATA, 0, idx);
            mcu_session_send(session, iap__upgrade_crc_error, 0);

            session->state = IAP_MCU1_STATE_SEND_UPG_DATA;
            mcu_session_notify(session);
            break;
        }
        case kMCU_PROTOCOL_DU_UPG_DATA_RECV:{
            /* MCU1 接收到数据，返回结果 */
            idx = 0;
            uint8_t * buffer = MCU_BUFFER_DU_GET(data);
            uint8_t fw_type = SDK_HEX_GET_UINT8(buffer, idx); idx+=1;
            uint32_t fw_size = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
            uint32_t fw_version = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
            uint32_t total_pkg = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
            uint32_t this_pkg = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
            uint32_t received_bytes = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;

            uint32_t ext_flash_address = 0;

            if(fw_type==IAP_FW_TYPE_MCU1_APP){
                printf("[IAP] receive UPG_DATA_RECV MCU1_APP %d/%d\n", this_pkg, total_pkg);
                ext_flash_address = IAP_FW_MCU1_APP_DOWNLOAD_AREA;
            }else if(fw_type==IAP_FW_TYPE_MCU1_BOOT){
                printf("[IAP] receive UPG_DATA_RECV MCU1_BOOT %d/%d\n", this_pkg, total_pkg);
                ext_flash_address = IAP_FW_MCU1_BOOT_DOWNLOAD_AREA;
            }

            if(this_pkg < total_pkg){
                this_pkg = this_pkg + 1; /* 下一个包 */
                uint32_t remain_bytes = fw_size - received_bytes;
                uint16_t this_pkg_size = (remain_bytes>page_size)?page_size:remain_bytes;
                idx = 0;
                uint8_t * send_buffer = MCU_SESSION_DU_GET(session);
                SDK_HEX_SET_UINT8(send_buffer, idx, fw_type); idx+=1;
                SDK_HEX_SET_UINT32_BE(send_buffer, idx, fw_size); idx+=4;
                SDK_HEX_SET_UINT32_BE(send_buffer, idx, fw_version); idx+=4;
                SDK_HEX_SET_UINT32_BE(send_buffer, idx, total_pkg); idx+=4;
                SDK_HEX_SET_UINT32_BE(send_buffer, idx, this_pkg); idx+=4;
                SDK_HEX_SET_UINT16_BE(send_buffer, idx, page_size); idx+=2;
                SDK_HEX_SET_UINT16_BE(send_buffer, idx, this_pkg_size); idx+=2;
                sFLASH_ReadBuffer(send_buffer+idx, ext_flash_address + received_bytes, this_pkg_size); idx+=this_pkg_size;

                printf("[IAP] SEND_UPG_DATA %d/%d size=%d\n", this_pkg, total_pkg, this_pkg_size);

                mcu_session_pack(session, kMCU_PROTOCOL_DU_SEND_UPG_DATA, 0, idx);
                mcu_session_send(session, 0, 0);
                session->state = IAP_MCU1_STATE_SEND_UPG_DATA;
                mcu_session_notify(session);
            }else{

                iap_firmware_info_t fw_info;
                if(fw_type==IAP_FW_TYPE_MCU1_APP){
                    iap__firmware_info_read(IAP_FW_TYPE_MCU1_APP, &fw_info);
                    fw_info.installed_version = fw_info.download_version;
                    iap__firmware_info_write(&fw_info);
                }else if(fw_type==IAP_FW_TYPE_MCU1_BOOT){
                    iap__firmware_info_read(IAP_FW_TYPE_MCU1_BOOT, &fw_info);
                    fw_info.installed_version = fw_info.download_version;
                    iap__firmware_info_write(&fw_info);
                }

                session->state = IAP_MCU1_STATE_UPG_DONE;
                mcu_session_notify(session);
            }

            break;

        }
    }
    return 0;
}

static int iap__upgrade_mcu1_app(void){
    int state = IAP_MCU1_STATE_IDLE;
    mcu_session_t* session = mcu_session_get_default();
    iap_firmware_info_t fw_info;
    int nRetry = 3;
    iap__firmware_info_read(IAP_FW_TYPE_MCU1_APP, &fw_info);
    if(fw_info.download_version==fw_info.installed_version){
        return 0; /* 已经安装 */
    }

    printf("[IAP] Upgrade MCU1_APP...\n");

    mcu_session_set_rx_handler(session, iap__upgrade_mcu1_app_rx_handler, 0);

    while(1){
        switch (session->state) {
            case IAP_MCU1_STATE_IDLE:{
                /* 发送升级命令 UPGRADE */

                printf("[IAP] MCU1_APP Sending UPGRADE");

                int idx = 0;
                uint8_t * buffer = MCU_SESSION_DU_GET(session);
                SDK_HEX_SET_UINT8(buffer, idx, IAP_FW_TYPE_MCU1_APP); idx+=1;
                SDK_HEX_SET_UINT32_BE(buffer, idx, fw_info.size); idx+=4;
                SDK_HEX_SET_UINT32_BE(buffer, idx, fw_info.download_version); idx+=4;
                memcpy(buffer+idx, fw_info.md5, sizeof(fw_info.md5)); idx+=16;
                mcu_session_pack(session, kMCU_PROTOCOL_DU_UPGRADE, 0, idx);
                mcu_session_send(session, 0, 0);

                /* 等待 kMCU_PROTOCOL_DU_UPG_READY */
                int err = mcu_session_timed_wait(session, 10000);
                if(err==OS_ETIMEOUT){
                    nRetry--;
                    if(nRetry==0){
                        /* 升级失败了 */
                        return IAP_RET_ERROR;
                    }
                }

                break;
            }
            case IAP_MCU1_STATE_SEND_UPG_DATA:{
                printf("[IAP] state = IAP_MCU1_STATE_SEND_UPG_DATA\n");
                mcu_session_send(session, 0, 0);
                int err = mcu_session_timed_wait(session, 10000);
                printf("[IAP] state = IAP_MCU1_STATE_SEND_UPG_DATA, Code=%d\n", err);
                if(err==OS_ETIMEOUT){
                    nRetry--;
                    if(nRetry==0){
                        /* 升级失败了 */
                        return IAP_RET_ERROR;
                    }
                }

                break;
            }
            case IAP_MCU1_STATE_UPG_DONE:{
                return 0;
            }
        }
    }

    return 0;
}

////////////////////////////////////////////////////////////////////////////////
////


static int iap__upgrade_mcu1_boot(void){
    int state = IAP_MCU1_STATE_IDLE;
    mcu_session_t* session = mcu_session_get_default();
    iap_firmware_info_t fw_info;
    int nRetry = 3;
    iap__firmware_info_read(IAP_FW_TYPE_MCU1_BOOT, &fw_info);
    if(fw_info.download_version==fw_info.installed_version){
        return 0; /* 已经安装 */
    }

    mcu_session_set_rx_handler(session, iap__upgrade_mcu1_app_rx_handler, 0);

    while(1){
        switch (state) {
            case IAP_MCU1_STATE_IDLE:{
                /* 发送升级命令 UPGRADE */

                int idx = 0;
                uint8_t * buffer = MCU_SESSION_DU_GET(session);
                SDK_HEX_SET_UINT8(buffer, idx, IAP_FW_TYPE_MCU1_BOOT); idx+=1;
                SDK_HEX_SET_UINT32_BE(buffer, idx, fw_info.size); idx+=4;
                SDK_HEX_SET_UINT32_BE(buffer, idx, fw_info.download_version); idx+=4;
                memcpy(buffer+idx, fw_info.md5, sizeof(fw_info.md5)); idx+=16;
                mcu_session_pack(session, kMCU_PROTOCOL_DU_UPGRADE, 0, idx);
                mcu_session_send(session, 0, 0);

                /* 等待 kMCU_PROTOCOL_DU_UPG_READY */
                int err = mcu_session_timed_wait(session, 10000);
                if(err==OS_ETIMEOUT){
                    nRetry--;
                    if(nRetry==0){
                        /* 升级失败了 */
                        return IAP_RET_ERROR;
                    }
                }

                break;
            }
            case IAP_MCU1_STATE_SEND_UPG_DATA:{
                int err = mcu_session_timed_wait(session, 10000);
                if(err==OS_ETIMEOUT){
                    nRetry--;
                    if(nRetry==0){
                        /* 升级失败了 */
                        return IAP_RET_ERROR;
                    }
                }
                break;
            }
            case IAP_MCU1_STATE_UPG_DONE:{
                return 0;
            }
        }
    }

    return 0;
}
////////////////////////////////////////////////////////////////////////////////
////



int iap_check_upgrade(void)
{
    /* [step-1] 检查 http://ubattery.cn:19093/Devices/[CPUID]/upgrade.json 是否有升级信息 */

    cJSON* MCU0_APP_Node = NULL;
    cJSON* MCU0_BOOT_Node = NULL;
    cJSON* MCU1_APP_Node = NULL;
    cJSON* MCU1_BOOT_Node = NULL;

    cJSON* Version_Node = NULL;
    cJSON* Size_Node = NULL;
    cJSON* MD5_Node = NULL;
    cJSON* URL_Node = NULL;

    int err;
    int offset = 0;
    int page_size = 1024;
    size_t read_size = 0;
    size_t total_size = 0;
    int upgrade_flag = IAP_UPGRADE_FLAG_NONE;

    ////////////////////////////////////////////////////////////////////////////////
    // 1. 读取 upgrade.json 文件

    const char* upgrade_json_url = iap__fw_info_url();
    memset(iap__download_buffer, 0, sizeof(iap__download_buffer));

    Http_Init();

    while(1){
        err = Http_Get(upgrade_json_url, iap__download_buffer + offset, page_size, offset, &read_size, &total_size);
        if(err==HTTP_RET_404){
            printf("File Not Found!\n");
            err = IAP_RET_ERROR;
            break;
        }

        if(err!=HTTP_RET_OK){
            printf("[IAP] Http Get Failed! Code=%d\n", err);
            break;
        }

        printf("[IAP] Download offset=%d, read=%d, total=%d\n", offset, read_size, total_size);
        offset+=read_size;

        if(offset==total_size){
            err = IAP_RET_OK;
            break;
        }
    }

    Http_Destroy();

    if(err!=IAP_RET_OK){
        goto __end;
    }

    ////////////////////////////////////////////////////////////////////////////////
    // 2. 分析 JSON 文件找到需要升级的内容
    cJSON* json = cJSON_ParseWithLength((char*)iap__download_buffer, total_size);
    if(json==NULL){
        const char *error_ptr = cJSON_GetErrorPtr();
        if (error_ptr != NULL)
        {
            fprintf(stderr, "Error before: %s\n", error_ptr);
        }
        err = IAP_RET_INVALID_JSON;
        goto __end;
    }

    /* 下载所有的固件 */

    /* ---- MCU0_BOOT ---- */
    MCU0_BOOT_Node = cJSON_GetObjectItemCaseSensitive(json, "MCU0_BOOT");
    if(MCU0_BOOT_Node!=NULL){
        Version_Node = cJSON_GetObjectItemCaseSensitive(MCU0_BOOT_Node, "v");
        Size_Node = cJSON_GetObjectItemCaseSensitive(MCU0_BOOT_Node, "s");
        MD5_Node =  cJSON_GetObjectItemCaseSensitive(MCU0_BOOT_Node, "md5");
        URL_Node = cJSON_GetObjectItemCaseSensitive(MCU0_BOOT_Node, "url");

        printf("[IAP] MCU1_Boot_Node:\n");
        printf("\tVersion: %d\n", Version_Node->valueint);
        printf("\tSize: %d\n", Size_Node->valueint);
        printf("\tMD5: %s\n", MD5_Node->valuestring);
        printf("\tURL: %s\n", URL_Node->valuestring);
#if defined(ENABLE_OLED)
        OLED_ShowString(0, 4, "[UPG] Download MCU0_BOOT", 12);
#endif
        err = iap__fw_download(IAP_FW_TYPE_MCU0_BOOT, URL_Node->valuestring, Version_Node->valueint, Size_Node->valueint, MD5_Node->valuestring);
        if(err==0){
            upgrade_flag |= IAP_UPGRADE_FLAG_MCU0_BOOT;
        }
    }

    /* ---- MCU0_APP ---- */
    MCU0_APP_Node = cJSON_GetObjectItemCaseSensitive(json, "MCU0_APP");
    if(MCU0_APP_Node!=NULL){
        Version_Node = cJSON_GetObjectItemCaseSensitive(MCU0_APP_Node, "v");
        Size_Node = cJSON_GetObjectItemCaseSensitive(MCU0_APP_Node, "s");
        MD5_Node =  cJSON_GetObjectItemCaseSensitive(MCU0_APP_Node, "md5");
        URL_Node = cJSON_GetObjectItemCaseSensitive(MCU0_APP_Node, "url");

        printf("[IAP] MCU0_APP_Node:\n");
        printf("\tVersion: %d\n", Version_Node->valueint);
        printf("\tSize: %d\n", Size_Node->valueint);
        printf("\tMD5: %s\n", MD5_Node->valuestring);
        printf("\tURL: %s\n", URL_Node->valuestring);
#if defined(ENABLE_OLED)
        OLED_ShowString(0, 4, "[UPG] Download MCU0_APP", 12);
#endif
        err = iap__fw_download(IAP_FW_TYPE_MCU0_APP, URL_Node->valuestring, Version_Node->valueint, Size_Node->valueint, MD5_Node->valuestring);
        if(err==0){
            upgrade_flag |= IAP_UPGRADE_FLAG_MCU0_APP;
        }
    }

    /* ---- MCU1_BOOT ---- */
    MCU1_BOOT_Node = cJSON_GetObjectItemCaseSensitive(json, "MCU1_BOOT");
    if(MCU1_BOOT_Node!=NULL){
        Version_Node = cJSON_GetObjectItemCaseSensitive(MCU1_BOOT_Node, "v");
        Size_Node = cJSON_GetObjectItemCaseSensitive(MCU1_BOOT_Node, "s");
        MD5_Node =  cJSON_GetObjectItemCaseSensitive(MCU1_BOOT_Node, "md5");
        URL_Node = cJSON_GetObjectItemCaseSensitive(MCU1_BOOT_Node, "url");

        printf("[IAP] MCU1_Boot_Node:\n");
        printf("\tVersion: %d\n", Version_Node->valueint);
        printf("\tSize: %d\n", Size_Node->valueint);
        printf("\tMD5: %s\n", MD5_Node->valuestring);
        printf("\tURL: %s\n", URL_Node->valuestring);
#if defined(ENABLE_OLED)
        OLED_ShowString(0, 4, "[UPG] UPG MCU1_BOOT", 12);
#endif
        err = iap__fw_download(IAP_FW_TYPE_MCU1_BOOT, URL_Node->valuestring, Version_Node->valueint, Size_Node->valueint, MD5_Node->valuestring);
        if(err==0){
            upgrade_flag |= IAP_UPGRADE_FLAG_MCU1_BOOT;
        }
    }

    /* ---- MCU1_APP ---- */
    MCU1_APP_Node = cJSON_GetObjectItemCaseSensitive(json, "MCU1_APP");
    if(MCU1_APP_Node!=NULL){
        Version_Node = cJSON_GetObjectItemCaseSensitive(MCU1_APP_Node, "v");
        Size_Node = cJSON_GetObjectItemCaseSensitive(MCU1_APP_Node, "s");
        MD5_Node =  cJSON_GetObjectItemCaseSensitive(MCU1_APP_Node, "md5");
        URL_Node = cJSON_GetObjectItemCaseSensitive(MCU1_APP_Node, "url");

        printf("[IAP] MCU1_APP_Node:\n");
        printf("\tVersion: %d\n", Version_Node->valueint);
        printf("\tSize: %d\n", Size_Node->valueint);
        printf("\tMD5: %s\n", MD5_Node->valuestring);
        printf("\tURL: %s\n", URL_Node->valuestring);

#if defined(ENABLE_OLED)
        OLED_ShowString(0, 4, "[UPG] UPG MCU1_APP ", 12);
#endif

        err = iap__fw_download(IAP_FW_TYPE_MCU1_APP, URL_Node->valuestring, Version_Node->valueint, Size_Node->valueint, MD5_Node->valuestring);
        if(err==0){
            upgrade_flag |= IAP_UPGRADE_FLAG_MCU1_APP;
        }
    }

    if((upgrade_flag & IAP_UPGRADE_FLAG_MCU0_APP)==IAP_UPGRADE_FLAG_MCU0_APP){
#if defined(ENABLE_OLED)
        OLED_ShowString(0, 4, "[UPG] UPG MCU0_APP ", 12);
#endif
        err = iap__upgrade_mcu0_app();
    }

    if((upgrade_flag & IAP_UPGRADE_FLAG_MCU1_APP)==IAP_UPGRADE_FLAG_MCU1_APP){
#if defined(ENABLE_OLED)
        OLED_ShowString(0, 4, "[UPG] UPG MCU1_APP ", 12);
#endif
        err = iap__upgrade_mcu1_app();
    }

    if((upgrade_flag & IAP_UPGRADE_FLAG_MCU1_BOOT)==IAP_UPGRADE_FLAG_MCU1_BOOT){
#if defined(ENABLE_OLED)
        OLED_ShowString(0, 4, "[UPG] UPG MCU1_BOOT", 12);
#endif
//        err = iap__upgrade_mcu1_boot();
    }

    if((upgrade_flag & IAP_UPGRADE_FLAG_MCU0_BOOT)==IAP_UPGRADE_FLAG_MCU0_BOOT){
#if defined(ENABLE_OLED)
        OLED_ShowString(0, 4, "[UPG] UPG MCU0_BOOT", 12);
#endif
        err = iap__upgrade_mcu0_boot();
    }

__end:
    return err;
}

void iap_jump(uint32_t address)
{
    __disable_irq();

    /* Disable Systick timer */
    SysTick->CTRL = 0;
    SysTick->LOAD = 0;
    SysTick->VAL = 0;
    /* Clear Interrupt Enable Register & Interrupt Pending Register */
    for (uint16_t i = 0; i < sizeof(NVIC->ICER) / sizeof(NVIC->ICER[0]); i++)
    {
        NVIC->ICER[i] = 0xFFFFFFFF;
        NVIC->ICPR[i] = 0xFFFFFFFF;
    }

    /* Jump to user application */
    iap_function_t JumpToApplication = (iap_function_t) CPU_REG(address + 4);
    /* Initialize user application's Stack Pointer */
    cpu_set_MSP(CPU_REG(address));

    printf("Jump %p\n", address);
    delay_ms(200);
    Board_DeInit();

    JumpToApplication();
}
