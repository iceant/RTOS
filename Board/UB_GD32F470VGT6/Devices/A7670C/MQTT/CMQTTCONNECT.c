#include <CMQTTCONNECT.h>

#include <string.h>
#include <assert.h>
#include <stdio.h>
#include <sdk_hex.h>
////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Test_Handler(sdk_ringbuffer_t * buffer, void* ud)
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

A7670C_Result A7670C_CMQTTCONNECT_Test(bool* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTCONNECT=?\r\n");
    if(err==kA7670C_Result_TIMEOUT){
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static void handle_record(sdk_ringbuffer_text_t * find_result, int client_index, A7670C_CMQTTCONNECT_Read_Response* result){
    int column_count = sdk_ringbuffer_count(find_result->buffer, find_result->start, find_result->end, ",");
    switch (column_count) {
        case 0: /*只有 client_index*/{
            result->records[client_index].client_index = sdk_ringbuffer_strtoul(find_result->buffer, find_result->start, 0, 0);
            break;
        }
        case 3:{
            /* 0[,<server_addr>,<keepalive_time>,<clean_session>] */
            sdk_ringbuffer_iter_t iter;
            sdk_ringbuffer_iter_init(&iter, find_result);
            
            int next = sdk_ringbuffer_iter(&iter, ",");
            result->records[client_index].client_index = (int)sdk_ringbuffer_iter_strtoul(&iter, 0); /* client_index */
            
            next = sdk_ringbuffer_iter(&iter, ","); /* server_addr */
            int size = iter.end - iter.start - 2;
            if(size>0){
//                rt_memcpy(result->records[client_index].server_addr, iter.start+1 /*跳过引号*/, size);
                sdk_ringbuffer_memcpy((uint8_t*)result->records[client_index].server_addr, find_result->buffer, iter.start+1, size);
            }
            result->records[client_index].server_addr[size] = '\0';
            
            next = sdk_ringbuffer_iter(&iter, ","); /* keepalive_time */
            result->records[client_index].keepalive_time= sdk_ringbuffer_iter_strtoul(&iter, 0);
            
            next = sdk_ringbuffer_iter(&iter, ","); /*clean_session: 0 or 1*/
            result->records[client_index].clean_session = sdk_ringbuffer_iter_strtoul(&iter, 0)==0?false:true;
            
            break;
        }
        case 4:{
            /* 0[,<server_addr>,<keepalive_time>,<clean_session>,<user_name>] */
            sdk_ringbuffer_iter_t iter;
            sdk_ringbuffer_iter_init(&iter, find_result);

            int next = sdk_ringbuffer_iter(&iter, ",");
            result->records[client_index].client_index = (int)sdk_ringbuffer_iter_strtoul(&iter, 0); /* client_index */

            next = sdk_ringbuffer_iter(&iter, ","); /* server_addr */
            int size = iter.end - iter.start - 2;
            if(size>0){
                sdk_ringbuffer_memcpy((uint8_t*)result->records[client_index].server_addr, find_result->buffer, iter.start+1, size);
            }
            result->records[client_index].server_addr[size] = '\0';

            next = sdk_ringbuffer_iter(&iter, ","); /* keepalive_time */
            result->records[client_index].keepalive_time= sdk_ringbuffer_iter_strtoul(&iter, 0);

            next = sdk_ringbuffer_iter(&iter, ","); /*clean_session: 0 or 1*/
            result->records[client_index].clean_session = sdk_ringbuffer_iter_strtoul(&iter, 0)==0?false:true;
            
            next = sdk_ringbuffer_iter(&iter, ","); /*user_name*/
            size = iter.end - iter.start - 2;
            if(size>0){
//                rt_memcpy(result->records[client_index].username, iter.start+1 /*跳过引号*/, size);
                sdk_ringbuffer_memcpy((uint8_t*)result->records[client_index].username, find_result->buffer, iter.start+1, size);
            }
            result->records[client_index].username[size] = '\0';
            
            break;
        }
        case 5:{
            /* 0[,<server_addr>,<keepalive_time>,<clean_session>,<user_name>,<pass_word>] */
            sdk_ringbuffer_iter_t iter;
            sdk_ringbuffer_iter_init(&iter, find_result);

            int next = sdk_ringbuffer_iter(&iter, ",");
            result->records[client_index].client_index = (int)sdk_ringbuffer_iter_strtoul(&iter, 0); /* client_index */

            next = sdk_ringbuffer_iter(&iter, ","); /* server_addr */
            int size = iter.end - iter.start - 2;
            if(size>0){
                sdk_ringbuffer_memcpy((uint8_t*)result->records[client_index].server_addr, find_result->buffer, iter.start+1, size);
            }
            result->records[client_index].server_addr[size] = '\0';

            next = sdk_ringbuffer_iter(&iter, ","); /* keepalive_time */
            result->records[client_index].keepalive_time= sdk_ringbuffer_iter_strtoul(&iter, 0);

            next = sdk_ringbuffer_iter(&iter, ","); /*clean_session: 0 or 1*/
            result->records[client_index].clean_session = sdk_ringbuffer_iter_strtoul(&iter, 0)==0?false:true;

            next = sdk_ringbuffer_iter(&iter, ","); /*user_name*/
            size = iter.end - iter.start - 2;
            if(size>0){
//                rt_memcpy(result->records[client_index].username, iter.start+1 /*跳过引号*/, size);
                sdk_ringbuffer_memcpy((uint8_t*)result->records[client_index].username, find_result->buffer, iter.start+1, size);
            }
            result->records[client_index].username[size] = '\0';
            
            next = sdk_ringbuffer_iter(&iter, ","); /*pass_word*/
            size = iter.end - iter.start - 2;
            if(size>0){
//                rt_memcpy(result->records[client_index].username, iter.start+1 /*跳过引号*/, size);
                sdk_ringbuffer_memcpy((uint8_t*)result->records[client_index].password, find_result->buffer, iter.start+1, size);
            }
            result->records[client_index].password[size] = '\0';
            
            break;
        }
    }
}

static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t *buffer, void* ud)
{
    A7670C_CMQTTCONNECT_Read_Response* result = (A7670C_CMQTTCONNECT_Read_Response*)ud;
    sdk_ringbuffer_text_t find_result;
    
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1 /*接收结束*/){
        result->code=kA7670C_Response_Code_OK;

        int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTCONNECT: ", "\r\n");
        if(find==0){
            handle_record(&find_result, 0, result);
            
            find = sdk_ringbuffer_cut(&find_result, buffer, find_result.end, sdk_ringbuffer_used(buffer), "+CMQTTCONNECT: ", "\r\n");
            if(find==0){
                handle_record(&find_result, 1, result);
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


A7670C_Result A7670C_CMQTTCONNECT_Read(A7670C_CMQTTCONNECT_Read_Response* result, uint32_t timeout_ms)
{
    A7670C_Result err = A7670C_RequestWithCmd(__FUNCTION__, Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CMQTTCONNECT?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t * buffer, void* ud)
{
    A7670C_CMQTTCONNECT_Write_Response* result = (A7670C_CMQTTCONNECT_Write_Response*)ud;
    
    sdk_ringbuffer_text_t find_result;
    int find = sdk_ringbuffer_cut(&find_result, buffer, 0, sdk_ringbuffer_used(buffer), "+CMQTTCONNECT: ", "\r\n");
    if(find==0){
        result->code = kA7670C_Response_Code_OK;
        sdk_ringbuffer_iter_t iter;
        sdk_ringbuffer_iter_init(&iter, &find_result);

        sdk_ringbuffer_iter(&iter, ","); /* client_index */
        result->client_index = sdk_ringbuffer_iter_strtoul(&iter, 0);

        sdk_ringbuffer_iter(&iter, ","); /*err*/
        result->err_code = sdk_ringbuffer_iter_strtoul(&iter, 0);
        if(result->err_code==0){
            printf("Write_Handler: 1\n");
            sdk_hex_dump("CMQTTCONNECT", buffer->buffer, sdk_ringbuffer_used(buffer));
            /*
             OK
             
             +CMQTTCONNECT: <client_index>,0
             */
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }
        
        /*虽然获得了错误代码，但是有两种可能，因此要判断之前是否有 OK */
        if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
            /*
             OK
             
             +CMQTTCONNECT: <client_index>,<err>
             */
            
            result->code = kA7670C_Response_Code_OK;

            printf("Write_Handler: 2\n");
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }
        
        if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
            /*
             +CMQTTCONNECT: <client_index>,<err>
             
             ERROR\r\n
             */

//            printf("Write_Handler: 3\n");
            sdk_hex_dump("CMQTTCONNECT", buffer->buffer, sdk_ringbuffer_used(buffer));
            result->code=kA7670C_Response_Code_ERROR;
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_DONE;
        }

        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1 /*接收结束: 错误*/){
        
        result->code = kA7670C_Response_Code_ERROR;
//        printf("Write_Handler: 4\n");
        sdk_hex_dump("CMQTTCONNECT ERROR", buffer->buffer, sdk_ringbuffer_used(buffer));
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CMQTTCONNECT_Write(A7670C_CMQTTCONNECT_Write_Response* result
        , int client_index
        , const char* server_addr
        , int keepalive_time
        , bool clean_session
        , const char* username
        , const char* password
        , uint32_t timeout_ms)
{
    A7670C_Result err;

    assert(result);
    assert(client_index>=0);
    assert(server_addr);
    assert(keepalive_time>=1 && keepalive_time<=64800);

    int username_size = strlen(username);
    int password_size = strlen(password);
    result->err_code = -1;
    result->code = kA7670C_Response_Code_ERROR;

    if(username!=0 && password!=0){
        err = A7670C_RequestWithArgs(__FUNCTION__ ,Write_Handler, result, os_tick_from_millisecond(timeout_ms)
                , "AT+CMQTTCONNECT=%d,\"%s\",%d,%d,\"%s\",\"%s\"\r\n"
                , client_index
                , server_addr
                , keepalive_time
                , clean_session
                , username
                , password
        );
    }else if(username!=0 && username_size>0){
        err = A7670C_RequestWithArgs(__FUNCTION__,Write_Handler, result,  os_tick_from_millisecond(timeout_ms)
                , "AT+CMQTTCONNECT=%d,\"%s\",%d,%d,\"%s\"\r\n"
                , client_index
                , server_addr
                , keepalive_time
                , clean_session
                , username
        );
    }else{
        err = A7670C_RequestWithArgs(__FUNCTION__,Write_Handler, result,  os_tick_from_millisecond(timeout_ms)
                , "AT+CMQTTCONNECT=%d,\"%s\",%d,%d\r\n"
                , client_index
                , server_addr
                , keepalive_time
                , clean_session
        );
    }
    
    return err;
}
