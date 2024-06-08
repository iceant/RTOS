#include <A7670C_MQTT.h>
#include <stdarg.h>
#include <string.h>
#include <stdio.h>
#include <sdk_hex.h>

////////////////////////////////////////////////////////////////////////////////
////
static os_thread_t      CMQTTRX_DataHandle_Thread;
static os_sem_t         CMQTTRX_DataHandle_Sem;
static uint8_t          CMQTTRX_DataHandle_Thread_Stack[1024];

////////////////////////////////////////////////////////////////////////////////
////

static void CMQTTRX_DataHandle_Thread_Entry(void* userdata){
    A7670C_MQTT_Session* session = userdata;
    while(1){
        os_sem_take(&CMQTTRX_DataHandle_Sem, OS_WAIT_INFINITY);
        if(session->rxDataHandlerRecord.rxDataHandler){
            session->rxDataHandlerRecord.rxDataHandler(session->rx_context.rx_payload
                                                       , session->rx_context.rx_payload_size
                                                       , session->rxDataHandlerRecord.userdata
                                                       );
        }
        
        if(session->state == kA7670C_MQTT_State_CONNLOST){
            if(session->OnConnectLost){
                session->OnConnectLost();
            }
        }
    }
}

// 读取 Downstream 的数据
static A7670C_RxHandler_Result A7670C_CMQTTRX_DownstreamHandler(sdk_ringbuffer_t * buffer, void* userdata)
{
    A7670C_MQTT_Session* session = (A7670C_MQTT_Session*)userdata;
    sdk_ringbuffer_text_t find_result;
    sdk_ringbuffer_iter_t iter;
    int write_idx = 0;
    A7670C_RxHandler_Result res = kA7670C_RxHandler_Result_SKIP;
    os_size_t buffer_used = sdk_ringbuffer_used(buffer);
    int find = sdk_ringbuffer_cut(&find_result, buffer, 0, (int)buffer_used, (const char*)"+CMQTTRXEND: ", "\r\n");
    if(find==0){
        sdk_hex_dump("CMQTTRXEND", buffer->buffer, buffer_used);
        find = sdk_ringbuffer_cut(&find_result, buffer, 0, (int)buffer_used, (const char*)"+CMQTTRXSTART: ", "\r\n");
        if(find!=0) {
            sdk_ringbuffer_reset(buffer);
            A7670C_Notify();
            res = kA7670C_RxHandler_Result_RESET;
            /*数据不正常，清除*/
            goto __skip;
        }
        sdk_ringbuffer_iter_init(&iter, &find_result);
        sdk_ringbuffer_iter(&iter, ",");/*client_index*/
        sdk_ringbuffer_iter(&iter, ",");/*topic_total_len*/
        session->rx_context.rx_topic_size = (int)sdk_ringbuffer_strtoul(buffer, iter.start, 0, 0);
        sdk_ringbuffer_iter(&iter, ",");/*payload_total_len*/
        session->rx_context.rx_payload_size = (int)sdk_ringbuffer_strtoul(buffer, iter.start, 0, 0);
    
        write_idx = 0;
        int find_start = find_result.end;
        for(;;){
            /*topic*/
            find = sdk_ringbuffer_cut(&find_result, buffer, find_start, buffer_used, "+CMQTTRXTOPIC: ", "\r\n");
            if(find!=0){
                sdk_ringbuffer_reset(buffer);
                A7670C_Notify();
                res = kA7670C_RxHandler_Result_RESET;
                goto __skip;
            }
            
            sdk_ringbuffer_iter_init(&iter, &find_result);
            sdk_ringbuffer_iter(&iter, ",");/*client_index*/
            sdk_ringbuffer_iter(&iter, ",");/*sub_topic_len*/
            int sub_topic_len = (int)sdk_ringbuffer_strtoul(buffer, iter.start, 0,0);

            find = sdk_ringbuffer_cut(&find_result, buffer, find_result.end, buffer_used, "\r\n", "\r\n");
            if(find!=0){
                sdk_ringbuffer_reset(buffer);
                A7670C_Notify();
                res = kA7670C_RxHandler_Result_RESET;
                goto __skip;
            }

            /*topic text*/
            sdk_ringbuffer_try_read(buffer, find_result.start, session->rx_context.rx_topic+write_idx, sub_topic_len);
            write_idx += sub_topic_len;
            if(write_idx==session->rx_context.rx_topic_size){
                session->rx_context.rx_topic[session->rx_context.rx_topic_size]='\0';
                break;
            }
            find_start = find_result.end;
        }
        find_start = find_result.end;
        write_idx = 0;
        
        for(;;){
            /*payload*/
            find = sdk_ringbuffer_cut(&find_result, buffer, find_start, buffer_used, "+CMQTTRXPAYLOAD: ", "\r\n");
            if(find!=0){
                sdk_ringbuffer_reset(buffer);
                A7670C_Notify();
                res = kA7670C_RxHandler_Result_RESET;
                goto __skip;
            }
            sdk_ringbuffer_iter_init(&iter, &find_result);
            
            sdk_ringbuffer_iter(&iter, ",");/*client_index*/
            sdk_ringbuffer_iter(&iter, ",");/*sub_payload_len*/
            int sub_payload_len = sdk_ringbuffer_strtoul(buffer, iter.start, 0, 0);

            sdk_ringbuffer_try_read(buffer, iter.end+2, session->rx_context.rx_payload+write_idx, sub_payload_len);
            write_idx+=sub_payload_len;

            if(write_idx==session->rx_context.rx_payload_size){
                break;
            }
            find_start = find_result.end+2;
        }

        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();

        os_sem_release(&CMQTTRX_DataHandle_Sem);
        return kA7670C_RxHandler_Result_DONE;
    }
    
    find = sdk_ringbuffer_cut(&find_result, buffer, 0, (int)buffer_used, "+CMQTTCONNLOST: ", "\r\n");
    if(find==0){
        sdk_hex_dump("CMQTTCONNLOST", buffer->buffer, buffer_used);
        session->state = kA7670C_MQTT_State_CONNLOST;
        sdk_ringbuffer_reset(buffer);
        A7670C_Notify();
        os_sem_release(&CMQTTRX_DataHandle_Sem);
        return kA7670C_RxHandler_Result_DONE;
    }
__skip:
    return res;
    
}

