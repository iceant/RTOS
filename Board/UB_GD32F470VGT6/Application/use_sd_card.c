#include <use_sd_card.h>
#include <os_kernel.h>
#include "ff.h"
#include <global.h>
#include <string.h>
////////////////////////////////////////////////////////////////////////////////
//// EXTERN


sd_card_info_struct sd_cardinfo;


////////////////////////////////////////////////////////////////////////////////
////

static FATFS fsObject;

////////////////////////////////////////////////////////////////////////////////
////
static void nvic_config(void)
{
    nvic_priority_group_set(NVIC_PRIGROUP_PRE1_SUB3);
    nvic_irq_enable(SDIO_IRQn, 0, 0);
}

static sd_error_enum sd_io_init(void)
{
    sd_error_enum status = SD_OK;
    uint32_t cardstate = 0;
    status = sd_init();
    if(SD_OK == status) {
        status = sd_card_information_get(&sd_cardinfo);
    }
    if(SD_OK == status) {
        status = sd_card_select_deselect(sd_cardinfo.card_rca);
    }
    status = sd_cardstatus_get(&cardstate);
    if(cardstate & 0x02000000) {
        printf("\r\n the card is locked!");
        while(1) {
        }
    }
    if((SD_OK == status) && (!(cardstate & 0x02000000))) {
        /* set bus mode */
        status = sd_bus_mode_config(SDIO_BUSMODE_4BIT);
//        status = sd_bus_mode_config(SDIO_BUSMODE_1BIT);
    }
    if(SD_OK == status) {
        /* set data transfer mode */
//        status = sd_transfer_mode_config(SD_DMA_MODE);
        status = sd_transfer_mode_config(SD_POLLING_MODE);
    }
    return status;
}

static void card_info_get(void)
{
    uint8_t sd_spec, sd_spec3, sd_spec4, sd_security;
    uint32_t block_count, block_size;
    uint16_t temp_ccc;
    printf("\r\n Card information:");
    sd_spec = (sd_scr[1] & 0x0F000000) >> 24;
    sd_spec3 = (sd_scr[1] & 0x00008000) >> 15;
    sd_spec4 = (sd_scr[1] & 0x00000400) >> 10;
    if(2 == sd_spec) {
        if(1 == sd_spec3) {
            if(1 == sd_spec4) {
                printf("\r\n## Card version 4.xx ##");
            } else {
                printf("\r\n## Card version 3.0x ##");
            }
        } else {
            printf("\r\n## Card version 2.00 ##");
        }
    } else if(1 == sd_spec) {
        printf("\r\n## Card version 1.10 ##");
    } else if(0 == sd_spec) {
        printf("\r\n## Card version 1.0x ##");
    }

    sd_security = (sd_scr[1] & 0x00700000) >> 20;
    if(2 == sd_security) {
        printf("\r\n## SDSC card ##");
    } else if(3 == sd_security) {
        printf("\r\n## SDHC card ##");
    } else if(4 == sd_security) {
        printf("\r\n## SDXC card ##");
    }

    block_count = (sd_cardinfo.card_csd.c_size + 1) * 1024;
    block_size = 512;
    printf("\r\n## Device size is %dKB ##", sd_card_capacity_get());
    printf("\r\n## Block size is %dB ##", block_size);
    printf("\r\n## Block count is %d ##", block_count);

    if(sd_cardinfo.card_csd.read_bl_partial) {
        printf("\r\n## Partial blocks for read allowed ##");
    }
    if(sd_cardinfo.card_csd.write_bl_partial) {
        printf("\r\n## Partial blocks for write allowed ##");
    }
    temp_ccc = sd_cardinfo.card_csd.ccc;
    printf("\r\n## CardCommandClasses is: %x ##", temp_ccc);
    if((SD_CCC_BLOCK_READ & temp_ccc) && (SD_CCC_BLOCK_WRITE & temp_ccc)) {
        printf("\r\n## Block operation supported ##");
    }
    if(SD_CCC_ERASE & temp_ccc) {
        printf("\r\n## Erase supported ##");
    }
    if(SD_CCC_WRITE_PROTECTION & temp_ccc) {
        printf("\r\n## Write protection supported ##");
    }
    if(SD_CCC_LOCK_CARD & temp_ccc) {
        printf("\r\n## Lock unlock supported ##");
    }
    if(SD_CCC_APPLICATION_SPECIFIC & temp_ccc) {
        printf("\r\n## Application specific supported ##");
    }
    if(SD_CCC_IO_MODE & temp_ccc) {
        printf("\r\n## I/O mode supported ##");
    }
    if(SD_CCC_SWITCH & temp_ccc) {
        printf("\r\n## Switch function supported ##");
    }
}

