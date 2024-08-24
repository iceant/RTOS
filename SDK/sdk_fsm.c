#include <sdk_fsm.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////
////

int sdk_fsm_state_init(sdk_fsm_state_t * state, const char* name,
                       sdk_action_function_t initialize_function ,
                       sdk_action_function_t update_function ,
                       sdk_action_function_t cleanup_function ,
                       void* userdata)
{
    sdk_action_init(&state->action, name, initialize_function, update_function, cleanup_function, userdata);
    SDK_LIST_INIT(&state->transition_list);
    SDK_LIST_INIT(&state->list_node);
    return 0;
}

int sdk_fsm_transition_init(sdk_fsm_transition_t * transition, const char* to_state_name
        , sdk_evaluator_function_t eval_function, void* userdata){
    SDK_LIST_INIT(&transition->list_node);
    sdk_evaluator_init(&transition->evaluator, "", eval_function, userdata);

    size_t name_size = strlen(to_state_name);
    name_size = (name_size > (SDK_NAME_SIZE-1))?(SDK_NAME_SIZE-1):name_size;
    memcpy(transition->to_state_name, to_state_name, name_size);
    transition->to_state_name[name_size] = '\0';

    return 0;
}

int sdk_fsm_state_add_transition(sdk_fsm_state_t * state, sdk_fsm_transition_t * transition) {
    sdk_list_node_t *node;
    sdk_list_node_t *header = &state->transition_list;
    for (node = SDK_LIST_NEXT(header); node != header; node = SDK_LIST_NEXT(node)) {
        sdk_fsm_transition_t *transition_p = SDK_LIST_DATA(node, sdk_fsm_transition_t, list_node);
        if (transition_p == transition) {
            /* already exist,  skip!! */
            return -1;
        }
    }

    SDK_LIST_INSERT_BEFORE(&state->transition_list, &transition->list_node);

    return 0;
}

int sdk_fsm_state_find_transition(sdk_fsm_state_t * state, const char* to_state, sdk_fsm_transition_t** result){
    sdk_list_node_t *node;
    sdk_list_node_t *header = &state->transition_list;
    for (node = SDK_LIST_NEXT(header); node != header; node = SDK_LIST_NEXT(node)) {
        sdk_fsm_transition_t *transition_p = SDK_LIST_DATA(node, sdk_fsm_transition_t, list_node);
        if (strcmp(to_state, transition_p->to_state_name)==0) {
            if(result){
                *result = transition_p;
            }
            return 0;
        }
    }
    return -1;
}

int sdk_fsm_find_state(sdk_fsm_t* fsm, const char* state_name, sdk_fsm_state_t** result)
{
    sdk_list_node_t *node;
    sdk_list_node_t *header = &fsm->state_list;
    for (node = SDK_LIST_NEXT(header); node != header; node = SDK_LIST_NEXT(node)) {
        sdk_fsm_state_t * p = SDK_LIST_DATA(node, sdk_fsm_state_t, list_node);
        if (strcmp(state_name, p->action.object.name)==0) {
            if(result){
                *result = p;
            }
            return 0;
        }
    }
    return -1;
}

int sdk_fsm_find_transition(sdk_fsm_t* fsm, const char* from_state, const char* to_state, sdk_fsm_transition_t ** result)
{
    sdk_fsm_state_t * from_state_p = 0;
    int err = sdk_fsm_find_state(fsm, from_state, &from_state_p);
    if(err!=0){
        return err;
    }

    err = sdk_fsm_state_find_transition(from_state_p, to_state, result);
    if(!err){
        return err;
    }

    return 0;

}

const char* sdk_fsm_state_get_name(sdk_fsm_state_t * state){
    return state->action.object.name;
}

sdk_action_status_t sdk_fsm_current_state_get_status(sdk_fsm_t* fsm){
    if(fsm->current_state){
        return fsm->current_state->action.status;
    }else{
        return kSDK_ActionStatus_UNKNOWN;
    }
}

int sdk_fsm_set_state(sdk_fsm_t *fsm, sdk_fsm_state_t* state){
    if(fsm->current_state){
        sdk_action_cleanup(&fsm->current_state->action);
    }
    fsm->current_state = state;
    sdk_action_initialize(&fsm->current_state->action);
    return 0;
}

int sdk_fsm_add_state(sdk_fsm_t * fsm, sdk_fsm_state_t * state){
    sdk_fsm_state_t * state_p;
    int err = sdk_fsm_find_state(fsm, state->action.object.name, &state_p);
    if(err==0){
        /* exist */
        return -1;
    }

    SDK_LIST_INSERT_BEFORE(&fsm->state_list, &state->list_node);

    return 0;
}

int sdk_fsm_add_transition(sdk_fsm_t * fsm, const char* from_state, sdk_fsm_transition_t * transition){
    sdk_fsm_state_t * state_p = 0;
    int err = sdk_fsm_find_state(fsm, from_state, &state_p);
    if(err!=0){
        return -1;
    }

    sdk_fsm_state_add_transition(state_p, transition);

    return 0;
}

static int sdk_fsm_evaluate_transitions(sdk_fsm_t* fsm, sdk_list_t * transitions, char** name){
    sdk_list_node_t * node;
    sdk_list_node_t * header = transitions;
    for(node = SDK_LIST_NEXT(header); node!=header; node = SDK_LIST_NEXT(node)){
        sdk_fsm_transition_t * p = SDK_LIST_DATA(node, sdk_fsm_transition_t, list_node);
        if(sdk_evaluator_evaluate(&p->evaluator)==1){
            *name = p->to_state_name;
            return 0;
        }
    }
    return -1;
}

int sdk_fsm_update(sdk_fsm_t * fsm)
{
    if(fsm->current_state){
        sdk_action_status_t status = fsm->current_state->action.status;
        if(status==kSDK_ActionStatus_RUNNING){
            sdk_action_update(&fsm->current_state->action);
        }else if(status==kSDK_ActionStatus_TERMINATED){

            sdk_action_cleanup(&fsm->current_state->action);

            char* to_state_name = 0;
            int err = sdk_fsm_evaluate_transitions(fsm, &fsm->current_state->transition_list, &to_state_name);
            if(err!=0){
                return err;
            }

            sdk_fsm_state_t * to_state_p = 0;
            err = sdk_fsm_find_state(fsm, to_state_name, &to_state_p);
            if(err!=0){
                return err;
            }

            sdk_fsm_set_state(fsm, to_state_p);
            sdk_action_initialize(&fsm->current_state->action);

        }else if(status==kSDK_ActionStatus_UNINITIALIZED){
            sdk_action_initialize(&fsm->current_state->action);
        }
    }

    return 0;
}
