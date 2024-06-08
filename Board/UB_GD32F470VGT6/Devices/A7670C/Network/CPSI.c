#include "CPSI.h"

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Test_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    os_bool_t* result = (bool*)ud;
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        *result = true;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
        *result = false;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CPSI_Test(os_bool_t* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CPSI=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CPSI_Read_Response* response = (A7670C_CPSI_Read_Response*)ud;
    sdk_ringbuffer_text_t find_result;
//
//    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束*/){
//        response->code = kA7670C_Response_Code_OK;
//        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer),"+CPSI: ", "\r\n");
//        if(find==0){
//            sdk_ringbuffer_iter_t iter;
//            sdk_ringbuffer_iter_init(&iter, &find_result);
//            if(sdk_ringbuffer_iter(&iter, ",")==0){
//                if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "NO SERVICE")==0){
//                    response->SystemMode=kA7670C_CPSI_Read_SystemMode_NOSERVICE;
//                }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "GSM")==0){
//                    response->SystemMode=kA7670C_CPSI_Read_SystemMode_GSM;
//                }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "WCDMA")==0){
//                    response->SystemMode=kA7670C_CPSI_Read_SystemMode_WCDMA;
//                }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "LTE")==0){
//                    response->SystemMode=kA7670C_CPSI_Read_SystemMode_LTE;
//                }
//
//                if(sdk_ringbuffer_iter(&iter, ",")==0){
//                    if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Unknown")==0){
//                        response->OperationMode=kA7670C_CPSI_Read_OperationMode_Unknown;
//                    }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Online")==0){
//                        response->OperationMode=kA7670C_CPSI_Read_OperationMode_Online;
//                    }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Offline")==0){
//                        response->OperationMode=kA7670C_CPSI_Read_OperationMode_Offline;
//                    }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Factor Test Mode")==0){
//                        response->OperationMode=kA7670C_CPSI_Read_OperationMode_FactoryTestMode;
//                    }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Reset")==0){
//                        response->OperationMode=kA7670C_CPSI_Read_OperationMode_Reset;
//                    }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Low Power Mode")==0){
//                        response->OperationMode=kA7670C_CPSI_Read_OperationMode_LowPowerMode;
//                    }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Flight Mode")==0){
//                        response->OperationMode=kA7670C_CPSI_Read_OperationMode_FlightMode;
//                    }
//                }
//            }
//            sdk_ringbuffer_reset(buffer);
//            A7670C_Notify();
//            return kA7670C_RxHandler_Result_DONE;
//        }else{
//            sdk_ringbuffer_reset(buffer);
//            A7670C_Notify();
//            return kA7670C_RxHandler_Result_RESET;
//        }
//    }
    
    int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer),"+CPSI: ", "\r\n");
    if(find==0){
        response->code = kA7670C_Response_Code_OK;
        sdk_ringbuffer_iter_t iter;
        sdk_ringbuffer_iter_init(&iter, &find_result);
        if(sdk_ringbuffer_iter(&iter, ",")==0){
            if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "NO SERVICE")==0){
                response->SystemMode=kA7670C_CPSI_Read_SystemMode_NOSERVICE;
            }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "GSM")==0){
                response->SystemMode=kA7670C_CPSI_Read_SystemMode_GSM;
            }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "WCDMA")==0){
                response->SystemMode=kA7670C_CPSI_Read_SystemMode_WCDMA;
            }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "LTE")==0){
                response->SystemMode=kA7670C_CPSI_Read_SystemMode_LTE;
            }
            
            if(sdk_ringbuffer_iter(&iter, ",")==0){
                if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Unknown")==0){
                    response->OperationMode=kA7670C_CPSI_Read_OperationMode_Unknown;
                }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Online")==0){
                    response->OperationMode=kA7670C_CPSI_Read_OperationMode_Online;
                }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Offline")==0){
                    response->OperationMode=kA7670C_CPSI_Read_OperationMode_Offline;
                }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Factor Test Mode")==0){
                    response->OperationMode=kA7670C_CPSI_Read_OperationMode_FactoryTestMode;
                }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Reset")==0){
                    response->OperationMode=kA7670C_CPSI_Read_OperationMode_Reset;
                }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Low Power Mode")==0){
                    response->OperationMode=kA7670C_CPSI_Read_OperationMode_LowPowerMode;
                }else if(sdk_ringbuffer_strcmp(buffer, iter.start, iter.end, "Flight Mode")==0){
                    response->OperationMode=kA7670C_CPSI_Read_OperationMode_FlightMode;
                }
            }
        }
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束*/){
        response->code = kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CPSI_Read(A7670C_CPSI_Read_Response* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CPSI?\r\n");
    return err;
}