#if defined(ENABLE_FATFS_TEST)

static char rbuffer[512]={0};
static FIL USE_SD_CARD__file;
static void USE_SD_CARD_FATFS_Test(void){
    FRESULT res;
    char* wbuffer = "Hello, FatFs!";

    int br_size=0;
    int bw_size=0;

    /*create a file enabile write and read*/
    printf("[USE_SDCARD] f_open 0:text.txt\n");
    res = f_open(&USE_SD_CARD__file, "0:test.txt", FA_OPEN_ALWAYS | FA_WRITE | FA_READ);
    printf(0, "[USE_SDCARD] f_open res = %d \r\n", res);
    if(res == FR_OK) {
        /*write data into a file*/
        res = f_write(&USE_SD_CARD__file, wbuffer, strlen(wbuffer), &bw_size);
        printf(0, "\r\n wbuffer = %s bw_size = %d\r\n", wbuffer, bw_size);
        if(res == FR_OK) {
            f_lseek(&USE_SD_CARD__file, 0);
            /*read data from a file*/
            res = f_read(&USE_SD_CARD__file, rbuffer, f_size(&USE_SD_CARD__file), &br_size);
            if(res == FR_OK) {
                printf(0, "\r\n file content = %s br_size = %d\r\n", rbuffer, br_size);
            }
        }
        f_close(&USE_SD_CARD__file);
#if 0
        res = f_unlink("0:test.txt");
        if(res == FR_OK) {
            printf(0, "\r\n file :abc.txt is deleted \r\n");
        }
#endif

    }
}
#endif


////////////////////////////////////////////////////////////////////////////////
////

void USE_SD_CARD_Init(void){
    sd_error_enum sd_error;
    uint16_t i = 5;
    FRESULT res;

    nvic_config();

    /* initialize the card */
    do {
        sd_error = sd_io_init();
    } while((SD_OK != sd_error) && (--i));

    if(i) {
        printf("\r\n Card init success!\r\n");

        global_get()->fatfs.state = GLOBAL_FATFS_STATE_INIT_SUCCESS;

#if defined(ENABLE_SDCARD_INFO)
        /* get the information of the card and print it out by USART */
        card_info_get();
#endif

#if defined(ENABLE_FAT_FILE_SYSTEM)
        /* registers/unregisters file system object to the FatFs module*/
        res = f_mount(&fsObject, "0:", 1/* Mount option: 0=Do not mount (delayed mount), 1=Mount immediately */);
        printf("[USE_SDCARD] Mount Result: %d\n", res);

        if(res == FR_NO_FILESYSTEM) {
            /*creates an FAT volume on SD card(format)*/
            res = f_mkfs("0:", 0, 0, 512);
            printf(0, "\r\n f_mkfs res = %d \r\n", res);
            /*unmount file system*/
            res = f_mount(NULL, "0:", 1);
            /*mount file system*/
            res = f_mount(&fsObject, "0:", 1);
            printf(0, "\r\n f_mkfs 2 res = %d \r\n", res);
        }

        if(res==FR_OK){
            global_get()->fatfs.state = GLOBAL_FATFS_STATE_MOUNT_SUCCESS;
            printf("[USE_SDCARD] FatFs Mount Success!!!\n");

#if defined(ENABLE_FATFS_TEST)
            USE_SD_CARD_FATFS_Test();
#endif

        }else{
            global_get()->fatfs.state = GLOBAL_FATFS_STATE_MOUNT_FAILED;
            printf("[USE_SDCARD] FatFs Mount Failed!!!\n");
        }
#endif

    } else {
        global_get()->fatfs.state = GLOBAL_FATFS_STATE_INIT_FAILED;
        printf("\r\n Card init failed!\r\n");
    }

}

