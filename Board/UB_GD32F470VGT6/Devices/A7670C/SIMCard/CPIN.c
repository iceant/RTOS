#include <CPIN.h>
#include <stdio.h>
#include <sdk_hex.h>
////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result CPIN_Test_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    bool* result = (bool*)ud;
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        *result = true;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CPIN_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(CPIN_Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CPIN=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result CPIN_Read_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CPIN_Read_Response* result = (A7670C_CPIN_Read_Response*)ud;
    sdk_ringbuffer_text_t find_result;
    
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束*/){
        result->code=kA7670C_Response_Code_OK;
        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer),"+CPIN: ", "\r\n");
        if(find==0){
            if(sdk_ringbuffer_strcmp(buffer, find_result.start, find_result.end, "READY")==0){
                result->record_code=kA7670C_CPIN_Record_Code_READY;
            }else if(sdk_ringbuffer_strcmp(buffer, find_result.start, find_result.end, "SIM PIN")==0){
                result->record_code=kA7670C_CPIN_Record_Code_SIMPIN;
            }else if(sdk_ringbuffer_strcmp(buffer, find_result.start, find_result.end, "SIM PUK")==0){
                result->record_code=kA7670C_CPIN_Record_Code_SIMPUK;
            }else if(sdk_ringbuffer_strcmp(buffer, find_result.start, find_result.end, "PH-SIM PIN")==0){
                result->record_code=kA7670C_CPIN_Record_Code_PHSIMPIN;
            }else if(sdk_ringbuffer_strcmp(buffer, find_result.start, find_result.end, "SIM PIN2")==0){
                result->record_code=kA7670C_CPIN_Record_Code_SIMPIN2;
            }else if(sdk_ringbuffer_strcmp(buffer, find_result.start, find_result.end, "SIM PUK2")==0){
                result->record_code=kA7670C_CPIN_Record_Code_SIMPUK2;
            }else if(sdk_ringbuffer_strcmp(buffer, find_result.start, find_result.end, "PH-NET PIN")==0){
                result->record_code=kA7670C_CPIN_Record_Code_PHNETPIN;
            }
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }else{
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束*/){
        result->code = kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "+CME ERROR: ")!=-1 /*接收结束*/){
        result->code = kA7670C_Response_Code_ERROR;
        int find = sdk_ringbuffer_cut(&find_result,buffer, 0, sdk_ringbuffer_used(buffer), "+CME ERROR: ", "\r\n");
        if(find==0){
            result->err_code = sdk_ringbuffer_strtoul(buffer, find_result.start, 0, 0);
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }else{
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CPIN_Read(A7670C_CPIN_Read_Response* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(CPIN_Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CPIN?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result CPIN_Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CPIN_Write_Response* result = (A7670C_CPIN_Write_Response*)ud;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束: 成功*/){
        result->code=kA7670C_Response_Code_OK;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
        result->code = kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "+CME ERROR: ")!=-1 /*接收结束*/){
        result->code = kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_text_t find_result;
        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer),"+CME ERROR: ", "\r\n");
        if(find==0){
            result->err_code = sdk_ringbuffer_strtoul(buffer, find_result.start, 0, 0);
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }else{
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CPIN_Write(A7670C_CPIN_Write_Response* result, const char* pin, const char* newpin, uint32_t timeout_ms)
{
    A7670C_Result err;
    if(newpin==0){
         err = A7670C_RequestWithArgs(CPIN_Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CPIN=%s\r\n", pin);
    }else{
        err = A7670C_RequestWithArgs(CPIN_Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CPIN=%s,%s\r\n", pin, newpin);
    }
    return err;
}
