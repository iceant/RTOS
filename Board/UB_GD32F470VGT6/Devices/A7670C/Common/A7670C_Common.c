#include <A7670C_Common.h>
#include <sdk_ringbuffer.h>

#include <stdarg.h>
#include <stdio.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////
////
struct A7670C_Device_S{
    A7670C_Pin_T* power_en;
    A7670C_Pin_T* power_key;
    A7670C_Pin_T* power_status;
    A7670C_Pin_T* power_reset;
    A7670C_IO_T * usart;
};

static A7670C_RxHandler_Handle s_A7670C__RxHandler={.rxHandler = 0, .userdata = 0};
static A7670C_RxHandler_Handle s_A7670C__DefaultRxHandler={.rxHandler = 0, .userdata = 0};
static A7670C_Device_T A7670C__Instance;

static os_sem_t rx_handler_lock;
static os_mutex_t A7670C__mutex;
static char A7670C__Printf_Buffer[256];

////////////////////////////////////////////////////////////////////////////////
////
A7670C_Device_T* A7670C_Init(A7670C_Pin_T* power_en, A7670C_Pin_T* power_key, A7670C_Pin_T* power_status, A7670C_Pin_T* power_reset, A7670C_IO_T* uart)
{
    A7670C__Instance.power_en = power_en;
    A7670C__Instance.power_key = power_key;
    A7670C__Instance.power_status = power_status;
    A7670C__Instance.power_reset = power_reset;
    A7670C__Instance.usart = uart;

    ////////////////////////////////////////////////////////////////////////////////
    ////
    s_A7670C__RxHandler.rxHandler = 0;
    s_A7670C__RxHandler.userdata = 0;
    os_sem_init(&rx_handler_lock,  "A7670C_RxHdLk",0, OS_QUEUE_FIFO);
    os_mutex_init(&A7670C__mutex);

    ////////////////////////////////////////////////////////////////////////////////
    ////
    return &A7670C__Instance;
}

void A7670C_PowerOn(void)
{
    A7670C__Instance.power_en->on();
    A7670C_NopDelay(0x3FFFFFF);
    A7670C__Instance.power_key->on();
    A7670C_NopDelay(0x3FFFFFF);
    A7670C__Instance.power_key->off();
}

void A7670C_PowerOff(void)
{
    A7670C__Instance.power_en->off();
    A7670C__Instance.power_key->off();
}

os_bool_t A7670C_IsPowerOn(void)
{
    int status = A7670C__Instance.power_status->read();
    return status==0?OS_TRUE:OS_FALSE;
}

void A7670C_Lock(void){
    os_mutex_lock(&A7670C__mutex);
//    os_printf("A7670C_Lock\n");
}

void A7670C_UnLock(void){
//    os_printf("A7670C_UnLock\n");
    os_mutex_unlock(&A7670C__mutex);
}


void A7670C_Reset(void){
    A7670C__Instance.power_reset->on();
    A7670C_NopDelay(0x3FFFFFF);
    A7670C__Instance.power_reset->off();
}
////////////////////////////////////////////////////////////////////////////////
////

void A7670C_SetDefaultRxHandler(A7670C_RxHandler_T* rxHandler, void* userdata)
{
    A7670C__Instance.usart->setDefaultRxHandler(rxHandler, userdata);
}

os_size_t A7670C_Send(uint8_t* data, os_size_t size)
{
    return A7670C__Instance.usart->send(data, size);
}

A7670C_Result A7670C_RequestWithHandler(A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks)
{
    A7670C_Lock();
    A7670C__Instance.usart->setRxHandler(rxHandler, userdata);
    A7670C_Result res = A7670C_TimedWait(ticks);
    A7670C_UnLock();


    return (res==OS_ETIMEOUT)?kA7670C_Result_TIMEOUT:kA7670C_Result_OK;;
}

A7670C_Result A7670C_RequestWithCmd(A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks, const char* command)
{
    int err;

    A7670C_Lock();
    A7670C__Instance.usart->setRxHandler(rxHandler, userdata);
    A7670C_Send(command, strlen(command));
    err = A7670C_TimedWait(ticks);
    A7670C__Instance.usart->setRxHandler(0, 0);
    A7670C_UnLock();

    return (err==OS_ETIMEOUT)?kA7670C_Result_TIMEOUT:kA7670C_Result_OK;;
}

A7670C_Result A7670C_RequestWithArgs(A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks, const char* fmt, ...)
{
    va_list ap;
    int err;

    A7670C_Lock();

    va_start(ap, fmt);
    memset(A7670C__Printf_Buffer, 0, sizeof(A7670C__Printf_Buffer));
    int size = vsnprintf(A7670C__Printf_Buffer, sizeof(A7670C__Printf_Buffer), fmt, ap);
    va_end(ap);

    A7670C__Instance.usart->setRxHandler(rxHandler, userdata);
    A7670C_Send(A7670C__Printf_Buffer, size);

    err = A7670C_TimedWait(ticks);
    A7670C__Instance.usart->setRxHandler(0, 0);
    A7670C_UnLock();

    return (err==OS_ETIMEOUT)?kA7670C_Result_TIMEOUT:kA7670C_Result_OK;
}

A7670C_Result A7670C_TimedWait(os_tick_t ticks)
{
    os_err_t  err = A7670C__Instance.usart->wait(ticks);
    if(err==OS_ETIMEOUT){
        printf("A7670C_TimedWait Timeout!\n");
    }
    return (err==OS_ETIMEOUT)?kA7670C_Result_TIMEOUT:kA7670C_Result_OK;
}

void A7670C_Notify(void){
    A7670C__Instance.usart->notify();
}
