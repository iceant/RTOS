#include <iap.h>
#include <fmc_operation.h>
#include <string.h>
////////////////////////////////////////////////////////////////////////////////
////

int iap_info_read(iap_info_t * iap_info)
{
    memcpy((uint8_t*)iap_info, (uint8_t*)IAP_INFO_ADDRESS, sizeof(*iap_info));

    return 0;
}

int iap_info_write(iap_info_t * iap_info)
{
    fmc_erase_page_by_addr(IAP_INFO_ADDRESS, sizeof(*iap_info));
    return fmc_program(IAP_INFO_ADDRESS, (uint8_t *)iap_info, sizeof(*iap_info));
}

////////////////////////////////////////////////////////////////////////////////
////


