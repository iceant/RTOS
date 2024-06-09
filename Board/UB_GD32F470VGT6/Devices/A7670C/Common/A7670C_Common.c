#include <A7670C_Common.h>
#include <sdk_ringbuffer.h>

#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <sdk_hex.h>

////////////////////////////////////////////////////////////////////////////////
////
struct A7670C_Device_S{
    A7670C_Pin_T* power_en;
    A7670C_Pin_T* power_key;
    A7670C_Pin_T* power_status;
    A7670C_Pin_T* power_reset;
    A7670C_IO_T * IO;
};

static A7670C_Device_T A7670C__Instance;

static os_sem_t rx_handler_lock;
static os_mutex_t A7670C__mutex;
static char A7670C__Printf_Buffer[256];

static os_list_t A7670C__RxHandler_List;


////////////////////////////////////////////////////////////////////////////////
////
A7670C_Device_T* A7670C_Init(A7670C_Pin_T* power_en, A7670C_Pin_T* power_key, A7670C_Pin_T* power_status, A7670C_Pin_T* power_reset, A7670C_IO_T* uart)
{
    OS_LIST_INIT(&A7670C__RxHandler_List);
    
    A7670C__Instance.power_en = power_en;
    A7670C__Instance.power_key = power_key;
    A7670C__Instance.power_status = power_status;
    A7670C__Instance.power_reset = power_reset;
    A7670C__Instance.IO = uart;

    ////////////////////////////////////////////////////////////////////////////////
    ////
    
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
static int A7670C_Startup_State=A7670C_STARTUP_STATE_UNINITIALIZED;

int A7670C_GetStartupState(void){
    return A7670C_Startup_State;
}

void A7670C_SetStartupState(int state){
    A7670C_Startup_State = state;
}

os_size_t A7670C_Send(uint8_t* data, os_size_t size)
{
    return A7670C__Instance.IO->send(data, (int)size);
}

A7670C_Result A7670C_RequestWithHandler(A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks)
{
    A7670C_RxHandler_Register_T Register;
    
    OS_LIST_INIT(&Register.node);
    Register.handler = rxHandler;
    Register.userdata = userdata;
    
    A7670C_Lock();
    OS_LIST_INSERT_BEFORE(&A7670C__RxHandler_List, &Register.node);
    A7670C_Result res = A7670C_TimedWait(ticks);
    OS_LIST_REMOVE(&Register.node);
    A7670C_UnLock();
    
    return res;
}

A7670C_Result A7670C_RequestWithCmd(A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks, const char* command)
{
    A7670C_Result err;
    A7670C_RxHandler_Register_T Register;
    
    
    OS_LIST_INIT(&Register.node);
    Register.handler = rxHandler;
    Register.userdata = userdata;
    
    A7670C_Lock();
    OS_LIST_INSERT_BEFORE(&A7670C__RxHandler_List, &Register.node);
    A7670C_Send((uint8_t*)command, strlen(command));
    err = A7670C_TimedWait(ticks);
    OS_LIST_REMOVE(&Register.node);
    A7670C_UnLock();

    return err;
}

A7670C_Result A7670C_RequestWithArgs(A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks, const char* fmt, ...)
{
    va_list ap;
    A7670C_Result err;
    A7670C_RxHandler_Register_T Register;
    
    OS_LIST_INIT(&Register.node);
    Register.handler = rxHandler;
    Register.userdata = userdata;

    A7670C_Lock();
    {
        va_start(ap, fmt);
        memset(A7670C__Printf_Buffer, 0, sizeof(A7670C__Printf_Buffer));
        int size = vsnprintf(A7670C__Printf_Buffer, sizeof(A7670C__Printf_Buffer), fmt, ap);
        va_end(ap);
        
        OS_LIST_INSERT_BEFORE(&A7670C__RxHandler_List, &Register.node);
        A7670C_Send((uint8_t*)A7670C__Printf_Buffer, size);
        err = A7670C_TimedWait(ticks);
        OS_LIST_REMOVE(&Register.node);
        
    }
    A7670C_UnLock();

    return err;
}

A7670C_Result A7670C_TimedWait(os_tick_t ticks)
{
    os_err_t  err = A7670C__Instance.IO->wait(ticks);
    if(err==OS_ETIMEOUT){
        printf("Thd:%s A7670C_TimedWait Timeout!\n", os_thread_self()->name);
    }
    return (err==OS_ETIMEOUT)?kA7670C_Result_TIMEOUT:kA7670C_Result_OK;
}

void A7670C_Notify(void){
    A7670C__Instance.IO->notify();
}

A7670C_RxHandler_Result A7670C_HandleRequest(sdk_ringbuffer_t* buffer)
{
    os_list_t * head = &A7670C__RxHandler_List;
    os_list_node_t * node;
    A7670C_RxHandler_Result result;
    for(node = OS_LIST_NEXT(head); node!=head; node = OS_LIST_NEXT(node)){
        A7670C_RxHandler_Register_T* Register = OS_CONTAINER_OF(node, A7670C_RxHandler_Register_T, node);
        if(Register->handler){
            result = Register->handler(buffer, Register->userdata);
            if(result!=kA7670C_RxHandler_Result_SKIP && result!=kA7670C_RxHandler_Result_CONTINUE /* 需要更多信息来处理 */){
                return result;
            }
        }
    }
}

void A7670C_InsertRxHandlerHead(A7670C_RxHandler_Register_T* Register){
    OS_LIST_INIT(&Register->node);
    OS_LIST_INSERT_AFTER(&A7670C__RxHandler_List, &Register->node);
}

void A7670C_InsertRxHandlerTail(A7670C_RxHandler_Register_T* Register){
    OS_LIST_INIT(&Register->node);
    OS_LIST_INSERT_BEFORE(&A7670C__RxHandler_List, &Register->node);
}

void A7670C_RemoveRxHandler(A7670C_RxHandler_Register_T* Register)
{
    OS_LIST_REMOVE(&Register->node);
}
