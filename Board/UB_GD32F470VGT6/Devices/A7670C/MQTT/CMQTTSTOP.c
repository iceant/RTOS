#include <CMQTTSTOP.h>
#include <sdk_hex.h>

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Exec_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CMQTTSTOP_Exec_Response* result = (A7670C_CMQTTSTOP_Exec_Response*)ud;

    sdk_ringbuffer_text_t find_text;

    int find_status = sdk_ringbuffer_cut(&find_text, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTSTOP: ", "\r\n");
    if(find_status==0){

        result->err_code = sdk_ringbuffer_strtoul(buffer, find_text.start, 0, 0);

        if(result->err_code==0){
            result->code = kA7670C_Response_Code_OK;
        }else{
            result->code = kA7670C_Response_Code_ERROR;
        }
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
        result->code = kA7670C_Response_Code_ERROR;
        result->err_code = 0;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CMQTTSTOP_Exec(A7670C_CMQTTSTOP_Exec_Response* result, uint32_t timeout_ms)
{
    A7670C_Result err;
    err = A7670C_RequestWithCmd(__FUNCTION__, Exec_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTSTOP\r\n");
    return err;
}

