#ifndef INCLUDED_CMQTTSTART_H
#define INCLUDED_CMQTTSTART_H

#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////

typedef struct A7670C_CMQTTSTART_Exec_Response{
    A7670C_Response_Code code;
    int err_code;
}A7670C_CMQTTSTART_Exec_Response;

A7670C_Result A7670C_CMQTTSTART_Exec(A7670C_CMQTTSTART_Exec_Response* result, uint32_t timeout_ms /*12000*/);


#endif /*INCLUDED_CMQTTSTART_H*/
