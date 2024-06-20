#include <board.h>
#include "bsp_usart0.h"
#include "os_config.h"
#include <stdarg.h>
#include <stdio.h>
#include <os_kernel.h>
////////////////////////////////////////////////////////////////////////////////
////


void Board_Init(void)
{
    __enable_irq();
    __set_FAULTMASK(0);

    BSP_USART0_Init();
    BSP_USART0_EnableDMATx();
    BSP_USART0_EnableRxIRQ();
}

////////////////////////////////////////////////////////////////////////////////
////
int fputc(int ch, FILE *f)
{
#if defined(ENABLE_USART0)
    usart_data_transmit(USART0, (uint8_t)ch);
    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
#endif
    return ch;
}
//
//int os_printf_putc(int ch, void* f){
//    usart_data_transmit(USART0, (uint8_t)ch);
//    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
//    return ch;
//}
//
//static char os_printf__buffer[OS_PRINTF_BUFFER_SIZE];
//int os_printf(const char* format, ...){
//    va_list args;
//    va_start(args, format);
//    int len = vsnprintf(os_printf__buffer, OS_PRINTF_BUFFER_SIZE, format, args);
//    va_end(args);
//    if(len > OS_ARRAY_SIZE(os_printf__buffer)){
//        char* buffer = (char*)OS_ALLOC(len + 1);
//        va_start(args, format);
//        len = vsnprintf(buffer, len + 1, format, args);
//        va_end(args);
//#if 0
//        for(int i=0; i<len; i++){
//            os_printf_putc(buffer[i], 0);
//        }
//#else
//        BSP_USART0_DMATx(buffer, len);
//#endif
//
//        OS_FREE(buffer);
//    }else{
//#if 0
//        for(int i=0; i<len; i++){
//            os_printf_putc(os_printf__buffer[i], 0);
//        }
//#else
//        BSP_USART0_DMATx(os_printf__buffer, len);
//#endif
//    }
//
//
//    return len;
//}