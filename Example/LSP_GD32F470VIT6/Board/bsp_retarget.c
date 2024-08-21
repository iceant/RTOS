#include <bsp_retarget.h>
////////////////////////////////////////////////////////////////////////////////
////
typedef struct __FILE FILE;

struct __FILE{
    int handle;
};

FILE __stdout;

/* retarget the C library printf function to the USART */
int fputc(int ch, FILE *f)
{
    usart_data_transmit(USART0, (uint8_t)ch);
    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
    return ch;
}
