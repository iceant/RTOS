#ifndef INCLUDED_SDK_OBJECT_H
#define INCLUDED_SDK_OBJECT_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_SDK_DEFINITION_H
#include <sdk_definition.h>
#endif /*INCLUDED_SDK_DEFINITION_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef enum sdk_object_type_enum{
    kSDK_ObjectType_Action = 0,
    kSDK_ObjectType_Evaluator = 1,
}sdk_object_type_t;

typedef struct sdk_object_s{
    sdk_object_type_t type;
    char name[SDK_NAME_SIZE];
    void* userdata;
}sdk_object_t;


////////////////////////////////////////////////////////////////////////////////
////
int sdk_object_init(sdk_object_t * object, sdk_object_type_t type, const char* name, void* userdata);




#endif /*INCLUDED_SDK_OBJECT_H*/
