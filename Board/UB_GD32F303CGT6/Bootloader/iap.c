#include <iap.h>
#include <board.h>
#include <os_kernel.h>
#include <delay.h>
#include <mcu_session.h>
#include <fmc_operation.h>
#include <md5.h>
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

static int iap__mcu_app_upgrade(void){
    iap_info_t info;
    iap_info_read(&info);

    if(info.MCU_APP.download_version==info.MCU_APP.install_version){
        return 0;
    }

    MD5_CTX md5_ctx;
    uint8_t md5[16];
    mcu_session_t* session = mcu_session_get_default();

    int total_bytes = 0;
    int nRetry = 3;
    MD5Init(&md5_ctx);
    while(1){
        mcu_session_pack(session, kMCU_PROTOCOL_DU_UPG_MCU1_APP, 0, 0);
        mcu_session_send(session, 0, 0);
        os_err_t err = mcu_session_timed_wait(session, 10000);
        if(err==OS_ETIMEOUT){
            if(nRetry-- == 0){
                return IAP_RET_ERROR;
            }
        }else{
            break;
        }
    }



    nRetry = 3;
    uint32_t mcu_flash_address = IAP_FW_APP_ADDRESS;
    fmc_erase_page_by_addr(mcu_flash_address, info.MCU_APP.size);

    while(1){
        if(session->state==MCU_SESSION_STATE_RECV_FW_DATA){
            MD5Update(&md5_ctx, session->recv_buffer, session->recv_size);
            fmc_program(mcu_flash_address+total_bytes, session->recv_buffer, session->recv_size);

            mcu_session_pack(session, kMCU_PROTOCOL_DU_RECVOK, 0, 0);
            mcu_session_send(session, 0, 0);
            session->state = MCU_SESSION_STATE_WAIT_FOR_FW_DATA;
        }else{
            mcu_session_pack(session, kMCU_PROTOCOL_DU_RECVERR, 0, 0);
            mcu_session_send(session, 0, 0);
            session->state = MCU_SESSION_STATE_WAIT_FOR_FW_DATA;
        }
        os_err_t err = mcu_session_timed_wait(session, 10000);
        if(err==OS_ETIMEOUT){
            if(nRetry-- == 0){
                return IAP_RET_ERROR;
            }
        }
    }

    MD5Final(md5, &md5_ctx);


    return 0;
}

static int iap__mcu_boot_upgrade(void){
    return 0;
}

////////////////////////////////////////////////////////////////////////////////
////


int iap_check_upgrade(void)
{
    /* boot 启动时只需要处理 app 固件升级 */
//    iap__mcu_app_upgrade();

    return IAP_RET_OK;
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
