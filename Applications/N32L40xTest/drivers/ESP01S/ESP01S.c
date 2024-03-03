#include <ESP01S.h>
#include <assert.h>
#include <os_kernel.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include "os_hex.h"
////////////////////////////////////////////////////////////////////////////////
////
typedef struct ESP01S_RequestHandler_Record{
    ESP01S_RequestHandler handler;
    void* userdata;
}ESP01S_RequestHandler_Record;

////////////////////////////////////////////////////////////////////////////////
////
static dev_usart_t * ESP01S__device;

static ESP01S_RequestHandler_Record ESP01S__RequestHandler_Record;

static os_sem_t ESP01S__lock;
static os_mutex_t ESP01S__mutex;

////////////////////////////////////////////////////////////////////////////////
////

static dev_usart_recv_result ESP01S__Recv(os_ringbuffer_t* data){
    if(ESP01S__RequestHandler_Record.handler){
        ESP01S_RequestHandler_Result result = ESP01S__RequestHandler_Record.handler(data, ESP01S__RequestHandler_Record.userdata);
        if(result==kESP01S_RequestHandler_Result_CONTINUE){
            return kDevUSARTRecvResult_CONTINUE;
        }else if(result==kESP01S_RequestHandler_Result_DONE){
            os_ringbuffer_reset(data);
            os_sem_release(&ESP01S__lock);
            return kDevUSARTRecvResult_DONE;
        }
    }
    return kDevUSARTRecvResult_CONTINUE;
}
////////////////////////////////////////////////////////////////////////////////
////
void ESP01S_Init(dev_usart_t* device)
{
    assert(device);
    ESP01S__device = device;
    ESP01S__device->recv = ESP01S__Recv;
    os_sem_init(&ESP01S__lock, "ESP01S_LK", 0, OS_QUEUE_FIFO);
    os_mutex_init(&ESP01S__mutex, "ESP01S_MTX", OS_QUEUE_PRIO);
}

void ESP01S_Send(uint8_t* data, os_size_t data_size){
    ESP01S__device->send(data, data_size);
}

ESP01S_Result ESP01S_RequestWithCmd(ESP01S_RequestHandler handler, void* ud, uint32_t timeout_ms, const char* cmd)
{
    ESP01S_RequestHandler_Record record;
    os_err_t err;
    
    os_mutex_lock(&ESP01S__mutex);
    record.handler = ESP01S__RequestHandler_Record.handler;
    record.userdata = ESP01S__RequestHandler_Record.userdata;
    ESP01S__RequestHandler_Record.handler = handler;
    ESP01S__RequestHandler_Record.userdata = ud;
    ESP01S_Send((uint8_t*)cmd, strlen(cmd));
    os_mutex_unlock(&ESP01S__mutex);
    
    err = os_sem_take(&ESP01S__lock, os_tick_from_millisecond(timeout_ms));
    
    os_mutex_lock(&ESP01S__mutex);
    ESP01S__RequestHandler_Record.handler = record.handler;
    ESP01S__RequestHandler_Record.userdata = record.userdata;
    os_mutex_unlock(&ESP01S__mutex);
    
    return (err==OS_ETIMEOUT)?kESP01S_Result_TIMEOUT:kESP01S_Result_OK;
}

