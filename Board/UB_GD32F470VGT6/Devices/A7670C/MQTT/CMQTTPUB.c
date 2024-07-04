#include <CMQTTPUB.h>

#include <sdk_hex.h>
////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Test_Handler(sdk_ringbuffer_t *buffer, void* ud)
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

A7670C_Result A7670C_CMQTTPUB_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTPUB=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CMQTTPUB_Write_Response* result = (A7670C_CMQTTPUB_Write_Response*)ud;
    
    sdk_ringbuffer_text_t find_text;
    int find_status = sdk_ringbuffer_cut(&find_text, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTPUB: ", "\r\n");
    if(find_status==0){
        int pEnd = 0;
        result->client_index = sdk_ringbuffer_strtoul(buffer, find_text.start,  &pEnd, 0);
        result->err_code = sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
        
        if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
            result->code=kA7670C_Response_Code_OK;
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }
        
        if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
            sdk_hex_dump("CMQTTPUB_ERROR1", buffer->buffer, sdk_ringbuffer_used(buffer));
            result->code = kA7670C_Response_Code_ERROR;
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
        sdk_hex_dump("CMQTTPUB_ERROR2", buffer->buffer, sdk_ringbuffer_used(buffer));
        result->code = kA7670C_Response_Code_ERROR;
        result->err_code = -1;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTPUB_Write(A7670C_CMQTTPUB_Write_Response* result
        , int client_index
        , A7670C_Qos qos
        , int pub_timeout
        , A7670C_Bool retained
        , A7670C_Bool dup
        , uint32_t timeout_ms)
{
    A7670C_Result err=kA7670C_Result_ERROR;
    result->err_code = -1;
    result->code = kA7670C_Response_Code_ERROR;
    if(dup==kA7670C_Bool_Unspecified && retained==kA7670C_Bool_Unspecified){
        err = A7670C_RequestWithArgs("CMQTTPUB_Write",Write_Handler, result, os_tick_from_millisecond(timeout_ms)
                , "AT+CMQTTPUB=%d,%d,%d\r\n"
                , client_index
                , qos
                , pub_timeout);
    }else if(dup==kA7670C_Bool_Unspecified && retained!=kA7670C_Bool_Unspecified){
        err = A7670C_RequestWithArgs("CMQTTPUB_Write",Write_Handler, result, os_tick_from_millisecond(timeout_ms)
                , "AT+CMQTTPUB=%d,%d,%d,%d\r\n"
                , client_index
                , qos
                , pub_timeout
                , retained
                );
    }else if(dup!=kA7670C_Bool_Unspecified){
        err = A7670C_RequestWithArgs("CMQTTPUB_Write",Write_Handler, result, os_tick_from_millisecond(timeout_ms)
                , "AT+CMQTTPUB=%d,%d,%d,%d,%d\r\n"
                , client_index
                , qos
                , pub_timeout
                , retained
                , dup
        );
    }

    return err;
}
