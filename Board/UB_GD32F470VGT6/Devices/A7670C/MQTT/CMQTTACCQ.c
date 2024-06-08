#include <CMQTTACCQ.h>

#include <string.h>
#include <stdio.h>
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

A7670C_Result A7670C_CMQTTACCQ_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTACCQ=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CMQTTACCQ_Read_Response* result = (A7670C_CMQTTACCQ_Read_Response*)ud;
    sdk_ringbuffer_text_t find_result;
    int size;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束*/){
        result->code = kA7670C_Response_Code_OK;
        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTACCQ: ", "\r\n");
        if(find==0){
            sdk_hex_dump("CMQTTACCQ", buffer->buffer, sdk_ringbuffer_used(buffer));
            sdk_ringbuffer_iter_t iter;
            sdk_ringbuffer_iter_init(&iter, &find_result);
//            printf("CMQTTACCQ: \n");
//            for(int x=find_result.start; x<find_result.end; x++){
//                printf("%c", sdk_ringbuffer_peek(buffer, x));
//            }
//            printf("\r\n");

            ////////////////////////////////////////////////////////////////////////////////
            //// Client Index: 0
            sdk_ringbuffer_iter(&iter, ","); /* client_index */
            result->records[0].client_index = (int)sdk_ringbuffer_iter_strtoul(&iter, 0);

            sdk_ringbuffer_iter(&iter, ","); /* clientID */
            size = iter.end - iter.start - 2 /*首尾的 " 符号*/;
            if(size>0){
                sdk_ringbuffer_memcpy((uint8_t*)result->records[0].client_id, buffer, iter.start+1, size);
            }
            result->records[0].client_id[size]='\0';

            sdk_ringbuffer_iter(&iter, ","); /* server_type */
            result->records[0].server_type = (sdk_ringbuffer_iter_strtoul(&iter, 0)==0)?kA7670C_CMQTTACCQ_ServerType_TCP:kA7670C_CMQTTACCQ_ServerType_SSL_TLS;

            ////////////////////////////////////////////////////////////////////////////////
            //// Client Index: 1
            find = sdk_ringbuffer_cut(&find_result, buffer, find_result.start, sdk_ringbuffer_used(buffer), "+CMQTTACCQ: ", "\r\n");
            if(find==0){
                sdk_ringbuffer_iter_init(&iter, &find_result);

                sdk_ringbuffer_iter(&iter, ","); /* client_index */
                result->records[1].client_index = (long)sdk_ringbuffer_iter_strtoul(&iter, 0);

                sdk_ringbuffer_iter(&iter, ","); /* clientID */
                size = iter.end - iter.start - 2 /*首尾的 " 符号*/;
                if(size>0){
                    sdk_ringbuffer_memcpy((uint8_t*)result->records[0].client_id, buffer, iter.start+1, size);
                }
                result->records[1].client_id[size]='\0';

                sdk_ringbuffer_iter(&iter, ","); /* server_type */
                result->records[1].server_type = (sdk_ringbuffer_iter_strtoul(&iter, 0)==0)?kA7670C_CMQTTACCQ_ServerType_TCP:kA7670C_CMQTTACCQ_ServerType_SSL_TLS;
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
    

    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTACCQ_Read(A7670C_CMQTTACCQ_Read_Response* result, uint32_t timeout_ms)
{
    memset(result, 0, sizeof(*result));
    A7670C_Result err = A7670C_RequestWithCmd(Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTACCQ?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CMQTTACCQ_Write_Response* result = (A7670C_CMQTTACCQ_Write_Response*)ud;

    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束: 成功*/){
//        sdk_hex_dump("CMQTTACCQ WRITE", buffer->buffer, sdk_ringbuffer_used(buffer));
        result->code = kA7670C_Response_Code_OK;
        result->err_code = 0;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
        sdk_ringbuffer_text_t find_text;
        int find_status = sdk_ringbuffer_cut(&find_text, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTACCQ: ", "\r\n");
        if(find_status==0){
            int pEnd = 0;
            result->client_index = sdk_ringbuffer_strtoul(buffer, find_text.start, &pEnd, 0);
            result->err_code = sdk_ringbuffer_strtoul(buffer, pEnd+1, &pEnd, 0);
        }else{
            /* 一般错误，没有错误号 */
            result->err_code = 0;
        }

        result->code=kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTACCQ_Write(A7670C_CMQTTACCQ_Write_Response* result
        , int client_index
        , const char* client_id
        , A7670C_CMQTTACCQ_ServerType ServerType
        , uint32_t timeout_ms)
{
    result->err_code=-1;
    result->code = kA7670C_Response_Code_ERROR;
    A7670C_Result err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTACCQ=%d,\"%s\",%d\r\n"
                                               , client_index
                                               , client_id
                                               , ServerType);
    return err;
}
