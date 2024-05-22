#include <CGDCONT.h>
#include <stdio.h>

////////////////////////////////////////////////////////////////////////////////
////
#define ARRAY_SIZE(A) ((sizeof(A))/sizeof((A)[0]))

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

A7670C_Result A7670C_CGDCONT_Test(bool *result, uint32_t timeout_ms) {
    A7670C_Result err = A7670C_RequestWithCmd(Test_Handler, &result, os_tick_from_millisecond(timeout_ms), "AT+CGDCONT=?\r\n");
    if (err == kA7670C_Result_TIMEOUT) {
        *result = false;
    }
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t *buffer, void *ud) {
    A7670C_CGDCONT_Read_Response *result = (A7670C_CGDCONT_Read_Response *) ud;
    sdk_ringbuffer_text_t find_result;
    sdk_ringbuffer_iter_t iter;
    int i;
    
    if (sdk_ringbuffer_find_str(buffer, 0, "OK\r\n") != -1 /*接收结束*/) {
        result->code = kA7670C_Response_Code_OK;
        int find=-1;
        int record_count = 0;
        int find_start = 0;
        int find_end = sdk_ringbuffer_used(buffer);
        while(1) {
            find = sdk_ringbuffer_cut(&find_result, buffer, find_start, find_end, "+CGDCONT: ", "\r\n");
            if (find == 0) {
                int column_count = sdk_ringbuffer_count(buffer, find_result.start, find_result.end, ",")+1;
                sdk_ringbuffer_iter_init(&iter, &find_result);
                
                for(i=0; i<column_count; i++){
                    if(sdk_ringbuffer_iter(&iter, ",")==0){
                        switch (i) {
                            case 0:{
                                /*cid*/
                                result->records[record_count].cid = sdk_ringbuffer_strtoul(buffer, iter.start, 0, 0);
                                break;
                            }
                            case 1:{
                                /*PDP_type*/
                                if(sdk_ringbuffer_strcmp(buffer, iter.start+1, iter.end-1, "IP")==0){
                                    result->records[record_count].PDP_type = kA7670C_CGDCONT_PDP_IP;
                                }else if(sdk_ringbuffer_strcmp(buffer, iter.start+1, iter.end-1, "IPV6")==0){
                                    result->records[record_count].PDP_type = kA7670C_CGDCONT_PDP_IPV6;
                                }else if(sdk_ringbuffer_strcmp(buffer, iter.start+1, iter.end-1, "IPV4V6")==0){
                                    result->records[record_count].PDP_type = kA7670C_CGDCONT_PDP_IPV4V6;
                                }
                                break;
                            }
                            case 2:{
                                /*APN*/
                                int size = iter.end - iter.start -2;
                                if(size>0){
                                    int dst_size = ARRAY_SIZE(result->records[record_count].APN) - 1;
                                    size = dst_size > size ? size : dst_size;
                                    sdk_ringbuffer_memcpy((uint8_t *) result->records[record_count].APN, buffer, iter.start+1, size);
                                }
                                result->records[record_count].APN[size] = '\0';
                                break;
                            }
                            case 3:{
                                /*PDP_addr*/
                                int size = iter.end - iter.start -2;
                                if(size>0) {
                                    int dst_size = ARRAY_SIZE(result->records[record_count].PDP_addr) - 1;
                                    size = dst_size > size ? size : dst_size;
                                    sdk_ringbuffer_memcpy((uint8_t *) result->records[record_count].PDP_addr, buffer,
                                                         iter.start + 1, size);
                                }
                                result->records[record_count].PDP_addr[size] = '\0';
                                break;
                            }
                            case 4:{
                                /*d_comp*/
                                result->records[record_count].d_comp = sdk_ringbuffer_strtoul(buffer, iter.start, 0, 0);
                                break;
                            }
                            case 5:{
                                /*h_comp*/
                                result->records[record_count].h_comp = sdk_ringbuffer_strtoul(buffer, iter.start, 0, 0);
                                break;
                            }
                            case 6:{
                                /*ipv4_ctrl*/
                                result->records[record_count].ipv4_ctrl = sdk_ringbuffer_strtoul(buffer, iter.start, 0, 0);
                                break;
                            }
                            case 7:{
                                /*request_type*/
                                result->records[record_count].request_type = (int) sdk_ringbuffer_strtoul(buffer, iter.start, 0, 0);
                                break;
                            }
                            case 8:{
                                /*P_CSCF_discovery*/
                                result->records[record_count].P_CSCF_discovery = (int) sdk_ringbuffer_strtoul(buffer, iter.start, 0,
                                                                                                             0);
                                break;
                            }
                            case 9:{
                                /*IM_CN_Signalling_Flag_Ind*/
                                result->records[record_count].IM_CN_Signalling_Flag_Ind = (int) sdk_ringbuffer_strtoul(buffer,
                                                                                                                      iter.start, 0,
                                                                                                                      0);
                                break;
                            }
                        }
                    }
                }

                record_count += 1;

                find_start = find_result.end;
            }else{
                break;
            }
        };

        result->record_count = record_count;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if (sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n") != -1 /*接收结束*/) {
        result->code = kA7670C_Response_Code_ERROR;
        result->err_code = -1;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}


A7670C_Result A7670C_CGDCONT_Read(A7670C_CGDCONT_Read_Response *result, uint32_t timeout_ms) {
    result->err_code = -1;
    result->record_count = 0;
    A7670C_Result err = A7670C_RequestWithCmd(Read_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGDCONT?\r\n");
    return err;
}

////////////////////////////////////////////////////////////////////////////////
////

static A7670C_RxHandler_Result Write_Handler(sdk_ringbuffer_t *buffer, void *ud) {
    A7670C_CGDCONT_Write_Response *result = (A7670C_CGDCONT_Write_Response *) ud;

    if (sdk_ringbuffer_find_str(buffer, 0, "OK\r\n") != -1 /*接收结束: 成功*/) {
        result->code =kA7670C_Response_Code_OK;
        result->err_code = -1;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if (sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n") != -1 /*接收结束: 错误*/) {
        result->code  = kA7670C_Response_Code_ERROR;
        result->err_code = -1;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}

const char* pdp_type_cstr(A7670C_CGDCONT_PDP PDP_type){
    switch (PDP_type) {
        case kA7670C_CGDCONT_PDP_IP:
            return "IP";
        case kA7670C_CGDCONT_PDP_IPV4V6:
            return "IPV4V6";
        case kA7670C_CGDCONT_PDP_IPV6:
            return "IPV6";
        default:
            return "";
    }
}

A7670C_Result A7670C_CGDCONT_Write(A7670C_CGDCONT_Write_Response *result,
                                   int cid,
                                   A7670C_CGDCONT_PDP PDP_type, /*NULL if don't need*/
                                   const char *APN, /*NULL if don't need*/
                                   const char *PDP_addr,/*NULL if don't need*/
                                   A7670C_CGDCONT_DataCompression d_comp, /*NULL if don't need*/
                                   A7670C_CGDCONT_HeaderCompression h_comp, /*NULL if don't need*/
                                   A7670C_CGDCONT_IPv4 ipv4_ctrl, /*NULL if don't need*/
                                   int request_type, /*-1 if don't need*/
                                   uint32_t timeout_ms) {
    A7670C_Result err;
    result->err_code = -1;

    if (request_type != -1) {
        err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms),
                                     "AT+CGDCONT=%d,\"%s\",\"%s\",\"%s\",%d,%d,%d,%d\r\n", cid, pdp_type_cstr(PDP_type), APN, PDP_addr,
                                     d_comp, h_comp, ipv4_ctrl, request_type
        );
    } else if (ipv4_ctrl != kA7670C_CGDCONT_IPv4_NULL) {
        err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGDCONT=%d,\"%s\",\"%s\",\"%s\",%d,%d,%d\r\n",
                                     cid, pdp_type_cstr(PDP_type), APN, PDP_addr, d_comp, h_comp, ipv4_ctrl
        );
    } else if (h_comp != kA7670C_CGDCONT_HeaderCompression_NULL) {
        err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGDCONT=%d,\"%s\",\"%s\",\"%s\",%d,%d\r\n", cid,
                                     pdp_type_cstr(PDP_type), APN, PDP_addr, d_comp, h_comp
        );
    } else if (d_comp != kA7670C_CGDCONT_DataCompression_NULL) {
        err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGDCONT=%d,\"%s\",\"%s\",\"%s\",%d\r\n", cid,
                                     pdp_type_cstr(PDP_type), APN, PDP_addr, d_comp
        );
    } else if (PDP_addr != NULL) {
        err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGDCONT=%d,\"%s\",\"%s\",\"%s\"\r\n", cid,
                                     pdp_type_cstr(PDP_type), APN, PDP_addr
        );
    } else if (APN != NULL) {
        err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGDCONT=%d,\"%s\",\"%s\"\r\n", cid, pdp_type_cstr(PDP_type),
                                     APN
        );
    } else if (PDP_type != kA7670C_CGDCONT_PDP_NULL) {
        err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGDCONT=%d,\"%s\"\r\n", cid, pdp_type_cstr(PDP_type)
        );
    } else {
        err = A7670C_RequestWithArgs(Write_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGDCONT=%d\r\n", cid
        );
    }

    return err;
}

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Exec_Handler(sdk_ringbuffer_t *buffer, void *ud) {
    bool *result = (bool *) ud;
    if (sdk_ringbuffer_find_str(buffer, 0, "OK\r\n") != -1) {
        *result = true;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    if (sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n") != -1) {
        *result = false;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_CGDCONT_Exec(os_bool_t *result, uint32_t timeout_ms) {
    A7670C_Result err;
    err = A7670C_RequestWithArgs(Exec_Handler, result, os_tick_from_millisecond(timeout_ms), "AT+CGDCONT\r\n");
    return err;
}

