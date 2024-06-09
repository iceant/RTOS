#ifndef INCLUDED_CGNSSMODE_H
#define INCLUDED_CGNSSMODE_H
////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef enum A7670C_CGNSSMODE_enum{
    kA7670C_CGNSSMODE_GPS=1,
    kA7670C_CGNSSMODE_BDS=2,
    kA7670C_CGNSSMODE_GPS_BDS=3,
    kA7670C_CGNSSMODE_GLONASS=4,
    kA7670C_CGNSSMODE_GPS_GLONASS=5,
    kA7670C_CGNSSMODE_BDS_GLONASS=6,
    kA7670C_CGNSSMODE_GPS_BDS_GLONASS=7,
}A7670C_CGNSSMODE_T;

typedef struct A7670C_CGNSSMODE_Read_Response{
    A7670C_Response_Code code;
    A7670C_CGNSSMODE_T mode;
}A7670C_CGNSSMODE_Read_Response;

typedef struct A7670C_CGNSSMODE_Write_Response{
    A7670C_Response_Code code;
}A7670C_CGNSSMODE_Write_Response;

typedef struct A7670C_CGNSSMODE_Exec_Response{
    A7670C_Response_Code code;
}A7670C_CGNSSMODE_Exec_Response;

#define A7670C_CGNSSMODE_MAX_TIMEOUT_MS 9000

////////////////////////////////////////////////////////////////////////////////
////

A7670C_Result A7670C_CGNSSMODE_Test(bool* result, uint32_t timeout_ms);

A7670C_Result A7670C_CGNSSMODE_Read(A7670C_CGNSSMODE_Read_Response* result, uint32_t timeout_ms);

A7670C_Result A7670C_CGNSSMODE_Write(A7670C_CGNSSMODE_Write_Response* result, A7670C_CGNSSMODE_T mode, uint32_t timeout_ms);

/* Set Default Value 3 */
A7670C_Result A7670C_CGNSSMODE_Exec(A7670C_CGNSSMODE_Exec_Response* result, uint32_t timeout_ms);

#endif /* INCLUDED_CGNSSMODE_H */
