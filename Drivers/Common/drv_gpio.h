#ifndef INCLUDED_DRV_GPIO_H
#define INCLUDED_DRV_GPIO_H

typedef struct drv_gpio_s{
    void* GPIO_Group;
    int GPIO_Pin;
}drv_gpio_t;

#endif /*INCLUDED_DRV_GPIO_H*/
