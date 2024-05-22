#ifndef INCLUDED_A7670C_MQTT_H
#define INCLUDED_A7670C_MQTT_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_CMQTTSTART_H
#include <CMQTTSTART.h>
#endif /*INCLUDED_CMQTTSTART_H*/

#ifndef INCLUDED_CMQTTSTOP_H
#include <CMQTTSTOP.h>
#endif /*INCLUDED_CMQTTSTOP_H*/

#ifndef INCLUDED_CMQTTACCQ_H
#include <CMQTTACCQ.h>
#endif /*INCLUDED_CMQTTACCQ_H*/

#ifndef INCLUDED_CMQTTREL_H
#include <CMQTTREL.h>
#endif /*INCLUDED_CMQTTREL_H*/

#ifndef INCLUDED_CMQTTSSLCFG_H
#include <CMQTTSSLCFG.h>
#endif /*INCLUDED_CMQTTSSLCFG_H*/

#ifndef INCLUDED_CMQTTWILLTOPIC_H
#include <CMQTTWILLTOPIC.h>
#endif /*INCLUDED_CMQTTWILLTOPIC_H*/

#ifndef INCLUDED_CMQTTWILLMSG_H
#include <CMQTTWILLMSG.h>
#endif /*INCLUDED_CMQTTWILLMSG_H*/

#ifndef INCLUDED_CMQTTCONNECT_H
#include <CMQTTCONNECT.h>
#endif /*INCLUDED_CMQTTCONNECT_H*/

#ifndef INCLUDED_CMQTTDISC_H
#include <CMQTTDISC.h>
#endif /*INCLUDED_CMQTTDISC_H*/

#ifndef INCLUDED_CMQTTTOPIC_H
#include <CMQTTTOPIC.h>
#endif /*INCLUDED_CMQTTTOPIC_H*/

#ifndef INCLUDED_CMQTTPAYLOAD_H
#include <CMQTTPAYLOAD.h>
#endif /*INCLUDED_CMQTTPAYLOAD_H*/

#ifndef INCLUDED_CMQTTPUB_H
#include <CMQTTPUB.h>
#endif /*INCLUDED_CMQTTPUB_H*/

#ifndef INCLUDED_CMQTTSUBTOPIC_H
#include <CMQTTSUBTOPIC.h>
#endif /*INCLUDED_CMQTTSUBTOPIC_H*/

#ifndef INCLUDED_CMQTTSUB_H
#include <CMQTTSUB.h>
#endif /*INCLUDED_CMQTTSUB_H*/

#ifndef INCLUDED_CMQTTUNSUBTOPIC_H
#include <CMQTTUNSUBTOPIC.h>
#endif /*INCLUDED_CMQTTUNSUBTOPIC_H*/

#ifndef INCLUDED_CMQTTUNSUB_H
#include <CMQTTUNSUB.h>
#endif /*INCLUDED_CMQTTUNSUB_H*/

#ifndef INCLUDED_CMQTTCFG_H
#include <CMQTTCFG.h>
#endif /*INCLUDED_CMQTTCFG_H*/

#ifndef INCLUDED_STDARG_H
#define INCLUDED_STDARG_H
#include <stdarg.h>
#endif /*INCLUDED_STDARG_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef void (*A7670C_MQTT_RxDataHandler)(void* data, int data_size, void* userdata);

typedef enum{
    kA7670C_MQTT_State_IDLE = 0,
    kA7670C_MQTT_State_START = 1,
    kA7670C_MQTT_State_ACCQ,
    kA7670C_MQTT_State_CFG,
    kA7670C_MQTT_State_CONNECT,
    kA7670C_MQTT_State_SUBTOPIC,
    kA7670C_MQTT_State_SUB,
    kA7670C_MQTT_State_TOPIC,
    kA7670C_MQTT_State_PAYLOAD,
    kA7670C_MQTT_State_PUB,
    kA7670C_MQTT_State_UNSUBTOPIC,
    kA7670C_MQTT_State_UNSUB,
    kA7670C_MQTT_State_DISC,
    kA7670C_MQTT_State_REL,
    kA7670C_MQTT_State_STOP,
    kA7670C_MQTT_State_RECV,
    kA7670C_MQTT_State_CONNLOST,
}A7670C_MQTT_State;

typedef struct A7670C_MQTT_CMQTTRX_Context{
    char rx_topic[256];
    uint8_t rx_payload[10240]; /*一次最大能接收的数据*/
    int rx_payload_size;
    int rx_topic_size;
}A7670C_MQTT_CMQTTRX_Context;

typedef struct A7670C_MQTT_RxDataHandler_Record{
    A7670C_MQTT_RxDataHandler rxDataHandler;
    void* userdata;
}A7670C_MQTT_RxDataHandler_Record;

typedef struct A7670C_MQTT_Session{
    A7670C_Client_Index client_index;
    A7670C_MQTT_State state ;
    A7670C_MQTT_RxDataHandler_Record rxDataHandlerRecord;
    A7670C_MQTT_CMQTTRX_Context rx_context;
    void(*OnConnectLost)();
}A7670C_MQTT_Session;


////////////////////////////////////////////////////////////////////////////////
////

void A7670C_MQTT_Init(A7670C_MQTT_Session* session
                      , A7670C_MQTT_RxDataHandler rxDataHandler, void* userdata
                      , void (*OnConnectLost)(void));

A7670C_Result A7670C_MQTT_Connect(
        A7670C_MQTT_Session* session
        , const char* clientID
        , const char* server_addr
        , int keepalive_time
        , bool clean_session
        , __OPTIONAL const char* username
        , __OPTIONAL const char* password
    );


A7670C_Result A7670C_MQTT_Disconnect(A7670C_MQTT_Session* session, int timeout_s /* 60s - 180s*/, bool stopAfterDisconnect);

A7670C_Result A7670C_MQTT_SubscribeOneTopic(
        A7670C_MQTT_Session* session
        , const char* topic
        , A7670C_Qos qos
        , A7670C_Bool dup
        );

A7670C_Result A7670C_MQTT_SubscribeTopics(
        A7670C_MQTT_Session* session
        , A7670C_Bool dup
        , const char* topic, /* {topic, qos} */
        ... /* 以 NULL 结尾 */
);


A7670C_Result A7670C_MQTT_UnsubscribeOneTopic(
        A7670C_MQTT_Session* session
        , const char* topic
        , A7670C_Bool dup
        );

A7670C_Result A7670C_MQTT_UnsubscribeTopics(
        A7670C_MQTT_Session* session
        , A7670C_Bool dup
        , const char* topic
        , ...
);


A7670C_Result A7670C_MQTT_Publish(
    A7670C_MQTT_Session* session
    , const char* topic
    , uint8_t * data
    , int data_size
    , A7670C_Qos qos
    , int pub_timeout
    , A7670C_Bool retained
    , A7670C_Bool dup
);


#endif /* INCLUDED_A7670C_MQTT_H */
