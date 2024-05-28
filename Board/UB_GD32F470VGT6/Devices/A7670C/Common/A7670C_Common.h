#ifndef INCLUDED_A7670C_COMMON_H
#define INCLUDED_A7670C_COMMON_H

#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

#ifndef INCLUDED_SDK_RINGBUFFER_H
#include <sdk_ringbuffer.h>
#endif /*INCLUDED_SDK_RINGBUFFER_H*/

////////////////////////////////////////////////////////////////////////////////
////
#define __OPTIONAL

////////////////////////////////////////////////////////////////////////////////
////


typedef enum A7670C_RxHandler_Result{
    kA7670C_RxHandler_Result_CONTINUE=1,
    kA7670C_RxHandler_Result_DONE=2,
    kA7670C_RxHandler_Result_RESET=3,
    kA7670C_RxHandler_Result_SKIP=4,
}A7670C_RxHandler_Result;

typedef A7670C_RxHandler_Result (*A7670C_RxHandler_T)(sdk_ringbuffer_t * buffer, void* userdata);

typedef struct A7670C_Pin_S{
    void (*on)(void);
    void (*off)(void);
    uint8_t (*read)(void);
}A7670C_Pin_T;

typedef struct A7670C_IO_S{
    void (*setRxHandler)(void* handler, void* userdata);
    void (*setDefaultRxHandler)(void* handler, void* userdata);
    os_err_t (*wait)(os_time_t timeout_ms);
    int (*send)(uint8_t * data, int size);
    os_err_t (*notify)(void);
}A7670C_IO_T;


typedef struct A7670C_Device_S A7670C_Device_T;

typedef enum A7670C_Result{
    kA7670C_Result_OK = 0,
    kA7670C_Result_ERROR = -1,
    kA7670C_Result_TIMEOUT = -2,
}A7670C_Result;

typedef enum A7670C_Response_Code{
    kA7670C_Response_Code_OK=0,
    kA7670C_Response_Code_ERROR,
}A7670C_Response_Code;


typedef struct A7670C_RxHandler_Handle{
    A7670C_RxHandler_T rxHandler;
    void* userdata;
}A7670C_RxHandler_Handle;

typedef enum A7670C_Qos{
    kA7670C_Qos_0=0,
    kA7670C_Qos_1=1,
    kA7670C_Qos_2=2,
}A7670C_Qos;

typedef enum A7670C_Bool{
    kA7670C_Bool_No = 0,
    kA7670C_Bool_Yes = 1,
    kA7670C_Bool_Unspecified = 2,
}A7670C_Bool;

typedef enum A7670C_Client_Index{
    kA7670C_Client_Index_0=0,
    kA7670C_Client_Index_1=1,
}A7670C_Client_Index;


////////////////////////////////////////////////////////////////////////////////
////
C__STATIC_FORCEINLINE void A7670C_NopDelay(uint32_t delay){
    os_critical_enter();
    while(delay--){
    }
    os_critical_leave();
}

////////////////////////////////////////////////////////////////////////////////
////

A7670C_Device_T* A7670C_Init(A7670C_Pin_T* power_en, A7670C_Pin_T* power_key, A7670C_Pin_T* power_status, A7670C_Pin_T* power_reset, A7670C_IO_T* usart);

void A7670C_ResetBuffer(void);

void A7670C_PowerOn(void);
void A7670C_PowerOff(void);
os_bool_t A7670C_IsPowerOn(void);

os_size_t A7670C_Send(uint8_t* data, os_size_t size);

void A7670C_SetRxHandler(A7670C_RxHandler_Handle* previousHandle, A7670C_RxHandler_T* rxHandler, void* userdata);

void A7670C_RestoreRxHandler(A7670C_RxHandler_Handle* rxHandlerHandle);

void A7670C_SetDefaultRxHandler(A7670C_RxHandler_T* rxHandler, void* userdata);

void A7670C_Lock(void);

void A7670C_UnLock(void);

os_err_t A7670C_TimedLock(os_tick_t ticks);

A7670C_Result A7670C_RequestWithArgs(A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks, const char* fmt, ...);
A7670C_Result A7670C_RequestWithCmd(A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks, const char* command);
A7670C_Result A7670C_RequestWithHandler(A7670C_RxHandler_T rxHandler, void* userdata, os_tick_t ticks);

A7670C_Result A7670C_TimedWait(os_tick_t ticks);

void A7670C_Notify(void);

#endif /* INCLUDED_A7670C_COMMON_H */
