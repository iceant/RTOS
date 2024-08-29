#include <os_readylist.h>

////////////////////////////////////////////////////////////////////////////////
////

volatile os_list_t os_readylist__table[OS_KERNEL_PRIORITY_MAX];

////////////////////////////////////////////////////////////////////////////////
////
os_err_t os_readylist_init(void){
    os_size_t i;
    
    for(i=0; i<OS_KERNEL_PRIORITY_MAX; i++){
        OS_LIST_INIT(&os_readylist__table[i]);
    }
    
    return OS_ERR_OK;
}

os_err_t os_readylist_push_back(os_thread_t* thread)
{
    os_priority_t priority = thread->current_priority;
    os_list_t * list = &os_readylist__table[priority];
    if(OS_LIST_IS_EMPTY(list)){
        os_priority_mark(priority);
    }
//    os_list_node_t * node = 0;
//    for(node = list->next; node!=list; node= OS_LIST_NEXT(node)){
//        if(node==&thread->ready_node){
//            return OS_ERR_EXIST;
//        }
//    }
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_INSERT_BEFORE(list, &thread->ready_node);
    return OS_ERR_OK;
}

os_err_t os_readylist_push_front(os_thread_t* thread){
    os_priority_t priority = thread->current_priority;
    os_list_t * list = &os_readylist__table[priority];
    if(OS_LIST_IS_EMPTY(list)){
        os_priority_mark(priority);
    }
//    os_list_node_t * node;
//    for(node = list->next; node!=list; node= OS_LIST_NEXT(node)){
//        if(node==&thread->ready_node){
//            return OS_ERR_EXIST;
//        }
//    }
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_INSERT_AFTER(list, &thread->ready_node);
    return OS_ERR_OK;
}

void os_readylist_remove(os_thread_t * thread){
    os_priority_t priority = thread->current_priority;
    OS_LIST_REMOVE(&thread->ready_node);
    os_list_t * list = &os_readylist__table[priority];
    if(OS_LIST_IS_EMPTY(list)){
        os_priority_unmark(priority);
    }
}

os_thread_t* os_readylist_pop(os_priority_t priority)
{
    os_list_t * list = &os_readylist__table[priority];
    if(OS_LIST_IS_EMPTY(list)){
        return 0;
    }
    os_thread_t* thread = OS_LIST_CONTAINER(OS_LIST_NEXT(list), os_thread_t, ready_node);
    OS_LIST_REMOVE(&thread->ready_node);
    if(OS_LIST_IS_EMPTY(list)){
        os_priority_unmark(priority);
    }
    return thread;
}



