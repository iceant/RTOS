#include <ESP01S.h>
#include <assert.h>
#include <os_kernel.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>

////////////////////////////////////////////////////////////////////////////////
////
typedef struct ESP01S_RequestHandler_Record{
    ESP01S_RequestHandler handler;
    void* userdata;
}ESP01S_RequestHandler_Record;

////////////////////////////////////////////////////////////////////////////////
////
static drv_usart_t * ESP01S__device;
static uint8_t ESP01S__RxBlock[ESP01S_RX_BUFFER_SIZE];
static os_ringbuffer_t ESP01S__RxBuffer;
static ESP01S_RequestHandler_Record ESP01S__RequestHandler_Record;

////////////////////////////////////////////////////////////////////////////////
////
static ESP01S_RequestHandler_Result ESP01S__DefaultRequestHandler(os_ringbuffer_t * data, void* ud){
    int used = os_ringbuffer_used(data);
    if(os_ringbuffer_peek(data, used-2)=='\r' && os_ringbuffer_peek(data, used-1)=='\n'){
        printf("%s", data->buffer);
        os_ringbuffer_reset(data);
    }
    
    return kESP01S_RequestHandler_Result_CONTINUE;
}
////////////////////////////////////////////////////////////////////////////////
////
void ESP01S_Init(drv_usart_t* device)
{
    assert(device);
    ESP01S__device = device;
    os_ringbuffer_init_with(&ESP01S__RxBuffer, ESP01S__RxBlock, ESP01S_RX_BUFFER_SIZE);
    
    ESP01S__RequestHandler_Record.handler = ESP01S__DefaultRequestHandler;
    ESP01S__RequestHandler_Record.userdata = 0;
}

////////////////////////////////////////////////////////////////////////////////
////
static uint8_t ESP01S__rx_thread_stack[1024];
static os_thread_t ESP01S__rx_thread;
static os_semaphore_t ESP01S__rx_sem;
static os_semaphore_t ESP01S__lock;
static os_mutex_t ESP01S__mutex;


static void ESP01S__rx_thread_entry(void* parameter)
{
    printf("ESP01S__rx_thread: %p\n", os_thread_self());
    ESP01S_RequestHandler_Result result;
    while(1){
        os_semaphore_take(&ESP01S__rx_sem, OS_WAIT_INFINITY);
        if(os_ringbuffer_find_str(&ESP01S__RxBuffer, 0, "\r\n")!=-1){
            if(ESP01S__RequestHandler_Record.handler){
                result = ESP01S__RequestHandler_Record.handler(&ESP01S__RxBuffer, ESP01S__RequestHandler_Record.userdata);
                if(result==kESP01S_RequestHandler_Result_DONE){
                    os_ringbuffer_reset(&ESP01S__RxBuffer);
                    os_semaphore_release(&ESP01S__lock);
                }
            }
        }
    }
}

void ESP01S_Startup(void){
    assert(ESP01S__device);
    
    os_semaphore_init(&ESP01S__rx_sem, "ESP01S_RxSem", 0, OS_IPC_FLAG_FIFO);
    os_semaphore_init(&ESP01S__lock, "ESP01S_Lock",0, OS_IPC_FLAG_FIFO);
    os_mutex_init(&ESP01S__mutex, "ESP01S_mtx", OS_IPC_FLAG_FIFO);
    
    os_thread_init(&ESP01S__rx_thread,"ESP01S-RX", ESP01S__rx_thread_entry, 0, ESP01S__rx_thread_stack, sizeof(ESP01S__rx_thread_stack), 20, 10);
    os_thread_startup(&ESP01S__rx_thread);
    
}

void ESP01S_FireReceived(void)
{
    os_semaphore_release(&ESP01S__rx_sem);
}

void ESP01S_BufferPut(uint8_t data)
{
    os_ringbuffer_put(&ESP01S__RxBuffer, data);
}

void ESP01S_Send(uint8_t* data, os_size_t data_size){
    assert(ESP01S__device->USARTx);
    drv_usart_send(ESP01S__device->USARTx, data, data_size);
}

ESP01S_Result ESP01S_RequestWithCmd(ESP01S_RequestHandler handler, void* ud, uint32_t timeout_ms, const char* cmd)
{
    ESP01S_RequestHandler_Record record;
    os_err_t err;
    
    os_mutex_take(&ESP01S__mutex, OS_WAIT_INFINITY);
    record.handler = ESP01S__RequestHandler_Record.handler;
    record.userdata = ESP01S__RequestHandler_Record.userdata;
    ESP01S__RequestHandler_Record.handler = handler;
    ESP01S__RequestHandler_Record.userdata = ud;
    os_ringbuffer_reset(&ESP01S__RxBuffer);
    ESP01S_Send(cmd, strlen(cmd));
    os_mutex_release(&ESP01S__mutex);
    
    err = os_semaphore_take(&ESP01S__lock, os_tick_from_ms(timeout_ms));
    
    os_mutex_take(&ESP01S__mutex, OS_WAIT_INFINITY);
    ESP01S__RequestHandler_Record.handler = record.handler;
    ESP01S__RequestHandler_Record.userdata = record.userdata;
    os_mutex_release(&ESP01S__mutex);
    
    return (err==OS_ETIMEOUT)?kESP01S_Result_TIMEOUT:kESP01S_Result_OK;
}

static uint8_t ESP01S__Request_Buffer[256];
ESP01S_Result ESP01S_RequestWithArgs(ESP01S_RequestHandler handler, void* ud, uint32_t timeout_ms, const char* fmt, ...)
{
    ESP01S_RequestHandler_Record record;
    
    va_list ap;
    int err;
    
    os_mutex_take(&ESP01S__mutex, OS_WAIT_INFINITY);
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
        os_ringbuffer_reset(&ESP01S__RxBuffer);
        ESP01S_Send(ESP01S__Request_Buffer, size);
    }
    os_mutex_release(&ESP01S__mutex);
    
    
    err = os_semaphore_take(&ESP01S__lock, os_tick_from_ms(timeout_ms));
    
    os_mutex_take(&ESP01S__mutex, OS_WAIT_INFINITY);
    ESP01S__RequestHandler_Record.handler = record.handler;
    ESP01S__RequestHandler_Record.userdata = record.userdata;
    os_mutex_release(&ESP01S__mutex);
    
    return (err==OS_ETIMEOUT)?kESP01S_Result_TIMEOUT:kESP01S_Result_OK;
}
