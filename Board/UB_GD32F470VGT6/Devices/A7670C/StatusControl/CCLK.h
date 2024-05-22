#ifndef INCLUDED_CCLK_H
#define INCLUDED_CCLK_H


////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CCLK_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CCLK_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    char time[23]; /* 14/01/01,02:14:36+08 */
}A7670C_CCLK_Read_Response;

A7670C_Result A7670C_CCLK_Read(A7670C_CCLK_Read_Response* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CCLK_Write_Response{
    A7670C_Response_Code code;
}A7670C_CCLK_Write_Response;

A7670C_Result A7670C_CCLK_Write(A7670C_CCLK_Write_Response* result, const char* time, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CCLK_DateTime{
    int16_t year;
    int8_t month;
    int8_t day;
    int8_t hour;
    int8_t min;
    int8_t sec;
    int8_t timezone;
}A7670C_CCLK_DateTime;

A7670C_CCLK_DateTime* A7670C_CCLK_ToDateTime(A7670C_CCLK_DateTime* result, const A7670C_CCLK_Read_Response* input);


#endif /*INCLUDED_CCLK_H*/
