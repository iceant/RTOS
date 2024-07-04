#include <CMQTTWILLTOPIC.h>
#include <string.h>
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

A7670C_Result A7670C_CMQTTWILLTOPIC_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTWILLTOPIC=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTWILLTOPIC_Write_Request{
    A7670C_CMQTTWILLTOPIC_Write_Response* response;
    const char* topic;
    int topic_length;
    bool send_flag;
}A7670C_CMQTTWILLTOPIC_Write_Request;

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CMQTTWILLTOPIC_Write_Request* result = (A7670C_CMQTTWILLTOPIC_Write_Request*)ud;
    
    if(sdk_ringbuffer_find_str(buffer, 0, ">\r\n")!=-1 /*接收结束: 成功*/ && result->send_flag==false){
        A7670C_Send((uint8_t*)result->topic, result->topic_length);
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
        result->response->code=kA7670C_Response_Code_ERROR;
        
        sdk_ringbuffer_text_t find_text;
        int find_status = sdk_ringbuffer_cut(&find_text, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTWILLTOPIC: ", "\r\n");
        if(find_status==0){
            int pEnd = 0;
            result->response->client_index = sdk_ringbuffer_strtoul(buffer, find_text.start, &pEnd, 0);
            result->response->err_code = sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
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


A7670C_Result A7670C_CMQTTWILLTOPIC_Write(A7670C_CMQTTWILLTOPIC_Write_Response* result
        , int client_index
        , const char* topic
        , uint32_t timeout_ms)
{
    int topic_length = strlen(topic);
    A7670C_CMQTTWILLTOPIC_Write_Request request={.response=result, .topic = topic, .topic_length=topic_length, .send_flag=false};
    A7670C_Result err = A7670C_RequestWithArgs("CMQTTWILLTOPIC_Write",Write_Handler, &request, os_tick_from_millisecond(timeout_ms), "AT+CMQTTWILLTOPIC=%d,%d\r\n"
            , client_index
            , topic_length);
    return err;
}
