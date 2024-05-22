#ifndef INCLUDED_HTTPDATA_H
#define INCLUDED_HTTPDATA_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_HTTPDATA_Write_Response{
    A7670C_Response_Code code;
}A7670C_HTTPDATA_Write_Response;

A7670C_Result A7670C_HTTPDATA_Write(A7670C_HTTPDATA_Write_Response * response
                                    , uint8_t * data
                                    , int data_size /*1-153600 bytes*/
                                    , int time /*10s-65535s*/
                                    , uint32_t timeout_ms);

#endif /* INCLUDED_HTTPDATA_H */
