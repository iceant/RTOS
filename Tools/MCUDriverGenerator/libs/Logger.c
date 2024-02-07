#include <Logger.h>
#include <pthread.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
////////////////////////////////////////////////////////////////////////////////
////
#define LOGGER_BUFFER_SIZE      10240
#define LOGGER_BUFFER_COUNT     4
#define LOGGER_INTERVAL_S       2

#define CONTAINER_OF(ptr, type, member) ((type*)(((char*)ptr) - (size_t)(&(((type*)0)->member))))

////////////////////////////////////////////////////////////////////////////////
////
#define LIST_NEXT(N) (N)->next
#define LIST_PREV(N) (N)->prev
#define LIST_PREV_NEXT(N) LIST_NEXT(LIST_PREV(N))
#define LIST_NEXT_PREV(N) LIST_PREV(LIST_NEXT(N))

#define LIST_INIT(N) (LIST_NEXT(N) = LIST_PREV(N) = (N))
#define LIST_IS_EMPTY(N) (LIST_NEXT(N) == (N))

/* X <-- N <-- L */
#define LIST_INSERT_BEFORE(L, N) \
do{                              \
    LIST_PREV_NEXT(L) = (N);     \
    LIST_PREV(N) = LIST_PREV(L); \
    LIST_NEXT(N) = (L);          \
    LIST_PREV(L) = (N);          \
}while(0)

/* L --> N --> X */
#define LIST_INSERT_AFTER(L, N) \
do{                              \
    LIST_NEXT_PREV(L) = (N);     \
    LIST_NEXT(N) = LIST_NEXT(L); \
    LIST_PREV(N) = (L);          \
    LIST_NEXT(L) = (N);          \
}while(0)

#define LIST_REMOVE(N) \
do{                    \
    LIST_PREV_NEXT(N) = LIST_NEXT(N); \
    LIST_NEXT_PREV(N) = LIST_PREV(N); \
    LIST_NEXT(N) = LIST_PREV(N) = (N);\
}while(0)

////////////////////////////////////////////////////////////////////////////////
////
static int Logger_List_PushBack(Logger_List_t* list, Logger_ListNode_t * node, pthread_mutex_t* lock, pthread_cond_t* cond){
    pthread_mutex_lock(lock);
    LIST_INSERT_BEFORE(list, node);
    pthread_cond_signal(cond);
    pthread_mutex_unlock(lock);
    return 0;
}

static int Logger_List_WaitPop(Logger_List_t* list, Logger_ListNode_t** result, pthread_mutex_t* lock, pthread_cond_t* cond){
    pthread_mutex_lock(lock);
    while(LIST_IS_EMPTY(list)){
        pthread_cond_wait(cond, lock);
    }
    if(result){
        *result = LIST_NEXT(list);
        LIST_REMOVE(*result);
    }
    pthread_mutex_unlock(lock);
    return 0;
}

static int Logger_List_TryPop(Logger_List_t* list, Logger_ListNode_t ** result, pthread_mutex_t* lock, pthread_cond_t* cond){
    int ret = 0;
    pthread_mutex_lock(lock);
    if(LIST_IS_EMPTY(list)){
        ret = -1;
    }else{
        *result = LIST_NEXT(list);
        LIST_REMOVE(*result);
        ret = 0;
    }
    pthread_mutex_unlock(lock);
    return ret;
}

static int Logger_List_TimedWaitPop(Logger_List_t* list, Logger_ListNode_t** result
                                    , pthread_mutex_t* lock, pthread_cond_t* cond, struct timespec* ts){
    int err = 0;
    pthread_mutex_lock(lock);
    while(LIST_IS_EMPTY(list)){
        err = pthread_cond_timedwait(cond, lock, ts);
        if(err==ETIMEDOUT){
            break;
        }
    }
    if(err==ETIMEDOUT){
        err = -1;
    }else{
        err = 0;
        if(result){
            *result = LIST_NEXT(list);
            LIST_REMOVE(*result);
        }
    }
    pthread_mutex_unlock(lock);
    return err;
}


////////////////////////////////////////////////////////////////////////////////
////
static int Logger__Write(Logger_t * logger){
    Logger_ListNode_t * node;
    int updated = 0;
    while(Logger_List_TryPop(&logger->full_list, &node, &logger->read_lock, &logger->read_cond)==0){
        Logger_BufferNode_t * buffer = CONTAINER_OF(node, Logger_BufferNode_t, node);
        fwrite(buffer->buffer, 1, buffer->write_idx, logger->fp);
        updated = 1;
        Logger_List_PushBack(&logger->free_list, node, &logger->write_lock, &logger->write_cond);
    }
    if(updated){
        fflush(logger->fp);
    }
    return updated;
}

