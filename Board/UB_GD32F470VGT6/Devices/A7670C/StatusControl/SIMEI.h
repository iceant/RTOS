#ifndef INCLUDED_SIMEI_H
#define INCLUDED_SIMEI_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/


////////////////////////////////////////////////////////////////////////////////
////

A7670C_Result A7670C_SIMEI_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_SIMEI_Read_Response{
    A7670C_Response_Code code;
    char value[16]; /* IMEI 是15位，加一位 \0 */
}A7670C_SIMEI_Read_Response;

A7670C_Result A7670C_SIMEI_Read(A7670C_SIMEI_Read_Response* result, uint32_t timeout_ms);


////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_SIMEI_Write(bool* result, const char* IMEI, uint32_t timeout_ms);


#endif /* INCLUDED_SIMEI_H */
