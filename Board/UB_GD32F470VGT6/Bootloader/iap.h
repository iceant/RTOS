#ifndef INCLUDED_IAP_H
#define INCLUDED_IAP_H

/* -------------------------------------------------------------------------------------------------------------- */
/* IAP 升级管理模块 */
/* -------------------------------------------------------------------------------------------------------------- */

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

////////////////////////////////////////////////////////////////////////////////
////

typedef struct iap_firmware_info_s{
    uint8_t     type;
    uint32_t    remote_version;
    uint32_t    download_version;
    uint32_t    installed_version;
    uint8_t     md5[16];
    uint8_t     state;
    uint32_t    size;
    int8_t      is_downloaded;
}iap_firmware_info_t;

#define IAP_FW_HEADER_SIZE sizeof(iap_firmware_info_t)

////////////////////////////////////////////////////////////////////////////////
////
#define IAP_FW_TYPE_MCU0_BOOT   0x01
#define IAP_FW_TYPE_MCU0_APP    0x02
#define IAP_FW_TYPE_MCU1_BOOT   0x03
#define IAP_FW_TYPE_MCU1_APP    0x04

////////////////////////////////////////////////////////////////////////////////
////

#define IAP_FW_MCU0_BOOT_INFO_ADDR      0x00100000
#define IAP_FW_MCU0_APP_INFO_ADDR       0x00133000
#define IAP_FW_MCU1_BOOT_INFO_ADDR      0x002C4000
#define IAP_FW_MCU1_APP_INFO_ADDR       0x002F7000

////////////////////////////////////////////////////////////////////////////////
////

#define IAP_FW_MCU0_BOOT_DOWNLOAD_AREA  0x00101000
#define IAP_FW_MCU0_BOOT_BACKUP_AREA    0x0011A000

#define IAP_FW_MCU0_APP_DOWNLOAD_AREA  0x00134000
#define IAP_FW_MCU0_APP_BACKUP_AREA    0x001FC000

#define IAP_FW_MCU1_BOOT_DOWNLOAD_AREA  0x002C5000
#define IAP_FW_MCU1_BOOT_BACKUP_AREA    0x002DE000

#define IAP_FW_MCU1_APP_DOWNLOAD_AREA  0x002F8000
#define IAP_FW_MCU1_APP_BACKUP_AREA    0x00339000

////////////////////////////////////////////////////////////////////////////////
////
#define IAP_MCU0_BOOT_FLASH_ADDR       0x08000000
#define IAP_MCU0_APP_FLASH_ADDR        0x08010000



////////////////////////////////////////////////////////////////////////////////
////


#define IAP_RET_OK                           0
#define IAP_RET_ERROR                       (-1)
#define IAP_RET_INVALID_JSON                (-2)
#define IAP_RET_SPI_FLASH_NOT_READY         (-3)
#define IAP_RET_INVALID_FW_TYPE             (-4)

#define IAP_RET_REBOOT              (1)
#define IAP_RET_UPGRADE             (2)

////////////////////////////////////////////////////////////////////////////////
////
typedef void (*iap_function_t)(void);

////////////////////////////////////////////////////////////////////////////////
////

int iap_check_upgrade(void);

void iap_jump(uint32_t address);


#endif /*INCLUDED_IAP_H*/
