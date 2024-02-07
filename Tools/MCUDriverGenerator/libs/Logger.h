#ifndef INCLUDED_LOGGER_H
#define INCLUDED_LOGGER_H

////////////////////////////////////////////////////////////////////////////////
////

#ifndef INCLUDED_STDIO_H
#define INCLUDED_STDIO_H
#include <stdio.h>
#endif /* INCLUDED_STDIO_H */

#ifndef INCLUDED_STDARG_H
#define INCLUDED_STDARG_H
#include <stdarg.h>
#endif /* INCLUDED_STDARG_H */

#ifndef INCLUDED_PTHREAD_H
#define INCLUDED_PTHREAD_H
#include <pthread.h>
#endif /* INCLUDED_PTHREAD_H */

////////////////////////////////////////////////////////////////////////////////
////
#define LOGGER_LINE_BUFFER_SIZE 2048

typedef struct Logger_List_s{
    struct Logger_List_s* next;
    struct Logger_List_s* prev;
}Logger_List_t, Logger_ListNode_t;

typedef struct Logger_BufferNode_s{
    void* buffer;
    int buffer_size;
    int write_idx;
    Logger_ListNode_t node;
}Logger_BufferNode_t;

typedef struct Logger_s{
    FILE * fp;
    Logger_List_t free_list;
    Logger_List_t full_list;
    int level;
    Logger_BufferNode_t* write_buffer_p;
    int state;
    pthread_t thread_id;
    pthread_mutex_t read_lock;
    pthread_mutex_t write_lock;
    pthread_cond_t  read_cond;
    pthread_cond_t  write_cond;
    pthread_mutex_t logger_lock;
    pthread_cond_t  logger_cond;
    unsigned char line_buffer[LOGGER_LINE_BUFFER_SIZE];
}Logger_t;

typedef struct Logger_s * Logger_Ptr;

////////////////////////////////////////////////////////////////////////////////
////

#define LOGGER_LEVEL_NONE   (1<<8)
#define LOGGER_LEVEL_ERROR  (1<<4)
#define LOGGER_LEVEL_WARN   (1<<3)
#define LOGGER_LEVEL_INFO   (1<<2)
#define LOGGER_LEVEL_DEBUG  (1<<1)
#define LOGGER_LEVEL_TRACE  (1<<0)
#define LOGGER_LEVEL_ALL    (0)

#define LOGGER_EOK          (0)
#define LOGGER_EFULL        (-1)
#define LOGGER_ELEVEL       (-2)
#define LOGGER_ESTATE       (-3)

#define LOGGER_STATE_IDLE       0
#define LOGGER_STATE_RUNNING    1
#define LOGGER_STATE_STOPPING   2
#define LOGGER_STATE_STOPPED    4
////////////////////////////////////////////////////////////////////////////////
////

int Logger_Init(Logger_Ptr logger, const char* file, int level, int buffer_size, int buffer_count);

void Logger_Startup(Logger_t* logger);

void Logger_Close(Logger_Ptr logger);

void Logger_SetLevel(Logger_Ptr logger, int level);

int Logger_Log(Logger_Ptr logger, int level, const char* file, int line, const char* fmt, ...);

int Logger_VLog(Logger_Ptr logger, int level, const char* file, int line, const char* fmt, va_list vp);

////////////////////////////////////////////////////////////////////////////////
////

#define LOG_DEBUG(...) Logger_Log(&s_logger, LOGGER_LEVEL_DEBUG, __FILE__, __LINE__, __VA_ARGS__)
#define LOG_INFO(...) Logger_Log(&s_logger, LOGGER_LEVEL_INFO, __FILE__, __LINE__, __VA_ARGS__)
#define LOG_WARN(...) Logger_Log(&s_logger, LOGGER_LEVEL_WARN, __FILE__, __LINE__, __VA_ARGS__)
#define LOG_ERROR(...) Logger_Log(&s_logger, LOGGER_LEVEL_ERROR, __FILE__, __LINE__, __VA_ARGS__)

#endif /* INCLUDED_LOGGER_H */
