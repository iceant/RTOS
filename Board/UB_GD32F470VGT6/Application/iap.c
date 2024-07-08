#include "iap.h"
#include <board.h>
#include <fmc_operation.h>
#include <md5.h>
#include <spi_flash.h>
#include <string.h>
#include "sdk_hex.h"
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

static uint8_t iap__download_buffer[EXT_FLASH_PAGE_SIZE];

////////////////////////////////////////////////////////////////////////////////
////

static void delay_ms(uint32_t ms){
    for(uint32_t m=0; m<ms; m++){
        for(int i=0; i<1000; i++){
            for(int j=0; j<60; j++){
            }
        }
    }
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
    return IAP_RET_OK;
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


/*
    1. Boot 可以直接写 APP 区域的数据
    2. 先将 APP 区域的数据拷贝到备份区
    3.
 */
static int iap__upgrade_mcu0_boot(void){
    printf("[IAP] Upgrade MCU0_BOOT...\n");
    iap_firmware_info_t fw_info;
    int err = 0;
    MD5_CTX md5_ctx;
    uint8_t md5[16];
    int nRetry = 3;

    iap__firmware_info_read(IAP_FW_TYPE_MCU0_BOOT, &fw_info);

    if(fw_info.installed_version== fw_info.download_version){
        printf("[IAP] MCU0_BOOT download version == installed version! SKIP!!!\n");
        return IAP_RET_OK;
    }

    uint32_t flash_id = sFLASH_ReadID();
    if(!sFLASH_IsValidID(flash_id)){
        return IAP_RET_ERROR;
    }

    uint32_t mcu_flash_address = IAP_MCU0_BOOT_FLASH_ADDR;
    uint32_t ext_flash_address = IAP_FW_MCU0_BOOT_DOWNLOAD_AREA;

__iap__upgrade_mcu0_boot_program:
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
            goto __iap__upgrade_mcu0_boot_exit;
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
                goto __iap__upgrade_mcu0_boot_exit;
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
        goto __iap__upgrade_mcu0_boot_program;
    }

    /*升级成功*/
    fw_info.installed_version = fw_info.download_version;
    iap__firmware_info_write(&fw_info);
    printf("Upgraded Firmware Info Saved!\n");
    err = IAP_RET_OK;

__iap__upgrade_mcu0_boot_exit:
    fmc_lock();
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////




int iap_check_upgrade(void){
    int err = iap__upgrade_mcu0_boot();
    return err;
}

void iap_jump(uint32_t address)
{
    cpu_disable_irq();

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

    Board_DeInit();

    /* Jump to user application */
    iap_function_t JumpToApplication = (iap_function_t) CPU_REG(address + 4);
    /* Initialize user application's Stack Pointer */
    cpu_set_MSP(CPU_REG(address));

    delay_ms(200);

    JumpToApplication();
}