#ifndef INCLUDED_OS_DEFINITIONS_H
#define INCLUDED_OS_DEFINITIONS_H

#ifndef INCLUDED_OS_CONFIG_H
#include <os_config.h>
#endif /*INCLUDED_OS_CONFIG_H*/

////////////////////////////////////////////////////////////////////////////////
////



#ifndef OS_NAME_SIZE
#define OS_NAME_SIZE 8
#endif

#ifndef OS_ALIGN_SIZE
#define OS_ALIGN_SIZE sizeof(void*)
#endif

#ifndef OS_IDLE_TASK_STACK_SIZE
    #define OS_IDLE_TASK_STACK_SIZE 512
#endif

#ifndef OS_PRINTF_BUFFER_SIZE
    #define OS_PRINTF_BUFFER_SIZE 1024
#endif

#ifndef CPU_STACK_INIT_WITH_PRIVILEGE
    #define CPU_STACK_INIT_WITH_PRIVILEGE 1
#endif
////////////////////////////////////////////////////////////////////////////////
////


/*  #define OS_SCHEDULER_DEBUG_ENABLE  */




////////////////////////////////////////////////////////////////////////////////
//// CONSTANTS
#define OS_WAIT_INFINITY (-1U)

#endif /* INCLUDED_OS_DEFINITIONS_H */