////////////////////////////////////////////////////////////////////////////////
////
void A7670C_MQTT_Init(A7670C_MQTT_Session* session, A7670C_MQTT_RxDataHandler rxDataHandler, void* userdata, void (*OnConnectLost)(void))
{
    session->client_index = kA7670C_Client_Index_0;
    session->state = kA7670C_MQTT_State_IDLE;
    session->rx_context.rx_payload[0]='\0';
    session->rx_context.rx_payload_size=0;
    session->rx_context.rx_topic[0]='\0';
    session->rx_context.rx_topic_size=0;
    session->OnConnectLost = OnConnectLost;


    session->rxDataHandlerRecord.rxDataHandler = rxDataHandler;
    session->rxDataHandlerRecord.userdata = userdata;
    A7670C_SetDefaultRxHandler(A7670C_CMQTTRX_DownstreamHandler, session);

    os_sem_init(&CMQTTRX_DataHandle_Sem, "MQTT_RxSem", 0, OS_QUEUE_FIFO);
    
    os_thread_init(&CMQTTRX_DataHandle_Thread
                   , "MQTT-RxHandler"
                   , CMQTTRX_DataHandle_Thread_Entry, session
                   , CMQTTRX_DataHandle_Thread_Stack, sizeof(CMQTTRX_DataHandle_Thread_Stack)
                   , 20, 10
                   );
    os_thread_startup(&CMQTTRX_DataHandle_Thread);
}

