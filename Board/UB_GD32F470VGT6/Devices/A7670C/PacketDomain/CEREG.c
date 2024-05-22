#include <CEREG.h>

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

A7670C_Result A7670C_CEREG_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CEREG=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CEREG_Read_Response* result = (A7670C_CEREG_Read_Response*)ud;
    sdk_ringbuffer_text_t find_result;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束*/){
        result->code=kA7670C_Response_Code_OK;
        int find = sdk_ringbuffer_cut(&find_result,buffer, 0, sdk_ringbuffer_used(buffer),"+CEREG: ", "\r\n");
        if(find==0){
            int pEnd=0;
            int nCount = sdk_ringbuffer_count(buffer, find_result.start, find_result.end, ",");
//            rt_kprintf("',' count=%d\n", nCount);
            switch (nCount) {
                case 0:{
                    result->n = sdk_ringbuffer_strtoul(buffer, find_result.start, &pEnd, 0);
                    break;
                }
                case 1:{
                    result->n = sdk_ringbuffer_strtoul(buffer, find_result.start, &pEnd, 0);
                    result->stat= sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
                    break;
                }
                case 2:{
                    result->n = sdk_ringbuffer_strtoul(buffer, find_result.start, &pEnd, 0);
                    result->stat= sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
                    result->lac = sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
                    break;
                }
                case 3:{
                    result->n = sdk_ringbuffer_strtoul(buffer, find_result.start, &pEnd, 0);
                    result->stat= sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
                    result->lac = sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
                    result->ci = sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
                    break;
                }
                default:
                    break;
            }
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }else{
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;
        }
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束*/){
        result->code = kA7670C_Response_Code_ERROR;
        result->err_code = -1;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "+CME ERROR: ")!=-1 /*接收结束*/){
        result->code = kA7670C_Response_Code_ERROR;
        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer), "+CME ERROR: ", "\r\n");
        if(find==0){
            result->err_code = sdk_ringbuffer_strtoul(buffer, find_result.start,0, 0);
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


A7670C_Result A7670C_CEREG_Read(A7670C_CEREG_Read_Response* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGREG?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CEREG_Write_Response* result = (A7670C_CEREG_Write_Response*)ud;

    if(sdk_ringbuffer_find_str(buffer, 0,  "OK\r\n")!=-1 /*接收结束: 成功*/){
        result->code=kA7670C_Response_Code_OK;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
        result->code = kA7670C_Response_Code_ERROR;
        result->err_code = -1;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "+CME ERROR: ")!=-1 /*接收结束*/){
        result->code = kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_text_t find_result;
        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer),"+CME ERROR: ", "\r\n");
        if(find==0){
            result->err_code = sdk_ringbuffer_strtoul(buffer, find_result.start, 0, 0);
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


A7670C_Result A7670C_CEREG_Write(A7670C_CEREG_Write_Response* result, int n, uint32_t timeout_ms)
{
    A7670C_Result err;
    result->err_code = -1;
    err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CEREG=%d\r\n", n);
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Exec_Handler(sdk_ringbuffer_t *buffer, void* ud)
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

A7670C_Result A7670C_CEREG_Exec(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err;
    err = A7670C_RequestWithArgs(Exec_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CEREG\r\n");
    return err;
}

