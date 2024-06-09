#include <CGNSSMODE.h>
#include <sdk_hex.h>
#include <sdk_ringbuffer.h>

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Test_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    bool * result = ud;
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        *result = true;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CGNSSMODE_Test(bool* result, uint32_t timeout_ms)
{
    return A7670C_RequestWithCmd(Test_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGNSSMODE=?\r\n");
}

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CGNSSMODE_Read_Response* response = ud;
    
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        response->code=kA7670C_Response_Code_OK;
        sdk_ringbuffer_text_t text;
        int cut = sdk_ringbuffer_cut(&text, buffer, 0, sdk_ringbuffer_used(buffer), "+CGNSSMODE: ", "\r\n");
        if(cut==0){
            response->mode = sdk_ringbuffer_strtoul(buffer, text.start+12, 0, 10);
        }
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CGNSSMODE_Read(A7670C_CGNSSMODE_Read_Response* result, uint32_t timeout_ms)
{
    result->code=kA7670C_Response_Code_ERROR;
    return A7670C_RequestWithCmd(Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGNSSMODE?\r\n");
}

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CGNSSMODE_Write_Response* response = ud;
    
    A7670C_HANDLE_OK_ERROR;
    
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CGNSSMODE_Write(A7670C_CGNSSMODE_Write_Response* result, A7670C_CGNSSMODE_T mode, uint32_t timeout_ms)
{
    return A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGNSSMODE=%d\r\n", mode);
}

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Exec_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CGNSSMODE_Exec_Response* response = ud;
    
    A7670C_HANDLE_OK_ERROR;
    
    return kA7670C_RxHandler_Result_CONTINUE;
}
/* Set Default Value 3 */
A7670C_Result A7670C_CGNSSMODE_Exec(A7670C_CGNSSMODE_Exec_Response* result, uint32_t timeout_ms){
    return A7670C_RequestWithCmd(Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGNSSMODE\r\n");
}
