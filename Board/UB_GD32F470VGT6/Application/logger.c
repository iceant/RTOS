#include "logger.h"
#include <stdio.h>
#include <bsp_tim6.h>
#include <global.h>
#include <string.h>
////////////////////////////////////////////////////////////////////////////////
////

#define LOGGER_MSG_BUFFER_SIZE 1024
#define LOGGER_LINE_BUFFER_SIZE 2048

C__ALIGNED(OS_ALIGN_SIZE)
static char logger__msg_buffer[LOGGER_MSG_BUFFER_SIZE];
C__ALIGNED(OS_ALIGN_SIZE)
static char logger__line_buffer[LOGGER_LINE_BUFFER_SIZE];

static os_mutex_t logger__lock={.owner=0, .lock=0};
static os_semaphore_t logger__read_sem;
static os_semaphore_t logger__write_sem;
static os_thread_t logger__thread;
C__ALIGNED(OS_ALIGN_SIZE)
static uint8_t logger__thread_stack[1024];

logger_t logger_g_instance;
////////////////////////////////////////////////////////////////////////////////
////
static void logger__thread_entry(void* p){
    UINT write_size = 0;
    int err = 0;
    while(1){
        err = os_semaphore_take(&logger__read_sem, os_tick_from_millisecond(5000));

        while(1){
            if(logger_g_instance.read_idx==logger_g_instance.write_idx){
                /*empty*/
                break;
            }

            int next_read_idx = logger_g_instance.read_idx + 1;
            if(next_read_idx==LOGGER_BUFFER_COUNT){
                next_read_idx = 0;
            }

            logger_buffer_t * buffer = &logger_g_instance.buffers[logger_g_instance.read_idx];
            f_write(&logger_g_instance.file_handle, buffer->buffer, buffer->size, &write_size);

            logger_g_instance.read_idx = next_read_idx;
        }

        os_semaphore_release(&logger__write_sem);
    }
}

static const char* logger__level_name(Logger_Level_t level){
    switch (level) {
        case kLogger_Level_INFO:
            return "INFO";
        case kLogger_Level_DEBUG:
            return "DEBUG";
        case kLogger_Level_ERROR:
            return "ERROR";
        case kLogger_Level_TRACE:
            return "TRACE";
        case kLogger_Level_WARN:
            return "WARN";
        default:
            return "N/A";
    }
}


////////////////////////////////////////////////////////////////////////////////
////

int logger_module_init(void){
#if defined(ENABLE_SDCARD) && defined(ENABLE_FAT_FILE_SYSTEM) && defined(ENABLE_LOGGER)

    int err = logger_init(&logger_g_instance, kLogger_Level_DEBUG, "0:logger.txt");
    if(err!=0){
        printf("Logger Init Failed!\n");
        return err;
    }
    os_mutex_init(&logger__lock);
    os_semaphore_init(&logger__write_sem, "LOG_WSem", 0, OS_QUEUE_FIFO);
    os_semaphore_init(&logger__read_sem, "LOG_RSem", 0, OS_QUEUE_FIFO);
    os_thread_init(&logger__thread, "LOG_Thd", logger__thread_entry, 0
                   , logger__thread_stack, sizeof(logger__thread_stack), 20, 10);
    os_thread_startup(&logger__thread);
#endif
    return 0;
}


int logger_init(logger_t* logger, Logger_Level_t level, const char* file)
{
#if defined(ENABLE_SDCARD) && defined(ENABLE_FAT_FILE_SYSTEM) && defined(ENABLE_LOGGER)
    logger->read_idx = 0;
    logger->write_idx = 0;
    FRESULT result = f_open(&logger->file_handle, file, FA_READ | FA_WRITE | FA_OPEN_ALWAYS | FA_OPEN_APPEND);
    logger->level = level;
    if(result!=FR_OK){
        printf("[LOGGER] file %s open failed! err=%d", file, result);
        return (int)result;
    }
#endif
    return 0;
}

static int logger__is_full(logger_t * logger){
    int next_write_idx = logger->write_idx + 1;
    if(next_write_idx == LOGGER_BUFFER_COUNT){
        next_write_idx = 0;
    }
    return (next_write_idx==logger->read_idx);
}

/*
 *  yyyy-MM-dd HH:mm:ss.ticks [LEVEL] [MSG] [file:line] \n
 **/
int logger_log(logger_t* logger, Logger_Level_t level, const char* file, int line, const char* fmt, ...)
{
#if defined(ENABLE_SDCARD) && defined(ENABLE_FAT_FILE_SYSTEM) && defined(ENABLE_LOGGER)
    if(logger->level < level){
        return LOGGER_EDISABLED;
    }

    int msg_size = 0;
    int line_size = 0;
    UINT write_size = 0;

    os_mutex_lock(&logger__lock);

    va_list ap;
    va_start(ap, fmt);
    msg_size = vsnprintf(logger__msg_buffer, LOGGER_MSG_BUFFER_SIZE, fmt, ap);
    va_end(ap);
    logger__msg_buffer[msg_size] = '\0';

    global_t * global = global_get();

    line_size = snprintf(logger__line_buffer , LOGGER_LINE_BUFFER_SIZE, "%04d-%02d-%02d %02d:%02d:%02d.%u [%s] - %s %s:%d\n"
        , global->datetime.year
        , global->datetime.month
        , global->datetime.date
        , global->datetime.hour
        , global->datetime.min
        , global->datetime.sec
        , BSP_TIM6__TickCount
        , logger__level_name(logger->level)
        , logger__msg_buffer
        , file
        , line
    );

    if((LOGGER_WRITE_BUFFER_SIZE(logger) + line_size) >= LOGGER_BUFFER_SIZE){
        int next_write_idx = logger->write_idx + 1;
        if(next_write_idx == LOGGER_BUFFER_COUNT){
            next_write_idx = 0;
        }

        while(next_write_idx==logger->read_idx){
            /*full*/
            os_semaphore_take(&logger__write_sem, OS_WAIT_INFINITY);
        }

        logger->write_idx = next_write_idx;
        LOGGER_WRITE_BUFFER_SIZE(logger) = 0;
    }

    logger_buffer_t * write_buffer = LOGGER_WRITE_BUFFER(logger);
    memcpy(write_buffer->buffer + write_buffer->size, logger__line_buffer, line_size);
    write_buffer->size += line_size;

    os_mutex_unlock(&logger__lock);

    os_semaphore_release(&logger__read_sem);
#endif
    return 0;
}