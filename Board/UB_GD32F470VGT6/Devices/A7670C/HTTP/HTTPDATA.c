#include <HTTPDATA.h>


////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_HTTPDATA_Write_Request{
    A7670C_HTTPDATA_Write_Response* response;
    uint8_t * data;
    int data_size;
    os_bool_t data_send_flag;
}A7670C_HTTPDATA_Write_Request;

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t* buffer, void* ud){
    A7670C_HTTPDATA_Write_Request* request = (A7670C_HTTPDATA_Write_Request*)ud;
    if(request->data_send_flag==OS_TRUE && sdk_ringbuffer_find_str(buffer,0, "OK\r\n")!=-1){
        request->response->code = kA7670C_Response_Code_OK;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "DOWNLOAD\r\n")!=-1){
        A7670C_Send(request->data, request->data_size);
        request->data_send_flag = OS_TRUE;
        return kA7670C_RxHandler_Result_CONTINUE;
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
        request->response->code = kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}
A7670C_Result A7670C_HTTPDATA_Write(A7670C_HTTPDATA_Write_Response * response
        , uint8_t * data
        , int data_size /*1-153600 bytes*/
        , int time /*10s-65535s*/
        , uint32_t timeout_ms)
{
    A7670C_HTTPDATA_Write_Request request = {.response = response, .data = data, .data_size = data_size, .data_send_flag=OS_FALSE};
    return A7670C_RequestWithArgs("HTTPDATA_Write",Write_Handler, &request, os_tick_from_millisecond(timeout_ms), "AT+HTTPDATA=%d,%d\r\n", data_size, time);
}
