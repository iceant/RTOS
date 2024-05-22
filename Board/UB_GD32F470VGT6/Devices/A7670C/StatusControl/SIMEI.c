#include <SIMEI.h>

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result SIMEI_Test_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    bool* result = (bool*)ud;
    if(sdk_ringbuffer_find_str(buffer,0, "OK\r\n")!=-1){
        *result = true;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_SIMEI_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(SIMEI_Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+SIMEI=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result SIMEI_Read_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_SIMEI_Read_Response* result = (A7670C_SIMEI_Read_Response*)ud;
    sdk_ringbuffer_text_t find_result;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束*/){
        result->code = kA7670C_Response_Code_OK;
        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer), "+SIMEI: ", "\r\n");
        if(find==0){
            int size = find_result.end - find_result.start;
            sdk_ringbuffer_memcpy((uint8_t*)result->value, buffer, find_result.start, size);
            result->value[size] = '\0';
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }else{
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_SIMEI_Read(A7670C_SIMEI_Read_Response* result, uint32_t timeout_ms)
{
    result->code = kA7670C_Response_Code_ERROR;
    A7670C_Result err = A7670C_RequestWithCmd(SIMEI_Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+SIMEI?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result SIMEI_Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    bool* result = (bool*)ud;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束: 成功*/){
        *result = true;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
        *result = false;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_SIMEI_Write(bool* result, const char* IMEI, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithArgs(SIMEI_Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+SIMEI=%s\r\n", IMEI);
    return err;
}


