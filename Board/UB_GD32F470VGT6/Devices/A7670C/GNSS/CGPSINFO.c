#include <CGPSINFO.h>
#include <sdk_ringbuffer.h>
#include <sdk_hex.h>
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

A7670C_Result A7670C_CGPSINFO_Test(bool* result, uint32_t timeout_ms)
{
    return A7670C_RequestWithCmd(__FUNCTION__, Test_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGPSINFO=?\r\n");
}

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CGPSINFO_Read_Response * response = ud;
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        response->code = kA7670C_Response_Code_OK;
        sdk_ringbuffer_text_t text;
        int cut = sdk_ringbuffer_cut(&text, buffer, 0, sdk_ringbuffer_used(buffer), "+CGPSINFO: ", "\r\n");
        if(cut==RB_SUCCESS){
            response->time = sdk_ringbuffer_strtoul(buffer, text.start+10, 0, 10);
        }
        
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CGPSINFO_Read(A7670C_CGPSINFO_Read_Response* result, uint32_t timeout_ms)
{
    result->code = kA7670C_Response_Code_ERROR;
    return A7670C_RequestWithCmd(__FUNCTION__, Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGPSINFO?\r\n");
}

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CGPSINFO_Write_Response * response = ud;
    sdk_ringbuffer_text_t text;
    if(sdk_ringbuffer_cut(&text, buffer, 0, sdk_ringbuffer_used(buffer), "+CGPSINFO: ", "\r\n")==0){
        response->code = kA7670C_Response_Code_OK;
        #if 0
        int count = sdk_ringbuffer_count(buffer, text.start+10, text.end, ",");
        switch (count) {
            case 0:{
                
                break;
            }
        }
        #endif
        
        sdk_ringbuffer_memcpy((uint8_t*)response->info, buffer,  text.start+11, text.end - (text.start+11));
        
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    A7670C_HANDLE_OK_ERROR;
    
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CGPSINFO_Write(A7670C_CGPSINFO_Write_Response* result
        , uint8_t time
        , uint32_t timeout_ms)
{
    result->code = kA7670C_Response_Code_ERROR;
    return A7670C_RequestWithArgs("CGPSINFO_Write",Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGPSINFO=%d\r\n", time);
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Exec_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CGPSINFO_Exec_Response * response = ud;
    sdk_ringbuffer_text_t text;
    if(sdk_ringbuffer_cut(&text, buffer, 0, sdk_ringbuffer_used(buffer), "+CGPSINFO: ", "\r\n")==0){
        response->code = kA7670C_Response_Code_OK;
        
        sdk_ringbuffer_memcpy((uint8_t*)response->info, buffer,  text.start+11, text.end - (text.start+11));
        
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    A7670C_HANDLE_OK_ERROR;
    
    return kA7670C_RxHandler_Result_CONTINUE;
}

/* Set Default Value 3 */
A7670C_Result A7670C_CGPSINFO_Exec(A7670C_CGPSINFO_Exec_Response* result, uint32_t timeout_ms)
{
    result->code = kA7670C_Response_Code_ERROR;
    return A7670C_RequestWithCmd(__FUNCTION__, Exec_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGPSINFO\r\n");
}
