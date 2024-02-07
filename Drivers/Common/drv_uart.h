#ifndef INCLUDED_DRV_UART_H
#define INCLUDED_DRV_UART_H

////////////////////////////////////////////////////////////////////////////////
////
typedef struct drv_uart_s{
    void* USARTx;
}drv_uart_t;

////////////////////////////////////////////////////////////////////////////////
////
void drv_uart_send(unsigned char* data, int data_size);

void drv_uart_send_string(const char* string);

#endif /*INCLUDED_DRV_UART_H*/
