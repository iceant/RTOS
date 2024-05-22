#ifndef INCLUDED_CPIN_H
#define INCLUDED_CPIN_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/



////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CPIN_Test(bool* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////

typedef enum {
    kA7670C_CPIN_Record_Code_NONE=0,   /*is not pending for any password*/
    kA7670C_CPIN_Record_Code_READY,   /*is not pending for any password*/
    kA7670C_CPIN_Record_Code_SIMPIN,    /*waiting SIM PIN to be given*/
    kA7670C_CPIN_Record_Code_SIMPUK,    /*is waiting SIM PUK to be given*/
    kA7670C_CPIN_Record_Code_PHSIMPIN,  /*is waiting phone-to-SIM card password to be given*/
    kA7670C_CPIN_Record_Code_SIMPIN2,   /*is waiting SIM PIN2 to be given*/
    kA7670C_CPIN_Record_Code_SIMPUK2,   /*is waiting SIM PUK2 to be given*/
    kA7670C_CPIN_Record_Code_PHNETPIN,  /*is waiting network personalization password to be given*/
}A7670C_CPIN_Record_Code;

typedef struct A7670C_CPIN_Read_Response{
    A7670C_Response_Code code; /* OK | ERROR*/
    A7670C_CPIN_Record_Code record_code;
    int err_code;
}A7670C_CPIN_Read_Response;

A7670C_Result A7670C_CPIN_Read(A7670C_CPIN_Read_Response* result, uint32_t timeout_ms);

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CPIN_Write_Response{
    A7670C_Response_Code code;
    int err_code;
}A7670C_CPIN_Write_Response;

A7670C_Result A7670C_CPIN_Write(A7670C_CPIN_Write_Response* result, const char* pin, const char* newpin, uint32_t timeout_ms);






#endif /*INCLUDED_CPIN_H*/
