#ifndef INCLUDED_CGACT_H
#define INCLUDED_CGACT_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/


////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CGACT_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CGACT_Read_Record{
    int cid ;/*1~15*/
    int state;
}A7670C_CGACT_Read_Record;

typedef struct A7670C_CGACT_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    int err_code; /* +CME ERROR: <err> */
    int record_count;
    A7670C_CGACT_Read_Record records[15];
}A7670C_CGACT_Read_Response;

A7670C_Result A7670C_CGACT_Read(A7670C_CGACT_Read_Response* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CGACT_Write_Response{
    A7670C_Response_Code code;
    int err_code;  /* +CME ERROR: <err> */
}A7670C_CGACT_Write_Response;

A7670C_Result A7670C_CGACT_Write(A7670C_CGACT_Write_Response* result,
                                   int state,
                                   int cid,
                                   uint32_t timeout_ms);


#endif /*INCLUDED_CGACT_H*/
