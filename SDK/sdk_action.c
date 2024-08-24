#include <sdk_action.h>

int sdk_action_init(sdk_action_t * action, const char* name
        , sdk_action_function_t initialize_function
        , sdk_action_function_t update_function
        , sdk_action_function_t cleanup_function
        , void* userdata)
{
    sdk_object_init(&action->object, kSDK_ObjectType_Action, name, userdata);
    action->initialize_function = initialize_function;
    action->update_function = update_function;
    action->cleanup_function = cleanup_function;
    action->status = kSDK_ActionStatus_UNINITIALIZED;

    return 0;
}


sdk_action_status_t sdk_action_update(sdk_action_t *action)
{
    if(action->status == kSDK_ActionStatus_TERMINATED){
        return kSDK_ActionStatus_TERMINATED;
    }else if(action->status == kSDK_ActionStatus_RUNNING){
        if(action->update_function){
            action->status = action->update_function(action);
        }else{
            action->status = kSDK_ActionStatus_TERMINATED;
        }
    }
    return action->status;
}

int sdk_action_cleanup(sdk_action_t * action){
    if(action->status == kSDK_ActionStatus_TERMINATED){
        if(action->cleanup_function){
            action->cleanup_function(action);
        }
    }
    action->status = kSDK_ActionStatus_UNINITIALIZED;
    return 0;
}

int sdk_action_initialize(sdk_action_t * action){
    if(action->status==kSDK_ActionStatus_UNINITIALIZED){
        if(action->initialize_function){
            action->initialize_function(action);
        }
    }
    action->status = kSDK_ActionStatus_RUNNING;
    return 0;
}

