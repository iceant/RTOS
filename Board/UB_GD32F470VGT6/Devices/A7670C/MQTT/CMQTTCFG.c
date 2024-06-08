#include <CMQTTCFG.h>
#include <sdk_hex.h>

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

A7670C_Result A7670C_CMQTTCFG_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTCFG=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CMQTTCFG_Read_Response* result = (A7670C_CMQTTCFG_Read_Response*)ud;
    sdk_ringbuffer_text_t find_result;
    
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        /*接收结束*/
        result->code=kA7670C_Response_Code_OK;
        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTCFG: ", "\r\n");
        if(find==0){
            sdk_ringbuffer_iter_t iter;
            sdk_ringbuffer_iter_init(&iter, &find_result);
            
            ////////////////////////////////////////////////////////////////////////////////
            //// Client Index: 0

            sdk_ringbuffer_iter(&iter, ","); /* client_index */
            result->records[0].client_index = (long)sdk_ringbuffer_iter_strtoul(&iter, 0);

            sdk_ringbuffer_iter(&iter, ","); /* checkUTF8_flag */
            result->records[0].checkUTF8_flag= ((long)sdk_ringbuffer_iter_strtoul(&iter, 0))==0?false:true;

            sdk_ringbuffer_iter(&iter, ","); /* optimeout_val */
            result->records[0].optimeout_val = (long)sdk_ringbuffer_iter_strtoul(&iter, 0);
            
            ////////////////////////////////////////////////////////////////////////////////
            //// Client Index: 1

            find = sdk_ringbuffer_cut(&find_result, buffer, find_result.end, sdk_ringbuffer_used(buffer), "+CMQTTCFG: ", "\r\n");
            if(find==0){
                sdk_ringbuffer_iter_init(&iter, &find_result);

                sdk_ringbuffer_iter(&iter, ","); /* client_index */
                result->records[1].client_index = (long)sdk_ringbuffer_iter_strtoul(&iter, 0);
                
                sdk_ringbuffer_iter(&iter, ","); /* checkUTF8_flag */
                result->records[1].checkUTF8_flag= ((long)sdk_ringbuffer_iter_strtoul(&iter, 0))==0?false:true;
                
                sdk_ringbuffer_iter(&iter, ","); /* optimeout_val */
                result->records[1].optimeout_val = (long)sdk_ringbuffer_iter_strtoul(&iter, 0);
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


A7670C_Result A7670C_CMQTTCFG_Read(A7670C_CMQTTCFG_Read_Response* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTCFG?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result UTF8_Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CMQTTCFG_Write_Response* result = (A7670C_CMQTTCFG_Write_Response*)ud;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束: 成功*/){
        if(sdk_ringbuffer_find_str(buffer, 0, "CMQTTCFG=\"checkUTF8\",0,0")!=-1){
            result->code = kA7670C_Response_Code_OK;
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }else{
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
//        sdk_hex_dump("[CMQTTCFG]", buffer->buffer, sdk_ringbuffer_used(buffer));
        if(sdk_ringbuffer_find_str(buffer, 0, "CMQTTCFG=\"checkUTF8\",0,0")!=-1){
            result->code = kA7670C_Response_Code_ERROR;
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }else{
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTCFG_SetUTF8(A7670C_CMQTTCFG_Write_Response* result
        , int client_index
        , bool checkUTF8_flag
        , uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithArgs(UTF8_Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTCFG=\"checkUTF8\",%d,%d\r\n"
            , client_index
            , checkUTF8_flag
            );
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result SetTimeout_Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CMQTTCFG_Write_Response* result = (A7670C_CMQTTCFG_Write_Response*)ud;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束: 成功*/){
        if(sdk_ringbuffer_find_str(buffer, 0, "CMQTTCFG=\"optimeout\",0,0")!=-1){
            result->code = kA7670C_Response_Code_OK;
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }else{
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
//        sdk_hex_dump("[CMQTTCFG]", buffer->buffer, sdk_ringbuffer_used(buffer));
        if(sdk_ringbuffer_find_str(buffer, 0, "CMQTTCFG=\"optimeout\",0,0")!=-1){
            result->code = kA7670C_Response_Code_ERROR;
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }else{
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CMQTTCFG_SetTimeout(A7670C_CMQTTCFG_Write_Response* result
        , int client_index
        , int optimeout_val
        , uint32_t timeout_ms)
{
    result->code = kA7670C_Response_Code_ERROR;
    A7670C_Result err = A7670C_RequestWithArgs(SetTimeout_Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTCFG=\"optimeout\",%d,%d\r\n"
            , client_index
            , optimeout_val
    );
    return err;
}


