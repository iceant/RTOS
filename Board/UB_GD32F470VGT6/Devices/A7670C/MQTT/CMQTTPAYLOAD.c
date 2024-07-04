#include <CMQTTPAYLOAD.h>
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

A7670C_Result A7670C_CMQTTPAYLOAD_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTPAYLOAD=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTPAYLOAD_Write_Request{
    A7670C_CMQTTPAYLOAD_Write_Response* response;
    uint8_t * data;
    int data_size;
    bool send_flag;
}A7670C_CMQTTPAYLOAD_Write_Request;

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CMQTTPAYLOAD_Write_Request* result = (A7670C_CMQTTPAYLOAD_Write_Request*)ud;
    
    if(sdk_ringbuffer_find_str(buffer, 0, ">\r\n")!=-1 /*接收结束: 成功*/ && result->send_flag==false){
//        sdk_ringbuffer_reset(buffer);
        A7670C_Send((uint8_t*)result->data, result->data_size);
        result->send_flag = true;
        return kA7670C_RxHandler_Result_CONTINUE;
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束: 成功*/){
        result->response->code=kA7670C_Response_Code_OK;
        result->response->err_code = 0;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
        sdk_hex_dump("CMQTTPAYLOAD", buffer->buffer, sdk_ringbuffer_used(buffer));
        result->response->code=kA7670C_Response_Code_ERROR;
        
        sdk_ringbuffer_text_t find_text;
        int find_status = sdk_ringbuffer_cut(&find_text, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTPAYLOAD: ", "\r\n");
        if(find_status==0){
            int pEnd = 0;
            result->response->client_index = (long)sdk_ringbuffer_strtoul(buffer, find_text.start, &pEnd, 0);
            result->response->err_code = (long)sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
        }else{
            /* 一般错误，没有错误号 */
            result->response->err_code = -1;
        }
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTPAYLOAD_Write(A7670C_CMQTTPAYLOAD_Write_Response* result
        , int client_index
        , uint8_t * data
        , int data_size
        , uint32_t timeout_ms)
{
    result->code = kA7670C_Response_Code_ERROR;
    result->err_code = -1;
    A7670C_CMQTTPAYLOAD_Write_Request request={.response=result, .data = data, .data_size=data_size, .send_flag = false};
//    sdk_hex_dump("CMQTTPAYLOAD_PARAM", data, data_size);
    A7670C_Result err = A7670C_RequestWithArgs("CMQTTPAYLOAD_Write",Write_Handler, &request, os_tick_from_millisecond(timeout_ms), "AT+CMQTTPAYLOAD=%d,%d\r\n"
            , client_index
            , data_size);
    return err;
}
