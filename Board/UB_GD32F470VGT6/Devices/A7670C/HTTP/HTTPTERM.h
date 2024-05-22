#ifndef INCLUDED_HTTPTERM_H
#define INCLUDED_HTTPTERM_H

#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_HTTPTERM_Exec_Response{
    A7670C_Response_Code code;
}A7670C_HTTPTERM_Exec_Response;

A7670C_Result A7670C_HTTPTERM_Exec(A7670C_HTTPTERM_Exec_Response* response, uint32_t timeout_ms);

#endif /* INCLUDED_HTTPTERM_H */
