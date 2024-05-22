#include <HTTPHEAD.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Exec_Handler(sdk_ringbuffer_t *buffer, void* ud){
    A7670C_HTTPHEAD_Exec_Response* response = (A7670C_HTTPHEAD_Exec_Response*)ud;
    sdk_ringbuffer_text_t text;
    int pos = sdk_ringbuffer_find_str(buffer, 0, "\r\nOK\r\n");
    if(pos!=-1){
        response->code = kA7670C_Response_Code_OK;
        if(sdk_ringbuffer_cut(&text, buffer, 0, sdk_ringbuffer_used(buffer), "+HTTPHEAD: ", "\r\n")==0){
            response->data_len = (int)sdk_ringbuffer_strtoul(buffer, text.start, 0, 0);
        }
        memset(response->data, 0, sizeof(response->data));
        int size = response->data_len>(sizeof(response->data)-1)?(sizeof(response->data)-1):response->data_len;
        sdk_ringbuffer_memcpy(response->data, buffer, text.end+2, size);
        response->data[size]='\0';
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
A7670C_Result A7670C_HTTPHEAD_Exec(A7670C_HTTPHEAD_Exec_Response* response, uint32_t timeout_ms)
{
    return A7670C_RequestWithCmd(Exec_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPHEAD\r\n");
}