static void Logger__SwitchWriteBuffer(struct Logger_s* logger, Logger_ListNode_t* node){
    pthread_mutex_lock(&logger->logger_lock);
    logger->write_buffer_p = CONTAINER_OF(node, Logger_BufferNode_t, node);
    logger->write_buffer_p->write_idx = 0;
    pthread_mutex_unlock(&logger->logger_lock);
}

static void* Logger__WriteThreadEntry(void* param)
{
    
    int err;
    struct timespec tout;  //纳秒级别
    Logger_t * logger = (Logger_t*)param;
    Logger_ListNode_t * node;
    Logger_BufferNode_t * buffer;
    
    while(logger->state == LOGGER_STATE_RUNNING){
        clock_gettime(CLOCK_REALTIME, &tout);
        tout.tv_sec += LOGGER_INTERVAL_S;   //延迟Ns
        err = Logger_List_TimedWaitPop(&logger->full_list, &node, &logger->read_lock, &logger->read_cond, &tout);
        if(err==-1/*Timeout*/){
            if(logger->write_buffer_p->write_idx>0){
                /* had content, switch to full list*/
                Logger_List_PushBack(&logger->full_list, &logger->write_buffer_p->node, &logger->read_lock, &logger->read_cond);
                Logger_List_WaitPop(&logger->free_list, &node, &logger->write_lock, &logger->write_cond);
                Logger__SwitchWriteBuffer(logger, node);
            }
        }else{
            buffer = CONTAINER_OF(node, Logger_BufferNode_t, node);
            fwrite(buffer->buffer, buffer->write_idx, 1, logger->fp);
            fflush(logger->fp);
            Logger_List_PushBack(&logger->free_list, &buffer->node, &logger->write_lock, &logger->write_cond);
        }
    }
    
    logger->state = LOGGER_STATE_STOPPED;
    pthread_cond_signal(&logger->logger_cond);
}

////////////////////////////////////////////////////////////////////////////////
////


int Logger_Init(Logger_t* logger, const char* file, int level, int buffer_size, int buffer_count)
{
    assert(logger);
    assert(buffer_size>0);
    assert(buffer_count>0);
    
    logger->fp = fopen(file, "a+");
    if(!logger->fp){
        return -1;
    }
    LIST_INIT(&logger->free_list);
    LIST_INIT(&logger->full_list);
    
    for(int i=0; i<buffer_count; i++) {
        Logger_BufferNode_t * node = malloc(sizeof(*node));
        assert(node);
        node->buffer = malloc(buffer_size);
        assert(node->buffer);
        node->buffer_size = buffer_size;
        node->write_idx = 0;
        LIST_INIT(&node->node);
        
        LIST_INSERT_BEFORE(&logger->free_list, &node->node);
    }
    
    logger->level = level;
    Logger_ListNode_t * node = LIST_NEXT(&logger->free_list);
    LIST_REMOVE(node);
    logger->write_buffer_p = CONTAINER_OF(node, Logger_BufferNode_t, node);
    
    pthread_mutex_init(&logger->read_lock, 0);
    pthread_mutex_init(&logger->write_lock, 0);
    pthread_mutex_init(&logger->logger_lock, 0);
    
    pthread_cond_init(&logger->read_cond, 0);
    pthread_cond_init(&logger->write_cond, 0);
    pthread_cond_init(&logger->logger_cond, 0);
    
    memset(logger->line_buffer, 0, sizeof(logger->line_buffer));
    
    logger->state = LOGGER_STATE_IDLE;
    
    return 0;
}

void Logger_Startup(Logger_t* logger){
    if(logger->state==LOGGER_STATE_RUNNING || logger->state==LOGGER_STATE_STOPPING){
        return;
    }
    
    logger->state = LOGGER_STATE_RUNNING;
    pthread_create(&logger->thread_id, 0, Logger__WriteThreadEntry, logger);
}

void Logger_Close(Logger_t* logger){
    
    if(logger->state==LOGGER_STATE_STOPPED) return;
    
    pthread_mutex_lock(&logger->logger_lock);
    logger->state = LOGGER_STATE_STOPPING;
    while(logger->state!=LOGGER_STATE_STOPPED){
        pthread_cond_wait(&logger->logger_cond, &logger->logger_lock);
    }
    pthread_mutex_unlock(&logger->logger_lock);
    
    if(logger->write_buffer_p->write_idx>0){
        Logger_List_PushBack(&logger->full_list, &logger->write_buffer_p->node, &logger->read_lock, &logger->read_cond);
        logger->write_buffer_p = 0;
    }
    Logger__Write(logger);
    
    if(logger->fp){
        fflush(logger->fp);
        fclose(logger->fp);
    }
    
    Logger_ListNode_t * node;
    for(node = LIST_NEXT(&logger->free_list); node!=&logger->free_list; ){
        Logger_BufferNode_t * p = CONTAINER_OF(node, Logger_BufferNode_t, node);
        node = LIST_NEXT(node);
        free(p->buffer);
        free(p);
    }
    
    assert(LIST_IS_EMPTY(&logger->full_list));
    
    pthread_cond_destroy(&logger->read_cond);
    pthread_cond_destroy(&logger->write_cond);
    pthread_cond_destroy(&logger->logger_cond);
    
    pthread_mutex_destroy(&logger->read_lock);
    pthread_mutex_destroy(&logger->write_lock);
    pthread_mutex_destroy(&logger->logger_lock);
    
}

