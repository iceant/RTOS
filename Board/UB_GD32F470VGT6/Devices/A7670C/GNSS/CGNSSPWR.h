#ifndef INCLUDED_GNSSPWR_H
#define INCLUDED_GNSSPWR_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_A7670C_COMMON_H
#include <A7670C_Common.h>
#endif /*INCLUDED_A7670C_COMMON_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct A7670C_CGNSSPWR_Read_Response{
    A7670C_Response_Code code;
    int GNSS_Power_Status; /* 0- close GNSS, 1-Active GNSS */
    int AP_Flash_Status; /* 0 Close GNSSAP_Flash fast hot start mode or 1 Active */
}A7670C_CGNSSPWR_Read_Response;

typedef struct A7670C_CGNSSPWR_Write_Response{
    A7670C_Response_Code code;
}A7670C_CGNSSPWR_Write_Response;

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Result A7670C_CGNSSPWR_Test(bool* result, uint32_t timeout_ms);

A7670C_Result A7670C_CGNSSPWR_Write(A7670C_CGNSSPWR_Write_Response* result
        , int GNSS_Power_Status
        , int AP_Flash_Status
        , uint32_t timeout_ms);

A7670C_Result A7670C_CGNSSPWR_Read(A7670C_CGNSSPWR_Read_Response* result
        , uint32_t timeout_ms);

#endif /* INCLUDED_GNSSPWR_H */
