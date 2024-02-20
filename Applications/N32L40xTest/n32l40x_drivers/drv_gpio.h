#ifndef INCLUDED_DRV_GPIO_H
#define INCLUDED_DRV_GPIO_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_N32L40X_H
#include <n32l40x.h>
#endif /*INCLUDED_N32L40X_H*/

////////////////////////////////////////////////////////////////////////////////
////
typedef struct drv_gpio_s{
    GPIO_Module * GPIOx;
    uint16_t GPIO_Pin;
}drv_gpio_t;

////////////////////////////////////////////////////////////////////////////////
////
void drv_gpio_high(drv_gpio_t * gpio);
void drv_gpio_low(drv_gpio_t * gpio);

uint8_t drv_gpio_read_input(drv_gpio_t * gpio);
uint8_t drv_gpio_read_output(drv_gpio_t * gpio);


#endif /*INCLUDED_DRV_GPIO_H*/
