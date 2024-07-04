#include <ATE.h>

static A7670C_RxHandler_Result Exec_Handler(sdk_ringbuffer_t * buffer, void* ud){
    A7670C_ATE_Exec_Response* response = (A7670C_ATE_Exec_Response*) ud;
    
    if(sdk_ringbuffer_find_str(buffer, 0, "OK\r\n")!=-1){
        response->code = kA7670C_Response_Code_OK;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    if(sdk_ringbuffer_find_str(buffer, 0, "ERROR\r\n")!=-1){
        response->code = kA7670C_Response_Code_OK;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }
    
    return kA7670C_RxHandler_Result_CONTINUE;
}

A7670C_Result A7670C_ATE_Exec(A7670C_ATE_Exec_Response* response, A7670C_ATE_Command cmd, uint32_t timeout_ms)
{
    return A7670C_RequestWithArgs("ATE_Exec", Exec_Handler, response, os_tick_from_millisecond(timeout_ms), "ATE%d\r\n", cmd);
}

