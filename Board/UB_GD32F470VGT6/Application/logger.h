#ifndef INCLUDED_LOGGER_H
#define INCLUDED_LOGGER_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_OS_KERNEL_H
#include <os_kernel.h>
#endif /*INCLUDED_OS_KERNEL_H*/

#ifndef INCLUDED_FF_H
#define INCLUDED_FF_H
#include <ff.h>
#endif /*INCLUDED_FF_H*/


////////////////////////////////////////////////////////////////////////////////
////

#define LOGGER_BUFFER_SIZE (4*1024)
#define LOGGER_BUFFER_COUNT 3

////////////////////////////////////////////////////////////////////////////////
////


typedef struct logger_buffer_s{
    uint8_t buffer[LOGGER_BUFFER_SIZE];
    int size;
}logger_buffer_t;

typedef enum Logger_Level_enum{
    kLogger_Level_TRACE = 0,
    kLogger_Level_DEBUG,
    kLogger_Level_INFO,
    kLogger_Level_WARN,
    kLogger_Level_ERROR,
    kLogger_Level_ALL,
}Logger_Level_t;

typedef struct logger_s{
    logger_buffer_t buffers[LOGGER_BUFFER_COUNT];
    int write_idx;
    int read_idx;
    Logger_Level_t level;
    FIL file_handle;
}logger_t;

extern logger_t logger_g_instance;
////////////////////////////////////////////////////////////////////////////////
////
#define LOGGER_EOK          0
#define LOGGER_EDISABLED    (-1)

#define LOGGER_WRITE_BUFFER(LOG) (&(LOG)->buffers[(LOG)->write_idx])
#define LOGGER_WRITE_BUFFER_SIZE(LOG) (((LOG)->buffers[(LOG)->write_idx]).size)

////////////////////////////////////////////////////////////////////////////////
////

int logger_module_init(void);

int logger_init(logger_t* logger, Logger_Level_t level, const char* file);

int logger_log(logger_t* logger, Logger_Level_t level, const char* file, int line, const char* fmt, ...);

////////////////////////////////////////////////////////////////////////////////
////
#define LOGGER_TRACE(LOG, ...) logger_log((LOG), kLogger_Level_TRACE, __FILE__, __LINE__, __VA_ARGS__)
#define LOGGER_DEBUG(LOG, ...) logger_log((LOG), kLogger_Level_DEBUG, __FILE__, __LINE__, __VA_ARGS__)
#define LOGGER_INFO(LOG, ...) logger_log((LOG), kLogger_Level_INFO, __FILE__, __LINE__, __VA_ARGS__)
#define LOGGER_WARN(LOG, ...) logger_log((LOG), kLogger_Level_WARN, __FILE__, __LINE__, __VA_ARGS__)
#define LOGGER_ERROR(LOG, ...) logger_log((LOG), kLogger_Level_ERROR, __FILE__, __LINE__, __VA_ARGS__)

#define LOG_TRACE(...) logger_log((&logger_g_instance), kLogger_Level_TRACE, __FILE__, __LINE__, __VA_ARGS__)
#define LOG_DEBUG(...) logger_log((&logger_g_instance), kLogger_Level_DEBUG, __FILE__, __LINE__, __VA_ARGS__)
#define LOG_INFO(...) logger_log((&logger_g_instance), kLogger_Level_INFO, __FILE__, __LINE__, __VA_ARGS__)
#define LOG_WARN(...) logger_log((&logger_g_instance), kLogger_Level_WARN, __FILE__, __LINE__, __VA_ARGS__)
#define LOG_ERROR(...) logger_log((&logger_g_instance), kLogger_Level_ERROR, __FILE__, __LINE__, __VA_ARGS__)

#endif /*INCLUDED_LOGGER_H*/
