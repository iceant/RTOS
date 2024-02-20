#ifndef INCLUDED_DRV_I2C_H
#define INCLUDED_DRV_I2C_H

////////////////////////////////////////////////////////////////////////////////
////
#ifndef INCLUDED_DRV_GPIO_H
#include "drv_gpio.h"
#endif /*INCLUDED_DRV_GPIO_H*/


////////////////////////////////////////////////////////////////////////////////
////
typedef struct dev_i2c_s{
    void* I2Cx;
    drv_gpio_t SCL_Pin;
    drv_gpio_t SDL_Pin;
}dev_i2c_t;

////////////////////////////////////////////////////////////////////////////////
////

int dev_i2c_init_as_master(dev_i2c_t* i2c);

int dev_i2c_master_write(dev_i2c_t * i2C, void* i2c_slave_address, unsigned char * data, int data_size, unsigned long timeout_ms);

int dev_i2c_master_read(dev_i2c_t * i2C, void* i2c_slave_address, unsigned char * data, int data_size, unsigned long timeout_ms);





#endif /*INCLUDED_DRV_I2C_H*/
