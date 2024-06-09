#ifndef INCLUDED_CGPSINFO_H
#define INCLUDED_CGPSINFO_H
////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////

typedef struct A7670C_CGPSINFO_Read_Response{
    A7670C_Response_Code code;
    uint8_t time; /* 0 - 255 second, report the GPS information every x seconds*/
}A7670C_CGPSINFO_Read_Response;

typedef struct A7670C_CGPSINFO_Write_Response{
    A7670C_Response_Code code;
    char info[256];
}A7670C_CGPSINFO_Write_Response;

typedef struct A7670C_CGPSINFO_Exec_Response{
    A7670C_Response_Code code;
    char info[256];
}A7670C_CGPSINFO_Exec_Response;

#define A7670C_CGPSINFO_MAX_TIMEOUT_MS 9000

////////////////////////////////////////////////////////////////////////////////
////

A7670C_Result A7670C_CGPSINFO_Test(bool* result, uint32_t timeout_ms);

A7670C_Result A7670C_CGPSINFO_Read(A7670C_CGPSINFO_Read_Response* result, uint32_t timeout_ms);

A7670C_Result A7670C_CGPSINFO_Write(A7670C_CGPSINFO_Write_Response* result
                                    , uint8_t time
                                    , uint32_t timeout_ms);

/* Set Default Value 3 */
A7670C_Result A7670C_CGPSINFO_Exec(A7670C_CGPSINFO_Exec_Response* result, uint32_t timeout_ms);

#endif /* INCLUDED_CGPSINFO_H */
