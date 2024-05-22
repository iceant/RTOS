#ifndef INCLUDED_ATE_H
#define INCLUDED_ATE_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_ATE_Exec_Response{
    A7670C_Response_Code code;
}A7670C_ATE_Exec_Response;

typedef enum A7670C_ATE_Command{
    kA7670C_ATE_Command_OFF = 0,
    kA7670C_ATE_Command_ON = 1,
}A7670C_ATE_Command;

A7670C_Result A7670C_ATE_Exec(A7670C_ATE_Exec_Response* response,  A7670C_ATE_Command cmd, uint32_t timeout_ms);

#endif /* INCLUDED_ATE_H */
