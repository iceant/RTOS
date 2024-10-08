#include <A7670C.h>

#include <os_kernel.h>
//#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <sdk_hex.h>

////////////////////////////////////////////////////////////////////////////////
////
#define DELAY_TIME 0x3FFFFFF

////////////////////////////////////////////////////////////////////////////////
////


static A7670C_RxHandler_Result A7670C_AT__Handler(sdk_ringbuffer_t * buffer, void* ud){
    if(sdk_ringbuffer_find_str(buffer, 0, "AT\r\r\nOK\r\n")!=-1
        || sdk_ringbuffer_find_str(buffer, 0, "*ATREADY: 1")!=-1){
        sdk_hex_dump("[AT]", buffer->buffer, sdk_ringbuffer_used(buffer));
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }else{
        sdk_hex_dump("[AT_N]", buffer->buffer, sdk_ringbuffer_used(buffer));
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_AT(os_time_t timeout_ms){
    return A7670C_RequestWithCmd(__FUNCTION__ , A7670C_AT__Handler, 0, os_tick_from_millisecond(timeout_ms), "AT\r\n");
}

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result WaitPBDone_Handler(sdk_ringbuffer_t* buffer, void*ud){
    if(sdk_ringbuffer_find_str(buffer, 0, "PB DONE\r\n")!=-1){
        sdk_hex_dump("[WAIT_PB_DONE]", buffer->buffer, sdk_ringbuffer_used(buffer));
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_WaitPBDone(uint32_t timeout_ms)
{
    return A7670C_RequestWithHandler(__FUNCTION__, WaitPBDone_Handler, 0, os_tick_from_millisecond(timeout_ms));
}

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_Startup(void){
    A7670C_Result result;
    int nRetry = 0;
//    printf("[A7670C] Startup\n");


__A7670C__Boot:
//    while(!A7670C_IsPowerOn()){
//        printf("[A7670C] Power is Off!\r\n");
//        A7670C_PowerOff();
//        A7670C_NopDelay(DELAY_TIME);
//        A7670C_PowerOn();
//        A7670C_NopDelay(DELAY_TIME);
//    }

    A7670C_SetState(kA7670C_State_Startup);

    while(!A7670C_IsPowerOn()){
        printf("[A7670C] Power is Off!\r\n");
        A7670C_PowerOn();
    }

    if(A7670C_GetStartupState()==A7670C_STARTUP_STATE_UNINITIALIZED){
        /*这是重启*/
        while(1){
            printf("[A7670C] wait for AT ready...\n");
            result = A7670C_AT(1000);
            if(result==kA7670C_Result_OK){
                break;
            }
            if(nRetry++==10){
                printf("Try from Power On...\n");
                goto __A7670C__Boot;
            }
            A7670C_DelayMS(2000);
        }

    }else{
        if(A7670C_IsPowerOn()){
            printf("[A7670C] Reset...");
            A7670C_Reset();
        }

        while(1){
            printf("[A7670C] wait for AT ready 2 ...\n");
            result = A7670C_AT(1000);
            if(result==kA7670C_Result_OK){
                break;
            }
            if(nRetry++==10){
                printf("Try from Power On...\n");
                goto __A7670C__Boot;
            }
            A7670C_DelayMS(2000);
        }

    }



    A7670C_SetStartupState(A7670C_STARTUP_STATE_UNINITIALIZED);

    nRetry = 0;
    while(1){
        printf("[A7670C] wait for CPIN ready...\n");
        A7670C_CPIN_Read_Response CPIN_Read_Response;
        result = A7670C_CPIN_Read(&CPIN_Read_Response, A7670C_DEFAULT_TIMEOUT_MS);
        if(CPIN_Read_Response.code==kA7670C_Response_Code_OK){
            break;
        }
        if(nRetry++==10){
            return kA7670C_Result_TIMEOUT;
        }
        A7670C_NopDelay(DELAY_TIME);
    }
    
    nRetry = 0;
    while(1){
        printf("[A7670C] checking CSQ quality...");
        A7670C_CSQ_Exec_Response CSQ_Exec_Response;
        result = A7670C_CSQ_Exec(&CSQ_Exec_Response, 12000);
        if(CSQ_Exec_Response.code == kA7670C_Response_Code_OK){
            printf(" rssi: %d, ber: %d\n", CSQ_Exec_Response.rssi, CSQ_Exec_Response.ber);
            if(CSQ_Exec_Response.rssi>0 && CSQ_Exec_Response.rssi<=31){
                break;
            }
        }
        if(nRetry++==10){
            return kA7670C_Result_TIMEOUT;
        }
        A7670C_NopDelay(DELAY_TIME);
    }

#if 0
    nRetry = 0;
    while(1){
        printf("A7670C CS service(CREG)...");
        A7670C_CREG_Read_Response CREG_Read_Response;
        result = A7670C_CREG_Read(&CREG_Read_Response, 12000);
        if(CREG_Read_Response.code == kA7670C_Response_Code_OK){
            printf("n:%d, stat: %d\n",CREG_Read_Response.n ,CREG_Read_Response.stat);
            if(CREG_Read_Response.stat==1){
                break;
            }
        }
        printf("retry %d...\n", nRetry);
        if(nRetry++==10){
            break;
        }
        A7670C_NopDelay(0x3FFFFF);
    }
#endif

    int  A7670C_PS_Flag = 0;
    nRetry = 0;
    while(1){
        printf("[A7670C] PS service(CGREG)...");
        A7670C_CGREG_Read_Response CGREG_Read_Response;
        result = A7670C_CGREG_Read(&CGREG_Read_Response, 12000);
        if(CGREG_Read_Response.code == kA7670C_Response_Code_OK){
            printf("n:%d, stat: %d\n",CGREG_Read_Response.n ,CGREG_Read_Response.stat);
            if(CGREG_Read_Response.stat==1){
                A7670C_PS_Flag = 1;
                break;
            }
        }
        printf("retry %d...\n", nRetry);
        if(nRetry++==10){
            break;
        }
        A7670C_NopDelay(DELAY_TIME);
    }
    
//    if(A7670C_PS_Flag==0){
        nRetry = 0;
        while(1){
            printf("[A7670C] PS service(CEREG)...");
            A7670C_CEREG_Read_Response CEREG_Read_Response;
            result = A7670C_CEREG_Read(&CEREG_Read_Response, 12000);
            if(CEREG_Read_Response.code == kA7670C_Response_Code_OK){
                printf("n:%d, stat: %d\n",CEREG_Read_Response.n ,CEREG_Read_Response.stat);
                if(CEREG_Read_Response.stat==1){
                    A7670C_PS_Flag = 1;
                    break;
                }
            }
            printf("retry %d...\n", nRetry);
            if(nRetry++==10){
                break;
//                return kA7670C_Result_TIMEOUT;
            }
            A7670C_NopDelay(DELAY_TIME);
        }
//    }


#if 0
    nRetry = 0;
    while(1){
        printf("[A7670C] UE system info...");
        A7670C_CPSI_Read_Response CPSI_Read_Response;
        result = A7670C_CPSI_Read(&CPSI_Read_Response, 12000);
        if(CPSI_Read_Response.code == kA7670C_Response_Code_OK){
            printf("SystemMode: %d\n", CPSI_Read_Response.SystemMode);
            if(CPSI_Read_Response.SystemMode!=kA7670C_CPSI_Read_SystemMode_NOSERVICE){
                break;
            }
        }
        if(nRetry++==10){
            return kA7670C_Result_TIMEOUT;
        }
        printf("nRetry:%d\n", nRetry);
        A7670C_NopDelay(DELAY_TIME);
    }
#endif

    nRetry = 0;
    while(1){
        printf("[A7670C] CGATT...");
        A7670C_CGACT_Read_Response CGACT_Read_Response;
        result = A7670C_CGACT_Read(&CGACT_Read_Response, A7670C_DEFAULT_TIMEOUT_MS);
        if(CGACT_Read_Response.code == kA7670C_Response_Code_OK){
            printf("CGACT Record Count: %d\n", CGACT_Read_Response.record_count);
            break;
        }
        printf("retry %d...\n", nRetry);
        if(nRetry++==10){
            return kA7670C_Result_TIMEOUT;
        }
        A7670C_NopDelay(DELAY_TIME);
    }

#if 0

    nRetry = 0;
    while(1){
        A7670C_SIMEI_Read_Response SIMEI_Read_Response;
        result = A7670C_SIMEI_Read(&SIMEI_Read_Response, 12000);

        if(SIMEI_Read_Response.code == kA7670C_Response_Code_OK){
            printf("IMEI: %s\n", SIMEI_Read_Response.value);
            break;
        }
        if(nRetry++==10){
            return kA7670C_Result_TIMEOUT;
        }
        A7670C_NopDelay(DELAY_TIME);
    }

    nRetry = 0;
    while(1){
        A7670C_ICCID_Read_Response ICCID_Read_Response;
        result = A7670C_ICCID_Read(&ICCID_Read_Response, 12000);

        if(ICCID_Read_Response.code == kA7670C_Response_Code_OK){
            printf("CCID: %s\n", ICCID_Read_Response.ICCID);
            break;
        }
        if(nRetry++==10){
            return kA7670C_Result_TIMEOUT;
        }
        A7670C_NopDelay(DELAY_TIME);
    }



    nRetry = 0;
    while(1){
        printf("CNTP Try to  Set To ntp.aliyun.com...\n");
        A7670C_CNTP_Write_Response CNTP_Write_Response;
        result = A7670C_CNTP_Write(&CNTP_Write_Response, "ntp.aliyun.com" /*ntp.aliyun.com*/, 32, 12000);

        if(CNTP_Write_Response.code == kA7670C_Response_Code_OK){
            printf("CNTP Set To ntp.aliyun.com\n");
            break;
        }
        printf("retry %d...\n", nRetry);
        if(nRetry++==10){
            return kA7670C_Result_TIMEOUT;
        }
        A7670C_NopDelay(DELAY_TIME);
    }


    nRetry = 0;
    while(1){
        A7670C_CNTP_Exec_Response CNTP_Exec_Response;
        result = A7670C_CNTP_Exec(&CNTP_Exec_Response, 12000);
        if(CNTP_Exec_Response.code == kA7670C_Response_Code_OK){
            printf("CNTP_Exec Done!\n");
            break;
        }
        if(nRetry++==10){
            return kA7670C_Result_TIMEOUT;
        }
        A7670C_NopDelay(DELAY_TIME);
    }
#endif
    
    A7670C_SetStartupState(A7670C_STARTUP_STATE_READY);
    
    return kA7670C_Result_OK;
    
}

