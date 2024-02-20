#include <drv_gpio.h>


void drv_gpio_high(drv_gpio_t * gpio)
{
    GPIO_SetBits(gpio->GPIOx, gpio->GPIO_Pin);
}

void drv_gpio_low(drv_gpio_t * gpio)
{
    GPIO_ResetBits(gpio->GPIOx, gpio->GPIO_Pin);
}

uint8_t drv_gpio_read_input(drv_gpio_t * gpio){
    return GPIO_ReadInputDataBit(gpio->GPIOx, gpio->GPIO_Pin);
}

uint8_t drv_gpio_read_output(drv_gpio_t * gpio){
    return GPIO_ReadOutputDataBit(gpio->GPIOx, gpio->GPIO_Pin);
}

