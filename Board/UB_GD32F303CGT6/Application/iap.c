#include <iap.h>
#include <fmc_operation.h>
#include <string.h>
#include <board.h>
#include <os_kernel.h>
#include <delay.h>
#include <mcu_session.h>
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

#define IAP_STATE_IDLE              0
#define IAP_STATE_UPG_DATA_RECV     1
#define IAP_STATE_DONE              9

static int iap__mcu_rx_handler(mcu_session_t * session, void* data, int data_size, void* ud){
    uint8_t type = MCU_BUFFER_DU_TYPE_GET((uint8_t*)data);
    uint16_t size = MCU_BUFFER_DU_SIZE_GET((uint8_t*)data);
    uint8_t * buffer = MCU_BUFFER_DU_GET(data);

    switch (type) {

        case kMCU_PROTOCOL_DU_SEND_UPG_DATA:{
            int idx = 0;
            uint8_t  fw_type = SDK_HEX_GET_UINT8(buffer, idx); idx+=1;
            uint32_t  fw_size = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
            uint32_t fw_version = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
            uint32_t total_pkg = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
            uint32_t this_pkg = SDK_HEX_GET_UINT32_BE(buffer, idx); idx+=4;
            uint16_t pkg_size = SDK_HEX_GET_UINT16_BE(buffer, idx); idx+=2;
            uint16_t this_pkg_size = SDK_HEX_GET_UINT16_BE(buffer, idx); idx+=2;
            uint8_t * fw_data = buffer+idx;

            uint32_t offset = (this_pkg-1) * pkg_size;
            if(this_pkg == total_pkg){
                offset = fw_size - this_pkg_size;
            }

            mcu_session_printf(session, "RECV SEND_UPG_DATA %d/%d\n", this_pkg, total_pkg);

            if(fw_type==IAP_FW_TYPE_MCU1_BOOT){
                uint32_t mcu_flash_address = IAP_FW_BOOT_ADDRESS + offset;
                if(this_pkg==1){
                    /* 第一个包, 删除 flash */
                    fmc_erase_page_by_addr(IAP_FW_BOOT_ADDRESS, fw_size);
                }

                fmc_program(mcu_flash_address, fw_data, this_pkg_size);

                /* 接收完成，发送 UPG_DATA_RECV(0xA3) */
                uint8_t * send_buffer = MCU_SESSION_DU_GET(session);
                idx = 0;
                SDK_HEX_SET_UINT8(send_buffer, idx, fw_type); idx+=1;
                SDK_HEX_SET_UINT32_BE(send_buffer, idx, fw_size); idx+=4;
                SDK_HEX_SET_UINT32_BE(send_buffer, idx, fw_version); idx+=4;
                SDK_HEX_SET_UINT32_BE(send_buffer, idx, total_pkg); idx+=4;
                SDK_HEX_SET_UINT32_BE(send_buffer, idx, this_pkg); idx+=4;
                SDK_HEX_SET_UINT32_BE(send_buffer, idx, offset+this_pkg_size); idx+=4; /* 总接收字节数量 */
                mcu_session_pack(session, kMCU_PROTOCOL_DU_UPG_DATA_RECV, 0, idx);
                mcu_session_send(session, 0, 0);

                if(this_pkg==total_pkg){
                    iap_info_t info;
                    iap_info_read(&info);
                    info.MCU_BOOT.download_version = info.MCU_BOOT.install_version;
                    iap_info_write(&info);
                    session->state=IAP_STATE_DONE;
                }else{
                    session->state = IAP_STATE_UPG_DATA_RECV;
                }
                mcu_session_notify(session);
            }
            break;
        }

    }
    return 0;
}


static int iap__mcu_boot_upgrade(void){
    iap_info_t info;
    iap_info_read(&info);
    if(info.MCU_BOOT.download_version==info.MCU_BOOT.install_version){
        return 0;
    }

    int nRetry = 3;
    int idx = 0;

    mcu_session_t* session = mcu_session_get_default();
    session->state = IAP_STATE_IDLE;
    mcu_session_set_rx_handler(session, iap__mcu_rx_handler, 0);

    while(1){
        switch (session->state) {
            case IAP_STATE_IDLE:{
                /* 发送 UPG_READY(0xA1) */
                idx = 0;
                uint8_t * buffer = MCU_SESSION_DU_GET(session);
                SDK_HEX_SET_UINT8(buffer, idx, IAP_FW_TYPE_MCU1_BOOT); idx+=1;
                SDK_HEX_SET_UINT32_BE(buffer, idx, info.MCU_BOOT.size); idx+=4;
                SDK_HEX_SET_UINT32_BE(buffer, idx, info.MCU_BOOT.download_version); idx+=4;
                memcpy(buffer+idx, info.MCU_BOOT.md5, sizeof(info.MCU_BOOT.md5)); idx+=16;

                mcu_session_pack(session, kMCU_PROTOCOL_DU_UPG_READY, 0, idx);
                mcu_session_send(session, 0, 0);
                int err = mcu_session_timed_wait(session, 10000);
                if(err==OS_ETIMEOUT){
                    nRetry--;
                    if(nRetry==0){
                        return IAP_RET_ERROR;
                    }
                }
                break;
            }
            case IAP_STATE_UPG_DATA_RECV:{
                int err = mcu_session_timed_wait(session, 10000);
                if(err==OS_ETIMEOUT){
                    nRetry--;
                    if(nRetry==0){
                        return IAP_RET_ERROR;
                    }
                }
                break;
            }
            case IAP_STATE_DONE:{
                /* 升级完成，进入 APP */
                Board_Reboot();
                break;
            }
        }
    }
    return 0;
}

int iap_check_upgrade(void)
{
    return iap__mcu_boot_upgrade();
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

    delay_ms(200);
    Board_DeInit();

    JumpToApplication();
}
