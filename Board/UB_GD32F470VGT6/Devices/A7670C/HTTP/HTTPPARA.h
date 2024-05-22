#ifndef INCLUDED_HTTPPARA_H
#define INCLUDED_HTTPPARA_H


////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_HTTPPARA_Write_Response{
    A7670C_Response_Code code;
}A7670C_HTTPPARA_Write_Response;

A7670C_Result A7670C_HTTPPARA_Write_URL(A7670C_HTTPPARA_Write_Response* response, const char* url, uint32_t timeout_ms);
A7670C_Result A7670C_HTTPPARA_Write_CONNECTTO(A7670C_HTTPPARA_Write_Response* response,  int timeout /*20s ~ 120s, 120s default*/, uint32_t timeout_ms);
A7670C_Result A7670C_HTTPPARA_Write_RECVTO(A7670C_HTTPPARA_Write_Response* response,  int timeout /*2s ~ 120s, 20s default*/, uint32_t timeout_ms);
A7670C_Result A7670C_HTTPPARA_Write_CONTENT(A7670C_HTTPPARA_Write_Response* response,  const char* content_type /*256 bytes*/, uint32_t timeout_ms);
A7670C_Result A7670C_HTTPPARA_Write_ACCEPT(A7670C_HTTPPARA_Write_Response* response,  const char* content_type /*256 bytes*/, uint32_t timeout_ms);
A7670C_Result A7670C_HTTPPARA_Write_SSLCFG(A7670C_HTTPPARA_Write_Response* response,  int ssl_cfg_id /*0-9*/, uint32_t timeout_ms);
A7670C_Result A7670C_HTTPPARA_Write_USERDATA(A7670C_HTTPPARA_Write_Response* response,  const char* userdata /*256 bytes*/, uint32_t timeout_ms);
A7670C_Result A7670C_HTTPPARA_Write_READMODE(A7670C_HTTPPARA_Write_Response* response, int read_mode /*0 or 1, default 0*/, uint32_t timeout_ms);


#endif /* INCLUDED_HTTPPARA_H */
