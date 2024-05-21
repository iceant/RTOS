# 0 "D:/RTOS/Kernel/os_list.c"
# 1 "D:\\RTOS\\Board\\YD-STM32H7xxVx_ClassicV19\\cmake-build-debug//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "D:/RTOS/Kernel/os_list.c"
# 1 "D:/RTOS/Kernel/os_list.h" 1





typedef struct os_list_node_s os_list_node_t;
typedef struct os_list_node_s os_list_t;

struct os_list_node_s{
    os_list_node_t * prev;
    os_list_node_t * next;
};
# 2 "D:/RTOS/Kernel/os_list.c" 2