static uint8_t ESP01S__Request_Buffer[256];
ESP01S_Result ESP01S_RequestWithArgs(ESP01S_RequestHandler handler, void* ud, uint32_t timeout_ms, const char* fmt, ...)
{
    ESP01S_RequestHandler_Record record;
    
    va_list ap;
    int err;
    
    os_mutex_lock(&ESP01S__mutex);
    {
        va_start(ap, fmt);
        memset(ESP01S__Request_Buffer, 0, sizeof(ESP01S__Request_Buffer));
        int size = vsnprintf(ESP01S__Request_Buffer, sizeof(ESP01S__Request_Buffer), fmt, ap);
        ESP01S__Request_Buffer[size]='\0';
        va_end(ap);
        
        record.handler = ESP01S__RequestHandler_Record.handler;
        record.userdata = ESP01S__RequestHandler_Record.userdata;
        
        ESP01S__RequestHandler_Record.handler = handler;
        ESP01S__RequestHandler_Record.userdata = ud;
        ESP01S_Send(ESP01S__Request_Buffer, size);
    }
    os_mutex_unlock(&ESP01S__mutex);
    
    
    err = os_sem_take(&ESP01S__lock, os_tick_from_millisecond(timeout_ms));
    
    os_mutex_lock(&ESP01S__mutex);
    ESP01S__RequestHandler_Record.handler = record.handler;
    ESP01S__RequestHandler_Record.userdata = record.userdata;
    os_mutex_unlock(&ESP01S__mutex);
    
    return (err==OS_ETIMEOUT)?kESP01S_Result_TIMEOUT:kESP01S_Result_OK;
}

////////////////////////////////////////////////////////////////////////////////
////
static ESP01S_RequestHandler_Result ESP01S__ConnectWifi_Handler(os_ringbuffer_t * buffer, void* userdata)
{
    if(os_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        return kESP01S_RequestHandler_Result_DONE;
    }
    return kESP01S_RequestHandler_Result_CONTINUE;
}

ESP01S_Result ESP01S_ConnectWifi(const char* WIFI_Name, const char* password, uint32_t timeout_ms)
{
    return ESP01S_RequestWithArgs(ESP01S__ConnectWifi_Handler, 0, os_tick_from_millisecond(timeout_ms)
                                  , "AT+CWJAP=\"%s\",\"%s\"\r\n", WIFI_Name, password);
}

////////////////////////////////////////////////////////////////////////////////
////
static ESP01S_RequestHandler_Result ESP01S__AcquireIP_Handler(os_ringbuffer_t * buffer, void* userdata)
{
    if(os_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        return kESP01S_RequestHandler_Result_DONE;
    }
    return kESP01S_RequestHandler_Result_CONTINUE;
}

ESP01S_Result ESP01S_AcquireIP(uint32_t timeout_ms){
    return ESP01S_RequestWithCmd(ESP01S__AcquireIP_Handler, 0, os_tick_from_millisecond(timeout_ms), "AT+CIPSTA?\r\n");
}

////////////////////////////////////////////////////////////////////////////////
////
static ESP01S_RequestHandler_Result ESP01S__NTPCfg_Handler(os_ringbuffer_t * buffer, void* userdata)
{
    if(os_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        return kESP01S_RequestHandler_Result_DONE;
    }
    return kESP01S_RequestHandler_Result_CONTINUE;
}

ESP01S_Result ESP01S_NTPCfg(int timezone, uint32_t timeout_ms)
{
    return ESP01S_RequestWithArgs(ESP01S__NTPCfg_Handler, 0, os_tick_from_millisecond(timeout_ms)
                                  , "AT+CIPSNTPCFG=1,%d\r\n", timezone);
}

////////////////////////////////////////////////////////////////////////////////
////
typedef enum {
    kWeekDay_SUNDAY=0,
    kWeekDay_MONDAY=1,
    kWeekDay_TUESDAY=2,
    kWeekDay_WEDNESDAY=3,
    kWeekDay_THURSDAY=4,
    kWeekDay_FRIDAY=5,
    kWeekDay_SATURDAY=6,
}WeekDay;

typedef enum {
    kMonth_January = 0,
    kMonth_February = 1,
    kMonth_March = 2,
    kMonth_April = 3,
    kMonth_May = 4,
    kMonth_June = 5,
    kMonth_July = 6,
    kMonth_August = 7,
    kMonth_September = 8,
    kMonth_October = 9,
    kMonth_November = 10,
    kMonth_December = 11,
}Month;

