#include <CMQTTSUB.h>

#include <string.h>
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

A7670C_Result A7670C_CMQTTSUB_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTSUB=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CMQTTSUB_Write_Response* result = (A7670C_CMQTTSUB_Write_Response*)ud;
    
    sdk_ringbuffer_text_t find_text;
    int find_status = sdk_ringbuffer_cut(&find_text, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTSUB: ", "\r\n");
    if(find_status==0){
        int pEnd = 0;
        result->client_index = sdk_ringbuffer_strtoul(buffer, find_text.start,  &pEnd, 0);
        result->err_code = sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
        
        if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
            result->code = kA7670C_Response_Code_OK;
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
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
        result->code = kA7670C_Response_Code_ERROR;
        result->err_code = -1;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTSUB_Write(A7670C_CMQTTSUB_Write_Response* result
        , int client_index
        , A7670C_Bool dup
        , uint32_t timeout_ms)
{
    A7670C_Result err;
    if(dup!=kA7670C_Bool_Unspecified){
        err = A7670C_RequestWithArgs("CMQTTSUB_Write",Write_Handler, result, os_tick_from_millisecond(timeout_ms)
                , "AT+CMQTTSUB=%d,%d\r\n"
                , client_index
                , dup
                );
    }else{
        err = A7670C_RequestWithArgs("CMQTTSUB_Write",Write_Handler, result, os_tick_from_millisecond(timeout_ms)
                , "AT+CMQTTSUB=%d\r\n"
                , client_index
        );
    }
    
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTSUB_Write2_Request{
    A7670C_CMQTTSUB_Write_Response * response;
    const char* topic;
    int topic_length;
    bool send_flag;
}A7670C_CMQTTSUB_Write2_Request;

static uint8_t token[]={0x3E, 0x0D, 0x0A}; /* >\r\n */
static A7670C_RxHandler_Result Write2_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CMQTTSUB_Write2_Request* result = (A7670C_CMQTTSUB_Write2_Request*)ud;

    printf("[CMQTTSUB] send_flag=%d\n", result->send_flag);

    int find = sdk_ringbuffer_find(buffer, 0, token, OS_ARRAY_SIZE(token));
    if(find!=-1 && result->send_flag==false){
        sdk_hex_dump("[CMQTTSUB-0]", buffer->buffer, sdk_ringbuffer_used(buffer));
        sdk_ringbuffer_reset(buffer);
        result->send_flag = true;
        A7670C_Send((uint8_t*)result->topic, result->topic_length);
        return kA7670C_RxHandler_Result_CONTINUE;
    }

    sdk_hex_dump("[CMQTTSUB-x]", buffer->buffer, sdk_ringbuffer_used(buffer));

    sdk_ringbuffer_text_t find_text;
    int find_status = sdk_ringbuffer_cut(&find_text, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTSUB: ", "\r\n");
    if(find_status==0){
        int pEnd = 0;
        result->response->client_index = sdk_ringbuffer_strtoul(buffer, find_text.start, &pEnd, 0);
        result->response->err_code = sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
        
        if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束: 成功*/){
            result->response->code=kA7670C_Response_Code_OK;
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }
        
        if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
            sdk_hex_dump("[CMQTTSUB-ERR1]", buffer->buffer, sdk_ringbuffer_used(buffer));
            result->response->code = kA7670C_Response_Code_ERROR;
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
        sdk_hex_dump("[CMQTTSUB-ERR2]", buffer->buffer, sdk_ringbuffer_used(buffer));

        result->response->code=kA7670C_Response_Code_ERROR;
        result->response->err_code = -1;

        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTSUB_Write2(A7670C_CMQTTSUB_Write_Response* result
        , int client_index
        , const char* topic
        , A7670C_Qos qos
        , A7670C_Bool dup
        , uint32_t timeout_ms)
{
    result->err_code=-1;
    int topic_length = strlen(topic)+1;
    A7670C_CMQTTSUB_Write2_Request request = {.response = result, .topic = topic, .topic_length=topic_length, .send_flag=false};
    A7670C_Result err;
    if(dup==kA7670C_Bool_Unspecified){
        err = A7670C_RequestWithArgs("CMQTTSUB_Write2",Write2_Handler, &request, os_tick_from_millisecond(timeout_ms)
                , "AT+CMQTTSUB=%d,%d,%d\r\n"
                , client_index
                , topic_length
                , qos
                );
        
    }else{
        err = A7670C_RequestWithArgs("CMQTTSUB_Write2",Write2_Handler, &request, os_tick_from_millisecond(timeout_ms)
                , "AT+CMQTTSUB=%d,%d,%d,%d\r\n"
                , client_index
                , topic_length
                , qos
                , dup
                );
        
    }
    
    return err;
}