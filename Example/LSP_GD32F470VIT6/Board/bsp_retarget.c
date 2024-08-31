#include <bsp_retarget.h>
#include <os_kernel.h>

////////////////////////////////////////////////////////////////////////////////
////
typedef struct __FILE FILE;

struct __FILE{
    int handle;
};

FILE __stdout;

#if (CPU_FEATURE_SPINLOCK_SUPPORT==1)
//static cpu_spinlock_t bsp_retarget__lock=0;
/* retarget the C library printf function to the USART */
int fputc(int ch, FILE *f)
{
//    cpu_spinlock_lock(&bsp_retarget__lock);
    usart_data_transmit(USART0, (uint8_t)ch);
    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
//    cpu_spinlock_unlock(&bsp_retarget__lock);
    return ch;
}

#else
/* retarget the C library printf function to the USART */
int fputc(int ch, FILE *f)
{
    usart_data_transmit(USART0, (uint8_t)ch);
    while(RESET == usart_flag_get(USART0, USART_FLAG_TBE));
    return ch;
}

#endif