A7670C_Result A7670C_MQTT_Connect(
        A7670C_MQTT_Session* session
        , const char* clientID
        , const char* server_addr
        , int keepalive_time
        , bool clean_session
        , __OPTIONAL const char* username
        , __OPTIONAL const char* password
){
    A7670C_Result result;
    int nRetry = 3;

    if(session->state == kA7670C_MQTT_State_IDLE || session->state==kA7670C_MQTT_State_STOP || session->state == kA7670C_MQTT_State_CONNLOST){
        /*第一次调用，启动*/
        printf("MQTT Connect Start...\n");
        nRetry = 3;
        while(1){
            A7670C_CMQTTSTART_Exec_Response CMQTTSTART_Response;
            result = A7670C_CMQTTSTART_Exec(&CMQTTSTART_Response, 12000);
            if(CMQTTSTART_Response.code==kA7670C_Response_Code_OK){
                break;
            }

            if(CMQTTSTART_Response.err_code == -1){
                /*-1: 表示已经打开过， 可以进行下一步*/
                break;
            }

            printf("CMQTTSTART_Response %d, err=%d\n", result, CMQTTSTART_Response.err_code);

            if(nRetry-- == 0){
                return kA7670C_Result_ERROR;
            }
        }

        session->state = kA7670C_MQTT_State_START;
    }
    
    if(session->state == kA7670C_MQTT_State_START){
        nRetry = 3;

        while(1){
            A7670C_CMQTTACCQ_Read_Response CMQTTACCQ_Response;
            printf("MQTT ACCQ Read...\n");
            result = A7670C_CMQTTACCQ_Read(&CMQTTACCQ_Response, 12000);
            if(CMQTTACCQ_Response.code!=kA7670C_Response_Code_OK){
                printf("CMQTTACCQ_Response FAILED!\n");
            }else{
                break;
            }

            if(strlen(CMQTTACCQ_Response.records[session->client_index].client_id)==0){
                /*没有获取*/
                printf("MQTT ACCQ Write...\n");
                A7670C_CMQTTACCQ_Write_Response CMQTTACCQ_Write_Response;
                result = A7670C_CMQTTACCQ_Write(&CMQTTACCQ_Write_Response, session->client_index, clientID, kA7670C_CMQTTACCQ_ServerType_TCP, 12000);
                if(CMQTTACCQ_Write_Response.code!=kA7670C_Response_Code_OK){
                    /*超时了*/
                    printf("CMQTTACCQ_Write_Response FAILED!\n");
                }else{
                    break;
                }
            }else{
                session->state = kA7670C_MQTT_State_ACCQ;
                break;
            }

            if(nRetry-- == 0){
                return kA7670C_Result_ERROR;
            }

            A7670C_NopDelay(0x3FFFFF);
        }
    }
    
    if(session->state == kA7670C_MQTT_State_ACCQ){
        A7670C_CMQTTCFG_Write_Response CMQTTCFG_Write_Response={0};
        printf("MQTT CFG Write...\n");
        result = A7670C_CMQTTCFG_SetUTF8(&CMQTTCFG_Write_Response, session->client_index, false, 24000);
        if(CMQTTCFG_Write_Response.code!=kA7670C_Response_Code_OK){
            printf("[A7670C_MQTT] CMQTTCFG SetUTF8 Failed!\n");
        }

        /*设置操作超时*/
        printf("MQTT CFG Write2...\n");
        A7670C_CMQTTCFG_Write_Response CMQTTCFG_Write_Response2={0};
        result = A7670C_CMQTTCFG_SetTimeout(&CMQTTCFG_Write_Response2, session->client_index, 120 /* 20s - 120s */,
                                            12000);
        if(CMQTTCFG_Write_Response2.code!=kA7670C_Response_Code_OK){
            printf("[A7670C_MQTT] CMQTTCFG SetTimeout Failed!\n");
        }

        session->state = kA7670C_MQTT_State_CFG;
    }
    
    if(session->state<kA7670C_MQTT_State_CONNECT){
        nRetry = 3;
        while(1){
            A7670C_CMQTTCONNECT_Write_Response CMQTTCONNECT_Write_Response;
            printf("MQTT CONNECT Write...\n");
            result = A7670C_CMQTTCONNECT_Write(&CMQTTCONNECT_Write_Response, session->client_index
                                               , server_addr
                                               , keepalive_time
                                               , clean_session, username, password, 9000);
            if(CMQTTCONNECT_Write_Response.err_code==19){
                break;
            }
            if(CMQTTCONNECT_Write_Response.code==kA7670C_Response_Code_OK){
                break;
            }

            printf("[MQTT] ERR - CMQTTCONNECT_Write_Response %d, err=%d\n"
                    , CMQTTCONNECT_Write_Response.code
                    , CMQTTCONNECT_Write_Response.err_code);

            if(nRetry-- == 0){
                return kA7670C_Result_ERROR;
            }
        }
        session->state=kA7670C_MQTT_State_CONNECT;
        return kA7670C_Result_OK;
    }
    
    return kA7670C_Result_ERROR;
}


