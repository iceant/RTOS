#include <CGACT.h>

#include <string.h>
#include <assert.h>
#include <stdio.h>
////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Test_Handler(sdk_ringbuffer_t *buffer, void *ud) {
    bool *result = (bool *) ud;
    if (sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")) {
        *result = true;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CGACT_Test(bool *result, uint32_t timeout_ms) {
    A7670C_Result err = A7670C_RequestWithCmd(Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CGACT=?\r\n");
    if (err == kA7670C_Result_TIMEOUT) {
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t *buffer, void *ud) {
    A7670C_CGACT_Read_Response *result = (A7670C_CGACT_Read_Response *) ud;
    sdk_ringbuffer_text_t find_result;
    sdk_ringbuffer_iter_t iter;
    int find;
    int record_count = 0;
    int find_start = 0;
    int find_end = 0;
    
    if (sdk_ringbuffer_find_str(buffer, 0, "OK\r\n") != -1 /*接收结束*/) {
        printf("CGACT_Read_Handler: Got OK!\n");
        result->code = kA7670C_Response_Code_OK;
        find_end = sdk_ringbuffer_used(buffer);
        while(1) {
            find = sdk_ringbuffer_cut(&find_result, buffer, find_start, find_end, "+CGACT: ", "\r\n");
            if (find == 0) {
                record_count += 1;

                sdk_ringbuffer_iter_init(&iter, &find_result);

                if (sdk_ringbuffer_iter(&iter, ",") == 0) {
                    /*cid*/
                    result->records[record_count].cid = (int)sdk_ringbuffer_strtoul(buffer, iter.start, 0, 0);
                }

                if (sdk_ringbuffer_iter(&iter, ",") == 0) {
                    /*state*/
                    result->records[record_count].state = (int)sdk_ringbuffer_strtoul(buffer, iter.start, 0, 0);
                }
                
                find_start = iter.end;

            }else{
                break;
            }
        }

        result->record_count = record_count;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CGACT_Read(A7670C_CGACT_Read_Response *result, uint32_t timeout_ms) {
    assert(result);
    result->err_code = -1;
    result->record_count = 0;
    A7670C_Result err = A7670C_RequestWithCmd(Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGACT?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t *buffer, void *ud) {
    A7670C_CGACT_Write_Response *result = (A7670C_CGACT_Write_Response *) ud;

    if (sdk_ringbuffer_find_str(buffer, 0, "OK\r\n") != -1 /*接收结束: 成功*/) {
        result->code = kA7670C_Response_Code_OK;
        result->err_code = -1;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if (sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n") != -1 /*接收结束: 错误*/) {
        result->code = kA7670C_Response_Code_ERROR;
        result->err_code = -1;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "+CME ERROR: ")!=-1 /*接收结束*/){
        sdk_ringbuffer_text_t find_result;
        result->code = kA7670C_Response_Code_ERROR;
        int find = sdk_ringbuffer_cut(&find_result,buffer, 0, sdk_ringbuffer_used(buffer), "+CME ERROR: ", "\r\n");
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


A7670C_Result A7670C_CGACT_Write(A7670C_CGACT_Write_Response *result,
                                   int state,
                                   int cid,
                                   uint32_t timeout_ms) {
    A7670C_Result err;
    assert(result);
    result->err_code = -1;

    err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms),
                                 "AT+CGACT=%d,%d\r\n", state, cid
    );

    return err;
}

