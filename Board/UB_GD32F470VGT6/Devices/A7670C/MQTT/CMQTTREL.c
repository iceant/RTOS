#include <CMQTTREL.h>

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Test_Handler(sdk_ringbuffer_t *buffer, void* ud)
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

A7670C_Result A7670C_CMQTTREL_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTREL=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CMQTTREL_Read_Response* result = (A7670C_CMQTTREL_Read_Response*)ud;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束*/){
        result->code=kA7670C_Response_Code_OK;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束*/){
        result->code = kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTREL_Read(A7670C_CMQTTREL_Read_Response* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTREL?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CMQTTREL_Write_Response* result = (A7670C_CMQTTREL_Write_Response*)ud;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束: 成功*/){
        result->code=kA7670C_Response_Code_OK;
        result->err_code = 0;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){

        result->code = kA7670C_Response_Code_ERROR;

        sdk_ringbuffer_text_t find_text;

        int find_status = sdk_ringbuffer_cut(&find_text, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTREL: ", "\r\n");
        if(find_status==0){
            int pEnd = 0;
            result->client_index = sdk_ringbuffer_strtoul(buffer, find_text.start, &pEnd, 0);
            result->err_code = sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
        }else{
            /* 一般错误，没有错误号 */
            result->err_code = -1;
        }
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTREL_Write(A7670C_CMQTTREL_Write_Response* result
        , int client_index
        , uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTREL=%d\r\n"
            , client_index);
    return err;
}
