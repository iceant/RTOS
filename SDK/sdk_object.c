#include <sdk_object.h>
#include <string.h>

int sdk_object_init(sdk_object_t * object, sdk_object_type_t type, const char* name, void* userdata)
{
    size_t name_size = strlen(name);
    name_size = (name_size > (SDK_NAME_SIZE-1))?(SDK_NAME_SIZE-1):name_size;
    memcpy(object->name, name, name_size);
    object->name[name_size] = '\0';

    object->type= type;
    object->userdata = userdata;

    return 0;
}

