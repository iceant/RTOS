#ifndef INCLUDED_OS_DEFINITIONS_H
#define INCLUDED_OS_DEFINITIONS_H

#ifndef OS_NAME_SIZE
#define OS_NAME_SIZE 8
#endif

#ifndef OS_ALIGN_SIZE
#define OS_ALIGN_SIZE sizeof(void*)
#endif

#ifndef OS_IDLE_TASK_STACK_SIZE
    #define OS_IDLE_TASK_STACK_SIZE 512
#endif

#define OS_WAIT_INFINITY (-1U)

#endif /* INCLUDED_OS_DEFINITIONS_H */
