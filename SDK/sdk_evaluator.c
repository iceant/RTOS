#include <sdk_evaluator.h>


int sdk_evaluator_init(sdk_evaluator_t * evaluator, const char* name, sdk_evaluator_function_t function, void* userdata)
{
    if(function==0){
        return -1;
    }
    sdk_object_init(&evaluator->object, kSDK_ObjectType_Evaluator, name, userdata);
    evaluator->function= function;

    return 0;
}

int sdk_evaluator_evaluate(sdk_evaluator_t * evaluator){
    return evaluator->function(evaluator);
}

