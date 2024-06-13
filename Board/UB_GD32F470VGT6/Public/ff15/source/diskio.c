/*-----------------------------------------------------------------------*/
/* Low level disk I/O module SKELETON for FatFs     (C)ChaN, 2019        */
/*-----------------------------------------------------------------------*/
/* If a working storage control module is available, it should be        */
/* attached to the FatFs via a glue function rather than modifying it.   */
/* This is an example of glue functions to attach various exsisting      */
/* storage control modules to the FatFs module with a defined API.       */
/*-----------------------------------------------------------------------*/

#include <os_printf.h>
#include "ff.h"			/* Obtains integer types */
#include "diskio.h"		/* Declarations of disk functions */
#include "sdcard.h"

/* Definitions of physical drive number for each drive */
#define DEV_MMC		0	/* Example: Map MMC/SD card to physical drive 0 */
#define DEV_RAM		1	/* Example: Map Ramdisk to physical drive 1 */
#define DEV_USB		2	/* Example: Map USB MSD to physical drive 2 */

#define SD_CARD_BLOCK_SIZE 1

extern sd_card_info_struct sd_cardinfo;

////////////////////////////////////////////////////////////////////////////////
////
static int RAM_disk_status(void){
    return 0;
}

static int MMC_disk_status(void){
    return 0;
}

static int USB_disk_status(void){
    return 0;
}
/*-----------------------------------------------------------------------*/
/* Get Drive Status                                                      */
/*-----------------------------------------------------------------------*/

DSTATUS disk_status (
	BYTE pdrv		/* Physical drive nmuber to identify the drive */
)
{
	DSTATUS stat = RES_OK;
	int result;

    printf("[DISK_IO] disk_status drive: %d\n", pdrv);

	switch (pdrv) {
	case DEV_RAM :
		result = RAM_disk_status();

		// translate the reslut code here

		return stat;

	case DEV_MMC :
		result = MMC_disk_status();

		// translate the reslut code here

		return stat;

	case DEV_USB :
		result = USB_disk_status();

		// translate the reslut code here

		return stat;
	}
	return STA_NOINIT;
}



/*-----------------------------------------------------------------------*/
/* Inidialize a Drive                                                    */
/*-----------------------------------------------------------------------*/
static int RAM_disk_initialize(void){
    return 0;
}

static int MMC_disk_initialize(void){
    return 0;
}

static int USB_disk_initialize(void){
    return 0;
}


DSTATUS disk_initialize (
	BYTE pdrv				/* Physical drive nmuber to identify the drive */
)
{
	DSTATUS stat=RES_OK;
	int result;

    printf("[DISK_IO] disk_initialize drive: %d\n", pdrv);

	switch (pdrv) {
	case DEV_RAM :
		result = RAM_disk_initialize();

		// translate the reslut code here

		return stat;

	case DEV_MMC :
		result = MMC_disk_initialize();
        stat &= ~STA_NOINIT;
		// translate the reslut code here

		return stat;

	case DEV_USB :
		result = USB_disk_initialize();

		// translate the reslut code here

		return stat;
	}
	return STA_NOINIT;
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

DRESULT disk_read (
	BYTE pdrv,		/* Physical drive nmuber to identify the drive */
	BYTE *buff,		/* Data buffer to store read data */
	LBA_t sector,	/* Start sector in LBA */
	UINT count		/* Number of sectors to read */
)
{
	DRESULT res = RES_OK;
	int result;
    sd_error_enum SD_stat = SD_OK;

    printf("[DISK_IO] disk_read drive: %d, sector:%d, block_size:%d count:%d\n", pdrv, sector
           , sd_cardinfo.card_blocksize
           , count);

	switch (pdrv) {
	case DEV_RAM :
		// translate the arguments here

//		result = RAM_disk_read(buff, sector, count);

		// translate the reslut code here

		return res;

	case DEV_MMC :
		// translate the arguments here

		if(count>1){
            SD_stat = sd_multiblocks_read((uint32_t*)buff, sector* sd_cardinfo.card_blocksize, sd_cardinfo.card_blocksize, count);
        }else{
            SD_stat = sd_block_read((uint32_t*)buff, sector * sd_cardinfo.card_blocksize, sd_cardinfo.card_blocksize);
        }

        if(SD_stat == SD_OK){
            res = RES_OK;
        }else{
            res = RES_ERROR;
        }

		// translate the reslut code here

		return res;

	case DEV_USB :
		// translate the arguments here

//		result = USB_disk_read(buff, sector, count);

		// translate the reslut code here

		return res;
	}

	return RES_PARERR;
}



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

#if FF_FS_READONLY == 0

DRESULT disk_write (
	BYTE pdrv,			/* Physical drive nmuber to identify the drive */
	const BYTE *buff,	/* Data to be written */
	LBA_t sector,		/* Start sector in LBA */
	UINT count			/* Number of sectors to write */
)
{
	DRESULT res;
	int result;
    sd_error_enum SD_stat = SD_OK;

    printf("[DISK_IO] disk_write drive: %d, sector:%d, block_size:%d count:%d\n", pdrv, sector
            , sd_cardinfo.card_blocksize
            , count);

	switch (pdrv) {
	case DEV_RAM :
		// translate the arguments here

//		result = RAM_disk_write(buff, sector, count);

		// translate the reslut code here

		return res;

	case DEV_MMC :
		// translate the arguments here

//		result = MMC_disk_write(buff, sector, count);

		// translate the reslut code here

        if(count > 1) {
            SD_stat = sd_multiblocks_write((uint32_t *)buff, sector * sd_cardinfo.card_blocksize,sd_cardinfo.card_blocksize, count);
        } else {
            SD_stat = sd_block_write((uint32_t *)buff, sector * sd_cardinfo.card_blocksize,sd_cardinfo.card_blocksize);
        }

        if(SD_stat == SD_OK) {
            res = RES_OK ;
        } else {
            res = RES_ERROR ;
        }

		return res;

	case DEV_USB :
		// translate the arguments here

//		result = USB_disk_write(buff, sector, count);

		// translate the reslut code here

		return res;
	}

	return RES_PARERR;
}

#endif


/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

DRESULT disk_ioctl (
	BYTE pdrv,		/* Physical drive nmuber (0..) */
	BYTE cmd,		/* Control code */
	void *buff		/* Buffer to send/receive control data */
)
{
	DRESULT res;
	int result;

    printf("[DISK_IO] disk_ioctl drive: %d, CMD:%d\n", pdrv, cmd);

	switch (pdrv) {
	case DEV_RAM :

		// Process of the command for the RAM drive

		return res;

	case DEV_MMC :

		// Process of the command for the MMC/SD card
        switch(cmd) {
            /*return sector number*/
            case GET_SECTOR_COUNT:
                *(DWORD *)buff = sd_cardinfo.card_capacity / (sd_cardinfo.card_blocksize);
                break;
                /*return each sector size*/
            case GET_SECTOR_SIZE:
                *(WORD *)buff = sd_cardinfo.card_blocksize;
                break;
                /*Returns the smallest unit of erased sector (unit 1)*/
            case GET_BLOCK_SIZE:
                *(DWORD *)buff = SD_CARD_BLOCK_SIZE;
                break;
        }
        res = RES_OK;
        return res;

	case DEV_USB :

		// Process of the command the USB drive

		return res;
	}

	return RES_PARERR;
}

DWORD get_fattime(void)
{
    return 0;
}

