#include <os_printf.h>
#include <os_types.h>
#include <stdio.h>
#include <os_macros.h>
#include <os_memory.h>

////////////////////////////////////////////////////////////////////////////////
////

#if (defined(OS_PRINTF_USE_DEFAULT_IMPLEMENTATION) && (OS_PRINTF_USE_DEFAULT_IMPLEMENTATION))
static char os_printf__buffer[OS_PRINTF_BUFFER_SIZE];

int C__WEAK os_printf(const char* format, ...){
    va_list args;
    va_start(args, format);
    int len = vsnprintf(os_printf__buffer, OS_PRINTF_BUFFER_SIZE, format, args);
    va_end(args);
    if(len > OS_ARRAY_SIZE(os_printf__buffer)){
        char* buffer = (char*)OS_ALLOC(len + 1);
        va_start(args, format);
        len = vsnprintf(buffer, len + 1, format, args);
        va_end(args);
        for(int i=0; i<len; i++){
            os_printf_putc(buffer[i], 0);
        }
        OS_FREE(buffer);
    }else{
        for(int i=0; i<len; i++){
            os_printf_putc(os_printf__buffer[i], 0);
        }
    }
    
    
    return len;
}
#endif

