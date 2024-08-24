#ifndef INCLUDED_SDK_EVALUATOR_H
#define INCLUDED_SDK_EVALUATOR_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_SDK_OBJECT_H
#include <sdk_object.h>
#endif /*INCLUDED_SDK_OBJECT_H*/

////////////////////////////////////////////////////////////////////////////////
////

typedef struct sdk_evaluator_s sdk_evaluator_t;

typedef int (*sdk_evaluator_function_t)(sdk_evaluator_t * self);

struct sdk_evaluator_s{
    sdk_object_t object;
    sdk_evaluator_function_t function;
};

////////////////////////////////////////////////////////////////////////////////
////
int sdk_evaluator_init(sdk_evaluator_t * evaluator, const char* name, sdk_evaluator_function_t function, void* userdata);


int sdk_evaluator_evaluate(sdk_evaluator_t * evaluator);

#endif /*INCLUDED_SDK_EVALUATOR_H*/
