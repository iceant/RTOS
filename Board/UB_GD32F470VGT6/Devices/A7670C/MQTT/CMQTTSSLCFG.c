#include <CMQTTSSLCFG.h>

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

A7670C_Result A7670C_CMQTTSSLCFG_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTSSLCFG=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CMQTTSSLCFG_Read_Response* result = (A7670C_CMQTTSSLCFG_Read_Response*)ud;
    sdk_ringbuffer_text_t find_result;
    
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束*/){
        result->code=kA7670C_Response_Code_OK;

        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTSSLCFG: ", "\r\n");
        if(find==0){
            sdk_ringbuffer_iter_t iter;
            sdk_ringbuffer_iter_init(&iter, &find_result);
            
            ////////////////////////////////////////////////////////////////////////////////
            //// Client Index: 0

            sdk_ringbuffer_iter(&iter, ","); /* session_id */
            result->records[0].session_id = sdk_ringbuffer_iter_strtoul(&iter, 0);

            sdk_ringbuffer_iter(&iter, ","); /* ssl_ctx_index */
            result->records[0].ssl_ctx_index= sdk_ringbuffer_iter_strtoul(&iter, 0);
            
            
            ////////////////////////////////////////////////////////////////////////////////
            //// Client Index: 1
//            find = text_between(&find_result, find_result.value, find_result.size, "+CMQTTSSLCFG: ", "\r\n");
            find = sdk_ringbuffer_cut(&find_result, buffer, find_result.start, sdk_ringbuffer_used(buffer), "+CMQTTSSLCFG: ", "\r\n");
            if(find==0){
                sdk_ringbuffer_iter_init(&iter, &find_result);

                sdk_ringbuffer_iter(&iter, ","); /* session_id */
                result->records[1].session_id = sdk_ringbuffer_iter_strtoul(&iter, 0);

                sdk_ringbuffer_iter(&iter, ","); /* ssl_ctx_index */
                result->records[1].ssl_ctx_index= sdk_ringbuffer_iter_strtoul(&iter, 0);
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
    
    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTSSLCFG_Read(A7670C_CMQTTSSLCFG_Read_Response* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTSSLCFG?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CMQTTSSLCFG_Write_Response* result = (A7670C_CMQTTSSLCFG_Write_Response*)ud;
    
    if(sdk_ringbuffer_find_str(buffer,0, "OK\r\n")!=-1 /*接收结束: 成功*/){
        result->code = kA7670C_Response_Code_OK;
        result->err_code = 0;
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
    
    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTSSLCFG_Write(A7670C_CMQTTSSLCFG_Write_Response* result
        , int session_id
        , int ssl_ctx_index
        , uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithArgs("CMQTTSSLCFG_Write",Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTSSLCFG=%d,%d\r\n"
            , session_id
            , ssl_ctx_index);
    return err;
}