A7670C_Result A7670C_MQTT_Disconnect(A7670C_MQTT_Session* session, int timeout_s /* 60s - 180s*/, bool stopAfterDisconnect)
{
    A7670C_Result result;
    
    if(session->state>=kA7670C_MQTT_State_CONNECT && session->state<kA7670C_MQTT_State_DISC){
        A7670C_CMQTTDISC_Write_Response CMQTTDISC_Write_Response;
        result = A7670C_CMQTTDISC_Write(&CMQTTDISC_Write_Response, session->client_index, 60, 12000);
        if(CMQTTDISC_Write_Response.code!=kA7670C_Response_Code_OK){
            return kA7670C_Result_ERROR;
        }
        if(CMQTTDISC_Write_Response.err_code>0){
            printf("[MQTT] ERR - CMQTTDISC_Write_Response err=%d\n", CMQTTDISC_Write_Response.err_code);
            return kA7670C_Result_ERROR;
        }
        
        session->state = kA7670C_MQTT_State_DISC;
    }
    
    if(session->state==kA7670C_MQTT_State_DISC){
        A7670C_CMQTTREL_Write_Response CMQTTREL_Write_Response;
        result = A7670C_CMQTTREL_Write(&CMQTTREL_Write_Response, session->client_index, 12000);
        if(CMQTTREL_Write_Response.code!=kA7670C_Response_Code_OK){
            return kA7670C_Result_ERROR;
        }
        if(CMQTTREL_Write_Response.err_code>0){
            printf("[MQTT] ERR - CMQTTREL_Write_Response err=%d\n", CMQTTREL_Write_Response.err_code);
            return kA7670C_Result_ERROR;
        }
        
        session->state = kA7670C_MQTT_State_REL;
    }

    if(stopAfterDisconnect){
        if(session->state>=kA7670C_MQTT_State_DISC && session->state<kA7670C_MQTT_State_STOP){
            A7670C_CMQTTSTOP_Exec_Response CMQTTSTOP_Exec_Response;
            result = A7670C_CMQTTSTOP_Exec(&CMQTTSTOP_Exec_Response, 12000);
            if(CMQTTSTOP_Exec_Response.code!=kA7670C_Response_Code_OK){
                return kA7670C_Result_ERROR;
            }
            if(CMQTTSTOP_Exec_Response.err_code>0){
                printf("[MQTT] ERR - CMQTTSTOP_Exec_Response err=%d\n", CMQTTSTOP_Exec_Response.err_code);
                return kA7670C_Result_ERROR;
            }

            session->state = kA7670C_MQTT_State_STOP;
        }
    }

    
    return kA7670C_Result_OK;
}

////////////////////////////////////////////////////////////////////////////////
////


A7670C_Result A7670C_MQTT_SubscribeOneTopic(
        A7670C_MQTT_Session* session
        , const char* topic
        , A7670C_Qos qos
        , A7670C_Bool dup
){
    A7670C_Result result;
    A7670C_CMQTTSUB_Write_Response CMQTTSUB_Write_Response;

    if(session->state>=kA7670C_MQTT_State_CONNECT && session->state<kA7670C_MQTT_State_DISC){
    result = A7670C_CMQTTSUB_Write2(&CMQTTSUB_Write_Response, session->client_index, topic, qos, dup, 12000);
        if(CMQTTSUB_Write_Response.code!=kA7670C_Response_Code_OK){
            return kA7670C_Result_ERROR;
        }
        if(CMQTTSUB_Write_Response.err_code>0){
            printf("[MQTT] ERR - CMQTTSUB_Write_Response err=%d\n", CMQTTSUB_Write_Response.err_code);
            return kA7670C_Result_ERROR;
        }
        session->state = kA7670C_MQTT_State_SUB;
        return kA7670C_Result_OK;
    }
    
    return kA7670C_Result_ERROR;
}

