#ifndef INCLUDED_ICCID_H
#define INCLUDED_ICCID_H

#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_ICCID_Read_Response{
    A7670C_Response_Code code;
    char ICCID[21];
}A7670C_ICCID_Read_Response;

A7670C_Result A7670C_ICCID_Read(A7670C_ICCID_Read_Response* response, uint32_t timeout_ms);


#endif /*INCLUDED_ICCID_H*/
