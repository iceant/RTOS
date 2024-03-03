#ifndef INCLUDED_ESP01S_H
#define INCLUDED_ESP01S_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_DRV_USART_H
#include <drv_usart.h>
#endif /*INCLUDED_DRV_USART_H*/

#ifndef INCLUDED_OS_RINGBUFFER_H
#include <os_ringbuffer.h>
#endif /*INCLUDED_OS_RINGBUFFER_H*/

#ifndef INCLUDED_TIME_H
#define INCLUDED_TIME_H
#include <time.h>
#endif /* INCLUDED_TIME_H */

////////////////////////////////////////////////////////////////////////////////
////
#define ESP01S_RX_BUFFER_SIZE 1024

////////////////////////////////////////////////////////////////////////////////
////
typedef enum ESP01S_Result{
    kESP01S_Result_OK = 0,
    kESP01S_Result_ERROR = -1,
    kESP01S_Result_TIMEOUT = -2,
}ESP01S_Result;

typedef enum ESP01S_RequestHandler_Result{
    kESP01S_RequestHandler_Result_DONE = 0,
    kESP01S_RequestHandler_Result_CONTINUE = 1,
}ESP01S_RequestHandler_Result;

typedef ESP01S_RequestHandler_Result (*ESP01S_RequestHandler)(os_ringbuffer_t * rx_data, void* userdata);

////////////////////////////////////////////////////////////////////////////////
////
void ESP01S_Init(dev_usart_t* device); /* used in board only */
void ESP01S_Send(uint8_t* data, os_size_t data_size);

ESP01S_Result ESP01S_RequestWithCmd(ESP01S_RequestHandler handler, void* ud, uint32_t timeout_ms, const char* cmd);
ESP01S_Result ESP01S_RequestWithArgs(ESP01S_RequestHandler handler, void* ud, uint32_t timeout_ms, const char* fmt, ...);

////////////////////////////////////////////////////////////////////////////////
////
ESP01S_Result ESP01S_ConnectWifi(const char* WIFI_Name, const char* password, uint32_t timeout_ms);
ESP01S_Result ESP01S_AcquireIP(uint32_t timeout_ms);
ESP01S_Result ESP01S_NTPCfg(int timezone, uint32_t timeout_ms);
ESP01S_Result ESP01S_NTPTime(struct tm * time, uint32_t timeout_ms);


#endif /* INCLUDED_ESP01S_H */