A7670C_Result A7670C_MQTT_SubscribeTopics(
        A7670C_MQTT_Session* session
        , A7670C_Bool dup
        , const char* topic, /* {topic, qos} */
        ... /* 以 NULL 结尾 */
)
{
    A7670C_Result result;
    A7670C_Qos qos;
    va_list ap;

    int nTopic = 0;
    
    if(session->state>=kA7670C_MQTT_State_CONNECT && session->state<kA7670C_MQTT_State_DISC){
        va_start(ap, topic);
        while (topic){
            qos = va_arg(ap, int);
            
            A7670C_CMQTTSUBTOPIC_Write_Response CMQTTSUBTOPIC_Write_Response;
            result = A7670C_CMQTTSUBTOPIC_Write(&CMQTTSUBTOPIC_Write_Response, session->client_index, topic, qos, 12000);
            if(result!=kA7670C_Result_OK){
                return result;
            }
            if(CMQTTSUBTOPIC_Write_Response.err_code>0){
                printf("[MQTT] ERR - CMQTTSUBTOPIC_Write_Response err=%d\n", CMQTTSUBTOPIC_Write_Response.err_code);
                return kA7670C_Result_ERROR;
            }
            
            nTopic +=1;
            
            topic = va_arg(ap, char*);
            
            session->state = kA7670C_MQTT_State_SUBTOPIC;
        }
        va_end(ap);
        
        
        if(session->state==kA7670C_MQTT_State_SUBTOPIC){
            A7670C_CMQTTSUB_Write_Response CMQTTSUB_Write_Response;
            result = A7670C_CMQTTSUB_Write(&CMQTTSUB_Write_Response, session->client_index, dup, 12000);
            if(result!=kA7670C_Result_OK){
                return result;
            }
            if(CMQTTSUB_Write_Response.err_code>0){
                printf("[MQTT] ERR - CMQTTSUB_Write_Response err=%d\n", CMQTTSUB_Write_Response.err_code);
                return kA7670C_Result_ERROR;
            }

            session->state = kA7670C_MQTT_State_SUB;
            return kA7670C_Result_OK;
        }

    }
    
    
    return kA7670C_Result_ERROR;
    
}

A7670C_Result A7670C_MQTT_UnsubscribeOneTopic(
        A7670C_MQTT_Session* session
        , const char* topic
        , A7670C_Bool dup
) {
    A7670C_Result result;
    if (session->state >= kA7670C_MQTT_State_CONNECT && session->state < kA7670C_MQTT_State_DISC) {
    
        A7670C_CMQTTUNSUB_Write_Response CMQTTUNSUB_Write_Response;
        result = A7670C_CMQTTUNSUB_Write2(&CMQTTUNSUB_Write_Response, session->client_index, topic,  dup, 12000);
        if (result != kA7670C_Result_OK) {
            return result;
        }
        if (CMQTTUNSUB_Write_Response.err_code > 0) {
            printf("[MQTT] ERR - CMQTTUNSUB_Write_Response err=%d\n", CMQTTUNSUB_Write_Response.err_code);
            return kA7670C_Result_ERROR;
        }
        session->state = kA7670C_MQTT_State_UNSUB;
        return kA7670C_Result_OK;
    }else{
        printf("[MQTT] ERR - A7670C_MQTT_UnsubscribeOneTopic session state: %d\n", session->state);
    }
    
    return kA7670C_Result_ERROR;
}

