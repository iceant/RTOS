#ifndef INCLUDED_CMQTTSSLCFG_H
#define INCLUDED_CMQTTSSLCFG_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CMQTTSSLCFG_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTSSLCFG_Read_Record{
    int session_id; /* 0 or 1*/
    int ssl_ctx_index; /* 0 - 9 */
}A7670C_CMQTTSSLCFG_Read_Record;

typedef struct A7670C_CMQTTSSLCFG_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    A7670C_CMQTTSSLCFG_Read_Record records[2];
}A7670C_CMQTTSSLCFG_Read_Response;

A7670C_Result A7670C_CMQTTSSLCFG_Read(A7670C_CMQTTSSLCFG_Read_Response* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CMQTTSSLCFG_Write_Response{
    A7670C_Response_Code code;
    int err_code;
}A7670C_CMQTTSSLCFG_Write_Response;

A7670C_Result A7670C_CMQTTSSLCFG_Write(A7670C_CMQTTSSLCFG_Write_Response* result
        , int session_id
        , int ssl_ctx_index
        , uint32_t timeout_ms);

#endif /* INCLUDED_CMQTTSSLCFG_H */
