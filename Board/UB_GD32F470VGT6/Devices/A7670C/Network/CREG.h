#ifndef INCLUDED_CREG_H
#define INCLUDED_CREG_H


////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/



////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CREG_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CREG_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    int err_code; /* +CME ERROR: <err> */
    int n;
    int stat;
    uint16_t lac;
    uint32_t ci;
}A7670C_CREG_Read_Response;

A7670C_Result A7670C_CREG_Read(A7670C_CREG_Read_Response* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CREG_Write_Response{
    A7670C_Response_Code code;
    int err_code;  /* +CME ERROR: <err> */
}A7670C_CREG_Write_Response;

A7670C_Result A7670C_CREG_Write(A7670C_CREG_Write_Response* result, int n, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CREG_Exec(bool* result, int n, uint32_t timeout_ms);



#endif /*INCLUDED_CREG_H*/
