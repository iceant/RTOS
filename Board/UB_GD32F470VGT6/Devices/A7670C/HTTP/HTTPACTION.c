#include <HTTPACTION.h>

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t * buffer, void* ud){
    A7670C_HTTPACTION_Write_Response* response = (A7670C_HTTPACTION_Write_Response*)ud;
    sdk_ringbuffer_text_t text;
    sdk_ringbuffer_iter_t iter;
    os_size_t used = sdk_ringbuffer_used(buffer);
    int find = sdk_ringbuffer_cut(&text, buffer, 0, used, "+HTTPACTION: ", "\r\n");
    if(find==0){
        response->code=kA7670C_Response_Code_OK;
        sdk_ringbuffer_iter_init(&iter, &text);
        if(sdk_ringbuffer_iter(&iter, ",")!=0) /*method*/
        {
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }
        if(sdk_ringbuffer_iter(&iter, ",")==0) /*status_code*/
        {
            response->status_code = (int)sdk_ringbuffer_iter_strtoul(&iter, 0);
        }else{
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }

        if(sdk_ringbuffer_iter(&iter, ",")==0) /*datalen*/
        {
            response->data_length = sdk_ringbuffer_iter_strtoul(&iter, 10);
        }else{
            response->data_length = -1;
        }

        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
        response->code=kA7670C_Response_Code_ERROR;
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}
A7670C_Result A7670C_HTTPACTION_Write(A7670C_HTTPACTION_Write_Response* response, A7670C_HTTPACTION_Method method, uint32_t timeout_ms){
    return A7670C_RequestWithArgs(Write_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPACTION=%d\r\n", method);
}