A7670C_Result A7670C_MQTT_UnsubscribeTopics(
        A7670C_MQTT_Session* session
        , A7670C_Bool dup
        , const char* topic
        , ...
)
{
    A7670C_Result result;
    va_list ap;
    
    if(session->state>=kA7670C_MQTT_State_CONNECT && session->state<kA7670C_MQTT_State_DISC){
        va_start(ap, topic);
        for (; topic; topic = va_arg(ap, char*)){
            A7670C_CMQTTUNSUBTOPIC_Write_Response CMQTTUNSUBTOPIC_Write_Response;
            result = A7670C_CMQTTUNSUBTOPIC_Write(&CMQTTUNSUBTOPIC_Write_Response, session->client_index, topic, 12000);
            if(result!=kA7670C_Result_OK){
                return result;
            }
            if(CMQTTUNSUBTOPIC_Write_Response.err_code>0){
                printf("[MQTT] ERR - CMQTTUNSUBTOPIC_Write_Response err=%d\n", CMQTTUNSUBTOPIC_Write_Response.err_code);
                return kA7670C_Result_ERROR;
            }
            
            session->state = kA7670C_MQTT_State_UNSUBTOPIC;
        }
        va_end(ap);
        
        
        if(session->state==kA7670C_MQTT_State_UNSUBTOPIC){
            A7670C_CMQTTUNSUB_Write_Response CMQTTUNSUB_Write_Response;
            result = A7670C_CMQTTUNSUB_Write(&CMQTTUNSUB_Write_Response, session->client_index,  dup, 12000);
            if (result != kA7670C_Result_OK) {
                return result;
            }
            if (CMQTTUNSUB_Write_Response.err_code > 0) {
                printf("[MQTT] ERR - CMQTTUNSUB_Write_Response err=%d\n", CMQTTUNSUB_Write_Response.err_code);
                return kA7670C_Result_ERROR;
            }
            session->state = kA7670C_MQTT_State_UNSUB;
        }
        
        return kA7670C_Result_OK;
    }
    
    return kA7670C_Result_ERROR;
}



A7670C_Result A7670C_MQTT_Publish(
        A7670C_MQTT_Session* session
        , const char* topic
        , uint8_t * data
        , int data_size
        , A7670C_Qos qos
        , int pub_timeout
        , A7670C_Bool retained
        , A7670C_Bool dup
){
    A7670C_Result result = kA7670C_Result_ERROR;
    int nRetry;

    if(session->state>=kA7670C_MQTT_State_CONNECT && session->state<kA7670C_MQTT_State_DISC){
        nRetry = 10;
        while(1){
            A7670C_CMQTTTOPIC_Write_Response CMQTTTOPIC_Write_Response;
            result = A7670C_CMQTTTOPIC_Write(&CMQTTTOPIC_Write_Response, session->client_index, topic, 24000);
            if(CMQTTTOPIC_Write_Response.code==kA7670C_Response_Code_OK){
                break;
            }
            
            printf("[MQTT-PUB] CMQTTTOPIC_Write_Response code=%d, err=%d\n"
                    , CMQTTTOPIC_Write_Response.code
                    , CMQTTTOPIC_Write_Response.err_code);
            
            if(nRetry-- == 0){
                result = kA7670C_Result_ERROR;
                goto __error;
            }
        }
        session->state = kA7670C_MQTT_State_TOPIC;
        
        nRetry = 3;
        while(1){
            A7670C_CMQTTPAYLOAD_Write_Response CMQTTPAYLOAD_Write_Response;
            result = A7670C_CMQTTPAYLOAD_Write(&CMQTTPAYLOAD_Write_Response, session->client_index, data, data_size, 24000);
            if(CMQTTPAYLOAD_Write_Response.code==kA7670C_Response_Code_OK){
                break;
            }
            
            printf("[MQTT] ERR - CMQTTPAYLOAD_Write_Response code=%d, err=%d\n"
                   , CMQTTPAYLOAD_Write_Response.code
                   , CMQTTPAYLOAD_Write_Response.err_code);
            
            if(nRetry-- == 0){
                result = kA7670C_Result_ERROR;
                goto __error;
            }
        }
        session->state = kA7670C_MQTT_State_PAYLOAD;
        
        nRetry = 3;
        while(1){
            A7670C_CMQTTPUB_Write_Response CMQTTPUB_Write_Response;
            result = A7670C_CMQTTPUB_Write(&CMQTTPUB_Write_Response, session->client_index, qos, pub_timeout, retained, dup, 24000);
            if(CMQTTPUB_Write_Response.code==kA7670C_Response_Code_OK){
                break;
            }
            printf("[MQTT] ERR - CMQTTPUB_Write_Response code=%d, err=%d\n"
                   , CMQTTPUB_Write_Response.code
                   , CMQTTPUB_Write_Response.err_code
                   );
            
            if(nRetry-- == 0){
                result= kA7670C_Result_ERROR;
                goto __error;
            }
        }
        session->state = kA7670C_MQTT_State_PUB;
        
        return kA7670C_Result_OK;
    }

__error:

    return result;
}


