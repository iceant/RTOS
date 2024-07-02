#include <HTTPREAD.h>

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t* buffer, void* ud){
    A7670C_HTTPREAD_Read_Response* response = (A7670C_HTTPREAD_Read_Response*)ud;
    if(sdk_ringbuffer_find_str(buffer,0, "OK\r\n")!=-1){
        response->code=kA7670C_Response_Code_OK;
        sdk_ringbuffer_text_t text;
        if(sdk_ringbuffer_cut(&text, buffer, 0, sdk_ringbuffer_used(buffer), "+HTTPREAD: LEN,", "\r\n")==0){
            response->len = (int) sdk_ringbuffer_strtoul(buffer, text.start, 0, 0);
        }
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
        response->code = kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_HTTPREAD_Read(A7670C_HTTPREAD_Read_Response* response, uint32_t timeout_ms)
{
    return A7670C_RequestWithCmd(Read_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPREAD?\r\n");
}

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t* buffer, void*ud){
    A7670C_HTTPREAD_Write_Response* response = (A7670C_HTTPREAD_Write_Response*)ud;
    if(sdk_ringbuffer_find_str(buffer,0, "+HTTPREAD: 0\r\n")!=-1){
        response->code = kA7670C_Response_Code_OK;
        sdk_ringbuffer_text_t text;
        if(sdk_ringbuffer_cut(&text, buffer, 0, sdk_ringbuffer_used(buffer), "+HTTPREAD: ", "\r\n")==0){
            response->data_len = (int)sdk_ringbuffer_strtoul(buffer, text.start, 0, 0);
            if(response->data_len>0){
                sdk_ringbuffer_memcpy(response->data, buffer, text.end+2, response->data_len);
            }
        }
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_HTTPREAD_Write(A7670C_HTTPREAD_Write_Response* response
        , __OPTIONAL int start_offset /*0 default*/
        , int byte_size
        , uint32_t timeout_ms)
{
    response->code = kA7670C_Response_Code_ERROR;
    response->req_offset = start_offset;
    response->req_byte_size = byte_size;
    return A7670C_RequestWithArgs(Write_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPREAD=%d,%d\r\n", start_offset, byte_size);
}

