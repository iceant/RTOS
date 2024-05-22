#ifndef INCLUDED_HTTPACTION_H
#define INCLUDED_HTTPACTION_H

#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef enum A7670C_HTTPACTION_Method{
    kA7670C_HTTPACTION_Method_GET = 0,
    kA7670C_HTTPACTION_Method_POST = 1,
    kA7670C_HTTPACTION_Method_HEAD = 2,
    kA7670C_HTTPACTION_Method_DELETE = 3,
    kA7670C_HTTPACTION_Method_PUT = 4,
}A7670C_HTTPACTION_Method;

typedef struct A7670C_HTTPACTION_Write_Response{
    A7670C_Response_Code code;
    int status_code;
}A7670C_HTTPACTION_Write_Response;

A7670C_Result A7670C_HTTPACTION_Write(A7670C_HTTPACTION_Write_Response* response, A7670C_HTTPACTION_Method method, uint32_t timeout_ms);

#endif /* INCLUDED_HTTPACTION_H */
