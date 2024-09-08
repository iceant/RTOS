#include <os_readylist.h>
#include <os_macros.h>
/* -------------------------------------------------------------------------------------------------------------- */
static os_list_t os_readylist__table[OS_PRIORITY_MAX];

/* -------------------------------------------------------------------------------------------------------------- */


os_err_t os_readylist_init(void)
{
    os_size_t i;
    for(i=0; i< OS_ARRAY_SIZE(os_readylist__table); i++){
        OS_LIST_INIT(&os_readylist__table[i]);
    }
    
    return OS_ERR_OK;
}

os_err_t os_readylist_push_back(os_thread_t* thread)
{
    os_list_t * list_p = 0 ;

    list_p = &os_readylist__table[thread->current_priority];
    if(OS_LIST_IS_EMPTY(list_p)){
        os_priority_mark(thread->current_priority);
    }
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_INSERT_BEFORE(list_p, &thread->ready_node);
    return OS_ERR_OK;
}

os_err_t os_readylist_push_front(os_thread_t* thread)
{
    os_list_t * list_p ;
    list_p = &os_readylist__table[thread->current_priority];
    if(OS_LIST_IS_EMPTY(list_p)){
        os_priority_mark(thread->current_priority);
    }
    OS_LIST_REMOVE(&thread->ready_node);
    OS_LIST_INSERT_AFTER(list_p, &thread->ready_node);
    return OS_ERR_OK;
}

os_thread_t * os_readylist_pop(os_priority_t priority){
    os_list_t * list_p ;
    os_list_node_t * node_p;
    list_p = &os_readylist__table[priority];
    if(OS_LIST_IS_EMPTY(list_p)){
        return 0;
    }
    node_p = OS_LIST_NEXT(list_p);
    OS_LIST_REMOVE(node_p);
    if(OS_LIST_IS_EMPTY(list_p)){
        os_priority_unmark(priority);
    }
    return OS_LIST_CONTAINER(node_p, os_thread_t, ready_node);
}

