#include <os_list.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv){

    os_list_t list;
    OS_LIST_INIT(&list);

    os_list_node_t node1;
    os_list_node_t node2;

    OS_LIST_INIT(&node1);
    OS_LIST_INIT(&node2);

    OS_LIST_INSERT_AFTER(&list, &node1); /* list-->node1 */
    OS_LIST_INSERT_BEFORE(&node1, &node2); /*  list-->node2-->node1 */

    if(OS_LIST_NEXT(&list)==&node2 && OS_LIST_PREV(&node1)==&node2 && OS_LIST_PREV(&list)==&node1 && OS_LIST_NEXT(&node1)==&list){
        printf("Success!\n");
    }else{
        printf("Failed!\n");
    }


    return 0;
}