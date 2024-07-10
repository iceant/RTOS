#include <A7670C_Common.h>
#include <sdk_ringbuffer.h>

#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <os_kernel.h>
////////////////////////////////////////////////////////////////////////////////
////
struct A7670C_Device_S{
    A7670C_Pin_T* power_en;
    A7670C_Pin_T* power_key;
    A7670C_Pin_T* power_status;
    A7670C_Pin_T* power_reset;
    A7670C_IO_T * IO;
};

static A7670C_Device_T A7670C__Instance={0};

static os_sem_t rx_handler_lock={0};
static os_mutex_t A7670C__mutex={0};
static os_mutex_t A7670C__handler_lock={0};
static char A7670C__Printf_Buffer[256];

static os_list_t A7670C__RxHandler_List={.prev=&A7670C__RxHandler_List, .next=&A7670C__RxHandler_List};
static int A7670C_Startup_State=A7670C_STARTUP_STATE_UNINITIALIZED;

//static int A7670C__LatestBufferSize = 0;
//static int A7670C__SameSizeCount = 0;
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

    A7670C__Instance.power_key->on();
    A7670C_DelayMS(2000);

    A7670C__Instance.power_key->off();
    A7670C_DelayMS(2000);
}

void A7670C_PowerOff(void)
{
//    A7670C__Instance.power_en->on();
//    A7670C_DelayMS(2000);
//
    A7670C__Instance.power_key->off();
    A7670C_DelayMS(2000);
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
    A7670C_DelayMS(2500);
    A7670C__Instance.power_reset->off();
    A7670C_DelayMS(2000);
}
////////////////////////////////////////////////////////////////////////////////
////


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

A7670C_Result A7670C_RequestWithHandler(const char* name, A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks)
{
    A7670C_RxHandler_Register_T Register;
    A7670C_Result res = kA7670C_Result_ERROR;

    OS_LIST_INIT(&Register.node);
    Register.handler = rxHandler;
    Register.userdata = userdata;
    size_t name_size = strlen(name);
    memcpy(Register.name, name, name_size);
    Register.name[name_size]='\0';
    
    A7670C_Lock();
    A7670C_InsertRxHandlerHead(&Register);
    res = A7670C_TimedWait(ticks);
    OS_LIST_REMOVE(&Register.node);
    A7670C_UnLock();
    
    return res;
}

A7670C_Result A7670C_RequestWithCmd(const char* name, A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks, const char* command)
{
    A7670C_Result err = kA7670C_Result_ERROR;
    A7670C_RxHandler_Register_T Register;

    OS_LIST_INIT(&Register.node);
    Register.handler = rxHandler;
    Register.userdata = userdata;
    size_t name_size = strlen(name);
    memcpy(Register.name, name, name_size);
    Register.name[name_size]='\0';
    
    A7670C_Lock();
    A7670C_InsertRxHandlerHead(&Register);
    A7670C_Send((uint8_t*)command, strlen(command));
    err = A7670C_TimedWait(ticks);
    OS_LIST_REMOVE(&Register.node);
    A7670C_UnLock();

    return err;
}

A7670C_Result A7670C_RequestWithArgs(const char* name, A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks, const char* fmt, ...)
{
    va_list ap;
    A7670C_Result err=kA7670C_Result_ERROR;
    A7670C_RxHandler_Register_T Register;
    
    OS_LIST_INIT(&Register.node);
    Register.handler = rxHandler;
    Register.userdata = userdata;
    size_t name_size = strlen(name);
    memcpy(Register.name, name, name_size);
    Register.name[name_size]='\0';

    A7670C_Lock();
    {
        va_start(ap, fmt);
        memset(A7670C__Printf_Buffer, 0, sizeof(A7670C__Printf_Buffer));
        int size = vsnprintf(A7670C__Printf_Buffer, sizeof(A7670C__Printf_Buffer), fmt, ap);
        va_end(ap);

        A7670C_InsertRxHandlerHead(&Register);
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
        printf("[A7670C_COM] Thd:%s A7670C_TimedWait Timeout!\n", os_thread_self()->name);
    }
    return (err==OS_ETIMEOUT)?kA7670C_Result_TIMEOUT:kA7670C_Result_OK;
}

void A7670C_Notify(void){
    A7670C__Instance.IO->notify();
}

static bool is_valid_name(const char* name){

    if(name==0){
        return false;
    }

    char c;
    for(size_t i=0; i<255 && c!='\0'; i++){
        c = *name++;
        if(c<=0x20 || c>=0x7F){
            return false;
        }
    }

    return true;
}

A7670C_RxHandler_Result A7670C_HandleRequest(sdk_ringbuffer_t* buffer)
{
//    sdk_hex_dump("[A7670C_HREQ]", buffer->buffer, sdk_ringbuffer_used(buffer));
    os_list_node_t * node=0;
    A7670C_RxHandler_Result result = kA7670C_RxHandler_Result_SKIP;
    os_mutex_lock(&A7670C__handler_lock);
    for(node = A7670C__RxHandler_List.next; node!= &A7670C__RxHandler_List; node = OS_LIST_NEXT(node)){
        A7670C_RxHandler_Register_T* Register = OS_CONTAINER_OF(node, A7670C_RxHandler_Register_T, node);
        if(is_valid_name(Register->name)){
//            printf("[A7670C_COMMON] exec %s\n", Register->name);
            result = Register->handler(buffer, Register->userdata);
            if(kA7670C_RxHandler_Result_DONE==result){
//                sdk_ringbuffer_reset(buffer);
                break;
            }
        }
    }
    os_mutex_unlock(&A7670C__handler_lock);
    return result;

}

void A7670C_InsertRxHandlerHead(A7670C_RxHandler_Register_T* Register){
    OS_LIST_INIT(&Register->node);
    os_list_node_t * node;
    os_list_t * head = &A7670C__RxHandler_List;

    for(node = OS_LIST_NEXT(head); node!=head; node= OS_LIST_NEXT(node)){
        A7670C_RxHandler_Register_T* register_p = OS_CONTAINER_OF(node, A7670C_RxHandler_Register_T, node);
        if(register_p==Register || register_p->handler==Register->handler){
            return;
        }
    }

    os_mutex_lock(&A7670C__handler_lock);
    OS_LIST_INSERT_AFTER(&A7670C__RxHandler_List, &Register->node);
    os_mutex_unlock(&A7670C__handler_lock);
}

void A7670C_InsertRxHandlerTail(A7670C_RxHandler_Register_T* Register){
    OS_LIST_INIT(&Register->node);
    os_list_node_t * node;
    os_list_t * head = &A7670C__RxHandler_List;
    for(node = OS_LIST_NEXT(head); node!=head; node= OS_LIST_NEXT(node)){
        A7670C_RxHandler_Register_T* register_p = OS_CONTAINER_OF(node, A7670C_RxHandler_Register_T, node);
        if(register_p==Register || register_p->handler==Register->handler){
            return;
        }
    }
    OS_LIST_INSERT_BEFORE(&A7670C__RxHandler_List, &Register->node);
}

void A7670C_RemoveRxHandler(A7670C_RxHandler_Register_T* Register)
{
    OS_LIST_REMOVE(&Register->node);
}
