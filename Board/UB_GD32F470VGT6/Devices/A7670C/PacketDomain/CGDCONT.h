#ifndef INCLUDED_CGDCONT_H
#define INCLUDED_CGDCONT_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/



////////////////////////////////////////////////////////////////////////////////
////
typedef enum A7670C_CGDCONT_PDP{
    kA7670C_CGDCONT_PDP_IP=0,
    kA7670C_CGDCONT_PDP_IPV6,
    kA7670C_CGDCONT_PDP_IPV4V6,
    kA7670C_CGDCONT_PDP_NULL,
}A7670C_CGDCONT_PDP;

typedef enum A7670C_CGDCONT_DataCompression{
    kA7670C_CGDCONT_DataCompression_OFF=0,
    kA7670C_CGDCONT_DataCompression_ON=1,
    kA7670C_CGDCONT_DataCompression_V42BITS=2,
    kA7670C_CGDCONT_DataCompression_NULL,
}A7670C_CGDCONT_DataCompression;

typedef enum A7670C_CGDCONT_HeaderCompression{
    kA7670C_CGDCONT_HeaderCompression_OFF=0,
    kA7670C_CGDCONT_HeaderCompression_RFC1144=1,
    kA7670C_CGDCONT_HeaderCompression_NULL,
}A7670C_CGDCONT_HeaderCompression;

typedef enum A7670C_CGDCONT_IPv4{
    kA7670C_CGDCONT_IPv4_NAS=0, /*Address allocation through NAS signaling*/
    kA7670C_CGDCONT_IPv4_ON=1,
    kA7670C_CGDCONT_IPv4_NULL,
}A7670C_CGDCONT_IPv4;
////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CGDCONT_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CGDCONT_Read_Record{
    int cid ;/*1~15*/
    A7670C_CGDCONT_PDP PDP_type;
    char APN[32];
    char PDP_addr[128];
    A7670C_CGDCONT_DataCompression d_comp;
    A7670C_CGDCONT_HeaderCompression h_comp;
    A7670C_CGDCONT_IPv4 ipv4_ctrl;
    int request_type; /*0, 1, 2*/
    int P_CSCF_discovery; /*0, 1, 2*/
    int IM_CN_Signalling_Flag_Ind; /*0, 1*/
}A7670C_CGDCONT_Read_Record;

typedef struct A7670C_CGDCONT_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    int err_code; /* +CME ERROR: <err> */
    int record_count;
    A7670C_CGDCONT_Read_Record records[15];
}A7670C_CGDCONT_Read_Response;

A7670C_Result A7670C_CGDCONT_Read(A7670C_CGDCONT_Read_Response* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CGDCONT_Write_Response{
    A7670C_Response_Code code;
    int err_code;  /* +CME ERROR: <err> */
}A7670C_CGDCONT_Write_Response;

A7670C_Result A7670C_CGDCONT_Write(A7670C_CGDCONT_Write_Response* result,
                                   int cid,
                                   A7670C_CGDCONT_PDP PDP_type, /*NULL if don't need*/
                                   const char* APN, /*NULL if don't need*/
                                   const char* PDP_addr,/*NULL if don't need*/
                                   A7670C_CGDCONT_DataCompression d_comp, /*NULL if don't need*/
                                   A7670C_CGDCONT_HeaderCompression h_comp, /*NULL if don't need*/
                                   A7670C_CGDCONT_IPv4 ipv4_ctrl, /*NULL if don't need*/
                                   int request_type, /*-1 if don't need*/
                                   uint32_t timeout_ms);


////////////////////////////////////////////////////////////////////////////////
////

A7670C_Result A7670C_CGDCONT_Exec(os_bool_t *result, uint32_t timeout_ms);

#endif /*INCLUDED_CGDCONT_H*/
