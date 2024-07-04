#include <CGNSSPWR.h>
#include <sdk_ringbuffer.h>
#include <os_kernel.h>
#include <sdk_hex.h>

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Test_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    bool * result = ud;
    int find = sdk_ringbuffer_find_str(buffer, 0, "OK\r\n");
    if(find!=-1){
        *result = true;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CGNSSPWR_Test(bool* result, uint32_t timeout_ms)
{
    return A7670C_RequestWithCmd(__FUNCTION__, Test_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGNSSPWR=?\r\n");
}

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CGNSSPWR_Write_Response* response = ud;
    if(sdk_ringbuffer_find_str(buffer, 0, "+CGNSSPWR: READY!")!=-1 || sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1)
    {
        response->code = kA7670C_Response_Code_OK;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
        sdk_hex_dump("CGNSSPWR_WRITE", buffer->buffer, sdk_ringbuffer_used(buffer));
        response->code = kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CGNSSPWR_Write(A7670C_CGNSSPWR_Write_Response* result
        , int GNSS_Power_Status
        , int AP_Flash_Status
        , uint32_t timeout_ms)
{
    result->code = kA7670C_Response_Code_ERROR;
    return A7670C_RequestWithArgs("CGNSSPWR_Write",Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGNSSPWR=%d,%d\r\n"
        , GNSS_Power_Status
        , AP_Flash_Status);
}

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CGNSSPWR_Read_Response* response = ud;
    sdk_ringbuffer_text_t text;
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        response->code = kA7670C_Response_Code_OK;
        int cut_result = sdk_ringbuffer_cut(&text, buffer, 0, sdk_ringbuffer_used(buffer), "+CGNSSPWR: ", "\r\n");
        if(cut_result==0){
            response->GNSS_Power_Status = (int)sdk_ringbuffer_strtoul(buffer, text.start + 11, 0, 10);
            int find = sdk_ringbuffer_find_str(buffer, text.start+11, ",");
            if(find!=-1){
                response->AP_Flash_Status = (int)sdk_ringbuffer_strtoul(buffer, find+1, 0, 10);
            }
        }
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CGNSSPWR_Read(A7670C_CGNSSPWR_Read_Response* result
        , uint32_t timeout_ms)
{
    return A7670C_RequestWithCmd(__FUNCTION__, Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGNSSPWR?\r\n");
}
