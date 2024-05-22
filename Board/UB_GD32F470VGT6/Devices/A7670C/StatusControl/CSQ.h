#ifndef INCLUDED_CSQ_H
#define INCLUDED_CSQ_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/


////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CSQ_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CSQ_Exec_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    int rssi;
    int ber;
}A7670C_CSQ_Exec_Response;

A7670C_Result A7670C_CSQ_Exec(A7670C_CSQ_Exec_Response* result, uint32_t timeout_ms);








#endif /*INCLUDED_CSQ_H*/
