#ifndef INCLUDED_IAP_H
#define INCLUDED_IAP_H


////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_GD32F30X_H
#define INCLUDED_GD32F30X_H
#include <gd32f30x.h>
#endif /*INCLUDED_GD32F30X_H*/


////////////////////////////////////////////////////////////////////////////////
////

#define IAP_FW_TYPE_MCU0_BOOT   0x01
#define IAP_FW_TYPE_MCU0_APP    0x02
#define IAP_FW_TYPE_MCU1_BOOT   0x03
#define IAP_FW_TYPE_MCU1_APP    0x04

#define IAP_INFO_ADDRESS 0x08030000

#define IAP_FW_BOOT_ADDRESS 0x08000000
#define IAP_FW_APP_ADDRESS  0x08010000

#define IAP_RET_OK      0
#define IAP_RET_ERROR   (-1)

////////////////////////////////////////////////////////////////////////////////
////

typedef struct iap_firmware_info_s{
    uint8_t     type;
    uint32_t    size;
    uint32_t    download_version;
    uint32_t    install_version;
    uint8_t     md5[16];
}iap_firmware_info_t;

typedef struct iap_info_s{
    iap_firmware_info_t MCU_BOOT;
    iap_firmware_info_t MCU_APP;
}iap_info_t;

typedef void (*iap_function_t)(void);
////////////////////////////////////////////////////////////////////////////////
////
int iap_info_read(iap_info_t * iap_info);

int iap_info_write(iap_info_t * iap_info);

////////////////////////////////////////////////////////////////////////////////
////
void iap_jump(uint32_t address);

int iap_check_upgrade();



#endif /*INCLUDED_IAP_H*/
