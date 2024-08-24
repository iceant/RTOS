#ifndef INCLUDED_SDK_FSM_H
#define INCLUDED_SDK_FSM_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_SDK_ACTION_H
#include <sdk_action.h>
#endif /*INCLUDED_SDK_ACTION_H*/

#ifndef INCLUDED_SDK_EVALUATOR_H
#include <sdk_evaluator.h>
#endif /*INCLUDED_SDK_EVALUATOR_H*/

#ifndef INCLUDED_SDK_LIST_H
#include <sdk_list.h>
#endif /*INCLUDED_SDK_LIST_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef struct sdk_fsm_state_s{
    sdk_action_t action;
    sdk_list_t transition_list;
    sdk_list_node_t list_node;
}sdk_fsm_state_t;

typedef struct sdk_fsm_transition_s{
    sdk_list_node_t list_node;
    sdk_evaluator_t evaluator;
    char to_state_name[SDK_NAME_SIZE];
}sdk_fsm_transition_t;

typedef struct sdk_fsm_s{
    sdk_fsm_state_t * current_state;
    sdk_list_t state_list;
}sdk_fsm_t;
////////////////////////////////////////////////////////////////////////////////
////
int sdk_fsm_state_init(sdk_fsm_state_t * state, const char* name,
                       sdk_action_function_t initialize_function ,
                       sdk_action_function_t update_function ,
                       sdk_action_function_t cleanup_function ,
                       void* userdata
                       );

int sdk_fsm_transition_init(sdk_fsm_transition_t * transition, const char* to_state_name
                            , sdk_evaluator_function_t eval_function, void* userdata);


int sdk_fsm_state_add_transition(sdk_fsm_state_t * state, sdk_fsm_transition_t * transition);

int sdk_fsm_state_find_transition(sdk_fsm_state_t * state, const char* to_state, sdk_fsm_transition_t** result);


const char* sdk_fsm_state_get_name(sdk_fsm_state_t * state);

sdk_action_status_t sdk_fsm_current_state_get_status(sdk_fsm_t* fsm);

////////////////////////////////////////////////////////////////////////////////
////


int sdk_fsm_set_state(sdk_fsm_t *fsm, sdk_fsm_state_t* state);

int sdk_fsm_add_state(sdk_fsm_t * fsm, sdk_fsm_state_t * state);

int sdk_fsm_add_transition(sdk_fsm_t * fsm, const char* from_state, sdk_fsm_transition_t * transition);

int sdk_fsm_find_transition(sdk_fsm_t* fsm, const char* from_state, const char* to_state, sdk_fsm_transition_t ** result);

int sdk_fsm_find_state(sdk_fsm_t* fsm, const char* state_name, sdk_fsm_state_t** result);

int sdk_fsm_update(sdk_fsm_t * fsm);

#endif /*INCLUDED_SDK_FSM_H*/
