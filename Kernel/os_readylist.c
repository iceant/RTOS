#include <os_readylist.h>

////////////////////////////////////////////////////////////////////////////////
////

static os_list_t os_readylist__table[OS_KERNEL_PRIORITY_MAX];

////////////////////////////////////////////////////////////////////////////////
////


os_err_t os_readylist_init(void)
{
    os_size_t i;

    for(i=0; i<OS_KERNEL_PRIORITY_MAX; i++){
        OS_LIST_INIT(&os_readylist__table[i]);
    }

    return OS_ERR_OK;
}

void os_readylist_push_back(){
    OS_LIST_INSERT_BEFORE(&os_readylist__table[)
}