void Logger_SetLevel(Logger_t* logger, int level){
    pthread_mutex_lock(&logger->logger_lock);
    logger->level = level;
    pthread_mutex_unlock(&logger->logger_lock);
}

static char* Logger__LevelName(int level){
    switch (level) {
        case LOGGER_LEVEL_WARN:
            return "WARN";
        case LOGGER_LEVEL_INFO:
            return "INFO";
        case LOGGER_LEVEL_DEBUG:
            return "DEBUG";
        case LOGGER_LEVEL_TRACE:
            return "TRACE";
        case LOGGER_LEVEL_ERROR:
            return "ERROR";
        default:
            return "N/A";
    }
}

int Logger_VLog(Logger_Ptr logger, int level, const char* file, int line, const char* fmt, va_list ap_arg)
{
    assert(logger);
    char* message_buffer = 0;
    int message_buffer_size = 0;
    
    struct timespec tout;  //纳秒级别
    struct tm *tmp;
    int line_size = 0;
    va_list ap;
    Logger_ListNode_t *node;
    Logger_BufferNode_t *buffer;
    
    if(level < logger->level){
        return LOGGER_ELEVEL;
    }
    
    if(logger->state!=LOGGER_STATE_RUNNING){
        return LOGGER_ESTATE;
    }
    
    pthread_mutex_lock(&logger->write_lock);
    {
        clock_gettime(CLOCK_REALTIME, &tout);
        tmp = localtime(&tout.tv_sec);
        
        va_copy(ap, ap_arg);
        message_buffer_size = vsnprintf(0, 0, fmt, ap);
        va_end(ap);
        
        if(message_buffer_size<0){
            /* INFO - 2024-02-06 21:17:23 <MSG>  -<FILE>:<LINE>\n*/
            line_size = snprintf(logger->line_buffer, sizeof(logger->line_buffer), "%04d-%02d-%02d %02d:%02d:%02d.%03d [%s] - %s - %s:%d\n"
                    , tmp->tm_year + 1900
                    , tmp->tm_mon+1
                    , tmp->tm_mday
                    , tmp->tm_hour
                    , tmp->tm_min
                    , tmp->tm_sec
                    , tout.tv_nsec/1000000
                    , Logger__LevelName(level)
                    , ""
                    , file
                    , line
            );
        }else{
            message_buffer = malloc(message_buffer_size+1);
            assert(message_buffer);
            va_copy(ap, ap_arg);
            vsnprintf(message_buffer, message_buffer_size+1, fmt, ap);
            va_end(ap);
            message_buffer[message_buffer_size] = '\0';
            
            /* INFO - 2024-02-06 21:17:23 <MSG>  -<FILE>:<LINE>\n*/
            line_size = snprintf(logger->line_buffer, sizeof(logger->line_buffer), "%04d-%02d-%02d %02d:%02d:%02d.%03d [%s] - %s - %s:%d\n"
                    , tmp->tm_year + 1900
                    , tmp->tm_mon+1
                    , tmp->tm_mday
                    , tmp->tm_hour
                    , tmp->tm_min
                    , tmp->tm_sec
                    , tout.tv_nsec/1000000
                    , Logger__LevelName(level)
                    , message_buffer
                    , file
                    , line
            );
            
            free(message_buffer);
        }
        
        int space = logger->write_buffer_p->buffer_size - logger->write_buffer_p->write_idx;
        if(space < line_size){
            /*空间不够*/
            Logger_List_PushBack(&logger->full_list, &logger->write_buffer_p->node, &logger->read_lock, &logger->read_cond);
            while(LIST_IS_EMPTY(&logger->free_list)){
                pthread_cond_wait(&logger->write_cond, &logger->write_lock);
            }
            node = LIST_NEXT(&logger->free_list);
            LIST_REMOVE(node);
            Logger__SwitchWriteBuffer(logger, node);
        }
        memcpy(logger->write_buffer_p->buffer+logger->write_buffer_p->write_idx, logger->line_buffer, line_size);
        logger->write_buffer_p->write_idx+=line_size;
    }
    pthread_mutex_unlock(&logger->write_lock);
}

int Logger_Log(Logger_t* logger, int level, const char* file, int line, const char* fmt, ...)
{
    int err;
    va_list ap;
    va_start(ap, fmt);
    err = Logger_VLog(logger, level, file, line, fmt, ap);
    va_end(ap);
    
    return err;
}
