#include <CSQ.h>
#include <sdk_hex.h>

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result CSQ_Test_Handler(sdk_ringbuffer_t * buffer, void* ud)
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

A7670C_Result A7670C_CSQ_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, CSQ_Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CSQ=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result CSQ_Exec_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CSQ_Exec_Response * result = (A7670C_CSQ_Exec_Response*)ud;
    sdk_ringbuffer_text_t find_result;
//
//    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束*/){
////        sdk_hex_dump("[CSQ]", buffer->buffer, sdk_ringbuffer_used(buffer));
//        result->code=kA7670C_Response_Code_OK;
////        int find = text_between(&find_result, data, data_size, "+CSQ: ", "\r\n");
//        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer),"+CSQ: ", "\r\n");
//        if(find==0){
//            int pEnd = 0;
//            result->rssi = sdk_ringbuffer_strtoul(buffer, find_result.start, &pEnd, 0);
//            result->ber = sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
//
//            sdk_ringbuffer_reset(buffer);
//            A7670C_Notify();
//            return kA7670C_RxHandler_Result_DONE;
//        }else{
//            sdk_ringbuffer_reset(buffer);
//            A7670C_Notify();
//            return kA7670C_RxHandler_Result_RESET;
//        }
//    }
    
    int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer),"+CSQ: ", "\r\n");
    if(find==0){
        result->code=kA7670C_Response_Code_OK;
        int pEnd = 0;
        result->rssi = sdk_ringbuffer_strtoul(buffer, find_result.start, &pEnd, 0);
        result->ber = sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
        
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束*/){
        sdk_hex_dump("[CSQ]", buffer->buffer, sdk_ringbuffer_used(buffer));
        result->code=kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CSQ_Exec(A7670C_CSQ_Exec_Response * result, uint32_t timeout_ms)
{
    result->rssi = -1;
    result->code = -1;
    result->ber = -1;
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, CSQ_Exec_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CSQ\r\n");
    return err;
}