static ESP01S_RequestHandler_Result ESP01S__NTPTime_Handler(os_ringbuffer_t * buffer, void* userdata)
{
    struct tm* datetime = (struct tm*)userdata;
    int err = 0;
    
    if(os_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        os_hex_dump("NTP", buffer->buffer, os_ringbuffer_used(buffer));
        os_ringbuffer_text_t text;
        os_size_t used = os_ringbuffer_used(buffer);
        err = os_ringbuffer_cut(&text, buffer, 0, used, "+CIPSNTPTIME:", "\r\n");
        if(err==0){
            if(os_ringbuffer_strcmp(buffer, text.start, text.start+2, "Mon")==0){
                datetime->tm_wday=kWeekDay_MONDAY;
            }else if(os_ringbuffer_strcmp(buffer, text.start, text.start+2, "Tue")==0){
                datetime->tm_wday=kWeekDay_TUESDAY;
            }else if(os_ringbuffer_strcmp(buffer, text.start, text.start+2, "Wed")==0){
                datetime->tm_wday=kWeekDay_WEDNESDAY;
            }else if(os_ringbuffer_strcmp(buffer, text.start, text.start+2, "Thu")==0){
                datetime->tm_wday=kWeekDay_THURSDAY;
            }else if(os_ringbuffer_strcmp(buffer, text.start, text.start+2, "Fri")==0){
                datetime->tm_wday=kWeekDay_FRIDAY;
            }else if(os_ringbuffer_strcmp(buffer, text.start, text.start+2, "Sat")==0){
                datetime->tm_wday=kWeekDay_SATURDAY;
            }else if(os_ringbuffer_strcmp(buffer, text.start, text.start+2, "Sun")==0){
                datetime->tm_wday=kWeekDay_SUNDAY;
            }
            
            if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "Jan")==0){
                datetime->tm_mon = kMonth_January;
            }else if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "Feb")==0){
                datetime->tm_mon = kMonth_February;
            }else if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "Mar")==0){
                datetime->tm_mon = kMonth_March;
            }else if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "Apr")==0){
                datetime->tm_mon = kMonth_April;
            }else if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "May")==0){
                datetime->tm_mon = kMonth_May;
            }else if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "Jun")==0){
                datetime->tm_mon = kMonth_June;
            }else if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "Jul")==0){
                datetime->tm_mon = kMonth_July;
            }else if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "Aug")==0){
                datetime->tm_mon = kMonth_August;
            }else if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "Sep")==0){
                datetime->tm_mon = kMonth_September;
            }else if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "Oct")==0){
                datetime->tm_mon = kMonth_October;
            }else if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "Nov")==0){
                datetime->tm_mon = kMonth_November;
            }else if(os_ringbuffer_strcmp(buffer, text.start+4, text.start+6, "Dec")==0){
                datetime->tm_mon = kMonth_December;
            }
            
            datetime->tm_mday = os_ringbuffer_strtoul(buffer, text.start+7, 0, 10);
            datetime->tm_hour = os_ringbuffer_strtoul(buffer, text.start+11, 0, 10);
            datetime->tm_min = os_ringbuffer_strtoul(buffer, text.start+14, 0, 10);
            datetime->tm_sec = os_ringbuffer_strtoul(buffer, text.start+17, 0, 10);
            datetime->tm_year = os_ringbuffer_strtoul(buffer, text.start+20, 0, 10) - 1900;
        }
        os_ringbuffer_reset(buffer);
        return kESP01S_RequestHandler_Result_DONE;
    }
    return kESP01S_RequestHandler_Result_CONTINUE;
}

ESP01S_Result ESP01S_NTPTime(struct tm * time, uint32_t timeout_ms)
{
    return ESP01S_RequestWithCmd(ESP01S__NTPTime_Handler, time, os_tick_from_millisecond(timeout_ms)
                                 , "AT+CIPSNTPTIME?\r\n");
}




