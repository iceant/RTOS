#include <CMQTTDISC.h>

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Test_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    bool* result = (bool*)ud;
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")){
        *result = true;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CMQTTDISC_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTDISC=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CMQTTDISC_Read_Response* result = (A7670C_CMQTTDISC_Read_Response*)ud;
    sdk_ringbuffer_text_t find_result;
    
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束*/){
        result->code=kA7670C_Response_Code_OK;

        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTDISC: ", "\r\n");
        if(find==0){
            sdk_ringbuffer_iter_t iter;
            sdk_ringbuffer_iter_init(&iter, &find_result);
            
            ////////////////////////////////////////////////////////////////////////////////
            //// Client Index: 0
            
            sdk_ringbuffer_iter(&iter, ","); /* client_index */
            result->records[0].client_index = sdk_ringbuffer_iter_strtoul(&iter, 0);

            sdk_ringbuffer_iter(&iter, ","); /* disc_state */
            result->records[0].disc_state = sdk_ringbuffer_iter_strtoul(&iter, 0);
            
            ////////////////////////////////////////////////////////////////////////////////
            //// Client Index: 1
            find = sdk_ringbuffer_cut(&find_result, buffer, find_result.end, sdk_ringbuffer_used(buffer), "+CMQTTDISC: ", "\r\n");
            if(find==0){
                sdk_ringbuffer_iter_init(&iter, &find_result);

                sdk_ringbuffer_iter(&iter, ","); /* client_index */
                result->records[0].client_index = sdk_ringbuffer_iter_strtoul(&iter, 0);

                sdk_ringbuffer_iter(&iter, ","); /* disc_state */
                result->records[0].disc_state = sdk_ringbuffer_iter_strtoul(&iter, 0);
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


A7670C_Result A7670C_CMQTTDISC_Read(A7670C_CMQTTDISC_Read_Response* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTDISC?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CMQTTDISC_Write_Response* result = (A7670C_CMQTTDISC_Write_Response*)ud;
    
    sdk_ringbuffer_text_t find_text;
    sdk_ringbuffer_iter_t iter;
    
//    int find_status = text_between(&find_text, data, data_size, "+CMQTTDISC: ", "\r\n");
    int find_status = sdk_ringbuffer_cut(&find_text, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTDISC: ", "\r\n");
    if(find_status==0){
        sdk_ringbuffer_iter_init(&iter, &find_text);
        sdk_ringbuffer_iter(&iter, ","); /*client_index*/
        result->client_index = sdk_ringbuffer_iter_strtoul(&iter, 0);

        sdk_ringbuffer_iter(&iter, ","); /*err*/
        int err = sdk_ringbuffer_iter_strtoul(&iter, 0);
        result->err_code = err;
        
        if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
            result->code=kA7670C_Response_Code_OK;
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }
        
        if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
            result->code = kA7670C_Response_Code_ERROR;
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }
        return kA7670C_RxHandler_Result_CONTINUE;
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
        result->code=kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTDISC_Write(A7670C_CMQTTDISC_Write_Response* result
        , int client_index
        , int timeout /* 60s - 180s*/
        , uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTDISC=%d,%d\r\n"
            , client_index
            , timeout);
    return err;
}
