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

void os_readylist_push_back(os_thread_t* thread){
    os_priority_t priority = thread->current_priority;
    os_list_t * list = &os_readylist__table[priority];
    if(OS_LIST_IS_EMPTY(list)){
        os_priority_mark(priority);
    }
    OS_LIST_INSERT_BEFORE(list, &thread->ready_node);
}

void os_readylist_push_front(os_thread_t* thread){
    os_priority_t priority = thread->current_priority;
    os_list_t * list = &os_readylist__table[priority];
    if(OS_LIST_IS_EMPTY(list)){
        os_priority_mark(priority);
    }
    OS_LIST_INSERT_AFTER(list, &thread->ready_node);
}

void os_readylist_remove(os_thread_t * thread){
    os_priority_t priority = thread->current_priority;
    OS_LIST_REMOVE(&thread->ready_node);
    os_list_t * list = &os_readylist__table[priority];
    if(OS_LIST_IS_EMPTY(list)){
        os_priority_unmark(priority);
    }
}