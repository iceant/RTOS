#ifndef INCLUDED_CPSI_H
#define INCLUDED_CPSI_H


////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CPSI_Test(os_bool_t* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef enum {
    kA7670C_CPSI_Read_SystemMode_NOSERVICE=0,
    kA7670C_CPSI_Read_SystemMode_GSM,
    kA7670C_CPSI_Read_SystemMode_WCDMA,
    kA7670C_CPSI_Read_SystemMode_LTE,
}A7670C_CPSI_Read_SystemMode;

typedef enum {
    kA7670C_CPSI_Read_OperationMode_Unknown=0,
    kA7670C_CPSI_Read_OperationMode_Online,
    kA7670C_CPSI_Read_OperationMode_Offline,
    kA7670C_CPSI_Read_OperationMode_FactoryTestMode,
    kA7670C_CPSI_Read_OperationMode_Reset,
    kA7670C_CPSI_Read_OperationMode_LowPowerMode,
    kA7670C_CPSI_Read_OperationMode_FlightMode,
}A7670C_CPSI_Read_OperationMode;

typedef struct A7670C_CPSI_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    A7670C_CPSI_Read_SystemMode     SystemMode;
    A7670C_CPSI_Read_OperationMode  OperationMode;
}A7670C_CPSI_Read_Response;

A7670C_Result A7670C_CPSI_Read(A7670C_CPSI_Read_Response* result, uint32_t timeout_ms);



#endif /*INCLUDED_CPSI_H*/
