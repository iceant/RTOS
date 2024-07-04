#include <HTTPPARA.h>

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Write_URL_Handler(sdk_ringbuffer_t* buffer, void* ud){
    A7670C_HTTPPARA_Write_Response *response = (A7670C_HTTPPARA_Write_Response*)ud;
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        response->code = kA7670C_Response_Code_OK;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
        response->code = kA7670C_Response_Code_ERROR;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_HTTPPARA_Write_URL(A7670C_HTTPPARA_Write_Response* response, const char* url, uint32_t timeout_ms)
{
    return A7670C_RequestWithArgs(__FUNCTION__,Write_URL_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPPARA=\"URL\",\"%s\"\r\n", url);
}

////////////////////////////////////////////////////////////////////////////////
////


A7670C_Result A7670C_HTTPPARA_Write_CONNECTTO(A7670C_HTTPPARA_Write_Response* response,  int timeout /*20s ~ 120s, 120s default*/, uint32_t timeout_ms)
{
    return A7670C_RequestWithArgs(__FUNCTION__,Write_URL_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPPARA=\"CONNECTTO\",%d\r\n", timeout);
}

////////////////////////////////////////////////////////////////////////////////
////

A7670C_Result A7670C_HTTPPARA_Write_RECVTO(A7670C_HTTPPARA_Write_Response* response,  int timeout /*2s ~ 120s, 20s default*/, uint32_t timeout_ms)
{
    return A7670C_RequestWithArgs(__FUNCTION__,Write_URL_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPPARA=\"RECVTO\",%d\r\n", timeout);
}

////////////////////////////////////////////////////////////////////////////////
////

A7670C_Result A7670C_HTTPPARA_Write_CONTENT(A7670C_HTTPPARA_Write_Response* response,  const char* content_type /*256 bytes*/, uint32_t timeout_ms)
{
    return A7670C_RequestWithArgs(__FUNCTION__,Write_URL_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPPARA=\"CONTENT\",\"%s\"\r\n", content_type);
}

////////////////////////////////////////////////////////////////////////////////
////

A7670C_Result A7670C_HTTPPARA_Write_ACCEPT(A7670C_HTTPPARA_Write_Response* response,  const char* accept_type /*256 bytes*/, uint32_t timeout_ms)
{
    return A7670C_RequestWithArgs(__FUNCTION__,Write_URL_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPPARA=\"ACCEPT\",\"%s\"\r\n", accept_type);
}

////////////////////////////////////////////////////////////////////////////////
////

A7670C_Result A7670C_HTTPPARA_Write_SSLCFG(A7670C_HTTPPARA_Write_Response* response,  int ssl_cfg_id /*0-9*/, uint32_t timeout_ms)
{
    return A7670C_RequestWithArgs(__FUNCTION__,Write_URL_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPPARA=\"SSLCFG\",%d\r\n", ssl_cfg_id);
}

////////////////////////////////////////////////////////////////////////////////
////

A7670C_Result A7670C_HTTPPARA_Write_USERDATA(A7670C_HTTPPARA_Write_Response* response,  const char* userdata /*256 bytes*/, uint32_t timeout_ms)
{
    return A7670C_RequestWithArgs(__FUNCTION__,Write_URL_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPPARA=\"USERDATA\",\"%s\"\r\n", userdata);
}

////////////////////////////////////////////////////////////////////////////////
////

A7670C_Result A7670C_HTTPPARA_Write_READMODE(A7670C_HTTPPARA_Write_Response* response, int read_mode /*0 or 1, default 0*/, uint32_t timeout_ms)
{
    return A7670C_RequestWithArgs(__FUNCTION__,Write_URL_Handler, response, os_tick_from_millisecond(timeout_ms), "AT+HTTPPARA=\"READMODE\",%d\r\n", read_mode);
}

