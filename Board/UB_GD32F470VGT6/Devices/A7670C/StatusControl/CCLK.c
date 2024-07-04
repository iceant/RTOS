#include <CCLK.h>
#include <stdio.h>
////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Test_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    bool* result = (bool*)ud;
    if(sdk_ringbuffer_find_str(buffer,0, "OK\r\n")!=-1){
        *result = true;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CCLK_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CCLK=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CCLK_Read_Response* result = (A7670C_CCLK_Read_Response*)ud;
    sdk_ringbuffer_text_t find_result;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束*/){
        int find = sdk_ringbuffer_cut(&find_result,buffer, 0, sdk_ringbuffer_used(buffer),"+CCLK: ", "\r\n");
        if(find==0){
            result->code = kA7670C_Response_Code_OK;
            int size = find_result.end - find_result.start - 2 ;
            sdk_ringbuffer_memcpy(result->time, buffer, find_result.start+1, size);
            result->time[size] = '\0';
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


A7670C_Result A7670C_CCLK_Read(A7670C_CCLK_Read_Response* result, uint32_t timeout_ms)
{
    result->code = kA7670C_Response_Code_ERROR;
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CCLK?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CCLK_Write_Response* result = (A7670C_CCLK_Write_Response*)ud;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束: 成功*/){
        result->code = kA7670C_Response_Code_OK;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
        result->code = kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CCLK_Write(A7670C_CCLK_Write_Response* result, const char* time, uint32_t timeout_ms)
{
    A7670C_Result err;
    result->code = kA7670C_Response_Code_ERROR;
    err = A7670C_RequestWithArgs("CCLK_Write", Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CCLK=\"%s\"\r\n", time);
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////


A7670C_CCLK_DateTime* A7670C_CCLK_ToDateTime(A7670C_CCLK_DateTime* result, const A7670C_CCLK_Read_Response* input)
{
    char* pEnd = 0;
    result->year = strtol(input->time, &pEnd, 10) + 2000; /* 2 位数表示的年 需要加上 2000*/
    result->month = strtol(pEnd+1, &pEnd, 10);
    result->day = strtol(pEnd+1, &pEnd, 10);
    result->hour = strtol(pEnd+1, &pEnd, 10);
    result->min = strtol(pEnd+1, &pEnd, 10);
    result->sec = strtol(pEnd+1, &pEnd, 10);
    result->timezone = strtol(pEnd+1, 0, 10);

    return result;
}

