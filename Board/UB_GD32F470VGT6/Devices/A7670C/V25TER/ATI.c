#include <ATI.h>
#include <stdio.h>

////////////////////////////////////////////////////////////////////////////////
////
static A7670C_RxHandler_Result Read_Handler(sdk_ringbuffer_t * buffer, void* ud){
    A7670C_ATI_Response* response = (A7670C_ATI_Response*)ud;
    int err;
    sdk_ringbuffer_text_t text;
    os_size_t buffer_size = sdk_ringbuffer_used(buffer);
    if(sdk_ringbuffer_cut(&text, buffer, 0, buffer_size, "GCAP:", "\r\n")==0){
        /*读取完成*/
        err = sdk_ringbuffer_cut(&text, buffer, 0, buffer_size, "Manufacturer: ", "\r\n");
        if(err!=0){
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;/*这是错误的数据，丢弃*/
        }
        sdk_ringbuffer_memcpy(response->Manufacturer, buffer, text.start, text.end-text.start);

        err = sdk_ringbuffer_cut(&text, buffer, 0, buffer_size, "Model: ", "\r\n");
        if(err!=0){
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;/*这是错误的数据，丢弃*/
        }
        sdk_ringbuffer_memcpy(response->Model, buffer, text.start, text.end-text.start);

        err = sdk_ringbuffer_cut(&text, buffer, 0, buffer_size, "Revision: ", "\r\n");
        if(err!=0){
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;/*这是错误的数据，丢弃*/
        }
        sdk_ringbuffer_memcpy(response->Revision, buffer, text.start, text.end-text.start);


        err = sdk_ringbuffer_cut(&text, buffer, 0, buffer_size, "IMEI: ", "\r\n");
        if(err!=0){
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            return kA7670C_RxHandler_Result_RESET;/*这是错误的数据，丢弃*/
        }
        sdk_ringbuffer_memcpy(response->IMEI, buffer, text.start, text.end-text.start);

        err = sdk_ringbuffer_cut(&text, buffer, 0, buffer_size, "GCAP: ", "\r\n");
        if(err==0){
            sdk_ringbuffer_iter_t iter;
            sdk_ringbuffer_iter_init(&iter, &text);
            int GCAP_Size = sdk_ringbuffer_count(buffer, text.start, text.end, ",")+1;
            response->GCAP_Size = GCAP_Size;
            int i=0;
            while(sdk_ringbuffer_iter(&iter, ",")==0){
                sdk_ringbuffer_memcpy(response->GCAP[i++].name, buffer, iter.start, iter.end-iter.start);
            }
        }else{
            response->GCAP_Size=0;
        }
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        return kA7670C_RxHandler_Result_DONE;
    }

    return kA7670C_RxHandler_Result_CONTINUE;
}


////////////////////////////////////////////////////////////////////////////////
////


A7670C_Result A7670C_ATI_Read(A7670C_ATI_Response* response, os_uint_t timeout_ms)
{
    return A7670C_RequestWithCmd(__FUNCTION__, Read_Handler, response, os_tick_from_millisecond(timeout_ms), "ATI\r\n");
}
