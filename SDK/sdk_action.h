#ifndef INCLUDED_SDK_ACTION_H
#define INCLUDED_SDK_ACTION_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_SDK_DEFINITION_H
#include <sdk_definition.h>
#endif /*INCLUDED_SDK_DEFINITION_H*/

#ifndef INCLUDED_SDK_OBJECT_H
#include <sdk_object.h>
#endif /*INCLUDED_SDK_OBJECT_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef struct sdk_action_s sdk_action_t;

typedef enum sdk_action_status_enum{
    kSDK_ActionStatus_UNINITIALIZED=0,
    kSDK_ActionStatus_RUNNING=1,
    kSDK_ActionStatus_TERMINATED=2,
    kSDK_ActionStatus_UNKNOWN=3,
}sdk_action_status_t;

typedef sdk_action_status_t (*sdk_action_function_t)(sdk_action_t* action);

struct sdk_action_s{
    sdk_object_t object;
    sdk_action_status_t status;
    sdk_action_function_t initialize_function;
    sdk_action_function_t update_function;
    sdk_action_function_t cleanup_function;
};

////////////////////////////////////////////////////////////////////////////////
////
int sdk_action_init(sdk_action_t * action, const char* name
                    , sdk_action_function_t initialize_function
                    , sdk_action_function_t update_function
                    , sdk_action_function_t cleanup_function
                    , void* userdata);

int sdk_action_initialize(sdk_action_t * action);
sdk_action_status_t sdk_action_update(sdk_action_t *action);
int sdk_action_cleanup(sdk_action_t * action);

#endif /*INCLUDED_SDK_ACTION_H*/
